Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E4487150
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEDB10FBEB;
	Fri,  7 Jan 2022 03:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BBA10FBDD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 03:42:49 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so5275097oti.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 19:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
 b=A4vFqWQX/ciKAiD3rBShIXkWQ6We8v4r2Eq9/XAa+FPBuF3IeORe3y2KvbSOTCPnjw
 iAGFljIBOl02LecccSX5kLGEEvuzOT6EpaOm1G18YR1Vmq5Ln/HKIE4UjgNB3yshm7V0
 KZ9ATLayI5c35/38nQyFWM/g3/XMRBmWUHfPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
 b=Ffyt7751SSCZZZsIu/GxaD9x6CtRN3LKm7ynxZswnTgEKbX2y+ZN5zXrMXs6xuur/5
 94nhns2CYwJmGwykLvaPlEvxyr7Dxzkkg3uDZGfPlRInx1kcG8Z/7n0VjRqi0pSIpxkU
 iDna+XJnBFbzH3MiiclpoVUNdutDMWDCRd4mnH9rKMyWo6qvq/sF+ArVZlglBZ95SRZy
 ATifNy1apzAZ9YXIu3QInWAbII7AIc+tbaXghmKE/W7Rzh2GQYvCkjVQwZRG7XYTUjuv
 I5Qa2sg5FtZhhyglJ652XKtkI+01ah4wSr8TvDY11CMA8HnBwq6WD6Ejh6HBdZBvQBLn
 Os9A==
X-Gm-Message-State: AOAM5323KAMgjkoDI6H1kA/Sg0mOdejJSBp6+ADXavGsxD3fSdx4OILO
 20Z3IiMfg6cnnt6lN0HvVwU583AXXO3+BVbFrH3ULA==
X-Google-Smtp-Source: ABdhPJzf0n9XHktPj8J7s6+dZI2ZyKcsrJQi3oL20SOcD4s8ZaFysAcZ4/L+0HgoBgdkZi/UIdAlzTNykWoLYPJTt/k=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr4225674ote.77.1641526968813;
 Thu, 06 Jan 2022 19:42:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:42:48 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 19:42:48 -0800
Message-ID: <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP
 encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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

Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
> Currently DP driver will allocate panel bridge for eDP panels.
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>  5 files changed, 13 insertions(+), 23 deletions(-)

I like this one, it certainly makes it easier to understand.

> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23f742b..5de21f3d0812 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>         if (rc)
>                 return rc;
>
> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {

It feels like this is on purpose, but I don't see any comment so I have
no idea. I think qcom folks are concerned about changing how not eDP
works. I'll have to test it out locally.

> -               rc = dp_parser_find_panel(parser);
> -               if (rc)
> -                       return rc;
> -       }
> +       rc = dp_parser_find_next_bridge(parser);
> +       if (rc)
> +               return rc;
>
>         /* Map the corresponding regulator information according to
>          * version. Currently, since we only have one supported platform,
