Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611432E9201
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DB89E5A;
	Mon,  4 Jan 2021 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3F3895C1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:15:35 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2so15933548pfq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x5qtGC03cGR6fBZ/P7WwG5L1MqF0Nj6bOUHj8Uj+kHE=;
 b=OAaqSR5s9Ik5xFghIWI9hC6wEO4akfqQjR1AOd5DY6Xi6Mevb8NLfqSZDyR+1BWPVQ
 0nbaAvHDIACvQtTkVUUyk4W1NyB8M+CTEIC4YreClD/ms9PJv6vmduZftbG4+VxGdOh4
 M2KFQBwKG84Zx7cCdRv4veEdNPZJFPANKBuC2fDoeERuVv3Scp7X7O8hMrqZZS6srLBv
 4klE090qhDFDneRddwMkgzplBW/qRn/Ef8pTZMWvv0IWo+yNujZjEzfyoQ9ES/u+JKZk
 ZoZvpTEodAuDAUMYxGd05rAyu5Bd5sJ6rfBLxqikk+xkarbqtpsvSayBj5tVwYSPv/Z6
 emVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x5qtGC03cGR6fBZ/P7WwG5L1MqF0Nj6bOUHj8Uj+kHE=;
 b=OKvjIuWF5ApWoiFZQuq8OZGWn6mPTaIW7kI1v3R+GAbSGQDyPcvY8gR7wzTxLl2v3A
 CyuI+Q2UFknZU52zxiWC2ZjLbPbP2EqJxk2sysOrExCZffHs1/4FfXGUZcybOdiN/F9x
 SoTtr3qUXPqmQCqSxziuoZgqGVkU8kn+kUaZ8u7ExYQJ7f8Iy03dwrC0mDO2jq+zsgei
 ZUyr3SZDw8iuL/v7ZmgRiT/jM5wNQBSX5RKbG2gjk+SQCyvOKnQAZBvkiLj9XWWgctMk
 +y0+D/tMj5V/Y2/a7YmXVHaVL6ue4xmc3GVoBcB6w9LW9qg38zbF/k0ogMmeTXi7Lain
 3Itg==
X-Gm-Message-State: AOAM5300KQwSpxAKn59icozzPxvITsaHghBEfBujPUXOUEWnOwhI6PnL
 kHIt1/41PENR0zdH06cE/oZlyw==
X-Google-Smtp-Source: ABdhPJxGFwAV2SQtVU4VNuP02uvq/Pafhur3RgVz2v7E9ia11SPp2CuAR1+kuobkLcHSmIraN1mtOQ==
X-Received: by 2002:a65:4983:: with SMTP id r3mr71474424pgs.288.1609744534592; 
 Sun, 03 Jan 2021 23:15:34 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id 22sm20354596pjw.19.2021.01.03.23.15.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:15:33 -0800 (PST)
Date: Mon, 4 Jan 2021 12:45:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 05/31] opp: Add devres wrapper for
 dev_pm_opp_register_notifier
Message-ID: <20210104071531.oyc64zgfot43gupv@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-6-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-6-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, krzk@kernel.org, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, broonie@kernel.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-01-21, 16:54, Yangtao Li wrote:
> Add devres wrapper for dev_pm_opp_register_notifier() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/opp/core.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 6b83e373f0d8..ef3544f8cecd 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2599,6 +2599,44 @@ int dev_pm_opp_unregister_notifier(struct device *dev,
>  }
>  EXPORT_SYMBOL(dev_pm_opp_unregister_notifier);
>  
> +static void devm_pm_opp_notifier_release(struct device *dev, void *res)
> +{
> +	struct notifier_block *nb = *(struct notifier_block **)res;
> +
> +	WARN_ON(dev_pm_opp_unregister_notifier(dev, nb));
> +}
> +
> +/**
> + * devm_pm_opp_register_notifier() - Register OPP notifier for the device
> + * @dev:	Device for which notifier needs to be registered
> + * @nb:		Notifier block to be registered
> + *
> + * Return: 0 on success or a negative error value.
> + *
> + * The notifier will be unregistered after the device is destroyed.
> + */
> +int devm_pm_opp_register_notifier(struct device *dev, struct notifier_block *nb)
> +{
> +	struct notifier_block **ptr;
> +	int ret;
> +
> +	ptr = devres_alloc(devm_pm_opp_notifier_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = dev_pm_opp_register_notifier(dev, nb);
> +	if (ret) {
> +		devres_free(ptr);
> +		return ret;
> +	}
> +
> +	*ptr = nb;
> +	devres_add(dev, ptr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(devm_pm_opp_register_notifier);

I am not in favor of this patch, and it only has one user, which makes
it more unwanted.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
