Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F58D7CBA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B47F10E0EB;
	Mon,  3 Jun 2024 07:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="it7kWkBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836B410E0EB;
 Mon,  3 Jun 2024 07:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56DE060C73;
 Mon,  3 Jun 2024 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFF3C2BD10;
 Mon,  3 Jun 2024 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717401013;
 bh=bQlI9YMS22qymPKDMk4SXp/XJcph5kSjXXhPH31SMjE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=it7kWkBNx425GZX9DlLNkdFDQEOHMB2O7V9ylBZd8A4QESV8J4/L/x/GezUCN7469
 uQMJcjfJx93n44wWQkGZZ1Wme4LAAUneYA/8CpyheDo4ixNxORqjQsGrm9jxciKpuC
 6Lw/eHBa6xrRAnNZbrF5saPP6qeq2322l8/MFl0LR+gy9SdBb2SbG73zz4uIyLsp1m
 gijbvJe51wcaX8Tj3/ukZE+36v6j4+tcOVwwVqEV7Zv8bvYlwlcFIANB5cLX4Vxrg2
 +mTCaJb2B5Jqyg0b1n3d0EdzbICPhKFrb1hMJliXgGebmy6mdzI+6MJtD9i3l8Sn26
 8lTyKBHFEGOKQ==
Message-ID: <f04da052e216872986251486c5d305ca@kernel.org>
Date: Mon, 03 Jun 2024 07:50:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
In-Reply-To: <20240531-bridge-hdmi-connector-v4-5-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-5-5110f7943622@linaro.org>
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

On Fri, 31 May 2024 23:07:28 +0300, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Turn it into the
> atomic_enable callback as suggested by the documentation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
