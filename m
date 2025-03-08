Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96665A578A1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBB610E1FE;
	Sat,  8 Mar 2025 05:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="blccUPlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2571010E1FE;
 Sat,  8 Mar 2025 05:43:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3B915C47FB;
 Sat,  8 Mar 2025 05:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ED0C4CEE4;
 Sat,  8 Mar 2025 05:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412603;
 bh=lvNTCquoZYOLdzB9Rda/Upj28Ljqn6eKuZ5H/y0HYfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=blccUPlJjQ5fUZrnnFy4BsUZWcIANLNXgj+t+/+5ezyO9zO4vj/rfNBQbi8Yn058h
 krWcPw5ooXABPzvywoDqJWxrtD//lBhvybvU5eSLXmOJZedxPnlCxOcHmlfwnj9mQB
 0mZdt+Lw6+ndNTDjKXDfmcoLMANL9y2+c2UU7TErGR++Cevz/8vu8z0Wu01SMVJhPM
 rc4tVhxiXGiz5GvPWq4k0iC2KeYyWwUCg/3e29lARzZPW7yvRc0s42gCcBXB/B3v9k
 CliKBOq2bHokpZz5L2LQnPN8IPk+zjGznt4kRJEMjY6hmlrQfe8UNUZ3D15P1uo5dP
 Edp+hbNr76plg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: robdclark@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Date: Sat,  8 Mar 2025 07:43:12 +0200
Message-Id: <174141256286.1924437.12866846639274689100.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
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


On Fri, 07 Mar 2025 09:50:30 +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2060a2db1253

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
