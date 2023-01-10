Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC86636A5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C897E10E0EE;
	Tue, 10 Jan 2023 01:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906E10E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:19:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f20so10863573lja.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 17:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MJzV8Z4vt70hFG8OHxTEJgHMqWgCnenLnVvCegK+zJ8=;
 b=a3r6Fe3b0NZcQm9F6dnZseYdZD+pzixsapGPlYgORtCy7HgXh+4oEzlPqs8obf1nna
 fAXC16IQiQxLc4/1zRzYSsHLrAi1Pq/pYjj7plsBKraGHgVE5bWYvkeIRiQ9Mo2sxtTD
 MJCoWRyoq5xheQs2NzWr/pZ9DC/6D6B3POiLX2W4qjfLymcjpEsyqBb3cuinU4cUSS7N
 ekYc3e874VrhI1U23AVLVhgkny6+CiFnS2IvUiXpTVox6Rr+M0Q0mXGcINs/tZHV9uj0
 rzqYTU4RgGELsgThkzzcviFnFP7e8j53f/1Qm9CAhw1HqE4NEZVAUBkBpi4MtZYaRCc8
 pO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJzV8Z4vt70hFG8OHxTEJgHMqWgCnenLnVvCegK+zJ8=;
 b=y/9lRTiBvQOP5WQPZfD2TAUbEPfqbVJ7luJehvZYceGjR6adT3s4F0PiHL457dr34b
 wnm6Fw7N4zpAxSaTaqstHGLsGQsuemZY7pnhz78ARLu/8UaJpzej2PzjvyDB569eb4MA
 vy/cl2BunUPRAEtyZKMyGwV/PJFt86K0keSLHqtSMilCZWmkgiRBJgZGs52X+hkIoEuA
 yOdMkcZHUoi+FLe3BvSZ3YJNOEer1rqx+Kh6AZ3ZAw8A7g7R91quwWEk5RMt0zWOGtIe
 4bgmnn0FZKx03MihRkBnc3IIr2gzSH96kzG2PCDWcY7MbgoyzQdhz9ntCqWT9+sEeO4d
 IFnw==
X-Gm-Message-State: AFqh2kr8kuXuQNxp8Ga6fFPav41RGMPXM5UVO39jrsptKHjn+d8l0TeW
 l5eaPuHgk4Dqx/+SZOX+ZH8AIQ==
X-Google-Smtp-Source: AMrXdXs8RraZSWOgAjQ39Rqa073own2JsomXotoh3YcZWXpCODj+aX2JEdLtpytdgMmgYo9K0AVidg==
X-Received: by 2002:a2e:b601:0:b0:284:53cd:74d7 with SMTP id
 r1-20020a2eb601000000b0028453cd74d7mr1832314ljn.0.1673313593568; 
 Mon, 09 Jan 2023 17:19:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a2ea374000000b002866e491914sm253264ljn.95.2023.01.09.17.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 17:19:53 -0800 (PST)
Message-ID: <b638db8c-20c8-827d-fd08-5e3bdb8dd924@linaro.org>
Date: Tue, 10 Jan 2023 03:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
 <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
In-Reply-To: <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/10/2022 20:36, Dmitry Baryshkov wrote:
> On 22/09/2022 03:49, Abhinav Kumar wrote:
>> Currently there is no protection against a user trying to set
>> an unsupported mode on DSI. Implement a check based on the opp
>> table whether the byte clock for the mode can be supported by
>> validating whether an opp table entry exists.
>>
>> For devices which have not added opp table support yet, skip
>> this check otherwise it will break bootup on those devices.
>>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
>> Reported-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 3a1417397283..87b518c42965 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -450,6 +450,29 @@ static enum drm_mode_status 
>> dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>       int id = dsi_mgr_bridge_get_id(bridge);
>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>       struct mipi_dsi_host *host = msm_dsi->host;
>> +    struct platform_device *pdev = msm_dsi->pdev;
>> +    struct dev_pm_opp *opp;
>> +    struct opp_table *opp_tbl;
>> +    unsigned long byte_clk_rate;
>> +
>> +    byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
>> +
>> +    /*
>> +     * first check if there is an opp table available for the calculated
>> +     * byte clock and then check DSC related info. Some devices have not
>> +     * added support for OPP table. Skip the check for those.
>> +     */
>> +    opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);
> 
> Can we store the table inside the msm_dsi during the init? Then we won't 
> have to get it again and again during each mode_valid call.

I checked other drivers. I think we can skip the get_opp_table 
completely, can we not? Just handle ENODEV returned from 
dev_pm_opp_find_freq_ceil().

> 
>> +    if (opp_tbl) {
>> +        opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
>> +        if (IS_ERR(opp)) {
>> +            pr_err("opp table not found for freq %lu err: %ld\n",
>> +                    byte_clk_rate, PTR_ERR(opp));
>> +            return PTR_ERR(opp);
>> +        }
>> +        dev_pm_opp_put(opp);
>> +        dev_pm_opp_put_opp_table(opp_tbl);
>> +    }
>>       return msm_dsi_host_check_dsc(host, mode);
>>   }
> 

-- 
With best wishes
Dmitry

