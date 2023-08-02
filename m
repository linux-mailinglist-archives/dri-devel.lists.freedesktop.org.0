Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B676D6DB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69810E55E;
	Wed,  2 Aug 2023 18:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E93210E55E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:26:58 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d167393b95aso1836032276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691000817; x=1691605617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k2kycR0Rej9mk0/Ul3oZ8lC/K6cbrAIKHpNfGiUJNsc=;
 b=pG/cwwGxwL8K9DY05fflMdjuI05aocY49zSsrmlgbte1u+iyvw9qwl6VdknYPpXU2B
 fbKPOJAqrpso0JBkQjMBTFqeMXcc005v+IaQrjqTJCa5HQ9hJoSmauvW4QpTGAitS95+
 nq8GdHFsq7Rn2+OSzFirfknZC/BIqyURxqFQBhp/og3mfAt61D7y91ZcC6d85z0RxF9a
 KnPmJBbyrqwdD59DmlXzUxi52u5HPI0IpSzVXJIkql5I8dWV4py++RUTfpgp2upF3eGo
 tm8vlEEABEyzgY1/UqNflz5eD3A6si4QZzwx4IgEtbqFBMq0O9DylTweqecVEr2ZmkYG
 UZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691000817; x=1691605617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k2kycR0Rej9mk0/Ul3oZ8lC/K6cbrAIKHpNfGiUJNsc=;
 b=B47LzJrv4uMgPaICnT9R7DLK+62JALSbhIb/TnaBSH5KT8q8vnwFjMSIhRzNbZ016a
 nEEw5WbNKpUaeFRf+Vq9Ymwvus2BQ2/Bcs4B5+Es1zgcnPuM5PQ+ks9GcNlz+ibvKT7f
 suUEZRRWzz4GpKGuhi7FOV4pfq4B4Zp+awlhuEHf9oLGlgxRyyw2zOdmIOm3stEToCM8
 m85greIKrhA8F+SOwozQcrGIOsYsde7kpPhiTSzcHhz6qcD/Y4Z/UNvaycXsr39UCIXP
 0v2oWG1iCUYKB4DBW+2KsAujVOsU2ovEwLQpW0mWSRgkwTL7Px2bxyrLRJzKUIyY15Md
 1l0A==
X-Gm-Message-State: ABy/qLbF0WDCiV6KsLfA5f/IYvT4J49X5FpClREKP4pHGp+xyAPw8j2n
 CgPb9yCNiQKnxovrqkV36BvuCAS+CVqPa8PsXDZPVQ==
X-Google-Smtp-Source: APBJJlG9ivgacvY4n2XAnJntPbYCwP6SQaixesCGEKMyS8OduUC0pD3jeUwApOPyphe2EJx+brqKVhn04sOOez77Ovw=
X-Received: by 2002:a25:26c6:0:b0:d05:2616:3363 with SMTP id
 m189-20020a2526c6000000b00d0526163363mr19476049ybm.26.1691000817731; Wed, 02
 Aug 2023 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-3-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-3-2661706be001@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 21:26:47 +0300
Message-ID: <CAA8EJpq18HjMFut4LgL_F5-uDNjFf5AKhgJhe1Z7HJz2A0Xxiw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 21:09, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add a DATABUS_WIDEN bit to the MDP_CTRL2 register to allow DSI to enable
> databus widen mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

(The patch will probably be replaced by Rob syncing up msm headers).

>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index a4a154601114..2a7d980e12c3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>         return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>  }
>  #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE                      0x00010000
> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN                   0x00100000
>
>  #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL                      0x000001b8
>  #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK          0x0000003f
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
