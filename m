Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68342896ADE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFAC112948;
	Wed,  3 Apr 2024 09:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SYLg4hiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBB112944
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:41:35 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so6054110276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712137294; x=1712742094; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
 b=SYLg4hiHJQuqxeLayt9n+2RxsClGKh1tAFADfvjfFwmxIT+sUX2MAjbyoqLEOKV4Vd
 iyPfov4gqub03i5pqfXR32yMN5rBaOJoQuAk2dXMypDktOJaBr+lMIC6C1tzifmNZ103
 hoyxxTQoqyLmZTNj6qfKUlcgfM7+kpKysQqwDHfWN5S5R8FyJjZHYQ5OHmwfX6NkNl2t
 UUDDYy+6bl43CvNcN//bKjBeroe33ew3EYqDIwRDye5U/54NYqzkFae2OiejrpYAJjqa
 n8/qNgeHWGiXp6NuWfrQg8S+VpO6AgsIxCgPzxysRg8ZYb3CF1409VJB+SnOljeZXl+/
 qMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137294; x=1712742094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
 b=DPgh275FJHBbFLbbcG+DNnQtf/8BdbKLk4e7wWOO3pJtYmqUxicJmz1y097AWxUEWy
 sTUtlOCu3jD6xF03tqLJ/oNPrGujGdYszz17GWXOBrvXovEkNk8FyAutS+l9XfjXyyKn
 qcgQEoGiqCKtpa7WV76RCwpGnEHxIW0JbnUnUib8zzMf7ttM1BrWAq89S9fw6ZtE9+M+
 HRpnNvkEOMNSN1xrOmN6vfrTgskUtImSPxliWFwuS86YPJicm67kMfawF3+0eT6exfhR
 kb1nGr8sQSq0orhztXUX9/4TsZI7xMLXo1lorq8Yaa9UgUxNJOrbTRVWE2MCx/rgtsOQ
 1u1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVFfgX78h3n+gba30togsquK9sX3RwnfuYf6slwxn3gxUpisKje0JFNTM8KZTzKA+95PCZYhhHnN9Z7CQ5Eh/67RL8rLAC2tF5b221YWtG
X-Gm-Message-State: AOJu0YzpUXRM+7hxKnipB1WJ7qKr4J0RuMoY5inOab+5l9QzYhQCAJez
 IA6g8bgM9bSzuQ26O3TBCJLzF4+jeCcQILEWwflYLq+R9ykBeA4+KbL3aUXVyqIgKfKTT26H9S4
 8MBa5AiyNHqDcx/P1XtC/jY/DXRjtxpq7u6CkRw==
X-Google-Smtp-Source: AGHT+IHo7Vge0DzQtT3KcHX8RHK0g2XNH+Jxl5Eel4VaYYgoWl8Iyz2W7DVZ0oNcZ76UL25OVO7Ocj0cWKDlGl95sZI=
X-Received: by 2002:a25:d606:0:b0:dcb:e82c:f7d with SMTP id
 n6-20020a25d606000000b00dcbe82c0f7dmr653359ybg.41.1712137294567; Wed, 03 Apr
 2024 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:41:23 +0300
Message-ID: <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add variable for slice number of a DSC compression bit stream packet.
> Its value shall be specified in panel driver, or default value can be set
> in display controller driver if panel driver does not set it.

This is not a part of the standard. Please justify it.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/display/drm_dsc.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> index bc90273d06a6..4fac0a2746ae 100644
> --- a/include/drm/display/drm_dsc.h
> +++ b/include/drm/display/drm_dsc.h
> @@ -82,6 +82,10 @@ struct drm_dsc_config {
>          * @bits_per_component: Bits per component to code (8/10/12)
>          */
>         u8 bits_per_component;
> +       /**
> +        * @slice_per_pkt: slice number per DSC bit stream packet
> +        */
> +       u8 slice_per_pkt;
>         /**
>          * @convert_rgb:
>          * Flag to indicate if RGB - YCoCg conversion is needed
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
