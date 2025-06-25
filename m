Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B885AE779E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9E10E678;
	Wed, 25 Jun 2025 06:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tglTcBxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8A210E678
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8AE95C37D9;
 Wed, 25 Jun 2025 06:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E546C4CEEA;
 Wed, 25 Jun 2025 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834673;
 bh=TH2Sh4xVmeTr5CC8o4+TFv9M1ig1OcnOG6XJmVoW7cU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tglTcBxlcQageCvCnz+ngh4sx8zeege1NpLDgdHvb5KyKa3cE7XX66xmfaYExpfS6
 D5m4fZvgdoGVKdXSsbpA25tLTJvUAb133Amk21SnOHSOGgEc/PB+JTYYaEq9UFcb8t
 3t/dno+vJhuYaqv6hNpLvXc0rVsOW45BGucKZGQQK2qh964bpgb/Br3l36G3GrjAIK
 K/Glsuu5jJsHkhOZQHXD06B/odNvZxIEI4ZZuugtKOoG9mkNwn7v1AcCrWGL1Jm8U4
 fdgkd5zycrnDHjitGZgd2JvTQvjFZC4WisrGkcp0KmvLWEbxy6EPUB1cFdzN2j+PQm
 ozwcOgfAOTYwQ==
Message-ID: <0a152b0fc2b95835cce7a0703745793b@kernel.org>
Date: Wed, 25 Jun 2025 06:57:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: microchip-lvds: fix bus format
 mismatch with VESA displays
In-Reply-To: <20250625-microchip-lvds-v5-4-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-4-624cf72b2651@microchip.com>
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
 Foss" <rfoss@kernel.org>, "Sandeep Sheriker M" <sandeep.sheriker@microchip.com>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Wed, 25 Jun 2025 10:26:12 +0530, Dharma Balasubiramani wrote:
> The LVDS controller was hardcoded to JEIDA mapping, which leads to
> distorted output on panels expecting VESA mapping.
> 
> Update the driver to dynamically select the appropriate mapping and
> pixel size based on the panel's advertised media bus format. This
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
