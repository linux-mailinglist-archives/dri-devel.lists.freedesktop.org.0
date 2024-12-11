Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0A9ED825
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5972C10E06D;
	Wed, 11 Dec 2024 21:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aSn3cXrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA9C10E626
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:09:23 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6efe5c1dea4so47575487b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733951362; x=1734556162;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=pQDqVSakcr3mxA+wnwNeXmA0JdxuRMpWtJWg3CDfgIg=;
 b=aSn3cXrYolr/RW5ZPvHFccII6vOoRT0pWty+cTiLnzAZwQGckmpHJxm4+Jyk02rS87
 X84Su4URFyPzOhpVRBEfvl+GuIhHsOfuFPQHLZyBzDRqbo7ZEdy1lUdSNgl3nL5DzYaP
 E9pVM7XnuNK/Vrj0oOdWh0Qz6OlpNoECIMbKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951362; x=1734556162;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQDqVSakcr3mxA+wnwNeXmA0JdxuRMpWtJWg3CDfgIg=;
 b=bKib58fzR4f9M/oLGtKSkWIQBu6K6DjSiUh6nP832WjNPLGkmypMrTJ9C3c3ytqjny
 tsb7pUmjHluu+18ZdKhU6fjAdOUt+UXW/s+IOoyNGkJOnu8EBAI9/6rDP+HwRLNj801b
 RdT+BeD8uIH2jSpuxkXo7vh28dFVmuEGxsAUDHsQQE6CVKl5BKqIq+FkFalbQ/gseRuB
 kua4GIxct4IXZEBH54hz/28eFM+R3NvcY37Al9H+ATuxf4BxSaffRjlTJSrHTJ498Qi8
 l1AB1SF+ZrynhIV23beii6aFBlUC0Ak+tHq6/eo8n5YHJPT/ulUA1rx8fyqZd0XMCPvR
 ZbAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe2/eNcLt1Sh3Lr1rxFV+rVSpIz9B/oEKui2ZtjlBPxZJbs4IMJcTgESoTyvuMtZZp6xUgO6xeUb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypyKuxEgX5htNKwBeLx6BzIamiUO3Fjx8+5/aMdzCbZR4qGHoJ
 toKDvj7VNuPkBOpdiLKoYV0ld5a1gTua7E4xPO6yd1aOgpGOCn9HuXfezA4wsZmGJWTMzrna/18
 9NiHiDyv83Ei9qj8FBcKCixvHfSOyZJ54zp/L
X-Gm-Gg: ASbGncu/XdHDC+jVFjVqt3QoXh0v20RgQ4da2z6c1sC5Y+sh0o/lWJzWO80pr972IwH
 OF5tSBbvIwJ+EKub7RcrxrtzfjgHUmBx9O9jU9ADcexjv6qGUA51xpl6g187xRDA=
X-Google-Smtp-Source: AGHT+IHQYD+rGSnTOhQP00f7jJc0s1qfCuYpNpAifu02eUFcwunSxMKsHSx1sXnfiWl+na08kVCW69bpJsghQkOvSbs=
X-Received: by 2002:a05:690c:64c4:b0:6ef:70ae:ca16 with SMTP id
 00721157ae682-6f19e86a455mr10895707b3.39.1733951362509; Wed, 11 Dec 2024
 13:09:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:09:21 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-5-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-5-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:09:21 -0800
Message-ID: <CAE-0n53hKPr2WsGWTy24qfsSO4TbmtnY5bOQQ51UuW4RPUz0Dg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dp: move I/O functions to global header
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:35)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 13486c9c8703748e69e846be681951368df0a29e..2c500dc0898edfe1d6bdac2eedf3c1b78056cf6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
[...]
> +
> +static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
> +                              u32 offset)
> +{
> +       /*
> +        * To make sure interface reg writes happens before any other operation,
> +        * this function uses writel() instread of writel_relaxed()

It's readl_relaxed() below.

> +        */
> +       return readl_relaxed(msm_dp_catalog->p0_base + offset);
> +}
