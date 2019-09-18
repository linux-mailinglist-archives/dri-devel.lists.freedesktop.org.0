Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B5B6EA7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 23:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BD8737B7;
	Wed, 18 Sep 2019 21:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E27737AC;
 Wed, 18 Sep 2019 21:14:21 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so2558909iod.9;
 Wed, 18 Sep 2019 14:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6bHzPFkF1Cc2cdBwe1HZFDP7kYAvXE6XXDGZDJCZ5k=;
 b=tYtBO0Dyi4wpQCLyQ1+MjleezVsin7CFDmYmnqNgVtMV8HRkfVIRvp1S/qPuwtbaV6
 qAYdXU+96qfD1FkGfet9QH3TCvm8EoJN0SLpxGFsGqAp8h/CQgIviHJRcKx1/hnwuxQV
 vwkNcJ5iL6oIMrVCgZH2ugg4KfBQn39wuQRiGRC/+x+ibG4PYy9wvd2DODMMOrCciDNK
 HgCWa8E/Auc8YtM4EQeNvl0lIhULGS5Z5xNSu0hjGID8ByzPLHp8VUWfd2s2vNqp5nOp
 sUb9rXUeQF540xklMjVXXnfz6XuUBZj+yp0RUJALh/sWfniH5bj2aHDXO7oqqifLa+j5
 Ui7Q==
X-Gm-Message-State: APjAAAUGt1c6OFzNPZNRp0ZcfbSE/+2NiSGuUyTCEdCohDyHaBYMlyqK
 l7FiJ3F14HRbk2bGHHQFPxQ8RPEdtJMbXM5+Im1BCw==
X-Google-Smtp-Source: APXvYqz9GVoSL87eQiMRFEo75eSQRaKc0khTwjCy03VYtL7puy5h13URGS1XgzVHT0bGMXjFX74N4A35V6tDKKSDi5Y=
X-Received: by 2002:a02:245:: with SMTP id 66mr7101933jau.30.1568841261096;
 Wed, 18 Sep 2019 14:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
 <b61ec704-894d-092a-253c-961ff2ea01a2@gmail.com>
 <4d255e1c-1d4a-a754-afe0-b18776a11a7e@daenzer.net>
 <CAAxE2A7RcsiEsWBtbsDE2Wp+Vx7n-vwM1qL6HX_qKt=KnHCd4g@mail.gmail.com>
 <8c49e2e3-1fa1-35db-7d25-574b4b64cca0@daenzer.net>
 <CAAxE2A5niHWs=VQZO8B6d4tBx6NmYSKb7U=9injNL9087Yi_Kg@mail.gmail.com>
In-Reply-To: <CAAxE2A5niHWs=VQZO8B6d4tBx6NmYSKb7U=9injNL9087Yi_Kg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 18 Sep 2019 17:13:44 -0400
Message-ID: <CAAxE2A5Bbs6-+CiA115TyDg=jVoKOHf_7oxZqP2K8GvdBm7d0g@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=E6bHzPFkF1Cc2cdBwe1HZFDP7kYAvXE6XXDGZDJCZ5k=;
 b=URuMYhFFcjCUakKdI/u6yvBhq54YBwqcSro1pA/U1z5VSUKo2gzJsEfmnOz+TK7Yc7
 6bDhflL0kxQvT2BFdn6fgW42itfBk4oEjWMRYClgT91Xcc1W51zSNmpq951F3KJTt9YP
 3nGwCw9ymIvprAInTKTAneycL+unkqITqVurWTRF5vpwyrNDV+Y7MZ8YmLasPbcOz9LU
 NeN+6DmQMBi/nfDc/YeaOJak2sv8ie4mVdLzqei9Z7heEsySzx+9bx9Afpk8h+vR2y7O
 bpy6k7xig11yLxIBJR2b6i6orPFkxZzbBz65dywzG8xPipEdKFxk27gMNw5rMqLxTzDK
 glbQ==
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1393496153=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1393496153==
Content-Type: multipart/alternative; boundary="00000000000013a4570592da52cd"

--00000000000013a4570592da52cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Let's drop this patch. Mesa will use family_id.

Marek

On Wed, Sep 18, 2019 at 4:10 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:

> On Wed, Sep 18, 2019 at 10:03 AM Michel D=C3=A4nzer <michel@daenzer.net> =
wrote:
>
>> On 2019-09-18 1:41 a.m., Marek Ol=C5=A1=C3=A1k wrote:
>> > drmVersion::name =3D amdgpu, radeon, intel, etc.
>> > drmVersion::desc =3D vega10, vega12, vega20, ...
>> >
>> > The common Mesa code will use name and desc to select the driver.
>>
>> Like the Xorg modesetting driver, that code doesn't need this kernel
>> functionality or new PCI IDs. It can just select the current driver for
>> all devices which aren't supported by older drivers (which is a fixed
>> set at this point).
>>
>>
>> > The AMD-specific Mesa code will use desc to identify the chip.
>>
>> Doesn't libdrm_amdgpu's struct amdgpu_gpu_info::family_id provide the
>> same information?
>>
>
> Not for the common code, though I guess common Mesa code could use the
> INFO ioctl. Is that what you mean?
>
> Marek
>

--00000000000013a4570592da52cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Let&#39;s drop this patch. Mesa will use family_id.<b=
r></div><div><br></div><div>Marek<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 4:10 PM Marek =
Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Sep 18, 2019 at 10:03 AM Michel D=C3=A4nzer &lt;<a href=3D"mail=
to:michel@daenzer.net" target=3D"_blank">michel@daenzer.net</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2019-09-18 1:=
41 a.m., Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; drmVersion::name =3D amdgpu, radeon, intel, etc.<br>
&gt; drmVersion::desc =3D vega10, vega12, vega20, ...<br>
&gt; <br>
&gt; The common Mesa code will use name and desc to select the driver.<br>
<br>
Like the Xorg modesetting driver, that code doesn&#39;t need this kernel<br=
>
functionality or new PCI IDs. It can just select the current driver for<br>
all devices which aren&#39;t supported by older drivers (which is a fixed<b=
r>
set at this point).<br>
<br>
<br>
&gt; The AMD-specific Mesa code will use desc to identify the chip.<br>
<br>
Doesn&#39;t libdrm_amdgpu&#39;s struct amdgpu_gpu_info::family_id provide t=
he<br>
same information?<br></blockquote><div><br></div><div>Not for the common co=
de, though I guess common Mesa code could use the INFO ioctl. Is that what =
you mean?<br></div><div><br></div><div>Marek</div></div></div>
</blockquote></div></div>

--00000000000013a4570592da52cd--

--===============1393496153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1393496153==--
