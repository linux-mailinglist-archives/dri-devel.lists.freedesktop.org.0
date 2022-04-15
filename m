Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D005502FF2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 23:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77510E17E;
	Fri, 15 Apr 2022 21:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434F10E17E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 21:13:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lc2so17080545ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9/eIOcMzFXFy1UqdC2a9lha39G1K+4P4bzD5ljUCSQ=;
 b=jPU5vA6ZbtcrunKoRNu6bC3vOFR6SeSjDk+VsAVsUKEsIvsHA/5xgsx8E5ayCjXGDF
 J5XGvTMhhe+hbudmYeul0I59PtZnd3nSx5rKQRf4V6GAUbv43ITNf7kY4HhZS4Of8wLj
 tf58+zV5OWz+71wx/OPPt0WNeilQRJX/9GpgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9/eIOcMzFXFy1UqdC2a9lha39G1K+4P4bzD5ljUCSQ=;
 b=CCjWKX9rEsp2ptu/u9OcQLm+vp5mR1z/ypcNdhIrQbvGgpXesejiYi9uqNJDyGQi5M
 uvTbA/bVH6GzlpywQN+tgTb94RGf68wyfBWrbh7uRQBoI4w9+upPW/5+UJ+6Ek7P4IMk
 YXEqo4AAGvRoUXBYDbea6YTRUsIwtrr/0q0GDCH9zvZ1q4QlnmtViL/67iZc9TVYuRz3
 MgaZqj6TIdZfszKD9Jwtj2Mn+03q0bOwPV6dPcAqBf8usfTmXx9oeimx42uVbBL08ztM
 LlkSD8Amf9h3Ner5VSeWIqsvLMhzSpkYHEYu50VVVdiFQS2o9QbvOD2plCwvFBAmuPwr
 5J3A==
X-Gm-Message-State: AOAM533cfyz2ZZ2kwH4wM8YdmVC294NhOmra2sECfrJyuDy4rYfLqW+l
 IDF2WdJf7mZaZmWeh6bZWL2KuBezhSViFA==
X-Google-Smtp-Source: ABdhPJwSS0wfeplN3mtPzxOAWsaVPNGxJERe7LRNKyqgSnZ+wtUnJ820pnAg52O3DyjXj7sSABrYCA==
X-Received: by 2002:a17:907:2d08:b0:6e8:8e58:f70e with SMTP id
 gs8-20020a1709072d0800b006e88e58f70emr689578ejc.301.1650057207921; 
 Fri, 15 Apr 2022 14:13:27 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056402519000b0041d77e14005sm3324056edd.82.2022.04.15.14.13.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 14:13:26 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id b19so11848034wrh.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:13:26 -0700 (PDT)
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr599612wrc.422.1650057205965; Fri, 15
 Apr 2022 14:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
In-Reply-To: <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Apr 2022 14:13:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
Message-ID: <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
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

On Thu, Apr 14, 2022 at 5:47 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 09/04/2022 05:36, Douglas Anderson wrote:
> > As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> > patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> > ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> > DP AUX bus properly we really need two "struct device"s. One "struct
> > device" is in charge of providing the DP AUX bus and the other is
> > where we'll try to get a reference to the newly probed endpoint
> > devices.
> >
> > In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> > is already broken up into several "struct devices" anyway because it
> > also provides a PWM and some GPIOs. Adding one more wasn't that
> > difficult / ugly.
> >
> > When I tried to do the same solution in parade-ps8640, it felt like I
> > was copying too much boilerplate code. I made the realization that I
> > didn't _really_ need a separate "driver" for each person that wanted
> > to do the same thing. By putting all the "driver" related code in a
> > common place then we could save a bit of hassle. This change
> > effectively adds a new "ep_client" driver that can be used by
> > anyone. The devices instantiated by this driver will just call through
> > to the probe/remove/shutdown calls provided.
> >
> > At the moment, the "ep_client" driver is backed by the Linux auxiliary
> > bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> > want to expose this to clients, though, so as far as clients are
> > concerned they get a vanilla "struct device".
>
> I have been thinking about your approach for quite some time. I think
> that enforcing a use of auxilliary device is an overkill. What do we
> really need is the the set callbacks in the bus struct or a notifier. We
> have to notify the aux_bus controller side that the client has been
> probed successfully or that the client is going to be removed.

It seems like these new callbacks would be nearly the same as the
probe/remove callbacks in my proposal except:

* They rely on there being exactly 1 AUX device, or we make it a rule
that we wait for all AUX devices to probe (?)

* We need to come up with a system for detecting when everything
probes or is going to be removed, though that's probably not too hard.
I guess the DP AUX bus could just replace the panel's probe function
with its own and essentially "tail patch" it. I guess it could "head
patch" the remove call? ...or is there some better way you were
thinking of knowing when all our children probed?

* The callback on the aux bus controller side would not be able to
DEFER. In other words trying to acquire a reference to the panel can
always be the last thing we do so we know there can be no reasons to
defer after. This should be doable, but at least in the ps8640 case it
will require changing the code a bit. I notice that today it actually
tries to get the panel side _before_ it gets the MIPI side and it
potentially can return -EPROBE_DEFER if it can't find the MIPI side. I
guess I have a niggling feeling that we'll find some reason in the
future that we can't be last, but we can probably ignore that. ;-)

I can switch this all to normal callbacks if that's what everyone
wants, but it doesn't feel significantly cleaner to me and does seem
to have some (small) downsides.


> And this
> approach would make driver's life easier, since e.g. the bus code can
> pm_get the EP device before calling callbacks/notifiers and
> pm_put_autosuspend it afterwards.

Not sure about doing the pm calls on behalf of the EP device. What's
the goal there?
