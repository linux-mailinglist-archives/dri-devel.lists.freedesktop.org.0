Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89D26C59F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08C6EA73;
	Wed, 16 Sep 2020 17:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694C6EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:13:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w5so7704002wrp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zyl8TJrhVfTe2TXHn1Ylm3CaGAI0Eut0vrDhMWKREwU=;
 b=sLMjPcP9UugIyCqNreYZNCKK0BCt2S4faE2bxT+FlGHia0vYk29X52vB0tuWm9SOc1
 JOYEp5kXteI2OeBYJwKOyymUXB8eMVWO0Kmiyxm2nN4mzTNzQrmx0169oAGWG0se/A33
 FwMDOULLDOVyHpm1XOXcC9IAelkZKhQBKIo9kSrEGHPh8XRkelj32K3nFNvFaYSIu6FI
 sXQ9yo8PXqnWdoqNiqNhhLfypsuStS2CqKwSBfAtb4pHigQY0rOhYfmWWbYOH0M9I+zk
 xTB1BmO0LHJKlw5g+YCKY4W0/QBLPlJx3S17/nFNhmVviRsDdu/wy3hPA8cNypDc4iVC
 06Sg==
X-Gm-Message-State: AOAM531PNvU57xp3M20y0JmRA+Mwo9Xpn9BwRMFjae3KrMPrG7hqC87L
 TXXyCFWeHA8wJ1MNCfViGgY=
X-Google-Smtp-Source: ABdhPJzxTPnq22IWDSWfZN82ctZiAHt+M7IbEHPa2jzbRm5lvwD+4JIY7doBYk52EE6ZV+4m3nYEgw==
X-Received: by 2002:adf:cd05:: with SMTP id w5mr27473177wrm.62.1600276396656; 
 Wed, 16 Sep 2020 10:13:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id k8sm33846128wrl.42.2020.09.16.10.13.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 10:13:15 -0700 (PDT)
Date: Wed, 16 Sep 2020 19:13:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: exynos: Align OPP table name with
 dt-schema
Message-ID: <20200916171313.GD19427@kozik-lap>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-6-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 09:14:38PM +0200, Krzysztof Kozlowski wrote:
> Device tree nodes should have hyphens instead of underscores.  This is
> also expected by the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 +-

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
