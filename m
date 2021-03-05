Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2332F61E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD56E3EB;
	Fri,  5 Mar 2021 22:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C9A6E3EB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:53:43 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id f3so4246669oiw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MptyKcKkrBvMdU5T4FKB96zYxJGrM+Ad5xW7zai5ozg=;
 b=iov7Z2sMxb3CLjoUWpIrsuMqs+y7LylGVkzxpIr1tFbt6/WRXno/cKQmrbFH6fWNq8
 XqjU7+e5699Kt0KwsiMIBChmvqKfXXe8tKNPWpSxnxJxcfNWd/NvGf6si7ZxN0D7L9s/
 cE+gaqqc8sY9C6vLPQFjMaF2VWrgJCXSH7hcKvK9RSMM4IJsvI6xbRRQe/qa+lboWq/0
 GkPUT0GA+It6OHP35CZ0DoLRaIMbemaHzMA2pIrQ5FNqCEaLj8I7dreK7ZCgKNTn5//P
 EmRaGdn8EPBHktDz9p1vOJY6BLj7OK+lpHU8vkyJ8G6ZdQImZ4QJ/POgTDcxJh80NdCN
 mSwg==
X-Gm-Message-State: AOAM532WV/ALVAMXJVuVFei24YWwUVTasJPZScyb1SXEGYeYArtTKLe+
 AaGeRgmrvQSp3r4DuEFknA==
X-Google-Smtp-Source: ABdhPJxdtgSbpJixrz+Z5LbK4JUHrcE45GXpKZt1VhHXd1m6xPLZB7yzMMYTbsMptezYOQkEUMS5xg==
X-Received: by 2002:aca:4a87:: with SMTP id x129mr2883349oia.107.1614984822707; 
 Fri, 05 Mar 2021 14:53:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t2sm954269otq.45.2021.03.05.14.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:53:42 -0800 (PST)
Received: (nullmailer pid 791904 invoked by uid 1000);
 Fri, 05 Mar 2021 22:53:40 -0000
Date: Fri, 5 Mar 2021 16:53:40 -0600
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 3/9] dt-bindings: display/panel: add Jenson JT60249-01
Message-ID: <20210305225340.GA791875@robh.at.kernel.org>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
 <20210218225458.823773-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218225458.823773-4-giulio.benetti@benettiengineering.com>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Thierry Reding <thierry.reding@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 Max Merchel <Max.Merchel@tq-group.com>, Shawn Guo <shawnguo@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Feb 2021 23:54:51 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Add DT binding for "jenson,jt60249-01".
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
