Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE203898AA
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 23:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE226E239;
	Wed, 19 May 2021 21:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997926E239
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 21:35:24 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id c3so14451066oic.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2rgWWzmu9+l/+keqWvE5o3R7X9qXR0ySXAn+ph51bgs=;
 b=CMq6eK1fy0aUOa9nFarrpDPbF6VbwENbJog4Sul3ZSViehNjWfM7GxU1AsO0hGCb1L
 NzA+Mu1po1Hbt5fTmQbxnMBx8dRqDLU8J78g/8qNibOlzmqATMEvSL1qQ36Lpps19uZh
 Ji177CBRAZwO9yEdtf6yhCDUODniIU0OhwgU/w8Hhw0YoIy39UnzdtIOwjbKHms+Bfto
 PjwZykLaUTkqZrloVdl/nPwG6X3Tpr3a/fRGRt/uYSiw/YQ5pChUbq7ft6DidhXlQsDi
 rSinf9q/en4kaNQF4iSYHB1eHF11cTHFF37ko+lpf4eAh3Cffu+a6P9pie/w+fJrjOiJ
 wT3g==
X-Gm-Message-State: AOAM533kTmUkvnR28sGO245EMTiBksqMEUzIZyDfEwvHam8EGnGr0yR/
 qVS7gtQjbNJJTZd4U9wa/A==
X-Google-Smtp-Source: ABdhPJyxgegfTcfNU9tUV1HgiyoVr8+U6uW9P8E1qSVwfvrfm/k357lHNjRPmR4qmC2FQCMHyZdaag==
X-Received: by 2002:a05:6808:13d5:: with SMTP id
 d21mr964288oiw.31.1621460123905; 
 Wed, 19 May 2021 14:35:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e20sm132049oot.11.2021.05.19.14.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 14:35:22 -0700 (PDT)
Received: (nullmailer pid 3694182 invoked by uid 1000);
 Wed, 19 May 2021 21:33:46 -0000
Date: Wed, 19 May 2021 16:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: display: ssd1307fb: Convert to json-schema
Message-ID: <20210519213346.GA3694120@robh.at.kernel.org>
References: <20210518075131.1463091-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518075131.1463091-1-geert@linux-m68k.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 09:51:31 +0200, Geert Uytterhoeven wrote:
> Convert the Solomon SSD1307 Framebuffer Device Tree binding
> documentation to json-schema.
> 
> Fix the spelling of the "pwms" property.
> Document default values.
> Make properties with default values not required.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> I have listed Maxime as the maintainer, as he wrote the original driver
> and bindings.  Maxime: Please scream if this is inappropriate ;-)
> ---
>  .../bindings/display/solomon,ssd1307fb.yaml   | 166 ++++++++++++++++++
>  .../devicetree/bindings/display/ssd1307fb.txt |  60 -------
>  2 files changed, 166 insertions(+), 60 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
