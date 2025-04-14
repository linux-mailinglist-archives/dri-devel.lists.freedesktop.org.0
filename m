Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8BA8860D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BE710E608;
	Mon, 14 Apr 2025 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NGz6WlpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCB610E600
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:59:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1762560007;
 Mon, 14 Apr 2025 14:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02659C4CEE9;
 Mon, 14 Apr 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744642776;
 bh=JSlOKcGzOB2r3JhN4Ys1jzqMScEKUVnNyxWGTdDmiyA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=NGz6WlpBLaoZ46HmWPIZrFI0Aus97Xqr4/xOdQtqvh7k29vXfbWuw54L9jr3om9O2
 UgKILDwIYZOc7xiMjsUspq1PCM9I8+EnGb2ysEgOU2FXL1Td1hORw1f3GiieAlx++Y
 JJa522eeygG6XLYNPr6E/I3hIR8ly5mbCkV4i++5NtECB1uKJVZ1suu+By6ItNG2ZE
 ZF8MPlLCyUsmKohr3iLiov3Vl4PowQtmNwXY3tVQPfO/BfnjGHvAziqm+UJX57hQ53
 vFHmFk3P0IVc2R5sXZRBbI14EPz3BtFVQ8ntF1hijGwB9VYtDZJ/QbsMxD7eCishvW
 Q93qsc2opai7A==
Message-ID: <0b514c20a605ed6abd4b5b9bd925cab6@kernel.org>
Date: Mon, 14 Apr 2025 14:59:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] drm/display: bridge-connector: hook in CEC
 notifier support
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-9-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-9-04809b10d206@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
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

On Mon, 7 Apr 2025 18:11:06 +0300, Dmitry Baryshkov wrote:
> Allow HDMI DRM bridges to create CEC notifier. Physical address is
> handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> being called from .detect() path.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
