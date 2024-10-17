Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927B9A24F6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888610E1FC;
	Thu, 17 Oct 2024 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WatXtAR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A710E1FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:27:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A0075C558E;
 Thu, 17 Oct 2024 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ECBC4CEC3;
 Thu, 17 Oct 2024 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729175271;
 bh=ajbK5rHAv5EGu+v58mx5v/BFjs8TI11IWZoA+IydRLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WatXtAR2nvj/ykQ1Q/cNSXUZAw9zQEloJWYm3FxbnoKs/Z1GN/6cl0N/8W+qBQw5s
 ukeI+QNa0a7z3NHWEUJ5BeDHETrP+3RQJ59JE+YtBk5ZEavDAFYBRdxJ7pxKtDZCIN
 2StuMfyz7+2cTNtxO8a/sphJzmkNBGCO+PLWrYzfAwY48pACijJiprPU4rh0/7RhGc
 yZUZSokUyczhcBA/fw2AEEmElzhLC1/D237ePbW/bfwxmKJC78um1147fa8Q2Dn8vf
 zG4DUNs1vIga4Fo+JJg9noAnOSZ7Q+LYFQP1S7ax4h3iBHziZqBUlIUdlEd7T0vzRm
 Jt26nzAxbusnA==
Date: Thu, 17 Oct 2024 16:27:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
Message-ID: <20241017-kickass-agile-boa-dd5cd3@houat>
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vsnb5spy6gpmtbd5"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
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


--vsnb5spy6gpmtbd5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
> Hi Stefan
>=20
> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
> >
> > Hi Dave,
> >
> > Am 15.10.24 um 11:32 schrieb Dave Stevenson:
> > > On Mon, 14 Oct 2024 at 22:16, Stefan Wahren <wahrenst@gmx.net> wrote:
> > >>
> > >> Am 14.10.24 um 12:54 schrieb Dave Stevenson:
> > >>> On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wr=
ote:
> > >>>> Hi,
> > >>>>
> > >>>> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
> > >>>>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> > >>>>>> Hi Stefan.
> > >>>>>>
> > >>>>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wro=
te:
> > >>>>>>
> > >>>>>>       Hi,
> > >>>>>>
> > >>>>>>       i recently switch for my suspend2idle tests from Raspberry=
 Pi Bullseye
> > >>>>>>       to Bookworm. After that testing suspend2idle shows a new w=
arning
> > >>>>>>       which i
> > >>>>>>       never saw before:
> > >>>>>>
> > >>>>>>       HDMI Sink doesn't support RGB, something's wrong.
> > >>>>>>
> > >>>>>>
> > >>>>>> Can you provide the edid of your display please?
> > >> ...
> > >>>>>
> > >>>>> The failure is coming from sink_supports_format_bpc()[1], but the=
 flag
> > >>>>> for DRM_COLOR_FORMAT_RGB444 should have been set from
> > >>>>> update_display_info()[2] parsing the EDID.
> > >>>>>
> > >>>>> Loading that EDID in via drm.edid_firmware has given me a console=
 at
> > >>>>> 1920x1200@60 without any issues, so I'm a little confused as to w=
hat
> > >>>>> is going on.
> > >> Since this warning only occurs on resume and not during normal boot,=
 i
> > >> would assume there is no issue with EDID. Maybe the flag get lost. I
> > >> should have mention that X11 doesn't recover in this case and the
> > >> display stays black.
> > > Ah, I hadn't realised you meant it was only on resume that it didn't
> > > come back up.
> > >
> > > I suspect you're right that the state gets lost somehow. It may be
> > > triggered by the returning of connector_status_unknown on the
> > > connector, but haven't traced it back.
> > >
> > > If I pick up your patches, what do I need to add to replicate this?
> > i prepared a branch for you, which contains the latest suspend2idle pat=
ches:
> >
> > https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
> >
> > Steps:
> > 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> > 2. Build Kernel from repo above with arm/multi_v7_defconfig
> > 3. Replace Kernel, modules + DTB on SD card with build ones
> > 4. add the following to confix.txt
> > device_tree=3Dbcm2837-rpi-3-b-plus.dtb
> > enable_uart=3D1
> > 5. change/add the following to cmdline.txt
> > console=3DttyS1,115200
> > no_console_suspend=3D1
> > 6. connect the following devices to Raspberry Pi 3 B+ :
> > USB mouse
> > USB keyboard
> > HDMI monitor
> > Debug UART adapter (USB side to PC)
> > 7. Power on board and boot into X11
> > 8. Change to root
> > 9. Enable wakeup for ttyS1
>=20
> So I remember for next time
> echo enabled > /sys/class/tty/ttyS1/power/wakeup
>=20
> > 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> > 11. Wakeup Raspberry Pi via Debug UART
>=20
> I don't get the error you are seeing, but I also don't get the display re=
suming.
> pm has obviously killed the power to the HDMI block, and it has the
> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
> Nothing in the driver restores these registers, and I'm not sure if it
> is meant to do so.
> Run kmstest or similar from this state and the change of mode
> reprogrammes the blocks so we get the display back again.
>=20
> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
> EDID, and get the same results.
>=20
> Knee-capping the HDMI block on suspend seems an unlikely mechanism to
> work reliably. On the more recent Pis there is a need to be quite
> careful in disabling the pipeline to avoid getting data stuck in
> FIFOs.
> I feel I must be missing something here.

I think we're probably missing calls to drm_mode_config_helper_suspend and
drm_mode_config_helper_resume.

Maxime

--vsnb5spy6gpmtbd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxEe4AAKCRAnX84Zoj2+
dhxNAX4rBJQYGB1UzbaByggstpNYQPXsCY1+aMZwQVf7RjjdMVZcpM2RuVEz4IIA
gOxLYvsBewUwmsMktg9lc8KvGA/DunZFnevLvsDz4t06agvl2qcIsNjoqZLTUq2S
6BjFDAI5jA==
=mcEq
-----END PGP SIGNATURE-----

--vsnb5spy6gpmtbd5--
