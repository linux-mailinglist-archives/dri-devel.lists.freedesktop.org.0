Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251576E6DAE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 22:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6610E1A2;
	Tue, 18 Apr 2023 20:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D3210E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 20:48:29 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a66888cb89so20644995ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681850909; x=1684442909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
 b=BPybYlYVir1kU0Ko/AfYMhuH73xGWBGaHaBWTzirTch1Yu1YBlAw8S+xalDUoCD6nc
 2XET1gEZwAi5YuseDUDd4xOb64+BiyRFOV2+WqZjlmCYdn9iOptn8fvjqM3ts/iTVN6X
 LbpQBhX8SSkBdPpphAzgs1TyENFzrqI28FkcOJlSwe03OeLtwclb194bRtDvifklIvB8
 d20Gl6TY+jQ1f4s53DlmFY9uXO845TXByaDN1Drt9cLAU5GXS3TL9WTtpmw7+/kwpwxz
 nDr3YTFFpEvSxiYtZsJF9cy7bq5liarV5FLbGJCrdBOaYDPhRldftRv2cwaJo03z8Lhg
 dw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681850909; x=1684442909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
 b=gXlJbHZWGwPsfyXQMEYawoofQhtrwhR8lDCGXx3xBwwCjgPfLdtOEPEDnqj6KfRWzq
 G5ZfPAMLMpr0GCa+odTYzdJbJjl+GlQnSJUFyQ38DDBAlxPTrAuRxPXbd/928FP3RH2P
 0J+HUn+5qFXe2yZ7a0rNXC0cYKrU2by6mZmBrNI9JGjCq47IOfICPLrT9FnQK9wRdLAE
 gjxO0FQf+WTeX6vEmARD8Y/VH4worgGHCmCAgLrx9z9wXem+nd+X8Dh5YNA1WblKv4+C
 VcVAPMKhz6vE5v9597DP2H7EU3LB4NSGl5jQR+NYT7+Hhdb4KpSJcLEKibUGjrNp0/np
 MRwg==
X-Gm-Message-State: AAQBX9d+avnUe7p8FmJXfuIHQ4Cguz+wLzXRkEQgvHX+kMZH7RQQUb4s
 RZrsg0v3gtpDypLxLqeQGZlQPSLrSXIIl0fJqYYYeg==
X-Google-Smtp-Source: AKy350YaI6gJH0+K/ZzQQNy+aKyoer6ZKZEPUfakQp1y1BPvig9WjvIP6y+WfAr9MA7i/gVZo/V8cT5cRZ/lD6GfB84=
X-Received: by 2002:a17:902:d511:b0:19e:ad18:da5c with SMTP id
 b17-20020a170902d51100b0019ead18da5cmr3934317plg.37.1681850909011; Tue, 18
 Apr 2023 13:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230418192046.3235870-1-trix@redhat.com>
 <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
In-Reply-To: <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 13:48:17 -0700
Message-ID: <CAKwvOdmFGVPddi98yt22i+U+3aow+dwhxKgdJ45h3n1i-n3bzw@mail.gmail.com>
Subject: Re: [PATCH] accel/qaic: initialize ret variable to 0
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: quic_pkanojiy@quicinc.com, Tom Rix <trix@redhat.com>, ogabbay@kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 1:46=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 4/18/2023 1:20 PM, Tom Rix wrote:
> > clang static analysis reports
> > drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
> >    value returned to caller [core.uninitialized.UndefReturn]
> >          return ret;
> >          ^~~~~~~~~~
> >
> > The ret variable is only set some of the time but is always returned.
> > So initialize ret to 0.
>
> This does not appear to be entirely accurate to me.
>
> Do you know what analysis Clang is doing?  Is it limited to the function
> itself?
>
> remap_pfn_range, which initializes ret, will always run at-least once.

What happens if the loop body is never executed, say if `bo->sgt->sgl` is N=
ULL?

>
> Feels more accurate to say that Clang cannot detect that ret will be
> initialized, and we want to quiet the warning from the false positive.
>
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_d=
ata.c
> > index c0a574cd1b35..b46a16fb3080 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_obje=
ct *obj, struct vm_area_struc
> >       struct qaic_bo *bo =3D to_qaic_bo(obj);
> >       unsigned long offset =3D 0;
> >       struct scatterlist *sg;
> > -     int ret;
> > +     int ret =3D 0;
> >
> >       if (obj->import_attach)
> >               return -EINVAL;
>


--=20
Thanks,
~Nick Desaulniers
