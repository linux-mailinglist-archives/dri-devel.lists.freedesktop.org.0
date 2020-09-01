Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F2258C8A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580F6E84A;
	Tue,  1 Sep 2020 10:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B016E84A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:15:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c19so631850wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pLH5AgoXpGhrsa52Snk5FTxJg17QsSXpFgLhDFft8A8=;
 b=PMBDWRUakdzD/jr80kyIq+4cV4eItksbqtzmUVtT9bBy1KJgBPXj12wNX3nuC6Ahew
 LOcXOIzjHsZlLprIfs6HNEoE0n3CGzyINJNPq4lofZ2mTqUQF/eK53ulKHrMJbWfgLOK
 cXUknc6CfPgJl81+C49+m3lzKG/EGiKqUYQtJ7ihoykCERFsYrSAqk6s29tMoqrA/aT0
 MvXWt62XX1MYlAuAJekkzKVTBVfUE3y5rCQPXc+Mb0wn80MMh8H9Im5C9A4u0HM5jY6w
 aNhgEsTxla+bgjkya0YCY24QHahKX719meWsRpKB+tOkEgM3F5+fkBVzhz5JIFsKonnV
 i2KQ==
X-Gm-Message-State: AOAM53205Z/bWCH9lTh1XioEWRb7Nd9niXc2pJkX9DA3g299HJyzgsck
 W6dY9LdwsQaOdhu1wQnOMlo=
X-Google-Smtp-Source: ABdhPJwg2dcdM6+5RfvAb5uRSTytSw6wmKRiuo8vRcUAavtF9U7ySqhFZpn0KffXgkNU3dhursmPFw==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr1030648wmh.23.1598955337291;
 Tue, 01 Sep 2020 03:15:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id e18sm1792617wra.36.2020.09.01.03.15.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 03:15:36 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:15:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [RFT 2/4] ARM: dts: exynos: Move fixed clocks under root node in
 Exynos3250
Message-ID: <20200901101534.GE23793@kozik-lap>
References: <20200829172532.29358-1-krzk@kernel.org>
 <20200829172532.29358-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829172532.29358-2-krzk@kernel.org>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 07:25:30PM +0200, Krzysztof Kozlowski wrote:
> The fixed clocks are kept under dedicated node fixed-rate-clocks, thus a
> fake "reg" was added.  This is not correct with dtschema as fixed-clock
> binding does not have a "reg" property:
> 
>   arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 42 +++++++++++++------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
