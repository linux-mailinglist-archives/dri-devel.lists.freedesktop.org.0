Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D142227D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561956E32A;
	Tue,  5 Oct 2021 09:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0F6E32A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:38:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t2so12659429wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vt9oy+0kcElMx6lSJpjsV9uP82l0Z+RoA+ivzl5gLLQ=;
 b=py36VqET7Mcd78BQTYkjhaGkz6+fhMmSLSICQIezDBrLNYaQ4htKIDZqTdBgNycNpV
 UEnXtku01BKhzZo4K59hnJSf0mXC2DtG4d+7g1s8SmFcXtk0LpDf/brT7GQYRQsCvhFn
 9emCFWPLaQM0DvrHvq2Ivibwx5F3AXpzgn6eczf6Xttaj1l1bm7zjj0MecyyLdgTaGtp
 2lOV1VlUCvV93Y/NZInzWI1c1xTpCXrd/kX/tw3syYeRfPeW+5VcbbVODEq4lIS7z6qn
 vq6XgzTvW5DDe8xp/NJj25+D8dqytOVAcE/xzOVKFELPxrBmGnJRwzZ7AjRDojsgLCg/
 N3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vt9oy+0kcElMx6lSJpjsV9uP82l0Z+RoA+ivzl5gLLQ=;
 b=AK0KKM50CZxiS/kwmGnpk2jczvqIau8o0aJkXavCCxv03oIfUSXbugH4cI86eirVTV
 AV0FUZeaxlfF5XtO2PsVUzyxyTzA7pGWvanHr3g6SBQn0vztCNMWSZ5/d2CIC6WxojNW
 Su3U2xviUy8uc6reK2hwKXTGg12YPT8bwfXoXbFVx8mUHMogylHxYridD8Ses4m3nWVV
 EpOu5u89dQ+9K7Vcmq01KsJyPPffZwph20XWmfBT8OE3wNMEcJaj/49z6J+4HpZRX9pT
 tHhPW2iePQKWvxKrQPQO5Iys0hQzgnJkRLID6qdZTRg+fIiIuaFIlTCv9aLeS3NC8ock
 Nsmg==
X-Gm-Message-State: AOAM530OXCfCC8RWdakC0/HeQPEPXZRjcXxAYvzYrmyHn84pr4yTkoMU
 M3FLabfhxsYGYikhbwa4hvW1eQ==
X-Google-Smtp-Source: ABdhPJy2Cv4VLFXCmn/y9qaTgx5H3ZhL33c2RWwwNK7Ws33XZqkeaVtFR0N8phhQcgpM8qjPLyvO8A==
X-Received: by 2002:adf:97cd:: with SMTP id t13mr20122276wrb.312.1633426703978; 
 Tue, 05 Oct 2021 02:38:23 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c185sm1321846wma.8.2021.10.05.02.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:38:23 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:38:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] backlight: qcom-wled: Override num-strings when
 enabled-strings is set
Message-ID: <20211005093821.6kj6wuoszz2ruodl@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-4-marijn.suijten@somainline.org>
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

On Mon, Oct 04, 2021 at 09:27:34PM +0200, Marijn Suijten wrote:
> DT-bindings do not specify num-strings as mandatory property, yet it is
> required to be specified even if enabled-strings is used.  The length of
> that property-array should already be enough to determine exactly which
> and how many strings to enable.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
