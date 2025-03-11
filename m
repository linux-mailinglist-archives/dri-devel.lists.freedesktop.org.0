Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D706A5C7AC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B9B10E5D5;
	Tue, 11 Mar 2025 15:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CEpYTsR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968C110E5C3;
 Tue, 11 Mar 2025 15:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BAB65C65C0;
 Tue, 11 Mar 2025 15:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCF5C4CEEA;
 Tue, 11 Mar 2025 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741707466;
 bh=faNtoBW2boCa3GF4XBiEqy0uua30voE9qSLT5TswaP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CEpYTsR/YO6P/QO2SGxhuaDPc6SCPR/pvCZIJJ53IRErPRB+fr0F9mq4lpoKbop+i
 8ZiNXX4gqB6BrnA0cwG8Wq/jjj8IM5l+uwOzBsaZpcD6fNTAT9wXOgspBMbGS/kRpW
 1mlGFv0cMr8gtnm8ftP6XAnwysBdrb5hkMGgT5YUcEXln6ehI78o0T0RrLLNiKtMJ2
 w++DChQUgCtb6X8jlYuoDINV2F/AXu8K+g6iqVHWFDY5QfiPquexxhWD3W2DM+jGRW
 JPU2zeT7xe6kg6uyBoSLGFhgS/ZcHPpeokQyn5hMdp28CrzefsEl6m6QLGtD/8jqhL
 GX3iseaDsqu9g==
Date: Tue, 11 Mar 2025 17:37:39 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 04/10] drm/msm/dsi: add DSI PHY configuration on SA8775P
Message-ID: <t2p4ysihumnknyq7p7ns4gy3q2t3cwxu6nzyqdweseckrwdcqe@lou5yockzogd>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-5-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-5-quic_amakhija@quicinc.com>
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

On Tue, Mar 11, 2025 at 05:54:39PM +0530, Ayushi Makhija wrote:
> The SA8775P SoC uses the 5nm (v4.2) DSI PHY driver with
> different enable regulator load.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry
