Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C67A56CF7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E6010EBE3;
	Fri,  7 Mar 2025 16:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m50O10ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7749C10EBE0;
 Fri,  7 Mar 2025 16:02:16 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3cfc8772469so6679385ab.3; 
 Fri, 07 Mar 2025 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741363335; x=1741968135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVsyz1X8pF/UhiAV/Z073Ao8xGKbObCJlDlkeRzrTBg=;
 b=m50O10iiBK+IzdfYrS96lHG/jb2ZE281YwDP2wR6E96mWUZaISL4viSt9QzUdGPC+W
 DgCHGZHkycQyXVZyZcX5WWRH2ZTEt/8Bth5CVYRP5LfpqWwhDQ6KMM7h0uBU11hVnA9Y
 sXxjOxz+WR4eAvOEV3h4QOJ+t7SCJWtrnvKqtwu3roJYAv3u43mgOOmGSCHY6sjenZ7K
 hQkp8R3ylOfCoFfzrypMVp5HDJdgtcG3a7CJrwHFD2qZkv0u3tcOYuwDHF10W1LfQK+J
 ww8CKf2XuUphkrUhGo2omB7JD2RqNc+azBfF0X9nHzDyVUFkVkfFggSmM5p0MeTFNOGq
 tv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741363335; x=1741968135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVsyz1X8pF/UhiAV/Z073Ao8xGKbObCJlDlkeRzrTBg=;
 b=A3F8eLlNbv00VZXWdH4fq+A2ZU8FNEpfYzQCLdex06g3xsSpd1tqU+qBaaCJQrydHb
 AQzBOdliizs47InrVn59dCwJHi4jnRj9lbevloJfiAOgdsxIuZ7oY8uB0eEEosdFnvCC
 15Neljf0cAvcCeEAtmkZKxhcn+WrFUyc66p5MosGrjaGspS7JVVe64aJm9U+VXWWYSjQ
 +FpH8fbNR1fpj0+yP2k4qGYsNN6iW6uVqA9HTyaXcn8y8FAmG5/pHfP0B4H/WSu3U2fw
 zYXps3RocYzWb7T+JWrKm3pszHf7R2TlAqm1DOISnDGcf5FOFz3h4C8ryvQuV7SklamR
 HaDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOYaKOrsvOM0kXQsY7TrYbgy3NKT+/dWvVtaE3PZV3qhjn5vPalcras3PSuKNpV716tiu29sR1bzs6@lists.freedesktop.org,
 AJvYcCXltZOu+QxnbhMJEbTi2fUiwsN0Y2ribzEA+X6bWCfB572BB7v8yVHALKWGQTOTCAAptYM1lIdinMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2COlsN+ek6RGW2gJXXcWuRZFaassUywuqZm/caK6TkrOei9lJ
 kUP/PFkRnwHeta07g0Wnkmf4xY1UfzMn7JejAgJ3mHPxmvxH86ge2g7QH8c8ae52FjB7e3WcXrI
 2Cm4vFPRnuCy8cowOYNH8QJkpv84=
X-Gm-Gg: ASbGnctSFJGKWkW9QBVmC7fDs0lNLQmU3PQ64I1aJ2MeeG1XKPZZwC0PyjEsc6C3tme
 L3eCPLSW2z9QqSBqkkYtZVCPnqKTE3R4212f+6Rcyubeqri+UrjX+FSwq8Rv26RznO+qLyIHZO1
 YSqfvnwK/O0+VsNtX1qy0Eok/uhw==
X-Google-Smtp-Source: AGHT+IFlkDW45FjSDAY+/ujHbVYjPbC1fh1mEzuM9PpJ16/kKaBDf0mhpfF9ANclH9gXqm1ANKhVG4ZNcoYusoyEbhs=
X-Received: by 2002:a05:6e02:378e:b0:3d3:fa64:c6ed with SMTP id
 e9e14a558f8ab-3d44196906cmr43897455ab.7.1741363335404; Fri, 07 Mar 2025
 08:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
 <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 08:02:03 -0800
X-Gm-Features: AQ5f1JogM8GsN2MKzzbZAGFQDWsOKSeDlUzXfnTI4N4-lIOpp7hgcVHhMEdveAk
Message-ID: <CAF6AEGvdaOTTVnmSw3DV9584-du=Bh6NF7mD5vt4FLyi0B1Nkw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 6, 2025 at 12:22=E2=80=AFAM Dmitry Baryshkov <lumag@kernel.org>=
 wrote:
>
> Fix a typo in struct dpu_encoder_virt kerneldoc, which made it ignore
> description of the cwb_mask field.
>
> Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056beda6b54c0d20f027a53c84f67db..0637be07eb293041a350161b3=
9a6276eb44bfb42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -140,7 +140,7 @@ enum dpu_enc_rc_states {
>   *                     num_phys_encs.
>   * @hw_dsc:            Handle to the DSC blocks used for the display.
>   * @dsc_mask:          Bitmask of used DSC blocks.
> - * @cwb_mask           Bitmask of used CWB muxes
> + * @cwb_mask:          Bitmask of used CWB muxes
>   * @intfs_swapped:     Whether or not the phys_enc interfaces have been =
swapped
>   *                     for partial update right-only cases, such as ping=
pong
>   *                     split where virtual pingpong does not generate IR=
Qs
>
> --
> 2.39.5
>
