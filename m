Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E377CA618AE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B6010E361;
	Fri, 14 Mar 2025 17:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l6sK7ieG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369410E361;
 Fri, 14 Mar 2025 17:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC571A4874F;
 Fri, 14 Mar 2025 17:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE4AC4CEE3;
 Fri, 14 Mar 2025 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741974857;
 bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=l6sK7ieGocpcw/pza85frnO0i9kO+vU4VfI7L741J6xa2xf8hMS10QC/pwEdA/k1Z
 JbXb4RHhXzvnoqi7m4F3t7XGKYsW6muYPPyes5EvfUozYbXtjqwDa+xqsWLtex6XXc
 wF/iKUNERYd6/Hl5AHzWP4hooCs8f8/R7AIo756q0u1Qyf7NQAb+Cv9l8bWGLHC+MC
 Ae/FcMfiUZBxIjU/0Q84DB0U47SsD/7ht55s4g92NAGNQh6xu+6Df95DrI6Zr1BXTd
 FZ+5ALITjJ7h8HaB4AhD8amhsw9Oqvb0Tw1rhP6RLresD4bjrKZ+gXd6MgGHPY6dfh
 Hq656x/xSY6Ow==
Message-ID: <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
Date: Fri, 14 Mar 2025 17:54:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
In-Reply-To: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hermes
 Wu" <Hermes.wu@ite.com.tw>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sean Paul" <sean@poorly.run>, "Simona
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

On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> It is common for the DisplayPort bridges to implement audio support. In
> preparation to providing a generic framework for DP audio, add
> corresponding interface to struct drm_bridge. As suggested by Maxime
> for now this is mostly c&p of the corresponding HDMI audio API.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
