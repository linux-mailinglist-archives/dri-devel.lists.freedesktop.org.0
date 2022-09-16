Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C237F5BA6ED
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 08:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF90B10ECC2;
	Fri, 16 Sep 2022 06:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000BB10ECC2;
 Fri, 16 Sep 2022 06:39:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r18so47205078eja.11;
 Thu, 15 Sep 2022 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=vvA/mvvSLM9uLQG38TGu9Y+RlTnepBsr7g4wPM9aIIg=;
 b=DgDKo6ADvXbPoPcmmuk1X2YQw1DXiBMf8Wx6bOA2cU2eRNOQ0u0EaL1/DyZ8BV67Ne
 7EyAkjE2z9ASNk/HI9NC+4QGPTA0uZGcqxRLR47Xi6D2gfNn+rDgKAX3JBhgUECuG6NC
 M2h4GfReBpb+z+8CpedpYrrb4RrkIMF/zokBZqBWxsaJOcQE9Wj1MW8Ep7uvLNkNrjRr
 LiMXceubitfvKGEcSqwNWzhg5ZY6x+4KJTflmP98wCKJhsJ4hSoKJXn/MwV8hLbgCtV2
 TuuAo9TXwA15ivLXkcbeY3s7opDXWOLMxSQnZGsVPADIIFfq6AVkfYXScjabJcs18OV7
 v7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vvA/mvvSLM9uLQG38TGu9Y+RlTnepBsr7g4wPM9aIIg=;
 b=sH0iiANQ9JUvQ2YwT5cmWZzSoX3GESe+eFaNZ2AS7JmNJHiqXBvbW2k3AWxlKMhOwR
 Jnq/sO4fkboWQgv+aAviYlnPdz2P+pIympxwXiSNXEWYhBzBEHSR6lkxRu0UsLrjZgMr
 Vpw/CtJMBrYcDZQd1xy/3l63C00b55ajUC39nqMY8Mj1sToJ9zg56/dN5XoLQ9/xprya
 lbJ5AlQjv6wuPWsTbao2qyY8lZP+MgxKwMHXK+1hITkrAZU2P2j0i/kLw0yV1Bu8eLQX
 Hx78rM+j68Ajrd310cNZLBL2TXGIdcVCrZH/D40oEO0hmr4hGN8JyyYI8wTaSmTe3ntu
 vx1w==
X-Gm-Message-State: ACrzQf0HmUFIlVsvr49nKnwPUPdDyRVe3qOMlzMejG9Jew6/y1k9twVk
 6UUUnVL39nUgplYAg/EL3khjZsTcJcIW+tilmlw=
X-Google-Smtp-Source: AMsMyM5N+6CjojnRxi41Vb0thsccYyyy86S95n9bkg3sqD6CX1INX3Rhkhf3WeV2G4qTgk896k3SrhrL3y8zAMOc3JM=
X-Received: by 2002:a17:907:970a:b0:77d:a10c:e089 with SMTP id
 jg10-20020a170907970a00b0077da10ce089mr2526092ejc.364.1663310373366; Thu, 15
 Sep 2022 23:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
 <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
In-Reply-To: <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Fri, 16 Sep 2022 14:39:21 +0800
Message-ID: <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 xmzyshypnc <1002992920@qq.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 8d95c1399e3ff345500a575e21254a73b0c89144 Mon Sep 17 00:00:00 2001
From: xmzyshypnc <1002992920@qq.com>
Date: Fri, 16 Sep 2022 14:37:48 +0800
Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry

There is a double-free security bug in split_2MB_gtt_entry.

Here is a calling chain :
ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
kfree(spt). But the caller does not notice that, and it will call
ppgtt_free_spt again in error path.

Fix this by only freeing spt in ppgtt_invalidate_spt in good case.

Signed-off-by: xmzyshypnc <1002992920@qq.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.=
c
index 9f14fded8c0c..31d2a8d56384 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct
intel_vgpu_ppgtt_spt *spt)
  return atomic_dec_return(&spt->refcount);
 }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *sptm,
int is_error);

 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
  struct intel_gvt_gtt_entry *e)
@@ -995,7 +995,7 @@ static int
ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
  ops->get_pfn(e));
  return -ENXIO;
  }
- return ppgtt_invalidate_spt(s);
+ return ppgtt_invalidate_spt(s, 0);
 }

 static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct
intel_vgpu_ppgtt_spt *spt,
  intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int is_e=
rror)
 {
  struct intel_vgpu *vgpu =3D spt->vgpu;
  struct intel_gvt_gtt_entry e;
@@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct
intel_vgpu_ppgtt_spt *spt)
  }
  }

- trace_spt_change(spt->vgpu->id, "release", spt,
+ if (!is_error) {
+ trace_spt_change(spt->vgpu->id, "release", spt,
  spt->guest_page.gfn, spt->shadow_page.type);
- ppgtt_free_spt(spt);
+ ppgtt_free_spt(spt);
+ }
  return 0;
 fail:
  gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
@@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgp=
u,
  ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
     PAGE_SIZE, &dma_addr);
  if (ret) {
- ret =3D ppgtt_invalidate_spt(spt);
+ ret =3D ppgtt_invalidate_spt(spt, 1);
  return ret;
  }
  sub_se.val64 =3D se->val64;
@@ -1393,7 +1395,7 @@ static int
ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
  ret =3D -ENXIO;
  goto fail;
  }
- ret =3D ppgtt_invalidate_spt(s);
+ ret =3D ppgtt_invalidate_spt(s, 0);
  if (ret)
  goto fail;
  } else {
--=20
2.25.1

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=888=
=E6=97=A5=E5=91=A8=E5=9B=9B 19:59=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Greg,
>
> I got it, Greg.
>
> Mid-Autumn Festival is coming and I will have a couple of days off.
> I'll see what I can do after holiday :)
>
> Regards,
>
> Zheng Wang
>
> =E5=9C=A8 2022=E5=B9=B49=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=
=BC=8CGreg KH <gregkh@linuxfoundation.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Thu, Sep 08, 2022 at 05:09:40PM +0800, Zheng Hacker wrote:
>> > Hi Zhenyu,
>> >
>> > This issue has been open for a few days. Could you plz write a patch
>> > for that :) I'm not familiar with the logical code here.
>>
>> As this is only able to be hit in a theoretical system, it isn't that
>> high of a priority, if any priority at all.  Why not try to write a
>> patch for it yourself to help resolve the issue faster?
>>
>> thanks,
>>
>> greg k-h
