Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DDC4F5A62
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C8910F0F6;
	Wed,  6 Apr 2022 10:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4F10F0F3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:01:21 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id t7so3364779qta.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nF1xNfj+J34XrxSolTF0D+orBqwvLN2KXHwwalZ4HTY=;
 b=wMZd4R/cJhJ0o5uoKdvVDyQbmt+R0cgDYTu4JUHaYhNncFM5q3J2vIFNDb6TYhq3LE
 1W4tlDgycH1xe5kmdKZiAKsDXZDO2eoIWr9IG4QUl2HXztiNpg2QEpXjEdvM+HqLQ0F7
 kEBsIzbv7rm5tWx89SgopcE6Y21ULM2Ra2BUCx0WoLeB3sHu7yglx2NCzrpL4W+1Ax6w
 xnLlNpMzURktWbZ+6A4hxd3K4LdO1umpftfSXwqwzTpZcGB1iWe3eRnfZKwRHtrDrzfC
 6ukVilvbwKDLkLBScgPEwiSVUIjS1oME067AS55bD9Lc2ooX2knRqNavt5FdWtw0kOwD
 bFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nF1xNfj+J34XrxSolTF0D+orBqwvLN2KXHwwalZ4HTY=;
 b=i8HE+7cM9h4qRHYROKLw6ikyU9LQbvai9E4AmRg0Q/x9l4qRcgS/ry62AGy8YODL4R
 GsmYOI5nevIbZstHMGpjYLU3XEy19EOYgzbj/h9rouyYDHQrZJuQBbfzga9HtU5Ypt5F
 wyNSWqTGMGlszG4KKgmUa3ScrRlyZLjg+0MkQYUQqs1Fj2llzQ7nh3smynxDEWafjreA
 Hbrujflo/4Ooc43/XVR3EFCBNABfUjkUZkLe/4qgDnDMOQxS+3KKibPu0vxKBH8LkJEM
 DVn/7wXQCXq1cP+Ug/rubLnogCwrmjlzcCJeYMCQ4LX/0ANzNjQjpgbnBMLdaHYejw8s
 lTaQ==
X-Gm-Message-State: AOAM532HLwJfworPY1T5gwLZBJ6VcVqZDoNTWwxW7pp81lU156UlD/2s
 yr0AQbWbDUMm4PheVyDlJuEIpdp8efh0/RslMkIfwg==
X-Google-Smtp-Source: ABdhPJwifkB/hY55P59uzoya9A0itxh640pczG4PfHi0w+ZaI8JqLhcORl90QHWitXyvPRj+jQS9OQSCdNRAmmRwB0A=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr6605974qtw.62.1649239280348; Wed, 06
 Apr 2022 03:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
 <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
In-Reply-To: <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Apr 2022 13:01:09 +0300
Message-ID: <CAA8EJppOtqSD0+3C60Qz77oCGgq0=bqC6dLK8sN_S8uRvCQ0wQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: don't store created planes,
 connectors and encoders
To: Stephen Boyd <swboyd@chromium.org>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Apr 2022 at 07:03, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-05 16:50:59)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index d661debb50f1..ee3093890d97 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -184,23 +184,14 @@ struct msm_drm_private {
> >
> >         struct workqueue_struct *wq;
> >
> > -       unsigned int num_planes;
> > -       struct drm_plane *planes[MAX_PLANES];
>
> Can we get rid of MAX_PLANES?

Sure, I'll drop all these defines in v2.

>
> > -
> >         unsigned int num_crtcs;
> >         struct drm_crtc *crtcs[MAX_CRTCS];
> >
> >         struct msm_drm_thread event_thread[MAX_CRTCS];
> >
> > -       unsigned int num_encoders;
> > -       struct drm_encoder *encoders[MAX_ENCODERS];
>
> And MAX_ENCODERS?
>
> > -
> >         unsigned int num_bridges;
> >         struct drm_bridge *bridges[MAX_BRIDGES];
> >
> > -       unsigned int num_connectors;
> > -       struct drm_connector *connectors[MAX_CONNECTORS];
>
> And MAX_CONNECTORS?



-- 
With best wishes
Dmitry
