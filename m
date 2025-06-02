Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AFACAAFB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E710E1E9;
	Mon,  2 Jun 2025 08:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ln79G2BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E802810E4C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:59:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DEFE2A4FED3;
 Mon,  2 Jun 2025 08:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC1FC4CEEB;
 Mon,  2 Jun 2025 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748854757;
 bh=XZCOsftu8I0Hs4VqzNzPuwv0qQ18wzBRVFxh1sq0q+E=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ln79G2BR6whNL3ck4KnCPm9lkcICN6K0trchA5/RYf5vAKbeKjkj1ihtlozSKWGNf
 FTARXIRzDv8ezskyFMq4ptzyrw2XZ1vNF246+KAVlVlWurHiM2U3Zlz4I9BxvCy+ws
 VB5gnQc9BNNbWMV2iMFvsBzd6G/Ibw0H724HV9UozZqMmAqvsfLb9vtfLTrR6qhoii
 fYHUqcabuH95NtYZS36XjO+53sliadhFkaiY7pgDsQegQqkeBWHLy8lxcHZnAX3mbH
 h21Lq9/lRHHLUBayiZKl7bDbw46gMP6NaWOEaQOvJyPbgnDE30whdcuITIDHKFg06/
 ds1n0d1Ch0S8w==
Message-ID: <46713012584b1d88c6e2e2bdfb418129@kernel.org>
Date: Mon, 02 Jun 2025 08:59:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 08/19] drm/tests: hdmi: Switch to 'void *' type for
 EDID data
In-Reply-To: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Tue, 27 May 2025 15:11:16 +0300, Cristian Ciocaltea wrote:
> Replace 'const char *' with 'const void *' type for current_edid member
> in struct drm_atomic_helper_connector_hdmi_priv, as well as for the edid
> parameter of set_connector_edid() function.
> 
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
