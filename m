Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369C7E28DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 16:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD24910E34D;
	Mon,  6 Nov 2023 15:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A87010E34C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 15:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EA497CE0B23;
 Mon,  6 Nov 2023 15:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB56C433C8;
 Mon,  6 Nov 2023 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699285043;
 bh=PhVYoqkFGDBmHN5xLHueJkfMTMCbvKcxSBfu8WwI8JM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2IetvyKN1oDLRoz0HwVEHgm8jvWm0ezF3BJYiPp/+QBjj2ntLMAZ096AFg17aTJf
 mQIX9NVE8OerkpCihyfIFcIV6qlOx+uk3UEurxuzcI31bpB1dgx4lpQWZbQ+0Oso6L
 ZGjNPVBJs0PZtkPvjQw7FbMubGzmv+l+hYTv50nwNQYUhpKYUoRBB31yp97Z81Zsc0
 diVdo1B3wj1X/GLk5HP5DEa+OD5zZfUSJeqxN3DUtXMYbnXlIXMK5fQj+VVuCX84x/
 qCuBhEl4SkI75MFJuD/Pv+fEoC6U0HifRS7g2D3Xp8oWPj0t4zYOO26CZD+PM/DoAR
 m0ZlAXp+BAWvQ==
Date: Mon, 6 Nov 2023 16:37:20 +0100
From: 'Maxime Ripard' <mripard@kernel.org>
To: oushixiong@kylinos.cn
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS9hdG9taWMtaGVscGVy?=
 =?utf-8?Q?=3A?= Call stall_checks() before allocate drm_crtc_commit
Message-ID: <khqq7vbclfirac2yphxvr3lthnsph3okw4vuv4rmvc2kui7wx5@5spogczrzd6o>
References: <20231106073742.158905-1-oushixiong@kylinos.cn>
 <6yqalig6nvnlpt7loetugjdgp5z4w3qwhpqpzzsygffp5w32d6@guq6v3g2z7tq>
 <000301da10b4$d4e90690$7ebb13b0$@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h44eb5yewsfjbvln"
Content-Disposition: inline
In-Reply-To: <000301da10b4$d4e90690$7ebb13b0$@kylinos.cn>
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
Cc: 'Thomas Zimmermann' <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h44eb5yewsfjbvln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Nov 06, 2023 at 09:26:15PM +0800, oushixiong@kylinos.cn wrote:
> I think it will cause memory leaks if too many nonblock commit works return
> -EBUSY.

Do you *think* or are you sure?

If you are sure, then please write down everything I mentioned earlier
in the commit log and resend the patch.

Maxime

--h44eb5yewsfjbvln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUkIMAAKCRDj7w1vZxhR
xbu4AQC4X4AXCLB1i6aJtzCDqCh3TGotHlxtKKbT4mkBrEI+bwD/QGr2Ba6VVzjC
2pz/3i33zZW48TE5qeR9gewfVBg+Cws=
=V8FP
-----END PGP SIGNATURE-----

--h44eb5yewsfjbvln--
