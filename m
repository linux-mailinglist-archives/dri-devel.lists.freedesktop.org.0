Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3624F5303
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 06:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4743510F105;
	Wed,  6 Apr 2022 04:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8BD10F105
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 04:03:09 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id e189so1215938oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 21:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OWGK0XSf75E2cBZKiH+umLuz5CYhWcZRVj1UAjEllAY=;
 b=B3Xk0zf30mn3aJ6PALMS1FYblpAC7sg/WWGpfndFeo4pqSCs2E3RWu4wnQ85Ns8Mu7
 tNV9xYLSWizZpyECol/+pTvwoQGHG/8U0IGsK7lxkp1fbLlEZmA4QJtG4PLXdhsH/0ND
 lQzmYdtcR1t/GIkVSGJuOIQ0Qz/M3m2bH4lVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OWGK0XSf75E2cBZKiH+umLuz5CYhWcZRVj1UAjEllAY=;
 b=B1sbdLRUhjwLKudNqvXey2iXPerQAW2VAe5Vwo0KIz7DwKT21aVanxhDZms4Z56ha0
 WiFJ1vWWRKINbrsy7RE9YRs5YHNxVNkwalEnuzgVHot+sIc4wznSuk49nU83txnX5cVh
 urVdunDHmFSxnoaMsGJtLe+6DDRqJICd4CpHvPFIFOUmX2zUMh+wMqhjwwmhcrVjfJ5b
 1LUY7oeCGTvIHoR9qUJ7uUnKoxMvzBvUae3hmcvTw8RpDxAJ9t83Fn9FtUwYmKTlJkyi
 KMY7HR/1HAO+w0CojDYxlDWj/p56wARACuAqHqfp2h5vQ6uVpORwH+89JbyrvqVw88Lu
 LKGA==
X-Gm-Message-State: AOAM531gfz5TiyMrMYddNrzKw+DNqH9L+u1I12DvkDniVi3cDQFimrAf
 MoOfKpmXUOkjquOhmEtxuhr87w79pGD58Ot/F5LKww==
X-Google-Smtp-Source: ABdhPJxM0nn6L84rHUj4Gb+jOZSqgxHoFiOkcE8dNBOJmIDosHNk+ShSDIkEgO2AH7sNO4+MIcnbS/HprQhkcuCb8wY=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr2770219oif.63.1649217788747; Tue, 05
 Apr 2022 21:03:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:03:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 21:03:08 -0700
Message-ID: <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: don't store created planes,
 connectors and encoders
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

Quoting Dmitry Baryshkov (2022-04-05 16:50:59)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d661debb50f1..ee3093890d97 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -184,23 +184,14 @@ struct msm_drm_private {
>
>         struct workqueue_struct *wq;
>
> -       unsigned int num_planes;
> -       struct drm_plane *planes[MAX_PLANES];

Can we get rid of MAX_PLANES?

> -
>         unsigned int num_crtcs;
>         struct drm_crtc *crtcs[MAX_CRTCS];
>
>         struct msm_drm_thread event_thread[MAX_CRTCS];
>
> -       unsigned int num_encoders;
> -       struct drm_encoder *encoders[MAX_ENCODERS];

And MAX_ENCODERS?

> -
>         unsigned int num_bridges;
>         struct drm_bridge *bridges[MAX_BRIDGES];
>
> -       unsigned int num_connectors;
> -       struct drm_connector *connectors[MAX_CONNECTORS];

And MAX_CONNECTORS?
