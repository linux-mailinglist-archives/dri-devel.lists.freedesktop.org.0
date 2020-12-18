Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1A2DEAE1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 22:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B16189C83;
	Fri, 18 Dec 2020 21:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAAF89C83
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 21:18:06 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id s75so4359405oih.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 13:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=03HFPXnAxYNSTh3L20SLd4XBlw3VNwGfa9nRljaVjjk=;
 b=tvXZCpGjVp1Qq3wpP2/eBi37jMMqjHuYiKDHkbmfHQzmAe4YLMAkRTF6xZE4opNUeL
 iRF6Yj4jsN6kY3BTMYKC1BknJeoNd/eTi4PJfgtYrIv5aYEEWXJjC/2qN0J8oxDlbZ29
 f+/C6uF2bqb00knSKHxNPYkq4z80RI7RFR84s1CfysaL6vrxxUM3pL61Os6AXAxTs/pY
 77dTQ6wORbRui5Hguh97MdBjlkGPBqjgg/PJU6plYA3VU7rxM4l8dRnFDQCAPhk3bu/n
 OYF63HHYBgE2oRi38ZjZbLNCV3F6tlkZxlXzdUDHMwUydSmayQVgEmmjn6rI+z2C6JZb
 xGcQ==
X-Gm-Message-State: AOAM533XMZsjRO7XreZHzyKO9qfwEw95muNDFUKyCBknImnKMDNimIzt
 UuZ3Ciyp9pq7ZbDd3VfffQ==
X-Google-Smtp-Source: ABdhPJzp2Vn29fMDo1374G2raWeUpRvXsBe5yqSFqZr9o1/LOLXJmn9Q9gnzEAgSqaGpr8bxwrzA+g==
X-Received: by 2002:a05:6808:617:: with SMTP id
 y23mr4138266oih.84.1608326285997; 
 Fri, 18 Dec 2020 13:18:05 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g3sm1761819ooi.28.2020.12.18.13.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 13:18:05 -0800 (PST)
Received: (nullmailer pid 2191933 invoked by uid 1000);
 Fri, 18 Dec 2020 21:18:04 -0000
Date: Fri, 18 Dec 2020 15:18:04 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: eliminate yamllint warnings
Message-ID: <20201218211804.GD2190633@robh.at.kernel.org>
References: <20201207044830.1551-1-thunder.leizhen@huawei.com>
 <20201207044830.1551-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207044830.1551-2-thunder.leizhen@huawei.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Dec 2020 12:48:30 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> :52:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
> 
> ./Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> :42:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> :45:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> 
> ./Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
> :21:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> 
> ./Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> :25:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml          | 4 ++--
>  .../devicetree/bindings/display/bridge/intel,keembay-dsi.yaml         | 4 ++--
>  Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml   | 4 ++--
>  Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
