Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8F12AF86
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 00:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809589D64;
	Thu, 26 Dec 2019 23:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D827889D64
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:07:17 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t26so24367626ioi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 15:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=09rS8PXmYb66+opfDF/HoSqGuS628myutYINcOsY6E8=;
 b=iilKh/Zf2iFX557TBoIgyjWCeJY3phEC7NCw9cLw2NZoGQOdA3URWO4Yr6u+dvyl2N
 hfkORGKthG54fBs6104j9/vqNHLeMyR4J1da1lo97ks7FrIyCuNETyY2sJYnq9R/f9uf
 lbM83VaW9xi+Ld1bIFdTJpcyi4FhpQbyWM4EEHoropToUoJxfwYQhFCKO9G9k1FrYnVl
 S0TtxO36jar4tN9+g2YK5wDVpfBEw1+v/1aGu6egpJ0f/J7xMToWkqMYNjyaUfIYy5UV
 DovcEY9YYHKdZsaBy5sphHlHpc+35UlLgMP3FMUeZSI7h3TBDm8rYyd1mxoCn5g0iiIT
 YrCg==
X-Gm-Message-State: APjAAAUliBcUfl6MD0rAZ+Nu5+x8S+HvCrGI5n6Gr34x98muTYWazFdo
 EUzsCWr/PP5RFfvI7hcGXQ==
X-Google-Smtp-Source: APXvYqwHfi3Nghh7YpAEVyuVEpVyxC0UkgOcBo+I62eRYV/HTallfoRYP8e+mEoxXn9WqJsXghWSTg==
X-Received: by 2002:a02:3312:: with SMTP id c18mr38051839jae.24.1577401637165; 
 Thu, 26 Dec 2019 15:07:17 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id f125sm2969342ilh.88.2019.12.26.15.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 15:07:16 -0800 (PST)
Date: Thu, 26 Dec 2019 16:07:15 -0700
From: Rob Herring <robh@kernel.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: display: ti, am65x-dss: Add dt-schema
 yaml binding
Message-ID: <20191226230715.GA4882@bogus>
References: <cover.1576857145.git.jsarha@ti.com>
 <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1007a467492c2a588d4348106313a9f4853f3f20.1576857145.git.jsarha@ti.com>
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

On Fri, 20 Dec 2019 17:55:10 +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for AM65x DSS, AM65x version TI Keystone
> Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - use allOf in ti,am65x-oldi-io-ctrl to add both $ref and maxItems
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
