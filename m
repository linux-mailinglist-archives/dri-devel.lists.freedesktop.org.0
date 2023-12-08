Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103D80A1EC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6DC10EA6C;
	Fri,  8 Dec 2023 11:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487C010EA58
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:13:29 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d3d5b10197so16961917b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034008; x=1702638808; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yt7VH34vIXt25vrgUruA60BaGXHVidQ+RAFVzJPEkF8=;
 b=IuspwCSMtDQZRztNKqellaAWMq8dh+eH7U8pbsPWx8/jP+6hIfUxSQAUCcjmEnxqw3
 3ZK+AQxp5GkkJ/vHUOkysFFPpeuQVBfWL37gxOjxVQcPvcAfLUlXHNFz6iOPoQ7WVWIq
 XaOJyDtbREQ0ZQc5LmoASTdcBEDHCi1np8wergR5ToDTZGo3cD92AwnUawX3welAsoiN
 ++XS+he8q1zq9/D5XKtRebS2Dt8eQq6w5pUB/2SqCbanV28GyJ02CfUzmclPY7ohZn32
 Uavxg1dhtuhMS/g9S4GL+88Ky+isUz86MC6cW2cCkgQINX17LxhdN0O0Cs0jmTGHN01N
 g9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034008; x=1702638808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yt7VH34vIXt25vrgUruA60BaGXHVidQ+RAFVzJPEkF8=;
 b=CfeDJic49RZwRLyMATpOk4N21K+WLXyhhSQ3G+xk4HL/o46W73ps35pVCUoI5bQEFJ
 swlr5VnMHYPqGzGvVmJ2QoSiwX34C3ULGe9a0chgxhFGa33TEe3PJbj6VWVJFPMCabez
 qWfWmcO+950xliBrUyRreo//sgZC55GjTF+/FHRhyHr2PSzZbBi7DLF3PlwRax+E3DK/
 2SjpzZ0aRSe8dE1T5tPUBevE+/GlJkc1W+15eCLJZuFc+8wAdl+xgOmAQfHy6rcZZZ9j
 NM4d+ETg3WHFSoCj9+17KMiyZFT5X9YgQOb70i1Zf9Q9x+KAESEw0ygA/QJiEbgSDdAR
 37Hw==
X-Gm-Message-State: AOJu0Ywhjoj5uCnjHjhz2mHt+krLwWfZd2AzGIYaVum+jLLBDcDrH9IM
 LDPoPkjsQYgoPzzvanPqYsPCUoJ0F1kumG/qBkcdpQ==
X-Google-Smtp-Source: AGHT+IEgLxut2LZKFwy8YPZiuTpL0zQRaZYu54PpvxGKqsQUheHzwcxxpJkcW4s18OsvT+SKUHlcC/jSfnNlgNEOLcg=
X-Received: by 2002:a81:aa0d:0:b0:5d3:d439:aabe with SMTP id
 i13-20020a81aa0d000000b005d3d439aabemr3762797ywh.26.1702034008459; Fri, 08
 Dec 2023 03:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-6-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:13:17 +0200
Message-ID: <CAA8EJpqpWxO=GjSp-CKRD2Vy89FxBPmDWNhPstfF=_y-xHvV_A@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280
 dpu_hw_catalog
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
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - remove explicit zero assignment for features
>         - move sc7280_cdm to dpu_hw_catalog from the sc7280
>           catalog file as its definition can be re-used
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>  4 files changed, 29 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
