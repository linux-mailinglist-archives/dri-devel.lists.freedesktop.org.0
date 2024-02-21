Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28D85D94D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E86710E549;
	Wed, 21 Feb 2024 13:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z6UPy7PB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6537F10E549
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 92513CE1D76;
 Wed, 21 Feb 2024 13:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBAAC433C7;
 Wed, 21 Feb 2024 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708521432;
 bh=xp/6r8cBzezuXAMNfTiVfsLPTU5WD4SpRZLw2L8M+8k=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Z6UPy7PB0DbNCkrToyxFO+m9LmznNgtFyqrWqr/7x16XN6qJfvDxqfn7IBccY/hZC
 BfpSc+37UEGSRf7A4KRNPJRsMXeKIBHhl4BwOsfRYYbGub4l+bUKeO4vDCvAwiVc7F
 wwuZoAO9Npde7MrsXpy3XcdAZDkKxjEilxT7MUj+k0uGPoRwPaV3QIqK55CSn9rEg7
 XWE67SSKEObgIiptsrRi9ccbiXqcO3s2IUxXhv+qkNnshN4oKCN8J8soctDRt4qbVy
 7G2UwI/3AokrPKz/OhAP0nOD5mEgXlf1wQUPzLj/3fOcJYhL9FYN0UypODBbW7YYxy
 hpHl1YEigEo6A==
Message-ID: <ce9b5e36483676425eeff69c09b28671@kernel.org>
Date: Wed, 21 Feb 2024 13:17:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?T25kxZllaiBKaXJtYW4=?= <megi@xff.cz>
Subject: Re: [PATCH 2/3] drm/sun4i: Add more parameters to sunxi_engine
 commit callback
In-Reply-To: <20240216190430.1374132-3-megi@xff.cz>
References: <20240216190430.1374132-3-megi@xff.cz>
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

On Fri, 16 Feb 2024 20:04:25 +0100, Ond=C5=99ej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
>=20
> These will be needed later on when we move layer configuration to
> crtc update.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
