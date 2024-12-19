Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F839F786C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 10:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BD110E44A;
	Thu, 19 Dec 2024 09:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pF/ZpFsq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CA610E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 09:26:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E5354A41FBD;
 Thu, 19 Dec 2024 09:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9718BC4CECE;
 Thu, 19 Dec 2024 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734600403;
 bh=wQBDpaQjZCnkXB1BSxzjDxCu44KM8w6eHUz1UWCbX8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pF/ZpFsqzqxgfUYzrpRDjx7CcIorVOB+3825/Hij01crrh1Hktfc7ZV1TkSwmF88z
 jN1FR3//fW/IWmQMjWnXRfanH4jduG++X40SKkyvIb4NVaN7oqPKwPZ3YFkFh+MVfe
 uB+iHEJMGvEH3g3I3z8OHqwaCC9JIkbiDHa+ReLHkJgjrZ+2xUZR3D4pUavLA+9zN0
 HRwwHODU6Me/auBvBFHMDnLn8w9hFkBCPvYnS0ZmF+gG9Qn8ZiWqQX+t6TtrQSy2mu
 fHB03unpFBy5tiPUdPh1FAAwvPkaAQrhy+Wlxt4hYv97DQn19w7vc+j1Ima468MyFy
 dxzykNS4hbAGg==
Date: Thu, 19 Dec 2024 10:26:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: display: panel-simple: Document Topland
 TIAN-G07017-01
Message-ID: <qk5ib6vmm75wbf43cgux2bp63xkzsti4klngualgrsle5vhcen@6cy7s3jp7pma>
References: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
 <20241218-topland-tian-g07017-v1-2-d5e411c199e3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-topland-tian-g07017-v1-2-d5e411c199e3@pengutronix.de>
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

On Wed, Dec 18, 2024 at 08:44:59PM +0100, Ahmad Fatoum wrote:
> The TIAN-G07017-01 is a 7" TFT-LCD module by TOPLAND ELECTRONICS (H.K).
> Add its compatible string.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

