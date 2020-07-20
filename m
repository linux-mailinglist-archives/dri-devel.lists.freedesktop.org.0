Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB97226FAA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 22:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FEA89C21;
	Mon, 20 Jul 2020 20:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773689C21
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:24:15 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id b13so5464314uav.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8OZQPM5EHX3K0LcIbG7M5SK0hksxqYnwmQqH5pq9aU=;
 b=Vm+rTjwEti7KsrVH0G9zYwoD4ZvDR6asQnjKP0m5wquwlArH8wQZRdqCHpEs2vHPvD
 g75u4ABiQ/mstLqHDFM3kEjUdBRDLkaT+aHsmawJTSXH6qiC4UZtxnBplOeiU32rw9e6
 TVFHTnzR3EKkZyrNnb68WQkbezTZ8VZU5t++w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8OZQPM5EHX3K0LcIbG7M5SK0hksxqYnwmQqH5pq9aU=;
 b=TfxuE+zZu34btFeiy1snZdht+S6lMpkhANkILDvOVKVgUyiPTyzrZGmw1BBmSIbtSp
 4OvDodfT4kxBx/S1wbFx2XB1aTdAaTM4pkfPEl0ty7VHjwZezyuG7FX34kY25dMtdI2J
 vIxnKR11rPkRmitLX0ibIYLELH+UydmbPGBsl30Gd6com3Sejo7LUvSkOWuKUjQ6Fw6N
 XzlFW/Yg6DZJbHb4d5prJIJ+a6RQKWftMWECyVyqm44WDKFiCo96I900lASDBFwDnKrs
 sLR8XDKRIxU85thjXmFw5b9p6bG44cjNsJzsJsKfR+x0HH4MlMPVooxSgQc2/RKBlqXm
 lrPg==
X-Gm-Message-State: AOAM53347O/OxLtYtWO27sPKijIASyJDHpinWLX+EDy0hl/0UapAdVNC
 TSL4++WNjXx3nTw6FuuQzWbPMVxKaqY=
X-Google-Smtp-Source: ABdhPJw10hs+dmjnXV+AXtSJ1v8YlULrtbiUqgJPSmxo/ZOGplf6ZC/NSp4Fv0qaU1yqHb7q54/cag==
X-Received: by 2002:ab0:283:: with SMTP id 3mr15934269uah.18.1595276653827;
 Mon, 20 Jul 2020 13:24:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id f7sm2390954vso.5.2020.07.20.13.24.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 13:24:12 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id p25so9200684vsg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:24:12 -0700 (PDT)
X-Received: by 2002:a05:6102:20a:: with SMTP id
 z10mr17445636vsp.213.1595276651995; 
 Mon, 20 Jul 2020 13:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
In-Reply-To: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Jul 2020 13:24:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WonUcENxsY_jnYdw3d5rS0OMmrDAoMsDwYRZbMwCkJdw@mail.gmail.com>
Message-ID: <CAD=FV=WonUcENxsY_jnYdw3d5rS0OMmrDAoMsDwYRZbMwCkJdw@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: simple: Delay HPD checking on
 boe_nv133fhm_n61 for 15 ms
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Thu, Jul 16, 2020 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> On boe_nv133fhm_n62 (and presumably on boe_nv133fhm_n61) a scope shows
> a small spike on the HPD line right when you power the panel on.  The
> picture looks something like this:
>
>          +--------------------------------------
>          |
>          |
>          |
> Power ---+
>                                            +---
>                                            |
>               ++                           |
>          +----+|                           |
> HPD -----+     +---------------------------+
>
> So right when power is applied there's a little bump in HPD and then
> there's small spike right before it goes low.  The total time of the
> little bump plus the spike was measured on one panel as being 8 ms
> long.  The total time for the HPD to go high on the same panel was
> 51.2 ms, though the datasheet only promises it is < 200 ms.
>
> When asked about this glitch, BOE indicated that it was expected and
> persisted until the TCON has been initialized.
>
> If this was a real hotpluggable DP panel then this wouldn't matter a
> whole lot.  We'd debounce the HPD signal for a really long time and so
> the little blip wouldn't hurt.  However, this is not a hotpluggable DP
> panel and the the debouncing logic isn't needed and just shows down
> the time needed to get the display working.  This is why the code in
> panel_simple_prepare() doesn't do debouncing and just waits for HPD to
> go high once.  Unfortunately if we get unlucky and happen to poll the
> HPD line right at the spike we can try talking to the panel before
> it's ready.
>
> Let's handle this situation by putting in a 15 ms prepare delay and
> decreasing the "hpd absent delay" by 15 ms.  That means:
> * If you don't have HPD hooked up at all you've still got the
>   hardcoded 200 ms delay.
> * If you've got HPD hooked up you will always wait at least 15 ms
>   before checking HPD.  The only case where this could be bad is if
>   the panel is sharing a voltage rail with something else in the
>   system and was already turned on long before the panel came up.  In
>   such a case we'll be delaying 15 ms for no reason, but it's not a
>   huge delay and I don't see any other good solution to handle that
>   case.
>
> Even though the delay was measured as 8 ms, 15 ms was chosen to give a
> bit of margin.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't actually have a device in front of me that is exhibiting these
> problems.  I believe that it is only some devices and some of the
> time.  Still, this patch seems safe and seems likely to fix the issue
> given the scope shots.

Just to follow-up, I just heard that someone who had a panel
exhibiting this problem tried my patch and it fixed it for them.  :-)
So this is not such a shot in the dark anymore.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
