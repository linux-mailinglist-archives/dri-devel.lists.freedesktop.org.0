Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6164D6C5D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 04:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E41F10EBF6;
	Sat, 12 Mar 2022 03:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD910EBE9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 03:47:18 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id ay7so11527556oib.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 19:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=94UTeEsxQuooHcLqoJmGpm1RqHEvtqCyl7TCKVVAmBw=;
 b=5h6gPXBe1z3ewyB85DCxG5XiPHGZFZyUqbJA7bzdZ2kF8GdPBo4h4SdVAdqXD2C9Bu
 Cju+bkZhskBfU83AWYsuPmCxGYGvb0vZ9NGDHRjyF4d78ROLEjVgbI4tZk3zUUPWub2v
 mYNI487zHEFoRaOBe5u3vB11wBhjqT8DtLWWFhXnCPzYmk1gdNiKla4cBay/jqPzxpR8
 YAqWLeqzCwFlIYafZV0UGfvcVgOooUq3H9V+FLE+gKDT7P9dF3aLufmikGkFpsDhf1J3
 fQAgk0rfbN9icRBqKVkYXYKR5L18uuGikm0hTl8Kov/wKvBVt54fnz5cxDApC/HOgl4w
 /XGg==
X-Gm-Message-State: AOAM532SYul+tNvXMwtk4ljIvmmke31UdDBi9UzRtAhwC3i/gdZQA/O9
 smJpwx+RUSVlXYEXA2kNdA==
X-Google-Smtp-Source: ABdhPJx24b680DkwCLg7OQiUAd6Fu1rngGBgr+3t7LTwV5jrOQ3Up0BSQcCoCG9PmVjlG40knsS6Xg==
X-Received: by 2002:a05:6808:1208:b0:2cf:48c1:bfb9 with SMTP id
 a8-20020a056808120800b002cf48c1bfb9mr15004632oil.15.1647056837728; 
 Fri, 11 Mar 2022 19:47:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t7-20020a9d5907000000b005afa4058a4csm4543405oth.1.2022.03.11.19.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 19:47:16 -0800 (PST)
Received: (nullmailer pid 733348 invoked by uid 1000);
 Sat, 12 Mar 2022 03:47:14 -0000
Date: Fri, 11 Mar 2022 21:47:14 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
Message-ID: <YiwXwlFJgSKaBFqI@robh.at.kernel.org>
References: <20220311170240.173846-1-cbranchereau@gmail.com>
 <20220311170240.173846-5-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311170240.173846-5-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Mar 2022 18:02:40 +0100, Christophe Branchereau wrote:
> Add binding for the leadtek ltk035c5444t, which is a 640x480
> mipi-dbi over spi / 24-bit RGB panel based on the newvision
> NV03052C chipset.
> 
> It is found in the Anbernic RG350M mips handheld.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  .../display/panel/leadtek,ltk035c5444t.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
