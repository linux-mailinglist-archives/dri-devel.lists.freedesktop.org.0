Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFBE887C61
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 11:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99C010E05C;
	Sun, 24 Mar 2024 10:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GScLsZkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9561D10E058
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 10:57:55 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-60a046c5262so33145767b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711277874; x=1711882674; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
 b=GScLsZkZnCnxEfxDPL2PXrhRDqYxdsDEo4eBFE511VE+2ZCs3vLyzMUACYEW+hFP8i
 H07LmnL17Uo+RcTf8wuMXbE/OvW0jk0k5oVodjBbiOjcylSY1ZeV3Ma1ijUL4GBNz62x
 9EJv9qjkFSyy2RLLerAUmonCRn2riAvgjYvmxXRwqL112WUJoCRT+681e7wiI+6YOcnI
 GSrwxf3S/pYXL7ADhrF8bHKL/sZ/5jSeVh7EylrHjv19ewswS56sWKzZGfR9r3GEql9c
 aZcn+zrdXO9n3uDhnVkTcNVBYBWgedZK4z12ZX4+6R1DtXxDauDw2ZgS0pX+GR9g6dCH
 +u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711277874; x=1711882674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
 b=wDRf0i6AtaPZ03qcOeb8IacMUDfW3zgWSDlefbfXrPNfNXnHpyhBi2bsBDz41dnEPi
 zSTsd1EftKLut+ikgaukGkBElSkSCVLmHXKKOOHHsvgKQ+jMDjQRZUpz9U/yugS+KesK
 WVgIbvorGl4Y7tZ/QCucs7tWbbLiH56jvm3qiA0I4LoBsJliKAmH7MwC1BsZOc+UU5ur
 7KbvEwKNmJ2fXm0pzID7SNyOKwR/cSjd3SQAfxuJJZs2+9ToXZsrn2ufYnN1+qc9EVRb
 +9/tO1GWneGV45u5MwHyC9FZkogMyyOM4O1ue03m5YmKLjm7tM5jL51Ot7ajFcuE7qiM
 jqUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiuUL40qdRZfOwvviBlRhOGCSNOdi6W7gPRZPxqs5WU4yZyX60mnb3x1IZj5I6sXgcR0buehqGAmiCC6Gd9q9KzFxoalbfzQ9kE4T1d66n
X-Gm-Message-State: AOJu0Yx7tMXv1mjHohXJ+IODJ9bwmqrX7GmkrINCPa8Mxv8Xb3N1p6jC
 /cAMu75VHgbulO5peXNHfVeBOKUNh2bTVhfgKNYJaazoG4Lk7x7r2smKbsqbqe9XbEc+lph3GpR
 NMuuVlrXU1xjM9NJGpCJzWLWsZef5LDMlRbyzUg==
X-Google-Smtp-Source: AGHT+IFkNNzpGCHNVGuHvvSWfPZSgwg1RAQpdjkiNapdwrzO0RfGnrZYm+TKLaP2muu4ukqjYZ8fO611rcTztYESaRU=
X-Received: by 2002:a05:690c:ec6:b0:611:2f86:7864 with SMTP id
 cs6-20020a05690c0ec600b006112f867864mr4318637ywb.3.1711277874516; Sun, 24 Mar
 2024 03:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 12:57:43 +0200
Message-ID: <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
>
> Is this approach common in upstream kernel? Isn't it a bit awkward from
> legal perspective to rely on a source file outside of kernel during
> compilation?

As long as the source file for that file is available. For examples of
non-trivial generated files see
arch/arm64/include/generated/sysreg-defs.h and
arch/arm64/include/generated/cpucap-defs.h

-- 
With best wishes
Dmitry
