Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A8B50A503
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1255610E14F;
	Thu, 21 Apr 2022 16:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9081810E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 16:08:00 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id r13so11026989ejd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
 b=nSF4LY4d2BN1+JKzCgg54cIZdi/67BsPH/yDBzQffgGlo9dfl+XlmWXoZzWzMAXnIp
 qdZnwGxZTweXi0UkZvcPT3csTHegVQ7l9Yr8NqemyuxGmINZvpE6WVK/kWcyEnj1B29C
 R+2ri3hviOx0Pn502v6FXWj/8GgnrITxJ4CN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
 b=8IXDEOX1S93S8umAfaBs1aPBXavwmz0ZL+gl7Ncy4sA0isa2GxZ0lb5/OggyXyNhiD
 V8YRsDfkQk8SVgHA3qHddg8myIaJWZ7tCIpW3QDPpdyJE2nzF0v+CdSIJpWaGzHqIY20
 NGJ0R5JT7JZQsu53qx3Vfi0KHmW5KtmU1X+TC4ahIrwXXBGgdhQI2VIcg2LfZ6PDIsWF
 WLkQehekSpZRekVkvh9VeUtumvwLjEALoM4IzQM/xHN9AAzkH7nYqmnMZCrpkX3C9e26
 Er/k8R2zKyYldaqtfLEGxeyl24Fz+dZ/UW03jUZZjkURUNIUb7GP51uOYHIsqGQ2HTAv
 v3rg==
X-Gm-Message-State: AOAM5337PidInrgYAm6D2sibSvYey81+FvMMplV4DL2XtGDcoVNnQ/jv
 NG7mTy/3ArFIOXmwmkHXemt7MSbl9QIWu0Cl78Y=
X-Google-Smtp-Source: ABdhPJyfP9sRKaUw+Co+Ahk4qM26DEqrp8skOCOf7tqMWv8LePcXa2MOJfoU/S1NklNoznG8KQy6RQ==
X-Received: by 2002:a17:906:fa8f:b0:6e4:de0d:45f with SMTP id
 lt15-20020a170906fa8f00b006e4de0d045fmr213595ejb.235.1650557279134; 
 Thu, 21 Apr 2022 09:07:59 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm8010448ejc.66.2022.04.21.09.07.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 09:07:58 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id bv16so7337780wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 09:07:58 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr355251wra.422.1650557277978; Thu, 21
 Apr 2022 09:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
 <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 09:07:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 21, 2022 at 9:00 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> >> +       }
> >> +
> >> +       /*
> >> +        * External bridges are mandatory for eDP interfaces: one has to
> >> +        * provide at least an eDP panel (which gets wrapped into panel-
> >bridge).
> >> +        *
> >> +        * For DisplayPort interfaces external bridges are optional, so
> >> +        * silently ignore an error if one is not present (-ENODEV).
> >> +        */
> >> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> >> +       if (rc && dp->is_edp) {
> >> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto edp_error;
> >> +       } else if (rc && rc != -ENODEV) {
> >> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto error;
> >> +       }
> >
> >The above wouldn't be my favorite way of doing this. Instead, I would have
> >written:
> >
> >  if (rc) {
> >    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
> >    goto err;
> >  }
> >  ...
> >
> >err:
> >  if (dp->is_edp) {
> >    disable_irq(...);
> >    dp_display_host_phy_exit(...);
> >    dp_display_host_deinit(...);
> >  }
> >  return rc;
> >
>
> If rc is ENODEV for DP, then we need to return 0. Shall I add like below ?
>
> err:
>   if (dp->is_edp) {
>     disable_irq(...);
>     dp_display_host_phy_exit(...);
>     dp_display_host_deinit(...);
>   } else
>         If (rc == -ENODEV)
>             rc = 0;
>   return rc;

I wouldn't. Then you're essentially going to "err" for a case that you
don't consider an error. I would instead have just handled it right
away.

rc = dp_parser_find_next_bridge(dp_priv->parser);
if (!dp->is_edp && rc == -ENODEV)
  return 0;

This also is better IMO because it means you aren't assuming that
`dp_priv->parser->next_bridge` is "valid" (or at least NULL) after
dp_parser_find_next_bridge() returned an error.

-Doug
