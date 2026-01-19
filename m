Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D2D39F79
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3E10E0A1;
	Mon, 19 Jan 2026 07:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ai8sspHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F8910E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:15:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 141CB438BC;
 Mon, 19 Jan 2026 07:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649D7C116C6;
 Mon, 19 Jan 2026 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768806948;
 bh=OoDKLuO9dujTB3nEG6ggwDbl9L3FIdm98JZoLWi0wlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ai8sspHBuqCsqimm0SCN9Ogy5bdEha5gyxMmkExf+9C6BLDpE66ZOsVkWYmh+fTmy
 7ypWPfoQOzcMFUFlREdtpMqeSb4e8EBbH5yE0hQ4UfVBhwX+jawr/3Bmq7peEt1OiE
 dCXzbJVJEqamJB1ZCR0t8p9dSmwUYavg7rqKzvHgft2+4//hYDJ5A0b+aT5HN5d1jj
 CmR5X4N5BXSBrFlCcmwlNxxEIfZVsj3UdHCmJHeBAAS9iAfhDTV6CY8DGtrWrz6g1y
 yEVGYjuZ+JmjOQ6Sd9IkcZl0xlhimkt8rvMZ2euOj1SHxRBq4zFRChVKtllQ6yxTFO
 FBAzJ93oou01g==
Date: Mon, 19 Jan 2026 08:15:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org, 
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com,
 linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Message-ID: <20260119-annoying-eel-of-election-ef4be8@quoll>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
 <20260119033035.57538-9-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119033035.57538-9-bavishimithil@gmail.com>
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

On Sun, Jan 18, 2026 at 10:30:32PM -0500, Mithil Bavishi wrote:
> Add samsung-espresso7 codename for the 7 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

