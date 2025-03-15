Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADCA62975
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 10:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D337910E272;
	Sat, 15 Mar 2025 09:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SSP9D8vc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0200810E272
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=MGev
 xMFs+AEeVD/g7S+xfiPUbsNw/tIHCnRkwS+P0V4=; b=SSP9D8vc5MsumtPvxp/d
 CVUk8n5Wde3V8zMT88IWNmIwVlaH7DQCxkDXU4uNeoTi/PNa5hjH4lUIAWxgZM33
 Q4w7+EPRwO+CSxj80Znxm0sk5tYB/rWOWFxfmarqpxm0iG+7oIvRRcjA1QTMYFX5
 YrGz5y9PXi8rg9PYKQ7b05qTm8tbBTVqIEh9YdGAwoBIfFM/Cryj3Ez6hbtfCtsM
 qju6xL3NONpDDmPaj79L1QoapOGiN7sUDs5Jli9ec+Pb2u1mllu8kSfTVGz3y6hP
 ehiV7pGqhWwNTBSWO44c7oiXaiPUY0dTS9s7r+SdCREB2nlcTnxlf5hcC+KHijqz
 WQ==
Received: (qmail 2329603 invoked from network); 15 Mar 2025 10:00:37 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Mar 2025 10:00:37 +0100
X-UD-Smtp-Session: l3s3148p1@NA/iyV0wwKkujnuL
Date: Sat, 15 Mar 2025 10:00:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-renesas-soc@vger.kernel.org,
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <Z9VBtTzNgDh_QsxX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Doug Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+4ueQPdkORSXQcLW"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
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


--+4ueQPdkORSXQcLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Doug,

> Seems reasonable to me. I would probably put an error message in this
> case, though? I don't think regmap_read() necessarily prints an error
> so it would just be a mysterious failure for why things didn't probe,
> right?

OK, can do that.

> This also only solves the problems for one of the 4 devices in this
> file. I think the GPIO device, PWM device, and DP-AUX device will
> still confusingly stick around. It's probably better to add a bogus
> regmap read in ti_sn65dsi86_probe().

Could be argued. I just wonder about all the other error cases in
ti_sn_attach_host() plus ti_sn_bridge_probe(). They have the same
problem with the other devices dangling?

Happy hacking,

   Wolfram


--+4ueQPdkORSXQcLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfVQbEACgkQFA3kzBSg
KbZiqg/8D10WbcbFyncxpYgi27s6gdp/L1rYAeXUQUXCWh54FbAiYMgfpTUCkdyJ
0c/f6cWzX5d1f3hLQtZUTQ1U0cWqwzWkwi299jZbl08hUvm71nP4OCXAD6CMtjX8
FsfApv5NuFJ22TOq7H+vXuvY9HyZNPaMneq97mVXD/WxkKg2qgHjIebM4xuziI2g
RPsOVd9RAQtbvZgHwl9HAXYm6Np1x3mizZs3OXf+ZpoqLBDFholgCMiUIUQ0S89s
MBIgrTDWftEHuwaGmevvYpV/hyGLiN6bMi6xPIu4mtjkRFuMeTePmWkWfZ+wh3M+
I0sfy4x3l823KDqq0sNtdjJ6Q8fXsjVzh1hvzJWSfpX76jJ+cpnsirF4FyEimRNu
NLG0UdP0QZhLZ1bfRwX6VyblUTyKes9QOSWLu36bzAWs7mTtYmV7G93p1t2XFAF9
4SSxtmzn7jMFyfJXlktZb/FC307FW7mp8IS78+PXZKbYNHDY8wEx5v4nwhGE3RU2
gtV9bimE17QE3F6gN2/1+vc2aFSipkq+DptfTnEx9kGLhZJ/37SJyZPZszMnIBKh
CgrmSBfyAtKXSc4PSV2JF2k833wxd//VPGYfaFau+T3pPhiWSjQjjx+MI0TP7Q8l
Sn/eoIWi/gGib1xY7pMMHHCQp7cMAzQ8iXNZgUVrCQEtupCiPNE=
=bZOD
-----END PGP SIGNATURE-----

--+4ueQPdkORSXQcLW--
