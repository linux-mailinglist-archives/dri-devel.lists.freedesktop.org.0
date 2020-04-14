Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19271A8A53
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37886E544;
	Tue, 14 Apr 2020 18:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D586E544
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:58:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j26so571119ots.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yng5I6SxhHzfkzr2Hr0xo1uj8i038bsOL/UPbVnFotM=;
 b=Xq/lH0ATEfjAjmuZ/H2wvdzDND0GLKEyIzPkyBIMSK+O0AJezAw8G8DXAMNE8nasxA
 Q1GBIB3q/M/E91rZp+aq3sgCDzzwmJmOmL78GrHR3OE6eM58xHj7hUglZT1w68MkEloV
 cn59WWrQf1G6RBD1B2hptE8W7aEaza38Xi8bwMIJVPrhjUWacDI7xk7G4H/5hT9O6FwS
 kZNLvZ5Tz5utOR5PXgyHr9iQ7GllylqMeqVQDa0s3rQOspuFHMr0g/9DU2gjRMXRrFUg
 iEH2/DJVidhxwAjWfzooteA9TOgqdFcykPwN6Q7ZgfCVQ/ZZSe7OZRDzQclTtxQeQ9wK
 5sEg==
X-Gm-Message-State: AGi0PubYfWKrXjwygfPrIWMBTHCN1zGsA1opMs0BxZvhbsSVNXHuKiRI
 EWomPmfaMFrnbjFgrOOMEH1wwFU=
X-Google-Smtp-Source: APiQypJAXLhCXOxbvzoI0+y87beqq2cSSLCYqoDH1f37RG8woHymrKR90IKI0Ay88yoSJW1lCaVPjA==
X-Received: by 2002:a05:6830:11d8:: with SMTP id
 v24mr20303578otq.258.1586890711805; 
 Tue, 14 Apr 2020 11:58:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 85sm803962oie.17.2020.04.14.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:58:31 -0700 (PDT)
Received: (nullmailer pid 15450 invoked by uid 1000);
 Tue, 14 Apr 2020 18:58:30 -0000
Date: Tue, 14 Apr 2020 13:58:30 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 31/36] dt-bindings: display: convert sharp, ls037v7dw01
 to DT Schema
Message-ID: <20200414185830.GA15392@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-32-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-32-sam@ravnborg.org>
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
Cc: Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:04 +0200, Sam Ravnborg wrote:
> v2:
>   - Add min/maxItems to mode-gpios (Rob)
>   - Fix bug in description, mode is up to three gpios (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,ls037v7dw01.txt       | 43 ------------
>  .../display/panel/sharp,ls037v7dw01.yaml      | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
