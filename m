Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B026301EA2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 21:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AAF89AEA;
	Sun, 24 Jan 2021 20:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852089AEA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 20:10:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f1so12729397edr.12
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvlG0qZYaJutWfqlOqUr2pfAEiL+VHrGNv0ujq3/+TY=;
 b=VUW20oxFKz/T61iiQHDAzpgVOxDdKFDHK1Waoirip5rMlx248eLnbHzRTC2ZNkz+yW
 IBdzkhQChTb1PZz8WFT/5VpjWjrK1z+4GWOxVKBC26n7cGVOGPlA3JppHW1ZhHCfl/zK
 i2//dwayk3vbTvriIbR2t6S7sp7LLU2mm1fW9V/y2IkoqVXtam2LPMenTgOPuX9T+3KH
 4pEf7FPTwkW5piWoRIGDOeiB9NkgEMT48XUme0kp1RTD14ljTfRcomrUkCkBuJm9i8fV
 4m4xxIzdD888NV5GtL0tC44jeA3DSE/Uokw5amxAJveUUO3wlKrOg/WiSzHRr3EG9pqv
 S8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvlG0qZYaJutWfqlOqUr2pfAEiL+VHrGNv0ujq3/+TY=;
 b=gwPV9bUrKn5Wyunp4oXYYCY0/imveoCTfqLJW+WSb3B1ebss15Sie+Ahg1qB/b8F7s
 uZY1fN0HN2LRGA8BRbb6N7jTVer1dSdCY459GXDZrjloVnMZYxgkidf6bfp1TkzwkiZy
 rby043PjwQQIjOr4r5O/YeJMKZ2122TVmpWVCvtmRlSBg6qWvWCd63cWEq51Q6oTSPbq
 dNOjg8YULGu+fLw5sPKjQFOcQBhSmWGPdHN6xfanhmjigfWPG32yKq+S1IazZJ5jAfpZ
 UlCDaqzvqipq04WGpU2Qu//a+5vCZBRn4Z81He0T4iqycASt4mPGzmZ/bjNCCpdY4QNC
 ALag==
X-Gm-Message-State: AOAM531DYKr02NKfTxJsDX17g+EyPhSlU6GP9iO034no9KXGwN1IydWt
 31qzI5Qw8ORiL4H61WDq8XSuEz5i2GI9dfc+qw8=
X-Google-Smtp-Source: ABdhPJzE+b8Dz5oeAiIRwN64UWjrt4P0Djw5rsKyAtW7IF+sQUlEncWxaG8NorddLZP4rZzDXYffF8IAgqR612jDmdE=
X-Received: by 2002:a05:6402:1452:: with SMTP id
 d18mr398506edx.11.1611519026977; 
 Sun, 24 Jan 2021 12:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
In-Reply-To: <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sun, 24 Jan 2021 21:10:15 +0100
Message-ID: <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0522506160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0522506160==
Content-Type: multipart/alternative; boundary="00000000000026e0cf05b9ab031e"

--00000000000026e0cf05b9ab031e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2021 at 9:15 AM Simon Ser <contact@emersion.fr> wrote:

> On Sunday, January 24th, 2021 at 5:40 AM, Mario Kleiner <
> mario.kleiner.de@gmail.com> wrote:
>
> > According to the CTA 861.G spec, HDMI_STATIC_METADATA_TYPE1 is
> > not 1, but zero, so fix this enum.
> >
> > While this doesn't cause problems in the kernel yet, as the
> > constant isn't actively used by drivers yet, it did create
> > confusion while debugging HDR problems in yours truly, and
> > also potential bugs in userspace components, as the wrong
> > enum propagates to components, e.g., like it did already
> > into intel-gpu-tools (tests/kms_hdr.c) or is used as wrong
> > reference when writing future new userspace HDR components
> > like compositors.
> >
> > Fixes: fbb5d0353c62 ("drm: Add HDR source metadata property")
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Shashank Sharma <shashank.sharma@intel.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Sadly I think it's too late for this. Some user-space (like Kodi)
> already has copied over the kernel definitions, and libdrm already has
> a release with the wrong value.
>

But it still needs to be fixed if we want working HDR. I thought libdrm
copies the definitions from the kernel periodically, so the fix should
propagate?

--00000000000026e0cf05b9ab031e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Jan 24, 2021 at 9:15 AM Simon Ser=
 &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sunday, January 24th, 2021 at 5:40 AM, Mario Kleiner &lt;=
<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.klein=
er.de@gmail.com</a>&gt; wrote:<br>
<br>
&gt; According to the CTA 861.G spec, HDMI_STATIC_METADATA_TYPE1 is<br>
&gt; not 1, but zero, so fix this enum.<br>
&gt;<br>
&gt; While this doesn&#39;t cause problems in the kernel yet, as the<br>
&gt; constant isn&#39;t actively used by drivers yet, it did create<br>
&gt; confusion while debugging HDR problems in yours truly, and<br>
&gt; also potential bugs in userspace components, as the wrong<br>
&gt; enum propagates to components, e.g., like it did already<br>
&gt; into intel-gpu-tools (tests/kms_hdr.c) or is used as wrong<br>
&gt; reference when writing future new userspace HDR components<br>
&gt; like compositors.<br>
&gt;<br>
&gt; Fixes: fbb5d0353c62 (&quot;drm: Add HDR source metadata property&quot;=
)<br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: Uma Shankar &lt;<a href=3D"mailto:uma.shankar@intel.com" target=3D=
"_blank">uma.shankar@intel.com</a>&gt;<br>
&gt; Cc: Shashank Sharma &lt;<a href=3D"mailto:shashank.sharma@intel.com" t=
arget=3D"_blank">shashank.sharma@intel.com</a>&gt;<br>
&gt; Cc: Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.=
intel.com" target=3D"_blank">ville.syrjala@linux.intel.com</a>&gt;<br>
<br>
Sadly I think it&#39;s too late for this. Some user-space (like Kodi)<br>
already has copied over the kernel definitions, and libdrm already has<br>
a release with the wrong value.<br></blockquote><div><br></div><div>But it =
still needs to be fixed if we want working HDR. I thought libdrm copies the=
 definitions from the kernel periodically, so the fix should propagate?</di=
v><div> <br></div></div></div>

--00000000000026e0cf05b9ab031e--

--===============0522506160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0522506160==--
