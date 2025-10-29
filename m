Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED3C19229
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C1610E72B;
	Wed, 29 Oct 2025 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bv9o0zfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB510E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:43:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1533940A8D;
 Wed, 29 Oct 2025 08:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759D2C4CEF7;
 Wed, 29 Oct 2025 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761727437;
 bh=ONMwA4zKSeuT5luKodY68l2KloetemK0znnfCIwveUM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Bv9o0zfGTgirAcTG6e5kzLH4DInJgVwZS2kx6TGbc+8HGmbwETzq64y2Zq3RP3uqR
 wRHuEGDAlrqJ/Gln8L3YFwAp1oSpu1b98vJuUgN/Ok/WggqLTpNLKE7wGTX22MxCJo
 Q62kqivuVJqOYGTX5upobvky1vMLBsu24WfhXXIj6BdsaLc+s95ewPqQXmgXl/A5BU
 4+ilz6KSiEWjivo11kiWUinFJp/OZOOrwQz/016b5xzLWfwQjeOksLRi1YESZxusnL
 pmoY5KdyveteRdPaZwP+cNxRaNCckN+kPCh4rJjbtr90peNIH1jAO3uZFtcjhb2r3c
 ZE7O3W/F4EwjA==
Message-ID: <1776f9d77b2c670c77fc52ae73b22d58@kernel.org>
Date: Wed, 29 Oct 2025 08:43:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 4/6] drm/bridge: add warning for bridges attached
 without being added
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-4-bb8611acbbfb@bootlin.com>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-4-bb8611acbbfb@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Andy Yan" <andy.yan@rock-chips.com>, "David Airlie" <airlied@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Tue, 28 Oct 2025 11:15:45 +0100, Luca Ceresoli wrote:
> DRM bridges must be added before they are attached. Add a warning to catch
> violations.
>=20
> The warning is based on the bridge not being part of any list, so it will
> trigger if the bridge is being attached without ever having been added.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
