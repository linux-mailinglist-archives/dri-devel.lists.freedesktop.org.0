Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C111D99BB36
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 21:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673B610E113;
	Sun, 13 Oct 2024 19:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XuI5wLzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049B10E113
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 19:12:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e3881042dcso3955797b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728846720; x=1729451520;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fMAaQhnrjmLN62TPCFe5hpMUQXEGRMVAPcnKvhSQ2s8=;
 b=XuI5wLzX8+jb/x3yBDImBrKINg+n9vHKcEhFZhs3S1l7Je45Ob9P7VnS4o6YBLjFcY
 Bw/fdiZnJwZm4dfMm+4J9y7VyO1AhZmIyoueuQe0eiViE7B8XRTNg+TeaDNlgv87j5xn
 ZJxeXIoV60NixkEjfTKTVWOoJs+61erLj5cU8D+8YPGByqGzr87Zf0nU+EjCthlGSeQs
 7lWIdl7ZXH/mD7ymUF4v5v7h6EBjhrNMzRSo4H8iPdIo/75sKsQSUcEq+NMRpbDpDFiF
 LVlwNq0zs0GZ8CnRL7m2nozXTZjA7/nFoXeQQ2OgCkLzU3ZUS3euxjJJPf2lcvOawNLt
 63Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728846720; x=1729451520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMAaQhnrjmLN62TPCFe5hpMUQXEGRMVAPcnKvhSQ2s8=;
 b=a1GGXUvGdCNruKs+SEriespwsetyZhf5A8mItUUq2cmshDr9nl6cGSsfNm/jzV+Ab3
 T3K6gnCS5IQDSSbKtrpBFdLcnMOZ7pcD36BuSu65pdD7PqG5Zm9bu4qQLy/no26nDp22
 qEKsiLiuPnhXRl28lR4PN8RHBd2f9EuUwUFAvkaIpbt4bc/fu+3vK9nW1gwmmwQOhmwc
 EC4Eb4RSc+nhfD76xXOb8h0jt/p3dbgI2xqpOp5KDcNEiir/lYTZrc/DyMdOQFryg8Uc
 txxIPwCaGm3hCK76FidBQh4NIkLvLfQNSaQlhJMx6dMhT133wkfPWFlGp7i1VcTJN+vG
 ZJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2RyXk8Bzez8FX+wigvRUFu7Gcw90pnlaZVZRn/Z2GesCJtejJN07jO8QPaQXbaEddZa2hQJ8uvO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQH56zJE1Z351jnx3vUGv9vBncfYE0+mek2dcIVoZSZazHn7iM
 937A7kU/u5+Jrz5oGAQp1E6ZxaNAIJ23GGxTnVqWRGGyBopi9xOYhYXLXFU0Q6MPNfOgjD1xS4D
 enCeOBwzb+4e+0pvBYPiriVBwKL1nfdMC0JyYcQ==
X-Google-Smtp-Source: AGHT+IGjy1+n+lvx1Nv2tmB5zSbiTXF/o4E3RcdyZugd43eFXvGnbaIyN1glSzy6SR7TTBdzCdZ0vVvh0M5+Ui67lNQ=
X-Received: by 2002:a05:690c:a98:b0:6db:de34:8049 with SMTP id
 00721157ae682-6e364142ba3mr47155497b3.16.1728846719931; Sun, 13 Oct 2024
 12:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
In-Reply-To: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Sun, 13 Oct 2024 20:11:46 +0100
Message-ID: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: multipart/alternative; boundary="0000000000009cecb90624607e7f"
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

--0000000000009cecb90624607e7f
Content-Type: text/plain; charset="UTF-8"

Hi Stefan.

On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:

> Hi,
>
> i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
> to Bookworm. After that testing suspend2idle shows a new warning which i
> never saw before:
>
> HDMI Sink doesn't support RGB, something's wrong.
>

Can you provide the edid of your display please?

The last time I saw this type of error was when using the now removed built
in edids that were declaring the display as analog rgb. That dropped out
part way through the edid parsing and didn't set the flag for rgb support.

  Dave


