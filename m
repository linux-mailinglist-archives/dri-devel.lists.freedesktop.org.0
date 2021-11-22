Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C0458C71
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9193A6E135;
	Mon, 22 Nov 2021 10:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A45C6E135
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:40:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b1so78169869lfs.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 02:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d2zC3GZX8uS+l6jcheKIGphOeFfmp6L0jvVLD+Y/Jgg=;
 b=e9xey83dyEX1R8jouZHFbXYCyGbfzrF7RGhHRazW+A4EbXdOczICrLDI5vFSjMqyaC
 YEDnaR9k/x0Jhz26HC8Qj7d0qdmFie/GKN8Os2iatdxGaaK8VvUxi70lBlwvnkszpZbg
 pKrkthP3GjNll4KT0rnCXDTOd0HdZZbi3uDEORe5TefBJWgTAuJrT1zV/Foi7Rm0eQzj
 iJzIl0dtXtkVb+gHZVbdU286KjzEAy2j+HiNRcllY8ZuiKsK9zdjPm1tWVJwTHovb6Wk
 OTV22QCJlQtbPtMe2xALyYK3nuVFN8Ytjme1HmzppML5wLgzi1D8unL3p5Q0yZKlZ79j
 9BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2zC3GZX8uS+l6jcheKIGphOeFfmp6L0jvVLD+Y/Jgg=;
 b=qyWOmaQ3GN5+VV01Fr3EHI58HteyRhnp1jtgq1zPFroYUXeqZIVNoyo256+ITta2Fs
 h6UoQ6bE0jFuZO36RWhwOJ8cWaWxLg/UyR8FIUe6I2kIHkmWSe2OtGjF1ifqAaMVDJeU
 HUAgcHrjkCmzhpzk1XAtunlW21OJZGVIKXBz9A+rbOHZLbtg0JXTHenf5LQLhpP/bpw5
 xwtUlnY2KgFcG87JvHrrfP0Z5KFYupUKYQH3U+XnjBLDJc9ZSa2+gq5/rF2PQb3YjrN+
 ELYEovKWRlHYy1YxqfzsPwa8uo79ZObcDQuXbKhkJz+FMvD2ZdJxkSg1ylHFscvvUjs6
 67tQ==
X-Gm-Message-State: AOAM531XIwgG8FrT6DBKeZPPSGQ+FKWm1zYo4v4mQ/eb6SFYapyS4bpu
 1Q85/JSIx2NJKu2g5nxzyZc=
X-Google-Smtp-Source: ABdhPJz8MCr6N9OooxMtZp0JXg0RH1rMd+WUjNeUklGObs/fDFhoLmD6Spn0Rgm+TP5aJLvUKKCc/g==
X-Received: by 2002:a05:6512:2033:: with SMTP id
 s19mr56816313lfs.290.1637577601896; 
 Mon, 22 Nov 2021 02:40:01 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id bp36sm1061426lfb.0.2021.11.22.02.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 02:40:01 -0800 (PST)
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
To: Akhil R <akhilrajeev@nvidia.com>, ldewangan@nvidia.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, p.zabel@pengutronix.de,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 andy.shevchenko@gmail.com
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c92231a-5bc5-be08-bf9d-0b77b85648be@gmail.com>
Date: Mon, 22 Nov 2021 13:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

19.11.2021 16:32, Akhil R пишет:
> -	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> -	if (IS_ERR(i2c_dev->rst)) {
> -		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> -			      "failed to get reset control\n");
> -		return PTR_ERR(i2c_dev->rst);
> -	}
> -
>  	tegra_i2c_parse_dt(i2c_dev);
>  
> -	err = tegra_i2c_init_clocks(i2c_dev);
> -	if (err)
> -		return err;
> +	if (!has_acpi_companion(&pdev->dev)) {
> +		i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +		if (IS_ERR(i2c_dev->rst)) {
> +			dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> +				      "failed to get reset control\n");
> +			return PTR_ERR(i2c_dev->rst);
> +		}
> +
> +		err = tegra_i2c_init_clocks(i2c_dev);
> +		if (err)
> +			return err;
> +	}

What about to factor out the reset initialization into a separate function and write it like this:

static int tegra_i2c_init_reset(i2c_dev)
{
	if (has_acpi_companion(i2c_dev->dev)
		return 0;

	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
	if (IS_ERR(i2c_dev->rst))
		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
			      	     "failed to get reset control\n");

	return 0;
}

And then change tegra_i2c_init_clocks() to:

static int tegra_i2c_init_clocks(i2c_dev)
{
	int err;

	if (has_acpi_companion(i2c_dev->dev))
		return 0;

	...
}

This will make both reset/clocks initialization to look more consistent.
