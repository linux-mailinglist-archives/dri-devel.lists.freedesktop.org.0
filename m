Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508748B6ED
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 20:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0FD10E54C;
	Tue, 11 Jan 2022 19:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910AD10E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 19:17:18 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 t6-20020a9d7746000000b005917e6b96ffso1861500otl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXfEP3eDjuVf2I0hzndCbBZCmDbt3TXTw7VkqrBBp6g=;
 b=GqsQHSUI/DSQ5OHrZM4cAIUTNhygx8SMT8UZeIjwtBBPg0C1RHAiQTcr+e9hK8YBlu
 l8uN7LR5JJfZ1yuZ2HAK/ZI1cEra7YuXTRaICw2tpHE2SpAPNvHUYAQWqMGqoRK2xquF
 NunrkGKuyj1aPAhJandfNKcNq/xbyYZ/ka9wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXfEP3eDjuVf2I0hzndCbBZCmDbt3TXTw7VkqrBBp6g=;
 b=cB5N2W9+dKtWlqOf0wIAM/7CNuej02B51QX7r4mTVRaxm2CJubnePVcLuDsv5iRy8l
 DqGAPYs2Bs5Se0h6Wio8hFGeNxZNmUSUeoiDYsenvg7ujoiON9tvQJl/iYhoKantR+Dj
 RIwu8N0hYEaHHOE2aiTRurKzkRcoTD5FvmkWy0LS7gKNPIwzYjRrOgTkWocA496DERla
 FrJhTV3kpfuEml1jc0tZ2TniVcxlvp1EIN3TO4KBVv2Ljaj6UbUsmGdUfGQ9hxCj2hxE
 3A0OZuwfPBMQJN7mtlAQMB7lXEV05lltyi2PKdh2WUaMcnbGI9/13SQcxvrLO1Szjnia
 MkqQ==
X-Gm-Message-State: AOAM532OJnNdhJRL+9yJ88HzYERiNxh4RNcVrGMyyQ4YvmC4+BmSfh5J
 N48DIuGxqbNGESuGCISK+JCyQeOnFZ1qCg==
X-Google-Smtp-Source: ABdhPJzNDJH0xea4aSKF//kUH1w24l2c3qs7UDpE40XJrGADExK2S9v95oCS8caTkwahWuDo2GblTg==
X-Received: by 2002:a9d:7dc4:: with SMTP id k4mr4340299otn.51.1641928637092;
 Tue, 11 Jan 2022 11:17:17 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id i29sm488261ooe.40.2022.01.11.11.17.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 11:17:15 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so19677356otu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:17:15 -0800 (PST)
X-Received: by 2002:a9d:5908:: with SMTP id t8mr2359606oth.186.1641928634923; 
 Tue, 11 Jan 2022 11:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <cd453cd2-e23f-84b9-e7d3-667df2397c45@intel.com>
In-Reply-To: <cd453cd2-e23f-84b9-e7d3-667df2397c45@intel.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 11 Jan 2022 11:17:04 -0800
X-Gmail-Original-Message-ID: <CA+ASDXPu5=kv1KoJ-189uHXGua-vhYJzJ4pNujmVxJf_dWE=Sg@mail.gmail.com>
Message-ID: <CA+ASDXPu5=kv1KoJ-189uHXGua-vhYJzJ4pNujmVxJf_dWE=Sg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 stable <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, Jan 11, 2022 at 5:26 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> I am not DP specialist so CC-ed people working with DP

Thanks for the review regardless! I'll also not claim to be a DP
specialist -- although I've had to learn my fair share to debug a good
handful of issues on an SoC using this driver.

> On 01.10.2021 23:42, Brian Norris wrote:
> > If the display is not enable()d, then we aren't holding a runtime PM
> > reference here. Thus, it's easy to accidentally cause a hang, if user
> > space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
> >
> > Let's get the panel and PM state right before trying to talk AUX.
> >
> > Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
> > Cc: <stable@vger.kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
>
>
> Few questions/issues here:
>
> 1. If it is just to avoid accidental 'hangs' it would be better to just
> check if the panel is working before transfer, if not, return error
> code. If there is better reason for this pm dance, please provide it  in
> description.

I'm not that familiar with DP-AUX, but I believe it can potentially
provide a variety of useful information (e.g., EDID?) to users without
the display and primary video link being active. So it doesn't sound
like a good idea to me to purposely leave this interface uninitialized
(and emitting errors) even when the user is asking for communication
(via /dev/drm_dp_aux<N>). Do you want me to document what
/dev/drm_dp_aux<N> does, and why someone would use it, in the commit
message?

> 2. Again I see an assumption that panel-prepare enables power for
> something different than video transmission, accidentally it is true for
> most devices, but devices having more fine grained power management will
> break, or at least will be used inefficiently - but maybe in case of dp
> it is OK ???

For this part, I'm less sure -- I wasn't sure what the general needs
are for AUX communication, and whether we need the panel enabled or
not. It seems logical that we need something powered, and I don't know
of anything besides "prepare()" that ensures that for DP panels.

(NB: the key to _my_ problem is the PM runtime reference. It's
absolutely essential that we don't try to utilize the DP hardware
without powering it up. The panel power state is less critical.)

> 3. More general issue - I am not sure if this should not be handled
> uniformly for all drm_dp devices.

I'm not sure what precisely you mean by #3. But FWIW, this is at least
partially documented ("make sure it's been properly enabled"):

        /**
         * @transfer: transfers a message representing a single AUX
         * transaction.
         *
         * This is a hardware-specific implementation of how
         * transactions are executed that the drivers must provide.
...
         * Also note that this callback can be called no matter the
         * state @dev is in. Drivers that need that device to be powered
         * to perform this operation will first need to make sure it's
         * been properly enabled.
         */
        ssize_t (*transfer)(struct drm_dp_aux *aux,
                            struct drm_dp_aux_msg *msg);

But maybe the definition of "properly enabled" is what you're unsure
about? (I'm also a little unsure.)

Regards,
Brian
