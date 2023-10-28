Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB27DA474
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 02:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA8F10EA8B;
	Sat, 28 Oct 2023 00:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0515F10EA89
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 00:38:53 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a7dd65052aso22199907b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698453532; x=1699058332; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
 b=uyCfQr6qB220LV1KYMnj2KeYcJTLSgYtCEpL8jpoQnghFcgp5OXwIhLsVlDDErmwDR
 vJqDNNbYlpToMQmhbPcHJUQPCHT1SqpkiaXic/Wnwgj/IK2nb6wKP93zmzCxhlPqvchC
 S6AE/lHsFH0Mtq/xctpAnB8rfeajqPXWqTGWsiF/CIR4dwPyFJoeVk75saT29ftSjkKW
 gS6YiPzbn3XJzQ29wlg443o4CWPEm6MKezke0bgUPOfLkofKWZUnyaux91rpizLFKQHh
 em35ekIqtpEJTmO2hhwkqPnXjBK9tiPqmdnd7DyV/BR4QKm6u5V/UNl5xNr90pBupp9H
 h1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698453532; x=1699058332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
 b=qtYpS9Jd1l06aFVhRzzwArmrTNcvmJ4Y5LrBPDc41HcrvLASxh2rudAHnEmqc368Lc
 F96+0XKuGYyTLoT66daos8nFQYH8Wk6qu4/8S1TYr1Lkoh1GOiC4YKNxe1UtYVBc+muh
 dmcX2DtnoTQjP/oHwO4I2dmkpP5mDATSFjD85ef4nD8dJTuDEDQKGPKhCoZ6BHPSwo2d
 0pJp40VENZ2ti2juPvOXTO+T2Mu594z6fffIEHtPp5hDUEaY1qcygGEXNEeLTKPNO6CO
 fpHL+6dKS8ibvs4N+Ydpipj1ws1xPHTCJVlwQc2RGpUOHWP/n1NsSCgjgbuRQt8VH3lb
 s6TA==
X-Gm-Message-State: AOJu0YzkjsesnSoMt93jJFyL9I2wF1thl3Pek1wk0RY1d5itO1KnAYfK
 DAoXE0Jnmjb19ny06fV3tJgQKKJZKxXKUzbSoZaCKw==
X-Google-Smtp-Source: AGHT+IEDsS4pdoUE1Qwg7Seoangbh4UhCSVIOzVOPb2hip5s80EP6sbN1q2SQn/BfjFTB3Wv+pMshe07+l2I0j15KMo=
X-Received: by 2002:a81:b60b:0:b0:5a7:ab55:b9af with SMTP id
 u11-20020a81b60b000000b005a7ab55b9afmr4486377ywh.35.1698453532139; Fri, 27
 Oct 2023 17:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-3-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 03:38:41 +0300
Message-ID: <CAA8EJprsWTX+aG+wARffRWx_6UOEuHWRnBYnsLyrA2o=h3tQJA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/gem: Remove submit_unlock_unpin_bo()
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The only point it is called is before pinning objects, so the "unpin"
> part of the name is fiction.  Just remove call submit_cleanup_bo()

Nit: 'remove it and call'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> directly.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)


-- 
With best wishes
Dmitry
