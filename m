Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0601ABB62D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FE410E1A0;
	Mon, 19 May 2025 07:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MK4lGIhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C210E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:32:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEDF861147;
 Mon, 19 May 2025 07:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146C4C4CEE4;
 Mon, 19 May 2025 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639925;
 bh=wmV9Nk3P/DCJitzLgR8F6v55Zaso5AOuu5tFLBo7mTg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=MK4lGIhgIA7t0kPZFhDFxk/bnDMtxlZX6DxbX+AUP57ZwsQ/HDu3ii1YzcO7+bHe9
 O3z5coaXV1Q7WaCS6cP/tYb2FQLl228LDgFoOqDpc/G9LKd5/eNG/BvMqNUu26Evkc
 28MU673SmN04cQ42rGSKUQroo29r2WiesLyUlndcHYxeDLtfnB3aIBeEb3BBmk7K6H
 dJGXctX6f6meMAQ2r4ducoL4UcMTRLbqNra48qGbE9d12tJnu22yW/YgB2VpHVjNgY
 /+6wdUAw7suw4fy7Kbci7SFbcAgk0ugZ20yzn8846IEUMj27znqfdz4Bw6qcQh6Oz+
 bLERKumvilvHA==
Message-ID: <c8d571f42923971606646dae0257f23a@kernel.org>
Date: Mon, 19 May 2025 07:32:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 05/10] drm/display: add CEC helpers code
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-5-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-5-35651db6f19b@oss.qualcomm.com>
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

On Sat, 17 May 2025 04:59:41 +0300, Dmitry Baryshkov wrote:
> Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> and adapter are supported for registration. Once registered, the driver
> can call common set of functions to update physical address, to
> invalidate it or to unregister CEC data. Unlike drm_connector_cec_funcs
> (which provides interface common to all implementations, including, but
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
