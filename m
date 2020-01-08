Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBF1344D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 15:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226056E2E8;
	Wed,  8 Jan 2020 14:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BF36E2E8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 14:19:57 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r27so3690734otc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 06:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2PhRz0nUJob4vAB21QqyJ21zXO0DDwIbBt2aXu/jUhk=;
 b=hRDCn3EpiHzTSOzNqoMOr8CWa0swF85lO5LBe+6vseP+OFyfaKjUMMkFHK3EUmHbZ0
 6UIguCkaWsdaZUfbTpEp2Ymo55ZunFeNlN4SYP0l2V4JCCyKDldzsytbUsXpW7d8A8xu
 6ZWvk2vJuDzDV8wbff7qNitjU67QHWpgmSLQMJoULYwL7ly8RIzoAxJsrOHxJIzEn57W
 ANXDi7VdqLiWNZv4uPA7jAdiUvUIJu+XHYb4XiDhRp13UxDhgnrMjJGJYlJORKxAX90b
 j6UkK9hkKQSnUrPWxkZXLlbCJzbPJu7fek39LmaD0HiJotHkrT7Q0CL44vT0JuRwjv/G
 fvKA==
X-Gm-Message-State: APjAAAX9YqVYeRs3f8n+wpS6KrFrwqTsuryAszvW1RMc2TMxYr/7vrNS
 yI4mY2wkjDpiHLPU1BN6Ls2774Q=
X-Google-Smtp-Source: APXvYqw0L2Z5iRvXWNkTqJ3anuQz8uNKU6h6+2J7ATkZXPDb87Pz2GeSCzLrx3R+rrXktrudkuHvIg==
X-Received: by 2002:a05:6830:1555:: with SMTP id
 l21mr3999805otp.41.1578493196110; 
 Wed, 08 Jan 2020 06:19:56 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a74sm1125405oii.37.2020.01.08.06.19.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 06:19:55 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22001a
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 08:19:54 -0600
Date: Wed, 8 Jan 2020 08:19:54 -0600
From: Rob Herring <robh@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for Chrontel, Inc.
Message-ID: <20200108141954.GA4574@bogus>
References: <20191220074914.249281-1-lkundrak@v3.sk>
 <20191220074914.249281-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220074914.249281-2-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2019 08:49:12 +0100, Lubomir Rintel wrote:
> 
> Chrontel makes encoders for video displays and perhaps other stuff.
> Their web site is http://www.chrontel.com/.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
