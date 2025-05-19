Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7CABB6A3
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E3A10E301;
	Mon, 19 May 2025 07:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IcUSAhdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26010E301
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:58:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B83D6112E;
 Mon, 19 May 2025 07:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A761CC4CEEF;
 Mon, 19 May 2025 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747641527;
 bh=MRAdI24DJA2lIVS1amYwOksKI1lgkup8YiWAAYJ77h8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IcUSAhdk2V6GyCmet+XYBLjMm4Jq+zdV+cjIxH1Cyn0apTU95o4RTMZN7PW2A7sE+
 BKSYfH72KvM2YzeesS6GSsr7I4bMxVk1U/xLZbkLPKsGpITWMrXXMxO8hvz+FjEIlq
 gvfY75Fg3jNBjnNT3Tn1hsl4Z+V1VEZh5mX6xNVTGWyc38I+YJCZ8L3XoXWpYNs2BA
 ippzugo5F1ExUD4EGMcefuBUf7ksitROheeLCPQQmASXlXAnBgZ7isOkb2vWw2ykmM
 h0V1GD4I6SNwm/v7P1dzbwFVw46l/ME6zn+7fqRSGUkzH4M0VhgIPWe8w+bgvz/2h0
 r9jUvgj75TWpg==
Message-ID: <3d72e987dbd84da21ceb6dd9b83d043d@kernel.org>
Date: Mon, 19 May 2025 07:58:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 18/23] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
In-Reply-To: <20250425-hdmi-conn-yuv-v4-18-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-18-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
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

On Fri, 25 Apr 2025 13:27:09 +0300, Cristian Ciocaltea wrote:
> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
> helper behaviour when using YUV420 output format is to always set the
> limited RGB quantization range to 'limited', no matter what the value of
> Broadcast RGB property is.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
