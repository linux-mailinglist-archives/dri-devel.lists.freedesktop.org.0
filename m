Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85203992170
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB88B10E2ED;
	Sun,  6 Oct 2024 20:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OFwtBMyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7A10E2F8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:52:11 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fad0f66d49so55491581fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247929; x=1728852729; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9OyMjhdbJ+/IeY2iyhb3CqRL8DD3x/amWZ1lVkIaJ5Y=;
 b=OFwtBMyg0AMo5f0tlPfsh33T8lEb3eIJ7mmj/Gbs+1hIVGuUsFyGrjuglOcU8fEeuf
 DzjBBNsPSpdsx0iwEdzn7xraMZs0/zlkB7rj90K8oA9BQiIwWgtK97xyb2f17k0aMmms
 DrurL2pLpmogBP3fJ3qUKr7C+5smiGJJP9QSxeQQrAyS2xAqEF2C003HtbkB+SL6ZPkG
 aQeO+Dq1wmuB24+JTmqvBV9169Whjssru/x64h0kxl+4K7pf/PtJiChiUMOdKpmcGN27
 7yBsKyUuakQsQbviO3JS30aDueYX7BJqK48fQ2fxx1kmu8pP4juRx3CAPIxnLi0ac0iC
 iodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247929; x=1728852729;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9OyMjhdbJ+/IeY2iyhb3CqRL8DD3x/amWZ1lVkIaJ5Y=;
 b=tuAvHYEwlp/gGHexTxvuqgKofNdjhobxrLQZAc9Cs9DidH1fZ+vec7maKkg/hQk6Ue
 ugIMJg+fzx+drlGS409t05xOszGFZ4i6/WjsrDGXuQBqRauUPMWho03I4Q//K8CnTfvU
 h/VAp/f5Uf/lVpCXd4GPO9Gg3wY0lgSR3wqtSYhMOjoUxcOiWDt7e1w7BEC5e1dNZqpd
 qEHr1v1rnnT+5xH0i/xP7M8ZQmFbPccO7gEiZwvhrjOFyul40YrQFjNBfNKTe/LD5HTV
 xe7k+BOKyBDQy8d2nEVsKfQ4Vh6Tw5cQ5fbLJZJ4tdohm3P/CEnZUuUrGiRUP3OU/i5x
 Eo0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH2MjMumIp3RnPbf5zJlSWAsybwVzTmzMMVr8AcLmXa49OlH0cDOEjGFa7QZiav82SY8wlVcS09i4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDDFqHqe76fAy0wRQPnfIHBNY0y4T/iLf2aNEd9ygLjNkLbf9i
 RA1wNIewCtS4alz8oNiBjSm7+mDsUrXQKK+EY5yS2R7tq8vi838Ixsmdzj0MqwI=
X-Google-Smtp-Source: AGHT+IGRiIySlWrGOiv+6I3t6tczVBclAkcxaaYg68qustx800l6/g5ilrv8dcAOtRr4pKR5snZEBg==
X-Received: by 2002:a2e:bc1a:0:b0:2fa:c966:589f with SMTP id
 38308e7fff4ca-2faf3c0c21dmr44365801fa.1.1728247929172; 
 Sun, 06 Oct 2024 13:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ac440asm6287441fa.46.2024.10.06.13.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:52:07 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Add support for MSM8917
Message-ID: <tv7eajb252ncdtb4vrd4o3yi3jbod6sgt3rerfaixr2kyddnfv@nrrihbhu5me6>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-4-594c3e3190b4@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-4-594c3e3190b4@mainlining.org>
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

On Mon, Sep 30, 2024 at 08:35:59PM GMT, Barnabás Czémán wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for MSM8917, which has MDP5 v1.15. It looks like
> trimmed down version of MSM8937. Even fewer PP, LM and no DSI1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Remove intr_start from CTLs config, reword the commit]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   | 187 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 191 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
