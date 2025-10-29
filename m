Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C957C19211
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B24710E096;
	Wed, 29 Oct 2025 08:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RyAcP7gV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700710E096
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:43:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F338060384;
 Wed, 29 Oct 2025 08:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127F9C4CEF7;
 Wed, 29 Oct 2025 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761727393;
 bh=TsAISoVUqtst65vqUQebjmquWAzfVyJVFtTnSr4s+T4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=RyAcP7gVXZFNPQAsCV3fjeXrb6DWMxwyBHv60k7g/IpMeuveDonwJYWyVcCTOsW8l
 bYcfKgEzinTOlVnrwEuE5SIQ/t2DoIuGqWtbCF0nHo6c4PZH6qKuHZnuE8lGPI3e3E
 40uvP8xbrmu5nPuVoszlkMxs+/tr+SGzLBfrY8F3HVz2Q5GS4s2ms/XUIsO/LPPxVQ
 +N32q52Qtp7KadT5L4sIbAoO+VVs+bPMLVZLJP8wkHeg38g6B37YcLS6FVgiMqNKmj
 qAoHGHnEiruZC1s0q4Gq7Rp8F3tTRwYcFTbS1LAZ4oDZiOEVEd0Z0+T6axO0YJnar2
 gquNOqq9YdAsA==
Message-ID: <4e131b012f2866cffc3a49669db8e98c@kernel.org>
Date: Wed, 29 Oct 2025 08:43:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 3/6] drm/bridge: document that adding a bridge is
 mandatory before attach
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-3-bb8611acbbfb@bootlin.com>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-3-bb8611acbbfb@bootlin.com>
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

On Tue, 28 Oct 2025 11:15:44 +0100, Luca Ceresoli wrote:
> At the moment it's not documented that you need to add a bridge before
> attaching it. Clarify that.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6cc=
dd8@houat/
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
