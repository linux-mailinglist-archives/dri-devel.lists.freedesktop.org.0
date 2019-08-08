Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED3859D3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 07:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12DB6E43B;
	Thu,  8 Aug 2019 05:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D846E43B;
 Thu,  8 Aug 2019 05:32:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v15so1065492wml.0;
 Wed, 07 Aug 2019 22:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnFHzRjF2xpQkvpgxIv833AGZ8y7ivoh6PhkIV/Ft14=;
 b=kn/uWSffv8AiGTc4OT6qb1YvN2hr4WM5Q8pz4uiG7KSk6tsev/hVQOaFH4KfgvpKL+
 at2oOivmPeAn5NSe4GlP5Sp47a3v6fzbXux6VrqOVbU6D+h+nDyJ1md7vsIHrQYgd1zK
 kKBldDYhTAMHo3+O/dIlLJsAbnefFs2HxWHA0TRTMtAP6n0pwahmWpIUP+WMl9jq86nv
 kY7ZgdwZCPCq5Zf3nyJnOQfE7pP6G98dAC4IdXWDnrjnOEn3yHYbIJcle7mgTytrzXl4
 8a7ssNFs9njgPHTntd39jzf3d3XeQB/neLjNMifW57C9idkyN9J6n5MPGrb3J4cS/lDg
 mw4Q==
X-Gm-Message-State: APjAAAWVh8+2uJXs+gUnZkpTkLNuLL0NotlQt9xZE942jqJqxtWD9ppx
 XxEQaKkXgTsqbr9caWN4JP/FnVG5goMVCACmLjI=
X-Google-Smtp-Source: APXvYqzW+HFnOuJ9Z79OuqJC6DbO9RKLaFVy/c8lavnL0WaspOeHTZHPqSe3R46tKRBIfsisfMpapeNQUHITCyKt2KM=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr2011547wmk.127.1565242322005; 
 Wed, 07 Aug 2019 22:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190806014830.7424-1-hdanton@sina.com>
 <CABXGCsMRGRpd9AoJdvZqdpqCP3QzVGzfDPiX=PzVys6QFBLAvA@mail.gmail.com>
