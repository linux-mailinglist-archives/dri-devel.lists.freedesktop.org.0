Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0D88CB54
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2E910F1A4;
	Tue, 26 Mar 2024 17:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yb9g86Fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FBD10F1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:51:00 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso5582386276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711475460; x=1712080260; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PQt9uE/ppvfkTcIqGMfIYXRibl7GWLCliTRuigVWPgI=;
 b=yb9g86FnGBEj9wIF8PKjhNWal6pbwgCpK5KCa5sZc1tzdCZzA6rBufs2M8xuhw6v7q
 qDWdi+wNWqAt/V6xeqLXTi7RPrJYglhoP3LaL7GJIgdCxkPInr1oyPwYWFbfgFnfZIbN
 tHPMSnW7ewYtUcYfXak/dr1tSu88wN0Xr04Q3UsNyiaJrASTqoEc2Mq+6m0Ftfv/Sot5
 ODTnckkFTTswxbtjyn43fxDmYYdkWqPsWHR/I7ztin7C8F4izshgIuuD8xSVJWphT6el
 OzEhlj/29INFxUoTtZtMj48iYuruJMoh+Preq5E3aLrz8n2MOECvNCnivZhuLp2HK5zO
 iWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711475460; x=1712080260;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQt9uE/ppvfkTcIqGMfIYXRibl7GWLCliTRuigVWPgI=;
 b=MFX7WLBYnxr0qGrNAzPg/d/7xUqiSskZXwz9fjw83iezlsGbPSwaYFYpJchjCSKIs9
 lNfm1kTTH1hqmQknOuZ71wgdp+QZkV9v0FxWVJH4C7Rbt1vaDIZHmkvomZXSRP0BhPtL
 1KATjBCSUwCq3GImYqBPNmLn5kcrRPRW7lQjkQWABNabkpvr4sUxAEuJmBq1l/9FNRZ5
 VDucC7YxcWOLsPajvsjCMkTsAkr9QIEuKIl97SbfKvBDguYsTzy5n1MBBMNouVPNMka1
 eckB4VUoI86KNl+A5H+oXtkcTF/kcNqv98M4MYx2Xec2NTfkMM5EoPKpU7Hsv6X52IPk
 1k2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMdK3IPoGuE7YkWpXWKtBz5FVAic38zC1eAiwsQoc5iyxFydPuPaOzIOaGLFHTcZoVMJDcH3t4h+aO+NBQGg1AnGz+dsaCLf03TdcWU8CG
X-Gm-Message-State: AOJu0YyAiZBWTUXuxVTv4GGJ3OnD+FtYmtIaJjYLN86/LVPxaQfAkfmd
 hUzlh6Moa1+pKNuUxmyZpXggi2Z2Ytk7Y/Zv4+cJ5srbIvbCHmDLPnl57DELdkyJKOgCa2pWH4W
 83mCt0i0fZsHq0B3XW0mGxgjstF1mAn8eXRsRUg==
X-Google-Smtp-Source: AGHT+IHgaKfWmnWc7zIsttUGrVkvAZrzsd0nsGPCX83cPi+b3E0jY3GMekdJomBN/FEgwvmEt+1EzeQQuU9eKhkIlew=
X-Received: by 2002:a5b:590:0:b0:dcc:7b05:4cbb with SMTP id
 l16-20020a5b0590000000b00dcc7b054cbbmr8591652ybp.31.1711475459884; Tue, 26
 Mar 2024 10:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-6-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-6-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:50:49 +0200
Message-ID: <CAA8EJpqce45f1Q+speRQo6NbtEtMq9BZWx36pbTAQGjjTyWCoA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/dp: Use function arguments for audio
 operations
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The dp_audio read and write operations uses members in struct dp_catalog
> for passing arguments and return values. This adds unnecessary
> complexity to the implementation, as it turns out after detangling the
> logic that no state is actually held in these variables.
>
> Clean this up by using function arguments and return values for passing
> the data.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   | 20 +++++--------------
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 39 +++++++++++++------------------------
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 18 +++++++++--------
>  3 files changed, 28 insertions(+), 49 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot for the cleanup!

--
With best wishes
Dmitry
