Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5302447D0CF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007F910E861;
	Wed, 22 Dec 2021 11:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC9710E861
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:18:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so3635830wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
 b=vuOSX1bxQMEKxQcPN+VUUzKo5/t4x6aE8a4lqBIBg/AfdmqB+6KVo2XrTQoBcSf2tU
 KYJuzyeQqh3/veN33Hl/w1tg5wAKXrHSqexWXadPAvPdIo2fytqpF+9ocXySUdMR3RSa
 MRY/zjG3TljBxAp93rn6PZZhO6CIQlFo7eg8MfpoGY4uLFl8WbhQVQWDCNgMFXMJEXEj
 59Cpgd/Db1D2YmwSp6L3dll3YieiAaOsusYepMXSzdIcvxRt/NSzk4VWzfgi+tPzySeJ
 6nMIr7jC78BS9CfRNHmzaVPCONacS2shsylJV4x54vPtLpx+iIqlcIRIMe/fJbdR7SWF
 PRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UqlZAuK587EnmAYWNwie5YNKKe3+Y4dPueeQgf26x50=;
 b=GKX2GfTkpsp08XWVuvHOB44cZ+w+6OaLNV/fmeqpmWhqWNKtB9s1D1LGgLM5+Z5CUS
 7XeMPW8y81fQOZzBY32GlvP18Egk9IzBufWu5ies4iIo7AM+w5t9J1v4uuVne7qSHArh
 5WQCoHvlxcAyeW+Mo7MULL64rSqMgIbQ3MuNntkBh8AUjMZj0LuZNxSOL/hJ8oWALd2+
 /sqcJXc4WOKRxLRSqN9tArH2A5UtAbu8iIxqVkOyGmPTgMVYv8EGPsS5CQ/9q/ZpqS1M
 R5qYTYoatpdqa6PZEMe4aY6MGMwtIj7JSEwXggTO1kbyRoaRTRN628rEHIRKh7ampmLc
 OdaQ==
X-Gm-Message-State: AOAM533HIoftelDBfkxu+wvQ1fMQosy1i7EluV1lRTdeDrlaVryWhBAH
 LSErYaWEn40Ea5l41Rm362ozvw==
X-Google-Smtp-Source: ABdhPJxTnsCCzl4VAhbNMA9kFEFyPrCJC8S3xlkUnNwpH7/g4OOdhsrsOwbBPBROyn7j9hcnjUPYSQ==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr609179wmh.3.1640171895690;
 Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id h4sm1643585wrf.93.2021.12.22.03.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:18:15 -0800 (PST)
Date: Wed, 22 Dec 2021 11:18:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 7/9] backlight: qcom-wled: Provide enabled_strings
 default for WLED 4 and 5
Message-ID: <YcMJdZRoOtUrWvkV@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-8-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-8-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-fbdev@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> Only WLED 3 sets a sensible default that allows operating this driver
> with just qcom,num-strings in the DT; WLED 4 and 5 require
> qcom,enabled-strings to be provided otherwise enabled_strings remains
> zero-initialized, resulting in every string-specific register write
> (currently only the setup and config functions, brightness follows in a
> future patch) to only configure the zero'th string multiple times.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
