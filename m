Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A912430F6BB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46496EE02;
	Thu,  4 Feb 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7166E053
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:38:48 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s23so1973751pgh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2dvgQdQ6hKfQnFN6cqPppjkW9v8eA0H2PjYK802sxpo=;
 b=BNEQCznMNh8r0jLb9D7EexdCQzuEeG7tRhc7/5Xr5bLtHg4/YMMeu1f33qhVQ9k6x5
 c9X8mzULfLUvJyNGW2KJVU+8n3yw3b0JOiWwHVMipnqOmi7mB2y8rcpL3Q3Er1LWIeXd
 HXqodl8ZmCUwNkKHina/mvRq/XjerB7irxnK5etoEZB3UKFE+7dIMa8zN3Jlc9jtjvv2
 RPpXBGkKCz3vl4ROsdeXfEfxVUJIvFQk+kaGQsY2Km8cWCZnHRsOetVp1OicJtm9DUXd
 r8UjH2Xj3lxH6N+iGsAZSnr01RwmNS8nzKfkmcXKzqe172Y76mzvpDD1aren5hp8cfHv
 /q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2dvgQdQ6hKfQnFN6cqPppjkW9v8eA0H2PjYK802sxpo=;
 b=RURsg//WHoRp3cs+tUYlCg5so2XAGJ6j8gND7NZ2ZP6Qxk8UkXSaQcoURWXRbSf9UM
 BUDu1sch/MdpKAbphSSuuBcuCRwcWCWz7ObPiYKXeIUCbmPiG+LFrPxPR0LqLimCk86x
 /KnHzOoEO0HDed25sV3+xJKBwrQjr1CgwXAi6TiGLLu6W0FZRbpukUrCAP3i3wSL9IWb
 H3JIL0tOLdc6TSpS0Jr21ejOnkzp+Gw+lQI2bC/Mh5arNOz+hgZ2SDwxCkn9jERGW9E3
 rv9cxQMLgT/6ri6oE4oSY0K7cb6Ol/y+seI9B/iZH9bkKGcp4uF2QYSrHvED3FyBRHkG
 qLfQ==
X-Gm-Message-State: AOAM533ZwPMX90JNWRJVOzINcjPD/Gv8NCOPhtWUD/R7/xpiE26P/j9u
 rzntI2CmvquBgndsZb4GZbMcdljYO4BPHtkicenFiQ==
X-Google-Smtp-Source: ABdhPJy3NmQ6w+rzYQfD4UrbFDVSoOhOsQHrBW+h26hmwT2e06tr4AzZ5nWGZCFbAK/jlrd3r9KmgGEneSIqEODKxKM=
X-Received: by 2002:a63:5b4f:: with SMTP id l15mr8863564pgm.339.1612442327673; 
 Thu, 04 Feb 2021 04:38:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611802321.git.xji@analogixsemi.com>
 <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
In-Reply-To: <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Feb 2021 13:38:36 +0100
Message-ID: <CAG3jFyu0qj_ipqz8eKWtmkjKDBBAF_X20f1i-d=83vksgh6nxg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
To: Xin Ji <xji@analogixsemi.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 15:50:48 +0000
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

On Thu, 28 Jan 2021 at 04:10, Xin Ji <xji@analogixsemi.com> wrote:
>
> Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> flag and DP tx lane0 and lane1 swing register array define.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 54 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index c789784..048deec 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,24 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>
> +  analogix,lane0-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane0 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,lane1-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane1 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,hdcp-support:
> +    type: boolean
> +    description: indicate the DP tx HDCP support or not.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -41,13 +59,45 @@ properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          Video port for MIPI DSI input.
> +          Video port for MIPI input.

Maybe MIPI DSI/DPI input is more correct, since there are a lot of
other MIPI standards.

> +
> +        properties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            # Properties described in
> +            # Documentation/devicetree/bindings/media/video-interfaces.txt
> +            properties:
> +              remote-endpoint: true
> +              bus-type: true
> +              data-lanes: true
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - endpoint
> +
>
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
>            Video port for panel or connector.
>
> +        properties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            # Properties described in
> +            # Documentation/devicetree/bindings/media/video-interfaces.txt
> +            properties:
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
>      required:
>        - port@0
>        - port@1
> @@ -81,6 +131,8 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> +                        bus-type = <5>;
> +                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
