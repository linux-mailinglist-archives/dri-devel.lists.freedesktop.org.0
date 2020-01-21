Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B28144D54
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1C26FAE9;
	Wed, 22 Jan 2020 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C199D6ECE5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 13:11:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so3164234wrr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:subject:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mhGneesRMqca+G49CZkv9yFBdFGx22i2fZyrgZ2cdGw=;
 b=RwdomRqhuMOj43ismwGzp1Fn9myxOX4PmSiivmXLjE759KnCPFdq6kSqbtUq4Gb1AV
 LRL36IqyVwak5YFseCmqvX1cXovudgDifBWbdGBXO2YLke3b0GYT4zp8gEsBw6QpUfJ/
 DlMozGPqDqQ+MaMKCcTQEbZNYQzlN5/CgjtFvuxYmE8bC09gaNISw6vxB+5tVBqE8mjl
 SQtzYLvvE4H3yCHZaX6SrOVQJMN38MN56JqjVT68LiNpghq6pn0ld7PIIK9pnNyTVRgY
 gfsMi+JTRAwXAPvAwE30zKb5MpaT8pzvRO+ZglfQ1Xua3J4xULANYKk11lL2b9TOzFqb
 vqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:subject:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mhGneesRMqca+G49CZkv9yFBdFGx22i2fZyrgZ2cdGw=;
 b=ct5cQpW99DvwUVeGO6zUYE5OocULY5OodnAo0JQ4mz84OZ7a22gd9TcZnYTBPENNzu
 6qib/RC0IeDIdSdviH3zZFep+48iFgSYPRWLm3bxsKi6RmJHNHU8hx47E2/u74BUD0XF
 CbajL8Jg+6kR90PrH/Qxr3OeK1nmMhcgUbiAMA6zBTKmUhhIl/e5KdbKf39anhGmZCj0
 puOxbcAbhSDP37uLZpfN6ycCvguyBkNEUf0DYFDDEuRUqoCENprKR6t8c7SlbfG0eWMH
 FQWMyRXtzvARGD7TljDIpssLqABTdKf1llnea1qc/X+0z3bmPizUF4Shl6d7aBbaPLga
 mx9Q==
X-Gm-Message-State: APjAAAUnFjwelPtzb2Pqwzom+euW7vwCSSPQdFQP9RYLQnBrMFPBefaA
 RxUMaK0KAqy2E/LAZ9cZFA4=
X-Google-Smtp-Source: APXvYqy7hlBDQUa9WHN965x6FyXWEPReEs8xegXUSVTD5onpjUdQNV4o3/tnfrFGE4I4NWSoKssCgw==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr5353879wrr.252.1579612265353; 
 Tue, 21 Jan 2020 05:11:05 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c17sm52327271wrr.87.2020.01.21.05.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 05:11:04 -0800 (PST)
To: dafna.hirschfeld@collabora.com
References: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <dccee12a-71cd-efac-02ca-3668d10434c7@gmail.com>
Date: Tue, 21 Jan 2020 14:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 dafna3@gmail.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, kernel@collabora.com, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,

You are checking at the wrong platforms.
Maintainers incomplete. ">" is missing.
Recheck please.

Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml:
ignoring, error in schema: maintainers: 0

make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- menuconfig
# change in menuconfig to Rockchip system

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

make ARCH=arm64 defconfig

make ARCH=arm64 menuconfig
# change in menuconfig to Rockchip platform

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

> From: Dafna Hirschfeld <dafna.hirschfeld at gmail.com>
> 
> convert the binding file rockchip-drm.txt to yaml format.
> This was tested and verified with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld at gmail.com>
> ---
>  .../display/rockchip/rockchip-drm.txt         | 19 ----------
>  .../display/rockchip/rockchip-drm.yaml        | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
> deleted file mode 100644
> index 5707af89319d..000000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Rockchip DRM master device
> -================================
> -
> -The Rockchip DRM master device is a virtual device needed to list all
> -vop devices or other display interface nodes that comprise the
> -graphics subsystem.
> -
> -Required properties:
> -- compatible: Should be "rockchip,display-subsystem"
> -- ports: Should contain a list of phandles pointing to display interface port
> -  of vop devices. vop definitions as defined in
> -  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> -
> -example:
> -
> -display-subsystem {
> -	compatible = "rockchip,display-subsystem";
> -	ports = <&vopl_out>, <&vopb_out>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> new file mode 100644
> index 000000000000..e4ef1a02196d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rockchip-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DRM master device
> +
> +maintainers:

> +  - Sandy Huang <hjc at rock-chips.com

Add extra ">"

> +  - Heiko Stuebner <heiko at sntech.de>
> +
> +description: |
> +  The Rockchip DRM master device is a virtual device needed to list all
> +  vop devices or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: rockchip,display-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Should contain a list of phandles pointing to display interface port
> +      of vop devices. vop definitions as defined in
> +      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> +
> +required:
> +  - compatible
> +  - ports
> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible = "rockchip,display-subsystem";
> +        ports = <&vopl_out>, <&vopb_out>;
> +    };
> -- 
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
