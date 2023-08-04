Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66007700E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DAB10E087;
	Fri,  4 Aug 2023 13:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09510E083
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:14:35 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-586a684e85aso7457227b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691154874; x=1691759674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
 b=Mrg4Xr5v0lFTFocRyHHEc/zy5oeKvOxVeaf08lVJ7qOu9G25xP8Yl2opzmsjEGYjsW
 0Om3zPnCCY0EABOYWclpfzyb+ZiGjyUErocqO/LbH1SMmdC1cHvm0nefne0a4NwzTe3o
 ue082SJuCjExtQm7w3FilO5271WrroN8Tr/rEi0ohb4LtN6m69c3a2n96V8XNIyxBUx4
 tlauYnDu6Qi2QCQrDTUpc4Zi2ML5ZWE3rse4yDzvKi8Bn7tARoEZpjPHp9q1TR1d3WoE
 nkAXfDqMUV7FVUs6eeffv5TVKg9VO3vYmspm+FS25ZPGsZV5vLgpC6mPw4o9Th0llI1s
 HipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691154874; x=1691759674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D4FGrRKKqr6fNENlJ4HUuscXPUM5XRYzhDK7WNtt/9c=;
 b=MCZAfZREQ/DjUmPOjISCfFK7yd0/CRgpTbbjrYL2iVUJAYOj3RJ/aD8xdMCAaAHFH+
 ue5XJQrxMMd5VXWxI24R0siEhnPEBGHvmSaB/qvtuidXWH7OI7FOHCWO1/0uH27wSbDT
 dlDccDJ/LVAYoDroUxK18/TscgxvYtXQ1IqlOi88w8W2L/8jtNt/qKOQ5VkYbtE/vQ6r
 QWZD5eLuloQWrFjetgtjIXLPwhRav3RqGSvf87ymqPEVnzUe2ifLR61+YMyOBgxGP5gA
 X9+Wqw7LBHVR6EFZ0rsff01FbTYtYxTWAm31iK/2mraVX9tAUjHj1qQYBEO/mDZ9Tdrn
 1aDA==
X-Gm-Message-State: AOJu0YzrvxOBP7IRNm8qB65+rBkQ+qyNAVxviO0Pwf5ZldAM66yUzmJc
 9k5NMR+hahsKrJDEGyLVhIab7uivTSS/CtYyUQlMgA==
X-Google-Smtp-Source: AGHT+IG/YtX9++/di3aekXINcH9r4zmIZn1VPvqr+jVi9AWhqoV2uRrOWWP2zNSUOl6v7/OqmARiYdzthQYNo4Bm61c=
X-Received: by 2002:a25:29c2:0:b0:c62:2320:2598 with SMTP id
 p185-20020a2529c2000000b00c6223202598mr1173682ybp.62.1691154874341; Fri, 04
 Aug 2023 06:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
In-Reply-To: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 16:14:23 +0300
Message-ID: <CAA8EJpp6mijmo2A5xn2aG2PwsAh9mr0v3+ruDgoqLKTawme-xA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 20:01, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> In addition drop the dpu_enc_ktime_template event class as it will be
> unused after the vsync_event handlers are dropped.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Dropped dpu_enc_early_kickoff event and dpu_enc_ktime_template event class
> - Link to v1: https://lore.kernel.org/r/20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 23 ----------
>  2 files changed, 1 insertion(+), 87 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
