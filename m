Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46874286313
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8031B6E951;
	Wed,  7 Oct 2020 16:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12576E951
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:03:40 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e20so2246290otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+uNSeizGcMO7Ee5Wm/T6nY+XKp+ooy1QRpr9WDpeJbY=;
 b=VW6ckoRG8sHDDnSv/vBbkAFhiif31+uhYZG/MJ1/LhB0DH1pqNvl1n9uSn2qi6Q/Pi
 zKMAY3Zi8X3BiW7Hj5YaNwUajgn22FnRziM+GIMdoTcHWJ17zsb3MS6MOYj5m0JGo/SO
 X0ncmqbqKq34ykb1kONuY9daS50pPlWS9TvYcuAMkWPumS2Dwjwohj7jrVLpyUvancbT
 16DzrAAvsf4G5dNspPtnIAGLKXi/cKEjQMLtukMx3FVBPVNVj8oyLYVjziwADJvzt6ua
 r0Ww+S5uaEq3BKUBJ4tRzme/x+oob1Tmst9+7Wo5yBfyYQKg8y2EZZIV4Nq5A81+9NwI
 IiRw==
X-Gm-Message-State: AOAM531E2Akx12+IpNDUIRJZL2GWw30e+0LZCHw20kvSkPw0+lSz2/DE
 IT/tzaJ3Zrrv4AMrSumZ+Q==
X-Google-Smtp-Source: ABdhPJw/5GryXG7VqIPVylRV4dslWYWz/IEnv2+DafmBdeBYRU9P1WROTz2hQvp6x9hZgpcHFYjAgA==
X-Received: by 2002:a05:6830:14d7:: with SMTP id
 t23mr2336553otq.204.1602086620287; 
 Wed, 07 Oct 2020 09:03:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z25sm2631510ood.21.2020.10.07.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:03:39 -0700 (PDT)
Received: (nullmailer pid 302110 invoked by uid 1000);
 Wed, 07 Oct 2020 16:03:38 -0000
Date: Wed, 7 Oct 2020 11:03:38 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20201007160338.GA302057@bogus>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007012438.27970-4-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Oct 2020 04:24:34 +0300, Laurent Pinchart wrote:
> When the PCB routes the display data signals in an unconventional way,
> the output bus width may differ from the bus width of the connected
> panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> 
> Add a bus-width property to describe this data routing.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Fix property name in binding
> ---
>  .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
