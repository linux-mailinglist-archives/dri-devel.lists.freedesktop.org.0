Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B66D86DC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 21:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C98688647;
	Wed,  5 Apr 2023 19:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C4610E399
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 19:28:13 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a11so38387417lji.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680722891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
 b=bYXu3+B/PyWJp+zFnlZik2M9E+r77gpb/zk/Qg4EZqIJ6OR3R4QS+FBi+JjpGDysqa
 f0blBODn8+/nC9cR33NyykP8JcVyLOIITM85DbVj/q10Dn3XgKI/Fs1iVciIFIBHGPOa
 m/WxBuUKolIGURPuW10+/HcTKD4SKYluIPw4QAVzJ78vwfXOefDz5RPoDJ2SWx5+CKqQ
 dGbfqrV/QKd44EguEQyf5TexzGxvwLRb+fBztZlvyhZbp+ZQImJU7jOwuPPmG9M7Qyxu
 VSca+glpxqHCVYugimVd+J5wjBkKzneA4rhAr1LfwdYuB6M8akN9VsiVAenj8TOhsoKA
 AjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
 b=zrWJbMAp3JcYQ12TVqfqiHgew1IIlb8f+lMTFkpRzFc83u5jK2MRWbyynAr5xNU5dS
 GDmfWhV1R/Bvvoq2Nsoi+P/MWnyIZPv9etSFS9FEO1K0/ZMs/rWsHYIfrob1iws3u826
 hJ0jXWrUoU3d1V51zo7tjfPHDZOrwVBnMagUdNe+3Mw+y+HyYlrk9CBiQuXXpinCiPc2
 vUPhbDIOk0yN4SsjFuDmDBcpqsaPQ+BYJKqdTjBYPyXRFqAqZVMV/d888Rc6uYXjrX6Y
 q5xzX8GBrPMHMloH0JmHo3NIfpARO3VGWpvf3AzAoXKk80kI1RR5n0Zhd1gx0L7xwfj2
 b9wQ==
X-Gm-Message-State: AAQBX9ehutLKphbC1SH3+BZQ4Hk3Ii85rEx2A7C7buv9mKeUuOBbVmKh
 ZHxLobNBgxQg4EJoZXfeppIgng==
X-Google-Smtp-Source: AKy350YWoifUz5YIaBQr4oUdSmW/vD6IUu3npYLfDxTZR1FEKoc1AvoebpmcKPUSfBhTVMVGq2sCiA==
X-Received: by 2002:a05:651c:44f:b0:293:591d:d84f with SMTP id
 g15-20020a05651c044f00b00293591dd84fmr725395ljg.11.1680722891533; 
 Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a2e990e000000b00295b59fba40sm2919806lji.25.2023.04.05.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Message-ID: <2675ea9e-e13c-d78c-aaf7-0be4ae756ad9@linaro.org>
Date: Wed, 5 Apr 2023 22:28:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/6] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
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

On 05/04/2023 03:41, Jessica Zhang wrote:
> hdisplay for compressed images should be calculated as bytes_per_slice *
> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> Changes in v3:
> - Split from previous patch
> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>    dsi_timing_setup as to not break dual DSI calculations
> 
> Changes in v4:
> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

