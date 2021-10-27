Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D143CE36
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8566E8C3;
	Wed, 27 Oct 2021 16:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559526E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:01:39 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o26so5545051ljj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkCgQJkUSUXPKa9PPaG98xGW8ORLrJoeUL+lFNuAKlI=;
 b=JuXVzxzuz+qv/oGJh4H3FGcoT4i1PRfFmZGPc6lEW/N9sVUHQywzVSA6QOXoew8eMN
 2VuWytyylFxvVVv4NHBnyfc0Qf66xZSXHV0PNkrxsRogr/txx31V1QIsqMYUDW3/lS/Q
 puLCWl/i68QH+uN4xJWqYNAHxq8s/ABltDsTffJInX/ueXsemQ/gPVFmTZ93Ha2IFRxA
 fbB3/Ci3reBmhbmZLY5Agp3ldPGxwIMR97E/B9IL/d5CWC5Xg4LcOyrcEsyeLsDfw7q4
 1r0gIxWuTyvt/wIwtmEfq/EQYkL7wpbE/0EDTKaVxaRJS8WIN0jvlGqgTJ1Igaa+L78p
 ZceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkCgQJkUSUXPKa9PPaG98xGW8ORLrJoeUL+lFNuAKlI=;
 b=IHHl+eVRayITXAEDnEaFGZgyycNQlSuCrTL4Qn14/ydVELvdPEFAYKI98LaFtvomES
 S46Siuh8PG++xCjBgxwFGUY9jlNDppQvicHWwogtPubBb1bP64pNTqGQYy3a+tEhSGhz
 lIujvnd2dFEvHk9YHsLHXJaFL8Q/4/Ldl1oUfleWWVyTonSDqnABzM3R5O07K8DpEtB/
 RI4TN+uoYPd7VIjMU6Wd53ni2xuMflhoXVk1xMRq1QoqOsBuAZRUhLhtelO8jpdKwC1t
 BPy6HaTQKhNiQA/r7CQ8p4a3wLIp5wWHtwjcd3TbLXVtajWqby31FbnEZ3adCkgSQVA/
 SNuA==
X-Gm-Message-State: AOAM533iYpq0Wvnr/rqfErskIB+r1it5z4/uUTRVbzC9CKI2GjvPa+8w
 2sUmKdrAKLbLEHItYSlAN9KDs7OaQeVmbYlTKRi8ow==
X-Google-Smtp-Source: ABdhPJyLTmxvQZ0j5lQGHsFYcydy71+PhRmg+SxpLEXAm87AnzbFNmKI1TyiM271I2tAbjx+BOKyohjDU7jCER0qQM4=
X-Received: by 2002:a2e:5c45:: with SMTP id q66mr22976435ljb.273.1635350497549; 
 Wed, 27 Oct 2021 09:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211025224032.21012-1-digetx@gmail.com>
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Oct 2021 18:01:01 +0200
Message-ID: <CAPDyKFrA2Jcb5BmaFmajtdUCmpwoPjAAvPC_MhoWwjDXJynD=w@mail.gmail.com>
Subject: Re: [PATCH v14 00/39] NVIDIA Tegra power management patches for 5.17
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 26 Oct 2021 at 00:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>
> All patches in this series are interdependent and should go via Tegra tree
> for simplicity.
>
> Changelog:
>
> v14: - Fixed missing runtime PM syncing on removal of drivers, which was
>        spotted by Ulf Hansson in v13.
>
>      - clk-device driver now resumes RPM on system suspend instead of
>        preparing clock which it backs. This was suggested by Ulf Hansson.
>
>      - clk-device driver now syncs power domain performance unconditionally
>        during driver's probe time since GENPD API allows to do this now.
>        It was spotted by Ulf Hansson.
>
>      - Added new "Enable runtime PM during OPP state-syncing" patch, which
>        allows drivers to sync state at any time. Previously drivers were
>        obligated to take care of enabling RPM at the "right" time.
>
>      - Moved runtime PM initialization/uninitialization of DRM drivers that
>        use host1x channel to host1x client init/deinit phase. I noticed that
>        there is UAF problem because RPM-suspend callback waits until channel
>        is idling and channel is already released/freed during driver's removal
>        phase.
>
>      - Added system suspend support to the new NVDEC DRM driver.
>
>      - Added missing pm_runtime_mark_last_busy() to DRM driver.
>
>      - Corrected VDE GENPD patch which previously made video decoder clock
>        always-enabled by mistake if legacy PD code path was used. It was
>        spotted while we were testing VDE on Tegra114 that doesn't support
>        GENPD yet.
>
>      - Added ack from Peter Chen to the USB patch that he gave to v13.
>
>      - Changed OPP table names in accordance to the new naming scheme
>        required by the recent core OPP binding.
>
>      - Added 500MHz memory OPP entry used by ASUS Transformer tablets.

Besides those minor nitpicks/questions that I have sent for patch1 and
patch29, the series looks good to me!

Feel free to add, for the whole series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
