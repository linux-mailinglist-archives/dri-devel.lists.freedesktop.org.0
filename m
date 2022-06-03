Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E548353CC0C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5881139A2;
	Fri,  3 Jun 2022 15:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F367B113996
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 15:11:51 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id i186so7613831vsc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRR3/ZPTVsG03kPxvHaCWj5GOU1Fozuljr/KxjIdd24=;
 b=RvB2Z7RxhhPnXx6cxqPf+5ToILBl1dmnnSMkH527a7AvoICiiK3yGW8rJlUAXElMtF
 odcWYwMywrpaROkPhfs+3fa39YFpPOISBqdq7dp8syv+gDfGk60i4/WIVVIcULQGrEUh
 qJ5YEbPabkqRpq3WMTljLMnruA9/2frjVJzQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRR3/ZPTVsG03kPxvHaCWj5GOU1Fozuljr/KxjIdd24=;
 b=N6ujQ2ry47eCsIAmCrKCk2GFCJZ3dKBcc+pzivbmpqhE24aVGkFsJhpOPX2mepL201
 3lyjLHqFkCjjO/wEI1lY03rwHoGVVWzAxzgvm4MznMQMUywQbm75cEYOAdvf3Xve0tM9
 FnktuZjtZXfBDPV5BYr9g+SrQImDuZajk2vpNkWfxZfHU4WLYPM9aZj9bryvJI5X+UzO
 CJ0EaVbOxTKp7wspDZ1HDW+f4Kk3jOMNmS4IBQPuDhz4ia2pARMyHB8liZ/vzpWguR1E
 GsUbi8ZsUGHFUBUF68iwBrKg6Q36avGYd0HO63S6kW5w6/ceM9bByS9YwjOpDxgYfjp/
 ZvOg==
X-Gm-Message-State: AOAM530ATC+/chDL5dJOF2redHYgICkPo9XUwbjnqLVh4BSW404AAbSK
 VULZiP7wfECW6Q38d6AhOQ2EPCRBTL76PQ==
X-Google-Smtp-Source: ABdhPJzP0hO8L05x+EkRJKtYc5zPdpcUSKL6he6OFJ77pLJp2t1CVIPWNKwcrdZCdX+a/TtGnAiz2g==
X-Received: by 2002:a67:e90a:0:b0:34a:468c:841e with SMTP id
 c10-20020a67e90a000000b0034a468c841emr3657423vso.13.1654269110751; 
 Fri, 03 Jun 2022 08:11:50 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52]) by smtp.gmail.com with ESMTPSA id
 h1-20020ab02341000000b003626f894decsm1094442uao.26.2022.06.03.08.11.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 08:11:48 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id k13so2629201uad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 08:11:47 -0700 (PDT)
X-Received: by 2002:ab0:3311:0:b0:369:1d82:99a5 with SMTP id
 r17-20020ab03311000000b003691d8299a5mr17684734uao.33.1654269106779; Fri, 03
 Jun 2022 08:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
 <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
 <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
In-Reply-To: <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 3 Jun 2022 11:11:09 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
Message-ID: <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state
 machine fixes
To: Brian Norris <briannorris@chromium.org>
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
Cc: Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 5:51 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Thu, Mar 10, 2022 at 3:50 PM Brian Norris <briannorris@chromium.org> wrote:
> > On Mon, Feb 28, 2022 at 12:25 PM Brian Norris <briannorris@chromium.org> wrote:
>
> > Ping for review? Sean, perhaps? (You already reviewed this on the
> > Chromium tracker.)
>
> Ping

Apologies for the delay. Please in future ping on irc/chat if you're
waiting for review from me, my inbox is often neglected.

The set still looks good to me,

Reviewed-by: Sean Paul <seanpaul@chromium.org>


Sean
