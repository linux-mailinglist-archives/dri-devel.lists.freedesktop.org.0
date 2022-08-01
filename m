Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD858730E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 23:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC33411328C;
	Mon,  1 Aug 2022 21:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A07B10F01E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 21:23:02 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 k29-20020a9d701d000000b0061c99652493so8643987otj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 14:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9mmgjmEfi+Pg8SxIlnb6z90AkOOq77tXAXYNH2j8r6c=;
 b=VPwlC71IfmGW7jPQEyXLB72afN/1A/fwLOhvIvdGAMmffhnD0IATcH9CjCi+39TpO2
 Ukvgw5hg33gf8eijtv+C+MgESZ4VgU+2fWQvbhoV9BUeg36vW3O9iuJ3U0UHTPKAWS/K
 OKj2Sg6PR520xucLZYh5MRVZyBTlCosijLq1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9mmgjmEfi+Pg8SxIlnb6z90AkOOq77tXAXYNH2j8r6c=;
 b=093Tz7vBdKBT8oNRnYJQaN2e/FGgdQ7koYQyWZWptPfB1Xk+r5SqSVtmsdYRQvXkKU
 LsvZyBQEQV2d/3diNkYMMPY/lkeTLN82Zz9nDdyDJL0q6T3FCLhXz0IoVVKkflMNmDNc
 TCe5sO79ptiFJWBw9V4j0y8ZA1FBBj0u0/hI2xG6//Nui/G8WrN276xkGg0A6fri1juv
 4bpEzRZHvVXuWeUG9MQgnsmFVC6btHUZ416jn0JJvClCrhIsRP7WWA/G9fxMGsODUhCv
 geiX5cr6v0nA77h+lBhPsNT2xso/KRGVQfFGL34Fwvvs9+XevUN3H2T+kUqNdDi4psNr
 nN5A==
X-Gm-Message-State: AJIora8F6dzPBXY+mZkGG0PwVRpBkXS3v2huWZFeM8uBU3iEh8alzzbT
 bBKv4ioBceP9m2Tu+Z1U68s9uAViQY+8V7S8QJ1Tcw==
X-Google-Smtp-Source: AGRyM1sUB8eswJRQLrjOnWt5dJ6AtP8vAygSNit8h9wqXLud09ajwRml5TZPxv8NkDyBb3vu1U97mtm3o3BLiJrw72c=
X-Received: by 2002:a05:6830:2645:b0:61c:b7cd:bde3 with SMTP id
 f5-20020a056830264500b0061cb7cdbde3mr6503564otu.73.1659388981595; Mon, 01 Aug
 2022 14:23:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Aug 2022 16:23:01 -0500
MIME-Version: 1.0
In-Reply-To: <1659384830-9909-1-git-send-email-quic_khsieh@quicinc.com>
References: <1659384830-9909-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 1 Aug 2022 16:23:01 -0500
Message-ID: <CAE-0n51ZaL9skMN=PGog5=i4e1FX2tA2BDFYSTGfCDxMcXF55A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix
 tps4
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-01 13:13:50)
> Data Symbols scrambled is required for tps4 at link training 2.
> Therefore SCRAMBLING_DISABLE bit should not be set for tps4 to
> work.
> RECOVERED_CLOCK_OUT_EN is for enable simple EYE test for jitter
> measurement with minimal equipment for embedded applications purpose
> and is not required to be set during normal operation.
> Current implementation always have RECOVERED_CLOCK_OUT_EN bit set
> which cause SCRAMBLING_DISABLE bit wrongly set at tps4 which prevent
> tps4 from working.
> This patch delete setting RECOVERED_CLOCK_OUT_EN to fix SCRAMBLING_DISABLE
> be wrongly set at tps4.
>
> Changes in v2:
> -- fix Fixes tag
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
