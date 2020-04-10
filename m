Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BED1A490B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849F86E220;
	Fri, 10 Apr 2020 17:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97B6E220
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:37:02 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a49so2471716otc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBvs5LwqUO7S5M6QR4lxvxc0bJWFJ0sqPahnnM7+10g=;
 b=QPseyuLN7UsNx2+qoDOWVP/PphJe3Md0Ed8X2EoaejFv4yoJn22/WfxkZBBWk+fvuL
 6EUNgbNKAeq4xBH3vAzGiCnQbRvZqhTASl7KIUd6z9eqp/wmwWg7n+IVEZUZAFOqe52d
 TRZEDcmFw3egbYVQtoZn4QHcYE8TOgugqS6pH1T01R7n4whUJMDOQg3+LbV4vnfmaBgb
 mrk93qFAW4sBhcFRaRb64m3rpEsp1wgTQpsDZiRv6b/4DIabwMAcZfEaQqawaMca5uQr
 3k50FIN4UPbxzLBVlAl6BJ6OIeSo4zJFpSiYEwLZcJeyuwYdpShtFLu0GVa6vLbhcLSP
 Jp/Q==
X-Gm-Message-State: AGi0PubgLENfNs5xW57/VVkyaEOMDHg4k711AJGBVltIOjAWZxr0cGQk
 V7jHOxMOpttauy0XU8/DdQ==
X-Google-Smtp-Source: APiQypL+sqymxMXjAk1Aso5m19W5p4BkuIoCN8DUgQmzzZdht2Km+Hfi4ZRxdegF8sh6WjgrkukfbQ==
X-Received: by 2002:a9d:5b4:: with SMTP id 49mr4807406otd.210.1586540221606;
 Fri, 10 Apr 2020 10:37:01 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id g18sm1566538oib.36.2020.04.10.10.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:37:01 -0700 (PDT)
Received: (nullmailer pid 31953 invoked by uid 1000);
 Fri, 10 Apr 2020 17:06:06 -0000
Date: Fri, 10 Apr 2020 12:06:06 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 02/22] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Message-ID: <20200410170606.GA31915@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-3-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 04:08:44 +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> external memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
