Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F08D170E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 11:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EE410E701;
	Tue, 28 May 2024 09:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dtqTxaea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439E10E268
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 09:18:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F1F5CE1181;
 Tue, 28 May 2024 09:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1804C32781;
 Tue, 28 May 2024 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716887879;
 bh=gb57VsaHLben3/KvXBlGwBMcHRIHYzfXY83bDmBH7+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtqTxaeanKrkU41v+Ab6IWny/Z15mCQtFie/wKYlkL1BLBC6PZSxsCe/HSU+fSSee
 f4BXO9MPuKVEjEbRluEVv97eaTpnPMgTHfkFA+AeJG+GBpEF3yxiawnoHK6N79EEmc
 SV9UFO5Pw2wcD3rEBnSnh+uRdpBk7+Y5eEOCD2q2uF319Ll+ZwEph7rBzfPeDGYGpR
 4w1OcW1P59d2XenUpHlWqDKvP9L9nGvAgPeQzRwESTMTQabnlkku076w6eHdljUpqZ
 vl5oZFyBdXKtoUiAaEE494VcQqIPg0JY/J21KBNNE9qrka6USTVwBSP8UVO2JXmQz9
 a5SNTPMCwvijg==
Date: Tue, 28 May 2024 11:17:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <20240528-prophetic-masterful-hyrax-563f82@houat>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="57h7aqhyxav7s7yt"
Content-Disposition: inline
In-Reply-To: <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
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


--57h7aqhyxav7s7yt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
> On 28/05/2024 09:43, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> > > From: Arnaud Vrac <avrac@freebox.fr>
> > >=20
> > > The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> > > DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> > >=20
> > > Since it's an I2C-programmable bridge, it could have a proper driver,
> > > but the default settings work fine, thus simple bridge is sufficient.
> >=20
> > No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
> > change the TMDS clock ratio when programming a TMDS character rate
> > higher than 340MHz. And you'll need hotplug support to deal with it
> > properly too.
> >=20
> > So sorry, you need a real driver there.
>=20
> Hello, this is an HDMI redriver, which simply cleans up the HDMI
> signal, so no programming is needed to support HDMI 2.0.

I mean, if I'm to trust the datasheet, it is more complicated than that.
It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
sent on its input side, but that wouldn't happen with DP for example.

Maxime

--57h7aqhyxav7s7yt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlWhPwAKCRAnX84Zoj2+
dixwAYDSYAEmxqJlg1kBawCLhbi9tuC/H6OS/jCP1Mp+DskRTgszL7Yf1cpSn161
uTk+1vwBf0ajuEMZFAHUp9Wixm/+QGleS12KLdSFxrIMLQ4JEZ4V+0dakuIAgie0
QQ4u1vi5Mw==
=QeUY
-----END PGP SIGNATURE-----

--57h7aqhyxav7s7yt--
