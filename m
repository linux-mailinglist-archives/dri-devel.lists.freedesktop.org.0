Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04E29A777
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08836EB3B;
	Tue, 27 Oct 2020 09:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E276EB3B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:12:52 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id bn26so1144320ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rkTOJNhgqfjihtuFuHc1NI7BlUt+PrDPH7izoflCQ8M=;
 b=oeL/GV1ecFdfrnG8oqF1q0jw/ApTXnFKMFHvmhLsm/X+WSpUZm+OsQnUYRpFuV1gdL
 aiavqbFaYPtw4BoHYrwCiuzrrIrTNBAL2wpqvnqKZajDadw2KZAXmNWLLLuqF1YGACMk
 7wUZQy7Z+qlo+Ll/pzGgt1VlUaHgGvscddXdNZiW7KLLAA1AUM8/JAwfW+C+dLXN0SeO
 gsPoNgTHdlL3dCYZ/YQaKH+swALgH7ZTcWZYth1WDSJpbeJYtiwy+cfVkrzprFEZ81lh
 XuF6q7r6UbzxmzaCCFqOadd/McRbZDknmr5OL/xJ5Z0iC1t5lMb6RB6IG4h2PVlJlGYw
 qeKQ==
X-Gm-Message-State: AOAM530Pd9E3xbegqkZCLXDtsszcloS5ADUqSoGZg+i2gkyb948kXTsJ
 mXqhHgdqLnvw1tAPWHw2dS8=
X-Google-Smtp-Source: ABdhPJzAZzA9uwmXL3AkXYVSo4qgHt2bA2oRWoI60v3h9p28vmDNv6sjwbIR6P2su/8plSniyaH4Sw==
X-Received: by 2002:a17:906:3b02:: with SMTP id
 g2mr1472975ejf.512.1603789971006; 
 Tue, 27 Oct 2020 02:12:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id r9sm537129edt.3.2020.10.27.02.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:12:49 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:12:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 21/52] ARM: tegra: Add interconnect properties to
 Tegra20 device-tree
Message-ID: <20201027091247.GK4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-22-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-22-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:17:04AM +0300, Dmitry Osipenko wrote:
> Add interconnect properties to the Memory Controller, External Memory
> Controller and the Display Controller nodes in order to describe hardware
> interconnection.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 9347f7789245..2e1304493f7d 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -111,6 +111,17 @@ dc@54200000 {
>  
>  			nvidia,head = <0>;
>  
> +			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,

I think you just added the defines and did not include them here, so
this should not even build. Did you test it?

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
