Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26363B052E5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37DA10E52F;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="GkohRT3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2540710E504
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:11:29 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-60768f080d8so9108106a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752531087; x=1753135887;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f9Cg9078FTk6703Jwl1sMpWwc+Z59Z9d8KVcUd3FN7E=;
 b=GkohRT3SNfE6ezGJ6GUWTeuvGLcAEKjQ3FGM+Rpen11r0iKStlBS39MxDSiF+5OnBg
 5jyjLq4GMIqV0DlCxJTxM3e4Ob3zAH6s6oagOUHqAETCscj/ePBSBrPQ9kuAWOixyW6S
 v6tyind6OjHncHgroBRLWgzr1CaAclM3PSnz/Az7agDlAoCdIhLUrU59DmrZQ3X0L45r
 zLkEAHhUlzoYnu8SyDMsjNS0gkXIDL+P1RRCrkKvPMZjqHtUbyi9TUXYmywi7rmMhrC9
 CEQd8XpZicV22SWqpCDrZ15nbrAy0yUONbi+dp02xMa9x3bUmN7jsmvRjtja2LDy7G+u
 m89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752531087; x=1753135887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9Cg9078FTk6703Jwl1sMpWwc+Z59Z9d8KVcUd3FN7E=;
 b=Qqv1j+3zoMyZmyXPL9xiM1IkO44PXr+z85VeU4xrXEW+w3ogqIw7jb3uRZmRCWaraK
 YUB7CoS4+Pz0bkTxPdGvhwhiKDUs8c7YxcQTOhX4uIkkGucHRy/0JTuXScm8zedXBmE6
 /nE52ue9yjLvdiq5ve4BsXwVmY68FhOu6y+oLAJRIYqbkoPXy9sVE5109rO4mKmaaK/x
 tX0JTH/gM69y/MFcIKwKZMo+I/TVKc7nDFnNkvn0iHyInX+BEpPsOZP04c7IMvo5xUex
 Z+B6FGKsdUD6KYigJ+rehZ5oUYJ+7BaRF3DJP9po+n02glHsD/+U/vVJIsJLbWVihXDj
 YrIw==
X-Gm-Message-State: AOJu0Yxc+FFcwx0/iRhlOJEKnsWLmtdCs+ahFmuimwWh5VdyY1/6z9qF
 KvSZpEBXW2tHa9LKJbdWGytFr959pQd9zjccFwsClHDmna4lZKcOEo5t/SQ6tze7NhXy5JVd8LG
 06ACw+Bdu+7nByUtOF5BPLc2v9rexUCRSNVRE80qmHQBWOzopaalg6eA=
X-Gm-Gg: ASbGncvMCxRtzsj1gGuybRU0LGa1+lxc055qwAVVA59HMqqElNW0m9Ec2wscSL92fqF
 mSC57gMK243PXA4YaoU7cIRrKbJPpkv1UHPsAX12IcJJ4V+wxUTQrUugN0Duo5Mkj7xR/MYD25m
 mQclzo4nc76pybFIvHT9MnrUexJO/2tJlTr5mnomdoB5PyvKDV8BhuqOSBO0pOG2NmkqkBrOSmA
 uPcgG8=
X-Google-Smtp-Source: AGHT+IE0hiVQnCFvfDgkuzZMcWKHhFz2RyDUCMJJExDLAaiPnHywwEN5WmLYxtaD5ccg/Kc6Vbv+VaxjRLSyghfoZyQ=
X-Received: by 2002:a05:6402:2794:b0:60c:3c23:2950 with SMTP id
 4fb4d7f45d1cf-611e76507d9mr13329577a12.8.1752531087289; Mon, 14 Jul 2025
 15:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250714220627.23585-1-richard@scandent.com>
