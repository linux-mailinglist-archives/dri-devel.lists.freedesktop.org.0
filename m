Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCC1900DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D686E3CE;
	Mon, 23 Mar 2020 22:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5FD6E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:04:35 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id a20so8798520ioo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OxmWLYX7moIPVGiIwbbFxtiUZQmEPG+TJ66GSCPnfpE=;
 b=d5oJq7EtxhNBhwYzwoyCb/+GFtE9CVQPI5kSQnNHIyLIi+sJiBjAqN560Ww3iVttc1
 WhSVdlArmc/Fu8ZSd7cVc+tWdL3oKhcl0wVmT3nbWODYJycfwtyPEnuosjWM2dvdIRVq
 Bbu9dtJMBbhyFSg0P65WL3/MXaBT8K35GllBYPq0LyU2K/LB4hLbHOjsPdz5qdlekyns
 HA+qqCBHWphBtsMNpmRfH6gETT4tFnb95FMTW3NxF5IB8fgXs8SaeaKPBL1juoaa5kO5
 mqT3bD7fdJfNrzxEhKWbOOuDW3hpAf7WeuZbrIqgGI9ktYjL6cxdKdage6RYGcYjcmyO
 4s2Q==
X-Gm-Message-State: ANhLgQ2D+0B9yUyx9ITY/IF7+CQsDtKcIs7bUnWTaYSzidj3VkJO061N
 P7baYW3jj4CoORIwSV4FQA==
X-Google-Smtp-Source: ADFU+vvj1yTP/dxc/c85bcfJYJQxOiDFkLfIs3nP/BoYkiG+qoSkVWyO+SkPv3v6lQjXgahyel2PfA==
X-Received: by 2002:a02:390b:: with SMTP id l11mr7659387jaa.111.1585001075011; 
 Mon, 23 Mar 2020 15:04:35 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c28sm5728899ilf.26.2020.03.23.15.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:04:34 -0700 (PDT)
Received: (nullmailer pid 17421 invoked by uid 1000);
 Mon, 23 Mar 2020 22:04:33 -0000
Date: Mon, 23 Mar 2020 16:04:33 -0600
From: Rob Herring <robh@kernel.org>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: add ITE vendor
Message-ID: <20200323220432.GA16431@bogus>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-2-ple@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311125135.30832-2-ple@baylibre.com>
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
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, mchehab+samsung@kernel.org,
 sam@ravnborg.org, heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 broonie@kernel.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 01:51:32PM +0100, Phong LE wrote:
> Add ITE Tech Inc. prefix "ite" in vendor-prefixes. More information on:
> http://www.ite.com.tw/
> 
> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Already have a patch for this queued for 5.7.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
