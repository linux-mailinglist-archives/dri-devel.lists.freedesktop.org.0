Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F78503B6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED21510FFC8;
	Sat, 10 Feb 2024 09:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T8Mia3aE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6B10FFC8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:41:54 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc75c5e3151so601431276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558113; x=1708162913; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
 b=T8Mia3aEwI217R3xP8LKwN0v1suXM8t69O74K/XwHU+XNxm8HhW5YnY3Uor7no8Ik4
 YWiDFY+5htUbMz0iGojh6xD0qpVlPil5XrEiGU9aBmcGl4yHCwmET5DUB3JW9Gln/g6e
 szRpGLZk9Uwyvp/91pQmeALY6ItVqX8tm/HtDeHW3nckNuiVSTFeJ4m5GyFPSWGHQdgv
 GLDLwNaw1xlKXTIZ9N8NbAHsNcFnKqf9OROSrsIwAYrYuf2DWJh0oZIM4EMN/WBz6yjE
 PA1IqF9d/Nvk/ZuZEVFNeQmc39qHVnu4NBrX81s2AFtYnniw8M/xftm+TF0+eWfcXod3
 hhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558113; x=1708162913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmQjmWLV7DJRRFljU/pPBQtvGGLrbs70ePm8J5kL2KY=;
 b=f4dbRaOi48zku9NmS4uNPpuugU1C4asO0fokTnPQefSxCvRy9aULLR2Yi3SubElTpb
 eaZfjF+nSwXSexAnlMUGNAbRABGLXg2RYAjFMifMeedpjrxiXqOrAgGJlj/+pQXHCqBQ
 CLhPCLNLVIfFO8iDHWmf4RVY/u2m+0yF1NkrPEWIYg0KCa/YOyE2FNIii5xatFatcj7H
 bU0340143zyYPETpStT9EW7KeELAjEGHsjT0WULRIOu8/gLMHu1hsWZgrWAl13sM3uDm
 Eatgfe39v1J4evnvh4bVAC5mwsK7DddhdSgPBWxoRP4+7D49nNIf8fWRtnMF1zZfax5M
 z0CQ==
X-Gm-Message-State: AOJu0Yy4feaVs3+paH0tz00RiLZ/H+UK9nqe9LfRl/vPuWdrsBCiJj31
 b6C/rDDtaYgRbdybt+06+sJ6bVeQ4M4fIykbyhrV/6cB0HSw2eAZGvRbNyjDVZK83WOAVZ5C3Hx
 Seahnd3UBiWSKBsRbl8CYHnJy/mpy2K092JgxKg==
X-Google-Smtp-Source: AGHT+IE54M281Vieh3wZ0YBgqDx/AuBch5Pznwg9hx0yJY6dS7xj/fAxE3wJf/efdw9syQBI4/GbJ8uHf0sc1c5S73U=
X-Received: by 2002:a05:6902:1b0b:b0:dc2:3237:ee61 with SMTP id
 eh11-20020a0569021b0b00b00dc23237ee61mr1873660ybb.53.1707558113541; Sat, 10
 Feb 2024 01:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-5-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-5-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:41:42 +0200
Message-ID: <CAA8EJprduMsCwuXBOR2rATKJp+2+1R-L8+xSL6yBRE9CmdZnzg@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>
> Changes in v2:
>         - Minor formatting changes
>         - Move the modification of the dimesions for CDM setup to a new
>           patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 27 ++++++++++---------
>  2 files changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
