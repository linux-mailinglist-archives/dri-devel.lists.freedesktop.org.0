Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F89EDA63
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D083D10EC3F;
	Wed, 11 Dec 2024 22:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VgaNfR3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635810EC3F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:51:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so37869961fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957464; x=1734562264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
 b=VgaNfR3BM/vCpvo214nF9SkA8gu66dtskgJFcdP2WsMrz16PHjtNqBN7zY/y6Wkhgj
 6GagQ66YEvk40q2uKY6smWnMQ30xJY6uKyElnijhMVq1Rm+ZjvjqAvd/yuETqiv76XG2
 xXCnrTf6d9+gLkACo6Wf8BIMKrEs00ekpFrPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957464; x=1734562264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKgmtaCixVS2eTp9TrZ+8kVzXwyvmutreSuRkttynvI=;
 b=IOEl1KRWhXsJNpY2M7e7T9S8qoZrXyhmm1eUDvMAu54Z+3uakrdvMfY+A25YO36zLC
 nNAMBZwuJfFp7Awe8El63+gECplL92vzNHgp7QuSsD+4J1HagJJyrXN3N5HIcImMQXKT
 S/m+FJEusNA1TKYar4jtI+QJ8PUM6DDE6n0dGZZ3xvtNzdUORHNRjRLEfjIJVZClEJ+z
 f+bgY6I30z0Gb2jqmXDH9Ix+Hqkz4HcWYxKCsKhEnNXs7zrA1Qi9zQPOgXQoCMr3cmLM
 XUkFzBO3ez1/SQdtBgpO4lSaq1EjN67gMcAo41kX+moBr66ddIvvhncQBZJr7gJg9NAY
 41Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTscJeROlIN/eDdCFPL1Qid9L+9X332rbqcoz/Hn+ksZfzDD8saMFUITSxuLFHMe33b7HMeklWyNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdk0CKo9xHl7JEsUYkb5Tf5faKm+i0DsD8WrLD+6/GPajTueQs
 GX5uMU+2zFVurUUoSAwo+urMdktdrLNW+fy45P8Wsq3Lk1zL34CMgEcuwq2aoKkEE1NHZRUB2CY
 xuZSC
X-Gm-Gg: ASbGncs28lY73ANJ8guH0n2x90l80JY3PdPTVkW05z79+tsaByVQ17Yt/+w8uw1zb5h
 5RJBMGeGAR0zQvNXrDWwb4oA+ypJHMDPOd+quzLRcul1cQjfjOCjIC6ziyILTFmWNRmL3c9kKxj
 XSi+fzu4hYbJCLaryyQGTlO/tBKNPR+OxXe4l0X54mgF0Sbv9O3wASFY5dVN8yLWvuEZBjMdfRE
 Azx411RFG9z+5JJd8N9Oj2UXf0gwOnsMD3GHngBRp+riCkfIvQU9lqD6LOCxmT2kuiUgKJTYB3P
 M0AMeDcQLPByupxr4Q==
X-Google-Smtp-Source: AGHT+IEhcs4Nx7dug1NX9HftHTHxYDU2f0FeuZXLWLS4LFnMiYIQS/4zWzMCyBUm698NPvxXLw6uoA==
X-Received: by 2002:a05:651c:1a0c:b0:2ff:d7cf:ba1d with SMTP id
 38308e7fff4ca-30249eaf097mr2765671fa.41.1733957464270; 
 Wed, 11 Dec 2024 14:51:04 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30227c95398sm9314271fa.71.2024.12.11.14.51.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 14:51:03 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so5049523e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXGoPRiVJ2nKwywvUztpN9z8rWeDD9RLQ5/oWUn8maTnrfl70UvYy8XEfcuQXevAFIWjqKvHIs6G7c=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3d11:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5402a5e5682mr1002664e87.25.1733957462810; Wed, 11 Dec 2024
 14:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Dec 2024 14:50:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
X-Gm-Features: AZHOrDlpR97b9ybDcxqzZ165UcoKpL_oopMC2BgdmlXON_-hpEKkrEAlm1wccLg
Message-ID: <CAD=FV=V33utY6rby5e+RkRfUQQ40g2Bq3xr=G9q3if8TNoq1kg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
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

Hi,

On Wed, Dec 11, 2024 at 11:51=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
>
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dp=
u_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-=
v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
