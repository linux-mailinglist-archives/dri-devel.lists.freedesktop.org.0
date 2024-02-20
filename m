Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4885CBA0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 00:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7714410E5A9;
	Tue, 20 Feb 2024 23:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WpjejAT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071E310E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 23:02:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so4185477276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708470171; x=1709074971; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
 b=WpjejAT/EbuOb9qozgxRNx1bCJpD9r0lv7yD9Dv4Bwgil+/t89i2qNQLhTKjrPka2O
 2zP78Kf0joRfp+DKX2P2MeySIHf1Yt225LaJNWXjM79zscsOG14P+TNY7oSRDnH9u9WT
 ONv+jB5N42I0ZaYWk3N8/tz2M2dyBiC7zKg3QSld3QZ1/QiHK9V61xdxjO9fq/bu8kOy
 Z0cs4Ad5SRKf4ifJ9LUrRobf0AuGo6dUfzXFkTmJ50t5eJ6n8GrCP7NM0lvXuqY/ZTxc
 HryGiNBf3x1Wq4ySOjZ2+iTrmIukNKAUnNCFuXxwUE7OTTN+2wF+dISQJtGhB7hgzzmp
 zDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708470171; x=1709074971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
 b=Bv6pFk3Ot0km2dkTc8/plhZVppbBP/hL3TQOAXjcekTPrVa4tUREqGiw2B4bpb8MXi
 0nPi55L/IZxbj5LOEvXGVtB0WOelaUF6tWxLc9TsL2ERIPMmNVWGEuixaA6dsZbkP6oB
 enZQ5B4t3jzMatD4qeR6Sy64nH5E5L08XQs5XqOmzVzM5eIjHlX6wydd5F2rARG8Idw3
 zm9FTeP74bZSOpvA/svUFVfZ26NoAuedXGdFW64KikiLviXzZ3+/dWKbVokwMAn9IFO/
 0XDG1JyuFeaZPT9wf+MfSZmP2nFkBeJBt4P4M+RzCiYn9u1TAjvV5ETTLWUklJIjBSsd
 GjYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsy41BlS1c537yuVOheZCpDBwKkKirzmSI0ATg8JjJc68EGg41VOOMt0j1t55qzgMgkecz+QPYxKrfeP8C4BMi1wjb/mix26JSYkoSOvP3
X-Gm-Message-State: AOJu0YxGlXwBcNHhxGUHtgS3BIwpW9zNmoB5wJXidJkd966Tv2qC7oq4
 O5Y9b9IUKv0C9uVqbO9LqYMoZRFJx4+AdhowIuG7hb79pPU1XZzjNDwqjOTysOp75gPMzODkUz0
 bvMaM8ldpGvdPBpMfPYtgmjPUhx1m/gIvzlH4pg==
X-Google-Smtp-Source: AGHT+IGOx/zC8gPSOJQuDPkSkd1nf4N2mE7xnUIZOVlkbUscpDxNFS5fOG+JiLkWkR6HldqnK+FvO6CDi/U96xWLW4E=
X-Received: by 2002:a25:ab08:0:b0:dcc:ca51:c2e1 with SMTP id
 u8-20020a25ab08000000b00dccca51c2e1mr13283832ybi.2.1708470170970; Tue, 20 Feb
 2024 15:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:02:39 +0200
Message-ID: <CAA8EJpqSw5N5=Ki9Y7n5Dr2Ytxboa4u_d+a02Wicp=QpCNyiUA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
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
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set in devicetree via is-edp flag.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
