Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECE8A8740
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 17:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6451E10E5BF;
	Wed, 17 Apr 2024 15:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ue5F6FPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9910E7CE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 15:17:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80694614F0;
 Wed, 17 Apr 2024 15:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8725CC072AA;
 Wed, 17 Apr 2024 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713367072;
 bh=7yUA2jvJOr59LgOV0dNeP1KEF/46tQCssXhwNevw0jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ue5F6FPHnOL678DL2/9QaVKJxkFHLib2iST9fdO1L1DqVuQLwpSnn0egwI8VXOzhh
 LFsGHcMiju8mmTJOYIS8Y9+CCV6vK7CMDOAFASU9B3+nci/5W1LyK+X7yPLqzm3pJ/
 eDDGZfj2e4s8xLceRvdIcC91uGBPgSkNP8SuU9QmxwHKEV+e2YNjiQKQyytEesYgY7
 RQVwnwqv7V4wVJlhGyLzi04W+9NRyccDMGiwcruWywBs2oXbXCWSFGjKjIRQuD9vCl
 NfylHouYCztjVEuEI2Ie5JRFpluNauRX0op/bF8/b8bw/7enGM/Rm8OW7GO2U8kChS
 gSwovAp1+cV5w==
Date: Wed, 17 Apr 2024 16:17:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkainen@ideasonboard.com>
Subject: Re: [PATCH v4 0/7] Managing live video input format for ZynqMP DPSUB
Message-ID: <20240417-stifling-saline-c401b7ba73e2@spud>
References: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qNv7Ubbsw1/3mR4p"
Content-Disposition: inline
In-Reply-To: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
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


--qNv7Ubbsw1/3mR4p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 16, 2024 at 01:31:35PM -0700, Anatoliy Klymenko wrote:
> Implement live video input format setting for ZynqMP DPSUB.

> To: Conor Dooley <conor+dt@kernel.org>

If there's nothing dt related here anymore, you can drop me :)

--qNv7Ubbsw1/3mR4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/oGQAKCRB4tDGHoIJi
0schAP98nHZnfFSME0zR7T2jkF0LbZDaU+MuGab26eGkYG765AEAt9tVsTAZnaX6
UmEjaoo4QyCmxz3wnRuiLAPA1WaPbwo=
=ni7T
-----END PGP SIGNATURE-----

--qNv7Ubbsw1/3mR4p--
