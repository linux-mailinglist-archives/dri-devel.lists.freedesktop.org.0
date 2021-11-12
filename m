Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6644E642
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D606EACA;
	Fri, 12 Nov 2021 12:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F566EACA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:20:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r8so15107417wra.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 04:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ekAy44bxYcE4719//M2Agt8con9V746x7iZRtQHtp3A=;
 b=okzkqHjBZhid2abmaHx79x9eNG6/T+iOIjm6zgNQbmIFT8x4OlzM30xm3ucTjnGCkR
 I4ZBb1525SOlr9Ff1G4y7d62vfM/T6bVzUqr6pGIQt+utmpXt/4Y0wJqnf47tTeSDU0B
 lYFWM7TfLIL3I28tI4DIaTepVZtoShvE2QK25y4cjpjmVZaUM+I+nQUNxsUEoaD8A6NA
 SNLghy6rvhZY7SvZagFN1WBigiJ11hUB196wDUflqhlzkEiEGfTc3yeF/OiHQGSGnFo7
 SP2Mcc03KU4EESnx6azApdjEvIB6pzoQMzrl/JMBWMfBNTcJSw6GOI3lqXABPx5pToxf
 C9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ekAy44bxYcE4719//M2Agt8con9V746x7iZRtQHtp3A=;
 b=GBtQ8HXgDMfbIdwIn/+Avpi+463TVFwIQd5nCBuTuYromatrrx8oiewyV2Rm4RAFto
 TSqfaSr7KqqqLtbWJeALC54D42gNUWpulvK4fj8/hxP3Uf/SKQ+EvDs7LlJ2JR7HUf1s
 RlVh2VOdxuej56ejrLcQEZNonMf/GcM+uRTw1no2e30uVh7OqZaFTqF1OGVVmCOVaeLX
 0kJHxQA3/XPeFM0QmBDnGAly1Y0Uv6pJAiIsgiPFRODj8VzSaLGKlH8bmDrtWXuEhyFX
 /PYfBPHFtbOuQojSDW/mue+a5U1/Qbd1exhL8qytbaKRxQdpH8Z1s5Xk3YU3nYVqoz22
 PUCw==
X-Gm-Message-State: AOAM531IvXzbjTxzGz9sRX+jnPrIDi+TRsNjGZcOHPz1Sujkb3PLP0YD
 B8s3ErLYoG5VxCh2NN5fquzHtw==
X-Google-Smtp-Source: ABdhPJzUDqalj7QNH7bS9OFqHBZBbBagrC99qMZAAdpP4vZLeXhJhoqFtb9ZUxsbToXqPrsaYZE6Yg==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr18784594wru.366.1636719603596; 
 Fri, 12 Nov 2021 04:20:03 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l7sm7236877wry.86.2021.11.12.04.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 04:20:03 -0800 (PST)
Date: Fri, 12 Nov 2021 12:20:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RESEND PATCH v2 09/13] backlight: qcom-wled: Respect
 enabled-strings in set_brightness
Message-ID: <20211112122001.x67ljs6hvrtsfnd7@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-10-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-10-marijn.suijten@somainline.org>
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
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 01:27:02AM +0100, Marijn Suijten wrote:
> The hardware is capable of controlling any non-contiguous sequence of
> LEDs specified in the DT using qcom,enabled-strings as u32
> array, and this also follows from the DT-bindings documentation.  The
> numbers specified in this array represent indices of the LED strings
> that are to be enabled and disabled.
> 
> Its value is appropriately used to setup and enable string modules, but
> completely disregarded in the set_brightness paths which only iterate
> over the number of strings linearly.
> Take an example where only string 2 is enabled with
> qcom,enabled_strings=<2>: this string is appropriately enabled but
> subsequent brightness changes would have only touched the zero'th
> brightness register because num_strings is 1 here.  This is simply
> addressed by looking up the string for this index in the enabled_strings
> array just like the other codepaths that iterate over num_strings.
> 
> Likewise enabled_strings is now also used in the autodetection path for
> consistent behaviour: when a list of strings is specified in DT only
> those strings will be probed for autodetection, analogous to how the
> number of strings that need to be probed is already bound by
> qcom,num-strings.  After all autodetection uses the set_brightness
> helpers to set an initial value, which could otherwise end up changing
> brightness on a different set of strings.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Fixes: 03b2b5e86986 ("backlight: qcom-wled: Add support for WLED4 peripheral")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
