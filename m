Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE166D37B0
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 13:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D304C10E032;
	Sun,  2 Apr 2023 11:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C0510E032
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 11:35:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h25so34555931lfv.6
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680435300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2nCMWdel6dHdzVC0ymLbPnP9dfCzAbiSb5UP+e8Vgh0=;
 b=KNVWFW6FF9gShYXpQA8BwvaGJFhl9brMLEQWZy89nhSM+tbWb6OCDwv/cjKa64hp5l
 3U6mdnP8JE79mOonTJzYs4xPDBye98eOUhJbuNTnIvqv407g/8K59RCEoiVol4LWUSz1
 zUd1wlsMXv3LQxR/brKyS4VTZDd6iJ363/VnE2+koi75GSpBg64KlXNBhDsPLeyB+MVt
 Q9XSGl7IxU4FTFR4W2fx+HydQT2roMP603HFGHBtQT9B5w3rXOTZxrARGS/UjDBL0Ul7
 EXqReK/UN/3ichymIqua4ZgJBpDUCR8uwsMpJVkRwOUO1Mqllzn4De7yM2hYPnTeuW9s
 Evxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680435300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2nCMWdel6dHdzVC0ymLbPnP9dfCzAbiSb5UP+e8Vgh0=;
 b=FFyObtgm1HTTk9bNuBz7FoDQfrHgxGZCCRFCB5lPn6oODTqqy3Qm3RTDPSdBg9Ufc8
 KQ7Z+PDvVsRYoIN3N+o+8uMekMvnpKT1CWWXZh8Sq0doLB+D2HzRhKrRWZ4JCk5/SJly
 9EFFv+KJe7bA/pM0dtpeil7ci8N2jdPKZDc74ZOV1XxEvNV3R5ZU6i9fldrsuML3+xxR
 NmKQDp57pE7Ch2NcitDcTLO74eEuO8FTMZw7/jj6rZe4NkBPyc2rSBvq2t9WXhy/5AJ3
 8AUj9LhEZ9mPqAEcHilNxJt9nFdAbg06oLXVlY/A93BqIlqHlEmN+bHoGhElfBUMU10n
 2ruw==
X-Gm-Message-State: AAQBX9cUezf2FipjyIYcyQqpwC3H/ybu6CyFS5akejez6fyw03vfjou3
 DX2bnN/9W1TcgDpg+eyy74+kuw==
X-Google-Smtp-Source: AKy350Y8+NwNkDDb/SsEp913su/cFIU8CI5VBxWmQZnY+aY6IEIZtE6uDT6bZRXeJ5bH7Mow34xiFw==
X-Received: by 2002:ac2:519c:0:b0:4ea:f6d7:2293 with SMTP id
 u28-20020ac2519c000000b004eaf6d72293mr10318888lfi.55.1680435300225; 
 Sun, 02 Apr 2023 04:35:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o11-20020ac2494b000000b004b6efcb7bb5sm1244356lfi.169.2023.04.02.04.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 04:34:59 -0700 (PDT)
Message-ID: <5bb1afde-c6f8-d635-8b24-b0b574901698@linaro.org>
Date: Sun, 2 Apr 2023 14:34:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 6/6] drm/msm/dsi: Fix calculations for eol_byte_num
 and pkt_per_line
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-6-3c13ced536b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-6-3c13ced536b2@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 21:49, Jessica Zhang wrote:
> Use the correct calculations for eol_byte_num and pkt_per_line.

Nit: this line duplicates commit subject and thus is mostly useless.

> 
> Currently, pkt_per_line is calculated by dividing slice_per_intf by
> slice_count. This is incorrect, as slice_per_intf should be divided by
> slice_per_pkt, which is not always equivalent to slice_count as it is
> possible for there to be multiple soft slices per interface even though
> a panel only specifies one slice per packet.
> 
> For eol_byte_num, the current calculation describes the size of the
> trailing bytes in the line. Change the calculation so that it describes
> the number of padding bytes instead.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

