Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821BF5BB773
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 11:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC9E10E105;
	Sat, 17 Sep 2022 09:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1210E091;
 Sat, 17 Sep 2022 09:10:51 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y3so54340910ejc.1;
 Sat, 17 Sep 2022 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date;
 bh=6BmZWNHNRAFA4nZ1cTU+8HeQ7szXmk4GSNQVBlr0NCA=;
 b=OP81KsMeT4qChPXn0xXQM6JGhpK21K4hSJNqwE64ayfHum0H7+2/zWCqlczsa5xiNz
 Ui+GsmnioW1QkXvnZIDZKLG+aAoj25zhFk93QWMizWaQG5yrWG4v1P7ywNx+pQBl/2pd
 pl5ZgIw8K2L7IhuQIM4O7RtSJHxp5UGp5+AnYL845vsE71n2e9egpQt27dRiUMxxTlIw
 jDdklfujKtaKWOAwvO54CVkqijdjP0wSaTw15zuuduaKvnKCLM1v1gQ/WQxt0F1+JBiA
 RNTWtqyz56CkcvaXH+GdfmSYkHNe6ercWvIVlXxBkvYDWkiR8L8rBw3DGWZfrVBKl7RH
 UZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6BmZWNHNRAFA4nZ1cTU+8HeQ7szXmk4GSNQVBlr0NCA=;
 b=GRs90H6565anwNgZfCA3CdlzFpkoUCjAbO4LbIHCvwWSFU9x9XFk1tHs9d/PvBqv1w
 0IcFvyB766KfAWJiL5DnKohg5q+zALgn4yJlOMR0G6O69sOE3ylsbjcrGGzwmO7gxBce
 o1LetLRtNshmo4YTLXoRzb4YDCkIJBCtYLmnLqLByFo+kYEjfXRgXbwLzGO6fnOrCKZI
 F0y/1NrI/R+/mbTxwHSc/oEDeb6WuAXKwA8Zu92w0WNAeXa59Gof35AmPdkAG14F0fOG
 +z2fxn1+OwJrB4ezZy2gJUyfixUkvc+r8K0oJQK1d8IAH+2I8TLXnz+ZrF3frMUNNMpA
 quEQ==
X-Gm-Message-State: ACrzQf0XUqNs4EBXTWBeybfSNok6ljUgf3y0KmkHWnJRsyu1KH5wAil9
 NMna/RJgNr1UWMJIz+I4776BzbfNSjRY3nhXVyw=
X-Google-Smtp-Source: AMsMyM5Wsz8Z3ineZGIH9XLZNikq2KBaDk+d1T0S8UKeytPSk45qo7NxR+4zLGy22HJ+uc5/Q7arS0XlqgP8iJWXu+s=
X-Received: by 2002:a17:907:16a6:b0:780:4a3c:d179 with SMTP id
 hc38-20020a17090716a600b007804a3cd179mr6305850ejc.289.1663405849634; Sat, 17
 Sep 2022 02:10:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:5598:0:0:0:0 with HTTP; Sat, 17 Sep 2022 02:10:48
 -0700 (PDT)
In-Reply-To: <YyWOh+jGvmSdrHqz@kroah.com>
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
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Sat, 17 Sep 2022 17:10:48 +0800
Message-ID: <CAJedcCyx+qYpPd-_vqg0vQO9nQVrwBXARv3Lzi+FJ4HrBN0AGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c8ec4105e8dbdacc"
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

--000000000000c8ec4105e8dbdacc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Sorry for that. I=E2=80=99ll write another one.

Regards,
Zheng Wang

=E5=9C=A8 2022=E5=B9=B49=E6=9C=8817=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD=EF=
=BC=8CGreg KH <gregkh@linuxfoundation.org> =E5=86=99=E9=81=93=EF=BC=9A

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
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/
> gtt.c
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
> >  static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu
> *vgpu,
> >         struct intel_gvt_gtt_entry *e)
> > @@ -995,7 +995,7 @@ static int
> > ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
>
> Still line-wrapped and whitespace broken :(
>
>

--000000000000c8ec4105e8dbdacc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,<div><br></div><div>Sorry for that. I=E2=80=99ll write another one.=
</div><div><br></div><div>Regards,</div><div>Zheng Wang<br><br>=E5=9C=A8 20=
22=E5=B9=B49=E6=9C=8817=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD=EF=BC=8CGreg KH=
 &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.o=
rg</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Fri, Sep 16, 2022 at 11:54:42PM +0800, Zheng Hacker wrote:<br>
&gt; &gt;From afe79848cb74cc8e45ab426d13fa23<wbr>94c87e0422 Mon Sep 17 00:0=
0:00 2001<br>
&gt; From: xmzyshypnc &lt;<a href=3D"mailto:1002992920@qq.com">1002992920@q=
q.com</a>&gt;<br>
&gt; Date: Fri, 16 Sep 2022 23:48:23 +0800<br>
&gt; Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_en=
try<br>
&gt; <br>
&gt; There is a double-free security bug in split_2MB_gtt_entry.<br>
&gt; <br>
&gt; Here is a calling chain :<br>
&gt; ppgtt_populate_spt-&gt;ppgtt_<wbr>populate_shadow_entry-&gt;split_<wbr=
>2MB_gtt_entry.<br>
&gt; <br>
&gt; If intel_gvt_dma_map_guest_page failed, it will call<br>
&gt; ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and<br>
&gt; kfree(spt). But the caller does not notice that, and it will call<br>
&gt; ppgtt_free_spt again in error path.<br>
&gt; <br>
&gt; Fix this by only freeing spt in ppgtt_invalidate_spt in good case.<br>
&gt; <br>
&gt; Signed-off-by: Zheng Wang &lt;<a href=3D"mailto:hackerzheng666@gmail.c=
om">hackerzheng666@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/<wbr>gtt.c b/drivers/gpu/drm/i91=
5/gvt/<wbr>gtt.c<br>
&gt; index ce0eb03709c3..550519f0acca 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/<wbr>gtt.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/<wbr>gtt.c<br>
&gt; @@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct<br>
&gt; intel_vgpu_ppgtt_spt *spt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return atomic_dec_return(&amp;spt-&gt;<wbr>refcount=
);<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);<br=
>
&gt; +static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int=
<br>
&gt; is_error);<br>
&gt; <br>
&gt;=C2=A0 static int ppgtt_invalidate_spt_by_<wbr>shadow_entry(struct inte=
l_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct intel_gvt_gtt_entry *e)<br>
&gt; @@ -995,7 +995,7 @@ static int<br>
&gt; ppgtt_invalidate_spt_by_<wbr>shadow_entry(struct intel_vgpu *vgpu,<br>
<br>
Still line-wrapped and whitespace broken :(<br>
<br>
</blockquote></div>

--000000000000c8ec4105e8dbdacc--
