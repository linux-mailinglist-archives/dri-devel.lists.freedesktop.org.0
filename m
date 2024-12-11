Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C499ED856
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1591510EC17;
	Wed, 11 Dec 2024 21:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="L4Rt4Xs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09C610EC19
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:20:23 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so69922077b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733952023; x=1734556823;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
 b=L4Rt4Xs4TMuaG65RwVya/usnaaqdglSpdrO/xgc2VkrbE72RBDIsbt6kk/6KmsxQKN
 BTHRSvKAA5ieKk5xtlnklVWePVw8WiPISSmq6veuDm3LtW1eU0AMHs0S90UgE4OEO5w+
 c7+54x+ujARL8l0LG7j4nU5SYjtN4wc1W7N4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733952023; x=1734556823;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKfxs3pDMj3GC7YQPCyoK1BtKC5bUlyrggnykcN/Mw8=;
 b=XXTt6Rbh/USHEunGCNeJDQ6PrckqZRKgddpy5MjbGRGhuvsKIOsewCcs4LGlp10epO
 hb3qcoYBmZi81rjfWSH9hWCxQjjGJ/Ubxl1gUEhki0SFku3x57G/UCjvQgnbk4McQjsn
 txbvI4kmeheZ9YXbw7RS7Vrzf8emt8F3VyUNtWzMSwWj6KHl3YlZ6m9kBcxfMu8MhloR
 7yMedZJyMFL63Idd9MT2kIx4XojWwH9WzrlK7FFLgtK3EleqPAxrrakx/VRfQFZ8BZRZ
 0Iaeyj/SqTlV9kug8v87ab2BuP0G0+0TwsSoXwfb3PoF1VypciGFQpOyhRhU6xni11lP
 2xxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9hur4AUVI9zi1bRLI8owmNfofkm7MQPmAaFkdRVd7EFD1NJta1BVsaQjwfM6Nfuy7cTqvmhJOU1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4wKvME6ATbJMmtZ1YbWm+AkcipibZ7FHP6vp5XVr/gHqCxaZB
 fJvEiunb1IQXShYMRj+SVugTZCBo0EeLU0dYdZg9WbvIj5YZGEuaUTzKF6Et5B/YeHZKPcnVfCG
 cfCSAFvY5CXp21bsMeQUgJ8sNmvsewkK48WRP
X-Gm-Gg: ASbGncsmDGAx8+fACH3/ckNeKPtvTI+nkG+UrGocyAU/zCzR+3F6QaVmppt7PcQkqfK
 3tZW29lshew39WXh8xqWYIlGIfqfWxsFH5EVGlhdcjD4HshSsWa1kpQSenCOqflo=
X-Google-Smtp-Source: AGHT+IGiqcJUcizFAGyQuCjc5BPiqK/fm5496Pa//h9SFBYiB9+QTvjnCAELvBpBSrKYiF5MVCjIFkIU1R/GLCyr/Zg=
X-Received: by 2002:a05:690c:6e03:b0:6ef:8122:282f with SMTP id
 00721157ae682-6f1a508837dmr10285587b3.24.1733952023136; Wed, 11 Dec 2024
 13:20:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:20:22 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:20:22 -0800
Message-ID: <CAE-0n52dsQko18bY2uu_k4AFNdeirQ0FaE-k0Jy9=Re_fGV+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:32)
> The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
> for the header output, while it expects a two-element array. It performs
> a sizeof check which is always true on 64-bit platforms (since
> sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
> an error code which nobody actually checks.
>
> Fix the function interface to accept u32[2] and return void, skipping
> all the checks.
>
> Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
