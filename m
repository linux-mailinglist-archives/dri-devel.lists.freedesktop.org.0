Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C29A27AD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22A10E866;
	Thu, 17 Oct 2024 15:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pl9fewRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D76710E865
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 15:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBE655C1577;
 Thu, 17 Oct 2024 15:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF47C4CEC3;
 Thu, 17 Oct 2024 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729180766;
 bh=lyVMAPXxZHZH2M+OCbvtiUPs6XEh3qOZShaf9qDFUN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pl9fewRbfCyjEYxOz77nIJaAIUd2iPElsvaI1ymFOJS/fsoYRLQzm/emtvZq7jIKr
 ryw7ehHmWjyWj9B2/yjitWtiGjvcIFHpOboLuh3XedmoHJfRHLMdKpVD62IvFtEv4/
 AZZlI8rAuYCsdiaS/whXg8dcF9FE3HxteBv7cnwUH6ZRWKJIb1tf+mHwdtfzXCs7l7
 mdrzHQDqUtP25OY8pyS9N2fKSkoFVFmEfSey/B0mmoQ9CoZe4Vb2jJ4gN9z4xkcLmC
 mgzy/UWxwrBWLAjWx2lOro19TgzfX/2IZaSgEilU1jGu0uvwCOO15oN/O+EUpM2ANi
 Y7jT4GerPLFNQ==
Date: Thu, 17 Oct 2024 17:59:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
Message-ID: <20241017-icy-speedy-okapi-bebdfa@houat>
References: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
 <20241017-kickass-agile-boa-dd5cd3@houat>
 <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kyxaqmywzmbnsuvl"
Content-Disposition: inline
In-Reply-To: <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
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


--kyxaqmywzmbnsuvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
> > On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
> > > Hi Stefan
> > >=20
> > > On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
> > > > Hi Dave,
> ...
> > > > i prepared a branch for you, which contains the latest suspend2idle=
 patches:
> > > >=20
> > > > https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
> > > >=20
> > > > Steps:
> > > > 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> > > > 2. Build Kernel from repo above with arm/multi_v7_defconfig
> > > > 3. Replace Kernel, modules + DTB on SD card with build ones
> > > > 4. add the following to confix.txt
> > > > device_tree=3Dbcm2837-rpi-3-b-plus.dtb
> > > > enable_uart=3D1
> > > > 5. change/add the following to cmdline.txt
> > > > console=3DttyS1,115200
> > > > no_console_suspend=3D1
> > > > 6. connect the following devices to Raspberry Pi 3 B+ :
> > > > USB mouse
> > > > USB keyboard
> > > > HDMI monitor
> > > > Debug UART adapter (USB side to PC)
> > > > 7. Power on board and boot into X11
> > > > 8. Change to root
> > > > 9. Enable wakeup for ttyS1
> > > So I remember for next time
> > > echo enabled > /sys/class/tty/ttyS1/power/wakeup
> > >=20
> > > > 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> > > > 11. Wakeup Raspberry Pi via Debug UART
> > > I don't get the error you are seeing, but I also don't get the displa=
y resuming.
> > > pm has obviously killed the power to the HDMI block, and it has the
> > > reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
> > > Nothing in the driver restores these registers, and I'm not sure if it
> > > is meant to do so.
> > > Run kmstest or similar from this state and the change of mode
> > > reprogrammes the blocks so we get the display back again.
> > >=20
> > > I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
> > > EDID, and get the same results.
> > >=20
> > > Knee-capping the HDMI block on suspend seems an unlikely mechanism to
> > > work reliably. On the more recent Pis there is a need to be quite
> > > careful in disabling the pipeline to avoid getting data stuck in
> > > FIFOs.
> > > I feel I must be missing something here.
> >
> > I think we're probably missing calls to drm_mode_config_helper_suspend =
and
> > drm_mode_config_helper_resume.
>
> Okay, i tried this and it works better (HDMI resumes fast), but it also
> triggers a lot of WARN

vc4_plane_reset deviates from the helper there:
https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_atomic_=
state_helper.c#L326

We should adjust it.

> and the "doesn't support RGB ..." warnings are still there.
>=20
> I pushed my changes to the branch and attached the dmesg output.

I can't help you there, it doesn't make sense to me. The EDID should be cor=
rect.

Maxime

--kyxaqmywzmbnsuvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxE0VwAKCRAnX84Zoj2+
ds4ZAYDI+QHvtv8R1VEOw7hNx0Fpluj0yMwdSJKcztU9ZlmFh22cnp11tjM7dEE6
uBv1sPIBgP0SeL4E/KaOYUPPPBRirq1rn/MVV01jTuItTEBNItdXMO3TJp7EWgWF
0sdwFHV32g==
=Ck1B
-----END PGP SIGNATURE-----

--kyxaqmywzmbnsuvl--
