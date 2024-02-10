Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023958503C1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EBB11247A;
	Sat, 10 Feb 2024 09:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UNGoSI6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EBC11247A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:53:15 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1297234276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558795; x=1708163595; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=paMHnlZbd0L+LSbZCuSA2TzUf7f5lSfJb2Dcn2AqQWc=;
 b=UNGoSI6bajP/gTnpBq4PgVNwrL882XYKT/Tb+3HiHs1+t7phVvAFAuQrlfxMVK8mTW
 cQu8pQ868u5/PLIKGmmM1QlFAgaoccMADQaIxbBssHrIHnZ0kpVEtfY2ujtrYOsGoiTy
 4xw2sJV2nwgC2uWJ+BOv6HaiovvPyFBf6JLQ59MY0pmV2Sjgz/kq+nEXpUVo1AVtBRw2
 i96dn+WXoBY6LVGGsAeB6AVIZEW+80/3q/65l6Ui8V5ZRdZJMaIQVC86ZHDUABXJFbxN
 aLTZCU023/4kxuiai3MqbjnvPDzKkJLQ83POVRSfEyurAi6wSsALv4J9RUo1mM1p81NN
 I6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558795; x=1708163595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=paMHnlZbd0L+LSbZCuSA2TzUf7f5lSfJb2Dcn2AqQWc=;
 b=R1Y9PrFLGHNisxzG5wouqsZIpLA3JD6f2mjGAWE0SXBjwWsHuqha9ZEMZG3mfZFPOH
 /bfOsg7ufSITypvJ4N5guSa6bvCpegeYbEhu1Duq0zEXQ+d9dgEpJI5gIpoY/6oV823A
 tdhCTTz/BSMMfQ6pcJIWWVPx0Vz0TkHWBQRzTPwFE5W+vwUGImVOxY8Nhyepb3Pm1zO8
 IXAvSrJbsOTrulf+ct6zy3DtRLVp/Wb6VxM7sefpqav1NxP7dmOIMzzt9qqSeQ2h7lqV
 sexSYi4OCWcEb+YiXwJloXzfIct2LQKq2kCv60LmHFb2t3woKVuumJP7VV/qWLwhUxjA
 v9Vg==
X-Gm-Message-State: AOJu0Yz19zK/DnG7JCyjRYLrTmmKMmfSS9o1WHaRnkqzcbD31KFOad5J
 DRou0quG4k5Bp43JW17j1EhXJQZbMvvZVGNhXxvcpgg/riF6BpWmrFyD5yNg6MfoS6qYk/c5S83
 VJmxsS6NZzbjf/+KGpkqm/qHE+K8S3vWMYT7oqg==
X-Google-Smtp-Source: AGHT+IEt0icZ3HR90tgs9nZHGdrHeqyx5vG0a8WaZsSVBg9mGCCy3byO6qznkQZSNknMA4a0NfGh5osh8gRgsT4Yais=
X-Received: by 2002:a25:b117:0:b0:dc7:4439:d14d with SMTP id
 g23-20020a25b117000000b00dc74439d14dmr1348647ybj.54.1707558794810; Sat, 10
 Feb 2024 01:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-12-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-12-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:53:04 +0200
Message-ID: <CAA8EJprUf_TVUo+aWPm-dL10wxLu+UF6c7h8DhZwKZRXGvfqEA@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] drm/msm/dp: change clock related programming for
 YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Change all relevant DP controller related programming for YUV420 cases.
> Namely, change the pixel clock math to consider YUV420 and modify the
> MVID programming to consider YUV420.
>
> Changes in v2:
>         - Move configuration control progamming to a different commit
>         - Slight code simplification
>         - Add VSC SDP check when doing mode_pclk_khz division in
>           dp_bridge_mode_valid
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 5 ++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 9 ++++++---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  4 files changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
