Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62025892F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACF86E7FE;
	Tue,  1 Sep 2020 07:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7586E096
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:09:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o20so384267pfp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E02AUVeFQVT/Yby1TXwpBy6LjVsB+G1ulzMrGLTQLsU=;
 b=FNd/akIMkL3eaopJcpGVw841qNXHifVpshOPHlo/uuzzMC1uIxR4rpF1cuEx20MJW8
 zRU3b7IXYtOiWUHE2usegI5lqkz29pQSEe7lc2Zn6kFtFUMZkTsgPTu53uMWFebd0coM
 iLMT0oFYlNnVymD+VsZPkcbeOQMjtAIsBp7DxOf1eo/wPc9H61/kybyugntRfQEZbv8D
 gwC6Tj3nw1Cui3GshhMMxUmIqh6mQUDR4d6WK83d4fAnnl0g+V9RF79Hz/YfHby4mlw7
 mR3PyKcjWV5VnHdjRO8FhwNUz77opdus4HEGeEpTBOw/d8C3bmxPjA6qWJWpAFad6iz7
 g8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E02AUVeFQVT/Yby1TXwpBy6LjVsB+G1ulzMrGLTQLsU=;
 b=W5PAQJzR7LxJSMvz3boOllYi8ZeMZZHjY4drlJc4qBeexj6GkvPBaS60w49tQcuXsT
 WmG69FO72vtymNB57COLu3y2NVKDG+4eKtF8O2XidJt2iKUTS9ksa/brY9IFKitCxYft
 etKrT6P0J+fxvN9yr+bW3Qg/RGDkf6h8vQRHsnyCJN6vw1FozCj3Cu+J4c3KzOWTXdMB
 nPGj1vSIBhpTZ6SWO6LHtG5dbIrB06NGUOsUeA1ST3lapmefDKh+PfuVEDX5TOjDAP+6
 TkQSyu+89CkKVBFUKZWn2x/VrLRchNv2aGRXJDvQ8R8B3Df4SBryoVsfzSi71EDq6Wpf
 hiUA==
X-Gm-Message-State: AOAM533z7umqplV/wHhOfbsjue4ubpuwglN0ROsX74pXst+H0y/wVssf
 kZLbPNws3pWfqvAhqMEaKxbuqQ==
X-Google-Smtp-Source: ABdhPJzSBT56cUJvUmQ1jeDl1RjMGJiu46b0HYsbuCGKuS2QrgmD92t81oKVAXJFmHCb4EhXLUuNfg==
X-Received: by 2002:aa7:9207:: with SMTP id 7mr819876pfo.156.1598872182053;
 Mon, 31 Aug 2020 04:09:42 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id u16sm7495367pfn.134.2020.08.31.04.09.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 04:09:41 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:39:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Qiang Yu <yuq825@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Clark <robdclark@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH V2 0/8] opp: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200831110939.qnyugmhajkg36gzw@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-mmc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-08-20, 11:37, Viresh Kumar wrote:
> Hello,
> 
> This cleans up some of the user code around calls to
> dev_pm_opp_of_remove_table().
> 
> All the patches can be picked by respective maintainers directly except
> for the last patch, which needs the previous two to get merged first.
> 
> These are based for 5.9-rc1.
 
> Viresh Kumar (8):
>   cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
>   drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
>   drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
>   mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
>   spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
>   spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
>   tty: serial: qcom_geni_serial: Unconditionally call
>     dev_pm_opp_of_remove_table()
>   qcom-geni-se: remove has_opp_table

During testing by some of the Linaro folks on linux-next, we found out
that there was a bug in the OPP core (which makes the kernel crash in
some corner cases with these patches) for which I have sent a fix
today which should be part of 5.9-rc4:

https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/

Please apply the patches over rc4 only once it comes out (I will
confirm by that time once the patch gets merged). Else you guys can
provide your Ack and I can take the patches through OPP tree.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
