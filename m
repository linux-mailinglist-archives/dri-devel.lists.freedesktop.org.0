Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCA35014E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F276E1D5;
	Wed, 31 Mar 2021 13:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A436E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:35:29 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v25so3393946oic.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OO7ubuY6oTKvyUG1gEO7CnoaNU1mo7KyFjqzNQtFekg=;
 b=XepmK2ajxaKu/Uhrtugoern6u1Goud5AbCW/UXk8IBbWuE9rVetNb6LZwteIC1TWtC
 cBYo8ova+vLlsQG3XKdvtb1dVc9Qs+ifQvGssNZ5+2+L2yxLQuvoaSbXI2K4h29EvgfJ
 Qu3Hg7LFpFcgUz9lVwiYDxRKvRtnfXiFv/OFjQLoDzc2b8Dc2BmjWhy+ZyoUo99ZaG9/
 njUMcF4dXI+fwe9rrXqd6aXhB5vURnMGXW/9DMhxXKZiJtEyJPeNiPtfCugJPDDZ3btw
 wwgzY/TEX7LcgFHjpiQhZ4uxWw/FOj9Z5l+QvPNx1FMns7r5uVnpZ3Nvn8+ssY2eySNg
 cZnA==
X-Gm-Message-State: AOAM531nBBuk1oW4P8bh+VvDazOI8PIZYNFD/6QazVzk/5CaCZcgUrc6
 xAjI47GqFCeZ6NkgdGNoxg==
X-Google-Smtp-Source: ABdhPJzR60WxulAypcTek0JQWaHluHrpPJGXqUHdYhkTq5G28iPykqY6g8W79IHDsXKCTbhxKKVeKQ==
X-Received: by 2002:aca:6543:: with SMTP id j3mr2341007oiw.158.1617197728353; 
 Wed, 31 Mar 2021 06:35:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m127sm433005oib.32.2021.03.31.06.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 06:35:26 -0700 (PDT)
Received: (nullmailer pid 2066047 invoked by uid 1000);
 Wed, 31 Mar 2021 13:35:25 -0000
Date: Wed, 31 Mar 2021 08:35:25 -0500
From: Rob Herring <robh@kernel.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: display: sitronix, st7789v-dbi: Add
 Waveshare 2inch LCD module
Message-ID: <20210331133525.GA2065994@robh.at.kernel.org>
References: <20210330081505.116351-1-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330081505.116351-1-zhangxuezhi3@gmail.com>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Mar 2021 08:15:05 +0000, Carlis wrote:
> From: "Xuezhi Zhang" <zhangxuezhi1@yulong.com>
> 
> Document support for the Waveshare 2inch LCD module display, which is a
> 240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.
> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
> v2:change compatible name.
> v3:change auther name.
> ---
>  .../display/sitronix,st7789v-dbi.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
