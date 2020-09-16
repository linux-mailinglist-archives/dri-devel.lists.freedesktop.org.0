Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594326C59D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E136EA6C;
	Wed, 16 Sep 2020 17:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C43C6EA6C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:12:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a17so7712465wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7K53KnV3RB0dBmHomdKTRhU0IiLbQ4+LVNa0ye9IqpI=;
 b=kgVxe3nsbMu/5KSckKtt56m1QvNOqecqbl07zZq1+kfIGo6FBz8OvNfXu5pty1iT9t
 IrnkE8jppyov/qHvswYxQ8BXny1BRGFHGcPeXJUWSBasn3sdn72sEiinMCEEJNlTYGje
 y+mIPEza6UoWxoUev0VYbEoy0w8SSAnZQP0ehdNBvZg3rd1Y9ges5jNOt7mmW2VbiTwa
 Wvno8imNwO5CbrVBihqtYaaFqtsWsOHVQO5RQw99eyKN0KuIZm/AtRQeyMYpoyN+Aw3D
 1OhJ8TvjLlE2MR0pYUWV7linr1XLHCgs7fyDu2QL1oq9uxWHTQQgJ4Boqdi21inaMAnY
 8i0Q==
X-Gm-Message-State: AOAM531kYkTQg3KK4H46UnWxk33CNQhH1U3WZ12D6+0259O7AhaePpI6
 C4JXTA4/hudPf6iFUpLqhxc=
X-Google-Smtp-Source: ABdhPJxBtful0Z+qE+L5pXwSxbO+yea+lOU0v+qNQxTnSCG1x8dx7LmcGHJsv0G0v/GE5JcpanqZ4A==
X-Received: by 2002:adf:f084:: with SMTP id n4mr4551624wro.26.1600276345057;
 Wed, 16 Sep 2020 10:12:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id n11sm34074076wrx.91.2020.09.16.10.12.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 10:12:24 -0700 (PDT)
Date: Wed, 16 Sep 2020 19:12:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ARM: dts: exynos: Align OPP table name with
 dt-schema
Message-ID: <20200916171221.GC19427@kozik-lap>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-5-krzk@kernel.org>
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

On Thu, Sep 03, 2020 at 09:14:37PM +0200, Krzysztof Kozlowski wrote:
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
>  arch/arm/boot/dts/exynos4412.dtsi | 16 ++++++++--------
>  arch/arm/boot/dts/exynos5250.dtsi |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
