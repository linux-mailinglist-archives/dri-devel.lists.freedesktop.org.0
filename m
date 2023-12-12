Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C880E45C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 07:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362FC10E104;
	Tue, 12 Dec 2023 06:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D3510E104
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:40:40 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d4f71f7e9fso52110577b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702363239; x=1702968039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lcEihlupVu268DH+1hoAuEO92XmVKwEZxV6GmYSg0is=;
 b=DXVeZGpXs8BJeOoY+gLYqxOGjgcnlQlymqTasuktHbml1AD125B9qXhQBGpJ7miIwi
 BNJQ2Y6bg/3OZEKbtO8udo3REfHC6PWhDlQqdI6NkfXBChvfJKDiXcDI+BOR44K54aFK
 JBXeLXbouHWGSX0Ch31RcGZ6ZBI7wyhLqVgtmwmq6xMQdv26BQlysSLPgdJGN4NmOPUV
 ZpuRd1ck77PVN7FHUO3DMq8YaMoZzpAqq18HSBJEZUccnoB8+6PwMVl5rBrmZHq4fx5t
 WGSiR3JD+1RfKL3URatYMwlAXf5aOInG0d9iuPdQRGySk9Zd+pa3WkwB6NwUg/qJKXF1
 SCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702363239; x=1702968039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lcEihlupVu268DH+1hoAuEO92XmVKwEZxV6GmYSg0is=;
 b=TeOepFDpoaQJ/N8kl0VlPmgPAb4Wv20PuHqmt3oqCsf0dibk6q7AoWwsSWyQ+Z7/n+
 B2/PcLrnLXOmJvh/HBI6RI0Y3HSa6zCnUPGmQbadeGRZPwrPxXVWc2UQdfW6fNxTnK2p
 AwGdXCwoG2G+3zG6yup6kzhXAG9KuGiDa1pzcE0slxQ1m8vp6B/xDFhKiWvldoQbgluk
 Kjzet2bUFGqfcvpK48YJLWcV4Y16Rj03uTZHrfLwvEStbCip2u8I36JBq3g2J8MU9DzJ
 QEGyToWMO+saVsrUPc8LRsgl6qLU9RN6D3yYKoelyD+WiDCZaf1bjszSXwQxG3xSQOrl
 DlWQ==
X-Gm-Message-State: AOJu0Yyjev35O07F+efWPMAEwPi56fjIMgb4S72LAa1CREU1PBg7Mu2c
 snmYVEM3dIXvdpaCSY6iWbphhWiXmIQP/123xM0Oiw==
X-Google-Smtp-Source: AGHT+IGvdM5RN8xlu8UqMlYeZbm9dcOMR2ckPy/eZiaBukMGeBzh2gvRdEC6oHdspw1yXZaOd4HQflJN0ZoVqg9U260=
X-Received: by 2002:a0d:f943:0:b0:5d7:1940:dd69 with SMTP id
 j64-20020a0df943000000b005d71940dd69mr4160485ywf.63.1702363239266; Mon, 11
 Dec 2023 22:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:40:28 +0200
Message-ID: <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: add formats check for writeback
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

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation for adding more formats to dpu writeback add
> format validation to it to fail any unsupported formats.
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
> index bb94909caa25..425415d45ec1 100644
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
> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> +               return ret;
> +       }

There is no guarantee that there will be no other checks added to this
helper. So, I think this message is incorrect. If you wish, you can
promote the level of the message in the helper itself.
On the other hand, we rarely print such messages by default. Most of
the checks use drm_dbg.

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
