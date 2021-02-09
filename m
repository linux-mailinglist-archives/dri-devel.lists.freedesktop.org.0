Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E33156C1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 20:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B382E6E2BC;
	Tue,  9 Feb 2021 19:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F556E2BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 19:30:13 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id d7so16283746otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 11:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GJFPQ2Ilx++OlRwYhDURW2rh2NMBhJeZYovPyBO0lLM=;
 b=ZxVxHStbyy+ARXAkJdGZQBa14bHwo0ai3MsJOKK5fZ03YES9FRG/xw6PWoRN6DPULB
 pFzRTvOV2g9GG4x5853LMIp0vDN3Iu1/hIyqB64xK0CmXfTpdu21R8igJt/9Bo0qxrCy
 t9yW0SGbuuYmqX3zFT53ZImdKmWboJHOEa+817G+MMXVnjtNmOWUdjlyxfjv6+rDfugL
 WoRcWJ8qX0GgwsQfPDWlduHrNOvH5QlCoR5SMoJdnO3G/z3778XmoYZBNrCPdhrdip7h
 qj4OvWwGb1LlrasF/DJXnVODDATjlt4LXmAkjN1HPSJKnlXsI9mu75nKdQdmKTJHpu7I
 k74A==
X-Gm-Message-State: AOAM5311yQkk4YJuHP+vuloEFe1YSb95B7iUY+BGyxFw0TMA1xZs4OZi
 CwQs+/8oJcoTqA6/sU4VxA==
X-Google-Smtp-Source: ABdhPJz5cVwP1C15lX4pHusdFwtbNSqO2ZM3QELnNfk3yoegBRN1B/LqtqKPlcHeP8B5ax2zQPfq5g==
X-Received: by 2002:a9d:303:: with SMTP id 3mr16767236otv.301.1612899012649;
 Tue, 09 Feb 2021 11:30:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j68sm4481922otc.6.2021.02.09.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 11:30:11 -0800 (PST)
Received: (nullmailer pid 12877 invoked by uid 1000);
 Tue, 09 Feb 2021 19:30:10 -0000
Date: Tue, 9 Feb 2021 13:30:10 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210209193010.GA4675@robh.at.kernel.org>
References: <cover.1611802321.git.xji@analogixsemi.com>
 <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <246b8bd6e51ed5c8cb3618f4259adf8aba319511.1611802321.git.xji@analogixsemi.com>
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
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 11:08:26AM +0800, Xin Ji wrote:
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

Please show the new properties in the example.

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
> +
> +        properties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            # Properties described in
> +            # Documentation/devicetree/bindings/media/video-interfaces.txt

Now video-interfaces.yaml which should have a $ref here. It's currently 
in media tree and linux-next. Follow the examples there. You'll also 
have to wait for 5.12-rc1 to apply to drm-misc.

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
