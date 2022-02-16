Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46C4B7D1B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E459C10E60A;
	Wed, 16 Feb 2022 02:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A4F10E60A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:18:25 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso924164ooi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
 b=ieAe3Bw7+svdP7k1Mjdz401VBfKR3/7YLZCGmTm8EmDpk7J4l9MOw3KEHCRW73SRch
 a3RNuwSe6ZVBG3FlSJ+1mYWZyJoCfEXlQxCXtPxOxkztXiquD2aYfJ/zgeRUzz6JEYDQ
 EjPLPISATbExLjLKZ63Bz4qlX5KZAWyCW9pnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
 b=Mknx+4DrHulCrPQ8ExtUNV+XhEQ/K81gL6BfEmGrxbieczEqwBKXhz3Z3DlwM89jTJ
 f8LM+wUSRkNeltwJiQkcPkoOx+3UnoCQhvdQl7UijleUiPdWMtD5JNDwSR5p10GiOnJD
 hwLL3OWy3V4DM1pkPStqr5MabKcfWsGbM2B0kb/NVPFRNEJ7A0AjoiG04o6frP6BOjDG
 x304WhFCz3KyAxeCFYnR4HGR4ASHLnN1nszETb6/8Qedl1KwGJX8smcQ3YoN/mEN2GJr
 MpZoO6sA3zvDeKOo96wPc72xdc47+iREj5PeO9mpMB9bOJRRN7ttJ4hXhyEokVXz02wf
 eLaA==
X-Gm-Message-State: AOAM532aE9tuPlIM7pagrlbD++cJ+Hm4M71m/e6ifkKpEozGbyCJI0U9
 K5RmXzaMLq4K/Jd/elR5H5q02lDAlsnt6z/Uwp6Efsh9SDw=
X-Google-Smtp-Source: ABdhPJw5Yk430/3/87e3yVE4qWHJlRhItY1gx4i906WPQT9Xp//a9PTHnqUQU02bFgspQY9SZ4ux9MZ5XkOnesX7ZOQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr285417oao.8.1644977904573; Tue, 15 Feb
 2022 18:18:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:18:24 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:18:24 -0800
Message-ID: <CAE-0n50-asrL6FcpsteqfBWAVMXVShFWW+yMSMvzzJOr7d0KCw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/dpu: remove always-true argument of
 dpu_core_irq_read()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-01 07:10:52)
> The argument clear of the function dpu_core_irq_read() is always true.
> Remove it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
