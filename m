Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C4523F78
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 23:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B8C10E3F6;
	Wed, 11 May 2022 21:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F0810E423
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 21:32:42 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e15so3459906iob.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6pxwbhOL58efAEpspYDSg6HtmNXrpN7C08+cjeITwQ=;
 b=Bun6KWZaMx96+9+uXGZgUChN1x9/Aj4KQGLniflfQhrzj3QoS7dDf8YRxNsH4jJGam
 gBzzT9mfcPztSxGb2V3qWAN2pD0bT2izPpALbOjJUsUrp55Yx+pIEMIbQxVHohM5Nqqv
 UDD4ougcotvewCQD2tIHFSU/bC9430Tj7rFPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6pxwbhOL58efAEpspYDSg6HtmNXrpN7C08+cjeITwQ=;
 b=N5DWdeAP6VgB+MzTHNvEZLyDXfl2uIqYpktxnbSXdkK9AHfKPnq4S+/L2P+eSuCPNC
 ipyl8QFNEgfQYyfJYBoty36SktZ4xZC3tjHX/xJga2HEmBMx288HR5g3TtgDJOVh3yJR
 Wa1tl67fhIWiY9rJ6Pfcht0cppiLpEeQTDgI0wrd/aGHCN1Yby2dzQbgphadVwBWgt7s
 cmp0ZsNiBhPpTuHeyTQesoGaQqjAFiFuMKTwsOeWh+0Q7hs1ac8geppdGSASC5ULWi98
 tcdLP2OXOb2yhIrn2l6n71HXDwo9ZAR2ApxrHS5GWu1eBl1p6AI0buULk9HAT357uGjI
 vZyA==
X-Gm-Message-State: AOAM531g44uF+dGL0c2V6lK2w+nL7T8T9GgftyJJOaqVxHmI6e50GyT6
 KMw5X21X5EKmOVzbL5l9R8uEyws7mns5YewG
X-Google-Smtp-Source: ABdhPJwMSNCc/yj+TM9+oZff56Dfz4nXAKU5Y3CkbJnuAjemEA6WBYMTdMAffjzPWe2VaorvusnvtA==
X-Received: by 2002:a05:6602:400d:b0:65d:bff5:4f35 with SMTP id
 bk13-20020a056602400d00b0065dbff54f35mr1114131iob.199.1652304761885; 
 Wed, 11 May 2022 14:32:41 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42]) by smtp.gmail.com with ESMTPSA id
 e11-20020a5d924b000000b0065a47e16f4csm883788iol.30.2022.05.11.14.32.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 14:32:40 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id s23so3406989iog.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:32:40 -0700 (PDT)
X-Received: by 2002:a05:6638:3589:b0:32b:858c:6cc3 with SMTP id
 v9-20020a056638358900b0032b858c6cc3mr13931855jal.229.1652304760140; Wed, 11
 May 2022 14:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
In-Reply-To: <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 14:32:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
Message-ID: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 12:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 10.05.22 um 22:51 schrieb Douglas Anderson:
> > If we're unable to read the EDID for a display because it's corrupt /
> > bogus / invalid then we'll add a set of standard modes for the
> > display. When userspace looks at these modes it doesn't really have a
> > good concept for which mode to pick and it'll likely pick the highest
> > resolution one by default. That's probably not ideal because the modes
> > were purely guesses on the part of the Linux kernel.
>
> I'm skeptical. Why does the kernel do a better job than userspace here?
> Only the graphics driver could possibly make such a decision.
>
> Not setting any preferred mode at least gives a clear message to userspace.

OK, that's a fair point. So I tried to find out what our userspace is
doing. I believe it's:

https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/common/drm_util.cc;l=529

Specifically this bit of code:

  // If we still have no preferred mode, then use the first one since it should
  // be the best mode.
  if (!*out_native_mode && !modes.empty())
    *out_native_mode = modes.front().get();

Do you agree with what our userspace is doing here, or is it wrong?

If our userspace is doing the right thing, then I guess the problem is
the call to "drm_mode_sort(&connector->modes);" at the end of
drm_helper_probe_single_connector_modes(). Would you be OK with me
_not_ sorting the modes in the "bad EDID" case? That also seems to fix
my problem...

-Doug
