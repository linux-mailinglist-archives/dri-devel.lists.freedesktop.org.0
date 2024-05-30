Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F38D4808
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9899611AD68;
	Thu, 30 May 2024 09:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O23mOYk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D796B11AD68;
 Thu, 30 May 2024 09:05:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C800CE1A6E;
 Thu, 30 May 2024 09:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA16C32786;
 Thu, 30 May 2024 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717059900;
 bh=58FOPhDGg37DCL3uM5t+hUaE4DGFtdvOm40IzQDdEe0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=O23mOYk4WWzsOCev8z14+dawmroIIeCufXyf+6euF96z/TJFm+06YEwTnOtXoFQzJ
 7QUZkpY8xYAhjL36iLjIUbkzBLQRR8qzvNS5ArqzgmhwAqdQDtSzZY/z36IoVYxkND
 zan/dRRgAInLmzkaOxJthGwSEgxko1KgLr6KgiQSk/0XihdpUiJJbX7nrdlogcdr/a
 3iD5+kpX+AW+NDk5knxn3crB4NzukoEcUTLVKfx/A6WDVkTEXjuxVLbNmCGAcHLMhf
 OFZnRML6JXHCPg6svrXTlgeLR5b6AhBxcy8CeYar+JypYZ5Iix3fDbpg/hsmd2c5wh
 dPd8MnZjBrOrA==
Message-ID: <116e3e2d57d20833fb2b7ae5ac23d9c0@kernel.org>
Date: Thu, 30 May 2024 09:04:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 4/7] drm/msm/hdmi: switch to atomic bridge callbacks
In-Reply-To: <20240530-bridge-hdmi-connector-v3-4-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-4-a1d184d68fe3@linaro.org>
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

On Thu, 30 May 2024 02:12:27 +0300, Dmitry Baryshkov wrote:
> Change MSM HDMI bridge to use atomic_* callbacks in preparation to
> enablign the HDMI connector support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
