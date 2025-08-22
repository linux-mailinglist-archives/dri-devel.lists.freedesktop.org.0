Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43AB31C88
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371910EB3B;
	Fri, 22 Aug 2025 14:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nEyjKluO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001ED10EB3B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:48:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2C792A588E5;
 Fri, 22 Aug 2025 14:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DFBC4CEED;
 Fri, 22 Aug 2025 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755874105;
 bh=LkKrp7CULRzpmB7Oo+nw2+h0gNYKA+9aLRXVU8vBOEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEyjKluOkgPROp9org1bWv32L7DJPVEJYdQ6Ysbpp2Eby0GVIzUqNasQ2XqCHzxgP
 EqDJ3F2OSNWoxEeRrOKHK46REihwzbojKN6bQlhw3hJYmP6Jyi+j4ATwzTQl5dM5yx
 Kh3lkC9RI1LKITFhDQIGsapQ8X5xe30RxswppV6d9FtDF3bZ/4KaM6r7ISJCiW99Ij
 OOGgqdJnpwnvu1wHE9feHPL7Nm5qRwACsW33jbcNjGWNC3neAZFsCJyThMq2pDb03g
 7h4sqO7ipnzbPCAW9OWM5+uxpWG/Lwhbg2EcT0zFErkzhXfgo8YtLuvN1JTWjLjB+h
 PfM+3grNyiFqw==
Date: Fri, 22 Aug 2025 09:48:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Robert Foss <rfoss@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, devicetree@vger.kernel.org,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
Message-ID: <175587410389.3790335.14225691250888377466.robh@kernel.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
 <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
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


On Wed, 20 Aug 2025 16:17:37 +0200, Krzysztof Kozlowski wrote:
> Device can be used over I2C bus, so it documents 'reg' property, however
> it misses to constrain it to actual I2C address.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

