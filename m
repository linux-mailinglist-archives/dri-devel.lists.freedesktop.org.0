Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD86EE628
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B079D10E7B2;
	Tue, 25 Apr 2023 16:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8810E794
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:56:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3FAA62D41;
 Tue, 25 Apr 2023 16:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B901EC433D2;
 Tue, 25 Apr 2023 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682441782;
 bh=22mPNmkUVHl+VVe7JN/fIv8NuIT+SW8vRSUhM5SEw18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YHazUVu7uEXa/CUAumf1vdTfPwZ3kOoIumXwpjEuAww5ie1isrYoXmTIeMKDTnX+1
 3/g2NnbxeyflDVxa48sovr5yskrHJTDf7W6+kwyF1aA826C6+1OFN0MpxHbCFpBnE/
 rAPNmhNyb0GMwrsRLb1A4Eur7t7MlXei+uD8VFBKfEt7AsS4jhwjoDZhnDhC30nNhy
 wVsn+zHStUxjYoaAh6nT+ImJSbKkaCtFqiCMEsTqMuX6yklP/o4LKHESBFF82JiLoC
 QX9qX1oKiyKPuRx/6Q4qw3adV/pjr/Vwxcsa+fhcPjWcBqZrC51UXV8fGnsL6NiXIr
 lzv7Nat3L2f5Q==
Date: Tue, 25 Apr 2023 18:56:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/exynos: fix g2d_open/close helper function definitions
Message-ID: <20230425165618.2ztg4mecuvpkdg3a@intel.intel>
References: <20230417210423.2517593-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417210423.2517593-1-arnd@kernel.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Apr 17, 2023 at 11:04:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The empty stub functions are defined as global functions, which
> causes a warning because of missing prototypes:
> 
> drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: error: no previous prototype for 'g2d_open'
> drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:5: error: no previous prototype for 'g2d_close'
> 
> Mark them as 'static inline' to avoid the warning and to make
> them behave as intended.
> 
> Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Cc: <stable@vger.kernel.org> # v4.19+

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
