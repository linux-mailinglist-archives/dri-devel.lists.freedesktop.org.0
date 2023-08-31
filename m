Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C278E3EB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBAA10E63D;
	Thu, 31 Aug 2023 00:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C710E640
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:26:31 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso105110276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441591; x=1694046391; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
 b=WyC+vUXUafQBZxal/9eC9sBHD+CxgXdx1kbzHnnDO4poVmxDC/2dPclR62WBAPT5/R
 gUv4w1tV0N72VbyssDEavt1MJWF8jCBoTwfLONmZMVeOThsCqkhGN5sM5DP5NkPFz4Ef
 p0g36YlPKEH8a/6qSl5M1CtG4zwQZRB2n0T6tWXILq276uk6BZf0rFtC1EPgYng48QwM
 QPMUGMJdj5H4qsO2MFgW4/7buAOdnUdH3qzPLaDy3QIoAfKyUCABsUARUeKmHX6XaaOS
 YXb7AOdPjaLIdFqcY8QMKYfZTeBDgAi23eIfwpg50jsvlS6BufgW5II6KzZwjyC3gRdQ
 jfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441591; x=1694046391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
 b=IPHkmQ6ddcCS2DI2D4NPEbuly9IJipwOCsDKz3lcApR3lehuEZ4h5c4/Pv0/FZqlx3
 mg0sYmn/Th7siTgb3L1DpQvJXnnTVtZNujxydvQhnbary9TxmF2EYIhEyB97XpxHqMF5
 QY9EZPlOkNwGdAqvj7F+XREBvf4eanVQwoarrlrQy25aGVsq7NYm75lNkG0+7dXaB/+v
 r9eH3IbjsQua0BCThlKgwmyHQqTAtS7lpbYMXyiDxiyVsfoMRj3Kdlb+lPZYzdAp4q5h
 iGQSs0gLUp9zC1UfpAwo+M67Ndv95TWvwVuCk4766nsA1s5lJMI5DvkRgvQqMqoprVih
 XgYw==
X-Gm-Message-State: AOJu0Yx37GD/YOKfhnvb5SK1cdNIU5+EC+9lHaZVNE7ire+5hRg7K4kC
 kFKzXPt8CGIgGQvR3ik7ENJ1vPWxKtvBUik8P2AJGQ==
X-Google-Smtp-Source: AGHT+IEC6wjyhLHuyq2sowvLpwNst9mi9DaKnAVZfuuF7YmSGM5ILBiZEq62yGcwMVvFIDZCywIaEKK97E/8B6+kyt4=
X-Received: by 2002:a25:2901:0:b0:d7b:969b:f3e with SMTP id
 p1-20020a252901000000b00d7b969b0f3emr3293721ybp.11.1693441590996; Wed, 30 Aug
 2023 17:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-16-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-16-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:26:20 +0300
Message-ID: <CAA8EJpp=kr0XTrzq0sjssDh3oJYLqYHZjpDxeyKDxV5jfTcaBA@mail.gmail.com>
Subject: Re: [PATCH 15/16] drm/msm/dpu: add NV12 in the list of supported WB
 formats
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

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since CDM block support has now been added for writeback blocks
> add NV12 in the list of supported WB formats.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..978330c6678e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -244,6 +244,7 @@ static const uint32_t wb2_formats[] = {
>         DRM_FORMAT_BGRA4444,
>         DRM_FORMAT_BGRX4444,
>         DRM_FORMAT_XBGR4444,
> +       DRM_FORMAT_NV12,
>  };

No. This way the driver would announce availability of NV12 even on
chipsets where NV12 is not supported for the writeback. Please define
separate formats array.

BTW: does HW only support NV12 for the writeback? What about YV12 or e.g. NV21?

>
>  /*************************************************************
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
