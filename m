Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B504E426E4E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 18:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC206E0D5;
	Fri,  8 Oct 2021 16:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631E16E0D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 16:01:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso5689902pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mJr70vtcSbn8HkbIjoqrY+nokUtRVQIO9WTnKtmG5ik=;
 b=qJIOqw5PCw7aJXLpxzhrrCUO7UnCMmPBBpJADmTgebLKqc3R6Yt9mvPXF1qhp+cFxK
 UKFkMylm0fZz+4vhhL46VoJoaHCQf6J86LAi2zcTqDw8018Q3pNJZRy5rGH92gCw74E9
 3oYDDVIwGKvrQjIdEmNpiRH+x9iw3B0d6RHRCGVnwaj7bbYXyb85MrFfOgNUKvPN/5Bh
 EaAR6lHa0EZPg+sw283+W9qmw1ljfzMnFYajJE5gsoPfM+ErTIVcQWYUis6l3dC8VlB1
 6EimFCaCIuEbt1SGFHI6Ou3TSJDaVwItfIwxhYLWlYGq9p6sr9zdT4q6Y5+BQF9Qqfbh
 sgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mJr70vtcSbn8HkbIjoqrY+nokUtRVQIO9WTnKtmG5ik=;
 b=QQzTnaYSxpAcByc2FfVDDwCMAw3n2di0SXNnkiervZTtnMBpUzSB7f+fX7RprAD6m3
 Km7r5cf8qy5fczyPH/2dLrL4y01lgmid+3MGXf9oA+MMXu8YuFVpKAI1Gcmrntix3//Z
 FHG3dKJKW1RIRWmbTzsT1s/DAbD3/UJOu229yboqneBOPwcQhCUUEh/Vb1ynPcDyAgS5
 T9NchU5aY/Gzf1/0oYcS2/2jE6pfIp3zwpsK0xtlb7YyI50RKrW4heB51NRI+OWXZqIR
 e6Pl7M1eCB5EwNLevWcVKoAT/FM2VUjogNPGQ3SymnH+ofCJNoW8/VhN8euYUtsFFJK6
 GCCQ==
X-Gm-Message-State: AOAM5310SipqGn1xuOLdJFR5xwjx12rWcxgog8EIyIW1tSGydYrKNfLq
 m6YlP7S9iO1QWnxMqXML6qNztVCnbT1dFxUL2Lp+VA==
X-Google-Smtp-Source: ABdhPJw2mT/8VUBkZuHdEM/x3If4KXMLcmxLKFmb5zR9aK5AH+CfwKfkE7xSLXja/Ljm5kmIqRq/mfjTrsf50IcgMZ4=
X-Received: by 2002:a17:90b:1644:: with SMTP id
 il4mr9831056pjb.179.1633708861847; 
 Fri, 08 Oct 2021 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211007094723.202330-1-allen.chen@ite.com.tw>
In-Reply-To: <20211007094723.202330-1-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 8 Oct 2021 18:00:50 +0200
Message-ID: <CAG3jFyu-nG8jttSfkZ-ZZAg7W9SRFFDWsA9=g7Z1JbNhxBLuyw@mail.gmail.com>
Subject: Re: [PATCH v9] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, 
 Hermes Wu <Hermes.Wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@google.com>, 
 Hsin-yi Wang <hsinyi@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Allen,

I was running the pre-merge checks, and hit some build issues. This
was built against todays drm-misc-next branch, which I would like you
to rebase your patch against.

drivers/gpu/drm/bridge/ite-it6505.c: In function =E2=80=98it6505_bridge_ato=
mic_enable=E2=80=99:
drivers/gpu/drm/bridge/ite-it6505.c:2919:15: error: implicit
declaration of function =E2=80=98drm_bridge_new_crtc_state=E2=80=99; did yo=
u mean
=E2=80=98drm_atomic_get_new_crtc_state=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
 2919 |  crtc_state =3D drm_bridge_new_crtc_state(bridge, old_state);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~
      |               drm_atomic_get_new_crtc_state
drivers/gpu/drm/bridge/ite-it6505.c:2919:13: warning: assignment to
=E2=80=98const struct drm_crtc_state *=E2=80=99 from =E2=80=98int=E2=80=99 =
makes pointer from integer
without a cast [-Wint-conversion]
 2919 |  crtc_state =3D drm_bridge_new_crtc_state(bridge, old_state);
      |             ^
