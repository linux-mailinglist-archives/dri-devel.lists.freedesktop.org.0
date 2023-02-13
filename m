Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED7695367
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 22:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EF810E747;
	Mon, 13 Feb 2023 21:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB0310E747
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 21:51:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p26so35262154ejx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 13:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vUpjCT580eIamS7QEB/Hj5fWMwSgSVQG6uKwdpnGJwo=;
 b=S+sOkd0b6eN7z3Ur5MTQ7tVd+PEnlrg4GQlMZjXGjwZ3bIwh8ntLN6LyTo4kWlk8cD
 iWgZxT6zetryWitgM1p5Hln517yd+J6QkNL/5/390W2PcpqLaiTRAY2/pWMknpGeB1CD
 ifz34yh1uLSXIH1fwz8yY7TvcyNmgS4Y2T+mkB4tm3kM7zHxpNmzRnry4KB6XKVHDqKc
 eA4uV5Qi+7mrnDmH3368PDO/cQfPioOzxSmy2OLN8fmDDdNnqfLtkCFuKGVlLiFg3QYe
 LGfpEy1vaX72mlGI2GfFxlFyWg5xl83n4+uc177UFJEct2HizO0+F9cSBl4eQNSwlmzv
 dBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vUpjCT580eIamS7QEB/Hj5fWMwSgSVQG6uKwdpnGJwo=;
 b=lmptbB/+O57s3O7+G9XFyGB6j46DoZ6fvtFW+2qgFakKsUZ3wyBZSlxD4uLUb/IR6d
 HUuqCbYXQ3phf2qlGuqyN5xSQwy8dNv6k2CA3K1RAqbA5aHTrptFXS8T9ToIzw1tcpYM
 RFUJE+UVwZvB9SuSKr6tfEOkHJCXc/yp62sgLzyxnPqcXhI1xgC+a4/owLm9pk0VjE1C
 LcO9sNlVyKrGUXnt+YT3Hx8+78+HDzPTf8UyYZOkoLXNnmc5JwoHvRjbadZpt8Mn8Vxx
 dQ5EDo6QSrQwibkrYPtf2EGY2TsDIo0fV0KMv7DkAWs6GrCy+GEeM9MclwkWlgW1yrSU
 7zcg==
X-Gm-Message-State: AO0yUKWp6s0p7uZkqHS8udcP5B+6FXdfb7Ytww6vIWPS6OfhqCVbmfms
 ocItkG2qrzRA97sLfXCrYMtGzg==
X-Google-Smtp-Source: AK7set9qLV84uDx5VeuBXVeINqKPVKCp3FzJQJDsXdvkFLe6k7HBV8fW5OJ5TgIWROtz7o3hn2kUbw==
X-Received: by 2002:a17:906:87d1:b0:889:1eb1:7517 with SMTP id
 zb17-20020a17090687d100b008891eb17517mr413130ejb.30.1676325091616; 
 Mon, 13 Feb 2023 13:51:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a17090611cd00b008b12c368ba0sm66995eja.45.2023.02.13.13.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 13:51:31 -0800 (PST)
Message-ID: <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
Date: Mon, 13 Feb 2023 23:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
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

On 13/02/2023 21:48, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>    clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]

Is it just me or patch 4/4 is missing? Patchwork also hasn't seen it:
https://patchwork.freedesktop.org/series/113967/

If you can send it with the proper in-reply-to (set to 
20230213194819.608-1-quic_jesszhan@quicinc.com), that would be great.

> 
> Jessica Zhang (4):
>    drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>    drm/msm: Check for NULL before calling prepare_commit()
>    drm/msm/dpu: Remove empty prepare_commit() function
>    drm/msm/mdp4: Remove empty prepare_commit() function
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
>   drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
>   6 files changed, 9 insertions(+), 56 deletions(-)
> 

-- 
With best wishes
Dmitry

