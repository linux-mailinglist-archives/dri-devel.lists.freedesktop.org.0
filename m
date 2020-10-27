Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DC29A641
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390496EB24;
	Tue, 27 Oct 2020 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E66EACF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 05:10:16 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t22so135179plr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 22:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RQEP5hZqG2K6tNEaxMR+sF9wkLrep88WEdk8ACgqhWM=;
 b=OeplTnTZ8cios1tUcJtmxMxW/XjtujPrVbRNVQkBWUo4Vm/OisXbot5tqg0LhW7HKR
 CRS6gMNiU0N8Fvs7b8uedyYRTq64pVs9n9m4CmfPdOrVH24s1utC/sk0EfpFXKn+DsNT
 9VqIkZYIiSIM0UZfHkKrgoK4TyD9wD270321/i+TDSXRvB0f4CGZPfhQaNfCbpQBMyeB
 wtiDnlZ1Ruq4hB6OB8CxVDQpxy5GfEbwFlzqmI6NP5rukik+NpHmD+aiDe21PclM9aag
 78s984K5fddIvkYrh4dRtcAZfews6H8YgME97CBLV3XsML64ABIWydNoC/7knVQ82P9E
 1WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RQEP5hZqG2K6tNEaxMR+sF9wkLrep88WEdk8ACgqhWM=;
 b=YLQeUpDFYnTdvGuFCB2udtKuhTyNEUamX1qq5haseFahz3nJzsYZGgEfOnJeXtR6CT
 SlQaLxw/PsUEqHCzJ4Zm5Md2BFD3YUgAVzoSdTYdRdCNg5IA8sR6chwUl//u0Ia9e1iJ
 6It7hxeO9IWNNVnGwAyXmcFVHoRxuHSBbnkIAJINCyDyCvisSsthXwkRawoX1Ya75K6G
 pnrRAfjshNmgjHKrq8bp3aZgWDbSTIEkXx+RxnClGrooDsr7BLZUubi7Gbo4GtsCX0+9
 IMt45P68qLcfBwr5r46eFqNTkRH1CaovUNfDrKUps0yt9gamFjUl88njtzntB5IE+XP9
 vj5Q==
X-Gm-Message-State: AOAM5338QoqS3Z+tuVj7NY/mt07UeB58/IFImqD/hyllZH6OzgsnpKYj
 awRs3JphdGnYaPI6rg2PtxWnew==
X-Google-Smtp-Source: ABdhPJw9l/c3Wv/MhYdUbVpRNKWIf4C4NW8ScWjU3o6CL+b7zdCKwHqnNirDSxp55Qgd4nrtwV6jvQ==
X-Received: by 2002:a17:90a:8906:: with SMTP id u6mr427458pjn.35.1603775416396; 
 Mon, 26 Oct 2020 22:10:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id i21sm379783pgh.2.2020.10.26.22.10.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2020 22:10:15 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:40:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 46/52] opp: Put interconnect paths outside of
 opp_table_lock
Message-ID: <20201027051013.5gr4s3wuuwxsd7ax@vireshk-i7>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-47-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-47-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:12:06 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26-10-20, 01:17, Dmitry Osipenko wrote:
> This patch fixes lockup which happens when OPP table is released if
> interconnect provider uses OPP in the icc_provider->set() callback
> and bandwidth of the ICC path is set to 0 by the ICC core when path
> is released. The icc_put() doesn't need the opp_table_lock protection,
> hence let's move it outside of the lock in order to resolve the problem.
> 
> In particular this fixes tegra-devfreq driver lockup on trying to unload
> the driver module. The devfreq driver uses OPP-bandwidth API and its ICC
> provider also uses OPP for DVFS, hence they both take same opp_table_lock
> when OPP table of the devfreq is released.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 2483e765318a..1134df360fe0 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1187,12 +1187,6 @@ static void _opp_table_kref_release(struct kref *kref)
>  	if (!IS_ERR(opp_table->clk))
>  		clk_put(opp_table->clk);
>  
> -	if (opp_table->paths) {
> -		for (i = 0; i < opp_table->path_count; i++)
> -			icc_put(opp_table->paths[i]);
> -		kfree(opp_table->paths);
> -	}
> -
>  	WARN_ON(!list_empty(&opp_table->opp_list));
>  
>  	list_for_each_entry_safe(opp_dev, temp, &opp_table->dev_list, node) {
> @@ -1209,9 +1203,22 @@ static void _opp_table_kref_release(struct kref *kref)
>  	mutex_destroy(&opp_table->genpd_virt_dev_lock);
>  	mutex_destroy(&opp_table->lock);
>  	list_del(&opp_table->node);
> -	kfree(opp_table);
>  
>  	mutex_unlock(&opp_table_lock);
> +
> +	/*
> +	 * Interconnect provider may use OPP too, hence icc_put() needs to be
> +	 * invoked outside of the opp_table_lock in order to prevent nested
> +	 * locking which happens when bandwidth of the ICC path is set to 0
> +	 * by ICC core on release of the path.
> +	 */
> +	if (opp_table->paths) {
> +		for (i = 0; i < opp_table->path_count; i++)
> +			icc_put(opp_table->paths[i]);
> +		kfree(opp_table->paths);
> +	}
> +
> +	kfree(opp_table);
>  }

Never make such _fixes_ part of such a big patchset. Always send them
separately.

Having said that, I already have a patch with me which shall fix it for you as
well:

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 4ac4e7ce6b8b..0e0a5269dc82 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1181,6 +1181,10 @@ static void _opp_table_kref_release(struct kref *kref)
        struct opp_device *opp_dev, *temp;
        int i;
 
+       /* Drop the lock as soon as we can */
+       list_del(&opp_table->node);
+       mutex_unlock(&opp_table_lock);
+
        _of_clear_opp_table(opp_table);
 
        /* Release clk */
@@ -1208,10 +1212,7 @@ static void _opp_table_kref_release(struct kref *kref)
 
        mutex_destroy(&opp_table->genpd_virt_dev_lock);
        mutex_destroy(&opp_table->lock);
-       list_del(&opp_table->node);
        kfree(opp_table);
-
-       mutex_unlock(&opp_table_lock);
 }
 
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table)


-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
