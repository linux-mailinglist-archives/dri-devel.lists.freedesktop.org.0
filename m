Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF636FF6B2
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 18:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7510E510;
	Thu, 11 May 2023 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8810E50D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 16:02:49 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac8091351eso93777221fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683820967; x=1686412967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6JhqElOO9wIra7p8jkoQ6oyPJCsu2/1z8AlYyPP+pK8=;
 b=i3hR/e1zkUJ8KCwu0pnMdd3DQLKf87WThuG23PMElsyxRiUc5D7uNAhELupVPR+ByA
 Fte5Lfy3dc2/mW8mZqN1XWM3ySAfJ2RFNmQgXG+46pDwTywlAKIVx4n9q7p+YqIF2DKF
 toCEOUOyNrdf6r67PCw6k4KEzuV71E/jNNv4d+qxlQnSrS5s23+emf8Jxmjg+BLtHv5f
 Me0OISTu6cu2lEnRn1J3Gc3xIBGMwzpR49065T0AyTcLkn1MBuSuLj8fDAZBGXW5tN81
 1vQW3nYbUFXepsjdyETxaMei5mVSOy8TNlDyEWR1luTauQqZy5qtAAVNV0K+KaA4fJ0S
 Qtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820967; x=1686412967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JhqElOO9wIra7p8jkoQ6oyPJCsu2/1z8AlYyPP+pK8=;
 b=PTmbZczRshSw+VJkQvEXuh9uNJi9aeHwIRSUPL6ledG7xnJdCW+J3eWWChXDMNvWzI
 uPCoxsfyrKRwOKiyLPFXYbdvaONiqlB3yKsTt7LQqFqr1Eio2rsmjqm973hHCPiwQrKp
 R4f5/Cf2mYGSWa0Z9ceHoXGRD/zPgvGKq2wqy4Pvfo7daPTbUevdue4zY/RAHY/XuKrW
 Ps34otZ3DPqg3ckGR67eUpQFxsK/ZEe2kVHt/Es9bXtgdiRdmEA6Bhnl+Zr4tJlxYFpJ
 Ob3qMMEmsFeyW2zmEPyPPqKM7wdDc05nal4D7r/MUNjcHKpPMxpvCmpUHkagNf89tc9A
 oVHA==
X-Gm-Message-State: AC+VfDzulxpj8gq6XDz3Kno5uWNXRpZPiQOWhs/IMa951WK+AtGYgfEc
 bdJ9SvvFc4AwDJJJfBKfSmLqnA==
X-Google-Smtp-Source: ACHHUZ65rAjslkw7nhzx/aWI/cyLqvEoKlMIiSOkzyYwrTXiCP4u00NghNDfKKM7DQZRj0CoLa14Ug==
X-Received: by 2002:a2e:924b:0:b0:2ad:beff:cd9c with SMTP id
 v11-20020a2e924b000000b002adbeffcd9cmr1045393ljg.53.1683820967538; 
 Thu, 11 May 2023 09:02:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2e9b92000000b002ada45ce1fbsm1104368lji.128.2023.05.11.09.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 09:02:47 -0700 (PDT)
Message-ID: <89938fdd-d0d0-b0c1-7717-4a2bc00236f5@linaro.org>
Date: Thu, 11 May 2023 19:02:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] enable HDP plugin/unplugged interrupts to
 hpd_enable/disable
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2023 23:31, Kuogee Hsieh wrote:
> There is bug report on exteranl DP display does not work.
> This patch add below two patches to fix the problem.
> 1) enable HDP plugin/unplugged interrupts to hpd_enable/disable
> 2) add mutex to protect internal_hpd against race condition between different threads
>      
> 
> Kuogee Hsieh (2):
>    drm/msm/dp: enable HDP plugin/unplugged interrupts to
>      hpd_enable/disable
>    drm/msm/dp: add mutex to protect internal_hpd against race condition
>      between different threads
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 

BTW: Kuogee, what happened to the patchset promised at [1] ?

In the reply, [2], I asked you to remove DP_HPD_INIT_SETUP completely, 
and then you went silent.

[1] 
https://lore.kernel.org/dri-devel/4c733721-855a-85fd-82a9-9af0f80fc02e@quicinc.com/ 


[2] 
https://lore.kernel.org/dri-devel/358262c3-e501-3c7f-7502-f0323cdcc634@linaro.org/

-- 
With best wishes
Dmitry

