Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586914FBD4D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6510F23A;
	Mon, 11 Apr 2022 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEA310F23A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:38:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so30924107ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJY5oOKjorrHxmexlsMH/Hti9QwhC0oVd/Eyc2mbwG0=;
 b=OmKUnwvfhDqcpiaKjTQbI6Qnu8Sf+6VZ9D9C9+11QRZJ8UM4bw5KC4TRF+VX2MyUlF
 tjcQu6vqOm9Z7CfqQs46eZM9lBwaV/9IXtigcyYK6aTz2mXIUEvaBEQKyVtZFvwOhIdC
 Qg5hbGJLnbUj4QPBxZJqO4hZPQyc+NFdJgUmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJY5oOKjorrHxmexlsMH/Hti9QwhC0oVd/Eyc2mbwG0=;
 b=0qK4zlx7j6mQ3rS2sHjF5tv5lof5qIEsMcMsJqt0y+9/3WVKyQd52dguZZdYWwQNr3
 CcJNvcC3veiG7awdGBXWLQUh/Wx22MJKFiOugGvD43YAgyK3utHN1AjeQd8SD5uiYGhq
 D+66N/1csrt9Ug4ExwSeD5Ny11cGt2GkniB6fHMPfzoUYEriCyYsU7NIS9AW96Et1ywd
 x+hEgIeiXGE0WgcoSBkP1vCxIV4JZytBC6N6OBjPEOz59fJZ/00KY1dtFR7vQOIcwInv
 PYcBs3lXjCOsVnO5/9hbjEnGZNVj22/mKBsXerFK6/zabMxUP9Wsulf0v+frawOP3Wyv
 P/xw==
X-Gm-Message-State: AOAM533NBnPd53IabQ5YMTtWNqA/n8eu+3hIfP4XjXsyKu/+VXHXiyUW
 95rTqAQr6aZUjb71J5x0ksrD/vHolK21lQ==
X-Google-Smtp-Source: ABdhPJzJoBdkZzby7piQR6Z5yCTufOhoSMDUnKsfH+3wGsxj6srCAMymFWQbdLtxBUNFYBVeuzqThg==
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id
 bh14-20020a170906a0ce00b006d1cb303b3bmr29611040ejb.582.1649684288981; 
 Mon, 11 Apr 2022 06:38:08 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 d1-20020a50fe81000000b004197f2ecdc2sm15056678edt.89.2022.04.11.06.38.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 06:38:07 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so8530309wmn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:38:07 -0700 (PDT)
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr28939846wmb.199.1649684286640; Mon, 11
 Apr 2022 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <87o818hvcn.fsf@intel.com>
In-Reply-To: <87o818hvcn.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Apr 2022 06:37:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uzp7wm3gs0pROw_e_-61tphTeXD_6wEP1AOs=Kfdgh7A@mail.gmail.com>
Message-ID: <CAD=FV=Uzp7wm3gs0pROw_e_-61tphTeXD_6wEP1AOs=Kfdgh7A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 11, 2022 at 1:34 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 08 Apr 2022, Douglas Anderson <dianders@chromium.org> wrote:
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
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> What is an "EP" client or device?

The DP AUX EndPoint (or DP AUX EP) is just the generic name I called
the thing on the other side of the DP AUX bus, AKA the "panel".

The "DP AUX EP client" (ep_client) is the code that needs a reference
to the panel.

I'll beef up the patch description and the comments around the
structure to try to make this clearer.

-Doug
