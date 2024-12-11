Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D79ED9F6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A5910E163;
	Wed, 11 Dec 2024 22:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="khNmPFqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCC910E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:35:42 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-46772a0f8fbso27992711cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956542; x=1734561342;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=WkXMEqZ/gF/xnWJ/mhzzg/miOHHNVWajJShRngxnHGY=;
 b=khNmPFqd1PT6t91gqvE8KR6hkcncdZ5bBfvzzNvS//V4iPoJCWd1FJJQ238hAEcsnc
 7w4B5bpJ11Rva5tQqgkIbpHl+AvVMcwGetnMhl1UVy3zItThLceutYY+p+5wPpHPLsTg
 /gIQkFMeqSlNTjZ+hZKdQmcaO+GDbohRayR/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956542; x=1734561342;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkXMEqZ/gF/xnWJ/mhzzg/miOHHNVWajJShRngxnHGY=;
 b=UmykZ61WfzJeXBzwudMelfa85mCLcou7LpnPqVyqpuDLCUgkRdqgKNdpCA4YOlUAGb
 MGzz3QcC/Vi90eF4bvOdql96+/b+FjrtI2KM73OByUKVKsDCt11T5a/gFzQHuEGT5tWC
 JFatNDCQtgqkoJzYF1tiL37pBQD+4wxq8ZM68yLpv1xiiP7YkQ6fVI7ulo+RUeGhcwDb
 aaaQV66nRl1UOVmvXV1au1MQnIoCXdDX50QCdnGoptzRaNSBftCdeBMp5/26hAV1lhrF
 VYZvD0mNAH0V1d9EqX/qv/DNhPGdjaootkENBdtLrC5tt2pKkMnAHzWO2e3n5PS4TKJ6
 2jAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrIMFuCPAaxXhvCdb4gzMp6X4oYvr9/r61VRJhDhHdYEsP/geMmtPTncV/9UrmpALbV1l881mIZ7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKMvE9llFuKCAugn3u9jqOK7aqxmvA2Y1MXSmFtSSwo3n4RoQL
 N2UE2Zg+CQpMgB6t/fDzHVWyHZFGDQO95sH34CG5pr9mGBBeyqKx4Ivsx6Ko1EjxTq6qpxtqAGB
 xYAOps7PJR4RV/1UOIVSGXAmh2osO73C5rMjt
X-Gm-Gg: ASbGncsQzNQ/NvGukjB2uKlA3LEF7sayAGftDwMX8Un6jVJN21JP68H0mVx347seFZf
 jDKo8xntqNNfjEeliDQ+4IGght1Mq/v8jvZD0P+uD5GTjv53oexUO2a2FW7JzwAnbBQ==
X-Google-Smtp-Source: AGHT+IG9f7BHz8iDa6A37ISXD8md+OMJZHRpC/Cm+CFql7zV4E9ytytJpMb018vR23ZL3eujA5g0+FW3B1/RL8ezpns=
X-Received: by 2002:ac8:5e54:0:b0:467:43c1:f0ea with SMTP id
 d75a77b69052e-467961786bbmr14756091cf.16.1733956541804; Wed, 11 Dec 2024
 14:35:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:35:41 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-11-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-11-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:35:41 -0800
Message-ID: <CAE-0n52kSzNeFazUpL0e1C-tTZHv7nzOCYinYCX72pKk-E9_XQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dp: move/inline audio related functions
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:41)
> Move audio-related functions to dp_audio.c, following up the cleanup
> done by the rest of the submodules. Inline functions with simple
> register access patterns.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
