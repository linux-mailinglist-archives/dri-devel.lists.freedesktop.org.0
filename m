Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF5901F98
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEE210E28E;
	Mon, 10 Jun 2024 10:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uD6Ke5P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2228310E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:46:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9198C60A72;
 Mon, 10 Jun 2024 10:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6336C4AF4D;
 Mon, 10 Jun 2024 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718016362;
 bh=nrn7srJm+U4otPWZqCTdnxpvVVkgQwsjU2tQUJtYpKU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uD6Ke5P61mkZo6ApWgMJzh3AIZ2I4prdWX6Irnt6T+aD67mYzQAEeAz5v9AjxG/7j
 pEPG+7YtA7utHwRD2dSe3WC4ijl95ncugpd/0zIEoE6h2ePQ/NDjiX0Th4jjWNf3PG
 zkPhr9mNmzcSvfVVNRKj9Wk0WVsfQ/ZnHXL73AWZtHu1OWwtm3TQsceZznC82fVy7Z
 Cbssu/b8gpmr3QNK2NAZptZeXlteulCY5bqWSjslWFIKwdF4YMz3WrQWsUQMVTveBb
 hYfst3nwnq0N+8iIMK2VR1frTIea7u1Qv5v+qjvoCrws/soBAPL3NAHagGrO9+gdcC
 P0tI+DX5gw8nA==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240609-md-drivers-gpu-drm-panel-v1-1-04b2a1ae7412@quicinc.com>
References: <20240609-md-drivers-gpu-drm-panel-v1-1-04b2a1ae7412@quicinc.com>
Subject: Re: (subset) [PATCH] drm/panel: add missing MODULE_DESCRIPTION()
 macros
Message-Id: <171801635967.423417.5891299339124414288.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 12:45:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Sun, 09 Jun 2024 09:53:21 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-abt-y030xx067a.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-auo-a030jtn01.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-innolux-ej030na.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-newvision-nv3052c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-novatek-nt39016.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

