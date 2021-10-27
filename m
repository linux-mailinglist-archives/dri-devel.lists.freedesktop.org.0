Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2143C00D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 04:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA416E4DE;
	Wed, 27 Oct 2021 02:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B096E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:36:48 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 z11-20020a4a870b000000b002b883011c77so431801ooh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jI9z9a1gDysnVm3oa9WFdAKEz+g7d4hn8d4bMm8IgT8=;
 b=3HWI5todaUT+P4BWkGvcXU6qyZLQePyzyRfXZ1qk7lgv+MeC5fvTraorSiO6SOtHxm
 vh2/NaZao/LGSLee2H7VCb0A7+4m0YjwwtAxfC9xH8D/xteG+kpsFycrda+xKkyMvuPX
 d1n0IrP9e6poQnQ/pXEJRz2Xq3CYLecRbVzrg1IfLiT2yTXhmpK+x2h1Xa7JbnAi9PPl
 nZMX1Xo5cYhQX1HydbXWzj3lYs8DNX/lARdm61S/kypZTQqsyeT5Pinv5XnD9Hlkv92y
 L53Q38F6kGMub+eAIPq2a3xlpt+IM4Iw/o27ROERBL50++Yxm9n9jlSu3Kl0zW3U43gJ
 wqjg==
X-Gm-Message-State: AOAM531zRFW04944MBzT2qXWlHbOS9fQ2NAnQp5ramoUh16bjKzrKPSU
 ZgOxF378V9NUh5CnHwu7Sg==
X-Google-Smtp-Source: ABdhPJy/MDV6eFHTxXR0hY+EMzdIR6w+iYtsfOeayvZfm4Dp+XFmunqyQqGJXgfAvMoMD2PGe5W0HA==
X-Received: by 2002:a4a:9204:: with SMTP id f4mr20226603ooh.87.1635302208282; 
 Tue, 26 Oct 2021 19:36:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s206sm5237354oia.33.2021.10.26.19.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:36:47 -0700 (PDT)
Received: (nullmailer pid 3845431 invoked by uid 1000);
 Wed, 27 Oct 2021 02:36:47 -0000
Date: Tue, 26 Oct 2021 21:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: sn65dsi83: Make
 enable GPIO optional
Message-ID: <YXi7P1+mxj1zTDKW@robh.at.kernel.org>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
 <20211019065239.969988-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019065239.969988-2-alexander.stein@ew.tq-group.com>
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

On Tue, 19 Oct 2021 08:52:36 +0200, Alexander Stein wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
> means not available to the kernel. Make the GPIO optional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
