Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B68AE9C5F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 13:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B715B10E03E;
	Thu, 26 Jun 2025 11:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TUWh2MGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9BA10E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 11:18:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BD7B617F1;
 Thu, 26 Jun 2025 11:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01010C4CEEB;
 Thu, 26 Jun 2025 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750936704;
 bh=cZdfqNOjL195pG/M5zmssDAIlpdKlgz4b0sLq7q/4Ew=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TUWh2MGM6If6pxtYHuaFpppjLWQ1BthWXM56z6vPJiWcOwzJhSzUjjHsm5WyDwCa5
 ANYi6MYTCCxxiikDkg/yAXePp6hvL3mXIKF1f6rnyOxiCwrMserIjm//6OCKZfBbiy
 FfWpmooxsp1rDi0lJhJT6dH+j/EeuAMmOvqYOXRsSAMZGC4soXEwzjI9YxNQmdig82
 j8cWeMM6CJWL7Hr5vG1RDotE2mcr2f2C0QtP8Y+k1FmRfv0FP++yB9XV8Cn7ldcYdV
 X/5z0Kg2XywaEWu3dEDig9gwhA6p+TSDGtdD8jSHqmHSCy8Q5Am+22a/DeMMWrMvDO
 rx5TY+QWSj7GA==
Message-ID: <6e1b830a83aded9354ba154cdf1100b6@kernel.org>
Date: Thu, 26 Jun 2025 11:18:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v6 2/3] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
In-Reply-To: <20250625-microchip-lvds-v6-2-7ce91f89d35a@microchip.com>
References: <20250625-microchip-lvds-v6-2-7ce91f89d35a@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>,
 DharmaBalasubiramani <dharma.b@microchip.com>,
 JernejSkrabec <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
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

On Wed, 25 Jun 2025 14:11:54 +0530, Dharma Balasubiramani wrote:
> Replace legacy .enable and .disable callbacks with their atomic
> counterparts .atomic_enable and .atomic_disable.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
