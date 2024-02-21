Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F91E85D93B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBF510E495;
	Wed, 21 Feb 2024 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NHH1lJU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144FE10E495
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:16:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5DD2BCE1D85;
 Wed, 21 Feb 2024 13:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9D4C433C7;
 Wed, 21 Feb 2024 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708521381;
 bh=CzNNwBJXqJo8+OeoGkqFUliEc/7tS1hf8ZqDIk6i4dc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=NHH1lJU9bkBJUiUtuhcFE+K0A2Bahbpo8q/yd3K+pm4+qd6baPUdX506iiSi9LqsK
 XO8+DpTgBXcnBuSwJE5JqJIbJy8R+LGDOrLVOjbRU/1B92mcQmSPTssS6Y1ijka2XR
 g8JW2GqTjezqkzF+7zOUqAbD+H8DygS3bOQzp0BtYbcLrYLzFvOTSJprODReef42Wp
 xPNgOv5bfRAhhEtrkR5jfC5PaQxAs8IBRBhl5qOirhytkTyVy68Fo0itNv+rjQRPFf
 8UjdTQseGSyWOR/qHhdEWdtc6DQFUcY1O52px197vlc6l/VinIEVuw1DeARD1vPV7A
 a7moLGEUOq7/w==
Message-ID: <ae3aed3ae64fb4d3ba1f3a063c3b1733@kernel.org>
Date: Wed, 21 Feb 2024 13:16:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?T25kxZllaiBKaXJtYW4=?= <megi@xff.cz>
Subject: Re: [PATCH 1/3] drm/sun4i: Unify sun8i_*_layer structs
In-Reply-To: <20240216190430.1374132-2-megi@xff.cz>
References: <20240216190430.1374132-2-megi@xff.cz>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Chen-Yu
 Tsai" <wens@csie.org>, "Daniel Vetter" <daniel@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Ondrej Jirman" <megi@xff.cz>, "Samuel
 Holland" <samuel@sholland.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 16 Feb 2024 20:04:24 +0100, Ond=C5=99ej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
>=20
> These structs are identical, use a single struct to represent private
> data for the DRM plane. This is a preparation for configuring layer
> routing from the CRTC (mixer) instead of current approach of setting
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
