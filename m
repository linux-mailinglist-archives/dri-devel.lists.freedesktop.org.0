Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF0476173
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031A10F8D9;
	Wed, 15 Dec 2021 19:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FFA10F8D9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:17:49 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id v22so22909034qtx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
 b=UlCtoyzOkFrWyGOVFaJU8qsLzBhhoHooghGXITRKZE1Zq83KKPIb7c0zSx3QLeLT8L
 Y+xCxzUh1a6yaaBd3ZKqWBQN6fihrnKTkT7bhYZKbKdPrk9urj6tVs+v4zpgImJsz7a7
 gk7RQntBh0cyirDkrQeVsT/0aGZGbZHEDVAJrAs6SkRLSOrSp40EOM0zB+Hd28B52FNz
 qblXXrz6FFNXCQI5Jl/44mtLAArvcM4LRQ3XDj1+rv9YDKjnBpWUNatahXv3R8u+Uumi
 CRZ4Gj7RSyDxX8D+ydnP9DyPYCdMOiBYxPGc6TEUbmAh78HgRXO31fa8FpRejHglm8fg
 3bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
 b=kgtnrNRlkSUQ2n+cHRlzGi17P3mv8i+zWkUiWtRQ6lrXQwhYjpaEmkZ8oD35V7Wjun
 Xdz9JkmU1yaM0aeesSpyQh/MTTfjeg9SE0ohKL1DbYVVZljCvCINyW/OMa75flCmiNxS
 pOLxOwe1GuuVe++FSb+0jPQzcbIyITgZSq++ddwLbzIq4bB8PM7NAdnpso23hNB/FBwq
 dl1LJ/cakCcGRe5kS1ybWlDzWPW3wF/xMkltMaD3jVQxhmQIbjeQeauZhZgX/kYhJVLS
 1A1jusncfz2KXuvJ0epae0kuNwvOifw66/d7T2i9Rq1Mcv5gcrLFI7b0ium7M/FePgst
 9q0w==
X-Gm-Message-State: AOAM530DwFIJNuCFOg4rcFFrQcAItbeYweUC4feaE0KMHhEn4sDLLk23
 GSohA93JpwRCQBzZD1LoJCmWopB3imwcjxbGNN6yJw==
X-Google-Smtp-Source: ABdhPJzQ6zkCPECZcOmZlwDiF42Ds+mkiAEnmTOqZu1jr5lAXLAvu/wLfGhsMecRyWc/+WsXDPDGT2QtSA8ScDqEFfo=
X-Received: by 2002:a05:622a:15c6:: with SMTP id
 d6mr13380932qty.439.1639595868469; 
 Wed, 15 Dec 2021 11:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-2-robdclark@gmail.com>
In-Reply-To: <20211215174524.1742389-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Dec 2021 22:17:37 +0300
Message-ID: <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot to match gpu
 snapshot
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add UTS_RELEASE and show timestamp the same way for consistency.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)

We should pull this out of disp/, it's no longer disp-specific.


-- 
With best wishes
Dmitry
