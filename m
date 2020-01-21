Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C0143EDD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 15:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9C6FADD;
	Tue, 21 Jan 2020 14:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586356FADD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 14:04:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BCA024653
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579615450;
 bh=RhQe3QXk/zDnaa/l8gaC+5yGDQC5asHgWocfmrxWn1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1h80Vw8QVXNxd4n7JvcbaRtmMqeKqWrPnqDFhed291FPeuclaS2/d8/YMXBSivp0t
 50gwjSr2Arq5PviP8O4Z82+GAU9E7DPIUT1b7Ird9NO822POQHM2jNX6tqA35blkzk
 YPhyPq7t2X3GibQafNCYUvZ75qhPe24PvGRpGr/E=
Received: by mail-qv1-f48.google.com with SMTP id y8so1465455qvk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 06:04:10 -0800 (PST)
X-Gm-Message-State: APjAAAVMsA+1vKcKY0TkgLdI3TPn1Z5qpjsfj7C2DUvovSS7837KBwXc
 MXMZaUID0FOef5YUXTcK//5d2YIIQws3oOWU7Q==
X-Google-Smtp-Source: APXvYqwJp13n5rPTJJDOXfMUKI9hXM9vs+rUXNz1Y5Q8u6qz7eER6mpKwoqon55uA3F4Uxi8MfmUkTp8hNPqSH0uU+Y=
X-Received: by 2002:ad4:4511:: with SMTP id k17mr4650910qvu.135.1579615447751; 
 Tue, 21 Jan 2020 06:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 21 Jan 2020 08:03:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJv-gXOK=80nqnO0TB1P-+1+E_vDaN3XSymKQfSLVTBsQ@mail.gmail.com>
Message-ID: <CAL_JsqJv-gXOK=80nqnO0TB1P-+1+E_vDaN3XSymKQfSLVTBsQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dafna3@gmail.com,
 =?UTF-8?B?6buE5a626ZKX?= <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Helen Koike <helen.koike@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> convert the binding file rockchip-drm.txt to yaml format.
> This was tested and verified with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

Also, make sure just 'make dt_binding_check' passes as that checks the
example against all schemas.

> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Changes since v1:
> - fixed worng sign-off
> - fixed the path of the $id property to be the path of the yaml file
>
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
> -       compatible = "rockchip,display-subsystem";
> -       ports = <&vopl_out>, <&vopb_out>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> new file mode 100644
> index 000000000000..538898ada9d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Do you have rights to change the license? The default is GPL-2.0-only.
Looks like Rockchip owns the copyright.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DRM master device
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com
> +  - Heiko Stuebner <heiko@sntech.de>
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

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible = "rockchip,display-subsystem";
> +        ports = <&vopl_out>, <&vopb_out>;
> +    };
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
