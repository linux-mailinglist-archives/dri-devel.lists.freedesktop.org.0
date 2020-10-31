Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541692A176A
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 13:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B576E122;
	Sat, 31 Oct 2020 12:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4AF6E122
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:40:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e2so5218115wme.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 05:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XKZimNoFlTDUwIyRR0BEoVG9+GJEQQemUuLJSx/vHaI=;
 b=JK+peBSdc8psVLGYltBRJpf37r0oSpbKCJANMU4+jOPJfDgaP/HalbE5feAxGZaMiY
 PEg+DjpIx0TIUL7y8j9tE7Xnlohf+4CuLyvNF13w3ph9EmoovwgsYelMdGynIEDDzafg
 TP8T+ov7mOs0ksg3OXvATGOAmiwBvrb7OyOLrNOXpfxH+Mb2txXRZ5+HTAlEF8Hh7zM5
 xUg4pVUVcD2c126WFKuMO3h5doJjCtoKZcXQqG3c4flTB6dVDElYERqbz0mBY8SIEAvE
 6WoaqTTQliZwcgZinV3Q8NrewrYps6uGQvJ55pE5fTT8ChGA24kADwc/3v03KttvG8tA
 LC/Q==
X-Gm-Message-State: AOAM531GoKHwZ2H1FqWftMK7UJKcGIpNQbNQ4RyDHUwSr+RVAM1ybp3K
 0iVRmtLazJ2xfB4XMdKvGPw=
X-Google-Smtp-Source: ABdhPJwPMaxPU+T2aWFKKta+nNXVJhIGcFvUta4TdBBI7jlBuwAQdMEe6jnIIv22dfy379m4YkqifQ==
X-Received: by 2002:a1c:61c2:: with SMTP id v185mr7888308wmb.152.1604148038915; 
 Sat, 31 Oct 2020 05:40:38 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id k22sm1430211wmi.34.2020.10.31.05.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 05:40:37 -0700 (PDT)
Date: Sat, 31 Oct 2020 13:40:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 3/6] PM / devfreq: exynos-bus: Add registration of
 interconnect child device
Message-ID: <20201031124036.GC9399@kozik-lap>
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125303eucas1p14a9de4111ffafc1870527abdea0994c9@eucas1p1.samsung.com>
 <20201030125149.8227-4-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030125149.8227-4-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 01:51:46PM +0100, Sylwester Nawrocki wrote:
> This patch adds registration of a child platform device for the exynos
> interconnect driver. It is assumed that the interconnect provider will
> only be needed when #interconnect-cells property is present in the bus
> DT node, hence the child device will be created only when such a property
> is present.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v7, v6:
>  - none.
> 
> Changes for v5:
>  - new patch.
> ---
>  drivers/devfreq/exynos-bus.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
