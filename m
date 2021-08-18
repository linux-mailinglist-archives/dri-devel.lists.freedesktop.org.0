Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8883EF8E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 05:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD336E342;
	Wed, 18 Aug 2021 03:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1566E342
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:55:36 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w8so865071pgf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VGIhwyovjc9cLTorbY5F7s7VUrCyo5ROsIE6mKdF2i8=;
 b=rsLZ+5+cs34CeKm8FdeypOasGszO5Z+LGg/gURNdpo/BaltaeBSvKidQFxg+U/P7vq
 S/zusxLUtdDoCDzHAq+gTq22WAB40n4Qkk0Ku4cXOc+uTEyaQRKWv/b52rLV4JZHB+rE
 GpTGxz7vZkIm7Ms92t/jEfqzxajkgCcDGx/hfYVqqHH+Ja2QK6EJtgOjTFD7Mons7/7z
 jRQRosrCR9tYeU2COXGJUOTnQsHGWC5eYAYHYZf+lDoWMOvzM0YqaRI8vzA1Q6qR94h5
 JdL36SX2xj7RIzuN9CFefrR3429SFDWAFHYvDz+a1OiNH/4h5wRF/0Uqw9a4yTL9NaQb
 DX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VGIhwyovjc9cLTorbY5F7s7VUrCyo5ROsIE6mKdF2i8=;
 b=fOAvA2/7XpKWbVWpc4Zv4BPUGQ4ON2FjeAMWyAy/L92ITj/xouQRF+GXJmB6U752kF
 v9ea+IBrrQ88usoEz9tq3vRwS6HrxMz2rAWnl75CY7e2jIeYLEkuOwqJeB76p/bw49gS
 b2jQ9KIX5WPn9LSqbJz7B8xv+fk4eVoMWuvSmiYBwNAXbaBZ5x6CHfYzjCG/3YbeE8oT
 +f//BGDbecuaaXgT/NUccEmrjwREbZIx0ktuv54H2I/i4MCTixD7KtI4kVm7a3cEketw
 3GZ/bCjKTH8iJDALjuzNzQqJtR9yHv+JlafU4hRfqixEEUI/GjqinYtbN/iRzHSOZYrp
 pp8g==
X-Gm-Message-State: AOAM532idAJJosYV51hU4I/SAErNy7uOiDwu8WhS2uDSIViRktpxb0+V
 RMokAv3L1KweFZ+OspTSeGR8aA==
X-Google-Smtp-Source: ABdhPJxZ0gvNmqzlYvzU9rK9OQ8NNCMq9wCIZZhKFhU5FN4x6UJRSgCEgSUhRZIdfilYavV9v+XkrA==
X-Received: by 2002:a62:a20d:0:b029:35b:73da:dc8d with SMTP id
 m13-20020a62a20d0000b029035b73dadc8dmr7200457pff.54.1629258935761; 
 Tue, 17 Aug 2021 20:55:35 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id u21sm4880194pgk.57.2021.08.17.20.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 20:55:35 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:25:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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

On 17-08-21, 18:49, Dmitry Osipenko wrote:
> 17.08.2021 10:55, Viresh Kumar пишет:
> ...
> >> +int dev_pm_opp_sync(struct device *dev)
> >> +{
> >> +	struct opp_table *opp_table;
> >> +	struct dev_pm_opp *opp;
> >> +	int ret = 0;
> >> +
> >> +	/* Device may not have OPP table */
> >> +	opp_table = _find_opp_table(dev);
> >> +	if (IS_ERR(opp_table))
> >> +		return 0;
> >> +
> >> +	if (!_get_opp_count(opp_table))
> >> +		goto put_table;
> >> +
> >> +	opp = _find_current_opp(dev, opp_table);
> >> +	ret = _set_opp(dev, opp_table, opp, opp->rate);
> > 
> > And I am not sure how this will end up working, since new OPP will be
> > equal to old one. Since I see you call this from resume() at many
> > places.
> 
> Initially OPP table is "uninitialized" and opp_table->enabled=false,
> hence the first sync always works even if OPP is equal to old one. Once
> OPP has been synced, all further syncs are NO-OPs, hence it doesn't
> matter how many times syncing is called.
> 
> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/opp/core.c#L1012

Right, but how will this work from Resume ? Won't that be a no-op ?

-- 
viresh
