Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB01DBD02
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 20:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2846E881;
	Wed, 20 May 2020 18:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57A56E881;
 Wed, 20 May 2020 18:39:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k13so4231808wrx.3;
 Wed, 20 May 2020 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZwIuzGd2VX1FSb5QhuGSYUs3g1lNhtaIqItKH1fDEjI=;
 b=mGZn3LCwrh1er7h+5mKGAGnnUY2Ks67cnyDOnBxr6ppvmQaNF1P4xZD9PG77BNsHmu
 S5/qN42Uc+eswztsLOtgjGyQQYst2CUxZrUCtpWPxOMizZJKCYiPAfbj91UdefSTXdX8
 t/iETTcwZJx7h/ZNkrfZ7Q9udJvEv2w1wni0GhEvDnVTexG7fBXG2KZpoz2eVZ9nMB5P
 gkFdi1QuziNNU3q6MbXQcSiGtmT86Rd3RclN9fba4MXBjWX0KWPBUcxVtoB5rax9Dz6+
 5/Pawel55bQUCYz8RQkmqxbeM4XjJhRAd6qP17sLiHymK93zWK/q10L2I0ckj93RC4oY
 JSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZwIuzGd2VX1FSb5QhuGSYUs3g1lNhtaIqItKH1fDEjI=;
 b=BXtuh8+lGEL/tno58PawNw6QIMBRDVCYC6+PLwgSfeCz5ASoiqBHrQJog6ECLIkwNG
 CS/k1NgqBx0vYYdIXlltAx+AmoeyrDN+8SzHTXOpFyL2cmM3tZ8AAu2u2KZ9KMdqYTsj
 kGPHiCWo42II3PtydQe+7W28Fd8HydqyHx/xcbujd2RKNqmNq+RuPgy49abUb/vUAXFw
 uwFlqdMMSUp3X1fidwZBvNSyooFXusZrK70zxlUR3/9eKoGWRtCxuoy+vtyR1GsqDSL7
 8Iq3cDyF7Qenn3hREP7ALIyGLssDYLVleZFLKKFGl5iQbWaCHVehI6wca2GH4ZpO2RHk
 oeWA==
X-Gm-Message-State: AOAM532AMOuugyIAyBST2bFl7Wd2y+Lk9R2/OpYwt+wnmvbKowCIB6Gv
 gH4uiFAyTcbQAl5gixNcvRce4XVSeub01gNMdQ0=
X-Google-Smtp-Source: ABdhPJz0f3WzpHZv2xwvWJxbBl9OkgDh76FfraQ17OtQuyrtc4H+ZBzelteOn/XG3GWz2fma8XDzx+fOhclYlv51KeM=
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr5639767wrx.124.1589999956571; 
 Wed, 20 May 2020 11:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
 <20200520152556.GQ3041@kadam>
 <14063C7AD467DE4B82DEDB5C278E8663010E230378@FMSMSX108.amr.corp.intel.com>
 <d8b26176-b3f7-500a-50f8-9282f615ec74@amd.com>
In-Reply-To: <d8b26176-b3f7-500a-50f8-9282f615ec74@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 May 2020 14:39:04 -0400
Message-ID: <CADnq5_PqSNzKOg_VVmZ_b9z6dqJiLGv-TNyv4Jpez=cUGKq+6g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: off by one in
 amdgpu_device_attr_create_groups() error handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Rui Huang <ray.huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Yintian Tao <yttao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1130259701=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1130259701==
Content-Type: multipart/alternative; boundary="0000000000009ab89e05a618b642"

--0000000000009ab89e05a618b642
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Wed, May 20, 2020 at 11:33 AM Christian K=C3=B6nig <christian.koenig@amd=
.com>
wrote:

> Am 20.05.20 um 17:31 schrieb Ruhl, Michael J:
> >> -----Original Message-----
> >> From: Dan Carpenter <dan.carpenter@oracle.com>
> >> Sent: Wednesday, May 20, 2020 11:26 AM
> >> To: Alex Deucher <alexander.deucher@amd.com>; Kevin Wang
> >> <kevin1.wang@amd.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>; David Airlie
> >> <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Evan Quan
> >> <evan.quan@amd.com>; Rui Huang <ray.huang@amd.com>; Kenneth Feng
> >> <kenneth.feng@amd.com>; Yintian Tao <yttao@amd.com>; Hawking Zhang
> >> <Hawking.Zhang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> >> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-
> >> janitors@vger.kernel.org
> >> Subject: [PATCH v3] drm/amdgpu: off by one in
> >> amdgpu_device_attr_create_groups() error handling
> >>
> >> This loop in the error handling code should start a "i - 1" and end at
> >> "i =3D=3D 0".  Currently it starts a "i" and ends at "i =3D=3D 1".  Th=
e result
> >> is that it removes one attribute that wasn't created yet, and leaks th=
e
> >> zeroeth attribute.
> >>
> >> Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute
> code")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> ---
> >> v2: style change
> >> v3: Fix embarrassing typo in the subject
> > =F0=9F=98=8A
> >
> > Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> >
> > m
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
> >> 1 files changed, 1 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> >> index b75362bf0742..e809534fabd4 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> >> @@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(stru=
ct
> >> amdgpu_device *adev,
> >>      return 0;
> >>
> >> failed:
> >> -    for (; i > 0; i--) {
> >> +    while (i--)
> >>              amdgpu_device_attr_remove(adev, &attrs[i]);
> >> -    }
> >>
> >>      return ret;
> >> }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000009ab89e05a618b642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Applied.=C2=A0 Thanks!</div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, May 20, 2020 at 11:33 AM Christian K=C3=B6nig &lt;<a href=
=3D"mailto:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 20.05.20 um=
 17:31 schrieb Ruhl, Michael J:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@oracle.com=
