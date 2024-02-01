Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2AF8463EA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D710EC21;
	Thu,  1 Feb 2024 22:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aejgf9iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A47D10EC21
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 22:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A22F8CE25AB;
 Thu,  1 Feb 2024 22:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAACC433F1;
 Thu,  1 Feb 2024 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706828319;
 bh=J6+XAazfq8OI3ywEXe3H0Aa1Rt570MhNrUUKWp85JHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aejgf9iVT8l88D/qVvwS4KS5hF/AXyC5GpnMO7K2KmMw2d/www5MgUpHyjpYfkakN
 QFVnBJgy3N9j4zGIlp8Cdk0ykzGmPOjq7TzqjtCVwj+FzKqM4mx1mFDb19Okj15b+O
 fInXLvNmEoPHYEbmXvvxI7sYOQ9SwEIkrhm2VVrRXDFMrH4yqrI0VqGbMAFkrM014z
 T9zxu38dFBwVdzusB7pJzhcvNnP6xshY0HY/oVn9nEPG0NcXH5KHQCOrGkfQCs3N6y
 Zjx+pcjzzrvtHJ/zFps7ej6C9ke46aGOD19xi58QPEZZslwFHx0o1Dh0z1BGJMLjwp
 olYJeAuesGZdg==
Date: Thu, 1 Feb 2024 16:58:37 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: tzimmermann@suse.de, markyao0591@gmail.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 devicetree@vger.kernel.org, airlied@gmail.com, heiko@sntech.de,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: rockchip: rockchip, dw-hdmi:
 remove port property
Message-ID: <170682831660.1899746.18090191904658752173.robh@kernel.org>
References: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
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


On Wed, 31 Jan 2024 22:14:29 +0100, Johan Jonker wrote:
> The hdmi-connector nodes are now functional and the new way to model
> hdmi ports nodes with both in and output port subnodes. Unfortunately
> with the conversion to YAML the old method with only an input port node
> was used. Later the new method was also added to the binding.
> A binding must be unambiguously, so remove the old port property
> entirely and make port@0 and port@1 a requirement as all
> upstream dts files are updated as well and because checking
> deprecated stuff is a bit pointless.
> Update the example to avoid use of the removed property.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V2:
>   rename title from deprecate to remove
>   reword
> ---
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

