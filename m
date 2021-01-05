Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FAB2EB114
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4436E061;
	Tue,  5 Jan 2021 17:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CED66E061
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:11:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w5so36855601wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VnFj1rkcJWvtzQFI6dETJ2tJwVrz2a5nNVgi09YeJXc=;
 b=OCtPJEod8V3fX7qyKLgIBFvBgOGNV8h1DahKkUG9T16kQ70ucgriJ/sMGgiSbsZevG
 +fSt57uo4/4ANGyL6Pz5sj3jixZT4C7yKlgu7KZye9qdASg2iKtPAHNXKRjGWTE2Jo4E
 m3Hrsdiq+DgkP9/PPaPPB0uL8z4imKP+18FCx/gSx6zys5vXeXZOxbvsAqOpqaZwVdAl
 YF2LxG5IEzNiO3JcEZrgfix6hnFGyZ53y3EOJxaykjxx9FI79M5TXr+4I+saZyV+38Ds
 jxvbCF6F65+8xKROjijXhwQ9hpPMOh9AsAyvS4AluYeIYwLylYw5LrkOkwUy/d+Y7vLi
 7RTA==
X-Gm-Message-State: AOAM5338yC6PTe22E9r01vuzYe9YkAyzvH/3Pf4M/yQQTSqiLRbbMuUv
 mCb8mD0s6Qs/s+ZM48KJq7w=
X-Google-Smtp-Source: ABdhPJzS2tnUNQsATQJa8H0cqybMnT7xhuS0Tkf5JkW0sqRFgMdJGyc8820QQRayohYw3nqJBZqzFA==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr492225wrr.423.1609866674773;
 Tue, 05 Jan 2021 09:11:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id n12sm632321wrg.76.2021.01.05.09.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:11:13 -0800 (PST)
Date: Tue, 5 Jan 2021 18:11:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20210105171111.GC26301@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:05:50PM +0300, Dmitry Osipenko wrote:
> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
> power consumption and heating of the Tegra chips. Tegra SoC has multiple
> hardware units which belong to a core power domain of the SoC and share
> the core voltage. The voltage must be selected in accordance to a minimum
> requirement of every core hardware unit.
> 
> The minimum core voltage requirement depends on:
> 
>   1. Clock enable state of a hardware unit.
>   2. Clock frequency.
>   3. Unit's internal idling/active state.
> 
> This series is tested on Acer A500 (T20), AC100 (T20), Nexus 7 (T30),
> Ouya (T30), TK1 (T124) and some others. I also added voltage scaling to
> the Ventana (T20) and Cardhu (T30) boards which are tested by NVIDIA's CI
> farm. Tegra30 is now couple degrees cooler on Nexus 7 and stays cool on
> Ouya (instead of becoming burning hot) while system is idling. It should
> be possible to improve this further by implementing a more advanced power
> management features for the kernel drivers.
> 
> The DVFS support is opt-in for all boards, meaning that older DTBs will
> continue to work like they did it before this series. It should be possible
> to easily add the core voltage scaling support for Tegra114+ SoCs based on
> this grounding work later on, if anyone will want to implement it.

The same comment as for your interconnect work: for sets touching
multiple systems please mention the dependencies between patches in the
cover letter. Not as a reply to such remark like I make here, but as a
separate entry in the cover letter.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
