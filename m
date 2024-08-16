Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB462955303
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2477510E843;
	Fri, 16 Aug 2024 22:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rlgB+i/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0E210E843
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:02:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0AD6CE1FF6;
 Fri, 16 Aug 2024 22:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDECFC32782;
 Fri, 16 Aug 2024 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723845770;
 bh=C7weTXHP5DZBvZKNrnFze/Hiwgy5qiIv6X3bg5485vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rlgB+i/wdBxZDnIfAhM6wRJNvY7OgDrPc38z3dxY38q1grTJ8qJ15hpB5yxwbPRu2
 7tufqgtCoAjyOzZBJuYJCbtHykjrv4kug4OATK8qDplZ6T2xdO7JvqQ2Jb1VCtatqs
 tHYBcGhPpj5OQVnc3jOpCcdJ4eig5tZkhTQ6AKnCpD62H23JuiIMMS63kIzHQf8uoL
 hu8Yq7fL3cOZbmQ8yo0+1JZQZSmgnpw7hEDhyTsZ4Mddd6oW9NhGTFret8LeOU0exp
 YV9w/R4SMA1h8xl+xavo5eDbC6QgZHi3ERfbmPpS8aRnEctqQ+RfFZkVEbwI5eX9gr
 RHRQd+G1qCOFA==
Date: Fri, 16 Aug 2024 16:02:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: display:
 panel-simple-lvds-dual-ports: add panel-timing: true
Message-ID: <172384576729.2335127.2343168496385011708.robh@kernel.org>
References: <20240814191656.4035551-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814191656.4035551-1-Frank.Li@nxp.com>
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


On Wed, 14 Aug 2024 15:16:56 -0400, Frank Li wrote:
> Add property panel-timing: true to allow use 'panel-timing', which defined
> in panel-common.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> 
> Suggested-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - move it after enable-gpios: true' to sort the referenced properties
> alphabetically
> 
> Change from v1 to v2
> - add panel-timing instead of change to unevaluatedProperties
> ---
>  .../bindings/display/panel/panel-simple-lvds-dual-ports.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

