Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B997DB16
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 02:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B71410E087;
	Sat, 21 Sep 2024 00:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cm+WOWxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDC10E087
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 00:56:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0FE4DA43E00;
 Sat, 21 Sep 2024 00:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A8CC4CEC3;
 Sat, 21 Sep 2024 00:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726880209;
 bh=lDJ009p2D/pUJQr1simWECFgi0I9G+uGt/YBTgsS7uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cm+WOWxGpGnZtBTiftR6hnhBsFi3I2Xb5pbMXl9fG8X2/MXb064sRRhBluWl720ep
 vNcNn9sQQ84V7L9gXHV1bYmV6utCRgday0dRL9JWCYyvAT3TGkitYxVjRGMpinDXiW
 CIXL0H4uCxgVzX21/OdGkFPPmBqRe01xWW0gkA6XRalEfQbDI/QsGwymX8Geyr4QIs
 ZF0uWIzR7r3j/TfGcNke4iStZqFELe8GcgOq7zEfktxBIB+YVWxsSMlL/u86r6E0mQ
 t7e3PFTC9Sk3MpapiGSdxT8INAjiXM3UbSl5QJ+vUrbUD2P+x80tTt7ycN4CcUlpL4
 LY5jIwAP9OCVw==
Date: Fri, 20 Sep 2024 19:56:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, thierry.reding@gmail.com,
 airlied@gmail.com, mripard@kernel.org, conor+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 simona@ffwll.ch, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-simple: Document
 support for Microchip AC69T88A
Message-ID: <172688020813.189327.3194453889234095156.robh@kernel.org>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919091548.430285-1-manikandan.m@microchip.com>
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


On Thu, 19 Sep 2024 14:45:47 +0530, Manikandan Muralidharan wrote:
> Add Microchip AC69T88A 5" LVDS interface (800x480) TFT LCD panel
> compatible string
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - Replace microchip,ac69t88a-lvds-panel with
> microchip,ac69t88a
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

