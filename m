Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1291F31E1E1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 23:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B906E7FE;
	Wed, 17 Feb 2021 22:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7D6E7FE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 22:16:04 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id x19so3431625ooj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 14:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XKet1JbM+aJWADXeIYWLp2l1i6qo86WODE/HKMEcGRM=;
 b=nQDZZ52NbTRe8Aj8xRU+Z1rS1Wy61uYRZ3HrBF9CbPPgxt0mmGIuyZZ9gURFugyCQD
 ysjXJBnZRdYP8qf79ZdB8BvGVqwSAwkjwelbjLXZKMw4UkI+O2CcLy0f5aT3ZwJyW2GB
 jljFz61ArnRKv0QX/xBY9xyQrSfhwcOXF8ATQkSGSitqNN6yJIH2czCcd1H25U16om9s
 laeZ8cOV7trpVjPUaiyVae7q9DNXpWXNBTh2uE2tJWeh8aTJ4v2aYkoGEyFYYI65qF5S
 2c+drjwJxXCnbufwUJmD5d+RsTK0IxpQbuJ4ggzY2IcLi/VpH6Z2T3HCoyhvO4Nlqnuf
 4dpg==
X-Gm-Message-State: AOAM532C8XRn6BNNHCq5YjSrLVWLRYaJ08x1jwnHi0F+Apj4rQt4VfIA
 msQPNyPO7wrQu7qlWG12bQ==
X-Google-Smtp-Source: ABdhPJzeCJN1pl29elqGMNL4gAn3VJZ+rgOoSIImtIilty1e0pKS5JtbIVKZ/wYBq0EXkODORBV37w==
X-Received: by 2002:a4a:98a3:: with SMTP id a32mr836135ooj.51.1613600163894;
 Wed, 17 Feb 2021 14:16:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 69sm660528otc.76.2021.02.17.14.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 14:16:02 -0800 (PST)
Received: (nullmailer pid 2878020 invoked by uid 1000);
 Wed, 17 Feb 2021 22:16:01 -0000
Date: Wed, 17 Feb 2021 16:16:01 -0600
From: Rob Herring <robh@kernel.org>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add documentation
 for LT8912
Message-ID: <20210217221601.GA2872814@robh.at.kernel.org>
References: <20210214232904.1142706-1-adrien.grassein@gmail.com>
 <20210214232904.1142706-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214232904.1142706-2-adrien.grassein@gmail.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 12:29:03AM +0100, Adrien Grassein wrote:
> Lontium LT8912 is a DSI to HDMI bridge.
> 
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>  .../display/bridge/lontium,lt8912.yaml        | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml

Other than needing to wait for 5.12-rc1 to be merged into drm-misc,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
