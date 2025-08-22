Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE3B3206D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 18:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A7D10EB6B;
	Fri, 22 Aug 2025 16:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qiYmya6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCE10EB69
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 16:25:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE0C9409C8;
 Fri, 22 Aug 2025 16:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A242AC4CEED;
 Fri, 22 Aug 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755879912;
 bh=8CXwgL/+PbdFXIfwkA92lYozok0rqy+77q6MtFphVrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qiYmya6L8kNHYERlvmgxjCRxpeVdqscnoIDjfqOoXEDB6Ox4pFLHW63cJqp5CzjnR
 sFVDxiFSH6mnPlPKZMr5Am+Lr4PqPcZWQFNCbcXXvcLEhvy+aT2h8n1sbDdzMbAFp1
 0uja6NqHnM8R+UmJmxAc1GmNq0d8KqMoulJXqfUO4NXr1p6TJ8GOC8NV6i7EwRta83
 g3djrXMLHcbBxp/RQjoFzqiMtQa/3gm5bon23Fztec54T3sGqm9or6l288An5U1sHy
 JMNvpGgabEf3B9K3EAe4BAUgv9E9Xz1eYLTyxAAB7nd1M9KII30dbCO1pQTArpqEwe
 pEeh1W/GaqzXw==
Date: Fri, 22 Aug 2025 11:25:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology
 Co, Ltd
Message-ID: <175587991149.3969185.13763012454689940665.robh@kernel.org>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-1-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-1-b492ef807d12@pengutronix.de>
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


On Thu, 21 Aug 2025 09:55:28 +0200, Steffen Trumtrar wrote:
> JuTouch is a chinese touch screen supplier dedicated to manufacturing
> high-end touch display products for the global industrial market.
> (www.jutouch.com)
> 
> Add a vendor prefix for it.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

