Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2589B3EF4B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 22:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788210E16B;
	Mon,  1 Sep 2025 20:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uon/TbGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4310E16B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 20:15:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 003764039C;
 Mon,  1 Sep 2025 20:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51ACC4CEF0;
 Mon,  1 Sep 2025 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756757716;
 bh=BpISnuXRoHphs/Si22tmOlulH/h93vcmCraxoKcBxDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uon/TbGiR6w+jJNwSY43krnqps/BBLfncX3UJkyev1ebLt/j/xOmrTM4HR90oq/+t
 9WthS+gpKVYgzO892d9eoUUaxQDWVprZmHNi/KEQM/6Jt7sa3a91Xp1t9j0BeYotv2
 qu22qxxAs3AFhfH5Wt927x1BabhH3Y3A7Vxf/uieSibMSQsGSAPp8uFi8W+9XpTc+s
 qW7nJeuwEFtmu0N66pazO+jh3Ftti901FOd9IWoIfw4984LBzTFVkSDnG6HJvvv244
 NEH7GzvCpvjo0mRVNm+SLZfeHo6uCrVrYhsNWkIdyrXzw1Wr35Ed9tUuuXDF8aX2qu
 KhP8y8OsQ/hlg==
Date: Mon, 1 Sep 2025 15:15:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: samsung: Drop S3C2410
Message-ID: <175675771483.268527.16420389338163835596.robh@kernel.org>
References: <20250830113238.131006-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830113238.131006-2-krzysztof.kozlowski@linaro.org>
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


On Sat, 30 Aug 2025 13:32:39 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

