Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCFE6A666D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 04:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3610E103;
	Wed,  1 Mar 2023 03:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6A510E103
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 03:22:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b13so12530616ljf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NUZecSUqzu1uo/SXLpOzA6t3JV6OPyWWN5Ny9ipj8EY=;
 b=HbXthZCZbWCMCpjYnzTBhJKdyHTUZPve27TqpqciAyONXTaUXftg0Yk7rq3prW5cOf
 A7UjsBMz1j/Zb2dnU73UkECfrmHPeOCbbu9lIhpFAIrVfI9cDFMji2/6zMO7WB6OKij8
 V/3PRjCvmUJjnD7hZmwbaKNVHFwCGno7Ko8unlqMk96FaxL8eGPwCBaNn6ZZncHe4s7Y
 fodFYaHF8FsGrNtp67tVvOEZCzkZnnzB40em8ESzPm6oA4eheVMMRyJRMFMKF/3Gdz4w
 Mc20Y69E+euzG99QF6ihnNQASbaBTaRE8l25+gLVj9zvTz1eiOgXx6xerGUSCopDeqZh
 I69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUZecSUqzu1uo/SXLpOzA6t3JV6OPyWWN5Ny9ipj8EY=;
 b=BJcKzVP4AAwRbQtiujV/CQRmCS8ddvm3Cgd0BLwWmyOm81QbIoLPhDtFzJhyF5ikkO
 OJkg/buVd0uyrUpFVZdXK2HlbmzHQDw8Qn8byykpbOb0jICm0sEP1Dk6XA0OYof8xDYA
 oO38tVWu/q75gkM40fvD/MTJ0tuBUIXcEhlN/6VtkuapEtrbWAMm/RhJJUyfHJpShO43
 fOC4BKENMYPAmtgnaZYEAY+Wm4s6gW28/htY6a+zWF9vVOtDFb6hqyZmuSmL8bxRpIIC
 lpmPpifd6D9thGA1zaTjZuU6JEKNQYtUNCwEoe1AWuw2Dmx/6WBMl7CXxlb0xtYU71dw
 CEMg==
X-Gm-Message-State: AO0yUKXeWzNh5v6InqDXwTeSO2ygem7eUqq1OUESuEi1ITvJyI+y/Wgu
 m13H9R6B5nthZcjgFLSL6U/dZuvFgwjFCtQa
X-Google-Smtp-Source: AK7set+EwfKoaH2pJojg/fcrmaYhssF05s4pHXzYYARrdyhKFsh5msqxjncNNSpHuaj00TeGVOHKfQ==
X-Received: by 2002:a2e:b910:0:b0:295:a96e:4f1b with SMTP id
 b16-20020a2eb910000000b00295a96e4f1bmr1514777ljb.27.1677640922090; 
 Tue, 28 Feb 2023 19:22:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac25ec2000000b004db0d97b053sm1543287lfq.137.2023.02.28.19.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 19:22:01 -0800 (PST)
Message-ID: <3195f978-9997-dc99-4e32-939f0db50f68@linaro.org>
Date: Wed, 1 Mar 2023 05:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit() function
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-4-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230221184256.1436-4-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/02/2023 20:42, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(),  we have
> not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()
> do nothing. Remove prepare_commit() from DPU driver.
> 
> Changes in V3:
> - Reworded commit message to be more clear
> - Corrected spelling mistake in commit message
> 
> Changes in V4:
> - Reworded commit message for clarity
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>   3 files changed, 47 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

