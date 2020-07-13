Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D058521E418
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 01:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBD66E835;
	Mon, 13 Jul 2020 23:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7B6E835
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 23:59:38 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l17so3940748iok.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=459d77cK5HS2FH2dcRqpFw2lnIuuj+dUdJALm7saacU=;
 b=ipFyKRwnC3iKYtXE/rKJiLf2zOoGpxQZXBXqAwwXEO9VkZb/hxFCaiNEjde+shI094
 v26DqG0aNlbaAq5TMTqreBiaElGF24oPM2P+lNSAvteFdvBBFwrwvdyYU66BuzEmS0wO
 OiOHZxBEw207Ah7rdxUunxU2b3rRtjLtvmh6/8x2hbWXVHPtrf11F37HBW8SOJzngzzJ
 9L3VEWhGYHwlaLCCmTjjdnXaHhBgoewxG6MStWJKv+atLgeM81mFFNhK90VT0xGNJix/
 QZ4FFfAvFaD6u8E/LRDh4E7GmOT/8BX1azHa/D/CRPSST1vLNkmhrBjpYUWzfPSIr5Zd
 Dx7A==
X-Gm-Message-State: AOAM530LZofBBmTmURWmncR56fzMbEQMWZsP4Y2HD918gTtun/+mk4e9
 FBS2jGknsfvMpjAN/wfTHw==
X-Google-Smtp-Source: ABdhPJyPlbc1aSPv3+AKY7qOpV+xg3N05oqCGPQx7urbOOGaG7CZ/c1mLdcI+ruLuZoGOJzCXS9DwQ==
X-Received: by 2002:a6b:6e11:: with SMTP id d17mr2391954ioh.102.1594684777722; 
 Mon, 13 Jul 2020 16:59:37 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a1sm8971534ilq.50.2020.07.13.16.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 16:59:37 -0700 (PDT)
Received: (nullmailer pid 961887 invoked by uid 1000);
 Mon, 13 Jul 2020 23:59:36 -0000
Date: Mon, 13 Jul 2020 17:59:36 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: media: renesas, fcp: Make
 power-domains mandatory
Message-ID: <20200713235936.GA961843@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Jun 2020 03:47:28 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
