Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DF29A78A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1816EB3D;
	Tue, 27 Oct 2020 09:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81E6EB3E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:16:09 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id z5so1148937ejw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=te7LW0h+WnaT74s0iZ3ktDJyLfJVDjSeiQCufT7c3zs=;
 b=q6/pE60AKW0Qn0Pxz2vNzLPMVghi9TWGrnB1guG5zuYtVcjPuPQi2q9ZS8kLztzwko
 6aETyUyqM2CViKh6tTEe0osyGsXii+ntx0sqWoHcLSVLh3TAmW6SL4KlpwwZxy3dQ9I1
 DMzWMmiUTdsFLf6Tn4X8GLjvGOj15TRcXXdpwJGSftEn/8r8pNh7ePyxK3uHAJkM+1/Q
 CI5qKDpb58r05dfy8+pBk2Sr6h3g5bWMq2QZXvZGcLXfmkRcHhstLrrdc4f4ljshiVCD
 qVKKvr41eXMpryAkpjbXDRuUgxyFIRAIOD9MxgH6ZWPZcZ1rjCsIvbBgQgzonygi6uIV
 Q6Ig==
X-Gm-Message-State: AOAM532uv3WBuo7Mq10gV1J0LHoMIHCvRzp0rpJDbD+QrWNJAMP3IGhi
 1H4ht1Dyy39c5DpXxAfVTDw=
X-Google-Smtp-Source: ABdhPJxqcWEhoSvTes/dDepoyWlh45x7YW1FAkIDTwxisa/25Ndd/8eT62q8W8j1JicJvbmdEsdQ+A==
X-Received: by 2002:a17:906:eb18:: with SMTP id
 mb24mr1427378ejb.172.1603790167918; 
 Tue, 27 Oct 2020 02:16:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id qt11sm632422ejb.16.2020.10.27.02.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:16:06 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:16:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 23/52] ARM: tegra: Add interconnect properties to
 Tegra124 device-tree
Message-ID: <20201027091604.GB10762@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-24-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-24-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:17:06AM +0300, Dmitry Osipenko wrote:
> Add interconnect properties to the Memory Controller, External Memory
> Controller and the Display Controller nodes in order to describe hardware
> interconnection.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 64f488ba1e72..1801e30b1d3a 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -113,6 +113,19 @@ dc@54200000 {
>  			iommus = <&mc TEGRA_SWGROUP_DC>;
>  
>  			nvidia,head = <0>;
> +
> +			interconnects = <&mc TEGRA124_MC_DISPLAY0A &emc>,

This does not compile.

> +					<&mc TEGRA124_MC_DISPLAY0B &emc>,
> +					<&mc TEGRA124_MC_DISPLAY0C &emc>,
> +					<&mc TEGRA124_MC_DISPLAYHC &emc>,
> +					<&mc TEGRA124_MC_DISPLAYD &emc>,
> +					<&mc TEGRA124_MC_DISPLAYT &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winc",
> +					     "cursor",
> +					     "wind",
> +					     "wint";
>  		};
>  
>  		dc@54240000 {
> @@ -127,6 +140,15 @@ dc@54240000 {
>  			iommus = <&mc TEGRA_SWGROUP_DCB>;
>  
>  			nvidia,head = <1>;
> +
> +			interconnects = <&mc TEGRA124_MC_DISPLAY0AB &emc>,
> +					<&mc TEGRA124_MC_DISPLAY0BB &emc>,
> +					<&mc TEGRA124_MC_DISPLAY0CB &emc>,
> +					<&mc TEGRA124_MC_DISPLAYHCB &emc>;
> +			interconnect-names = "wina",
> +					     "winb",
> +					     "winc",
> +					     "cursor";
>  		};
>  
>  		hdmi: hdmi@54280000 {
> @@ -628,6 +650,7 @@ mc: memory-controller@70019000 {
>  
>  		#iommu-cells = <1>;
>  		#reset-cells = <1>;
> +		#interconnect-cells = <1>;
>  	};
>  
>  	emc: external-memory-controller@7001b000 {
> @@ -637,6 +660,8 @@ emc: external-memory-controller@7001b000 {
>  		clock-names = "emc";
>  
>  		nvidia,memory-controller = <&mc>;
> +

No need for blank line.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
