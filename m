Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE386FDE3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3E10FED5;
	Mon,  4 Mar 2024 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F2YBBjPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1515410FED7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:46:39 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so4976865276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 01:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709545599; x=1710150399; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BLGlgXihsI1VhplbXrlYAn9SvEI3AGLqfYGV0kshuQE=;
 b=F2YBBjPONTHYeFDTd2BILFCuCG1EX0dv5Q++r7xOu0arQ1Zean4DLRx8pb4bcKJ0bK
 osPqMEo17xlYvLAt8si0g4sw9S0eq7q9pfeTgWP4j7CEdfG2XXjAOynlpSbMWgNFwOL0
 lOYN75hYTmIF8khTl+Vc1m5yZcSk/kGQxFdT+FtsaYRTIKbMd2ME24Q4hARLYWAziqci
 QsMv8sfMc6ndl61PLyA9JUqLaIHNPaj5wonOe51SBsaChjzfxDzO087mprHJf1EUrkZI
 JWFmISpg47KJuFdS2EA5W8zGBI0SuGrfSCXor15F7YPNMqIua84bO8CQfx4HpMjy+EGu
 446w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709545599; x=1710150399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BLGlgXihsI1VhplbXrlYAn9SvEI3AGLqfYGV0kshuQE=;
 b=wVBvaiOobkV/wFLr/H8+3YaXrKKjpVxPrCTj6+wlv2BYJVTvBlkHYZxa8ymv8iFhMO
 +L9M/KTkPBSRgDMHU7ty57pWp0l1d2iMVNXWbOIhLKrY4qk08ReCfUn/XSxVXm7ZSCFO
 YUeetvnF3ghing9GamuSB/9rzkqEwnAssgFz2gwetNdz7lClkK64BxwWrSymhHGLdynl
 v3bEioHmdQ7X2SgYt+XO8SMPHMg1uNQjT6Z4K2d3QzncC3YfB+4lkb91FQ92xbCpjr9u
 VqpZXG5UYZNJZH91h+ThkXkroiboRVg0G7d2MZGUpIsW6kflIgnCbaBGUYC5OAXRzc53
 S1eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO9XB3jUulPrFdd84whczhJFxXnOkRpeD/hRzz/zfsDe4oSjFJRJc3DmSya+AOgak8nR58cKr2XSP0gz6iEwluYYqLqaIghXsSVs1GElLO
X-Gm-Message-State: AOJu0Yy9q5tch6O/ncQpBB8CxuBgcJgvgOWbaXVPaN8yti0KVNpZd+92
 2xmqubfKqWQlVqfUqX1egZBksKw+B+HC28ggp/YdSR93iJERrqo0HSlLpLHV6QrUWY9SyCRnYWK
 gpQr9e+5oGraZdzwFB/yjr4PoGNLcd3NH1vMsDw==
X-Google-Smtp-Source: AGHT+IEbNU5fOYhkOcwfE8i+Fr8S1blQTCr20ozaETwLblB+uHKIvc0Yw5/C0eYI4phk8/rQ63At6c98jlzp9d0hOLA=
X-Received: by 2002:a5b:74a:0:b0:dc2:3a05:489 with SMTP id
 s10-20020a5b074a000000b00dc23a050489mr5804962ybq.14.1709545599070; 
 Mon, 04 Mar 2024 01:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
 <20240228194730.619204-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:46:27 +0200
Message-ID: <CAA8EJpr+gTAQkc9RdDap2z7MvDoZCqBqJh3=7_4OwcXamDz3SQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: drop dpu_kms from
 _dpu_kms_initialize_writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Following the pattern of other interfaces, lets align writeback
> as well by dropping the dpu_kms parameter in its _dpu_kms_initialize_*
> function.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

-- 
With best wishes
Dmitry
