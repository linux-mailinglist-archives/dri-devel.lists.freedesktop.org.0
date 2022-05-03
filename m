Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67565191A4
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F73B10E5BA;
	Tue,  3 May 2022 22:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6971510E5BA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 22:45:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a1so21465714edt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcoJyd6IQhefQYX8YmS8kRdiPp97xel2zqR6ovb3t1o=;
 b=mSx7kXDA9VtimMmq2W2PO1IrRIczfsMh72TqK8A7iswnmIOVOSVsWOnR5nGU8MAgsd
 DP3spwwVJVqXGF8a6KPc51AMcglh4r1h9aB1i+VYB9rbuibnvdq2/64fP6xwIRRqhJPc
 lWmeVHp18dsk6pOXkY4G3D0ohs++wfKJOc+EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcoJyd6IQhefQYX8YmS8kRdiPp97xel2zqR6ovb3t1o=;
 b=jLjKjJwODJTqc/ZFLLpTYUL6FHZ5JOpK+Dd8cfA3gSmOoJ2e2FpNArhsIxLaqV3+56
 Na6R6mkfgNNiZSTKb1HobGIp8jnX5WLZdTgJZxSLHqn5BY3ZkSU2+RkS+W113Q5SFB7C
 25327g+OzKjQgJE0aYezRhAUkw1kB5rW0h8XVM97H/BXvx3NL5hY9/+6z/fQXN/GAHOH
 LKtZ/ajuNZl1VkiGXAnjGMBvvFtAT8ggj45mQX4ziF/+C3LjMwUr7fOShXs9Zk663Cgt
 DdBP//9/F+cMkareZ2SCmqr9cd4ShEGTkPG1yWBM/FtE1oyP9WqInF9utdnlrsSptewE
 8pYg==
X-Gm-Message-State: AOAM532WMggkuND1cRF5Pcd8LFrl9Fd/DkiKSDnHvmcjJXzK2D5I3f8+
 d3B6Pga9WUgkW6JTIr6GSp10BtMqZabid0W3
X-Google-Smtp-Source: ABdhPJwQPkWWtIZ78NEBkhB6rx7lkzcAz49aSIqOhk2DEAOOmKoe93dZvV8j7twamVHHYKJFNiPOEg==
X-Received: by 2002:a50:d65c:0:b0:425:ea34:7dd7 with SMTP id
 c28-20020a50d65c000000b00425ea347dd7mr20446637edj.18.1651617917625; 
 Tue, 03 May 2022 15:45:17 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214df1sm5018954ejb.87.2022.05.03.15.45.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 15:45:16 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so2216977wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:45:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr5127000wmb.199.1651617916164; Tue, 03
 May 2022 15:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
 <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
 <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
 <CAD=FV=UmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak88ydEqTsBiQ@mail.gmail.com>
 <ddb8d8fa-89dc-268b-0505-9ee7df8c272e@linaro.org>
 <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 15:45:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEgcrLYzLcPkf+n20VcMBD2BVFo++0BSaDWniDPzM2Hw@mail.gmail.com>
Message-ID: <CAD=FV=XEgcrLYzLcPkf+n20VcMBD2BVFo++0BSaDWniDPzM2Hw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 18, 2022 at 4:10 PM Doug Anderson <dianders@chromium.org> wrote:
>
> So I guess where does that leave us? Maybe:
>
> 1. I'll add a WARN_ON() in of_dp_aux_populate_ep_devices() if there is
> more than one DP AUX endpoint with a comment explaining why we assume
> one DP AUX endpoint.
>
> 2. I'll create this new structure in drm_dp_aux_bus.h:
>
> struct dp_aux_populate_callbacks {
>   int (*done_probing)(struct drm_dp_aux *aux);
>   void (*pre_remove)(struct drm_dp_aux *aux);
> };
>
> 3. I'll add a second version of the populate functions that AUX bus
> providers can use if they want callbacks:
>
> int of_dp_aux_populate_ep_devices_cb(struct drm_dp_aux *aux,
>                                      struct dp_aux_populate_callbacks *cb);
> int devm_of_dp_aux_populate_ep_devices_cb(struct drm_dp_aux *aux,
>                                           struct dp_aux_populate_callbacks *cb);
>
> The old functions will just be changed to wrap the above and pass NULL
> for the callbacks. To me, this seems better/simpler than notifiers or
> any other scheme, but yell if you disagree.
>
> 4. I'll call the callsbacks in dp_aux_ep_probe() after a successful
> probe. I'll add a second callback and will call it in
> dp_aux_ep_remove() before passing the remove through to the panel.
>
>
> If that sounds peachy then I think it should be pretty doable.

I never heard any response about whether people liked the above, but I
went ahead and did something similar to it. It can be found at:

https://lore.kernel.org/r/20220503224029.3195306-1-dianders@chromium.org
