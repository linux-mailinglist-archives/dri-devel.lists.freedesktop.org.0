Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18D5ADECE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 07:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F58D10E350;
	Tue,  6 Sep 2022 05:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8910E350
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 05:17:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso13833819pjk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=8BL6o4IX1wUUdMQMOvYouiU2H1/IxMVvREYC6zLqjSM=;
 b=TWVCL/xy2HDW+mX4jbgIhLGwdV/WxyPA4RoAN/5cH9gLWKElDmudiSt+BLgWyygYUL
 auKw1A2QkYSevImuO2n+o1XgSBLll2Nco8q4XhnA187HbOc+U5Cp2i67rR50rs/ELzDy
 NOtzxC8RjpPfc87jCp8e46Po/HF2L2I6nSSJbvvD4JIfQX74pWpHmEYRtB4vJrLGTYca
 4ujNx+OlzLtM/0sqxh9DgCzOQT2n5EXHKZTz1lQZ/Fd6ziMtNu6WBBgU06Oqa3MTPYnl
 hX27qfDSveO7p6PQRACejLid/fnq8hfCpPvh9G5VqGJjnxXq7xfwCNID6B7qc2jqgHMK
 vsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8BL6o4IX1wUUdMQMOvYouiU2H1/IxMVvREYC6zLqjSM=;
 b=fLLHqPL+KHpbt1jKZFTS/mH5tSk2NTbW6ioSNWeo9I1GBnfMErw9/v6CjJ20IUY4KG
 S3f1BePoKxal1DfDhchOUBT5vxTso/YAPX8usvMY4Un2PBvrP2IahcGrD/uFcgKOZHsB
 MSdPkHyF7zGQSkJKzTYGWqNmMGrhsapRqhoMEMJg8MdtOgXNhugWztLL/rAFMmQR7jCl
 bL/vUYNyiKuU79mBtau6tGcEhV54XVcpCdrS1zUZjrKEDnvkOPvcrfFCE5EyJvw7wtgt
 8BLS2ARkNit/tyJfMkfJX6a4Q/OYn0gieG1yWW7Ftc0iIhAW3pJwnxETONE58fCMYJbD
 XlqQ==
X-Gm-Message-State: ACgBeo3urw2om9vYJdqWPzh7XVKpFB2URd9Ar6461uqd1iqnu99/kTQb
 I2BA9i0XmsR+tBEK4c53Cl6UEg==
X-Google-Smtp-Source: AA6agR4vigj/R654EMDF6SU1v26ypc66waj+AKqfllO/bMw5BRTXkx05tlGvD43pNns3B2wikjG6YA==
X-Received: by 2002:a17:902:9007:b0:176:9f9d:463 with SMTP id
 a7-20020a170902900700b001769f9d0463mr10844798plp.32.1662441461799; 
 Mon, 05 Sep 2022 22:17:41 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b00176ae5c0f38sm3276959plb.178.2022.09.05.22.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 22:17:40 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:47:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Message-ID: <20220906051738.doyrdfcas7f5avkp@vireshk-i7>
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905171601.79284-5-peron.clem@gmail.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Steven Price <steven.price@arm.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-arm-kernel@lists.infradead.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Your subject is 87 columns long, better to squeeze it a bit.

On 05-09-22, 19:16, Clément Péron wrote:
> devm_pm_opp_set_regulators() doesn't enable regulator, which make
> regulator framework switching it off during regulator_late_cleanup().

This isn't the normal behavior as it works for everyone at the moment.
You need to explain what special you are doing here, because of which
you are reaching such a situation.

i.e. you are disabling some code that uses GPU ? Please specify exact
code so others can reproduce it as well.

> Call dev_pm_opp_set_opp() with the recommend OPP in
> panfrost_devfreq_init() to enable the regulator and avoid any switch off
> by regulator_late_cleanup().

The regulator is already enabled I think at this point by the
bootloader. What you are doing here is syncing the state of the
hardware with the software, which would disallow disabling of the
resource unnecessarily.

> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 5110cd9b2425..67b242407156 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return PTR_ERR(opp);
>  
>  	panfrost_devfreq_profile.initial_freq = cur_freq;
> +
> +	/* Setup and enable regulator */

Similarly here, explain why this is required to be done.

> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +		return ret;
> +	}
> +
>  	dev_pm_opp_put(opp);

Do this before checking if (ret), so the resource can be freed all the
time.

>  
>  	/*
> -- 
> 2.34.1

-- 
viresh
