Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56BE46EF73
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33810EB36;
	Thu,  9 Dec 2021 16:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8910E124
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:30:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z7so12634655lfi.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=n03DnVuGqtUKblp9GdOtMgVqcgHTNdmSEFo9Z6egz50=;
 b=LmuxhZEUso1R9uNF7JbaQIkwqm99F85FCEwbxLc6/6pZD7EHlCNysvMhxTaftqa1sg
 5sc0wkARbsXvmAcsVbhQ8e8aKcj+n2MBO29/IrAjpidp3lhRkIhfcnWz3EKzbif71Y24
 eORBpO8v9qwgqv3/j2AaqII34dt4hyPVz37jzTI2WfkKcMogTbhgA2Nphg8A63erE5WQ
 v5lF3TnorfgXHi0doJv2MdglI1J5gZc28QJDLeuZvb/v2HpNsyBFqnMYYDi5DtSuKVBC
 vCv8b1V2Kf5oH8yjnQM9BijQDWWzM3ezD3mJCtcbQh5V1uG8d2Y2eRDuI6kutrdTJrUQ
 +4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n03DnVuGqtUKblp9GdOtMgVqcgHTNdmSEFo9Z6egz50=;
 b=VCNdnfSKP/TXnUwCu5wTcHRi10HFH3SIS/r7y5tlbLZeoRMQTfe6QoArveakLXM3Br
 9kOfK3M0h5E3mw+wm5WOsv6bDjeMfa+zXoNYe/Oc8BlSio+qrOcXqb8dHvXXNJm2y4kD
 K2MXZ2dEIo605U2hjTkgJgvduqxXeY6s6qkwSXBkC+Chbby7IOodzKrIduy7LEGUKQcN
 0Lf0UffoYQQaJ/f28RTYHW+9zpj8pwnJhNUl4gxWrMZv04LRJbLD1UUAVeMvKXc6OcEb
 EEHw1AZQMxrU22hcgb9brD4tiCHCpXxergV9OLcUpDmIyU2qdQdOQY7nxP+zFrM/XgxR
 AoGw==
X-Gm-Message-State: AOAM533LuMVdLBaf/pBg0bMpah5Xfj+9kHCjnFUZI/y79qy1BXPFNnE1
 S8VOnLk9x6PBG8Iogf1IzJY=
X-Google-Smtp-Source: ABdhPJxfU4AVMuK0id7yHKzhZjDqNHaXB0zMqpbZuvEyhiPtZc56jINzQj9tLVUTAtYm0jUAeDMu7Q==
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr6560957lfu.18.1639063842155; 
 Thu, 09 Dec 2021 07:30:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id z23sm12126ljn.23.2021.12.09.07.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 07:30:41 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To: Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, sumit.semwal@linaro.org, thierry.reding@gmail.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
Date: Thu, 9 Dec 2021 18:30:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
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

09.12.2021 18:05, Akhil R пишет:
> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
> +	struct gpio_desc *alert_gpiod;
> +	struct i2c_client *ara;
> +
> +	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
> +	if (IS_ERR(alert_gpiod))
> +		return PTR_ERR(alert_gpiod);
> +
> +	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
> +	if (smbalert->alert_data.irq <= 0)
> +		return smbalert->alert_data.irq;

0 is the error condition.
