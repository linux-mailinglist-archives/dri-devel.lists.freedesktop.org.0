Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15EF9967C7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B31510E6D8;
	Wed,  9 Oct 2024 10:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dBHYyukT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F74A10E6D8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:55:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XNqYj0HmKz9tvs;
 Wed,  9 Oct 2024 12:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1728471353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxoFgKL1bT6WIAOw7oVkPITw9WDLbaDJNoYfRU5aU38=;
 b=dBHYyukTdM1SoNkA63WSOJh0TLD4g9XzxH9ypKvCTh9BrGb/G0At3lejlbiWl3CT1atALL
 Ub4HLpnxZo/DBf4rYV5TWb5NunZNkBl53fp1JHcBBpnioC8ZLl1mSe5Jj8ksQSEfYqzqZS
 Q2fkMd9nIjub2dvzJeF7Gop43b4WegNvserd4kGnhgAPRcuTSyuOJVH6Zsek5RH7YO52Xt
 9MA5TMwZ9hScNAKlBdG5nI4GdJKZBpc7I+iwEKwwzDOfHkwDvVuCslbTCYOdNEiMATfYwj
 pKmlFd89gN8672MzgVsGn7FEMRPwgo578hiECAIjgVZ0Z8Bz5jvFUeCHrhruzw==
Date: Wed, 9 Oct 2024 12:55:49 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: radeon drm fails to load on v6.12-rc2 "Bogus possible_clones:
 [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)" ( Thinkpad
 T60)
Message-ID: <20241009125549.56e2782e@yea>
In-Reply-To: <ZwYinD22dTiBkCh8@intel.com>
References: <20241009000321.418e4294@yea>
	<ZwYinD22dTiBkCh8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 50d11c5c8319235d531
X-MBO-RS-META: r15fnc7qdqdizunfa8ryg8gbifd6fqhj
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

On Wed, 9 Oct 2024 09:28:44 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Oct 09, 2024 at 12:03:21AM +0200, Erhard Furtner wrote:
> > Greetings!
> >=20
> > On kernel v6.12-rc I get no X and dmesg (via netconsole) shows this at =
loading radeon drm:
> >=20
> > [...]
> > [drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
> > radeon 0000:01:00.0: WB enabled
> > radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x000000000800=
0000
> > radeon 0000:01:00.0: radeon: MSI limited to 32-bit
> > [drm] radeon: irq initialized.
> > [drm] Loading R500 Microcode
> > [drm] radeon: ring at 0x0000000008001000
> > [drm] ring test succeeded in 0 usecs
> > [drm] ib test succeeded in 0 usecs
> > stackdepot: allocating hash table of 65536 entries via kvcalloc
> > acpi device:06: registered as cooling_device2
> > [drm] Radeon Display Connectors
> > [drm] Connector 0:
> > [drm]   VGA-1
> > [drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48 0x7e4c 0x7e4c
> > [drm]   Encoders:
> > [drm]     CRT1: INTERNAL_KLDSCP_DAC1
> > [drm] Connector 1:
> > [drm]   LVDS-1
> > [drm]   DDC: 0x7e60 0x7e60 0x7e64 0x7e64 0x7e68 0x7e68 0x7e6c 0x7e6c
> > [drm]   Encoders:
> > [drm]     LCD1: INTERNAL_LVTM1
> > [drm] Connector 2:
> > [drm]   DVI-I-1
> > [drm]   HPD1
> > [drm]   DDC: 0x7e50 0x7e50 0x7e54 0x7e54 0x7e58 0x7e58 0x7e5c 0x7e5c
> > [drm]   Encoders:
> > [drm]     DFP1: INTERNAL_KLDSCP_TMDS1
> > ------------[ cut here ]------------
> >
> > Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=3D0x4 (full e=
ncoder mask=3D0x7) =20
> <snip>
> > Bogus possible_clones: [ENCODER:48:TMDS-48] possible_clones=3D0x1 (full=
 encoder mask=3D0x7) =20
> <snip>
>=20
> Presumably something like this should fix it:
>=20
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index 0f723292409e..fafed331e0a0 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -43,7 +43,7 @@ static uint32_t radeon_encoder_clones(struct drm_encode=
r *encoder)
>  	struct radeon_device *rdev =3D dev->dev_private;
>  	struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encoder);
>  	struct drm_encoder *clone_encoder;
> -	uint32_t index_mask =3D 0;
> +	uint32_t index_mask =3D drm_encoder_mask(encoder);
>  	int count;
> =20
>  	/* DIG routing gets problematic */
>
> Ville Syrj=C3=A4l=C3=A4
> Intel

Many thanks! Your patch solves the issue.

Regards,
Erhard
