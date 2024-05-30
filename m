Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89A8D4895
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682810E67E;
	Thu, 30 May 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B703VDg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516DB10E462
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 65816CE1A5E;
 Thu, 30 May 2024 09:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BB0C2BBFC;
 Thu, 30 May 2024 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717061589;
 bh=2S6iC5KExp20+POdXp5zPyr1+sRk0Kr57MqCw6Lzqdg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=B703VDg1Kop5cQKRRm+lU6mMxMJHeoET2h0FnDPC1i6A617t34ZsMHc6F0VFcBn3T
 GC7QaaxYerRFal9MchJ3grwC9T1U7TIfkXAsJU8Y+dESNj8KxHBcr8iZfWIsrevrZc
 CCRxeR4ZDhWDorgYuTlcNnY4sd8WKTGDfX896Ga58JwxrvlsIJkEROnbMrcotCktfr
 Prmjdfe9mw6miHBgYfrhWWTHLC3QNceX4ZVdLWA3LCE9mJFbd6b/D7duEbgN3Fw1qG
 hANLZ8QzaatS0ooNQsP14315wY1xui2GmMD7WS0H48g9I3LLbWFjwHnA9MuNW9UsiF
 FwL6jYe8vKahQ==
Message-ID: <69126b45d5c35e4835929b932ece9e25@kernel.org>
Date: Thu, 30 May 2024 09:33:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jayesh Choudhary" <j-choudhary@ti.com>
Subject: Re: [PATCH v2] drm: bridge: cdns-mhdp8546: Move mode_valid hook to
 drm_bridge_funcs
In-Reply-To: <20240530091757.433106-1-j-choudhary@ti.com>
References: <20240530091757.433106-1-j-choudhary@ti.com>
Cc: Laurent.pinchart@ideasonboard.com, a-bhatia1@ti.com, airlied@gmail.com,
 andrzej.hajda@intel.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, j-choudhary@ti.com, jani.nikula@intel.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, u.kleine-koenig@pengutronix.de, "Maxime
 Ripard" <mripard@kernel.org>
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

On Thu, 30 May 2024 14:47:57 +0530, Jayesh Choudhary wrote:
> With the support for the 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' case,
> the connector_helper funcs are not initialized if the encoder has this
> flag in its bridge_attach call. Till now we had mode_valid hook only in
> the drm_connector_helper_funcs. Move this hook to drm_bridge_funcs to
> validate the modes.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
