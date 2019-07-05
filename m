Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D42605C1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450486E128;
	Fri,  5 Jul 2019 12:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB556E128
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:12:57 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjN4z-0003hS-E5; Fri, 05 Jul 2019 12:12:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 459BD2742B0F; Fri,  5 Jul 2019 13:12:40 +0100 (BST)
Date: Fri, 5 Jul 2019 13:12:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
Message-ID: <20190705121240.GA20625@sirena.org.uk>
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
X-Cookie: How you look depends on where you go.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3lgZr5PhIwsop5RCxeelLiraufpXEP7Y5EXfLHxN4Y=; b=hAYQlw4PRYrgwlGaAkQ/4wA7G
 TP0lpCsujJkEtK292CBw1OMzakLEIfE/1kBviVMFeBl1bil5alPmT7CwQVE0scMA2Yt8zitziOyKx
 Twvf//bKTdx4ML8P8uJ6VDrcVYIerXzo8AUOHz3OOtquKv+chJ5C+U9LMFILUwu2uDO2M=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ALSA development <alsa-devel@alsa-project.org>, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, tzungbi@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: multipart/mixed; boundary="===============0750134535=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0750134535==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2019 at 03:08:37PM +0800, Tzung-Bi Shih wrote:
> On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:

> > +typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
> > +                                     bool plugged);
> > +

> The callback prototype is "weird" by struct platform_device.  Is it
> possible to having snd_soc_component instead of platform_device?

Or if it's got to be a device why not just a generic device so
we're not tied to a particular bus here?

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0fPrcACgkQJNaLcl1U
h9CqOgf+J1iCd1w3ReqbJfzVnRPz1davoLs8e6k9u638UeMZX3sVMS9fyeTcQtrX
XpRecrQsk7CUGoFb2ji0GxnHSXWnEwnIPCRmBzoDwSmsX+33TYQI1aH+m2ZeAgjv
QqHqk0vNtFAlsttbNMTvbkkkSYAAbOPW8K8AEL54U1X8EJBpqV8ljUj85yDazCou
SCsQUj0LlLqN6+Gm1LmXH81KdHY06t8i7yxPATgspDLgEJYi4WwdrIyqKAtl+k92
iAuK8BXYQJO14ZrV/8f0TJbHnrszfO3RJw0UqXdZ4YMvsw0KmrNj9jYv/cL7yD8F
AUeTwhBtKU+Jd353cqjNMhjYBXwEUg==
=+Q0m
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============0750134535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0750134535==--
