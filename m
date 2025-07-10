Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A2AFFB62
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B571A10E896;
	Thu, 10 Jul 2025 07:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zu/ggh5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA05A10E896
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:54:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75B61456EE;
 Thu, 10 Jul 2025 07:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC061C4CEE3;
 Thu, 10 Jul 2025 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752134067;
 bh=Nkb7eiW3DW8HrJqIgBjo47OJwQQEx2ENdayhmRHj9co=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Zu/ggh5p9xjdhaJqu8gwF2UchcWfpeNFOKmpSOWEuT37buAqUsp9Ulq7kdq5Bb54D
 +wF2PYrwopPg4cJdNyppQKw9bJmh4GjkQfvPudOSNgUcYcJIrNC6o3JeO5h2p+FqG0
 DCJ1ikhYAtE0rgP/k8faKAEbp8oa5pg8K4lpYusTwJEBFPjnKW4BTmW3EIL0CqlE4v
 oWuvOyHrh/Dxww/WYTV24qDkrnCsUWstootNxy0Lq36e6Ke5h9COcXSTXgu5CoIivK
 YIYoCgLN+/spKLYY3Rv+b0fOKHCFAGtRimJR7XlqMgOdRQEZl1vwQXF5ZBhhhq2jlC
 Tnr6/qTYy7YBg==
Message-ID: <94ded7709abf1f21d5c1022691da149d@kernel.org>
Date: Thu, 10 Jul 2025 07:54:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/3] drm/bridge: get the bridge returned by
 drm_bridge_get_prev_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-1-34ba6f395aaa@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-1-34ba6f395aaa@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
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

On Wed, 9 Jul 2025 17:59:37 +0200, Luca Ceresoli wrote:
> drm_bridge_get_prev_bridge() returns a bridge pointer that the
> caller could hold for a long time. Increment the refcount of the returned
> bridge and document it must be put by the caller.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
