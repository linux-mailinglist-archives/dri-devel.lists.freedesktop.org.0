Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586512AF82
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 00:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252689D4F;
	Thu, 26 Dec 2019 23:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B2889D4F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:05:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n21so22809569ioo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 15:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=imgyGn/vI3sOKO/lqcgXhV7wHKIVnLu9LpWSLgK7bp0=;
 b=Qh2DNqXfhiqAzPTsXdvE/YBzPgGWTn3lpQJ9a6h8PhtyyehOP6OUhSyHSLiE8l6aYr
 EqMJqvytlUgUGukwK+P42ZrC1Io70KJHMyj8bySDi/wuQ6QwGlyA/Ggdkij7+K7o45FX
 wwA0TzHmaP/aOFnSJshnGOtjkuuiG5D9UuA7NRPKjhSMagXJX6LtQ7qVZ9Hkd1TP0Rzk
 nN6qcSmt2bNEW9rqfxXiX3JMIWe2GMcNuii75EtGyVm453U+qw/GtgGOm4MwgB88tJQR
 HZyC2kvFknY+a7TKA4dR1k3MFf1mZNS4St+STJ15waHiWS+f/UisnmPDh3mRNtLRXtom
 thTw==
X-Gm-Message-State: APjAAAVceB7p13hTxFwrgCyCIO4rMtNC1LIh2XMY5qBASa5y10P21Iiw
 ky8AijPXapsyoVHYmn+Zag==
X-Google-Smtp-Source: APXvYqzzd/SKxgFH/Acu/B8yvxJvabyFoe0NxQ0KfqhRMA6IlaNk7WPvJEMGFQpDB90WP7IjMWWc+w==
X-Received: by 2002:a6b:7e02:: with SMTP id i2mr32354074iom.172.1577401541660; 
 Thu, 26 Dec 2019 15:05:41 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id a82sm12581790ill.38.2019.12.26.15.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 15:05:40 -0800 (PST)
Date: Thu, 26 Dec 2019 16:05:40 -0700
From: Rob Herring <robh@kernel.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20191226230540.GA1959@bogus>
References: <cover.1576857145.git.jsarha@ti.com>
 <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2019 17:55:09 +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
