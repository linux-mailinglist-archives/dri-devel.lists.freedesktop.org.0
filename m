Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D54F3570
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A7B10E91F;
	Tue,  5 Apr 2022 13:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103E10E91F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:50:23 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 10so11029244qtz.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oBw5C4mAzYHBqkIcJSiLqZdE6/dGN4RirBfflfNZeZw=;
 b=cwod/pqZb/ZZ50J1wzA7SUpmhcqJ/4OQWOhBMvOgpobzAzK96fSaGe5d+kvm2ZMQYX
 qbZ6Dy9RtuWeFQrkKYdrNG/Py4GeymojXrVYVNuGlvWGVjiJfefwCxoLF9mOUIeAG8R7
 VzI5xSlVBgs99NqOxcCMknPsb6fSsu4UGL8qG3Isb8QN/BRfT68nedIEImfnc3lImVEs
 zNBtLUyjF4/+15PtRVLawLIhI27HL7LT1TtIMIWP9m58z/ILmvarq4SjnRvuGECOHPPB
 rC1YmWIJz7KB+vpaaad4x/RYT37HH6tEbLFb3Q5qG6nUxliDEgehez27PMolJ2AxXHHi
 Z3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oBw5C4mAzYHBqkIcJSiLqZdE6/dGN4RirBfflfNZeZw=;
 b=UaD+AISEIk/pUOyclCW4I749yNAw7txHoN3Y/DxlEh6wSD2sZHz7Rjp6up5KUabfKc
 fi8Si5icljIVsJlunJDF9iCQAu6Av8RPUhIBiuYfCJbyKGD4JSZN2MiiYiJ1XAILl5OY
 0Eo+SeNrHiFK8mUlVnwG6jTNzRLFWXvxiOKg8SVUjR78eHIKD359ct970hjuEec7Rtj7
 YYZMPPZLvv78m1YwlSJLgNv2K5GyKPMDJizXQp5rJZLRRiPQuuMrujmNAKABWk996t1m
 LJ8/Gk6izJyd3XkjycnYezSH6f4P23GGnRNbP61sGm1wdsbjs1MxHjAZlzM7EITI/iUK
 32Ew==
X-Gm-Message-State: AOAM530xfohZfsZ/ICC6fYiJf3XoRNSPzyzsmR0T8T4IgL5NAn8XyUUn
 0NX9LSfq6ujthZ+LSD0nl4vy8ukOwKAbJaBnrnwvaA==
X-Google-Smtp-Source: ABdhPJx4nj8M6K2gqZ2dD5wk8/mQwDX1/nbJ753mxmKM2qXGWJofvIUyTWtEx4xZ45vVyB8zzm8S/EPG0Xnnxqt2c8I=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr3024119qtw.62.1649166622826; Tue, 05
 Apr 2022 06:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <1649166091-18032-1-git-send-email-quic_vpolimer@quicinc.com>
 <1649166091-18032-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1649166091-18032-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 16:50:11 +0300
Message-ID: <CAA8EJpri3MdWjGJfhSLAQwKSF-iyT-XMTxen4iu_iM68Wxp=zw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] drm/msm/disp/dpu1: add inline function to validate
 format support
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Apr 2022 at 16:41, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Check if the dpu format is supported or not using dpu_find_format.
>
> Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++-------
>  2 files changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> index 418f5ae..84b8b32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> @@ -21,6 +21,28 @@ const struct dpu_format *dpu_get_dpu_format_ext(
>  #define dpu_get_dpu_format(f) dpu_get_dpu_format_ext(f, 0)
>
>  /**
> + * dpu_find_format - validate if the pixel format is supported
> + * @format:            dpu format
> + * @supported_formats: supported formats by dpu HW
> + * @num_formatss:      total number of formats
> + *
> + * Return: false if not valid format, true on success
> + */
> +static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
> +                                       size_t num_formats)
> +{
> +       int i;
> +
> +       for (i = 0; i < num_formats; i++) {
> +               /* check for valid formats supported */
> +               if (format == supported_formats[i])
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +/**
>   * dpu_get_msm_format - get an dpu_format by its msm_format base
>   *                     callback function registers with the msm_kms layer
>   * @kms:             kms driver
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6565682..3216cda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1411,13 +1411,9 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>         if (modifier == DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> -       if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED) {
> -               int i;
> -               for (i = 0; i < ARRAY_SIZE(qcom_compressed_supported_formats); i++) {
> -                       if (format == qcom_compressed_supported_formats[i])
> -                               return true;
> -               }
> -       }
> +       if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +               return dpu_find_format(format, qcom_compressed_supported_formats,
> +                               ARRAY_SIZE(qcom_compressed_supported_formats));
>
>         return false;
>  }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
