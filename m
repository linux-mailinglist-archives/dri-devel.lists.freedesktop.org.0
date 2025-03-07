Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB1A55FA0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95DB10E26C;
	Fri,  7 Mar 2025 04:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X5VDSJvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544A10E25E;
 Fri,  7 Mar 2025 04:55:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A7885A4519A;
 Fri,  7 Mar 2025 04:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88E1C4CED1;
 Fri,  7 Mar 2025 04:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323356;
 bh=E1tGqBG4q3WyXmXJFf4A7lz3Msd3by1RgkwFKwYO8z0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X5VDSJvynweTliVM/mhd/EafcBxkNXlRSUkGExLFKCrd/35utULDpAU2pMWcX16pU
 O3vU9J3CFkj4cvc6wOAujv1SWfuDzxCk2P8AmqJGfdMyMfMNa4+0PiYIFCVW2lO/qQ
 0tHSBWCyFwQUvJs9kGRLa0nOLurZe00hVGC0A8mQBcp0T15xRe7+ke2edvG8GefcyR
 cediCSXU1FFfC4NI453QkMEI8Osvokwv1bd5Wpr92v+YFJVUqMa7FVcdrSAWOcGuaz
 9FFYUbgFDmkLgVJ58sgxK+RVHZe0NYqlfRmJkGu2t8uN0KB5YlVmS2240TnverfS7d
 KZk36pUJowqwg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Date: Fri,  7 Mar 2025 06:55:45 +0200
Message-Id: <174132271320.1132259.4482083694406886110.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
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


On Tue, 25 Feb 2025 10:30:26 +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: fix error pointer dereference in msm_kms_init_aspace()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9d1b528219b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
