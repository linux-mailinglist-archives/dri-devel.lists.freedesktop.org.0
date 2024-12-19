Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57D9F7869
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 10:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04C10E11D;
	Thu, 19 Dec 2024 09:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DKcerMP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9010E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 09:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5468A41FBD;
 Thu, 19 Dec 2024 09:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A4EC4CECE;
 Thu, 19 Dec 2024 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734600381;
 bh=O+s0wI5XwlLeA03oojhj5E9hxegvtSj2pJ/okjUIDFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKcerMP/LghMObUvAQiBvP4Aoz4LxA77Y4/bZdy/nPAcfOxbJwfrGRzywLzn5qA4y
 z0ehEySfmWDNxChckJthdPYkzhytlZgHOJBvQkErw/RypFeUegB/2jwU7ZWGlzfosZ
 zWMfnS8+eGzufO9qRltDenBuAmeL48XnK8Xxlual4/iY+T1ocORvM0N+RelY0hsgAY
 nhYs+W8SpZk9s2BN+o2Vd4DK+Wy6A+e7FmCfExR1QGQmrNXVJ7Vb4rD8tRR93ryZyJ
 xsAXJxy73Lk7IV86WHJ4fRQ7yqku7UtWHDfz8Yk14yRC7NffuMgXw0WG21H7DFNhdj
 drXdNrBfrlR9w==
Date: Thu, 19 Dec 2024 10:26:17 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add prefix for Topland
 Electronics (H.K)
Message-ID: <tp7qos4ezilczvz2mgeji6kxicfq4vaxsqmp3bij6nxptdom22@jbekrhq3zjbb>
References: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
 <20241218-topland-tian-g07017-v1-1-d5e411c199e3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-topland-tian-g07017-v1-1-d5e411c199e3@pengutronix.de>
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

On Wed, Dec 18, 2024 at 08:44:58PM +0100, Ahmad Fatoum wrote:
> Topland is a professional supplier of photoelectric display and touch
> integrated products from Hong Kong: https://www.topland.com.hk/aboutus/
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

