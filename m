Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFDD3D420C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 23:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F32F6FC09;
	Fri, 23 Jul 2021 21:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07146FC09
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 21:17:51 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id r1so2780069iln.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 14:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p1I4YA5z0bAMYWdfTVPdMJOKCvxbdQgOQuioBmQ4aXU=;
 b=uSMW210OolQ8N20WjvJTUaPVWJGW5NM+M5N86f8O9pC+4aF1m4ahdd0Fe6snTnYdo9
 Z9rRoaVOPOQrjghZDFI/oPXiTRVTphfVEQpdzcc/S+BKk15tXeZ+d0CsDv+XZjM5teI1
 2d8raa+UZbsN96QkQqs53b3n4sMGJYxQndylVLYQIKrjaieR9ox1ZDfq1tMLhlPWFlU4
 twk8kAU7G7XcHbd3/hQKoP8/RkGUCNKZ/Nf3turJZx39pOSut1vtYTxak9dk0MOeetyD
 y6FP/ymv2wRSjqgT8dVEE8FUVIEom8aTRFAbdZImdIib168Pmct/H2PgH/3jbetHU0JB
 f34w==
X-Gm-Message-State: AOAM531sdraXDtt6UCL8f45OtIvaGUmBS3hYRZHI0bdg7lmkrsxtpmk+
 mTwmtFyzF1H5MJ2cSLm14w==
X-Google-Smtp-Source: ABdhPJxf/xogG2+afjIAe+EPYocLU4CDhzyjoHg/UZN4LLbiGtJjZJ43LbRQVKFv9wtDhe/8yEO1iA==
X-Received: by 2002:a92:c549:: with SMTP id a9mr4686197ilj.248.1627075071284; 
 Fri, 23 Jul 2021 14:17:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r3sm16729306ilg.20.2021.07.23.14.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 14:17:50 -0700 (PDT)
Received: (nullmailer pid 2601057 invoked by uid 1000);
 Fri, 23 Jul 2021 21:17:48 -0000
Date: Fri, 23 Jul 2021 15:17:48 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Fix graph 'unevaluatedProperties'
 related warnings
Message-ID: <20210723211748.GA2601003@robh.at.kernel.org>
References: <20210719195001.2412345-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719195001.2412345-1-robh@kernel.org>
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
 Krishna Manikandan <mkrishn@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Jul 2021 13:50:01 -0600, Rob Herring wrote:
> The graph schema doesn't allow custom properties on endpoint nodes for
> '#/properties/port' and '#/$defs/port-base' should be used instead. This
> doesn't matter until 'unevaluatedProperties' support is implemented.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml    | 6 ++++--
>  .../bindings/display/msm/dsi-controller-main.yaml           | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 

Applied, thanks!
