Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6265E8EC7
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 19:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE64510E00D;
	Sat, 24 Sep 2022 17:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2264E10E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 17:07:46 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 h1-20020a4aa741000000b004756c611188so505319oom.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 10:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+aVWlf6unPZIMip47jgs/Fu16FdIOtjElNTUIzQmT8E=;
 b=EVFL9GRF87cH/jaSD/3zVBUAgsx+h25krOmRAiJAaVRgXzgPzRDJ7DyUE3r76NEkwm
 fm0W/Nv+U0zc+lUQKtZaAwKWxeQgLbyXMIvETIwImLb8dpWapoL+9KzGStQX2FOv6O1R
 hr8oM/2b3s6600lD1M55tZyEmnbBRmmsJtAIqRVMx1AeiSQzABakQ+c2d+LcMtdrBT0Q
 C8eS0HQZDIuDHMg7ndNXvcFxp0YTseD2QxgwVXgKkCqRJ8UnI3GP7hpvlKGwZmca1w1P
 2gYn21NtejlociLdrtKf/7zZziCg3RnR6cqG7VviIWpD37OQ6LfZtnDZK4Vn5//tvca9
 0YZQ==
X-Gm-Message-State: ACrzQf1fSmptR7rx+BnB8O1gYafqBU8QIwBrEbtd+M1Q9zS/Z2x31phn
 0ydkzmaORm5bsy7wkFR3iA==
X-Google-Smtp-Source: AMsMyM6KWD4IthwY8oAOVKWKUXbxXXc2IO72af+iBQ+GgkE9q6WVvIcTRB0WqPmfyzvnIp6HBIUaIA==
X-Received: by 2002:a4a:928e:0:b0:476:6c03:f0c5 with SMTP id
 i14-20020a4a928e000000b004766c03f0c5mr123173ooh.78.1664039265186; 
 Sat, 24 Sep 2022 10:07:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m32-20020a05687005a000b001226d2100f2sm6681709oap.33.2022.09.24.10.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 10:07:44 -0700 (PDT)
Received: (nullmailer pid 968363 invoked by uid 1000);
 Sat, 24 Sep 2022 17:07:44 -0000
Date: Sat, 24 Sep 2022 12:07:44 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <20220924170744.GA961091-robh@kernel.org>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920145905.20595-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 09:59:04AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/newvision,nv3051d.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> new file mode 100644
> index 000000000000..d90bca4171c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NewVision NV3051D based LCD panel
> +
> +description: |
> +  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
> +  this driver only supports the 640x480 panels found in the Anbernic RG353
> +  based devices.
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - anbernic,rg353p-panel
> +          - anbernic,rg353v-panel

Is 'panel' redundant? IOW, could 'rg353v' identify something else other 
than the panel?

Rob
