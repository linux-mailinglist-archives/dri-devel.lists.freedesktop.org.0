Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E150C246
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 00:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1A10E08F;
	Fri, 22 Apr 2022 22:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C97210E241
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 22:40:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q185so2081180ljb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HvxDIQ2uq+rfPe3vdXkNorQHesxhLFFbSAwqENnsprI=;
 b=EcYGv4cJ3+9PBsxDfPWAktdyyCXUMJwCTMckKxnjKPJHFCEcZim9r6fgEtGBOMg+zY
 nMz59RE1LYCSK3PftFl9aBNWikmXpKbImTLHoBlvD3fhtikViNmAhE8aqZgrVLRrLzDv
 v9oz0hjb0n1KmKa3mxAwkOZtoeD1L96+0MobUSHlzgrDjCyMMpzR3PKGWfqZIln/N9pN
 LKXqhQMkiPqhzeiLAgW36rCWfSOfMB7fXw52SzUnErkulRDrcfF5GQz4AYBsDmI1d9gt
 n5KSfZxG/QImkue7an2ZILbiAl06mpT5DxALUhCl7sRu0rz5zHoTvnHwDPTHWxex6X8r
 hjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HvxDIQ2uq+rfPe3vdXkNorQHesxhLFFbSAwqENnsprI=;
 b=azKNoKq04l+hwcJs4zLSAt6iOFnyYfbnVjOaWND3PjAu+R+/8zZ6cyyH1gY/6J/9Ps
 HMqYcwjyjfwUlypXXMbFf9ExKyNDPFJGtYXn99WEYMjHv02ddaKqB5DMm0L34aJ81XSL
 /FHX/9khnv4/nZjumYpA+Kbp7mBBM7za22+pjUX87kYN45MQQRsXz7HfVfGpxUIN8OrJ
 w4IHGlxP7Yb6OQwC3bdRUZUzoxAQR2+gvF442WUsLHfrbPxOcAwrkgU88hL0St9k/t7u
 NqdSAOYyzF3qMTUJ62/MNVUtdAOmURTR6I70oj3Kp935pDp8eyd4rBvwE9tqopmL54g0
 Nqgg==
X-Gm-Message-State: AOAM530qeL92UQzWxOv/ZN42fUCqRlhCTW/NET4rPK1Uj8cjoTkt0QCO
 b70GJHktNIYhCfb/qf7lOb9xCQ==
X-Google-Smtp-Source: ABdhPJw+B55Dwhesz0KUzHe9Np0IKGcNMaxy5vFC7fBDXVRCJooP1dRI9IlXic6E+/snpQNGxHt8IA==
X-Received: by 2002:a2e:a4c5:0:b0:24e:f7cb:b704 with SMTP id
 p5-20020a2ea4c5000000b0024ef7cbb704mr2203019ljm.88.1650667228619; 
 Fri, 22 Apr 2022 15:40:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a056512331600b0046bbeacbd98sm374194lfe.138.2022.04.22.15.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 15:40:28 -0700 (PDT)
Message-ID: <0e6028f6-3fc1-2a27-0a45-0e024c632248@linaro.org>
Date: Sat, 23 Apr 2022 01:40:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, cgel.zte@gmail.com,
 quic_abhinavk@quicinc.com, robdclark@gmail.com, sean@poorly.run
References: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
 <CAE-0n52nFSUA-3CWa81mE-WUFW8pjOwYsFp-eGOkzupg2cZ9Yg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52nFSUA-3CWa81mE-WUFW8pjOwYsFp-eGOkzupg2cZ9Yg@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2022 21:39, Stephen Boyd wrote:
> Quoting cgel.zte@gmail.com (2022-04-22 01:49:51)
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return an negative value.
>>
>> Fixes:  8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index a42732b67349..3926d2ac107d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>>          dp = container_of(dp_display, struct dp_display_private, dp_display);
>>
>>          dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> 
> Why can't platform_get_irq() be used?
> 
>> -       if (dp->irq < 0) {
>> +       if (!dp->irq) {
>>                  rc = dp->irq;
> 
> zero as an error return value is an error?

Hmm, nice catch. Please fix it. And the other patch too.

> 
>>                  DRM_ERROR("failed to get irq: %d\n", rc);
>>                  return rc;


-- 
With best wishes
Dmitry
