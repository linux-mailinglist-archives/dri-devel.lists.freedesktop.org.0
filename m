Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73ED0F9D5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 20:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51EA10E16A;
	Sun, 11 Jan 2026 19:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="hmcVwfoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C26910E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1768158745; x=1768763545; i=deller@gmx.de;
 bh=powS2pcmjER2ROhAOeknf+onyr5CjFbNfwmAoqcKJ/o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hmcVwfoHJe9Jp0e97FD6RrN4uGukawHrdCa3Pg8M6M27a41FSN6LBLbljSQA3if7
 RyWDep+RtqAPARdP4Alj/I1S75+0mc9+4zlut/g+kZXi4KCcETT2e/D8zzs1GD/yh
 CqDnPzyy//Y2QYWPqk9RL1VfBK7afrZDXYixTkLm/taBdPkxuu1kGgaaJz8YGnER5
 RZv7mMT4rtZzcqSRtoVdIKqpf/ZW2TiYkrJVbafXUR3UQcmC4f4IYTP41Xh1yf2Le
 HwpItAxRVfI098chywPOxC93gZJiUQWsaIPI4dKfCnYHdNEq7miOQ7c5UodaNNti7
 puZXtY2yp/aF5f4i5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.120]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49lD-1vnIaH3lY1-015k8O; Sun, 11
 Jan 2026 20:12:24 +0100
Message-ID: <d48231e4-6c69-4948-99a9-121cd17e2db0@gmx.de>
Date: Sun, 11 Jan 2026 20:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video/logo: don't select LOGO_LINUX_MONO and
 LOGO_LINUX_VGA16 by default
To: Vincent Mailhol <mailhol@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260110-mono_and_vga16_logos_default_to_no-v1-1-30f36da979b4@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260110-mono_and_vga16_logos_default_to_no-v1-1-30f36da979b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n/UaYBySdJFhdnVF+sEGMiAyORzjYdTjCkBdu6tPdF1BV7pbuwy
 o+P41qN6wflfnfYW2wWJupty42N+iWPSyOT60KZtsGVGlHL8Vg86FqEOkWcOh56YijvtVlK
 tAdtBfqqNh/bCMng2mWp+8rR+Lvrng5e11zqN00gCnSDYIVeEehgyaosjATTxYCwrpkLTRs
 cMSsnR7MpDg8uc84JKfyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BgjDPcZuxfI=;gEn+6DlJycXLaWeylk0tfKoNXat
 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
 yshCJaLok52kzRXgVlRU
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

On 1/10/26 13:23, Vincent Mailhol wrote:
> Nowadays, nearly all systems have a color depth of eight or more and
> are thus able to display the clut224 logo. This means that the
> monochrome and vga16 logos will never be displayed on an average
> machine and are thus just a waste of bytes.
>=20
> Set CONFIG_LOGO_LINUX_MONO and CONFIG_LOGO_LINUX_VGA16 configuration
> symbols to no by default.

I agree, that on basically every system today there is no need for the
monochrome or VGA16 logo.
But I'm not sure about the historic/exotic platforms, e.g. m68, sparc
and so on.

So, maybe instead of dropping the default "y", we should e.g. do:
+	default y if SUPERH
+	default y if XYZ (some other architecture/platform) ???
+	default n  (for all others)

The question is: Which arches may have needed the VGA16 or monochrome logo=
?

Helge

 =20
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> To be applied on top of my previous "video/logo: allow custom boot
> logo and simplify logic" series:
>=20
> Link: https://lore.kernel.org/all/20260108-custom-logo-v3-0-5a7aada7a6d4=
@kernel.org/
> ---
>   drivers/video/logo/Kconfig | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
> index 34ee207e5e77..cda15b95891e 100644
> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig
> @@ -20,7 +20,6 @@ config FB_LOGO_EXTRA
>  =20
>   config LOGO_LINUX_MONO
>   	bool "Standard black and white Linux logo"
> -	default y
>  =20
>   config LOGO_LINUX_MONO_FILE
>   	string "Monochrome logo .pbm file"
> @@ -38,7 +37,6 @@ config LOGO_LINUX_MONO_FILE
>  =20
>   config LOGO_LINUX_VGA16
>   	bool "Standard 16-color Linux logo"
> -	default y
>  =20
>   config LOGO_LINUX_VGA16_FILE
>   	string "16-color logo .ppm file"
>=20
> ---
> base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
> change-id: 20260110-mono_and_vga16_logos_default_to_no-fea83b350250
> prerequisite-change-id: 20251227-custom-logo-932df316a02c:v3
> prerequisite-patch-id: 5053eddfae57689a621f3224acc18742a25c2887
> prerequisite-patch-id: 2fd02272fb8f94575c67124366f58811dcceb6ad
> prerequisite-patch-id: 81d5632ac8717a56b335bb356e8fe5d9e8b1639f
> prerequisite-patch-id: 268d8fb7ce93d0cb137c32b6f149fda376da37e8
> prerequisite-patch-id: f6229ba399af73d57a647050a8f0f6871c4a96ef
> prerequisite-patch-id: 6a6d392a9acf6eb2fe2827e3beebbc4b341f50a5
> prerequisite-patch-id: 359180711835dc73be129380a5664210e19d50f1
>=20
> Best regards,

