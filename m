Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2EB288A46
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC956ECE1;
	Fri,  9 Oct 2020 14:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA716ECE1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:05:46 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 26so10300558ois.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 07:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dyalSiZn45S4a+6jujOvfnO/RK2cFb+Vq+tH54TVFEA=;
 b=iW65f5kQFinZNondEOq4ZBb0w3ROqwrciLq1M+MbY8r7Oq2ooCIg2vNikWX9l4r/gx
 3lnMRskoik93owXBq5YdZtu9P5FR8UxETAVmY6bhYsgJxbmNUSUIyE+dmUNwDtw5MEdR
 4/l+0PnTynAK8z3mIa/zoLnB5g84qkQSicg/kP2LAxkeeGmxD+VF23FFSzUZ4Ug/q5oi
 TOz31358GZGGHTdXADSwbeeg9YIzJMCIib18qeFnfP9A0+QjyPPBUXtWBfHdE9+bbuEG
 IL6U3rKX/tV2KkG1Zn1iDZ3+lTrgMf0WOQV9GBA8Bo9EEdIORHciSH3Pymp/kbzAGF8q
 J3ZQ==
X-Gm-Message-State: AOAM531DGyIBHKfse+XVy32WgNupPBKhhRxUwz4FnhXqXc/zt6+zf5WA
 YAwK0jIABF0q8xs6bRT+Ww==
X-Google-Smtp-Source: ABdhPJxsTciM9UAO+e8EG/rRkxLowDeJJ0mpmhUvP/1Yu/QRYdwZcSle050QqMWzNTlwohesQKoIlg==
X-Received: by 2002:aca:a810:: with SMTP id r16mr2673248oie.114.1602252345680; 
 Fri, 09 Oct 2020 07:05:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r188sm44078oia.13.2020.10.09.07.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 07:05:44 -0700 (PDT)
Received: (nullmailer pid 4076255 invoked by uid 1000);
 Fri, 09 Oct 2020 14:05:44 -0000
Date: Fri, 9 Oct 2020 09:05:44 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6
 panel
Message-ID: <20201009140544.GB4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-3-caleb@connolly.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 05:49:14PM +0000, Caleb Connolly wrote:
> Document the OnePlus 6/T common panel driver, example from
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> new file mode 100644
> index 000000000000..23ba369cc2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OnePlus 6/T panel driver
> +
> +description: |
> +  The OnePlus 6 panel driver encompasses the display panels found in the
> +  OnePlus 6 and 6T devices, the panels have almost identical behaviour and
> +  are not used by any other devices.
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef00
> +      - samsung,s6e3fc2x01
> +
> +  reg: true
> +  reset-gpios: true
> +  port: true
> +
> +  vddio-supply:
> +    description: VDDIO regulator

A panel with a single supply can use panel-simple-dsi.yaml.

'reset-gpios' was missing, but has been added recently.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
