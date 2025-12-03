Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B77C9E1A9
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 08:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F20510E0C5;
	Wed,  3 Dec 2025 07:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QcvW4/s2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C8D10E0C5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 07:57:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEF6E4177B;
 Wed,  3 Dec 2025 07:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172B0C4CEFB;
 Wed,  3 Dec 2025 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764748648;
 bh=DmpitrsvxyJChA97MD5POh03xguTAl1o4n/K+C0KV1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcvW4/s22ujatGNYSRD/n80r8gZyk8IjqoFHbEDKhdt5YkO8JB2lw+eXCNKmJ1ANK
 Z1v6qnf8/q2C3TH8oAjoHVgWeY1cLyiAU6slFi/i5AenvGPrBNZxFuEw1c5cvn1XRa
 8VferID0XV20LeHH1I2jqD0u3HhpDLZFHshabw6MTPfQJLkJJWjfNEXlerzwZ+Vra1
 S37rnqTGRw14azCPr9oRSiz/faLVq4Lbvo61cheL5IaJxBMww9zQ2ch7PPS5yG13Qj
 A1QRqZ9bjXoHtgL3sRw2Y/P/xe8PXNfmXdFRYvNzbM4XqBnswgMBs794GLT5fLmo56
 cQNEkS4qA19qQ==
Date: Wed, 3 Dec 2025 08:57:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: robh@kernel.org, Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, devarsht@ti.com,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, 
 sjakhade@cadence.com, tzimmermann@suse.de, u-kumar1@ti.com,
 yamonkar@cadence.com, pthombar@cadence.com, nm@ti.com
Subject: Re: [PATCH v4] dt-bindings: drm/bridge: Update reg-name and reg
Message-ID: <20251203-caped-bullmastiff-from-jupiter-3dcaf3@quoll>
References: <20251126092949.298530-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126092949.298530-1-h-shenoy@ti.com>
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

On Wed, Nov 26, 2025 at 02:59:49PM +0530, Harikrishna Shenoy wrote:
> Move register name constraints and reg description lists to appropriate
> compatibility sections to ensure correct register names are used with each
> compatible value. The j721e-integ registers are specific to TI SoCs and not
> required for other compatibles.
> 
> Add DSC register descriptions to align bindings with hardware capabilities.
> Structure the reg and reg-names constraints as lists according to
> compatibles using oneOf schema construct.
> 
> Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>

Thanks, looks good now!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

