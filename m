Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6C1E5330
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 03:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BC36E133;
	Thu, 28 May 2020 01:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921636E133
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 01:37:42 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id d7so28310015ioq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 18:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nbx5PheTegOHEEr/4nd2amubzWo0SUuwMck94zzOXno=;
 b=PxUehSpWm8C+ISpvRgK35AJDpUkP5adYCvHA6CSo47p4fmoanJGDF6r5bSjnm8KfJF
 EGqNMtyPXOeQ3M5qs4JOJNP0QuMpj59AQrn9oBfNd7As6ApkwiZ3ecQnbTvgDtQXMeO/
 P0+UwIsMv8+dU67AFtMz/sDvBfBCGvIckNLkrID0Kp7/tEPuNquXdgsg+r8iA44OsE5n
 ZJXBpaHlAGw0GbnF9s0ISID7YvptGv7RW5Zgdryi45eF5bHG6xitSfG+vGj1NzCDYvQd
 wiaQ/5ncg+7d/vA8TBb+Tdolb3E0UkLNzm0mezO0sfGPmuQaaD4YKXtfviAeLlhkvQap
 FDKw==
X-Gm-Message-State: AOAM532/XlFhyW8kDZ6H6FgAbENbO2NjtqqAe7G6FDnKsf1X3Evghcyo
 5lzHe3y+LYs34h34Iw2Miw==
X-Google-Smtp-Source: ABdhPJyw9o9EnKs0HcIDKMaQ4TcrHd2XeHo+9zjE0fdpnilS5FbjfGLGSCLKvxuGkF3aQHm53AYG2g==
X-Received: by 2002:a02:3705:: with SMTP id r5mr648818jar.29.1590629861926;
 Wed, 27 May 2020 18:37:41 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n17sm2046869ili.1.2020.05.27.18.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 18:37:41 -0700 (PDT)
Received: (nullmailer pid 3175224 invoked by uid 1000);
 Thu, 28 May 2020 01:37:40 -0000
Date: Wed, 27 May 2020 19:37:39 -0600
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: Add documentation for
 LT9611
Message-ID: <20200528013739.GA3174723@bogus>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513100533.42996-3-vkoul@kernel.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 15:35:32 +0530, Vinod Koul wrote:
> Lontium LT9611 is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../display/bridge/lontium,lt9611.yaml        | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
