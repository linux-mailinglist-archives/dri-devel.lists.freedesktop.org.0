Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56FB901D18
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FF110E372;
	Mon, 10 Jun 2024 08:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C0r+3mVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3E010E36A;
 Mon, 10 Jun 2024 08:39:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D10C60AB8;
 Mon, 10 Jun 2024 08:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E335C2BBFC;
 Mon, 10 Jun 2024 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718008794;
 bh=IVgr4Lg50VrbVkuyXy975ptx5KVagoNyzgIsSR4Gwcc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=C0r+3mVR9h65sNZw2h/PtmQvmfCv0OL3koJTZfCen/Pv8HNmOnHwoSdRX2Q455Sje
 PtEb5D8ZUFHobDYBBVYzPzbuWWT0Fhs9MCDtnFrLpj0mEAnJkioJ+AfvEyDNxzc/9A
 E2UG3R1PsbLebPwlsmYmai01CycCRbrQy1h6A0IFh+wmCmguf8qTCgI/nhw0w7oKoO
 rRDRitS3ldmUQUMS5uzsSNlBayjLYO3gZLsQak7PBA/VAmkituavAThbVBCUBVLavA
 d5clubbVLcN9XnWBFBH6cHoMGTEraiI7tYU7+FjyrYA7eCX8D8W9Q4M1ry6v3GkxLs
 XHbqAWAwJibiA==
Message-ID: <da82bfcfce841103980500b0960d2da1@kernel.org>
Date: Mon, 10 Jun 2024 08:39:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
In-Reply-To: <20240607-bridge-hdmi-connector-v5-9-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-9-ab384e6021af@linaro.org>
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

On Fri, 7 Jun 2024 16:23:06 +0300, Dmitry Baryshkov wrote:
> Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> 
> While the HDMI block has special block to send HVS InfoFrame, use
> GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> that requires manual repacking in the driver, while GENERIC0 doesn't
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
