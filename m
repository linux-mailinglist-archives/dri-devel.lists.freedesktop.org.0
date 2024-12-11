Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918639ED861
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C2210E627;
	Wed, 11 Dec 2024 21:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KglMSAMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7318D10E627
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:21:08 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6f14626c5d3so16968657b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733952067; x=1734556867;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
 b=KglMSAMh5I4Yz+BY5qB5zZjshoNtovcyv6hUburz/x96AAgeLMN681lXk/xOssf2Rj
 WRvzVaMbF8JL/fCtShNdYC1GxOSb0XKnXiXh09DeEDuFUd/Sslqt3M/aaB/bWgwbEEkw
 luJWjqkEriG8f9pTyNnzQsD7lt1SI+VG/rniw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733952067; x=1734556867;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
 b=LQ4KpQ9Atsaav8epN/DYgbMFvJql2eqZQ0ruawUCNzPGOKJu39uWvIEeWfJbWPMQYh
 +iUSSRMQCVQ37aBTAwW3O4YLh/i2Z4zVmzcA7vNY3tYlzN+TD413hTIVvwg2v3xbK+n2
 npz7LGZcR3RIxYn0SjHZVjfL8yWo7CnjhvHtO1aq+IF3jeeXcXh7q8+j0aR4w3vwh+Mu
 H90AaZoJXBceh5n5ret8kM8i5TGktLm0kNIdL9vvAGIXaJPzB9STNjlDIoB3V5B15MGR
 5Nq65TY4i2Iw4hECrAsMTTKVH4tPDqoS6jlL6sy3mHzoXNeh5bI8qTuwffmOaFKETg/H
 IYzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURH6VVcV6j2vLt/GRijAmuE8Qt/sUon5z2aK7ezT+2m0Da7/tGx9xz0aDG1FdmXtVo9ixDQHKxiAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM1N8VdV27Fnxc/+A+TNEgBsxt1HmSC8cAznEG7VmKTlebgFSH
 vCH5qKEcvlTa+SUIq7o8Nllob0J0QVQ+rozgFrPVjUGKYvEcYQnhMu4JPYCa+l6w/FCQ1QYrk4D
 Enkb4UxlEdji34NZfietAzkGlF+jDhPOHyvub
X-Gm-Gg: ASbGnct66Tai5+FYs9NPRs0srBBsKO9rE4oNIhyi1tDtVVs3IdsuotWi7KjdE7Yjgwu
 v0HcnyvPmsMzoQtbVLFIrIoUJyWw2igxoMSFkMItfIANyxKnYMmy2dhq0MJ/AE48=
X-Google-Smtp-Source: AGHT+IEq7Zw2BDt+iOPDyUWk0YHRW/a0ILaMn5oRc2ufsHMgU7TT14V8Ms7zyoIfRG/qrZpS8pIGFl7jVktKfKw+4P4=
X-Received: by 2002:a05:690c:4c13:b0:6ee:4ce9:b33e with SMTP id
 00721157ae682-6f19e4f0f18mr13027267b3.12.1733952067697; Wed, 11 Dec 2024
 13:21:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:21:07 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:21:07 -0800
Message-ID: <CAE-0n50U56XYpayM64BBOPE5U8xQaYg9TOWWmCvtyzB4kChgYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:33)
> The msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs() are not
> called anywhere. If there is a necessity to dump registers, the
> snapshotting should be used instead. Drop these two functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
