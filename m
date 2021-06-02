Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191C399684
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 01:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB056EE9D;
	Wed,  2 Jun 2021 23:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFBA6EE9C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 23:52:13 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x196so4064412oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
 b=KaO68w8HrAKn93zPkQaVfAuWyiF8UF7ryWsJU0WXjR5fysUaBY1gUWQGsPthtslf/R
 dBA+coYoduNqCmqyku+m4pfBR+jcwA05SKTnWK++Mwku/2mgyql4oybFlb2UfuVvpqyX
 ii82e17MwzT5sLFPPCsXI9PgffSsDPzKHe8ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
 b=b/evNJ/pqHOGO/PXUb1xNDxEtzyTD2w0a9pR9KB/xvxy6fzbGFJqhU8u3OMpxpBvp8
 LM62a9xWFQioe+zR2WE2+MXayewNaJVmEBbUMWMWPZNh+UbnSduycnwW8u4AJEaIXwFC
 Vz0Pe8iRExU6MaDRJ5mRMLX5jgKzNY3PFMqs+Mqxs8hCKmK/fpqoL7KjlKuz80q8jO4P
 4efrZGLfOyvOIMmqC/vHSPMrwge9FveC1ZFcHIXlDe5POQNRNtDdZ7zwjpqZnv/uHE1L
 +hDCbt3ySB7GrC8S1uTb/HH2A86mIjZzbUW9Fgtk/gsmZz89tzGj1PboKCO/9qJhTksW
 MuKw==
X-Gm-Message-State: AOAM533NTtZaOibRq+E0LNuLbaUv7r7XXwzhm46CcnEY155eVyYLw9A0
 gfhA+F2ahHvoRXbiI54gNlywFyuVXas4uRdWY0NsuQ==
X-Google-Smtp-Source: ABdhPJyEpvV7pUBImKOSlEHTC9uSRojsd37dHEdkjH80CvIPIOyDLk/7FhcUDuDurpeY/zPKdQJPkGeigbtQkdmu7Uw=
X-Received: by 2002:aca:654d:: with SMTP id j13mr5573390oiw.125.1622677932502; 
 Wed, 02 Jun 2021 16:52:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 16:52:12 -0700
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-14-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-14-lee.jones@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 16:52:12 -0700
Message-ID: <CAE-0n53PvVjUzXsZ6etSAOEOjCD3MV5gXd6YmtfrjPaO0kEdkQ@mail.gmail.com>
Subject: Re: [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly document param
 'dp_catalog'
To: lee.jones@linaro.org
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lee Jones (2021-06-02 07:32:47)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
