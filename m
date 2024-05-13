Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC348C41A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3A10E2E2;
	Mon, 13 May 2024 13:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GVOQ6J6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C9910E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:17:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E23FDCE0D8B;
 Mon, 13 May 2024 13:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C88C32782;
 Mon, 13 May 2024 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715606234;
 bh=sCQQdb5fu1AI/GGQpLevWmpW1G8ldkeo47pUNmNMP28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVOQ6J6qh9mPjnMq3qWXWlho7YHflOLaSR7O8ow4CyTYYKWE8VLxAuwgeNWUvnhbB
 lJHTadSnAkBn5dX3iQDDPYfwl8qEa253rLwbY80rMa6ltM8/CL90fDFQxsyO9WEIpV
 yIFYmDclZKObVEIt5Gc5FEtij2cLgxyKYBClMwdserwKoCcjhUapvYgMRGAbUWy/3I
 +V4XjklX7tXHR9liySEK4MtRskLrFbK5tDgx/bUnkD7AB0avM2xNxDR8vHg80WMof1
 YgwS3ipWEE7NYv9RmhOpWWmmnzg8S3tfOuQ3eJjWVhhxk36eiilob23X8S5/0yLHWw
 RxzmKIwNUU3Sw==
Date: Mon, 13 May 2024 08:17:11 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: display: panel: constrain 'reg'
Message-ID: <20240513131711.GA2419451-robh@kernel.org>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
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

On Thu, May 09, 2024 at 11:42:50AM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Cleanups for display panel bindings.
> 
> Rob, maybe you could take entire set if it applies? I based it on
> linux-next, so letl me know if I need to rebase on your for-next.

Applied. These 2 don't exist in my tree:

Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml

Rob
