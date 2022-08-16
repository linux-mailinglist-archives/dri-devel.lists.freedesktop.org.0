Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE75A00DB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFFA12BA1A;
	Wed, 24 Aug 2022 17:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7518B941
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:21:50 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id m9so931412ili.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=P7Z+4nprkvModK2oQu0YRid7XHVVPycAnssgkVYTrss=;
 b=yX+5sGezngXzpdVq/bA0PTiVnaG225NW3X75l102LOT8T82UMFGkSWLp7sAc2QV6He
 cWQ2vM/1FqgHcZEhFlP6nitpW+pbiGcVOs4OJaJVfDu8Naqv9gnbOQekZrRmrH/nsbDH
 uWDqOdwLK1GiXhd2KsGR8ptFYHDhmf5RgPqUstCsqZW3ZZwUSmkNwDHREkyih49CHgXu
 GvEevwLui1FEXy/lss9wuwjD9gTHkX0KTMO1L0Fp12Zr7pYS2/uDRThL/K0Vw54ODe3r
 qLhqdWC1FUisLQbZD6fBqAT7sEZDbq2Wa85LMi5+nAWdzRVsxE3BvtI6I+tFb1GHetUE
 gk3g==
X-Gm-Message-State: ACgBeo1EiTLnnv3XBSm0hrtc7FOIM9qy8l7ISBI0shP7/MzdLGJv6QGC
 nmPf9MTTVfLk4YrM32UAOg==
X-Google-Smtp-Source: AA6agR54seig41K6leAp26Lk+3yNKZZNjH4AvGpX9uT+AQUdLlhdQIcUP1zQ+2s+w9YHVCdHVoNQ/Q==
X-Received: by 2002:a05:6e02:2167:b0:2e5:cb31:f453 with SMTP id
 s7-20020a056e02216700b002e5cb31f453mr4086715ilv.179.1660670509264; 
 Tue, 16 Aug 2022 10:21:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05660213c900b0067a338211b3sm6434100iov.3.2022.08.16.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:21:48 -0700 (PDT)
Received: (nullmailer pid 2406272 invoked by uid 1000);
 Tue, 16 Aug 2022 17:21:47 -0000
Date: Tue, 16 Aug 2022 11:21:47 -0600
From: Rob Herring <robh@kernel.org>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [PATCH] dt-bindings: display: simple: Add Multi-Inno Technology
 MI0800FT-9 panel
Message-ID: <20220816172147.GA2406219-robh@kernel.org>
References: <20220812114600.4895-1-cniedermaier@dh-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812114600.4895-1-cniedermaier@dh-electronics.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Aug 2022 13:46:00 +0200, Christoph Niedermaier wrote:
> Add Multi-Inno Technology MI0800FT-9 8" 800x600 DPI panel
> compatible string.
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
