Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760435356F7
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 02:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26ABA10E520;
	Fri, 27 May 2022 00:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32510EF70
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 00:08:00 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l84so3962662oif.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 17:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OoIcULgqhKFgrbLMCehQr+O/jzYIvQo+4QSp3/O1yig=;
 b=eUljGF15wH4zUzJsDGB0MW6zAq6R2Ofwr487mrZl5OOoRIgUnQb2VZ2G7idbuj3vGn
 pKtGX6UHhPNbkOGpy3VdpTpqt6F1TMLmBBjNVH2ShFJIdsx7h+ZKMYB7nGcd7pb1j6+a
 8j4BMQavyurOSN7BZHQzXdOVR4CyV9pOubfUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OoIcULgqhKFgrbLMCehQr+O/jzYIvQo+4QSp3/O1yig=;
 b=rsXXsQXAY26TnrilFP9Ly3l53/o3wpPZJVHnbO0y2BKdYcL+CG+BVeY2+Q6fveFfCe
 NZaedbQxJh+a6rhqbSCPyLims94RTKH1NdNKrA+V2Y4ugHt7TPlZUFm/tPaaZwDAsZD6
 GgUVbdgZcLNZhzRpCEko7emxTMvUv+rrjsaiqMkaU9hmBpuRlbO4s88KVM8gm6K2rh6a
 M8PuDqyIi1hxkwn0vpVr3PjcCQVHiNZZB814lMCsoFiabJ85T68KvDDFcBUg5R4SPb4/
 4ql3WzZL7FsqKcCHVO43RO8GaCeXQf68U1LbHOaHrOQJs/jiaDvr8B9HjY5kfmRgGdqV
 06aw==
X-Gm-Message-State: AOAM530+A7jhG1calXpL/mz63qiVaDVA5jLXBUSWqVNZryStCmZzBsgl
 3WTuHNCotYDAQ4SibjmbU4MxXtpGezrb9f2cNpu+0Q==
X-Google-Smtp-Source: ABdhPJzv3vGdw/AH+nHltTzgClLhxDm2CpsTSnW478bFZKdrWLFbUDMYwQtiwv9E6GjUmUYUnPDZsCVZNLb0qhFpfaQ=
X-Received: by 2002:aca:ad50:0:b0:32b:a7e4:ecaf with SMTP id
 w77-20020acaad50000000b0032ba7e4ecafmr2453691oie.193.1653610079686; Thu, 26
 May 2022 17:07:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 May 2022 20:07:59 -0400
MIME-Version: 1.0
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 26 May 2022 20:07:59 -0400
Message-ID: <CAE-0n51-7WfZNF6cixXrSwMgNUEw3P6WA3D=OqWUCpUcmus2=A@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-25 14:02:18)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
