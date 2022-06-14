Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F2D54BC42
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 22:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAC0112EB0;
	Tue, 14 Jun 2022 20:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587EE112EB0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 20:53:22 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id f9so8775284plg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AR6pI4Dz4SnbCroeylFx6ClK0LALzjTLZM8tr+b1Qio=;
 b=rlANcywAf4bR7fadVFA2+G43rRwb6bnCOg+XpmZaE08Y1ATmf4iXfkpOG29AXJ27fu
 nBPgAan/++luP9MBfjVPAOtUAnUddFJWgFTpt8KC3RYS6VGpCD6sbGm13MaOL9Z44jGD
 4fFF01bfFROZXzw7HdaT2etm+xFtUlvK5HkkHAmN83wi0aZnVzmCVnSiJsVkMQK4SMai
 HUNWTGtntrPCxetOSOJqi/coDpghVaIdNMMDH5QrLKyN7jfKz3CoBwz29149riGdWEdQ
 O+GwP/qqzi5qErljLWsZ13oFVlZdEnn/YqvCC8+n2DYlnwaN/fpW2/wLi0q6xxs0bF6l
 drEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AR6pI4Dz4SnbCroeylFx6ClK0LALzjTLZM8tr+b1Qio=;
 b=VQ+ADxqznBxE1Ld6xHWLn2Aea7orsAmQwwRdiNUeNaqDpVGaPSjO93O1QkL0aYFgAW
 Fld772ck9dRtrQyZ65PXggl4wE9pQHaTzL/XFGOL8GQDYpNKR2wktGSb3ReGsU9vxmiB
 VPsu5+MF0R2WVVJUJ3JHjd/+wPkVPH1pWpfeLl/SrOsVxtG/nc4r3hw5dtqU88uiH2ZS
 95eLzICnzXI+ipI9vWsgUPoX6kSZVpOIVT0EelX4K0OAsaCgaUKzXEEyipXp98FOC2ds
 11JvBY2Y3NMH98YjwWuOLRgCGYPzKUPvKCLiFTPw/foiGxHx3Cm83Lv+o8mCgEOcy+mf
 Hprg==
X-Gm-Message-State: AJIora/FMvZQbfxg2CD1EwtbZRihExdGVUX1X+F4yFD33sHhYuYX+qd8
 Wf1rho1eodQNp+yGVQll+slBIg==
X-Google-Smtp-Source: AGRyM1sGORuHOsrudJ2NzMuucMCoEUS7FrDUAZJlvhB95QU1/ijkVKGqDtIwU3c/jV+ULDfXuIS/fA==
X-Received: by 2002:a17:903:248:b0:168:cf03:eefe with SMTP id
 j8-20020a170903024800b00168cf03eefemr6038425plh.124.1655240002425; 
 Tue, 14 Jun 2022 13:53:22 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b00162037fbacdsm7638321plt.187.2022.06.14.13.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 13:53:21 -0700 (PDT)
Message-ID: <3dbb38af-4813-3c5d-8a12-cdd63bdbe3c2@linaro.org>
Date: Tue, 14 Jun 2022 13:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220614193558.1163205-1-pmalani@chromium.org>
 <20220614193558.1163205-5-pmalani@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220614193558.1163205-5-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2022 12:34, Prashant Malani wrote:
> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.
> 
> Update the binding to accommodate this usage by introducing a switch
> property.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v2:
> - Added Reviewed-by and Tested-by tags.
> 
> Changes since v1:
> - Introduced patternProperties for "switch" children (suggested by Krzysztof Kozlowski).
> - Added unevaluatedProperties descriptor (suggested by Krzysztof Kozlowski).
> - Added "address-cells" and "size-cells" properties to "switches".
> 
>  .../display/bridge/analogix,anx7625.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 35a48515836e..cb4a23391244 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -105,6 +105,33 @@ properties:
>        - port@0
>        - port@1
>  
> +  switches:
> +    type: object
> +    description: Set of switches controlling DisplayPort traffic on
> +      outgoing RX/TX lanes to Type C ports.
> +    unevaluatedProperties: false

This should be additionalProperties:false.

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      'switch@[01]':

You also need ^ and $. Please use the same quotes as in other places
(here is ' but few lines above ")

> +        $ref: /schemas/usb/typec-switch.yaml#

You need unevaluatedProperties:false on this level.

> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - switch@0
> +


Best regards,
Krzysztof
