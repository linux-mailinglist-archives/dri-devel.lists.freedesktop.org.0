Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A360384FC75
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830810E758;
	Fri,  9 Feb 2024 18:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W1HtYhT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE40110FA75
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 18:58:21 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso1338492276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707505100; x=1708109900; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
 b=W1HtYhT1erdZx+WpD2jXkDJHkFccimZZV2ZU3PuH08MKz9zbNLVulsApWZD+QZg1lV
 kZeWLXvRfFQ/DYlvUVbE3zRIBK8fsIvKCUbIkJxL0430XbSL7JqbgNKLx1BgTZbMOGFn
 qNGZ/d3RGzO7me/lWeu5kMaOKRG7nQRX5CUYJao4g/Yqz5It2m1GLMwG4xUUl75vJucG
 RFxUFzESJXw+hLRQ0++sgTJwaXxbs7pGRAGgyEmmcQ334axyfLPNH1XxZbLWa8zbxWH+
 qggDJD0YdpXHVeu87yF7YYJiFEH+qPBkIWCfX3+GyzJJSVn3BGQviMA9czg1DBVPNQMi
 e70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707505100; x=1708109900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
 b=iuJe+8j++E8tIC48fMf+9pKRIlNfDLw/USGQRuitpt5oXBZ3r92Xz6iolBxXWkKQPF
 reZEI2lucpNn3ryjTuiK4tekc4UVxStzDcWtPZjhGlOImD3iw2E/BrLCiu51l+nRrIvr
 VY4Q6HXdtdKoAMSojsB8GF/T82jBq3IK5pHzqQ5ieObiqo6F9y7gO2tOQCecNtkeLcdo
 C5qcGjjxOdFIBA1lgE3lG974GVauVA7v5LiKM0rdHNrvbBBPcQSLjgqqqRgXWRqAev5b
 i0HofuMvQJLOnNOAGVmrw6sXegg57Y2O6cTShkG8aPs1fkVGBFMDZUEb72+LB94D4p/T
 1pmg==
X-Gm-Message-State: AOJu0YxeTxi3TgRPPGFubD1A27FSwiDaBm305Xr/MJKa4TyHP22UylKQ
 Ssrml0YOJffvP2M6KLyRX001zbhs5njJMFxrXSEdSOuxxPVH2fPN+nXEB4iX0NaBNdd+4JEzIoY
 ewEU1bbyR7CpznbborXbGaoPEr2H6JnBrHZhHzg==
X-Google-Smtp-Source: AGHT+IEb9542YJRhGlr5tTb655Bco/sIqzumPYkKYYv3shLKDvBLR/Rw+lw7ROAYYvzXuW7vbjo071txTmkH+A3fY7k=
X-Received: by 2002:a25:6645:0:b0:dc7:492b:aad with SMTP id
 z5-20020a256645000000b00dc7492b0aadmr49982ybm.2.1707505099966; Fri, 09 Feb
 2024 10:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
 <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
In-Reply-To: <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Feb 2024 20:58:08 +0200
Message-ID: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > Existing MDP5 devices have slightly different bindings. The main
> > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > register regions are a part of the parent, MDSS device. Add support for
> > handling this binding differences.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> >   3 files changed, 93 insertions(+), 21 deletions(-)
> >
>
> I thought we had agreed on a quite version of msm_ioremap_mdss for
> vbif_nrt_phys?
>
> Anyway, its not something to block this change. Hence,

Excuse me, I'll fix it when applying, if I don't forget.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
