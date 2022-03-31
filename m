Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9F4ED0EB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 02:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF1310EE50;
	Thu, 31 Mar 2022 00:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610710E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 00:33:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id pv16so44821825ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
 b=LIfdAANbRqTkPOnpxYpODahOeq58jhaQDCbRX0ewZFvKdXZeAW4AkHth/rY399jQeA
 s29OfqcQ4X/oZAuMTJw1TZ+twD9KjvNly58+Betnq8PEp5NRg2YclK4NhtOUXif3D+OG
 B9DpasiswvJSuUWGNYlmZLBqNlkOp2jMpijmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
 b=mKm+dMgU+yRt6axlzsmWOFVYzvH1xXF1JKhGlI+iCbQGLUoSh/7LP1l1OhMCgaY51/
 KOfNd5OsO+VJwj5ke5MLNdowHGvcp+c5DXr+FA1QR8z8ZyVwHjqlspN6fMRNM5+Un37z
 fnq9gtrvtdnQe6ul6UfPKK49Ng5akZnZRLeN25qS1CyfMOXPAAf8dpXs02f1tXdSEi2r
 nXF9dYKPZtI++Exq0CzPooRw/JjtQweo6qOk0IqnWcJu3T8fqmHRLjarxLZrxXsMV3vX
 2VbvEpAnSrA93HptXXtd9ngPVAT4OyHfHMjp2IcyN169wsymmRNDsOk1GGZKU7DNlLqj
 V4pA==
X-Gm-Message-State: AOAM531Ai3jLKPP+WYDvWPEAJxi0ZCKex3h38YcoXiAm4+qj0emMm2t6
 S6ABvaEFPkQsmHdcSohmx/+gca+DmmGskJeb
X-Google-Smtp-Source: ABdhPJwPb0pEBiNjI+azTlzZw6rxwNJqKIR1iEAR1jNchWB8QISLD7jSuxaoCuNmvdXQ2vRvBWe9hA==
X-Received: by 2002:a17:907:3f9e:b0:6da:842e:873e with SMTP id
 hr30-20020a1709073f9e00b006da842e873emr2454867ejc.383.1648686835327; 
 Wed, 30 Mar 2022 17:33:55 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 s20-20020a056402015400b00418f9574a36sm10543106edu.73.2022.03.30.17.33.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 17:33:53 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso813592wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 17:33:52 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:38c:b84f:421a with SMTP id
 u10-20020a05600c19ca00b0038cb84f421amr2260341wmq.118.1648686832035; Wed, 30
 Mar 2022 17:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
In-Reply-To: <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Mar 2022 17:33:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 4:19 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +             bridge->ops =
> > +                     DRM_BRIDGE_OP_DETECT |
> > +                     DRM_BRIDGE_OP_HPD |
> > +                     DRM_BRIDGE_OP_MODES;
>
> I think OP_MODES should be used for eDP, shouldn't it?

No. It's confusing, but basically to get the power sequencing correct
we end up driving the EDID read from the panel driver in the eDP case.

-Doug
