Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B873B382F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCA96ECD3;
	Thu, 24 Jun 2021 20:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5436ECD3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:52:34 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id s19so7719430ilj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8861/Ltxyv7hm5eHaFAyTFZdG7GDOnf3PVQFvmrdWw=;
 b=VCWCCJ4I28X1ziExkmjk5sAJwBGx2O1BAbjyoqgm+ZOT8zZ1iT5QBp9L4Bf5/cxawh
 XbH51DggqClsRs5MCA58145K9TFl2sKN5x4g4Pq3XkuZkevoYLDyNZfgNGFt+iDBx2Vh
 XmpaK9o5nqxidaouV5WCQ0RHDzVDIpD5J3kjO6PkDEnHzduXy1zWKbsHT+Bikt9fadZE
 lLGpPPlw3exfzc5ZUvyi8r8MaYy6xnV8GjE/8+mbTQyEvTCw2Ypb8CuXtA33Q9yX4QDN
 i+7CjRdiFCj7HHkejCqqh35IC7ydyqKjs+kbyI987DpeywlvBNETHk3GCcDaHi8UGEQ6
 MHcA==
X-Gm-Message-State: AOAM531DEHtm36/zIlxfXV+qVy8O1N/yr9i1wLPiISSnv/ePvEdpijX/
 z4BdhV+aX1OcmVhEbfQgqQ==
X-Google-Smtp-Source: ABdhPJzWIIkBrpRIzM+C+vdH4fBPbS6HrJYWxULDLZVaedsNS9B+ORvrty3k9hSL9Csmj/o2XjA1yQ==
X-Received: by 2002:a92:a002:: with SMTP id e2mr4938339ili.98.1624567953687;
 Thu, 24 Jun 2021 13:52:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q8sm2066938iot.30.2021.06.24.13.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:52:33 -0700 (PDT)
Received: (nullmailer pid 1968363 invoked by uid 1000);
 Thu, 24 Jun 2021 20:52:29 -0000
Date: Thu, 24 Jun 2021 14:52:29 -0600
From: Rob Herring <robh@kernel.org>
To: Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v2 2/2] drm/panel: Add support for E Ink VB3300-KCA
Message-ID: <20210624205229.GA1966800@robh.at.kernel.org>
References: <20210615103312.872-1-alistair@alistair23.me>
 <20210615103312.872-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615103312.872-2-alistair@alistair23.me>
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
Cc: devicetree@vger.kernel.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, sam@ravnborg.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, krzk@kernel.org,
 linux@rempel-privat.de, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, max.Merchel@tq-group.com,
 alistair23@gmail.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 08:33:12PM +1000, Alistair Francis wrote:
> Add support for the 10.3" E Ink panel described at:
> https://www.eink.com/product.html?type=productdetail&id=7
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
> v2:
>  - Fix build warning
>  - Document new string
> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index b3797ba2698b..799e20222551 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -128,6 +128,8 @@ properties:
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm0700g0dh6
>        - edt,etm0700g0edh6
> +        # E Ink VB3300-KCA
> +      - eink,vb3300-kca

Combining this with patch 1 would be preferrable. Either way,

Acked-by: Rob Herring <robh@kernel.org>
