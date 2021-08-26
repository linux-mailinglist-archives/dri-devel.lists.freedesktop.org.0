Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CFE3F82C6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E126E523;
	Thu, 26 Aug 2021 06:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336206E523
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:54:55 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 m11-20020a056820034b00b0028bb60b551fso608928ooe.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
 b=IKoyYNbSttHPGi5+7FMcORxQLLUgr+nGS4hi/HbbDCxYtSfz6/Do8eIOqxPKT1CBLS
 57YpI2ic79FSuSudLRG1MGqTg9lN/wHHgdsb7G3o8qCDJNHn0aaoK0/clk6xpbJYou/v
 EX5Iw3aDq7mm5yF87RCn/NMkWrW0Hr+1g683k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
 b=amlEGUjLR6PXlpetVHQS0P6MHgpNygng9DGN6co1wLFDicAmBIcfDZ2WI4+sHTZ2uq
 QGW8O+rUaiF+B2nT/pLKm/JopwUelW7HLYiBVZ3rSLbQxsStgFfKf7BDh6ZURasPDgPa
 6mxnH9RiaaHDuvlXcmzcXUk5QRM2BjPAs05qQQY6rXULJYPD+edjTVZZa7kpt7lZC1Xw
 KRQ50OrJwEoDMZUb56fn5u1FBAxJW2lmAXKkkq84xx9X8kZ1xRQ0yORdievukkrPHOvl
 hJqi9nqRXZ85PqCNMq1gWJChY81PQi1h1J6yTjGeTmat3ND0iwNUc212NjgBA+8olYfW
 Fczg==
X-Gm-Message-State: AOAM533XHYDwq5HDEhQafxlSs/6Q/SIanb4WemIKj2K4XJJbr0NPCZ85
 C88F6dzSQGM3tdPMtLptMl4+iINlTg6HFFX1ZscsmQ==
X-Google-Smtp-Source: ABdhPJxXVSZ0AeDf4bM/tncwC3s9EqVDnIEfhIMOL7c4INLIqsTWlLNWu96+47aZUOf/3EzE4j0uBVgY5Q0OkeJXviA=
X-Received: by 2002:a4a:a841:: with SMTP id p1mr1813277oom.92.1629960894339;
 Wed, 25 Aug 2021 23:54:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 06:54:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-2-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-2-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 06:54:53 +0000
Message-ID: <CAE-0n53M-bk-525Jh5owT54fQu-E+cHM-6m-qLo3APYLDLuueA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/msm/dp: Remove global g_dp_display variable
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Bjorn Andersson (2021-08-25 16:42:29)
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
>
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
