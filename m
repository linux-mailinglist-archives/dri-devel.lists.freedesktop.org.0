Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC75525DE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476A10E155;
	Mon, 20 Jun 2022 20:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30BD10E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 20:37:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n15so1550491ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4AgI1OeqvKa54AE3ibmZQ72eMIxlgyZDqRzxMCeBNr8=;
 b=QBtuY4wXg/c+FMySfQQzgbU6tlAeaQ8DmAALE6apPfUuxC9bf3/d5ySZUDSgao1o6b
 KjZhA6Qq37l3Sk6af89F26XLK2Bmx7+sKuhgZt2jtqxjfS8vKf7ZqXX9A86jUY5J5oGV
 byPli33F5D1I3Rg8tYNfuH9Rfq/gGK1TIKMxduF1yAKIKrBQxN6w1TsIL1oZ/q+IifoM
 IKXHeZ1xNOLP56e8C6BdcRr2NV/fgfKj97ccQAVUcAcrm/wKi/8xsz1IVmCJo4pt80ny
 DzGNPMrSlGvseJtj5Gvg7taOGess691R4KpLV72rH8SKl4HFq45euJsXXrQdAnT9asfa
 EoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4AgI1OeqvKa54AE3ibmZQ72eMIxlgyZDqRzxMCeBNr8=;
 b=PejDX3Tnj9QLFLlLV+qCDB21mVomhApykMWnyRNIuIetlq2cyMMha8+o+j2cLsDnmw
 58ToD0XoCjpmGSGyeVVJlK/bbKNDAZAG2lhr+1O+7pQXzLJZjt7cymo0TIHb7gyQi5fY
 Xu2YIoxrfoPTubcFup8ezFPqaHsIaO6BxnkXfhwo2JTrKxfB4kS5jpd/OPbSId8f3uLc
 HXHk33JDn5JYNAfdtjHpAoeX0LPOLNdq+W+5wvvuaYUiC05PCKCOCdnPa7tbWp4ZVPnf
 TllGWsSyzNZ7C6YWzrShorbc5ZatD68iZTiY/jteLKvVj9k92wBD0jeXDCbd6K2faHGK
 wYmQ==
X-Gm-Message-State: AJIora8a5G5xB7/tcBbtNl0F6qnFadmsaBh5klfoEPJAVyNlo60a4utp
 PhgqQ7Luh5rxuUL6QzVccKEmHA==
X-Google-Smtp-Source: AGRyM1v1weyBbsnBoedcMba+ZaM6RXMXAZYUhNBE+zvVspODn28UBal0BFmiHO4VWi+4KkT7KnZJ6w==
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id
 z27-20020a05651c023b00b002590feecc2amr12503239ljn.400.1655757465110; 
 Mon, 20 Jun 2022 13:37:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a19671e000000b0047f71cca2d5sm458137lfc.100.2022.06.20.13.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:37:44 -0700 (PDT)
Message-ID: <d7563107-ecd3-1ec7-c654-db493216636b@linaro.org>
Date: Mon, 20 Jun 2022 23:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
 <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
 <3af48ac4-c9c2-5636-c18e-6e8c2ec2472d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3af48ac4-c9c2-5636-c18e-6e8c2ec2472d@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2022 23:22, Kuogee Hsieh wrote:
> 
> On 6/20/2022 1:15 PM, Dmitry Baryshkov wrote:
>> On 20/06/2022 23:12, Kuogee Hsieh wrote:
>>> This patch add regulator_set_load() before enable regulator at
>>> DP phy driver.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 
>>> ++++++++++++++++++++++++++++---------
>>
>> This was not rebased. There is no phy-qcom-qmp.c in phy-next.
> 
> is https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git 
> phy-next tree?

Yes. The 'next' branch. The file in question was removed in the commit 
a50280ead1b6a56f3b4738808a8c2be7c2c63666


-- 
With best wishes
Dmitry
