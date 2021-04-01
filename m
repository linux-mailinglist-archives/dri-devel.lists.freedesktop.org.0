Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF23516B3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 18:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4EE6E0BE;
	Thu,  1 Apr 2021 16:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67B46E0BE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 16:29:42 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id i3so2326235oik.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 09:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=knmO/xsZykb41plAgwrvQz8grpkqAEgxxYJ/73CKCWE=;
 b=bed3BYyMv4kii+2pB3kphGnGVDzcgwsYl3BfsI3orkT3p9xTE2ulKUt3qF4IabhNLq
 qwN5k+j551pgFCV9qaUPRo9bh+SwuF52YmY2kW8P+Xf8g4L1obNyNOlqO7+gxscrTgKx
 5XCaC7oqjyN8oe9cBBxCG+a/765EiH3m0Y6dR1E1m6jOrHUS9EzhxaRvo31858g9KVQR
 KYx+tWS2ZEeTPVZ8gvfqiiB1YhgYUxmh0HVhyWuNPUnvDA/L9Dl08HhDxkVGZfT68nYO
 QYi99xeVOgXr1AIVzVHx/B5A7UVANvE0FVWJA6UdGPauPNXBvUpNaIT/sKs56Wd2nw/y
 hNxw==
X-Gm-Message-State: AOAM533DJIZ+4p37W4hCa0heJJYMduS75j8oUKfkZMbNHJUw7Vs4lmqw
 gWMBE7V5yK6LEEpZRlr1ibgafYK0eA==
X-Google-Smtp-Source: ABdhPJzqYQv3VxOLR8ru+2W4ZEnfo876uyIkUmhSIiJEZIUULJgdpbHc5mo0gk1gZGkfZb5gQAhsvg==
X-Received: by 2002:aca:6204:: with SMTP id w4mr6803018oib.86.1617294581995;
 Thu, 01 Apr 2021 09:29:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p3sm1113076oif.53.2021.04.01.09.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:29:41 -0700 (PDT)
Received: (nullmailer pid 559094 invoked by uid 1000);
 Thu, 01 Apr 2021 16:29:40 -0000
Date: Thu, 1 Apr 2021 11:29:40 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Message-ID: <20210401162940.GA559064@robh.at.kernel.org>
References: <20210331092114.3185882-1-daniel@zonque.org>
 <20210331092114.3185882-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331092114.3185882-2-daniel@zonque.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Mar 2021 11:21:13 +0200, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../display/panel/ilitek,ili9163.yaml         | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
