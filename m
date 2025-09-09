Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA9B4A232
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4819A10E623;
	Tue,  9 Sep 2025 06:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nifieo0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8D710E623
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6C96601EF;
 Tue,  9 Sep 2025 06:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A2DC4CEF4;
 Tue,  9 Sep 2025 06:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757399183;
 bh=BXnOiw61m5hTBa0ecyNKIQGio0tRoWPyjCB7/fyXK4Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=nifieo0CutDBGFinD8ptVpc2HR0WvuImQsSsTWL2b7BTYq1/Ys3PG97cUFSxZ+6/p
 +FpIGGdvBEcxbeJu/dt35Xo8TjyMCVBkCItb0kk43o8YMbVGeEhHDkGbpCy6Ao3uQw
 T3O2x/maYOCh1og1lxSTiB4YwZd8UlS/bD/jnfkZptq/wAtjYifbgNvluvVsIThyNT
 HNJJEuJCRn5MRDEhx95PfOKDrCqgfvce0+3YNkQYDcg10i0TFR5wyW7TXIKb4D1pJg
 MR3zGEFETXsDIsDSx9Fm2V5tp6tI/umixBgUI2WKcUUuCHBk5YvKgWYgBE8RyZzGrV
 7jz9Ru6brS5Jw==
Message-ID: <06910fafbc86721d8ea360f002b9f9d5@kernel.org>
Date: Tue, 09 Sep 2025 06:26:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: use update latch for AVI
 infoframes
In-Reply-To: <20250903-adv7511-audio-infoframe-v1-1-05b24459b9a4@oss.qualcomm.com>
References: <20250903-adv7511-audio-infoframe-v1-1-05b24459b9a4@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 3 Sep 2025 19:21:28 +0300, Dmitry Baryshkov wrote:
> Instead of disabling and then reenabling AVI infoframe, use the
> recommended way of updating it on the fly: latch current values using
> the ADV7511_REG_INFOFRAME_UPDATE register.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
