Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5D4138D1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8596B6E9D6;
	Tue, 21 Sep 2021 17:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DD36E9D6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:41:49 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so29417136otq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6b4IIW0sN4JgYgdnLZbHu/GA4zvnwxshVHJp0K1k4Ac=;
 b=gMcx+OvvvbxIrL4qZnWt0QKnTuDYg5Z+xsHdg7pN+QMshXvmF6Ie1uXc5ieHDpNXMi
 q9c+6iC1QBv5kpiLJvnew9B+bkFU4jO26ezZdf438yA7fduzjN3jnpYrLmMN1LaEIknd
 1TDku2mP6SXDIOhOFXFvCslTg6wJMm6OPCcEDAV4SvgvR2jujcXoqjVhuQnGyrLSNJf5
 HFnNJDxFU1m8ceTDC3IwTV0nQ2ayfFTTBO9kPinY5uVmv+RmXEVfYSFhQty5If1xZgfZ
 fbl28vkxdYS7h0y2yN0IjSiro1r38IAnxX5wM30GM9DxeDV/vzqwU96tKIxYqjmsTnw3
 cxUA==
X-Gm-Message-State: AOAM533nWcNdCRL6GlM5ouToP6NnYAA4OqMBFlf50oOwG+yjSmFujKVT
 G2TjX3q/xWEBUXLI82eleQ==
X-Google-Smtp-Source: ABdhPJwq32Lfdjus9F4ALYlFMLXBPgzEb5VmjZWvPnw9Sl3pngoSqz9+jwvyN2g9rSRQEgRyRuvScg==
X-Received: by 2002:a05:6830:40ca:: with SMTP id
 h10mr8440832otu.187.1632246109250; 
 Tue, 21 Sep 2021 10:41:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s26sm2011789ooc.26.2021.09.21.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:41:48 -0700 (PDT)
Received: (nullmailer pid 3020375 invoked by uid 1000);
 Tue, 21 Sep 2021 17:41:47 -0000
Date: Tue, 21 Sep 2021 12:41:47 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: Add binding for LG.Philips
 SW43101
Message-ID: <YUoZW3zfW+9W9Ouh@robh.at.kernel.org>
References: <20210909043904.12982-1-y.oudjana@protonmail.com>
 <20210909043904.12982-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909043904.12982-3-y.oudjana@protonmail.com>
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

On Thu, 09 Sep 2021 04:40:27 +0000, Yassine Oudjana wrote:
> Add a device tree binding for LG.Philips SW43101.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Changes since v1:
>  - Add regulator support.
>  - Add MAINTAINERS entry.
>  - Dual-license DT binding.
> 
>  .../display/panel/lgphilips,sw43101.yaml      | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
