Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AD43D2D8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99798979F;
	Wed, 27 Oct 2021 20:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2979E8979F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:32:14 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 o26-20020a4abe9a000000b002b74bffdef0so1344736oop.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCyobkqZQkzSalEez4Iq0YBADjfjqmPa1gmyY2RxB7Y=;
 b=ujMwmWuwFU5nABAixBXf3AtH//ylEOw2aC+7MiEkVC6sfQRDE65KUdjeeu785+rJx/
 Kqvz9WGts4Ix7TRU9DeOfCBhupgeVI7pKoZ4+lgi/Uwvw5L5N4Etq6Py5ovn2cAa+Ha4
 gGz8Pu83jCF8V/eToDpY/5TijfpwQKpA9KwDdk8h9XDQBve2WHJW4ujYZEED/dUU4Tv6
 dt9H1sk+BUGXaHwdaBxSI1dJlfHnKQZTt+5aBJRNbCIMG5khvGXVYDWQdHwKzGuKsCFS
 entdsSrR86toV7K6XsXBwZC27SJdrUTGiLLvcYkMqZIHqjHKra/fG45S9PnWfUgLz9pP
 X+vQ==
X-Gm-Message-State: AOAM533LmrMiodm4urzIDpQSIdROGO42EdG7qnExQwyIYCFL5Boa9UHl
 A6FHM2PTinsqe6/3Q0VL8w==
X-Google-Smtp-Source: ABdhPJzr5mepQbrAdQc0r1ApS1sM4eCK0NSKmmtkdNXQ+AzNpWS64gF5Sod6uTlShQOc1t94rJ5iyQ==
X-Received: by 2002:a4a:de10:: with SMTP id y16mr23677617oot.4.1635366733450; 
 Wed, 27 Oct 2021 13:32:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d18sm364711ook.14.2021.10.27.13.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 13:32:12 -0700 (PDT)
Received: (nullmailer pid 2102331 invoked by uid 1000);
 Wed, 27 Oct 2021 20:32:11 -0000
Date: Wed, 27 Oct 2021 15:32:11 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Message-ID: <YXm3S4u8KAWjJfXy@robh.at.kernel.org>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021092707.3562523-2-msp@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 11:27:01 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Newly created patch after realizing that the specific clocks for dpintf were
>       the same as engine and pixel clocks.
> 
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
