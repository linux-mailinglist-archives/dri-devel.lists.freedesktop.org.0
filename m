Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F078E361
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 01:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DAA10E636;
	Wed, 30 Aug 2023 23:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06610E636
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 23:40:29 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so94748276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693438829; x=1694043629; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RW03Buigd8vZt6eYvyecwZ1KL1Q5FSJSIf3Tv8B2o+o=;
 b=wUPJgaKpGU5pNTXZYnJ574/Y60tZkH4sXp0X3Ld9EXsXQg0hjCGyK4TiA1zZ1OkCL3
 XrETiamLm1bKeHg0FSHcF83CNZDMMatA/Rk2NtqfiHmb41XUVAmEcUcWwRmZxnM4Rce5
 HutwknS12mcJ+20dbf4cOXXDFZJDzlGTNfNvPpsKRAsO11T9/XvphtBKrPY//i3pI1xb
 w7IXE3PGuH0A0NHK4lE6pz2T01EPXgPC5rh8THvNZD1y6LwyTtL6CgTPdFhgjnn5lplh
 xsNcBv+XVNoBkg3Q0fM/VNlVhLYadkbTg6O8xbNVD6agoiR+WPIH3bXuhIbfuMVnb7/T
 dOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693438829; x=1694043629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RW03Buigd8vZt6eYvyecwZ1KL1Q5FSJSIf3Tv8B2o+o=;
 b=cN1LijANNN3QJTr5lKqFU82HKyc32QPsdnVXfolH3HZkBF3P6huS49UchFCkSpWRh0
 c2lZ/bnD53/pZRDmPWnblIffOu4coJJrYDrWGrBySoeK1uPiYQhdbRxlzJA12lbjarVc
 hCEJjbOTNkm6UiXiKe6CZ/Gfq7U2mqKkvHKLMtEdbxyyGWNfdohP7x0adHaUKizlEIbI
 a9m5gPJzDrS9H0BsdP2jEafvPJgwv11iR+ieaRyJPFPgXcLxr5LgSi5j4+91B7IFHr4p
 zJVC7/+WszsDMsgFPA8nMGMqP6Lc5U4aY1YLjMYBKqCw1N2Z+jO0aNlluptpxZEZfU/x
 IcOQ==
X-Gm-Message-State: AOJu0YwdnjrNpPtJCrOfmN5toXC8x/aWurwJ6bNT+M4nAaQcawpou25c
 es3nTCjf8xsbhzFfgbO/b60ja1bn4hr5V9N/ibKiuA==
X-Google-Smtp-Source: AGHT+IHRpuHMQeos/PbcvuIgXam01EiMFEv4kIeP7FrRqJXSgDs5wXyQUctlx8YiF/YdlbVx3rmwns4oiK1/Ze3DUKQ=
X-Received: by 2002:a25:dbd2:0:b0:d7b:a834:3b2c with SMTP id
 g201-20020a25dbd2000000b00d7ba8343b2cmr3295137ybf.1.1693438828881; Wed, 30
 Aug 2023 16:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 02:40:18 +0300
Message-ID: <CAA8EJppfO8G+6sFf6MUOJDG8swAtT3J6sAa_20xUJfPCcNq24w@mail.gmail.com>
Subject: Re: [PATCH 03/16] drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp
 to match its functionality
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_encoder_phys_wb_setup_cdp() is not programming the chroma down
> prefetch block. Its setting up the display ctl path for writeback.
>
> Hence rename it to dpu_encoder_phys_wb_setup_ctl() to match what its
> actually doing.
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
