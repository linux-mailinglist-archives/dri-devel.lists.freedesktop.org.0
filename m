Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC239B564
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962826F5E0;
	Fri,  4 Jun 2021 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1016F5DF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:57:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id f20so695671wmg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/0XS+taR8uO0Puxfl2+DmxsoWoL/hO28ux66/TfeXRE=;
 b=WfJOqL6TtKt8J4Be3wgOm4JHJ8FOJwSwNKlkmW/uNwzuaZ/SyU+xkNLZD5idPTHDB8
 TvyBoiOtv7ZEwPlikHdvUA46RQCybUiS27Cth69Dz0oxwSB45rhkkwf9nYHUJVwue+0A
 iwnZKX4V54W2Sw8Fz6RP/n/idZWnjG3fobAMtTQaJIQSKG/sanGE8KpnFzoDpbicJ0qU
 1aGEdAoZpGiBpFlD+goILCI7RhOHiBgjfyKTsDjkDuJOMGLZpnwDGmqjEVSE33SiKDX5
 q4bS0Ag4SzLVxMFIJGr2VB2Vogv/PrBZIKcyssJud6xsHVYQB0nrRD6bKzHr0fUSCKHl
 6IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/0XS+taR8uO0Puxfl2+DmxsoWoL/hO28ux66/TfeXRE=;
 b=gVG0Z60MarwkNEXg2OHNyxdFOPcfWuvfzdmPXQJ/ROEl075UwcLCCUANxd/qHfKbXp
 jLyn+aDMG6xxF0cagTqmuz+5hO1HwAnQWqs92cBJb6NCYPoh3PisIOjDwL+kj03Ps4uq
 wauHhmdMnzYYr6fYq1Ks5ZcdocdgwVjxjcmEaWMpetGEc4TeU6F9tCDPE7lzew8pnz7w
 orfthFBn2aAXHPHTPbIGIheuE47XrFM0D9KBmC1ilGVlpde0RYgGg1LwV/c4fodQdrcz
 0iCOWp0XYrfw3BiaKNj6ocpi84nZmEmQ8LKHpe60lPovumZ3Vr3/kk2EXbphR9LC9UoM
 /slQ==
X-Gm-Message-State: AOAM532YgojrNMNZCgP46ad1XsyO9U7ANKWKSqQJo0VxGw6dlz/x+rVX
 lFq8A3gkVzMQz6OAg38QibVF0A==
X-Google-Smtp-Source: ABdhPJxSerMJo/NyEAwIjmxLZAscEMfLRp3dsxK1fpB61fIULrq5CngQm+FyXIn4sq6jKtWiJ2gD8A==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr2515531wmq.143.1622797075254; 
 Fri, 04 Jun 2021 01:57:55 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id x11sm6033904wru.87.2021.06.04.01.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 01:57:54 -0700 (PDT)
Date: Fri, 4 Jun 2021 09:57:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RESEND 10/26] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a
 bunch of kernel-doc abuses
Message-ID: <20210604085752.GI2435141@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-11-lee.jones@linaro.org>
 <85bd6c24-0e4e-6f18-ccf0-6acf62d0f0ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85bd6c24-0e4e-6f18-ccf0-6acf62d0f0ff@linaro.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Jun 2021, Dmitry Baryshkov wrote:

> On 02/06/2021 17:32, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning: expecting prototype for Register offsets in MDSS register file for the interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning: expecting prototype for WB interrupt status bit definitions(). Prototype was for DPU_INTR_WB_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning: expecting prototype for WDOG timer interrupt status bit definitions(). Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning: expecting prototype for Pingpong interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning: expecting prototype for Interface interrupt status bit definitions(). Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning: expecting prototype for Pingpong Secondary interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning: expecting prototype for Pingpong TEAR detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning: expecting prototype for Pingpong TE detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning: expecting prototype for Ctl start interrupt status bit definitions(). Prototype was for DPU_INTR_CTL_0_START() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning: expecting prototype for Concurrent WB overflow interrupt status bit definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning: expecting prototype for Histogram VIG done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning: expecting prototype for Histogram VIG reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning: expecting prototype for Histogram DSPP done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning: expecting prototype for Histogram DSPP reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning: expecting prototype for INTF interrupt status bit definitions(). Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning: expecting prototype for AD4 interrupt status bit definitions(). Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead
> 
> Most of these defines are gone in msm/msm-next. Could you please rebase and
> repost just this patch? Other patches apply clearly.

Sure.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
