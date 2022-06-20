Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A13552589
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C125910EFD3;
	Mon, 20 Jun 2022 20:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4687310F023
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 20:13:34 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w20so18930890lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vKLujDnjL4j2FkCuAr99TpLCl8UgQPLzNcwqlNOUIDA=;
 b=Pp8rU3mLd2a9SEGJdamUi1scms6E1PTjom0SnaYbo02O7+4KZrOqkcvCjIV67gGYuv
 wFb4HHFQSDJsQzcPM1myJOH77Q9NDsnNPGny4tYTUo2p/ysmi2Z2fzWQZDzWcXwwF1OK
 MF7dsyNI1wv9jKD25sfDycc5K88Bi3hQ9qUNs2Amd8p+Tvia5+ML73EhZktTfkdi/hol
 u1+yW3sJSQF9hGE/ZwrlQnsxLctK+ohp9BNIzzf4N+RKVkW2pbntRxN14W5LjknioV16
 7KzCA2lM5R0l9+wS6KBIQgb/Ivl4GLqYRpZpNg7Sd1eiK+WLlaqnXSNr3pNQoa85Yiwe
 i0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vKLujDnjL4j2FkCuAr99TpLCl8UgQPLzNcwqlNOUIDA=;
 b=XNpxvHQIzw61W23/bacrJ2vB/bKrIDphMzRxd9OscbtXPnCtU2nBg24otHvFwA8Pma
 tOpsgaf+p2VV4keOAMlTh8tRoFK2oa0dDGvXu0KUfWdHsSO9gIzhz4NZn0Rn6H7yU6jH
 AFfc+iXK3dSwYZqVrefgTIew6PZccaaPjB2rZw2BdUGr8gUi2M+hMLwjOCAUGOsPhAPD
 h3wY7UobcitKUQHBZS0yAlsOL09rP5Q5jEREsswkLv6zxmYH3CSImhms2qDgt8DuyGXe
 2lQcMRW9FoqubVU4fMhF6rFpkikr+hqhsLs6bL8BsY/4HltGBZBxMOOap9uJRWwMgwXz
 J32g==
X-Gm-Message-State: AJIora+myPe8/PNhJ3n9eCC7goTZyhTCz5ER/1h0a0Ur90UH+LObRAaF
 Fp8KNyWdeiuEBS3pUAFIpdBPqg==
X-Google-Smtp-Source: AGRyM1uqz4s0Q7zVY3nhiumly6PmorhwnXdpd/h701aYhFAZMkuuAaUtlkTvpmlTKVcbjXFnYZbWcg==
X-Received: by 2002:a05:6512:ac4:b0:47f:7a01:c2ae with SMTP id
 n4-20020a0565120ac400b0047f7a01c2aemr812235lfu.2.1655756012473; 
 Mon, 20 Jun 2022 13:13:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a19f242000000b00479339c8ca7sm1882266lfk.125.2022.06.20.13.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:13:31 -0700 (PDT)
Message-ID: <4e9089b4-f92e-0232-7439-e615293ca664@linaro.org>
Date: Mon, 20 Jun 2022 23:13:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655755943-28594-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2022 23:12, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
