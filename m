Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3685BBF14
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 19:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C9F10E5C6;
	Sun, 18 Sep 2022 17:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FE010E5C5;
 Sun, 18 Sep 2022 17:18:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lc7so59648529ejb.0;
 Sun, 18 Sep 2022 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=g4F1o3OxSkwyGTECuVsvCx/NyKOfCc+oSSw810FYyjo=;
 b=QRI+Gv16BKwthqTnKwPsBDdooKTjM+DS7nip1lJfY2cXjnp9bXM7B5srbbWQfzwvZq
 6b1hFUUW2uA2q7mXcES+P3JE+k3JfuUqCcJRGBX+G3zNRSGmbwor7FWwVqwXsO8fCOW3
 CMClGqb+UufxwVMtPsNAMA6LAST4e4eAXpGMWMmVbg6/aoRbs4MdD4niSj91wYjGx65R
 NvioDgl8yvTaTtRrImg3+XY3r2Znk8hn9RBeSy4RCCfz40n8EuAguPScGLGLdT23kZtT
 f70JjP9kpn27sTJAwxM5Ua9R9sprHO8iWhmq+2KpidhCdijl1q92a66hURyO9Vq+5puo
 RJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g4F1o3OxSkwyGTECuVsvCx/NyKOfCc+oSSw810FYyjo=;
 b=pEmTkVOnq8h/Me4L/1gyqLqvDeWEeVz7gRlQKg97uHrZc+ldrwRUBmZKr5ZjHoo3Vg
 DcasgtafFVmOdh9tR3/gAIjMKkqRxkRda6ON05eROet9gSmMmFuQMje6U4/by5VXApFK
 0DuJQIBTKANR3hCJ0VsttIIPxd1+bM1GcuVPe5hdAoLUVi3irw7k+MvHPUJyxtItBxUV
 mmnjCnbO5N/XyzNM2ZfMpRW0DHEpuq/OhSpx+mD6pya+orKdq047zDe7xf/hrgIsC8DH
 i+GDbZ2sOG8nprPEkHl/fAN1ffAygX3e507QTST4rnzghf1gSHDD4T/iTBJHDRYuoJws
 Wrqw==
X-Gm-Message-State: ACrzQf3sAoKVE66e65ULPtxUXi3QkeOqimUrY8zr7UXVj7ap5ddYaTOj
 0YM1AUZlvZxf47jRSLAz+YLAlVI5FHAkZ8Zstko=
X-Google-Smtp-Source: AMsMyM475ieyAlM9tDvO7b8MM84jCL/RawZkh8FJpEdvGHaOF7Cv/ooAmlyexeixIRJWEQmCGIcJ4jH/Wuv3bq0DKao=
X-Received: by 2002:a17:907:3f09:b0:780:330d:d907 with SMTP id
 hq9-20020a1709073f0900b00780330dd907mr10763664ejc.23.1663521492233; Sun, 18
 Sep 2022 10:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
 <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
 <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
 <YyQzDlM5n7mOLh5Q@kroah.com>
 <CAJedcCzt_1ZRV5egMLdoFVZ4hBDE+nDu9fLkBuGY0A=uYicvQA@mail.gmail.com>
 <YyWOh+jGvmSdrHqz@kroah.com>
In-Reply-To: <YyWOh+jGvmSdrHqz@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 19 Sep 2022 01:17:59 +0800
Message-ID: <CAJedcCwzgELQquRLc2deXt+E4X2D2-NMLERpE1z3sy21bTdddw@mail.gmail.com>
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

I'll try using another mail client like Mutt later. :)

Regards,
Zheng Wang

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2022=E5=B9=B49=E6=9C=8817=E6=
=97=A5=E5=91=A8=E5=85=AD 17:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Sep 16, 2022 at 11:54:42PM +0800, Zheng Hacker wrote:
> > >From afe79848cb74cc8e45ab426d13fa2394c87e0422 Mon Sep 17 00:00:00 2001
> > From: xmzyshypnc <1002992920@qq.com>
> > Date: Fri, 16 Sep 2022 23:48:23 +0800
> > Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_ent=
ry
> >
> > There is a double-free security bug in split_2MB_gtt_entry.
> >
> > Here is a calling chain :
> > ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
> >
> > If intel_gvt_dma_map_guest_page failed, it will call
> > ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> > kfree(spt). But the caller does not notice that, and it will call
> > ppgtt_free_spt again in error path.
> >
> > Fix this by only freeing spt in ppgtt_invalidate_spt in good case.
> >
> > Signed-off-by: Zheng Wang <hackerzheng666@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/=
gtt.c
> > index ce0eb03709c3..550519f0acca 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct
> > intel_vgpu_ppgtt_spt *spt)
> >     return atomic_dec_return(&spt->refcount);
> >  }
> >
> > -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> > +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int
> > is_error);
> >
> >  static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgp=
u,
> >         struct intel_gvt_gtt_entry *e)
> > @@ -995,7 +995,7 @@ static int
> > ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
>
> Still line-wrapped and whitespace broken :(
>
