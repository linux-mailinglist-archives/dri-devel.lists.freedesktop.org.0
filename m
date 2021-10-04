Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D042165A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 20:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D71A6EA89;
	Mon,  4 Oct 2021 18:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03F6EA89
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 18:24:49 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id u22so22864892oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 11:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uqtsnyNKKJS9yEITd+jPQas/rw37SI2DxYEgJEPNXP8=;
 b=LAKSGD0sjLAL4qrJugI9wT+U1VVOO2b3xdK7c92sEHN1hCAdccvW+HEfUgyz/S43Rf
 RUX9QIUzGidxz1pRDgZIX6FhkTL61wjlwH3YowHkq2Bl1A5MKd4GpZRKkMYYCfhgPW3B
 AKNBJHE3ymNjpebpIXGr+QFMmiSG1W7Z6wzetrdIaVxHO+VSmSTs1bzNV2HWaYVjPWUW
 A7ZDI2xAxotlODIHcoJIYsfWpq+qdSgafK3xjfy2jnpqGz8iMIx4LhDPI5ie+o40zPtT
 Oxui+vj+S778GjLjAE/wOwJLsOmb/iNnSNvEjY+/8Q+H8RbWfxpOPr3rOl6T8E80v5VO
 Gb3g==
X-Gm-Message-State: AOAM533J/8KXFFvIsFUZXfupdF/yid8VPW1ilpHQiM6ZMMKYa1fMfWVe
 zlDU8wOZFWcsLIL/7KYh8Q==
X-Google-Smtp-Source: ABdhPJyTyPZM+WOk9JYo2l4wBBPBqaBkwGZycQzvuQxp5B5a6aRmAyRc76soi8nj+CiRbzOQa0HtHQ==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr4913473oix.22.1633371888817;
 Mon, 04 Oct 2021 11:24:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l28sm2928304oof.30.2021.10.04.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:24:48 -0700 (PDT)
Received: (nullmailer pid 1605963 invoked by uid 1000);
 Mon, 04 Oct 2021 18:24:47 -0000
Date: Mon, 4 Oct 2021 13:24:47 -0500
From: Rob Herring <robh@kernel.org>
To: tommy-huang <tommy_huang@aspeedtech.com>
Cc: BMC-SW@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, robh+dt@kernel.org,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, andrew@aj.id.au, daniel@ffwll.ch
Subject: Re: [PATCH 6/6] dt-bindings: gpu: Add ASPEED GFX bindings document
Message-ID: <YVtG72uZKHrkGk6u@robh.at.kernel.org>
References: <20210928025703.10909-1-tommy_huang@aspeedtech.com>
 <20210928025703.10909-7-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928025703.10909-7-tommy_huang@aspeedtech.com>
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

On Tue, 28 Sep 2021 10:57:03 +0800, tommy-huang wrote:
> Add ast2600-gfx description for gfx driver.
> 
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
