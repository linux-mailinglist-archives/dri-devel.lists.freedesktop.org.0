Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BFC2AEA78
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B684389F2E;
	Wed, 11 Nov 2020 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEC089AB6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 05:54:03 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i7so759736pgh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z9P2/0O75mWnsAx8oZbLnThzZUiIC3AEplGBmhCEgMc=;
 b=X8GTCLnVhPTHspNJxX3km3UYVp4nyC6BpfIOKE/DdY+uRQjvemgYnXh8VFokLkJrAS
 ZqtHrunQPVA9pFblN+6OYjTpS27k+3qzxsRuUbq4xgpRKXK+MQAEhjzLGXROppqWR9D0
 5jdgnPnuQCRevLav+EcdMJ4IWzhFftP3TpovBCaNjMjTSrs7yC7Sk5VEVbDt+MzoCUXt
 D6rESQcjx+u3Y2fMR5OPaJ2B4YTZ8PyAUAjs5NFDAJZU5Qrvtoa6xjdZuBPIoyggPRl9
 JHkOBKUfFnzo79XoomjoJgY7H3V/Q9sVxWPcTdq+Nyv3t8MJb6qbybYDXvP5J6cgEFKD
 XKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z9P2/0O75mWnsAx8oZbLnThzZUiIC3AEplGBmhCEgMc=;
 b=f2yf6dwHMpbzaX+ANWYB32xiBZStWEh7wDD0bDdNExOXVAth38QlNi17hzH89rubVi
 3ekxuY8WTPUre8grl//LJ+9xvkBgaVk5nFL+yBMt/h0CbVMA8QdgFn0rKR/T5tk5piDz
 jBUazjMWUmZeVUoBh38biYF5TeO7Eu/oLp19d95GGqcDMSbk5y3i5T9f89k808hhknCG
 GO2edCstrjf60giUmEnZ4yAh7NlmfD9YCSl8DMoY9judwedTeZfs2eHce8VYRHllN11S
 un7pwE3HVVEMn7ovZO2EEUfr80o8MatIPAO1UoncE+KTvp7Ablv6tJc2KNJJEF7S421+
 dL9w==
X-Gm-Message-State: AOAM531+3tB+28Usw5KMxShp1XUDS27lphDADBzM8dWOak5r+KtSgpMh
 83f5QgYnVzqcA4QHv3pHn6GIRQ==
X-Google-Smtp-Source: ABdhPJzCesDnaFKRgNtLIoN64pjuJ7aVVMAE9U+58KC8+aSCcNQm9J/waPMH5YmalfzWdRrq03fmZw==
X-Received: by 2002:a62:7883:0:b029:18a:e054:edf1 with SMTP id
 t125-20020a6278830000b029018ae054edf1mr21361245pfc.70.1605074042985; 
 Tue, 10 Nov 2020 21:54:02 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id p4sm909594pjo.6.2020.11.10.21.54.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 21:54:02 -0800 (PST)
Date: Wed, 11 Nov 2020 11:24:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 02/26] memory: tegra20-emc: Use dev_pm_opp_set_clkname()
Message-ID: <20201111055400.7lnooqnxo3yy4gif@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-3-digetx@gmail.com>
 <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11-11-20, 11:15, Viresh Kumar wrote:
> On 11-11-20, 04:14, Dmitry Osipenko wrote:
> > The dev_pm_opp_get_opp_table() shouldn't be used by drivers, use
> > dev_pm_opp_set_clkname() instead.
> > 
> > Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra20-emc.c | 30 +++++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> > index 5e10aa97809f..bb3f315c9587 100644
> > --- a/drivers/memory/tegra/tegra20-emc.c
> > +++ b/drivers/memory/tegra/tegra20-emc.c
> > @@ -902,7 +902,7 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
> >  
> >  static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> >  {
> > -	struct opp_table *opp_table;
> > +	struct opp_table *reg_opp_table = NULL, *clk_opp_table;
> >  	const char *rname = "core";
> >  	int err;
> >  
> > @@ -917,19 +917,24 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> >  	}
> >  
> >  	/* voltage scaling is optional */
> > -	if (device_property_present(emc->dev, "core-supply"))
> > -		opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> > -	else
> > -		opp_table = dev_pm_opp_get_opp_table(emc->dev);
> > +	if (device_property_present(emc->dev, "core-supply")) {
> > +		reg_opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> > +		if (IS_ERR(reg_opp_table))
> > +			return dev_err_probe(emc->dev, PTR_ERR(reg_opp_table),
> > +					     "failed to set OPP regulator\n");
> > +	}
> >  
> > -	if (IS_ERR(opp_table))
> > -		return dev_err_probe(emc->dev, PTR_ERR(opp_table),
> > -				     "failed to prepare OPP table\n");
> > +	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
> > +	err = PTR_ERR_OR_ZERO(clk_opp_table);
> 
> Don't check for NULL here.

My bad. You aren't checking but just converting to err. Its fine.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
