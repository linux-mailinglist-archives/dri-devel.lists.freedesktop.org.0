Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B22402BB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F589E7C;
	Mon, 10 Aug 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FCF6EA21
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:10:02 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d6so2635601ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0+XcafvkYqFAISI9FsWYXqr0NzOr+9r9ZHvTjYtkXc=;
 b=SSP5OEKD8fj8yOVmeHuyAsd7v5SDawwciuLl0spQMxOn1ma+BoYKRaRpEMNGoBSqCw
 wHu499nyL9wVoU/h6acqvIropQ032VOLjJRuhf/0UGaesQO6e5UPVCy8fIN9e7J1BQHT
 yrH8BaIB+7/l2ZAnparNyoAIh2P1OrkzU+y5DXex7BxCn3s6Oe6WbRxPQIJMyHZUOxc7
 ZPPCNI6uYEhToABA87QGOi9nWIFXJ6cTXz9p4htArMo5RwDdkuJ+xkbfuZbrhVS7BMRa
 q4Lqlv6/40JS7T0d3rmheoRNp0NkEQSID42YY31Mv5Bx5IeDSetS5HCVwikDMePvA4js
 w2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0+XcafvkYqFAISI9FsWYXqr0NzOr+9r9ZHvTjYtkXc=;
 b=YcI+eaTxyg87iya6zX2uC3K3GBvIiXUdZtbUcIIdr73BQdSDx7oDqS9xxZooXyPS1l
 k8Hc2vmeCkvnAGIq3NMS8RN3Rn1FgBmUflDIWtiBOM1wZppCD2V9SDKl9ApcG+Cc2qWq
 Y6NP6bLxlyW78jarco0zD0gZJW7cZSTjWvOyag05pQQHMVGP8HhDVxpPrYGtK9iedf9X
 EqJ8KgPY/WSdyg/pAkeg+84e9hnMet+SRxW/wDbiLemtB36kBEmc5vNtrfjT3G8TP1sk
 K0M5JPF8dr43epYZ41+np5q3z0Lhe1LSI/ISIzaciuAxzO7H0ezWTHSXgkzgwUiDxtvl
 njvg==
X-Gm-Message-State: AOAM532iHMH1tIwBncv2OuM7+emUJkG1D4xtWBkeQ4e9rCYyQvczk+xo
 MRML5RMxr8yGGYIRnryPDA2B6eXxg+/AV/nzi89bGg==
X-Google-Smtp-Source: ABdhPJzdcRdTkOs+1G2pCdfkm+OyrYACJDw4v+tP3FYbX5unsdmggkgMqGmRVjVfrIDE5rOzWCzhoWk91aR3GjYmu9g=
X-Received: by 2002:a17:906:e87:: with SMTP id
 p7mr9829318ejf.547.1596816600939; 
 Fri, 07 Aug 2020 09:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
In-Reply-To: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 7 Aug 2020 09:09:50 -0700
Message-ID: <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
 abhinavk@codeaurora.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 6deaa7d01654..ea3c4d094d09 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
> >       help
> >         Choose this option to enable HDCP state machine
> >
> > +config DRM_MSM_DP
> > +     bool "Enable DP support in MSM DRM driver"
>
>         bool "Enabled DisplayPort support in MSM DRM driver"
>
Why "Enabled" ? This would be quite unusual for a Kconfig entry.

Guenter

> > +     depends on DRM_MSM
> > +     help
> > +       Compile in support for DP driver in msm drm driver. DP external
>
>                                               MSM DRM
>
> Also:
> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
> What does it mean?
>
> > +       display support is enabled through this config option. It can
> > +       be primary or secondary display on device.
> > +
> >  config DRM_MSM_DSI
> >       bool "Enable DSI support in MSM DRM driver"
> >       depends on DRM_MSM
>
> thanks.
> --
> ~Randy
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
