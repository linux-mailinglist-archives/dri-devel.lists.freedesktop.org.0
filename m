Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C1252331
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 23:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A92E6E9CA;
	Tue, 25 Aug 2020 21:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695146E9CA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 21:54:44 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i10so91629iow.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 14:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AXgpF78WVo5FFCMhxBNh+NmqVg1TDWWj6afz5WYYhbs=;
 b=aAvkDAe3E1JaX8+x6RI3bIQS5FM9IiclY8zW/ohfukH4YUzU7bwzxkqc6OT5PTBw7q
 vYbs7iHclGG+6k2t096n0X9IwHcagNDCLDPTufSCFiee8Exn9kKfp30NNTUwV9/uCKt/
 sijm7upwLZPJO155Ht1Xwr8EtImi33UrlElrPpXvWxkfNTjSK4Z+FdjqodSnY2WWHX4w
 +fJQY69TEY8STNgb0LLUUNn9vtOF6zjMmrAkFyHF08As1gEkdrw8vFI276HGe0Dn77LH
 zlcRZKIrlOEflS5Gkh4is0K4+gFOjNzkMfVR/kx9jtGLcvdNK4AnT7Dc1mBt/YuIEdkv
 Uwsg==
X-Gm-Message-State: AOAM532VUEmKyp7QvHffnvsYbnXhyqWRnm0QmqPPWs5s7882MdcW5Hea
 gdPPQbsqEzs/V+1ap+Lvh/yIuG1WTdlZ
X-Google-Smtp-Source: ABdhPJypF+PZ2Q26P3uIyId/gUF6uvU9h3TD4NtAGvuNXl1cQsqt9aXVrnWkBeV3wxxrorZptjlGsQ==
X-Received: by 2002:a5d:871a:: with SMTP id u26mr10104129iom.92.1598392483867; 
 Tue, 25 Aug 2020 14:54:43 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id k7sm46346iow.21.2020.08.25.14.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:54:43 -0700 (PDT)
Received: (nullmailer pid 1406034 invoked by uid 1000);
 Tue, 25 Aug 2020 21:54:38 -0000
Date: Tue, 25 Aug 2020 15:54:38 -0600
From: Rob Herring <robh@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: himax, hx8837: Add Himax
 HX8837 bindings
Message-ID: <20200825215438.GA1405975@bogus>
References: <20200819102246.634039-1-lkundrak@v3.sk>
 <20200819102246.634039-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819102246.634039-2-lkundrak@v3.sk>
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 12:22:45 +0200, Lubomir Rintel wrote:
> Himax HX8837 is a secondary display controller used to drive the panel
> on OLPC platforms.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v3:
> - Moved to bindings/display/
> - Added the ports
> - Converted to YAML
> - Removed Pavel's Ack, because the changes are substantial
> 
> Changes since v2:
> - s/betweend/between/
> 
> Changes since v1:
> - s/load-gpio/load-gpios/
> - Use interrupt bindings instead of gpio for the IRQ
> 
>  .../bindings/display/bridge/himax,hx8837.yaml | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/himax,hx8837.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
