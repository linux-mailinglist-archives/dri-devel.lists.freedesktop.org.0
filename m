Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47694A10EFF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CB610E463;
	Tue, 14 Jan 2025 18:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eGomJ5Jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B4010E463
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:04:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1FD00A41A86;
 Tue, 14 Jan 2025 18:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCC5C4CEDD;
 Tue, 14 Jan 2025 18:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736877865;
 bh=xVfjWtlrO8bHi3kxJFIj7ZpHbHl4C6Xv548+3ow6/x0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGomJ5Jh61/dE9eo8rIuPo/jiVCcFR/i3/+DHKHscBWHw7fgIWl0OK0yKw1P2eM4H
 8OWnPUfOOYydCZeATqRkmgpPPMbUap6b5v3gflnmhf/CZFluXlBmHSTugzYXfDktZ1
 j3IkxGERbeTlQ8mbnXCVTqVjyrhDckWn++++eFBRFT0q7Flwk1FZK+Ebvhyj6L0fJL
 BcOk8/h1z8E+0mVGYpja9Ao0VhJ7/g2ggKxmNX1TESzBNd4DASWVuutinBJNgmZ/9E
 I74TMfz4/KuRUX7eARgnc2z+ZmfGWV8xlbX3/vKz0jn4tYAhck/v5NrW/TpX3qtVp1
 Tuyx7pWvnMBJA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 0/2] drm: display: Fix atomic check for HDMI connector
 disablement
Date: Tue, 14 Jan 2025 19:04:16 +0100
Message-ID: <173687783359.2391958.5213255793014816102.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110084821.3239518-1-victor.liu@nxp.com>
References: <20250110084821.3239518-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 10 Jan 2025 16:48:19 +0800, Liu Ying wrote:
> This patch series fixes a potential NULL pointer dereference when using
> drm_atomic_helper_connector_hdmi_check() to check a DRM atomic commit
> which tries to disable a HDMI connector.
> 
> Patch 1 adds necessary checks to avoid the potential NULL pointer dereference.
> Patch 2 adds a KUnit test case to make sure that atomic check succeeds when
> disabling a HDMI connector.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime
