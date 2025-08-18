Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D951B29E2E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33BD10E414;
	Mon, 18 Aug 2025 09:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EbgmVj9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2515F10E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:41:21 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b9e41669d6so3101038f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755510080; x=1756114880; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7/6XeVgmIa+p+6b+L9eiuvQqY3NOmqfJPOHueP62RXE=;
 b=EbgmVj9WMWHWmGySRegSwQP8tc8LCU0XUOP7lbOA258ShSEnVhBv2MiwwLJ7tfolh0
 yy/MbhKqCleNAzp5myJZ9saEMRRyfly163Anm3QNj7lPfmcvuWtD5uH4LkE9kE7FI2fl
 WSagzxyPJF9BKucvhKMwJ9A1g9Jvq1xcFKxJWKXGQTkFKCfOjoBpS88YPWNXLheRNOav
 u0e1eb/z8B4oI35UwxV81ynqioM1fLwlXrfX0naF4ngxDTR705iXYrQKAQ0bxPqXmB78
 EM5uhzE8IRBK880tnzeIgtfsyFnxrPGV/c45jDUvSaMi7q0aJ+nNZUDrJnU553t53ptu
 lsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755510080; x=1756114880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/6XeVgmIa+p+6b+L9eiuvQqY3NOmqfJPOHueP62RXE=;
 b=kGR6lbpxpo0wY6OhL/h0KN/BIDEnwCR1VpaoRPLtzJGeLCnmafp/qy+9in+m5swLyu
 ch2UEoldbCmDMB5fdTV23JAw09AfZNRFef0rRyNMCu9qCGnrRs0jwXgYb3slO3AxiUOQ
 OUzYF3JkM9K5WMgDz02+juDBHRQ88opUkHtg/AI7JEBAfHSEZsJQNbPp3OtSnaHtk8nP
 Oy8U5A1jQ2bCEl7L19p4MM4sj+MNUfHepFJsSlGffGhbXa+1NdGkvxes//vH4gES2utu
 sFxYQC/kdESaEMikAmOK5l0hv/emvk2mEqigyPZImCT73BOo+BXmhfU0huJNixOiJmqZ
 Cr3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4J2nGRXBKaqB20IyQilaUYk0h0ErsPm4dNraeVZoKlny9+QNAQjKnarBz7mdkiyug/MqUOafKpfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2nfn821OXMDSUfUFBbyekZXP5cWISaoeVsFt856nRcveKmRjT
 oD3NVyprEPsL0K+DsH4nvzmV0ImppZE9M2RTUKSbjRf0Pmb+RmoZJI+l/eEwKL4rCXE=
X-Gm-Gg: ASbGncukagAcNsK5s3a9utY71UemTfsvWd+12fuXCl9J1jZQ3rzJqnC5oPXAOLXT8lZ
 7kbUU6Iugp1Iwxvo5ls9rrx4GmZdolorqxW4d9vVC47iA++PDSwnJ7U8cpA1qayIkkcxsMKTyAi
 cRst+nKcysfjf9Z8CEd9XoTo9t1Zfz0LNeVS/DZnSLZvdYN55ampIO52RNd1A5lP/9vLPpJ7zc9
 HDCRuwcjOu3N+ac2ZKvIIpfLqTkMh8RtRS91Y+XBfZv+cVPcral1uMBlF2h6puXp4s54TJJEM9u
 hE9yd7im9gpDuIfG6VaJ86iisBGtgOb6mn2DQB6C+6Tm+w+WoSUW6IeB6OP/6A9VH1qB6RENd8m
 AIKJuoPspjaO3vBOPBtn5VGvWMpATiu+Z
X-Google-Smtp-Source: AGHT+IFm/M8wUXEyOBLmxPkFEJb2HmV9g/AOtbNKPh8cmZrkqxxe9lLpbMafCp4YszxE4MeB7w3jNA==
X-Received: by 2002:a05:6000:1785:b0:3b9:10c5:b321 with SMTP id
 ffacd0b85a97d-3bc6a18bd15mr6710433f8f.44.1755510079426; 
 Mon, 18 Aug 2025 02:41:19 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d6e:23fa:76e1:25d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b899338sm86822425e9.7.2025.08.18.02.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 02:41:18 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:41:16 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <aKL1NPuZWWxsAavx@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
 <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 16, 2025 at 04:55:00PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> > On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > > Currently, the platform driver core always calls of_clk_set_defaults()
