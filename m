Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7495A578A9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3406010E2DA;
	Sat,  8 Mar 2025 05:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M+S43vSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA58410E2DA;
 Sat,  8 Mar 2025 05:43:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85EDA5C4067;
 Sat,  8 Mar 2025 05:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD3EC4CEE0;
 Sat,  8 Mar 2025 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412615;
 bh=DQb89z/nE0fxb6tMyYAAm0zPP7SNExW1V/on/pfCtoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+S43vSJNdcC9Z1R62zb4K03hXsqOzBjdVryjy/98O0tBXVSw+L1sE7V/xe3JqvjC
 tAWCi8p7miqA/wCk5M0TRJ876UMESTE0oGN99Rw5/ceSol/iAYkw94YUukjGvF80a4
 TzOAn0OsyvTCjeFqVbeIbbkH8a16F5Jra8Z3OuimQ4EAiG6ByUSNB0gGaqZ4AHHXvA
 SzSmfkz8bk3HTT8N5+vM8Zn9Lt7lXgz3EdZGmo1ioQV/iuoCPNB4R+tc5VmWuqEVVP
 OZdlQImVRNrsnCZk0cEJDxUlKWbshR/EtKzuVzDXC36aQfR7byj+8BPFuqKIgsb4e1
 UpOEg/717qe9g==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Date: Sat,  8 Mar 2025 07:43:15 +0200
Message-Id: <174141256286.1924437.6620369069852592646.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
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


On Wed, 05 Mar 2025 19:16:51 -0800, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1cf5cd92a20b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
