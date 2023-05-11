Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B236FEACE
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33D610E596;
	Thu, 11 May 2023 04:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83E10E597
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:39:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso9047178e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779989; x=1686371989;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQLVQkJFQ/faBhReu2ueMCnuIL91erqtpVqo/xwpkJA=;
 b=D4lhAg7XBxsQvcgiGqj2A2Pe7cz2On2AVz9DbCfrPHcv5Dh+DhMWrSVMWG6k1lPhkZ
 ODBX+x2DkOQpouMBuON+g7kVOf3ETKJ3Hu58IemXW9WVL9Bf1vvZLjNPU72KqftDQtu7
 cpiRZAZ6GMk4KBuLyj3klfr2ERw7WV+tfcqQH0jRJcs/7pDfpUXrq4w9G4/ex6U+BP0i
 L+8oQAfAC0Dz9nuEFD8ZJwhLDDGKhx9+Ra7CWIAOEhWD3LtvtCw0YR8Slz5+9vdq43jo
 0O2/cRkr1gRINCTwSO0xH2psg5uhW0J9yI++K9OHbNt2M4bULuqJHjo2ibe4esh7I0Kb
 5cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779989; x=1686371989;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQLVQkJFQ/faBhReu2ueMCnuIL91erqtpVqo/xwpkJA=;
 b=gwGGS8w/nq31RwrRTr1sFhTrzR+rhM0saH3bwk1H0wVsSXnMI3c6wDX0hz6+42BAjT
 /Gf+6zx+GGdvqn9fZ6fMHuyFqYnfU0TAtJm2QSZYp1wdXY6ZOC4jxfIIn8uE7nZb/3pR
 x2zN8TAj3YW0339AEF3eliqsF2989/p5F0FeFDNgY0xGCi8AMCF0nraToJGo3BaITwPv
 DjmD4EY8+uz4Ixj7+h6MPgk68KeJCJexY60EhtludjpAEOj5oIZvprOv8GalNO2gG8e/
 LJ1PEljsE1NjpaU5NXpmBNdE3h7VXZ2L9B2eCY+Jf/2SsD9aIZXGRqGn59HbBXaJoe7a
 4ixg==
X-Gm-Message-State: AC+VfDyb0/BqkNQ3GpAqL9SPMyo3XLm/wsWsPecYTtekqdr7Kf1T8QF+
 wyM0ENiXZ7CTUEs62Q0U7i0ptw==
X-Google-Smtp-Source: ACHHUZ6lH8Hu+PVvErghf0IC43biqp7n5FEPCrQxf3iBmTdwCKHD7ha7oZ50swemwg0PykcylFrJhQ==
X-Received: by 2002:ac2:4e63:0:b0:4f0:1a32:ca23 with SMTP id
 y3-20020ac24e63000000b004f01a32ca23mr2342580lfs.40.1683779989399; 
 Wed, 10 May 2023 21:39:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05651211c700b004f1430ee142sm965115lfr.17.2023.05.10.21.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:39:48 -0700 (PDT)
Message-ID: <a6146d03-18d1-b1c6-cdbb-d3527cb9021a@linaro.org>
Date: Thu, 11 May 2023 07:39:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for
 DPU < 7.0.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
 <b4438422-f24b-7fc1-18cf-3cebdd777530@linaro.org>
 <1a6109ae-7c83-c04e-60c9-dfca6b83d662@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1a6109ae-7c83-c04e-60c9-dfca6b83d662@quicinc.com>
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
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 07:38, Abhinav Kumar wrote:
> 
> 
> On 5/10/2023 9:29 PM, Dmitry Baryshkov wrote:
>> On 11/05/2023 01:07, Kuogee Hsieh wrote:
>>> DPU < 7.0.0 requires the PINGPONG block to be involved during
>>> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
>>> encoder engine moved to INTF with the help of the flush mechanism.
>>
>> Nit: was moved.
>>
>>> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
>>> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
>>> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
>>> available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.
>>
>> this looks good
>>
>>> Existing call-sites to these callbacks already skip calling into
>>> them if the function pointer is NULL.
>>
>> This is more relevant for patch 3 commit message.
>>
>>> Add DPU_PINGPONG_DSC feature
>>> bit to all chipset with DPU < 7.0.0.
>>
>> This is incorrect, as we do not change the catalog in this patch.
>>
> 
> Sorry but why not? The changes done to dpu_hw_catalog.c do exactly that.

Because the patch does not add this feature bit to any of the chipsets. 
I think the relevant patch was lost somewhere during the rework/rebase.



-- 
With best wishes
Dmitry