> > > > before calling the driver probe() function. This will apply any
> > > > "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> > > > tree. However, in some situations, these defaults cannot be safely applied
> > > > before the driver has performed some early initialization. Otherwise, the
> > > > clock operations might fail or the device could malfunction.
> > > > 
> > > > This is the case for the DP/DSI controller on some Qualcomm platforms. We
> > > > use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> > > > but this fails if the PHY is not already powered on. We often bypass this
> > > > problem because the boot firmware already sets up the correct clock parent,
> > > > but this is not always the case.
> > > 
> > > So, the issue is that our abstraction is loose and we register a clock
> > > before it becomes usable. Would it be better to delay registering a
> > > clock until it's actually useable? (and then maybe to unregister on the
> > > link shutdown)
> > > 
> > > > 
> > > > Michael had a somewhat related problem in the PVR driver recently [1],
> > > > where of_clk_set_defaults() needs to be called a second time from the PVR
> > > > driver (after the GPU has been powered on) to make the assigned-clock-rates
> > > > work correctly.
> > > > 
> > > > I propose adding a simple flag to the platform_driver struct that skips the
> > > > call to of_clk_set_defaults(). The platform driver can then call it later
> > > > after the necessary initialization was performed (in my case: after the PHY
> > > > was fully enabled for the first time).
> > > > 
> > > > There are also alternative solutions that I considered, but so far
> > > > I discarded them in favor of this simple one:
> > > > 
> > > >  - Avoid use of assigned-clock-parents: We could move the clocks from
> > > >    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
> > > >    from the driver. This is what we did for DSI on SM8750 (see commit
> > > >    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> > > > 
> > > >    This is the most realistic alternative, but it has a few disadvantages:
> > > > 
> > > >     - We need additional boilerplate in the driver to assign all the clock
> > > >       parents, that would be normally hidden by of_clk_set_defaults().
> > > > 
> > > >     - We need to change the existing DT bindings for a number of platforms
> > > >       just to workaround this limitation in the Linux driver stack. The DT
> > > >       does not specify when to apply the assigned-clock-parents, so there
> > > >       is nothing wrong with the current hardware description.
> > > > 
> > > >  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
> > > >    enable the new parent before we try to reparent to it. It does not work
> > > >    in this situation, because the clock subsystem does not have enough
> > > >    information to power on the PHY. Only the DP/DSI driver has.
> > > > 
> > > Another possible option would be to introduce the 'not useable' state /
> > > flag to the CCF, pointing out that the clock is registered, but should
> > > not be considered for parenting operations.
> > > 
> > > >  - Cache the new parent in the clock driver: We could try to workaround
> > > >    this problem in the clock driver, by delaying application of the new
> > > >    clock parent until the parent actually gets enabled. From the
> > > >    perspective of the clock subsystem, the clock would be already
> > > >    reparented. This would create an inconsistent state: What if the clock
> > > >    is already running off some other parent and we get a clk_set_rate()
> > > >    before the parent clock gets enabled? It would operate on the new
> > > >    parent, but the actual rate is still being derived from the old parent.
> > > > 
> > > 
> > > But... Generally it feels that we should be able to bring up the clocks
> > > in some 'safe' configuration, so that the set_parent / set_rate calls
> > > can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
> > > until we actually need to switch it to a proper rate. I see that
> > > e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
> > > sources for no reason (PHY clock rates can not be set through CCF, they
> > > are controlled through PHY ops).
> > > 
> > 
> > I don't think there is any problem with the 'safe' configuration you
> > mention. I have not tried, but we should be able to use that. However,
> > my understanding is that reparenting does not fail because the clock
> > itself is in an "unusable" state, but because the new parent is in an
> > "unusable" state. We can run the clock from XO, but that wouldn't solve
> > the problem of reparenting to the PHY (until the PHY is fully
> > configured).
> 
> 
> How would the CCF react if we return -ENA from the enable() method of
> the PHY clock if it's not available yet?
> 

With the current setup it wouldn't change anything, because the failing
operation is just the clk_set_parent() that happens from the driver core
before the clock will be enabled. It wouldn't reach the enable() method.

With CLK_OPS_PARENT_ENABLE, I would expect clk_set_parent() to fail,
which also doesn't get us any further. :-)

> > 
> > (It would help a lot if you can find someone from the hardware team at
> >  Qualcomm to confirm that. Everything I write is just based on
> >  experiments I have done.)
> > 
> > So, assume that DISP_CC_MDSS_DPTX0_LINK_CLK_SRC is already running from
> > XO, but the PHY is powered off. Now of_clk_set_defaults() gets called
> > and we get the call to clk_set_parent() while the PHY is off. How do we
> > deal with that? Returning 0 without actually changing the parent would
> > result in inconsistent state, as I described above. clk_get_parent()
> > would return the new parent, but actually it's still running from XO.
> 
> For RCG2 we already have a lot of tricks like that.
> 

That is true, although e.g. the clk_rcg2_shared_ops apply the tricks
(the caching of clock ops) only while the clock is off. When the clock
is off, it doesn't matter what we return about the freq/parents from the
clk ops. The problematic case I mentioned above would occur if the clock
is (for whatever reason) already running sourced from XO during boot.

In other words, I could imagine that implementing something like the
clk_rcg2_shared_ops for the DP clocks could fix the error I'm trying to
solve in this patch series. However, it would only work if the clock is
really off during boot and not already running sourced from XO.

> > 
> > With my changes in this series the clock state is always consistent with
> > the state returned by the clk APIs. We just delay the call to
> > clk_set_parent() until we know that it can succeed.
> 
> I know. But what happens when we power down the PHY? The clock is
> assumed to have the PHY clock as a parent, but it's supposedly not
> clocking.
> 

I don't think this is a big problem in practice, given that these clocks
are only consumed by a single driver that manages both PHY and clocks
anyway. The clock should always get disabled before the PHY is powered
down.

> Another option would be to introduce a safe config for the PHYs and make
> sure that the PHY is brought up every time we need it to be up (e.g. via
> pm_runtime).

I considered that as well, but what exactly would I use as "safe"
configuration? There are lots of PHY configuration registers that are
set based on the rate or other parameters of the panel/display
connected.

Implementing something like clk_rcg2_shared_ops could presumably work,
with the limitation that it will only work if the clock is really off
during boot and not already running from XO. Otherwise, I think the
simple approach of delaying the clk_set_parent() implemented in this
series is still the most straightforward way to solve this issue.

Thanks,
Stephan
