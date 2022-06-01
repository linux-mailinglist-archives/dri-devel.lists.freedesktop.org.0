Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B06153B065
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 01:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248AD10E0E3;
	Wed,  1 Jun 2022 23:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9A10E0E3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 23:49:09 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id w2so5573635ybi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 16:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5SMYAbM9jwU8eguAYWV0Nk+ToQnyj5TKtLprHX1WYY=;
 b=NsEPY6dpQW0jRYV00+h+3mw/XBCiJCXvWmLIq0WxAgHz4j3X77T78tEMPBWUHQH0qz
 VmOZ5Eoi4Akq8na4LcmlHT8IlLE6tgz+lxZ9+x8mxmp8HBHhEl8JjCYE4AnroQIT2MIp
 ZMfeunZwNQVPFWzvF0UVqiodR55Oplh+2oQCmF4Ta6KnJf1TOOx60RM90bzga1zp5+j8
 Zpo50PV1hvbodsuzs8lE7Ujhg5oZvsKcLY8U40vIM+U3uIMQZLgonC3S3ejQPIQb2U5d
 IesIR4R1bfzFGYmg33HXw8Mq5o2uz2P6/868tlQWnD/WIe8QqPcXcqlIBaWOxcmiCMh0
 oBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5SMYAbM9jwU8eguAYWV0Nk+ToQnyj5TKtLprHX1WYY=;
 b=61JwA06GyuCvelEvwOSGjpNdB/Zb/rOD7qkJ1tLx4aFEC8o06FYgav/CSAsIE4AKdK
 eJqkSh+Td9c5JNulgvLDu+0S368VHRDW5LpuoH5t2DCNck+IMSAdvrvq8dZEW23Sy6fS
 8fWSr4ntd+g4d9yJ0XJCQwZNr5ZTUh0swX7hR1xB+jnw+vROPWVPG1icYiSTDGr5XCsi
 dKEzHF9vWI49EAieCZbQUivrB180sU/IsZGGQqlZepYF0Vm8/j9pzBEyS7QstDhT46ou
 EJ318Gd8pZWC8gDexYl9x9TUhEflM7IvtkD54ao1cSoyG6vzUGqNnp8lK7IfomTxYXJ/
 MmKA==
X-Gm-Message-State: AOAM532ohKiCO611OCK6aNOO7MbLkltp6QtMLHEBbkqk+MmIW/TQUT1W
 aOFD231REG97EYbbCQtwTbC618MXTRQdSOHRN5NDDQ==
X-Google-Smtp-Source: ABdhPJx9iFtejo8uERZtmhURR83iPSinDUPh+6ZRDFcvtsFCJMTIHtPu/hASAwgQs0GK2+cr9RfU/4jFX2BYwM5YyN0=
X-Received: by 2002:a25:ab2a:0:b0:65c:bdcf:44be with SMTP id
 u39-20020a25ab2a000000b0065cbdcf44bemr2545528ybi.85.1654127348840; Wed, 01
 Jun 2022 16:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-3-pbrobinson@gmail.com>
In-Reply-To: <20220601110249.569540-3-pbrobinson@gmail.com>
From: Emma Anholt <emma@anholt.net>
Date: Wed, 1 Jun 2022 16:48:57 -0700
Message-ID: <CADaigPWa-+axUjLubM+niR753aTYHFhWb5Kud+eqbt1Cp6Lw8g@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/v3d: Get rid of pm code
To: Peter Robinson <pbrobinson@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000a8f3605e06b8952"
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, javierm@redhat.com,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000a8f3605e06b8952
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 4:03 AM Peter Robinson <pbrobinson@gmail.com> wrote:

> Runtime PM doesn't seem to work correctly on this driver. On top of
> that, commit 8b6864e3e138 ("drm/v3d/v3d_drv: Remove unused static
> variable 'v3d_v3d_pm_ops'") hints that it most likely never did as the
> driver's PM ops were not hooked-up.
>
> So, in order to support regular operation with V3D on BCM2711 (Raspberry
> Pi 4), get rid of the PM code. PM will be reinstated once we figure out
> the underlying issues.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>

If I remember right, I had runtime PM working on non-2711 hardware.  I
never managed to get anyone to help with why 2711's power-on would fail,
and rpi just cranked the clock down as low as it would go as the power
management solution downstream.

I'm not sure what the right thing to do is, given all that.  Just some
context.

--0000000000000a8f3605e06b8952
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 4:03 AM Peter Robinson &lt=
;<a href=3D"mailto:pbrobinson@gmail.com">pbrobinson@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Runtime PM doe=
sn&#39;t seem to work correctly on this driver. On top of<br>
that, commit 8b6864e3e138 (&quot;drm/v3d/v3d_drv: Remove unused static<br>
variable &#39;v3d_v3d_pm_ops&#39;&quot;) hints that it most likely never di=
d as the<br>
driver&#39;s PM ops were not hooked-up.<br>
<br>
So, in order to support regular operation with V3D on BCM2711 (Raspberry<br=
>
Pi 4), get rid of the PM code. PM will be reinstated once we figure out<br>
the underlying issues.<br>
<br>
Signed-off-by: Nicolas Saenz Julienne &lt;<a href=3D"mailto:nsaenzjulienne@=
suse.de" target=3D"_blank">nsaenzjulienne@suse.de</a>&gt;<br>
Signed-off-by: Peter Robinson &lt;<a href=3D"mailto:pbrobinson@gmail.com" t=
arget=3D"_blank">pbrobinson@gmail.com</a>&gt;<br></blockquote><div><br></di=
v><div>If I remember right, I had runtime PM working on non-2711 hardware.=
=C2=A0 I never managed to get anyone to help with why 2711&#39;s power-on w=
ould fail, and rpi just cranked the clock down as low as it would go as the=
 power management solution downstream.<br></div><div><br></div><div>I&#39;m=
 not sure what the right thing to do is, given all that.=C2=A0 Just some co=
ntext.</div><div>=C2=A0<br></div></div></div>

--0000000000000a8f3605e06b8952--
