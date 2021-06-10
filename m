Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DDD3A32C5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 20:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CAB6EDC3;
	Thu, 10 Jun 2021 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8781B6E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 18:12:00 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so604769ott.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Z0ty/mR6mYLBOug47A4Z8fGnYIgj+PliPGyR3KY+r8=;
 b=NWGHBsvbleeZqHpt78RAbI/pGpg1IJndKjihwYJZrTgJYpasK/G3m7RBmeY6Yydh/r
 Eu1eC4x8JYvCtL8WKalsf7BVTypemhy5wt9m++Ic6jTYHHrY4UEYacxp56Z/RZPZiDcf
 kpkOR9NJWVhjW8M6Jp7SJNQ+TN2HgFFkvk6OtYrQnEojA56/te1ITtzwDxHUZ0qhQuBz
 /0KTTLnNh/EspBnUX/2E8FF8iKBP62MUAr3kYxsa6DCPinsPhWGKFuCSieZ7faptXiRq
 hfVH1/O8tv0uH32InEomrnmuhdW5YEM666makH8+xu2RwjIJQEsVKUDR+oPeDxmUrS/K
 pmPA==
X-Gm-Message-State: AOAM533c4lL7nCZwtNSVE2cXa5D+bRU0UDEf9+/ND+wwcFAEPpJpQQiL
 6+KGpccYVGCHwEqfVxh/EQ==
X-Google-Smtp-Source: ABdhPJzTMWaFnPIn6O6bVtyKqfFiCIM9FGrsKf1TFyLFmYDWc51t+5Ia4JuHRkODaiWYV4umYzXYCQ==
X-Received: by 2002:a9d:2f62:: with SMTP id h89mr3408357otb.225.1623348718950; 
 Thu, 10 Jun 2021 11:11:58 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id j14sm236368otn.18.2021.06.10.11.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 11:11:58 -0700 (PDT)
Received: (nullmailer pid 2407438 invoked by uid 1000);
 Thu, 10 Jun 2021 18:11:55 -0000
Date: Thu, 10 Jun 2021 12:11:55 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: bridge: lvds-codec:
 Document LVDS data mapping select
Message-ID: <20210610181155.GA2407404@robh.at.kernel.org>
References: <20210602203731.419310-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602203731.419310-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, ch@denx.de, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Jun 2021 22:37:30 +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Add DT property data-mapping the same way lvds-panel
> does, to define the LVDS data mapping.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use allOf
>     - Move the data-mapping to endpoint
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 53 ++++++++++++++-----
>  1 file changed, 41 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
