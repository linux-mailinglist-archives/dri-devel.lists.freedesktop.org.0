Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5E94F852
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 22:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA510E064;
	Mon, 12 Aug 2024 20:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="csqXt9Ay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613BF10E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 20:40:39 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-8225a1f4d5fso1471761241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723495238; x=1724100038;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NZAvXAR1bYBwYWxJuFfSjAliHSEQ1/ECvzqzNyw/0sw=;
 b=csqXt9AyJ8gWxIigIfbnsuCvEL/BotjVCHlR7PpMr8UF3D8SQJ4zg283bg6uTbTX2E
 tXt9UKqapKTnODFbg1UxmUuZ02aOQ4jiOCLt1021ADLwfCuBtvX9Z4RU4SXCUTjYNqO2
 J8Ky2uhhCKNdxp0gOyeSSM4rGxHqWBlrkma6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723495238; x=1724100038;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZAvXAR1bYBwYWxJuFfSjAliHSEQ1/ECvzqzNyw/0sw=;
 b=ifDv84RI7Z2cIWVTHXAx83E5Zs/Sd8y/nHXgHvxMQCBOlBmX4TCdBVWxZ+ItB5hAA9
 RK0zXumo4bnk5x2rcMjCVpEj7xnIHuvU9iffMG1EHBvCjGxyKlsShJQy6GjVSR6Z2672
 2m0TwFbOfIwv4uLdp1n2yoDLL7NCQ4Ce7yiuOM/DuIdJ38oSUh3zcZ4qrB59e7avwvK+
 ZZQhglKWVFfRGCnQ8EATJe7CMIciZI6Ivatf9fLUUsGcf2AsKZOzlk14CdvwhDagKajm
 WUkTG6wM6gbmcAycuFoog4EC42KUGDxNzsWy4NpXWbtI+RHmQnOeg1defQnAXgOqdSHl
 TnFQ==
X-Gm-Message-State: AOJu0Yzqm1g0xvgDi/iG0qs/7duYGZ1D5en3c+8lr7knx/7bVvAsyuch
 0NkXZRSewy0aNujtuyzzfrOdSckpwoQCl1Qvj2FYxqonOWU6+SaRj7rlYXy5idTt+UtjPSl/SqW
 MzefHHIIiIkPu1GvizxsxFLwOU6O/krBUUr+k
X-Google-Smtp-Source: AGHT+IE2xPIqgDYMDkVhZ+0wWF3tCQ3Y1t5YGgN/I9e2VhXStjX52f82U/5la54x4iTVj8B/dfc51TU63Md/eZ4s4WA=
X-Received: by 2002:a05:6102:38d1:b0:48f:95cd:e601 with SMTP id
 ada2fe7eead31-49743b36d8emr1687799137.25.1723495238239; Mon, 12 Aug 2024
 13:40:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 13:40:37 -0700
MIME-Version: 1.0
In-Reply-To: <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
 <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
 <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 13:40:37 -0700
Message-ID: <CAE-0n53WwLK_Zdf_-1ftUV7pBOj0Vw_uM3LhHdOpVhwY1ZJ0kw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
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

Quoting Abhinav Kumar (2024-08-12 12:41:40)
>
> I just retained the same convention that was used earlier. It seems like
> a mix and match right now. sc7180, sm6115 and qcm2290 were using 0x.
>
> I can post a separate change to change all of them.

Sounds good.
