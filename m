Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6728D7CC2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0272110E2EA;
	Mon,  3 Jun 2024 07:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZHEKvoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9B10E2E4;
 Mon,  3 Jun 2024 07:50:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4FCD9CE0B15;
 Mon,  3 Jun 2024 07:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC58CC2BD10;
 Mon,  3 Jun 2024 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717401040;
 bh=vPuSoLpsoPv1fgo3ne/M8R9du/neO5GYC/OOGK76npY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=XZHEKvoaFfAxmESMIoCHL5iHZqZxd2CFNdo8ZiNinZgIHMOag0Jw0duqJjPQeruht
 /feg5FqwREbA24rNLwYINyNW5lHKBBoDyhgVKK2OiVLgaH+TrMV70XiGviHC2KGy7g
 XIijAJDcEwsbbOzBhcPF01lAqXCorX3ld6RNFTf1hjqCeBfECLpwI7wm1GFWOm8Pwr
 xDpMXM0PFOc0Swp+U6DZPf4e/45+uMCbeDBlr7P9Kch+joXQZXe1+S9qLXdWMYC4Go
 KGDv/8Bju/ukU9Z+n72IWCvmvpt0/pYGPnV6eBvoi3P0UsB3mF9CGPO4fsXj1HTriH
 a3+FVtyG7+BMQ==
Message-ID: <53746adf592a721f40d3c8f4e846ceba@kernel.org>
Date: Mon, 03 Jun 2024 07:50:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 7/9] drm/msm/hdmi: get rid of hdmi_mode
In-Reply-To: <20240531-bridge-hdmi-connector-v4-7-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-7-5110f7943622@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>,
 "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 31 May 2024 23:07:30 +0300, Dmitry Baryshkov wrote:
> Use connector->display_info.is_hdmi instead of manually using
> drm_detect_hdmi_monitor().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
