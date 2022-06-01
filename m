Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320C539FC9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D16110E3D4;
	Wed,  1 Jun 2022 08:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8AD3B10E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:47:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6709ED1;
 Wed,  1 Jun 2022 01:47:36 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6DC3F73D;
 Wed,  1 Jun 2022 01:47:34 -0700 (PDT)
Date: Wed, 1 Jun 2022 09:47:30 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entries for ARM DRM DRIVERS after
 dt conversion
Message-ID: <20220601094730.1fca69c1@donnerap.cambridge.arm.com>
In-Reply-To: <20220601041746.22986-1-lukas.bulwahn@gmail.com>
References: <20220601041746.22986-1-lukas.bulwahn@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 James Wang <james.qian.wang@arm.com>, malidp@foss.arm.com,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  1 Jun 2022 06:17:46 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

Hi Lukas,

> The three commits:
> 
>   36fd2a65bcaf ("dt-bindings: display: convert Arm HDLCD to DT schema")
>   0f6983509ea1 ("dt-bindings: display: convert Arm Komeda to DT schema")
>   2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")
> 
> convert the arm display dt-bindings, arm,*.txt to arm,*.yaml, but miss to
> adjust its reference in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
> broken references.
> 
> Repair these file references in ARM HDLCD DRM DRIVER, ARM KOMEDA DRM-KMS
> DRIVER and ARM MALI-DP DRM DRIVER.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks for taking care!

Acked-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Andre, please ack.
> Rob, Krzysztof, please pick this minor non-urgent clean-up patch in
> your -next dt tree.
> 
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ae685aaf8850..58e751b9346e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1510,7 +1510,7 @@ F:	drivers/clocksource/arm_arch_timer.c
>  ARM HDLCD DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
> +F:	Documentation/devicetree/bindings/display/arm,hdlcd.yaml
>  F:	drivers/gpu/drm/arm/hdlcd_*
>  
>  ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
> @@ -1545,7 +1545,7 @@ M:	Mihail Atanassov <mihail.atanassov@arm.com>
>  L:	Mali DP Maintainers <malidp@foss.arm.com>
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	Documentation/devicetree/bindings/display/arm,komeda.txt
> +F:	Documentation/devicetree/bindings/display/arm,komeda.yaml
>  F:	Documentation/gpu/komeda-kms.rst
>  F:	drivers/gpu/drm/arm/display/include/
>  F:	drivers/gpu/drm/arm/display/komeda/
> @@ -1567,7 +1567,7 @@ M:	Brian Starkey <brian.starkey@arm.com>
>  L:	Mali DP Maintainers <malidp@foss.arm.com>
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	Documentation/devicetree/bindings/display/arm,malidp.txt
> +F:	Documentation/devicetree/bindings/display/arm,malidp.yaml
>  F:	Documentation/gpu/afbc.rst
>  F:	drivers/gpu/drm/arm/
>  

