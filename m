Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCEA096FB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 17:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3510E077;
	Fri, 10 Jan 2025 16:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ors2iS9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE0910E077
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 16:17:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29DE55C482B;
 Fri, 10 Jan 2025 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F559C4CEE1;
 Fri, 10 Jan 2025 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736525843;
 bh=YvbumirxWILgmvy+inCR6UIp2Kf7DKZwj/fe/ZekRJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ors2iS9gsIACRja2hNd4mn1l82WgMyk8N7wsJpxIEDc/pbM14ZjDZQbBYkm8enK+L
 n2R9IX06fpSVI3Iu8ak9mKNShEVOS8CVvIdm0e9OtLlMw/FutakI3BZCrdC+hR8QbL
 XnOnLfZ6ljtERPdNfw9N613GBZrobS1tprB7UaSzw1n5mxDrgUULsc19JXqQaq3Sr2
 ShFhqWyTKiX8T8hVeoXcND6LiiEAvNgIY7TLvr5rCL2W6IBtp3zl2qf2u7fV1+dVoT
 4Exkv+brGTK6+CZ2pUR3SS/k3NMe0XkkqDTRbWE1f6iiz1cyiYxyW9rNY+z90WP4Lx
 8StihB6ryZmdg==
Date: Fri, 10 Jan 2025 10:17:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 kernel@pengutronix.de, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add DataImage
 FG080016DNCWAG03 compatible string
Message-ID: <173652584238.2975296.8031081380735324108.robh@kernel.org>
References: <20250109-panel-dataimage_fg080016dncwag-v1-0-0465603f6669@pengutronix.de>
 <20250109-panel-dataimage_fg080016dncwag-v1-1-0465603f6669@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-panel-dataimage_fg080016dncwag-v1-1-0465603f6669@pengutronix.de>
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


On Thu, 09 Jan 2025 12:34:57 +0100, Jonas Rebmann wrote:
> Add DataImage FG080016DNCWAG03 8" 640x480 TFT LCD panel compatible
> string.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

