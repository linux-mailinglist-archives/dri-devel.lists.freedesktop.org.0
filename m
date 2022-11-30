Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B663D1BD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8A010E216;
	Wed, 30 Nov 2022 09:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649510E43E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:23:49 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id n196so786851yba.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
 b=khEWx9lfrWvp89T043eZD6ERveqt4wO+YC+qtJJEgowPCNksgMASbx2w5juuA1QJfW
 xzfa6R57wEYrj63BCKjGDeo78fdo4pudjo0qr3KIf+0l4jM/460zHOSPxNvBJjv+BfJJ
 KCCDtzW8YiPu/q894Brfyi4YJ39Y4UXvgCEsruXea6YhZ3DWgWl6oKzt1NAbE3REd/6m
 BKiLEFhPp8hCuAmV9c/X28X0Tn/8uJl6DcC6lqEDuxBbM0H4+cmXSmJuJ4LHQpGG4Iyb
 ighRJJyOwJcUgbeiUSMt1NAOYKlEZzvSH9G771paKQwK4iOv+NXB9JLL4qxsSBcnUVKk
 ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
 b=5r/qGH/qzoIxnOWXbkgVZNz47IzWyjrd7QBfvsVWb5v/wNGVRVI7y5IcY384DimoBe
 MqTX8xGN4kNfyByr1h1/2kYkjl8znEAyR6Z2r4U64vuejyuMz59y7kriK+CbIk0Us3x6
 Vou6ba4BSK/d3O175IUyNY9E0wU0R8Gh2bRS7QA54wuFdlAQbRTO08htY+5KSw8KCA3C
 /mSCxCD3agZjWTwS3GU7UWyP3AIwgQJgPJwLysDi72k9AqUaMLnKkiPKzxbrsndiioVV
 S9dEriupuPGql/rf3CFTIaN5NdqfBvDELOoMuSLLxjXBENy8gneOODTVWCT37ixMRMio
 4DNw==
X-Gm-Message-State: ANoB5pkd+Ju4UsySNqekjy81IgXPb6YG+hxaxZ/xJbim8wy5p2I1GLZ2
 ek73uB9p+qurNn/LgMlP+TtknPuoz6Q/yilgbA2xwA==
X-Google-Smtp-Source: AA0mqf4uTlRldLTHNX9Oy3lllFzfrO81W9GITTh4EKjh0UYYdSLL/UJzmCpC2WM9mGacYzXPaMI7WE8830cjJzkNgmU=
X-Received: by 2002:a25:cf4b:0:b0:6f4:6cd2:501b with SMTP id
 f72-20020a25cf4b000000b006f46cd2501bmr21007224ybg.194.1669800228605; Wed, 30
 Nov 2022 01:23:48 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 11:23:37 +0200
Message-ID: <CAA8EJppAPCLj0JZf7v8ThFq1C=Ngx3AdzReatRwGC-_jhrANFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/msm/dp: add support of max dp link rate
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> By default, HBR2 (5.4G) is the max link link be supported. This patch add
> the capability to support max link rate at HBR3 (8.1G).
>
> Changes in v2:
> -- add max link rate from dtsi
>
> Changes in v3:
> -- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
>
> Changes in v4:
> -- delete unnecessary pr_err
>
> Changes in v5:
> -- split parser function into different patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 7 ++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
