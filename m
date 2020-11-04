Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0782A65D4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 15:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C576ED14;
	Wed,  4 Nov 2020 14:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EE06ED15
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 14:06:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c9so2449773wml.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 06:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S41teLRLSZ7isGd7nFyvP35fxvOeeax7aZ66a+ME5Ss=;
 b=mIf2EcjW4v3gyF+3sSp4Vnw4R+7uy1J8T3MxEd408PQeoCgfL2OBV7PxP8BW1xnYkl
 P2jCRDG1KvBN6xx/CeZ6WDqKoQjIBSyIwmyp4J9nr9iTMKvSVWNiPSylTK2aGbyuwUQr
 uxjVBjiXvZ4NCnbZ4HHLzPaiX+Je79swYvOeGBX7gnmLMKaYDib4vOmaY44spjBsAPfH
 i4TELuGnFyHWRHgEOIAzfiv3tdUhyNIV/Du4k97UM51pwDJXhfMT/RqqyD0QPaBps0cW
 te5zuR4XFY8Z9awdzF9HsPF/2QAupwhvwqjAR6ZgEkWRykNtYpK5FxKZkDbkwCSfWWYv
 qekA==
X-Gm-Message-State: AOAM533KyTVShZER8qQTxbvA2IZa54mLoVwDnHK3R7u/sLp/cRztT+/o
 cQ5e1aNTn36cc1vz8eZkeIw=
X-Google-Smtp-Source: ABdhPJzub2Qdl39XwePCwW5f4Na1s1gFDl9l1dWju07Y2lOINxiR82U83DMQ2PjXZBKrxm2EzbTIJg==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr5089187wmf.154.1604498779470; 
 Wed, 04 Nov 2020 06:06:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id g186sm6885889wma.1.2020.11.04.06.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 06:06:17 -0800 (PST)
Date: Wed, 4 Nov 2020 15:06:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 2/7] interconnect: Add generic interconnect driver for
 Exynos SoCs
Message-ID: <20201104140616.GA3024@kozik-lap>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103720eucas1p1014217e751a681796ed508af22c6bb12@eucas1p1.samsung.com>
 <20201104103657.18007-3-s.nawrocki@samsung.com>
 <20201104123729.GA13371@kozik-lap>
 <346da718-2340-c862-9a1a-c5f64aae19c2@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <346da718-2340-c862-9a1a-c5f64aae19c2@samsung.com>
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
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 02:22:37PM +0100, Sylwester Nawrocki wrote:
> On 04.11.2020 13:37, Krzysztof Kozlowski wrote:
> > On Wed, Nov 04, 2020 at 11:36:52AM +0100, Sylwester Nawrocki wrote:
> 
> >> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
> >> index d203520..c2f9e9d 100644
> >> --- a/drivers/interconnect/Makefile
> >> +++ b/drivers/interconnect/Makefile
> >> @@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
> >>  obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
> >>  obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
> >>  obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
> >> +obj-$(CONFIG_INTERCONNECT_SAMSUNG)	+= samsung/
> >> \ No newline at end of file
> > 
> > This needs a fix.
> 
> Corrected, thanks for pointing out.
>  
> >> diff --git a/drivers/interconnect/samsung/Kconfig b/drivers/interconnect/samsung/Kconfig
> >> new file mode 100644
> >> index 0000000..508ed64
> >> --- /dev/null
> >> +++ b/drivers/interconnect/samsung/Kconfig
> >> @@ -0,0 +1,13 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> >> +config INTERCONNECT_SAMSUNG
> >> +	bool "Samsung interconnect drivers"
> > 
> > "Samsung SoC interconnect drivers"
> 
> Changed.
> 
> >> +	depends on ARCH_EXYNOS || COMPILE_TEST
> > 
> > Don't the depend on INTERCONNECT?
> 
> This file gets included only if INTERCONNECT is enabled, see
> higher level Kconfig file.

I missed the include part, looks good.

>  
> >> +	help
> >> +	  Interconnect drivers for Samsung SoCs.
> >> +
> >> +
> > 
> > One line break
> 
> Fixed.
> 
> >> +config INTERCONNECT_EXYNOS
> >> +	tristate "Exynos generic interconnect driver"
> >> +	depends on INTERCONNECT_SAMSUNG
> > 
> > How about:
> > default y if ARCH_EXYNOS
> 
> OK, added.
> 
> >> +	help
> >> +	  Generic interconnect driver for Exynos SoCs.
> >> diff --git a/drivers/interconnect/samsung/Makefile b/drivers/interconnect/samsung/Makefile
> >> new file mode 100644
> >> index 0000000..e19d1df
> >> --- /dev/null
> >> +++ b/drivers/interconnect/samsung/Makefile
> >> @@ -0,0 +1,4 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +exynos-interconnect-objs		:= exynos.o
> > 
> > What is this line for?
>  
> That allows to change the module name, so it's exynos-interconnect.ko
> rather than just exynos.c. It's done similarly for other SoCs in 
> the subsystem.

Thanks, makes sense.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
