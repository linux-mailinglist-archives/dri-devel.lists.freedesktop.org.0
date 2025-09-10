Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C30B51030
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0D510E885;
	Wed, 10 Sep 2025 07:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMUjGtan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFB610E86A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:59:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E37B44819;
 Wed, 10 Sep 2025 07:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883C1C4CEF0;
 Wed, 10 Sep 2025 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757491186;
 bh=gHRPiMfD/P1RXxFuG3WCUYCOP8iCBS2qErNi8xfZIf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMUjGtanNgDMLjWGcM2/wQ7wr07ehIVgPSceSZXUquehEf2KqvAIPSO5EMggjg9uk
 hbpXJZWWWCpfXhw0LenaPqfUCAS87Z3EvN/xPv8k+3yYcQU4j3Z7h3Zo8tyl7gFITt
 YOEt7bCNeIMzh2tZlDk8yyi4Goavwxwwq5IN2Wm6RKClqOE2qx5FtDmI0i9AjCpYN7
 TH/M217lOlA7/J15RXpfhX/y68bWsTBAkZDbNW79f6J6ohVLsvl98Q+Z0Hxiq0crTk
 dwXDoMWNyvbZmtn1Q2xKQsU7qwjZZ01olNg1c9QRs3GCQIqOt+Q7MeN381lzNxDRhr
 PxiQO6WlSSp5A==
Date: Wed, 10 Sep 2025 09:59:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sjakhade@cadence.com, yamonkar@cadence.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, devarsht@ti.com,
 u-kumar1@ti.com, s-jain1@ti.com
Subject: Re: [PATCH v4] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
Message-ID: <20250910-silent-classic-vicugna-fdc1ab@kuoka>
References: <20250909054622.1439487-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909054622.1439487-1-h-shenoy@ti.com>
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

On Tue, Sep 09, 2025 at 11:16:22AM +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
> DPI/DP bridge.

Also, where is any user of this change (DSC)? Why are you adding changes
to the bindings which no one uses?

Best regards,
Krzysztof

