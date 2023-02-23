Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9F6A0CFC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 16:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B15E10EBD8;
	Thu, 23 Feb 2023 15:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380E10EBD8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 15:32:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bi9so85990lfb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 07:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHGfM64SxFiZQAus2x2OY9eDa8kR3HUSV6URvFBcQKE=;
 b=Ux1T46I+Tmsz04WKId1d/6kLP3w2wksf11euq18tEkNeqkH9dgcfPmk+JFCV7KU2wB
 SrVkI9lOEY2RopkV8Wxhn7+5DjWHTwgwG1H0aXA1S79EQEHW+7BB9cFdguvRKS0saV2r
 aW1S6/yfli3zTC356vzt6cBrVhDTH+GxBkcvPIlASFDnWiq4TW7BuJcm7Z3rOxRQqYo3
 dQvCnHJw17Zo0Ktq2W0UeODKBtgee8/IfQe0LCLUB9ywipCJNmzyHPlp1KA47rSanbW0
 k2l1JBG2D7Irj1kyuF6Tf/wQgo7BgVGuCDAv8SJXgwjKMzo4W9fmpMiUmrw9JQf9NSyE
 0/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHGfM64SxFiZQAus2x2OY9eDa8kR3HUSV6URvFBcQKE=;
 b=5fM7qvkHxJJuKCLpd+EL1w4aGiUYBwMatkV74tw8NCUV/tdouPN7cdwepvyVr0E5U1
 KLrH/ukka34LXREuNcU3jyKJGLSi6EoZPNKfG8fc52xdOC8mDoNgQ25VQTTPGnznNlgR
 S+a3YHC0vX2p3smTQQe4pAo1LMq2xWmaWTCDR3hignVQyN6AueFmSpoyFuD8H/iidcU4
 impiFAvudbh5E/sxIPjN6+N7Qdryr4mD2S6Fkl2A4quyyXlZ0XZoPcIWApwkP9+Xefo1
 Re/jBKXznE3BELPWPgsYUTmKA0wCI65XLsejacYfdMWh3CUel/l5Q5gp+vl9Yh6256zI
 iaqw==
X-Gm-Message-State: AO0yUKV0kBPqUtnVQljKBnKdVpOdcXCTc1OInIzS0WGOFOQsuFqYol+J
 aa6zrXnbJF0KUyMzuoDQfNTcMA==
X-Google-Smtp-Source: AK7set+PhpmHoQbaBIWTSqdYGYol1WuhJWnV9zWiSplaw0KYD4YOdcgrO3zw33cVi1cIgKjExzkCPw==
X-Received: by 2002:ac2:43d0:0:b0:4cb:9fd:63a3 with SMTP id
 u16-20020ac243d0000000b004cb09fd63a3mr4156616lfl.66.1677166369444; 
 Thu, 23 Feb 2023 07:32:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u13-20020ac251cd000000b00498fc3d4d15sm70531lfm.190.2023.02.23.07.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:32:48 -0800 (PST)
Message-ID: <b69d9fcb-ca55-a9b5-3e30-efd9800fe220@linaro.org>
Date: Thu, 23 Feb 2023 17:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 2/7] drm/msm/a2xx: Add REG_A2XX_RBBM_PM_OVERRIDE2 to XML
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-2-5f22163cd1df@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-2-5f22163cd1df@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 12:51, Konrad Dybcio wrote:
> This is a partial merge of [1], subject to be dropped if a header
> update is executed.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21484
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx.xml.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

