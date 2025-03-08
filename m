Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876BA5789E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177EA10E1F4;
	Sat,  8 Mar 2025 05:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ix6KklKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0520D10E0F5;
 Sat,  8 Mar 2025 05:43:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9EE5E5C479B;
 Sat,  8 Mar 2025 05:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4043AC4CEE0;
 Sat,  8 Mar 2025 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412600;
 bh=vPGcIo+dX3lU5SKzUanCaLNZJi70a7dPvGebYotrBic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ix6KklKK61+5qR20kJBOLEDRiMmMcGmlqIoqN3pQimEZaueg+N+2BkzFlLnXUoNg/
 wKyaHV+uWtIMAYq3MUHH5XA5nSk8AY3VqbKErJVUJbZyAXYHKFr0r7Ad/fVml1KJj6
 rbTJwv28aMJm9UhT4Y9fJ5pZVjMa8C+SHDVpoY2ghH0Zsau/GrvaB9qD8rK8M/jP+6
 xDtmgGYj4BLZmP8jy1L0QGGJ6hlnYMHFaUILsKORfyPBxD5wA52RM97Blnv4WxvJkj
 WzsHNajL6A11Wx3FObOkr/nWq4d26UKnwmOSKa9MvuqgUrCoxJOOsMmlOzZHBpFxV5
 yD0ZIp+Xo5I3w==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Date: Sat,  8 Mar 2025 07:43:11 +0200
Message-Id: <174141256285.1924437.97313316814458618.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 07 Mar 2025 12:29:39 +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fix uninitialized variable in dpu_crtc_kickoff_clone_mode()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b9d131a098e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
