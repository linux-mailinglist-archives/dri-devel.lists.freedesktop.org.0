Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E385CB98
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 00:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663810E5A8;
	Tue, 20 Feb 2024 23:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wgQ93p1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265FF10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 23:01:07 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso6099144276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708470066; x=1709074866; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U2fn3Q8ysQNGsP4/bFdrwVKI00s9RBc5Vo0obuiYfWE=;
 b=wgQ93p1I4Qoi5jzMWBwHqcZPyAJcTgbTmtOkJafeohrXXcIqSgqqLCQ6vAypxoHUy4
 ms5pE2ouRhP2qOkO5Z3sPJEpueSspAA4dkySwZLnkh3uhuitgAIJh/vrXH9Isi18UzkA
 LToJ6b4NkVChzbjkTXveT4S5ZD30jKaiASdfFMVQ/vrMNWXsJ+SEItDuKAqMZg4kfU14
 vpKboud6svn8gvdgviFiX+Gt+0SjLjbC40ab0rFLzszdsa2lvQ9756NKBKclGuqMEOoZ
 b5xRcreBXWcAOYDH1r9wkoQ8jcy+YMyfZRO0Lr5SwtkW9tXE92hwEW3QQI9LNjeV/AMF
 YRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708470066; x=1709074866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2fn3Q8ysQNGsP4/bFdrwVKI00s9RBc5Vo0obuiYfWE=;
 b=Qs+uVUh7rLCtmtggrp/ANkO723hJwToqM8k3QG/PWAunBg5VRLow8U/HU6HdLdiMYa
 QGYDnesodKs7Wxr02Q9DnwBIn3xvM94B8GaeeiMUViRxcB/nD8KdBVzFrY16lII4zaxL
 insn6NBb2Xw9FE2AHiWCZqXpEhkF+HhbBEvIOD1wbIcrNhxgPcNVYxiZS16D+JzQ1Kth
 KS36piE7bbIMq8RhkrBhGUeH31wOlbfDO9tLXvHhQAGnSU3UAFzRUyw9SUHMaAWyvhdo
 8hLmfDplCJOfZGzFP9cou1blnCSGhPRIwxHJWMZpLDa5NLometxY6Zg/LErz+TAOjIKr
 +Pag==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3rj0AOmkTqmESkqnycYXOvt9JOJmr85qD87bzt6X/d+qMM+d/lQUXxRJmjtxnvttZEj3dxR9lSuyPc7nS1sTItRK5s1o/GBA3vbfXX/vY
X-Gm-Message-State: AOJu0Yxh00L7ZFW/mX9vcmrairrnSy0BvxOelabyLyPEAPypZM8jUWG8
 /Afam0THdqjW8FqkFv89ZZGz4IRVgUEBlsDFCAGsP+dZLC452t3eVtWtdmVS0TWXmLzZnx29Sx1
 87eeHplTPoYsbq/kXEPBtzfhXSWdQaRsXzE8P1Q==
X-Google-Smtp-Source: AGHT+IHF4X8wKExd1/pvj1ol/XkM7oZ8gVoH8+BQhl5KQKK4+h/fjqShZZcUu2zwUnRK8rhG/TFZmoyPRSTuQf9Je84=
X-Received: by 2002:a25:8a12:0:b0:dcc:e388:6db6 with SMTP id
 g18-20020a258a12000000b00dcce3886db6mr16240782ybl.55.1708470065975; Tue, 20
 Feb 2024 15:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:00:54 +0200
Message-ID: <CAA8EJppgusQObCgmtG7Sz2tLiQziyPy71Eq7ru1=VmOaTZE9og@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] drm/msm/dp: Add support for setting the eDP mode
 from devicetree
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Wed, 21 Feb 2024 at 00:50, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, use
> the is-edp property from DT to figure out the connector type and
> then pass on that information to the PHY.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 11 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 ++++++++++++++++---
>  3 files changed, 28 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
