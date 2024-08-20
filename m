Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C79583BB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE110E688;
	Tue, 20 Aug 2024 10:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hU4Bk/3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1607A10E0C5;
 Tue, 20 Aug 2024 10:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 74170CE0AC6;
 Tue, 20 Aug 2024 10:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FF0C4AF10;
 Tue, 20 Aug 2024 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724148665;
 bh=BpADP/Ry+du5JlYmwxVH1NvzPhRm4MYW1RLFt/IojHs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hU4Bk/3Aal4bz2q6+NryubNg5s2KrRiris1kQSXYzNWeJo8w81o05sa/jaxEiveso
 4o2a4Z/TKZ0vhO31JWaqeYYxt9qGa/An72iwLhHNgsrgGWSRedRW0oUxfcjxwBdczI
 ltNirI+kDcvaGYxEPHhYnRb08FqvcZzd1YZRD1expivNJ0TNtjG6ztpN0Fi/UClkZq
 3nFF11w08x5crm5xFJcB//7tjpQHH6U8qo+FyP1bo2Qq1dCMJZOGOLNQET4vdRbte3
 ujVhXZfemrDLVw/KoMSMx00QBh6JRetEDxjcEUNR2elgSfYt/k66S8k8fltSR1qttK
 XGYcaVtiYLWhQ==
Message-ID: <613c79a6-c32c-4c3f-b648-673529004e49@kernel.org>
Date: Tue, 20 Aug 2024 12:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm: Add submitqueue setup and close
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> This patch adds a bit of infrastructure to give the different Adreno
> targets the flexibility to setup the submitqueues per their needs.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---

This email doesn't exist anymore and doesn't match yours

Konrad
