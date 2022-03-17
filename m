Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17E4DBC13
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 02:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8C910E037;
	Thu, 17 Mar 2022 01:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE2510E037;
 Thu, 17 Mar 2022 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647479413; x=1679015413;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=llS1dWwKdU+67FjJtk/PY8ppQiZAxV8LEJy+YpMh008=;
 b=X5IWnD3Hklo6JbkfmjDDXjhyN+J2w/AM0giTArCqP1g/t+SF8NEap6z1
 Ej32/+Xuk3Th4XI2O++kP82BjNeJqDXlj/o/hnaIcC7Q0AsFuTAv4rKu/
 qStSqjX9XuBUAfyWEAjfR6EmU9VCroST7RyCNiwThAmAZ8i38ZM4TIjtS k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 16 Mar 2022 18:10:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 18:10:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 18:10:11 -0700
Received: from [10.110.116.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 18:10:11 -0700
Message-ID: <9476aa45-1d41-20ed-7f2f-79719f246b50@quicinc.com>
Date: Wed, 16 Mar 2022 18:10:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 00/25] drm/msm/dpu: wide planes support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

I have reviewed the series , some patches completely , some of them 
especially the plane to sspp mapping is something i still need to check.

But I had one question on the design.

I thought we were going to have a boot param to control whether driver 
will internally use both rectangles for the layer so that in the future 
if compositors can do this splitting, we can use that instead of driver 
doing it ( keep boot param disabled ? ).

Thanks

Abhinav

On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
> It took me a way longer to finish than I expected. And more patches that
> I initially hoped. This patchset brings in multirect usage to support
> using two SSPP rectangles for a single plane. Virtual planes support is
> omitted from this pull request, it will come later.
> 
> Dmitry Baryshkov (25):
>    drm/msm/dpu: rip out master planes support
>    drm/msm/dpu: do not limit the zpos property
>    drm/msm/dpu: add support for SSPP allocation to RM
>    drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
>    drm/msm/dpu: move pipe_hw to dpu_plane_state
>    drm/msm/dpu: inline dpu_plane_get_ctl_flush
>    drm/msm/dpu: drop dpu_plane_pipe function
>    drm/msm/dpu: get rid of cached flush_mask
>    drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
>    drm/msm/dpu: introduce struct dpu_sw_pipe
>    drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
>    drm/msm/dpu: inline _dpu_plane_set_scanout
>    drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
>    drm/msm/dpu: move stride programming to
>      dpu_hw_sspp_setup_sourceaddress
>    drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
>    drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
>    drm/msm/dpu: drop src_split and multirect check from
>      dpu_crtc_atomic_check
>    drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
>    drm/msm/dpu: don't use unsupported blend stages
>    drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
>    drm/msm/dpu: simplify dpu_plane_validate_src()
>    drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
>      and dpu_format
>    drm/msm/dpu: rework dpu_plane_atomic_check() and
>      dpu_plane_sspp_atomic_update()
>    drm/msm/dpu: populate SmartDMA features in hw catalog
>    drm/msm/dpu: add support for wide planes
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 355 +++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   4 -
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  78 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  35 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 136 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  88 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  21 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 813 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  42 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  81 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
>   15 files changed, 827 insertions(+), 863 deletions(-)
> 
