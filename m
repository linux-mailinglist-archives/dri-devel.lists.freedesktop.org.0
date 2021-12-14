Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D813747463C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90BD10E557;
	Tue, 14 Dec 2021 15:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96210E552;
 Tue, 14 Dec 2021 15:18:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 236DDB81A76;
 Tue, 14 Dec 2021 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9D8C3460A;
 Tue, 14 Dec 2021 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639495117;
 bh=xA4qErAYFfQZoMVAgqmgJanxkAG/Pa06aExW8DKib+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YdAF4vm+BGbwsTBNyD1SZIwyVqUjVeVO51lj2mafBgIGLDN5Gt+cqE5gxxaI+AZ0A
 JKGOfQsR73R+3MzpwP0IKcA0ztSfXU03oUS+66zUeKSU4A/BFTjaHKXxH5BvHO/xBG
 m/Rh6zc67ghxl5e+1lm+JV5HTNA11O/ed+dONdV9EnEvcKK2AC9apEUf9g9BP8/L7E
 cfBBU9Jm0quW8ILPZaaCJVh2JJt4Kaa0r9PHUpSydBMvcUmW47hN+Q2S72HKZJ/KKx
 JHQplMxt/v/U7mGqO/W6eXnC5vred/UOIfkvQHBa/CDhrsacV05TM1GdkwcaXx4fmu
 g/V5wU0WWTgEA==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix TTBR0 read
Date: Tue, 14 Dec 2021 15:18:15 +0000
Message-Id: <163949295159.2865133.14830318061014713865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211108171724.470973-1-robdclark@gmail.com>
References: <20211108171724.470973-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 kernel-team@android.com,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Nov 2021 09:17:23 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is a 64b register, lets not lose the upper bits.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Fix TTBR0 read
      https://git.kernel.org/will/c/c31112fbd407

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
