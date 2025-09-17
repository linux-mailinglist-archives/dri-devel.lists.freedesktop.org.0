Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FAB8080C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18E510E27A;
	Wed, 17 Sep 2025 15:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189C10E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:24:49 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7726c7ff7e5so5525842b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122689; x=1758727489;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8bY/asBqVOnDWFE5LcHmnDOT5AoWMNTr7WSHO+9CO+k=;
 b=wVU8hHziwm2xGGmtNRQ5hNQqoQF1YzdnurKd/xtCfsPgc8oRUqbfYHAM3yCaYeGLq7
 QxZ+aUnR3IXNI7AYPw/sN6IEsk7C9nd65Jw4E0RwA8ONWmu9Qq+KQwLWFrL53iPowzYI
 UhQgE60DI/JJZQxuai1mwcbkyPSy/DDiVDnaOWq3Ilfwen2AqhzXkDQ55AKdDuPDxc8t
 35dwAOi1JbcSgLu+Etj05feTa5kPR0H975Q5zWVixqXPaXwYwHtIdU+qdNuOlmLtyt1B
 ItZTZrF8ygrie91939OD/AdEMTDyf7Xt5G2z2ohqxDBYA+ryuiQwt7rB2kYy/snQX0ZK
 iczA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpGBXrxO4fTF8aAimkX2bf6SGC+DJDW8+lUWRo25g957adslNRe6JDJrytJG2UpR+ramBhj2k08gU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8+AdzwXthw23CJ1dIcbswdM5GBPgEk1SWMIkAD/vXm62isEXF
 jYyrg9/TwNoWr4ahnpEeVol8wfCheHiPe4xlJB6rDLZgk9KCQ7A8FX34p9gz5wgPTjk=
X-Gm-Gg: ASbGncskKIxpdYhZP17m4LW0d8je4G9S5rxYV+QVAr8lc7F3CJrGiUjhBFAGSlqW6XM
 XgLri/fcECYPNv9MRgv6MtIdgwDFJ7IZcTIubsi4jqtGEPgxeIXWr25zFo994Wn2OKK2l6yPAzP
 ofQ41CMvOHpgR/J694390vlG8SUngz7KJ4fSzuKepWkgzr7kT0O1jxscSixEIIbU0lVwi6wy2Nr
 K5StYB7WKVnwEtL1UxUbu6jQ8oW2hFJ0me8plyvLNTZbNDfTXPj11HUgZtkMZddTz0IJpWXGmAN
 +4ttcHA+dOWeo9gFXQvGSL8m389owv9rOTAi5RB/nwsND+6Bxr7MPIih3c/PXh7YEDly45NHYDP
 IlZSzW3CJ31DvIwjqKns2
X-Google-Smtp-Source: AGHT+IHJBEGVlWAkDnL7p8aPBmpzPuwLI6TVt47t7wf2wpFW3MFRt1QIyIXPCIevSu5aQ3ieTqwwuA==
X-Received: by 2002:a05:6a20:2449:b0:24b:1a6d:298b with SMTP id
 adf61e73a8af0-27aa3cf5b6fmr3447692637.34.1758122689322; 
 Wed, 17 Sep 2025 08:24:49 -0700 (PDT)
Received: from localhost ([71.212.208.158]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7760793b65dsm18800938b3a.9.2025.09.17.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 08:24:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Michael Walle <mwalle@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Michael
 Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
In-Reply-To: <20250915143440.2362812-3-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
Date: Wed, 17 Sep 2025 08:24:47 -0700
Message-ID: <7hv7lhp0e8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Michael Walle <mwalle@kernel.org> writes:

> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong.

Hmm, it also seems wrong to me that the clock framework would cache a
clock rate when it's disabled.  On platforms with clocks that may have
shared management (eg. TISCI or other platforms using SCMI) it's
entirely possible that when Linux has disabled a clock, some other
entity may have changed it.

Could another solution here be to have the clk framework only cache when
clocks are enabled?

> Thus, disable the cache altogether.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> I guess to make it work correctly with the caching of the linux
> subsystem a new flag to query the real clock rate is needed. That
> way, one could also query the default value without having to turn
> the clock and consumer on first. That can be retrofitted later and
> the driver could query the firmware capabilities.
>
> Regarding a Fixes: tag. I didn't include one because it might have a
> slight performance impact because the firmware has to be queried
> every time now and it doesn't have been a problem for now. OTOH I've
> enabled tracing during boot and there were just a handful
> clock_{get/set}_rate() calls.

The performance hit is not just about boot time, it's for *every*
[get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
mailbox, etc. to remote core), this may have a performance impact
elsewhere too.  That being said, I'm hoping it's unlikely that
[get|set]_rate calls are in the fast path.

All of that being said, I think the impacts of this patch are pretty
minimal, so I don't have any real objections.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index c5894fc9395e..d73858b5ca7a 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
>  
>  	init.ops = &sci_clk_ops;
>  	init.num_parents = sci_clk->num_parents;
> +
> +	/*
> +	 * A clock rate query to the SCI firmware will return 0 if either the
> +	 * clock itself is disabled or the attached device/consumer is disabled.
> +	 * This makes it inherently unsuitable for the caching of the clk
> +	 * framework.
> +	 */
> +	init.flags = CLK_GET_RATE_NOCACHE;
>  	sci_clk->hw.init = &init;
>  
>  	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
> -- 
> 2.39.5
