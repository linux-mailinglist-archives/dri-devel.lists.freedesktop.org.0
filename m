Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C854EE40
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 02:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB1410F6AD;
	Fri, 17 Jun 2022 00:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1E10F64B;
 Fri, 17 Jun 2022 00:02:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EEB1B82685;
 Fri, 17 Jun 2022 00:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4114EC34114;
 Fri, 17 Jun 2022 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655424144;
 bh=WNWSMCR6kMKCT8Lah0iyiGB+iQKBw5vkV13FcXm2+h4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PpbFUKUM09OJQhDucoAN6cA6N69t0R1Wy7GrqioQMhRKQLaAeCHmwxVESLaUNUux1
 EJJTUN/HvE89Pn1elln+TC2v8mse38pBoxXjBgtXIaTw7wlJ9B5Da92Zfj3Q+Qp9K9
 xUvtCjn4lHemORO83jKvVDGWSiIydGpB0Ov2CcVRRolzO1LMj05bNM3weApWLjnN3r
 lPRwOyGNCT5CBqRBbuz3lJM60L9hLho20711irccc9ksbAvwcFECeCD5ajVakWqH9u
 J2kV8gRkE2Up8xnfuvOuUdvqBKegFszzaTyIIr5X+6p1XBJoSJVHBG51kSf/dOj0DK
 RimX/no99Vb5g==
Date: Thu, 16 Jun 2022 17:02:23 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 0/3] eDP/DP Phy vdda realted function
Message-ID: <YqvEjzgSbvrOCFtq@matsya>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-05-22, 14:02, Kuogee Hsieh wrote:
> 1) add regulator_set_load() to eDP phy
> 2) add regulator_set_load() to DP phy
> 3) remove vdda related function out of eDP/DP controller
> 
> Kuogee Hsieh (3):
>   phy: qcom-edp: add regulator_set_load to edp phy
>   phy: qcom-qmp: add regulator_set_load to dp phy
>   drm/msm/dp: delete vdda regulator related functions from eDP/DP
>     controller
> 
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 ----
>  drivers/gpu/drm/msm/dp/dp_power.c   | 95 +------------------------------------
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++----

Please rebase this to phy-next and apply to specific qmp phy driver...

-- 
~Vinod
