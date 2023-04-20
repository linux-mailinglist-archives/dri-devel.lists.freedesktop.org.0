Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019236E9934
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A10010E093;
	Thu, 20 Apr 2023 16:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1910E0A3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:09:07 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-187df75c906so747278fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006946; x=1684598946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkJ757D7Ayc3x5jwYsxuxnxkjlFuulWAJkfbWRzIMQM=;
 b=OulfmgKEqP+VNLTHdKZgLVhK8m39zNCIIIZtgLAgW0zP1XEX9ZyZpSHlyx3br7fxmC
 tQveFk3+JzC2ZYUUyBnCS1jKRe6KnqXFDhH/X7UWikOML+kVC3rwHX02ASPY48B1AXtd
 1bYwz2VhdgVu7A86k93uTVrvNYRXz5Q+WMyfLbPZPDa/D9u25AEGFPZr6JsGyesly1A4
 s2T52/mZ5dooOj8WDGmZd9GzUcxvvNep3y8E/yNUs4efNMDN90CGwOV1o8QmlD7EwVH0
 7NSLHWPjw85TwC8sXkDuiZCr19j4+3C0kRDJZNxRIHKewrSnI6TnKhHWZK2BGlblZmdv
 nQ5Q==
X-Gm-Message-State: AAQBX9dSI3ktL3ly4utwUM0UxLgB+tFMNhudV+baQspPnOu/EjqOIJOl
 Ifs0SiXEZOQBN8xCG8l70g==
X-Google-Smtp-Source: AKy350aeJxflQzYgaqEyeXyK2zF5CseRY9f1WBxfwgvnpr5+Az0JWEfKsadnsXHRkEEvplIekIvQ9A==
X-Received: by 2002:a05:6870:ec91:b0:180:5c1f:5446 with SMTP id
 eo17-20020a056870ec9100b001805c1f5446mr1426888oab.50.1682006946545; 
 Thu, 20 Apr 2023 09:09:06 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m21-20020a056870a41500b0018459cc0f52sm870775oal.24.2023.04.20.09.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 09:09:06 -0700 (PDT)
Received: (nullmailer pid 2960072 invoked by uid 1000);
 Thu, 20 Apr 2023 16:09:05 -0000
Date: Thu, 20 Apr 2023 11:09:05 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: add common definition of
 ports
Message-ID: <20230420160905.GA2952736-robh@kernel.org>
References: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
 <20230418222613.GA2408838-robh@kernel.org>
 <77d94fe0-75d2-8f64-19c6-fc19438ba71a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d94fe0-75d2-8f64-19c6-fc19438ba71a@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 10:56:55AM +0200, Krzysztof Kozlowski wrote:
> On 19/04/2023 00:26, Rob Herring wrote:
> > On Sun, Apr 16, 2023 at 05:39:29PM +0200, Krzysztof Kozlowski wrote:
> >> Few panel bindings for dual-link connections just type "ports: true",
> >> which does not enforce any type.  Add common definition of ports, so the
> >> type will be fixed.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> >> index 5b38dc89cb21..ad62d34e6fa3 100644
> >> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> >> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> >> @@ -70,6 +70,16 @@ properties:
> >>    port:
> >>      $ref: /schemas/graph.yaml#/properties/port
> >>  
> >> +  # For dual-link connections
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +    patternProperties:
> >> +      "^port@[0-9a-f]+$":
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> > 
> > This allows any undocumented property.
> 
> Yes, which I hope the device schema (using this panel-common) will
> narrow with additionalProperties: false.
> 
> I can make it explicit: additionalProperties: true.
> 
> Otherwise, how do I allow custom properties like:
> Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> > 
> >> +
> >> +    required:
> >> +      - port@0
> >> +
> > 
> > I don't think this should be added here because users must define what 
> > each port is. With it here, we're going to validate the nodes twice as 
> > well. Same can be said for 'port' though. It can't be extended though.
> 
> So you propose to drop entire "ports" here and expect every panel schema
> to define it instead?

Only those with more than 1 port or extra port/endpoint properties. If 
neither of those are true, then they can use just 'port'. Otherwise, 
all those panel bindings already have to define the port nodes already.

Rob
