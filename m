Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C2833AA40
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 05:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683EC892E3;
	Mon, 15 Mar 2021 04:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AA2892E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 04:06:45 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id r16so4434822pfh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 21:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eI7ImkOM7sKEYOwpNZ2uQyL8ht6ELC4KAuDJxGH26WM=;
 b=TsLroBKaOE0Ndal3uYSavlIbCvocBVruTCmOQbtWNCTqZn34fuCTFqFvPlo8zLD9fM
 IO6v4CAcDC/jXHA7xn0roPtBnzHafVGRYUD8lfwBtTMxKxCleNiFo9fJ8rFHjAAcLLRG
 n0IBxgxySYh/5P9qNs36aern3PGV0Kb7uyoKAm7WyekwifeK1ct2o4JPyQ1IQo4HlwZ+
 40l1RBYIIqEDnveIIc7V/s/pxU7Eti6u2Sl5TecW4wLjWWQTpWhk9UCZrL8vgho1h49/
 F2BmsDsOvuWGdJf6nM5P+UwNGUZyT5QM3C9s++AMz77q/FQEl28vDvRZAA/JnZ/kvkbJ
 LAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eI7ImkOM7sKEYOwpNZ2uQyL8ht6ELC4KAuDJxGH26WM=;
 b=KUIKmq4mien7zk3NSXX9k/JUNXNA7ddL+cGEvYeDjuwYBd+oMLoArEBsGnEvuGSkpn
 tyVp9nk2lJf4/28tRZYNUVyQu2LPrL+0ir9TtPRdmkgepWXgcaC0HEAvD8HjtdgHItvi
 O1NJ8Ly0BETiIG8nwJsNoaEYzBtIKZsd4vY8evZWT4U4Dcib3toVNo5B4lFTKW4F2Sgl
 Ifl6Wm7y3IkbfJiN5H7fZ5b1j9kD6J0ZqU619A7V7lXZvoTS3oxhRmQWxnidtGMlTeOX
 sLocDN9Nq9i9pVU/cudb0AVbE6hqIJOrt+ustWMe2NRfFrg4TV8CVgpRqwTJBsb16FjO
 yOoQ==
X-Gm-Message-State: AOAM53235ksMRcABHARN7luZGdh4dsUFfza5sVA+Fi11gYFOOobPYYbS
 zDu1XornLBy52LEcT9PpTKR+TA==
X-Google-Smtp-Source: ABdhPJzvcR9VDnxHyvgDVLMJYlxMP0Ms95A2JMyXTXyYfG5+umOTG/XVCk6roapJ92EyCnrv/2+ArQ==
X-Received: by 2002:a63:1957:: with SMTP id 23mr3255166pgz.196.1615781204730; 
 Sun, 14 Mar 2021 21:06:44 -0700 (PDT)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id l20sm12327033pfd.82.2021.03.14.21.06.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Mar 2021 21:06:44 -0700 (PDT)
Date: Mon, 15 Mar 2021 09:36:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 00/15] Introduce devm_pm_opp_* API
Message-ID: <20210315040642.mw6jz7nalhthbwlr@vireshk-i7>
References: <20210314163408.22292-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14-03-21, 19:33, Dmitry Osipenko wrote:
> This series adds resource-managed OPP API helpers and makes drivers
> to use them.
> 
> Changelog:
> 
> v3: - Dropped dev_pm_opp_register_notifier().
> 
>     - Changed return type of the devm helpers from opp_table pointer
>       to errno.
> 
>     - Corrected drm/msm patch which missed to remove opp_put_supported_hw()
>       from a6xx_gpu. Note that the a5xx_gpu driver was missing the
>       opp_put_supported_hw() at all.
> 
>     - Corrected spelling of the ack from Mark Brown.

Applied all patches except 11/15.

Thanks.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
