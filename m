Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26630613BDB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61F610E101;
	Mon, 31 Oct 2022 17:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Mon, 31 Oct 2022 17:04:07 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6110E043
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 17:04:07 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 0D47C1C09DA; Mon, 31 Oct 2022 17:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1667235515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=nNuKKzhaDHv5Jvd/BCwuHm16VUQS2j6zeWAvcQDM5yE=;
 b=GPqUlhSnX+KKx6mq2j08PChZWDeLHNlMT+cadrpI6anF9i2AzI+pzZQG7xAUNcMzvCr4eK
 WxKvR5lR5qEa4jjbXtN1vezd+NW6mZzdSdTWOFgb+IFjc9ey/2bUER2FjPTZxBnrksCZOm
 p3Vz6M5R++9+GM4Ke/0L+zG2DXh5pt4=
Date: Mon, 31 Oct 2022 17:58:34 +0100
From: Pavel Machek <pavel@ucw.cz>
To: airlied@redhat.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 kernel list <linux-kernel@vger.kernel.org>
Subject: 6.1-rc: names of video outputs changed?
Message-ID: <20221031165834.GA10150@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I used to be able to do:

pavel@duo:~$     xrandr --output HDMI1 --mode 1920x1080 --primary
warning: output HDMI1 not found; ignoring
pavel@duo:~$     xrandr --output VGA1 --mode 1280x1024 --below HDMI1
warning: output VGA1 not found; ignoring

=2E..but now I have to do:

pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1
xrandr: cannot find crtc for output VGA-1
pavel@duo:~$     xrandr --output LVDS-1 --off
pavel@duo:~$     xrandr --output VGA-1 --mode 1280x1024 --below HDMI-1

Notice the change from HDMI1 to HDMI-1. I believe that's new in 6.1 or
so. Who did it and why? Hardware is thinkpad x220, and this breaks my
scripts :-(.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY1/+ugAKCRAw5/Bqldv6
8hd4AJ49iOfX+4FpOzVurlxNV/4RF4h/twCgu38XdfGmi//K9HOjRhyOEecpr9E=
=KDLK
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
