Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6E515FA1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 19:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB4110E879;
	Sat, 30 Apr 2022 17:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27F710E879
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 17:39:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w19so19009363lfu.11
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PJUZmqtC/NlHzYBP/fTYOLhJquf+nkTxythqoIbiJuM=;
 b=pd1meebuNyXZNSecDYOignWtnc4uipjWvxFVlqwUedoes11qQYqEUl9XeZ4L7Skj3t
 bLLLLu2wiGS6Cs0JoyCGacW6QOGboQ41b+SY9PYZXeNRjdtE1j2SMREQnjml6+N7IYzk
 PBfcaDqxY1h0MCi0KzIUq9r6DG6YsQupIFvCaOEBgVu9Cm4L0+T3uH2cGDnllzeTqDXU
 gqvZzVGAPULEuUYHszaJjNXXqTo0QNuudXw/28OZD68EAmaFaBroBsrDk5WMjqNKx7j8
 vSQZPVHMZsjE599NJs1tD5I4dQ3gF+RKnkcLW8Bzadp25d/77/lE/N1PekRlxmOEoPeA
 AqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PJUZmqtC/NlHzYBP/fTYOLhJquf+nkTxythqoIbiJuM=;
 b=CyuJUQ96nWwRJ7O9E7dlg6N/dnvf+tuUiCZH9RIuIInfrNleUqHwRSV7CjOplClv66
 CVuBRWLm6qvA/Z0yUhYHHMJOfLArOypjwwBYkd8vfugZhJTVlKZqyQuexCv88kWVvujs
 N6Rncq97KPdyXn8uS1hBpcCYJMU1OIbksYNjfJ3pmwBNBltyJ+dnfamtZdpLIMzEC9lF
 mzRd73IWB53w1yNZFciO3HArraup7o5/IhqvJ1sy0fyuBCj0tjEbRiRFC7CzkSbN/hK6
 P3ulV4bk63Uabe/SrhkJtyVsSrh3h+lfLJDaWYt4w8QywpGFdtRX2WsCt84MM26xFUJz
 kcig==
X-Gm-Message-State: AOAM531NPdopLFKDMsTW7bWAbaKTjxGOzriMCdHznc43LKTjnENwV1WS
 6AUyKSMLEV4Ot2SVgXJ2Q1TDRQ==
X-Google-Smtp-Source: ABdhPJyE49bxeXuAVwnhwbGgtx0PpXMHqSkwfcWTqNFrKFCTOstMHHYjG2ux6kczABK3kiJkuT6HfA==
X-Received: by 2002:a19:c511:0:b0:471:fc54:8a5 with SMTP id
 w17-20020a19c511000000b00471fc5408a5mr3676482lfe.454.1651340350988; 
 Sat, 30 Apr 2022 10:39:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a2e8e25000000b0024f3d1dae89sm589670ljk.17.2022.04.30.10.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:39:10 -0700 (PDT)
Message-ID: <d80dea48-5618-95be-67a4-e6ba12b4d05e@linaro.org>
Date: Sat, 30 Apr 2022 20:39:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220430081101.3763847-1-dmitry.baryshkov@linaro.org>
 <37f83a5e-a966-3da3-ea32-3478f77e98e8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37f83a5e-a966-3da3-ea32-3478f77e98e8@quicinc.com>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2022 18:16, Abhinav Kumar wrote:
> 
> 
> On 4/30/2022 1:11 AM, Dmitry Baryshkov wrote:
>> The downstream uses read-modify-write for updating command mode
>> compression registers. Let's follow this approach. This also fixes the
>> following warning:
>>
>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 
>> 'reg_ctrl' set but not used [-Wunused-but-set-variable]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index c983698d1384..a5619ad82a53 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -961,10 +961,12 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>           reg_ctrl = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>>           reg_ctrl2 = dsi_read(msm_host, 
>> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>> +        reg_ctrl &= ~0xffff;
>>           reg_ctrl |= reg;
>> +        reg_ctrl &= 
>> ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> 
> Shoulnt this be
> 
> reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> 
> You seem to have used reg_ctrl which is wrong.
> 

Yes. Dummy c&p. I'll post v2 asap.

>>           reg_ctrl2 |= 
>> DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
>> -        dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>> +        dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, 
>> reg_ctrl);
>>           dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, 
>> reg_ctrl2);
>>       } else {
>>           dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);


-- 
With best wishes
Dmitry
