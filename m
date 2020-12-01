Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042C2C9500
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 03:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443289A6D;
	Tue,  1 Dec 2020 02:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BF189A6D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 02:09:51 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id p5so158114iln.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpPE/ZHbmmVqufzPxdpfXKuHGuOl5hc4CwSkh/vGOFM=;
 b=DhUvp6vn8But5Zw/jYgc4SptmLJN/hmK5BJByR45FwAUHPtCcdMs2dUMEeYiZdHsiI
 dzZDAdcvwwZjBe+YLmZKITJrg6bsvp+Bn8/UyJQR1l+nyVJ0PxDWjnLpGW0aLQ8a2fx3
 tdyZRM82ztEDo6DyXKgFA9OCW8E+OfcRJAe5RIF9BIvF7I1YYj6jm1o7vB2AuD17y+wQ
 8fye9WXIht5VJhDuH9KXXRVnHVtRMtumltj8iBy1wmtUFFqFuSB6ALFHdVUduPEhLBhu
 x+uq2s32qi6XtmBEGRnsbqapnCXgqFqYF//HIF5GhkY5ewR+02Hf1dDdkHqZz8ijbqL0
 P7mg==
X-Gm-Message-State: AOAM5336ktjQWLwGXiexw5EFhVbPxZ62Wt3zRNz3phiyceRx6Uqf8zcz
 UjHR5QbFDSAfoan7fZMPQg==
X-Google-Smtp-Source: ABdhPJx5kwfHCZMlpRm78VIoPM3QiXYGKFaDNwWxZdXKOdAesao/jzAi9FBP6y1XMGvldwVapjqAnw==
X-Received: by 2002:a92:c5c6:: with SMTP id s6mr591317ilt.185.1606788591283;
 Mon, 30 Nov 2020 18:09:51 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h6sm49063iob.35.2020.11.30.18.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:09:50 -0800 (PST)
Received: (nullmailer pid 3495971 invoked by uid 1000);
 Tue, 01 Dec 2020 02:09:49 -0000
Date: Mon, 30 Nov 2020 19:09:49 -0700
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: dp-connector: add binding for
 DisplayPort connector
Message-ID: <20201201020949.GA3495918@robh.at.kernel.org>
References: <20201130112919.241054-1-tomi.valkeinen@ti.com>
 <20201130112919.241054-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130112919.241054-2-tomi.valkeinen@ti.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Nov 2020 13:29:18 +0200, Tomi Valkeinen wrote:
> Add binding for DisplayPort connector. A few notes:
> 
> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
>   as the HPD could also be handled by, e.g., the DP bridge.
> 
> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
>   is not strictly required: standard DP cables do not even have the pin
>   connected.
> 
> * Connector type. Full size and mini connectors are identical except for
>   the connector size and form, so I believe there is no functional need
>   for this property. But similar to 'label' property, it might be used
>   to present information about the connector to the userspace.
> 
> * No eDP. There's really no "eDP connector", as it's always a custom
>   made connection between the DP and the DP panel, although the eDP spec
>   does offer a few suggested pin setups. So possibly there is no need for
>   edp-connector binding, but even if there is, I don't want to guess what
>   it could look like, and could it be part of the dp-connector binding.
> 
> * No DP++. I'm not familiar with DP++. DP++ might need an i2c bus added
>   to the bindings.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../display/connector/dp-connector.yaml       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