In-Reply-To: <CABXGCsMRGRpd9AoJdvZqdpqCP3QzVGzfDPiX=PzVys6QFBLAvA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2019 01:31:50 -0400
Message-ID: <CADnq5_O08v3_NUZ_zUZJFYwv_tUY7TFFz2GGudqgWEX6nh5LFA@mail.gmail.com>
Subject: Re: The issue with page allocation 5.3 rc1-rc2 (seems drm culprit
 here)
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000097c52f058f94601e"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VnFHzRjF2xpQkvpgxIv833AGZ8y7ivoh6PhkIV/Ft14=;
 b=bd/6MShzzpiecQAhFBAuSWXr5ibrQqhz9pYZ4qECaGNwmne2qCZAuyO20gkWEm7Alt
 9R2w4z9i3gomswnz8J3IcEq4kvirvItHH6XoRzIayj07nB1imdDu236PAuvOq43GY3J6
 jpYQs11Tn6g4wVWexHUCg7mZx+8eDqlTJZx5CU+DMqN7Imsf4d5LjGXcNvco/H2p/EW4
 6mbZCbXj6mmGIy5LwnHlxNCQmv2qVfLJQv8MY7z9e40453R5C0lqqnUK+KhJPPni4q9j
 cTFnBTQs9zY+GTiDq8qFKYo8rMVaG2lWHSCyQEufd+AiKI1TEDwEVoETgJuob4BMl5k+
 D2YQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Hillf Danton <hdanton@sina.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000097c52f058f94601e
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 11:49 PM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Tue, 6 Aug 2019 at 06:48, Hillf Danton <hdanton@sina.com> wrote:
> >
> > My bad, respin with one header file added.
> >
> > Hillf
> > -----8<---
> >
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -23,6 +23,7 @@
> >   */
> >
> >  #include <linux/slab.h>
> > +#include <linux/mm.h>
> >
> >  #include "dm_services.h"
> >
> > @@ -1174,8 +1175,12 @@ struct dc_state *dc_create_state(struct
> >         struct dc_state *context = kzalloc(sizeof(struct dc_state),
> >                                            GFP_KERNEL);
> >
> > -       if (!context)
> > -               return NULL;
> > +       if (!context) {
> > +               context = kvzalloc(sizeof(struct dc_state),
> > +                                          GFP_KERNEL);
> > +               if (!context)
> > +                       return NULL;
> > +       }
> >         /* Each context must have their own instance of VBA and in order to
> >          * initialize and obtain IP and SOC the base DML instance from DC is
> >          * initially copied into every context
> > @@ -1195,8 +1200,13 @@ struct dc_state *dc_copy_state(struct dc
> >         struct dc_state *new_ctx = kmemdup(src_ctx,
> >                         sizeof(struct dc_state), GFP_KERNEL);
> >
> > -       if (!new_ctx)
> > -               return NULL;
> > +       if (!new_ctx) {
> > +               new_ctx = kvmalloc(sizeof(*new_ctx), GFP_KERNEL);
> > +               if (new_ctx)
> > +                       *new_ctx = *src_ctx;
> > +               else
> > +                       return NULL;
> > +       }
> >
> >         for (i = 0; i < MAX_PIPES; i++) {
> >                         struct pipe_ctx *cur_pipe = &new_ctx->res_ctx.pipe_ctx[i];
> > @@ -1230,7 +1240,7 @@ static void dc_state_free(struct kref *k
> >  {
> >         struct dc_state *context = container_of(kref, struct dc_state, refcount);
> >         dc_resource_state_destruct(context);
> > -       kfree(context);
> > +       kvfree(context);
> >  }
> >
> >  void dc_release_state(struct dc_state *context)
> > --
> >
>
> Unfortunately error "gnome-shell: page allocation failure: order:4,
> mode:0x40cc0(GFP_KERNEL|__GFP_COMP),
> nodemask=(null),cpuset=/,mems_allowed=0" still happens even with
> applying this patch.

I think we can just drop the kmalloc altogether.  How about this patch?

Alex

>
> Thanks.
>
>
> --
> Best Regards,
> Mike Gavrilov.
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--00000000000097c52f058f94601e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amd-display-use-kvmalloc-for-dc_state.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amd-display-use-kvmalloc-for-dc_state.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz28unhl0>
X-Attachment-Id: f_jz28unhl0

RnJvbSBjM2JhNmYwNWNhM2UwMzcxMjU0ZmJmYjFhOGMwNjI3NGUzY2RiOTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgOCBBdWcgMjAxOSAwMDoyOToyMyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWQvZGlzcGxheTogdXNlIGt2bWFsbG9jIGZvciBkY19zdGF0ZQoKSXQncyBsYXJnZSBh
bmQgZG9lc24ndCBuZWVkIGNvbnRpZ3VvdXMgbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYwppbmRleCAyNTJiNjIxZDkzYTkuLmVmNzgwYTRlNDg0YSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0yMyw2ICsyMyw3IEBACiAgKi8K
IAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxsaW51eC9tbS5oPgogCiAjaW5j
bHVkZSAiZG1fc2VydmljZXMuaCIKIApAQCAtMTE4Myw4ICsxMTg0LDggQEAgYm9vbCBkY19wb3N0
X3VwZGF0ZV9zdXJmYWNlc190b19zdHJlYW0oc3RydWN0IGRjICpkYykKIAogc3RydWN0IGRjX3N0
YXRlICpkY19jcmVhdGVfc3RhdGUoc3RydWN0IGRjICpkYykKIHsKLQlzdHJ1Y3QgZGNfc3RhdGUg
KmNvbnRleHQgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLAotCQkJCQkgICBHRlBf
S0VSTkVMKTsKKwlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQgPSBrdnphbGxvYyhzaXplb2Yoc3Ry
dWN0IGRjX3N0YXRlKSwKKwkJCQkJICAgIEdGUF9LRVJORUwpOwogCiAJaWYgKCFjb250ZXh0KQog
CQlyZXR1cm4gTlVMTDsKQEAgLTEyMDQsMTEgKzEyMDUsMTEgQEAgc3RydWN0IGRjX3N0YXRlICpk
Y19jcmVhdGVfc3RhdGUoc3RydWN0IGRjICpkYykKIHN0cnVjdCBkY19zdGF0ZSAqZGNfY29weV9z
dGF0ZShzdHJ1Y3QgZGNfc3RhdGUgKnNyY19jdHgpCiB7CiAJaW50IGksIGo7Ci0Jc3RydWN0IGRj
X3N0YXRlICpuZXdfY3R4ID0ga21lbWR1cChzcmNfY3R4LAotCQkJc2l6ZW9mKHN0cnVjdCBkY19z
dGF0ZSksIEdGUF9LRVJORUwpOworCXN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0eCA9IGt2bWFsbG9j
KHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLCBHRlBfS0VSTkVMKTsKIAogCWlmICghbmV3X2N0eCkK
IAkJcmV0dXJuIE5VTEw7CisJbWVtY3B5KG5ld19jdHgsIHNyY19jdHgsIHNpemVvZihzdHJ1Y3Qg
ZGNfc3RhdGUpKTsKIAogCWZvciAoaSA9IDA7IGkgPCBNQVhfUElQRVM7IGkrKykgewogCQkJc3Ry
dWN0IHBpcGVfY3R4ICpjdXJfcGlwZSA9ICZuZXdfY3R4LT5yZXNfY3R4LnBpcGVfY3R4W2ldOwot
LSAKMi4yMC4xCgo=
--00000000000097c52f058f94601e
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--00000000000097c52f058f94601e--
