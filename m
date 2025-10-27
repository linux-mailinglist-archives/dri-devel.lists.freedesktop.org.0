Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42494C0E371
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FB810E4B0;
	Mon, 27 Oct 2025 14:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KSINh/R2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFC510E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:00:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BD81432CC;
 Mon, 27 Oct 2025 14:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAF4C4CEF1;
 Mon, 27 Oct 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761573653;
 bh=cI5UkVL9m1fqP/3JizSr2bZRNqQZcgW7vO6CVyE+9Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSINh/R2b6K7gZt5irOCjtem5/v7uYotuid7sjdJj8puKg2oqclwuQ7a9Zy9NzEKz
 xTX3fdgYsaqv2duSGgpPY845Yd6q2Cq10b9O6brBVkSPds6exrqdKbTcc0+E8Q2yRi
 vBUy79UV6ckACiS7f2ZAGNwWbsrY8ITNuQGrhwS7PuAee6Fg+XGPIsMOP3NdCw+ZVC
 rUqLESPU0DSewSjl2kW16iHsA9x2m5rY94hisKWwHsB2dgKG6hkfEAgRguDLbgSAQj
 MW61LctI+aeC/FAS8H/Wb61Ri5NgOBZwddAp8IpFZ7KtHUS80QI/qQ1Ww47gdqPMjU
 OcdCbE16Ja+Fg==
Date: Mon, 27 Oct 2025 09:00:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <176157364786.341627.9808596288039785278.robh@kernel.org>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-1-8f8852e67417@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-s6e3fc2x01-v5-1-8f8852e67417@ixit.cz>
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


On Thu, 23 Oct 2025 22:24:25 +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.
> Remove it from simple DSI panel definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/panel-simple-dsi.yaml   |  3 -
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  3 files changed, 86 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