" target=3D"_blank">dan.carpenter@oracle.com</a>&gt;<br>
&gt;&gt; Sent: Wednesday, May 20, 2020 11:26 AM<br>
&gt;&gt; To: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" =
target=3D"_blank">alexander.deucher@amd.com</a>&gt;; Kevin Wang<br>
&gt;&gt; &lt;<a href=3D"mailto:kevin1.wang@amd.com" target=3D"_blank">kevin=
1.wang@amd.com</a>&gt;; Ruhl, Michael J &lt;<a href=3D"mailto:michael.j.ruh=
l@intel.com" target=3D"_blank">michael.j.ruhl@intel.com</a>&gt;<br>
&gt;&gt; Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;; David Airlie<br>
&gt;&gt; &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_blank">airlied@=
linux.ie</a>&gt;; Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" targ=
et=3D"_blank">daniel@ffwll.ch</a>&gt;; Evan Quan<br>
&gt;&gt; &lt;<a href=3D"mailto:evan.quan@amd.com" target=3D"_blank">evan.qu=
an@amd.com</a>&gt;; Rui Huang &lt;<a href=3D"mailto:ray.huang@amd.com" targ=
et=3D"_blank">ray.huang@amd.com</a>&gt;; Kenneth Feng<br>
&gt;&gt; &lt;<a href=3D"mailto:kenneth.feng@amd.com" target=3D"_blank">kenn=
eth.feng@amd.com</a>&gt;; Yintian Tao &lt;<a href=3D"mailto:yttao@amd.com" =
target=3D"_blank">yttao@amd.com</a>&gt;; Hawking Zhang<br>
&gt;&gt; &lt;<a href=3D"mailto:Hawking.Zhang@amd.com" target=3D"_blank">Haw=
king.Zhang@amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org=
" target=3D"_blank">amd-gfx@lists.freedesktop.org</a>; dri-<br>
&gt;&gt; <a href=3D"mailto:devel@lists.freedesktop.org" target=3D"_blank">d=
evel@lists.freedesktop.org</a>; <a href=3D"mailto:linux-kernel@vger.kernel.=
org" target=3D"_blank">linux-kernel@vger.kernel.org</a>; kernel-<br>
&gt;&gt; <a href=3D"mailto:janitors@vger.kernel.org" target=3D"_blank">jani=
tors@vger.kernel.org</a><br>
&gt;&gt; Subject: [PATCH v3] drm/amdgpu: off by one in<br>
&gt;&gt; amdgpu_device_attr_create_groups() error handling<br>
&gt;&gt;<br>
&gt;&gt; This loop in the error handling code should start a &quot;i - 1&qu=
ot; and end at<br>
&gt;&gt; &quot;i =3D=3D 0&quot;.=C2=A0 Currently it starts a &quot;i&quot; =
and ends at &quot;i =3D=3D 1&quot;.=C2=A0 The result<br>
&gt;&gt; is that it removes one attribute that wasn&#39;t created yet, and =
leaks the<br>
&gt;&gt; zeroeth attribute.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 4e01847c38f7 (&quot;drm/amdgpu: optimize amdgpu device attr=
ibute code&quot;)<br>
&gt;&gt; Signed-off-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@o=
racle.com" target=3D"_blank">dan.carpenter@oracle.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v2: style change<br>
&gt;&gt; v3: Fix embarrassing typo in the subject<br>
&gt; =F0=9F=98=8A<br>
&gt;<br>
&gt; Acked-by: Michael J. Ruhl &lt;<a href=3D"mailto:michael.j.ruhl@intel.c=
om" target=3D"_blank">michael.j.ruhl@intel.com</a>&gt;<br>
<br>
Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
<br>
&gt;<br>
&gt; m<br>
&gt;&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 3 +--<br>
&gt;&gt; 1 files changed, 1 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt;&gt; index b75362bf0742..e809534fabd4 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt;&gt; @@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(=
struct<br>
&gt;&gt; amdgpu_device *adev,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;<br>
&gt;&gt; failed:<br>
&gt;&gt; -=C2=A0 =C2=A0 for (; i &gt; 0; i--) {<br>
&gt;&gt; +=C2=A0 =C2=A0 while (i--)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_device_attr=
_remove(adev, &amp;attrs[i]);<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt; }<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div>

--0000000000009ab89e05a618b642--

--===============1130259701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1130259701==--
