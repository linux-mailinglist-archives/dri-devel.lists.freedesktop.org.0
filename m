Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4565EF3C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED3510E02F;
	Thu,  5 Jan 2023 14:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09D610E745
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:50:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g10so14402539wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPQLhJfGS4U3xEltVHsl7WvTSNQNkZrTzl5+OBE7NGc=;
 b=j+fWJTtYWJmBkURH22XHoXCrWFWpvPBR4u/ZSno2OQUTuv0dZ1MjzTZFJ8qX2tpOSd
 ytXnc66NNDsgiMVBbnCUMQ5t72DIz/dJPIOwLwnlcvuQwYVd/Kn6D497fPuoyI/ForIK
 MZir7e4pn9R+Kcfwfg64TaUSIgfAgZfabo5Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPQLhJfGS4U3xEltVHsl7WvTSNQNkZrTzl5+OBE7NGc=;
 b=MvPdiW8HLeFLfn10KvW14QwAzup/o9Cln3F6xAm1wAhw0K0NzuUScippdpMc5zb2FO
 vfTLC0cC2Lz601qwZr6YEg+J5A7bKSWo9n9lh8f7POco6etFiAFzYweMFYpFlgVTyeQy
 7CK/Y8M9rlJlzGotND9X5pNx7KEmxvczbzL4Z+XYS/gaFIMzVSmpL15u3RUWuymjIZ1L
 zH66eMyODXHe7pOUVfzi96CtOHAcNIKzk1x7zlKNbjN4fvJAwlvC+eK+lQpB8wRzY0FO
 SI9nzrokFkEGORYTxFgXxOyoQLp2x+2gJZ7jBNyLkAC+1xfjnWhC8a065UqcNMOBtsM2
 mVmQ==
X-Gm-Message-State: AFqh2kpiLiX0Fz9xGBDmcQk4A2DaKTXyebg7+EypYlwkbVl1RXeG54F5
 HNLHVS3gZ2PoNBvvEBbh2qhkcQ==
X-Google-Smtp-Source: AMrXdXt1HxOI0/mCWWxpOZY8g1+ljmWpFuHE+KOd2cz8wEKC6mCLR+HGawWtPioFoLI+8R98zkQEag==
X-Received: by 2002:a05:600c:224b:b0:3cf:ae53:b1e0 with SMTP id
 a11-20020a05600c224b00b003cfae53b1e0mr37245642wmm.9.1672930202353; 
 Thu, 05 Jan 2023 06:50:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm3206401wmp.19.2023.01.05.06.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:50:01 -0800 (PST)
Date: Thu, 5 Jan 2023 15:49:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 0/8] drm/msm: DSC Electric Boogaloo for sm8[12]50
Message-ID: <Y7bjlgjpX+21Dm0i@phenom.ffwll.local>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>,
 sunliming <sunliming@kylinos.cn>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221231943.1961117-1-marijn.suijten@somainline.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 22, 2022 at 12:19:35AM +0100, Marijn Suijten wrote:
> This preliminary Display Stream Compression support package for
> (initially tested on) sm8[12]50 is based on comparing DSC behaviour
> between downstream and mainline.  Some new callbacks are added (for
> binding blocks on active CTLs), logic bugs are corrected, zeroed struct
> members are now assigned proper values, and RM allocation and hw block
> retrieval now hand out (or not) DSC blocks without causing null-pointer
> dereferences.
> 
> Unfortunately it is not yet enough to get rid of completely corrupted
> display output on the boards I tested here:
> - Sony Xperia 1 (sm8150), 1644x3840 or 1096x2560 pixels;
> - Sony Xperia 5II (sm8250), 1080x2520, at 60 or 120Hz;
> - (can include more Xperia boards if desired)
> 
> Both devices use the DUALPIPE_DSCMERGE topology downstream: dual LM, PP
> and DSC, but only a single INTF/encoder/DSI-link.
> 
> Hopefully this spawns some community/upstream interest to help rootcause
> our corruption issues (after we open a drm/msm report on GitLab for more
> appropriate tracking).
> 
> The Sony Xperia XZ3 (sdm845) was fully tested and validated with this
> series to not cause any regressions (and one of the math fixes now
> allows us to change slice_count in the panel driver, which would corrupt
> previously).
> 
> Changes since v1:
> 
> - Split patch 6 into two separately backportable Fixes: patches;
> - Additionally remove num_enc from msm_display_topology in favour of
>   num_dsc;
> - Reorder patches to have all Fixes: at the beginning for easier
>   picking;
> - Fix existing multiline comment while editing it anyway;
> - Add missing Signed-off-by to patch 5.

Please note that Electric Boogaloo/Boogaloo Boys has been appropriated by
US alt-right groups, and so is really not a great thing to put into the
cover letter for your patch series. For the next round, please use a meme
that isn't tarnished like this.

Thanks, Daniel


> 
> v1: https://lore.kernel.org/linux-arm-msm/20221213232207.113607-1-marijn.suijten@somainline.org/T/#u
> 
> Marijn Suijten (8):
>   drm/msm/dpu: Wire up DSC mask for active CTL configuration
>   drm/msm/dsi: Use DSC slice(s) packet size to compute word count
>   drm/msm/dsi: Flip greater-than check for slice_count and
>     slice_per_intf
>   drm/msm/dpu: Disallow unallocated resources to be returned
>   drm/msm/dpu: Reject topologies for which no DSC blocks are available
>   drm/msm/dpu: Remove num_enc from topology struct in favour of num_dsc
>   drm/msm/dpu: Implement DSC binding to PP block for CTL V1
>   drm/msm/dpu: Add DSC configuration for SM8150 and SM8250
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 12 +++++----
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  1 +
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 +++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 14 ++++++++--
>  drivers/gpu/drm/msm/dsi/dsi_host.c            |  7 ++---
>  drivers/gpu/drm/msm/msm_drv.h                 |  2 --
>  10 files changed, 82 insertions(+), 18 deletions(-)
> 
> --
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
