Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C39EDA72
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8280210E631;
	Wed, 11 Dec 2024 22:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZZ2nZaL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF1F10E631
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:54:46 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6d8918ec243so73224416d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957686; x=1734562486;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
 b=ZZ2nZaL0uaQlsx8L4cWPeb9aduSAnk7LwsFj7AboKW6otDJ+AZVxs3m4+qBolYjcAW
 yb4e6HHPb08zjNHt3O7F0y+DAbx3n5kU1YerBnB3KV+VAlRuCY+uiN9C00EKGGZEIqo+
 e0Cddy7LUa7wMJMq+ESMYadlrLKIG1QqGWTa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957686; x=1734562486;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
 b=inx5GIlgA6ALI+n05ViarsY2+m9BE+wWkG1QTD+9Gkxv8Nyh9ad6Z6qhY5/Ncb32WS
 21FDVEM2WlU8khLbNrPbsmrQs77+GmG8ChxRoALRSVRKwsWB3ar3pPW28cZwo9mDXR/k
 LLw/ED+lO+qx4iKf8aGy3FfHvexSKI1DNcuwcOdTdbZMa9eCA8zWDLUkE7R+89P2vcae
 KPtEQ2W3AiCcyUytkwJWCr6NZHioNy5tynbAMsGnIij/ivq2Vnsai+GMyzRtGBHQ4SoI
 NazCq+/9m3EAUadt1yGfKawKa1LtmJm3msrN7rv5SzLccO196n5wjuRAB+rpuHkzk4W8
 1QdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmCYBME3txvM4SaHATJ0KAT3jsmFXKHc8oRrHVn8IELA7aKTFHUHGbITpC1pvpTGoE0xLwoIkoADo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcvhk/3gkBtvJBoDiOD5dwKKXrNYjD1bfQwCBNn+/PADZiDv5c
 3HPiCYXoXWGdXVRNh4PahcUFEMMJxtkCpJoMQIRmAkQIoFoeUWdyFFU9nYge/lXhIm29KMQMCLS
 8rR9KfsmTHUMPyz31XVlwqHRzFj+9lnoPrqVU
X-Gm-Gg: ASbGnctADDbXlnRmuD3Ik9kGEJ9Kyeo7Bq1t7WyzMG6gKriZ0s+SladrvGb2/e4vDIv
 HhxjsQpCfLudrJQfr0U9toKCS+WOJhtoc0zzw3KCTt77Auc8Nsd4KDoyvXGKfVbE=
X-Google-Smtp-Source: AGHT+IEGC9lOWNlVRcNf6fxO1C9k5anq2FzZawxvc9QRt3uAELPSdgB+RMMmxVMt78OAlW3P2cd1g7RFAijwaS3fIQA=
X-Received: by 2002:a05:6214:27c2:b0:6d8:850a:4d6a with SMTP id
 6a1803df08f44-6dae38e5086mr22115606d6.1.1733957685843; Wed, 11 Dec 2024
 14:54:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:54:45 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:54:45 -0800
Message-ID: <CAE-0n509sQEBscLmRCBMBzgYpWX4=62+hKtHcdE-W83LjdcqPA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dp: move more AUX functions to dp_aux.c
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:42)
> Move several misnamed functions accessing AUX bus to dp_aux.c, further
> cleaning up dp_catalog submodule.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