> Platform: Raspberry Pi 3 B+
> Kernel: 6.12-rc1
> Kernel config: arm/multi_v7_defconfig
>
> I applied this downstream patch [1], but this doesn't help. Any ideas?
>
>
> [1] -
>
> https://github.com/raspberrypi/linux/commit/2559eae8cf2c060c7bb873209792077f20414fac
>
> [  272.263134] PM: suspend entry (s2idle)
> [  272.983317] Filesystems sync: 0.720 seconds
> [  273.248665] Freezing user space processes
> [  273.250547] Freezing user space processes completed (elapsed 0.001
> seconds)
> [  273.250574] OOM killer disabled.
> [  273.250579] Freezing remaining freezable tasks
> [  273.251774] Freezing remaining freezable tasks completed (elapsed
> 0.001 seconds)
> [  274.267355] ieee80211 phy0: brcmf_fil_cmd_data: bus is down. we have
> nothing to do.
> [  274.267372] ieee80211 phy0: brcmf_cfg80211_get_tx_power: error (-5)
> [  290.989948] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [  291.127611] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob
> available (err=-2)
> [  291.127974] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
> Apr 15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2
> [  291.193655] OOM killer enabled.
> [  291.193674] Restarting tasks ... done.
> [  291.195010] random: crng reseeded on system resumption
> [  291.203671] PM: suspend exit
> [  291.209085] lan78xx 1-1.1.1:1.0 eth0: Link is Down
> [  291.243499] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
> something's wrong.
> [  291.270561] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
> something's wrong.
> [  291.336887] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
> something's wrong.
> [  293.637295] lan78xx 1-1.1.1:1.0 eth0: Link is Up - 1Gbps/Full - flow
> control rx/tx
>

--0000000000009cecb90624607e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefan.=C2=A0<br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sun, 13 Oct 2024, 18:19 Stefan Wahr=
en, &lt;<a href=3D"mailto:wahrenst@gmx.net">wahrenst@gmx.net</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
i recently switch for my suspend2idle tests from Raspberry Pi Bullseye<br>
to Bookworm. After that testing suspend2idle shows a new warning which i<br=
>
never saw before:<br>
<br>
HDMI Sink doesn&#39;t support RGB, something&#39;s wrong.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you provide th=
e edid of your display please?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">The last time I saw this type of error was when using the now remove=
d built in edids that were declaring the display as analog rgb. That droppe=
d out part way through the edid parsing and didn&#39;t set the flag for rgb=
 support.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 Dave</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
Platform: Raspberry Pi 3 B+<br>
Kernel: 6.12-rc1<br>
Kernel config: arm/multi_v7_defconfig<br>
<br>
I applied this downstream patch [1], but this doesn&#39;t help. Any ideas?<=
br>
<br>
<br>
[1] -<br>
<a href=3D"https://github.com/raspberrypi/linux/commit/2559eae8cf2c060c7bb8=
73209792077f20414fac" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/raspberrypi/linux/commit/2559eae8cf2c060c7bb873209792077f2041=
4fac</a><br>
<br>
[=C2=A0 272.263134] PM: suspend entry (s2idle)<br>
[=C2=A0 272.983317] Filesystems sync: 0.720 seconds<br>
[=C2=A0 273.248665] Freezing user space processes<br>
[=C2=A0 273.250547] Freezing user space processes completed (elapsed 0.001<=
br>
seconds)<br>
[=C2=A0 273.250574] OOM killer disabled.<br>
[=C2=A0 273.250579] Freezing remaining freezable tasks<br>
[=C2=A0 273.251774] Freezing remaining freezable tasks completed (elapsed<b=
r>
0.001 seconds)<br>
[=C2=A0 274.267355] ieee80211 phy0: brcmf_fil_cmd_data: bus is down. we hav=
e<br>
nothing to do.<br>
[=C2=A0 274.267372] ieee80211 phy0: brcmf_cfg80211_get_tx_power: error (-5)=
<br>
[=C2=A0 290.989948] brcmfmac: brcmf_fw_alloc_request: using<br>
brcm/brcmfmac43455-sdio for chip BCM4345/6<br>
[=C2=A0 291.127611] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob<br>
available (err=3D-2)<br>
[=C2=A0 291.127974] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl=
0:<br>
Apr 15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2<br>
[=C2=A0 291.193655] OOM killer enabled.<br>
[=C2=A0 291.193674] Restarting tasks ... done.<br>
[=C2=A0 291.195010] random: crng reseeded on system resumption<br>
[=C2=A0 291.203671] PM: suspend exit<br>
[=C2=A0 291.209085] lan78xx 1-1.1.1:1.0 eth0: Link is Down<br>
[=C2=A0 291.243499] vc4-drm soc:gpu: [drm] HDMI Sink doesn&#39;t support RG=
B,<br>
something&#39;s wrong.<br>
[=C2=A0 291.270561] vc4-drm soc:gpu: [drm] HDMI Sink doesn&#39;t support RG=
B,<br>
something&#39;s wrong.<br>
[=C2=A0 291.336887] vc4-drm soc:gpu: [drm] HDMI Sink doesn&#39;t support RG=
B,<br>
something&#39;s wrong.<br>
[=C2=A0 293.637295] lan78xx 1-1.1.1:1.0 eth0: Link is Up - 1Gbps/Full - flo=
w<br>
control rx/tx<br>
</blockquote></div></div></div>

--0000000000009cecb90624607e7f--
