Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDEF566986
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175510FC26;
	Tue,  5 Jul 2022 11:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737710E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 07:46:44 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t189so15269326oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tmakuE4H8rZY3d6iU39dHrEeioyPOU2VRNgXbaFPqgw=;
 b=u7aod0CrQMXqVD1ebu7kjSt/WcQQQkg7j6oHslRmkt+QTw/T612mRYZc8qxkE8om3O
 EQM+h21JvLKnCzpiIq4xgwUXzQLpQJOdCt1694l5ZM1mQPkjlLZ33DO+Dp91Uof0icTc
 2eCH31nP6U7iVCED/tU23T/actjjYFmw5UZLP7t0DKiBKU/nAR7cp0MXJlqAa8wI742A
 EQR0aX38sVjulvZcqY4l2O71LHN3k6M9c36toeseQylQoLjWGDZYqtxqvh3+p0Tozz/N
 XPHPZJPQNycYMom8jxQv3xsFNeAKZLSk+yfh0F9BKr8UZwwsSvArNI8r2sZRhz3icFzn
 3CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tmakuE4H8rZY3d6iU39dHrEeioyPOU2VRNgXbaFPqgw=;
 b=bmN3t9kctkC5RMUsoFr2ghP5P+9Ou8tWDqQZ8KyEfryziPQ0kS3u4CBRxNqB0k+Tcz
 EV07+8l4WeB7O8bIz0iTV7P5wzunPs3ynW/bDk55CxjRx375q61CtbT8JHBGI4m2ENBV
 VlEGkZC/qLPzyvu4O/MfdcwcSDqvyImPzTL5s/+EUTh8l8FfP/AjzeBjFyNVBfaPMDlz
 SjjEZkxVgOonhRZnIatbZ7TnCgiKMgdfGssr1MVSEDACJkye66bfVyra3F5CVHU6S3zY
 QNC6iK3yyWXiR7jl7QGwzaD1kuxlsNwcHHpb/7P4VZEZhMmniI808Gg0g59jogdr+HHk
 mmfA==
X-Gm-Message-State: AJIora/x5eWDQHqd8SvW8yRhbeVQ/dwYwt07TOx8s/hRY4rbcBAnxYT6
 ihh3w5s2EFCFvU1fc6iFYrLJUkVV0o9Yvg==
X-Google-Smtp-Source: AGRyM1sRTY3jhmXML4zUAHI23oIyvbgNG1ONSMMqox+hipkmWXEtiTEid5mCOhRsoVVHI5UrE7Q83A==
X-Received: by 2002:a17:90b:4a4f:b0:1ef:90fb:35a5 with SMTP id
 lb15-20020a17090b4a4f00b001ef90fb35a5mr5846805pjb.161.1656995682324; 
 Mon, 04 Jul 2022 21:34:42 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 p26-20020a056a0026da00b005251e2b53acsm21651540pfw.116.2022.07.04.21.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 21:34:41 -0700 (PDT)
Date: Tue, 5 Jul 2022 10:04:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH V3 02/20] OPP: Make dev_pm_opp_set_regulators() accept
 NULL terminated list
Message-ID: <20220705043439.xlrxusxrhwjupiyt@vireshk-i7>
References: <cover.1656935522.git.viresh.kumar@linaro.org>
 <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
 <48d865e8-6c0d-99c0-a43b-89793d5c3f85@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48d865e8-6c0d-99c0-a43b-89793d5c3f85@arm.com>
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
Cc: Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04-07-22, 15:35, Steven Price wrote:
> I have to say the 'new improved' list ending with NULL approach doesn't
> work out so well for Panfrost. We already have to have a separate
> 'num_supplies' variable for devm_regulator_bulk_get() /
> regulator_bulk_{en,dis}able(), so the keeping everything in sync
> argument is lost here.
> 
> I would suggest added the NULL on the end of the lists in panfrost_drv.c
> but then it would break the use of ARRAY_SIZE() to automagically keep
> the length correct...

Actually we can still make it work.

> For now the approach isn't too bad because Panfrost doesn't yet support
> enabling devfreq with more than one supply. But that array isn't going
> to work so nicely when that restriction is removed.
> 
> The only sane way I can see of handling this in Panfrost would be
> replicating the loop to count the supplies in the Panfrost code which
> would allow dropping num_supplies from struct panfrost_compatible and
> then supply_names in the same struct could be NULL terminated ready for
> devm_pm_opp_set_regulators().

Or doing this, which will simplify both the cases.

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7fcbc2a5b6cd..b3b55565b8ef 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -625,24 +625,29 @@ static int panfrost_remove(struct platform_device *pdev)
        return 0;
 }
 
-static const char * const default_supplies[] = { "mali" };
+/*
+ * The OPP core wants the supply names to be NULL terminated, but we need the
+ * correct num_supplies value for regulator core. Hence, we NULL terminate here
+ * and then initialize num_supplies with ARRAY_SIZE - 1.
+ */
+static const char * const default_supplies[] = { "mali", NULL };
 static const struct panfrost_compatible default_data = {
-       .num_supplies = ARRAY_SIZE(default_supplies),
+       .num_supplies = ARRAY_SIZE(default_supplies) - 1,
        .supply_names = default_supplies,
        .num_pm_domains = 1, /* optional */
        .pm_domain_names = NULL,
 };
 
 static const struct panfrost_compatible amlogic_data = {
-       .num_supplies = ARRAY_SIZE(default_supplies),
+       .num_supplies = ARRAY_SIZE(default_supplies) - 1,
        .supply_names = default_supplies,
        .vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
-static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
+static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
 static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
-       .num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
+       .num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
        .supply_names = mediatek_mt8183_supplies,
        .num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
        .pm_domain_names = mediatek_mt8183_pm_domains,

-- 
viresh
