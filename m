Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC51890299
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9803112481;
	Thu, 28 Mar 2024 15:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="alsUWsCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4940A112481
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:05:21 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc74435c428so1092540276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711638320; x=1712243120; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kWfA5aPAvh98tytKTp4cttImQzYAy3tSsHDp9BTN8yI=;
 b=alsUWsCjLcEC7OVmmrtqGw3qYMWEKeeqO8Izf3I79X/3llpTm6j86STHNoAtX9HSJL
 BF8XGaUBFlSKRUbwEfVWbTXBcwpuPy1p5atd9YuPOqWceCEIm2czmhINBGtq5v3f5lXt
 H4ESFQl1Awb/tuwBHW7K8InP+EOTzXZPUp7IQ5a3TksaBY0KgN9mKhNHpIkdYT7yTNWj
 nPzIWi+kY99ukhv7kD6Ubp5WVchwAxXg5w10jwKUYjvbtWdRD2uB/Is2N6s65cPlzWcA
 wIBHiS4QWCMtx3l6DUwUNBfAQAbP3/EH/SvNVVXxtGuNE3m4wwUztqxxk9fh7EvOopLL
 mOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711638320; x=1712243120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kWfA5aPAvh98tytKTp4cttImQzYAy3tSsHDp9BTN8yI=;
 b=k8kOVpxfTxXVd9Q6TCRhJHKBnGKkxgi0S17mldYNMGNdlgSWW7QetrUTEA+eNzfY9L
 3nvXA6kJ1y11LAhCXapiU6JePriyl/UGRd2RtIDJV8FSSkJt4YeZTTkPGScS+TTDyuyV
 DOGonPw3MPxpxnok/0ki9ktERfq2UYC4zBDgRokZ4a5x+E8skl73NgB3hXaKs7n+7BDW
 8z5gIi1eGUnQ0///pwqFd24EDxj8pd2cYBRWl7cLt1Pq7ZHHCmNSGK89Zkkeu1wOtdpK
 rkOZbnYo8GThTD26wc0CTnRLK66YF6ptJGXCCKXrp1fGRWnIdiJU0LZ2j3VqbcDSQgqu
 0tUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSZE0e8kFu6D6LTg3uParSzZNQ26jCCgKDoZP4ce3cWIIE6DCIegjhSGdcQ3G2ApgbMdTTNKngus2e9i/N6s1miL/am2hwu5NKG7QY+Y9H
X-Gm-Message-State: AOJu0YwDSvRR52LhsvuklPGDSsPHeY6BJ1nAdLrOcYjkFlP0zWJAxIbc
 7P+gXwX/RksMCYh4jHVlaWvyBZPRahQAk0ABHNu8sKBTFkRfXC8cAzbS4Qj+PJY/BdyOOdBd/mZ
 n2R8xQIZaxueVh3Nj425tg0+L1EuKni/sWLaOiA==
X-Google-Smtp-Source: AGHT+IH5Xh+9FupHdZIT67h4lmZsG0DyoBdLyn4cmVbBccJpUVdzNv2lXzX29oOTWVqXhXAL3MPjvraXmi+NFx2bMAU=
X-Received: by 2002:a25:b843:0:b0:dc2:5553:ca12 with SMTP id
 b3-20020a25b843000000b00dc25553ca12mr2994878ybm.14.1711638320206; Thu, 28 Mar
 2024 08:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:05:09 +0200
Message-ID: <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, sean@poorly.run
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

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Fix DSC timing and control configurations in DPU for DSI video mode.
> Only compression ratio 3:1 is handled and tested.
>
> This patch is modified from patchs of Jonathan Marek.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

This almost looks like a joke, except it isn't the 1st of April yet.
The patch lacks proper Author / Sign-off tags from Jonathan.
This is pretty close to copyright infringement. I'm sorry, but I'd
have to ask you to abstain from sending patches w/o prior internal
review.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++--------
>  include/drm/display/drm_dsc.h                 |  4 ++

Ok. The feedback for the original patchset [1]  was that it should be
split logically. Instead you pile everything together into a single
patch. This is a complete no-go.

Also, this patchset lacks changelog in comparison to the previous
patchseris. I don't think I'll continue the review of this patch.
Please rework it properly and add corresponding changelog.

[1] https://patchwork.freedesktop.org/patch/567518/?series=126430&rev=1

>  8 files changed, 56 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6a4b489d44e5..c1b9da06dde2 100644

-- 
With best wishes
Dmitry
