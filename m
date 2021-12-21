Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9847C79A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 20:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866D210FE41;
	Tue, 21 Dec 2021 19:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BBD10EC22
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 19:40:01 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id a1so13851276qtx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 11:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtIIbLbI/nGMSaPhqMXkbKi1/MmnnfD6uECvU8i1Qbw=;
 b=O0Vicxq9Z94slJQ9tD/vfHEHf+5oqOO8VTy/7yefSR0l//MQ9jPU/PO1+ckikWCtbd
 V2PhXlAATKIsS22f/XlzmIzUn1CnQ2fxO3I8DXITDW/ZOUwPoaex/JwGW42igbv1zkCA
 2d6FxVlZiI2QI/3CTke/N0NV7JIpBjawqMYF800U7BHnxmZYzP5fW8AIjV9sr6/C+RQ/
 dcW/oAb+YB4ST862QGUSec0gDpHjwMOeJdQh6fxq3llvvfsGBh0mv4Bi/aXYjaqajzOy
 ba3bZlea6O8p4H9PW6l0aXqkU1ynXN6A3Hs3neyedUvaX0zP7Mj6pTw1Myv/BVNdetxZ
 MNcg==
X-Gm-Message-State: AOAM5319+JZb6qxiFJhFhkDpEClgWSUYtUxg7hj7+nFsbLy4mriTZc1m
 Ewn/88Bi0O+175T23Q7+qO7co2xWaD4x
X-Google-Smtp-Source: ABdhPJz4bdvP8ESU3Uh3QM2ba245Q9yTW11WaUOobmk6UB/3VTWBFNDKgAdQLRuzrOJqYxMOfjxdvg==
X-Received: by 2002:a05:622a:388:: with SMTP id
 j8mr3571514qtx.131.1640115600594; 
 Tue, 21 Dec 2021 11:40:00 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id 196sm13890448qkd.61.2021.12.21.11.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:40:00 -0800 (PST)
Received: (nullmailer pid 1623903 invoked by uid 1000);
 Tue, 21 Dec 2021 19:39:57 -0000
Date: Tue, 21 Dec 2021 15:39:57 -0400
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document rfkill* trigger
Message-ID: <YcItjUqxpAyhYJqW@robh.at.kernel.org>
References: <20211217170715.2893923-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170715.2893923-1-thierry.reding@gmail.com>
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
Cc: Milo Kim <milo.kim@ti.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 18:07:14 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> LEDs can use rfkill events as a trigger source, so document these in the
> device tree bindings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