In-Reply-To: <20250714220627.23585-1-richard@scandent.com>
From: Richard Yao <richard@scandent.com>
Date: Mon, 14 Jul 2025 18:11:15 -0400
X-Gm-Features: Ac12FXw8cp0G-jFL4N91lt0dAVhKqO_pG3vi8e-nUWJtV3nC4gD5VApHC9uquSk
Message-ID: <CAHCiSaiwbt9vMEm5drKic357-aBADwuUgaL1rLKys6mqGTBqow@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/panel: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@ryao.dev>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andre Przywara <andre.przywara@arm.com>, Junhao Xie <bigfoot@classfun.cn>, 
 Caleb James DeLisle <cjd@cjdns.fr>, Kever Yang <kever.yang@rock-chips.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/alternative; boundary="000000000000ea88190639eaf0b6"
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ea88190639eaf0b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 6:06=E2=80=AFPM Richard Yao <richard@scandent.com> =
wrote:

> From: Richard Yao <richard@ryao.dev>
>
I goofed when using git send-email for v2 and did not change the sender
email to my @scandent.com. My apologies for any confusion that they might
have caused.

>
> Hello,
>
> This series adds support for the Tianxianwei TWX700100S0 panel. The
> first patch adds the Tianxianwei vendor to the vendor prefixes yaml
> file.  The second patch documents the DT binding. The third patch makes
> fairly standard changes to the ili9881c driver.
>
> Runtime testing and validation was done using a patched rpi-6.12.36-v8
> kernel on a CM4 using a custom carrier board designed by Scandent.
>
> I have confirmed in writing with Tianxianwei that this patch series may
> be released under the GPL after sending them an early draft for review.
> This should be superfluous given my signed-off, but I want to make it
> clear that I did not assume fair use when providing signed-off.
>
> Changes in v2:
>   - Fixed typos in romanizations of Chinese names:
>       Tianxinwei -> Tianxianwei
>       Shenzen -> Shenzhen
>   - Link to v1: https://www.spinics.net/lists/kernel/msg5767021.html
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Junhao Xie <bigfoot@classfun.cn>
> Cc: Caleb James DeLisle <cjd@cjdns.fr>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Richard Yao <richard@scandent.com>
> ---
> Richard Yao (3):
>   dt-bindings: vendor-prefixes: Add Tianxianwei name
>   dt-bindings: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support
>   drm/panel: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support
>
>  .../display/panel/ilitek,ili9881c.yaml        |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 242 ++++++++++++++++++
>  3 files changed, 245 insertions(+)
>
> --
> 2.50.0
>
>

--000000000000ea88190639eaf0b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 14, 2025=
 at 6:06=E2=80=AFPM Richard Yao &lt;<a href=3D"mailto:richard@scandent.com"=
 target=3D"_blank">richard@scandent.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Richard Yao &lt;<a href=3D"mai=
lto:richard@ryao.dev" target=3D"_blank">richard@ryao.dev</a>&gt;<br></block=
quote><div>I goofed when using git send-email for v2 and did not change the=
 sender email to my=C2=A0@<a href=3D"http://scandent.com" target=3D"_blank"=
