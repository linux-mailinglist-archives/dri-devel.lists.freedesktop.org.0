Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5ED7BC72F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 13:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A7E10E03D;
	Sat,  7 Oct 2023 11:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425D310E03D
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 11:34:59 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59f7f46b326so34927817b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Oct 2023 04:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696678498; x=1697283298; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
 b=wWsHRETh33sAxw51WMj2HVIFqRzBZKD376ul1aPX4FiJ1HJeYngsyMdbeQrcQ7QMhv
 arjwgcgejGfm7dnr7xZbibd+PcCDp9/8iyhtruIWWuCSnPEsQyNMf0Vi0Vtbe52v5yhs
 23k1JjpichvIN8IYaEvTxdW/an/6/JRmyc7ygUdIiHG0o81HDV/ZRz6A7SwvGIPyeVvI
 IEbvSOxgNkexyMsRDRqgpicRPthuUJD8JlPTXcj8pM5EtB+NG8KBtZEsbYNIU7eCmzB4
 klZmwAnQ6hV0ivBMkl/aL7hwOow2v/QXyPCz5FNGSglzw7Lgo68sHssqlwyOVDXErq/t
 9EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696678498; x=1697283298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
 b=VKavWj90IdQ7AAeJCxWVYIb0GcLpldZYrLTBdazg2Efp9AU+SmJEqXAfZiJWCS4tiw
 XqwmFf1TcpKxWD/ZmbwHvlozWXffyGsO8oMQKYnsf9tJ8XB8ulXchy/jEW7vflELQR46
 kEGD8kK420z3FvD+Z00KrN3AWVneHKOv8lrYBNLxaZHJ1h/VHQy8zAAl/GwK2fQtEJaQ
 /43yrO+hBfzCKejSfN4N9G4cwr1PdGin3SWx9tz3lNa1jLWmqrJcfBnIVQShGN0IHwFO
 ch7HZRxSJ6ypQR0fmlbvimVszuMnv9hy9+yetoemokGifwtxhp/YWjoBt9Ta9zo6NlTK
 GZQg==
X-Gm-Message-State: AOJu0YzX++BWm4q2N9muHMAfhYVKYaUEZkuTIw4dp9wvHyDkyh3F1ju4
 Bpco7fglyRDIrTtG+u6ddA9Xijnkl/iZ0y8MABi8tQ==
X-Google-Smtp-Source: AGHT+IHKG97Lbeo+UsrdR1nmTFCgOqLGW2T7I5kZ+QxpgcEZM+JxKgbJ1VtzfFGONuwMVUMAzhcrWeC5dW14K+7atQ8=
X-Received: by 2002:a81:7b8a:0:b0:59b:c805:de60 with SMTP id
 w132-20020a817b8a000000b0059bc805de60mr10110241ywc.45.1696678498310; Sat, 07
 Oct 2023 04:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 7 Oct 2023 14:34:47 +0300
Message-ID: <CAA8EJpocnfaoJ9syC8YahfwgRad7sCEhJx_njEVpkY66HSMvOA@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Original both parser->parse() and dp_power_client_init() are done at
> dp_display_bind() since eDP population is done at binding time.
> In the preparation of having eDP population done at probe() time,
> move both function from dp_display_bind() to dp_display_probe().
>
> Changes in v6:
> -- move dp_power_client_deinit() to remove()
>
> Changes in v5:
> -- explain why parser->parse() and dp_power_client_init() are moved to
>    probe time
> -- tear down sub modules if failed
>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP
>    driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
