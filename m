Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABAA4E855
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C519E10E11E;
	Tue,  4 Mar 2025 17:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fiO7yk6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DA10E655
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:19:24 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 7811C408B643
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:19:23 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6f253Nh0zFxx6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:58:21 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id A071E42732; Tue,  4 Mar 2025 17:58:03 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b=fiO7yk6W
X-Envelope-From: <linux-kernel+bounces-541769-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b=fiO7yk6W
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 444C2421A7
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:11:26 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 836DE3063EFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:11:25 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC91E7A456D
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A6211710;
 Mon,  3 Mar 2025 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fiO7yk6W"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org
 [10.30.226.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C51CAA71
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=10.30.226.201
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1741007468; cv=none;
 b=SH95EBm8I0FjSOyobgqf1NhfriU9C5+5tQS4mRzPX/O9OQzLxWCM5EAOEdmO0DToNqta5oQvG+VcLmvUhXU3Y7CNsSe5mipcOYXU/RcUGleeG8cm/Xfo3DrgRXCIH0/1vo1k+tgWLzSSUKKixJyVbdfLkJdc87k7RLbDFBw2/5E=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1741007468; c=relaxed/simple;
 bh=u+X9SKWkfe/2MAlFWd/PUqWxSiWY2RlGsvB38Uys+ws=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=JmB9q05Rbw6yYbZS41aKtGudu2Fkn2UmthNkksj88fjs5ZCQ5pfwP4BwYLSb1O8/okTlUNiqADjojABsgp7/ZeiQZf396EZCDoJoAMXu8ympi+qw5gKLE/r0zoOHuzLRcPKVH1DWgXDBtPuHtyarCyZprryNzkhAZTRDf50ZlA8=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=kernel.org
 header.i=@kernel.org header.b=fiO7yk6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D86C4CED6;
 Mon,  3 Mar 2025 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741007468;
 bh=u+X9SKWkfe/2MAlFWd/PUqWxSiWY2RlGsvB38Uys+ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiO7yk6WFCkp5XAHvs0ZEydMfZKskSOX1c+hcaCRvOkuTzjGhzB7/hSzHayzjUWbd
 LCv8lHnpL0TzcUaUgaEeHKy16fQSbNG9YQwtggaFE6+IwItajHskOZqHBtPgIMmMuT
 noP4wEmwwDjaPAAbA1ESrQBRnGXRvpmAyngUI1AGG/JJPVguBwEg8I6+RdMQXtNVJ9
 oZOn1y2MuEEdQC6rvtj3y1L9Un28uM1Bne8S599BESVt9tgcREU+l/nI26npcuKb65
 Dc4e6M2LQwBlWvgQa/OEExJi+FVm2Yu9UwF+CHuGDkAa5TyrjOmUqOocDAQ0WkwD7Z
 +G1u2tipjQ/cg==
Date: Mon, 3 Mar 2025 14:11:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250303-urban-trout-of-vastness-f8d0e7@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6ogcuu3aoimpjkf7"
Content-Disposition: inline
In-Reply-To: <20250227120004.77814e09@bootlin.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6f253Nh0zFxx6
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741713452.1702@CGheVdI5g2ip6VGYW9Yc/w
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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


--6ogcuu3aoimpjkf7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Tue, 25 Feb 2025 17:43:48 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi,
> >=20
> > Here's a series of changes after to the KMS helpers and bridge API
> > following a bunch of reviews I did.
> >=20
> > It's mostly centered across providing an easier time to deal with bridge
> > states, and a somewhat consistent with the other entities API.
> >=20
> > It's build tested only, with arm64 allmodconfig.
> >=20
> > Maxime
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
>=20
> I Tried to test this series on my system but I've got a compilation issue.
>      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>      depmod: ERROR: Found 2 modules in dependency cycles!
>=20
> CONFIG_DRM=3Dm in my configuration.

Could you share your configuration? it doesn't happen with allmodconfig.

Thanks!
Maxime

--6ogcuu3aoimpjkf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8WqaAAKCRAnX84Zoj2+
dl44AX48FfLtjeWPDYOrJjaK7AmFHqbLJVJ/+oSpco54gcXJ9+H7Qr8QWPAgLL00
tV3msvABf2WYTbjD4nVOHP0Mn828ZtNNPjod/zsu6d3Q/Rw5xaDFjUenEIHvQi5E
W2A0IVrirQ==
=V5Ne
-----END PGP SIGNATURE-----

--6ogcuu3aoimpjkf7--

