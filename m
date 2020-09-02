Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB725B0A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 18:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F33E6E154;
	Wed,  2 Sep 2020 16:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4741D6E154
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id ba12so5485709edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 09:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/k/jl8kCbC36+2FeLOHphrZjREiZCdM+WriURHXorE=;
 b=psOv/dM9bf6i8WG7DnzEXNOCcxIp9sG95tEGRwtZGLL+pfKlEDwzpepm9MEn4sniS+
 2gkMPJpZHxcVtXDYBI6Hvw3wsaaoEcdcfgw3CTyZPP7czImbQSs7rwgfKLJnAJgmneLM
 hCauXP2Emq2S2RlhIAXUjIZ1cMN4Dsv56AEidugLRs7S8c1btpE8Ru5pGNZ8h99FNfeM
 pCqEGJIEeaLhMkSll8Aq1anhYT87YtgBvUJxiL7Iz2qDbxRKo5c2Jgof411CCexVSYSp
 uvWp4XdWYrYuESnJvxJTCOIr/VFKQLSdBuSeUIwzUUeybMCCfy8xio6wR/UIDcmtWmCo
 IJ+g==
X-Gm-Message-State: AOAM5304bpxmggkeATr4ooeAJXc7lDgmlINFzolsbxI2n1uhuWndqlUk
 G5tm1txLySX6RBl1XXG0S1Q=
X-Google-Smtp-Source: ABdhPJwJuyNgxyGPCkUCKgxVeWeN3ahgf+XnMGbzf/ZL2QQEUetIvvJw1gbkJlFGZoRrBdx+Cq2i1g==
X-Received: by 2002:a50:d7d0:: with SMTP id m16mr772218edj.105.1599062772890; 
 Wed, 02 Sep 2020 09:06:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id z5sm4657068ejm.111.2020.09.02.09.06.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 09:06:12 -0700 (PDT)
Date: Wed, 2 Sep 2020 18:06:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lee Jones <lee.jones@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 04/10] dt-bindings: mfd: syscon: Document Samsung Exynos
 compatibles
Message-ID: <20200902160609.GA21555@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-4-krzk@kernel.org>
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
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 04:24:55PM +0200, Krzysztof Kozlowski wrote:
> Samsung Exynos SoCs use syscon for system registers so document its
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

As pointed by Sylwester, I will send a follow up to remove other YAML
file. This patch could be dropped.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
