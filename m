Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DE92850A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930010E85A;
	Fri,  5 Jul 2024 09:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQ18Rwsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BB410E853
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:23:30 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-650469f59d7so12716697b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720171410; x=1720776210; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
 b=LQ18Rwskyf8rIKo5ofQ3YQy7Qxi/2r5e4nP/CYU23+qbWr7AQJGYkWMRN7V624hZpG
 zVvpHEKAdufkloQkI6pFQ7zi7GETvJ3PWkpZiANQq4cTUBnJry50VUNwq691pL+mnIaS
 ilZX3CRSLFD80tbZi+AthoRjJmpRfI7IgSVx1qPHH1+jZYgUnuwlSxEJ2mte+rOgQRC+
 DZhiqZSiQsv07jzUSAtLh1tT7QMQ6VL2zTUqQRr7WohYCxCVY4ZP+o/S4RyuOM+WSuKe
 jSOxErnhkwqQ13ObWKeAWXVo2ihvuuhTW5x/01OUMpv8Gm0litsvniqyn+CBIUTp6i9p
 OHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720171410; x=1720776210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
 b=rqLOEBSe86XY2Ofmw2fgMvF/3tvLZam5yjws5RmtJtmZeV8mpItrwaNLdNw/BB+B6R
 pDW0DlTFpqdAGVfQKvx+UivC+uwPPeCQKKKHnqXRxUR0Ui5CjZNnw33rknRQgLtjkLcI
 3CVSuMoAFzoALLuHA3MkF8wtuKFtBzDfZ3oSL5k9JcCZtuWFCezKOIi/wvPVVZ5nK8Ej
 Q+SNnmbibds0b88kKmW1eoKz4NuVoIgWFLRRDcwt+TFwSwYiO/UrTEdwgon8xcwtsxTy
 NsoZMzV+Xn3dUj2rXtPQjGk0bNHEgwIi4T/KTIyjYyFTMPT6pqHecefz3GZnvfCBvDHL
 XEjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJU6HJYGv15eyE9rh/kit2e5pedpLghWmVy0CmNpDPOBAdsYaxEKZekcoaVOJaHzBVMiUK4rCHa3eHNLsB1x3Q0VoZ6P4lZ2XXwB2TKdaT
X-Gm-Message-State: AOJu0YxZFMNV0i8Mi1Uwj2JGF4IalCKLRjkOvb0xjpNgQCWvGJUGWF1e
 tErqhsaa+DzqRwQUFjGhcvEucyrffGNGtkGr1zlhWyRoKUYL6rszWJo9J1otWlzYeTOyeFWEGQf
 RbfSxnsKVEWwgRQezAM8uY3r5F0n96G3XBDJGGA==
X-Google-Smtp-Source: AGHT+IFdbNU4G1KM5yKg/MD/UwoLXL7Pbn3ZaZq/bO3zaxMuYCSMp5qT9ATgxj2sjU0+WAadmGYWZGC5dv3nUOiV1F0=
X-Received: by 2002:a05:690c:700c:b0:62f:37c9:77bc with SMTP id
 00721157ae682-652d2ddeff1mr47325217b3.0.1720171409891; Fri, 05 Jul 2024
 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240704093002.15155-1-amishin@t-argos.ru>
 <20240705091312.9705-1-amishin@t-argos.ru>
In-Reply-To: <20240705091312.9705-1-amishin@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Jul 2024 12:23:18 +0300
Message-ID: <CAA8EJppkdgj79v6s==egUOm1omJwsSUV-iduJm6PjJkvr6iyYA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix incorrect file name output in
 adreno_request_fw()
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Fri, 5 Jul 2024 at 12:15, Aleksandr Mishin <amishin@t-argos.ru> wrote:
>
> In adreno_request_fw() when debugging information is printed to the log
> after firmware load, an incorrect filename is printed. 'newname' is used
> instead of 'fwname', so prefix "qcom/" is being added to filename.
> Looks like "copy-paste" mistake.
>
> Fix this mistake by replacing 'newname' with 'fwname'.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2c41ef1b6f7d ("drm/msm/adreno: deal with linux-firmware fw paths")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v1->v2: Fix incorrect 'Fixes' tag
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
