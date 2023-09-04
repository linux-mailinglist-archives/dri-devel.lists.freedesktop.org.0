Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDB7912A2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886310E2C5;
	Mon,  4 Sep 2023 07:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528C210E2C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:54:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08DE4B80DBC;
 Mon,  4 Sep 2023 07:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DACFC433CA;
 Mon,  4 Sep 2023 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814092;
 bh=xc2YozwhEL1/YHfZS9+Y6217G0tcKGwiBjaWl0K5Cyk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=jKFwPbfSBENdrDNjfQ8bpT1Dix0QCVFSi5ovbrgJS0uEVftPoNyXoUuP6gVc9JunW
 FHGntM8knG/xiqDkWNCs2cyl3eqPYwm0MqApy2EWxZqYFItZ231AtG+GYiTzaus5Z9
 CL3JV0sbNTvw+oytnh6OtoqVZjB+qbhDnZmKex3uq9ym3hakXR1HyL1trh0iOBgYG0
 BL8IBJUYCFPS//OQ+OgdVDkCD35Hd9RNIuiXg0VRqqaz6GXuQ5esDAUBCuUSmyJqSO
 gv7QrMhn6gM/bUDaK/+6PF9HJGdh6qqK1W3og5GwMglhsxPp9q/bWUrSUE0cL4a8eD
 39zB18X/OK3yQ==
Message-ID: <22638b6d731fdcb29367c90461cf0154.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:54:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 11/15] drm/exynos: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
In-Reply-To: <20230901164111.RFT.11.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
References: <20230901164111.RFT.11.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Maxime
 Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:22 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
