Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F87919E5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382ED10E374;
	Mon,  4 Sep 2023 14:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA1B10E373
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:44:33 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so23005581fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693838672; x=1694443472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kH7WX/bL02gBNSwkaIeLx/wyDLsKZbgUWcH4uKnAa/o=;
 b=oeptpTFFPzq+mFlS4rzqZfD52qmWXUDvY2Dq6lkE0eZCukXMAjhtSV/H2sYK7hzS9P
 b+8bMioJR88n0U7koCbyyl+14MEp9qmPz3U5ZbF1/p0Ayt0tyXyRbkw/IAaQ12ZYLTnh
 bnreyct8OKIMAnJ2l4bW5Hn55uELUl6zf3iOAr0yfNkJbP0dILLi3S2nK0eFY1aHvd4N
 LRv/ybp/cyjU2wRiN3iksWjhdtgGchyXnavWlh40V9avcmKBBldoVb6Y0gWxwCABF339
 9BCB6sJse0kBV4hf4iMqAqB3S44XWgxykmEw86bo76ZLAUYwpyktxSvLuFYvUt61uihB
 71kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693838672; x=1694443472;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kH7WX/bL02gBNSwkaIeLx/wyDLsKZbgUWcH4uKnAa/o=;
 b=ls76tv54Tw2UtPA5G+130sG6kLIpBjV93CUFsOr3dQGB81UQL8Fua4Zv3GEi3/Gqhf
 eC2uMc2yUgIemtxXfvk44dz5ViavpGV1ut/I8JViraMR64J+Sxtnyp7WPcDobqisZvYN
 tJS8nvGg5fdqq3T4R0Z0tXsjHI6zaq/z6UtbkNjjfNWoiwKkkGeaY+kPtmU8QDXMu0G4
 bUT7ljntO23qN1MRYEgQof6QdETpbk5Q34QRhpl1gDb9sHr2AG4jETb20hltk+hvKMbc
 CiSqKP9nU30S62xmd1YWpsZ7ziMsdwy5ddjLgMQyC0DESTh+scTmRRkR+p8tb0qclt6D
 qjVw==
X-Gm-Message-State: AOJu0YwXnP5Drs2RdsNhNKs0k0DoQluU/mFb9JJzQB2vamPENU1N95Lp
 PMTYHsQAvgI+R0TCgrlZtgOpaw==
X-Google-Smtp-Source: AGHT+IEErqFoQDFEzrD9081gh8cXtiVUP+rR3xhizgoZsbXsVV7hp8UJS6hWIuK/ebDqwwBDgJ6ljQ==
X-Received: by 2002:a2e:3e15:0:b0:2bd:ddf:8aa6 with SMTP id
 l21-20020a2e3e15000000b002bd0ddf8aa6mr6774021lja.23.1693838671794; 
 Mon, 04 Sep 2023 07:44:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm2177440ljc.12.2023.09.04.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:44:31 -0700 (PDT)
Message-ID: <9bfdbcb5-bb17-471c-ba79-5e215e440928@linaro.org>
Date: Mon, 4 Sep 2023 17:44:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_ini
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Of course this should be 'drm/msm/dpu: drop DPU_INTF_TE and 
DPU_PINGPONG_TE' series

On 04/09/2023 05:04, Dmitry Baryshkov wrote:
> rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
> performing the MDSS revision checks instead.
> 
> Changes since v2:
> - Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
> - Removed extra empty lines (Marijn)
> 
> Changes since v1:
> - Added missing patch
> - Reworked commit messages (following suggestions by Marijn)
> - Changed code to check for major & INTF type rather than checking for
>    intr presence in catalog. Added WARN_ON()s instead. (Marijn)
> - Added severall comments & TODO item.
> 
> Dmitry Baryshkov (8):
>    drm/msm/dpu: inline _setup_pingpong_ops()
>    drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
>    drm/msm/dpu: drop the DPU_PINGPONG_TE flag
>    drm/msm/dpu: inline _setup_intf_ops()
>    drm/msm/dpu: enable INTF TE operations only when supported by HW
>    drm/msm/dpu: drop DPU_INTF_TE feature flag
>    drm/msm/dpu: drop useless check from
>      dpu_encoder_phys_cmd_te_rd_ptr_irq()
>    drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
> 
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 52 +++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
>   7 files changed, 75 insertions(+), 83 deletions(-)
> 

-- 
With best wishes
Dmitry