>scandent.com</a>. My apologies for any confusion that they might have caus=
ed.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Hello,<br>
<br>
This series adds support for the Tianxianwei TWX700100S0 panel. The<br>
first patch adds the Tianxianwei vendor to the vendor prefixes yaml<br>
file.=C2=A0 The second patch documents the DT binding. The third patch make=
s<br>
fairly standard changes to the ili9881c driver.<br>
<br>
Runtime testing and validation was done using a patched rpi-6.12.36-v8<br>
kernel on a CM4 using a custom carrier board designed by Scandent.<br>
<br>
I have confirmed in writing with Tianxianwei that this patch series may<br>
be released under the GPL after sending them an early draft for review.<br>
This should be superfluous given my signed-off, but I want to make it<br>
clear that I did not assume fair use when providing signed-off.<br>
<br>
Changes in v2:<br>
=C2=A0 - Fixed typos in romanizations of Chinese names:<br>
=C2=A0 =C2=A0 =C2=A0 Tianxinwei -&gt; Tianxianwei<br>
=C2=A0 =C2=A0 =C2=A0 Shenzen -&gt; Shenzhen<br>
=C2=A0 - Link to v1: <a href=3D"https://www.spinics.net/lists/kernel/msg576=
7021.html" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lis=
ts/kernel/msg5767021.html</a><br>
<br>
Cc: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D"_blank">ro=
bh@kernel.org</a>&gt;<br>
Cc: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk%2Bdt@kernel.org" target=
=3D"_blank">krzk+dt@kernel.org</a>&gt;<br>
Cc: Conor Dooley &lt;<a href=3D"mailto:conor%2Bdt@kernel.org" target=3D"_bl=
ank">conor+dt@kernel.org</a>&gt;<br>
Cc: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org" target=
=3D"_blank">neil.armstrong@linaro.org</a>&gt;<br>
Cc: Geert Uytterhoeven &lt;<a href=3D"mailto:geert%2Brenesas@glider.be" tar=
get=3D"_blank">geert+renesas@glider.be</a>&gt;<br>
Cc: Andre Przywara &lt;<a href=3D"mailto:andre.przywara@arm.com" target=3D"=
_blank">andre.przywara@arm.com</a>&gt;<br>
Cc: Junhao Xie &lt;<a href=3D"mailto:bigfoot@classfun.cn" target=3D"_blank"=
>bigfoot@classfun.cn</a>&gt;<br>
Cc: Caleb James DeLisle &lt;<a href=3D"mailto:cjd@cjdns.fr" target=3D"_blan=
k">cjd@cjdns.fr</a>&gt;<br>
Cc: Kever Yang &lt;<a href=3D"mailto:kever.yang@rock-chips.com" target=3D"_=
blank">kever.yang@rock-chips.com</a>&gt;<br>
Cc: Manivannan Sadhasivam &lt;<a href=3D"mailto:mani@kernel.org" target=3D"=
_blank">mani@kernel.org</a>&gt;<br>
Cc: Jessica Zhang &lt;<a href=3D"mailto:quic_jesszhan@quicinc.com" target=
=3D"_blank">quic_jesszhan@quicinc.com</a>&gt;<br>
Cc: David Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank"=
>airlied@gmail.com</a>&gt;<br>
Cc: Simona Vetter &lt;<a href=3D"mailto:simona@ffwll.ch" target=3D"_blank">=
simona@ffwll.ch</a>&gt;<br>
Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.intel.c=
om" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blan=
k">mripard@kernel.org</a>&gt;<br>
Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" target=3D"=
_blank">tzimmermann@suse.de</a>&gt;<br>
Cc: <a href=3D"mailto:devicetree@vger.kernel.org" target=3D"_blank">devicet=
ree@vger.kernel.org</a><br>
Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dr=
i-devel@lists.freedesktop.org</a><br>
Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux=
-kernel@vger.kernel.org</a><br>
Signed-off-by: Richard Yao &lt;<a href=3D"mailto:richard@scandent.com" targ=
et=3D"_blank">richard@scandent.com</a>&gt;<br>
---<br>
Richard Yao (3):<br>
=C2=A0 dt-bindings: vendor-prefixes: Add Tianxianwei name<br>
=C2=A0 dt-bindings: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support<br=
>
=C2=A0 drm/panel: ilitek-ili9881c: Add Tianxianwei TWX700100S0 support<br>
<br>
=C2=A0.../display/panel/ilitek,ili9881c.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0.../devicetree/bindings/vendor-prefixes.yaml=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 242 +++++++++++++++++=
+<br>
=C2=A03 files changed, 245 insertions(+)<br>
<br>
-- <br>
2.50.0<br>
<br>
</blockquote></div></div>
</div>

--000000000000ea88190639eaf0b6--
