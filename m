Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B76669BA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 04:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308D010E862;
	Thu, 12 Jan 2023 03:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0847610E862
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 03:42:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b3so26580390lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 19:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jLHtoE959u40G0xbX28KrB8L8Do3FTdLcmezZ+Ohpr8=;
 b=YpauyFYgXE4dRDmivNFp/j2H4FoZtQkEFypYGteVIZ2dMLikBrHLjmTkAae4+PLlWg
 +URvMWTOiZNnIhBoBb8E+XemGxzDOMd8QFlg5YXQFQkL/20Eubtu8MK/mHfHVH9mVUTm
 lkaAmXvrD+wN4YqYIStIPe6MMVHDYPXPgpBBKUTBL4SgKZG4aThbi/HPlEiwZivM1YOJ
 RFt4IVrY6x8P05m+hbN8xKPrQgva4UaZ0Y08qrkuaHUAJy5QT6NTTV3fYBWK4iFzxKak
 3atssbaNGxv42pnWPaDDh5OKHiKDj1bPlNUS0qvCPsOyS8BlYXWWY/lniu2y24XhThMx
 it4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLHtoE959u40G0xbX28KrB8L8Do3FTdLcmezZ+Ohpr8=;
 b=NtJ1Jae6vAy/qrJMUKlQ/Lrj52Qm53C+mxpMk3nm9ya/GQjSvViEkPgnNWcqIBt9ME
 Bb2CIzPFVW7csAfmiT0rb1HanqiV/lTJ2uspBcik1BC5eaZJjrTNrHFuICU5a5bGrmBr
 A8+pcO16x6zZhd7ucsTXyhRhuKaPfEBKB3tXZaxIZjasO9QnBzwMwRx77Q2vU0pajlz1
 1OS9ORllhRfTYs6IJ3ZsIRKcFQwzqaCLdLDqQ1LN56udDjKlxccZf1huZnNn6BocBe0I
 Afye6JYNzjcXTey9UvJozh6DMgdsoFYVlfvQOa391aGJwtk5HxC0Fs4AAZRoCPLGz4bg
 4heA==
X-Gm-Message-State: AFqh2kqqCtxf4YetCufK/bjHM4ouQqjk6m7fVphq02ZSsZNaB7r9fBEl
 ceN7hCjTwboxkMciQTPplL2IkA==
X-Google-Smtp-Source: AMrXdXuAjlLyWrwlXPju1jhRFwVMDKZBuI77Lkwtin61RZmeiNOZGX9nHS19HZduB4tcQ9jqucCMDw==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id
 u22-20020a05651206d600b004a468b9609bmr25117729lff.38.1673494955164; 
 Wed, 11 Jan 2023 19:42:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a056512348a00b004a4731f75a5sm3033409lfr.250.2023.01.11.19.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 19:42:34 -0800 (PST)
Message-ID: <c3265c78-7ea7-04ab-13e4-65f79fbf9cd0@linaro.org>
Date: Thu, 12 Jan 2023 05:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: Remove some unused variables
Content-Language: en-GB
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, robdclark@gmail.com
References: <20230112033823.24901-1-jiapeng.chong@linux.alibaba.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112033823.24901-1-jiapeng.chong@linux.alibaba.com>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run,
 Abaci Robot <abaci@linux.alibaba.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 05:38, Jiapeng Chong wrote:
> Variables 'sc8280xp_regdma' and 'sm8350_regdma' are defined in the
> dpu_hw_catalog.c file, but not used elsewhere, so remove these unused
> variables.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2029:37: warning: unused variable 'sc8280xp_regdma'.
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2053:37: warning: unused variable 'sm8350_regdma'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3722
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
>   1 file changed, 16 deletions(-)

NAK, the patch should change catalog entries to use correct regdma 
entries instead of deleting them.

-- 
With best wishes
Dmitry

