Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC95F7960
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 16:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92FF10E958;
	Fri,  7 Oct 2022 14:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0248D10E958
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 14:01:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id 8so2562139ilj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 07:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCEqDjTqDHXCkXuuNG9mr4r8E8D6Nx9MxlUrNn9MgDM=;
 b=pTNbos4QYMEczCHZj385lKn11bWs6rYSp1GzlsyLFTXZLjDbDNopb/lGIc5qsn7W4P
 JY0p4Fh9Xgeynn6Fz9nS/o2LayQF20eJSNjZZOtHm+of7PJCk4sHpngQ4aXSOWPBq3if
 iNG/1yZkf2lrQPUpp55pEukC6HJd3HM7eulUB7bpb50ZZ+FLX3URtWyvlZ/fwvM6nZHY
 b6o8lMT8rP/f1PSoXG/8udQdlAJaQfi/8d0L6P+GjsNqkGpV+TFjzKDYXA2JD6neCBXP
 DjxG7uWuXEyH21NwwWQNTwqP7JG27gqYdiixC+F96YKyobJi+Q/pQ1umVUQSJKcrWLbL
 ATpw==
X-Gm-Message-State: ACrzQf07SLFdYBX15bdmiS2OoGDA/1rjcwSzItD5ebL8+P1gXY5zcIUK
 yQfOCQv0/iOBq/6akG/eatkW2dx9lw==
X-Google-Smtp-Source: AMsMyM5HdV6fWhkDutBBJHS69tyeSpDRy8qVNZU6pcM0qE7BeR/x8Kah7W/SLoE69+r0ieimtfxMbw==
X-Received: by 2002:a05:6e02:1bc9:b0:2f1:9ee8:246d with SMTP id
 x9-20020a056e021bc900b002f19ee8246dmr2411994ilv.246.1665151316125; 
 Fri, 07 Oct 2022 07:01:56 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a92d991000000b002e8ea827aafsm934006iln.74.2022.10.07.07.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:01:55 -0700 (PDT)
Received: (nullmailer pid 286220 invoked by uid 1000);
 Fri, 07 Oct 2022 14:01:53 -0000
Date: Fri, 7 Oct 2022 09:01:53 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <166515131260.286166.8226735356907205186.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-4-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Oct 2022 14:49:42 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - use four spaces for indentation in example (as recommended elsewhere)
> - add explicit root node
> - drop unneeded quotes
> 
>  .../bindings/reserved-memory/framebuffer.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
