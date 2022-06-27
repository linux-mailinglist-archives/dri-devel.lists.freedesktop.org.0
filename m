Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4755BC40
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BDB10E132;
	Mon, 27 Jun 2022 22:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7341710E132
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 22:14:22 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z191so11086491iof.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 15:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G12kGKFA/CC0l12PAeYd8LEhOH1k7I1L6ZkakBc+ZaE=;
 b=BkPfvFS0tfGrMYJjCxm9z+EugjC2jwzKxLavQ5yKTKSXE5Psc26rV9RC3A9TMNPFHQ
 zxJpuik6zAlIUisryYlADB8HtZaacjVZvGmvzOjyoH+hKXO7ETqXJoIZXf8PtWtpA8QW
 RH+avacZFZ8Q57HQiG2YWqZZR1jrHIttagumQCzuxbeHnCxv1Hkpet1yLwVDRC6vrGo4
 1Xi69rLAwP7iCgos5vt4+vLTtk1gEMoq4E1BRd9CUhsiCIBI6Qg46Cmv2zkoyTRrWVdt
 Un0cBiUl/NyNfjq0ngILt8mMPqjK5ImwgCBzvQB4kDgwnyOUH1qr+rpfTkIclw6q0EUv
 gg+Q==
X-Gm-Message-State: AJIora8vOFvZr9mldsepYYqdYuB4kmElUWbeeNw1pCwFGskIv0lwOPXz
 znarog334DZ6H0lxKJXzIQ==
X-Google-Smtp-Source: AGRyM1s7sLRMoI6Hg6U6o9gmGtVMRF0iqeZHfuCAeN+Ad0FhLWRj2d7vrR77fK5XmD7LJXLIDhC24w==
X-Received: by 2002:a05:6638:25c8:b0:332:1f0e:3e50 with SMTP id
 u8-20020a05663825c800b003321f0e3e50mr9222054jat.5.1656368061682; 
 Mon, 27 Jun 2022 15:14:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 e39-20020a022127000000b0032e49fcc241sm5274423jaa.176.2022.06.27.15.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 15:14:21 -0700 (PDT)
Received: (nullmailer pid 3060344 invoked by uid 1000);
 Mon, 27 Jun 2022 22:14:19 -0000
Date: Mon, 27 Jun 2022 16:14:19 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <20220627221419.GA3060280-robh@kernel.org>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 01:14:05 +0300, Laurent Pinchart wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Go back to PARALLEL
> 
> Changes since v1:
> 
> - Dual-license under GPL-2.0-only or MIT
> - Rename PARALLEL TO BT601
> ---
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
