Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0476880F963
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 22:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268E410E6A8;
	Tue, 12 Dec 2023 21:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B93310E691
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 21:30:14 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5d7346442d4so60813477b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702416613; x=1703021413; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VlpWbvexUhGlHNJAFDVrmVYt7WuM+enr1YTAW9UOGnA=;
 b=Z8DQ9b3CDecCWfp65+NROacfBd6xep2VsTLPPdQRmvBTOnTjVAetcNp7ewvbF95aVY
 siSAr6GnWCDe5n/Zlj7TRSx+VORJHXuRMt7aHdDqkk/h+OPpvTBuieId6c1ER/s1Tb/3
 ZaRkBaWwT924dm9lCZgp3rro/E7KLT39x4SRMs5CBPyATZm1NF9r362c0gRxT4rPbsd0
 AvgQ1Mc15eTZ6CkvQmDQbUIbKsY6RgEmBACy/ehT1Y+JHv5hW33r63KLEExya1Nf6Nf9
 C8O7qLU8asww/fb4oND4E117IvAAdPj2wdi5ADDA/MNWPYLItRy2bGgQyCApXmXSgzvE
 NNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702416613; x=1703021413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlpWbvexUhGlHNJAFDVrmVYt7WuM+enr1YTAW9UOGnA=;
 b=eSVo503VO/BO+b3wf1nj9Xl70apzr6fXHY+zzLLbpJuBGxz9F2GvMTuNhyBzWZf0P4
 V/HKHChhGSSKrK5qwpbyC/IlNMdWJh5FvwDQnt/nQcMo0xIoYd2K/CnBWhnPXFdS6cBp
 IS/FAL/3qsePA8kibCGmUgMeMf+5UfUlsTR7C+OtLCw+v1uKEQZyXrf+5iDtfF8Wi251
 gjhzoqHVp5kwydn91v98aKjCnuHViiI3lQJuJKse1zMrcqiDkmV00b4HtymdFOD0anW/
 ydx2CYR3ZNKdi4FY4vHz1DGQvjp1X6irppb4gopizpzhNmk4Fj+btqq4LeX9Z2i0A1IY
 MmAA==
X-Gm-Message-State: AOJu0YyyV9+uJCrR/Ia1TfUXbQpMrMjf4eWQ5Vyoopi10Y+MKYRWhOla
 IQCGV4Agj3taziReuzp8hOi6HvyjGnYlA17DWLW8vQ==
X-Google-Smtp-Source: AGHT+IFVTRFHws0SaSDJI9xyqMKzMyeyLxK9i288K/Z0ixqQ6uiz13KN6T617psbtjooIQibdRWE7rcO98w06LywAx4=
X-Received: by 2002:a81:a00d:0:b0:5e1:a14f:4648 with SMTP id
 x13-20020a81a00d000000b005e1a14f4648mr2051555ywg.89.1702416613198; Tue, 12
 Dec 2023 13:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212205254.12422-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:30:02 +0200
Message-ID: <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback
 encoder
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
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation for adding more formats to dpu writeback add
> format validation to it to fail any unsupported formats.
>
> changes in v4:
>         - change the failure message of the API
>           drm_atomic_helper_check_wb_connector_state() to a generic
>           one in case it checks more errors later and moreoever it
>           already has debug message to indicate its failure
>         - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
>           other atomic_check failure messages
>
> changes in v3:
>         - rebase on top of msm-next
>         - replace drm_atomic_helper_check_wb_encoder_state() with
>           drm_atomic_helper_check_wb_connector_state() due to the
>           rebase
>
> changes in v2:
>         - correct some grammar in the commit text
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index bb94909caa25..4953d87affa1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>  {
>         struct drm_framebuffer *fb;
>         const struct drm_display_mode *mode = &crtc_state->mode;
> +       int ret;
>
>         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return -EINVAL;
>         }
>
> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> +       if (ret < 0) {
> +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);

We already have a debug message in
drm_atomic_helper_check_wb_connector_state(). Can we please drop this
one?

> +               return ret;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
