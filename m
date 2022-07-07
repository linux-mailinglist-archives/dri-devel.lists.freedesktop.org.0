Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94315696CE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 02:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7110E81F;
	Thu,  7 Jul 2022 00:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08710E81F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 00:17:55 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10bec750eedso15684487fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=A9KMWBQbXLx/bx1xZ0Ut5YH6Gehkg3o6EpAfQEv3oiQ=;
 b=aFZdN/uwvv5by+9RhHiClMYZnVo6UGSzcXWWtCAt5r2fbdoUTBbHZ9NDK6Jj0z1pNd
 T38kEws2G5cAXs85Wvufk9YgEiWLP8NOvEtr1Snrb9gDrm/lX9iG4ufe56aRHSMlmDW1
 eNHW9MDnS+MOypb2lP2JCNoRd/AhNVVaO2PaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=A9KMWBQbXLx/bx1xZ0Ut5YH6Gehkg3o6EpAfQEv3oiQ=;
 b=0RnNXZzlsZbpHgiSW/CRx/f3iK/GZjzFPdxrHd/4jAULGAqouJe5K8VUmKrEgCRyAC
 lY6fPfoeK8oKrKtJmjuN0hhlHB+AKDFq3H1f2rKH4sTMU55pKF9C8EoWXEypYf4X4uIG
 B7IVINrsFWzZIvfa/SalSdv3IFCZTf1xDcbXIYBCmHa/ElujuIYhw6ZFMJEAUpVbW6pA
 WEqBOFuttrcc4CSKFwkL8zQMyW9svReCBtbPm8JbfVEYfWM/hXkXOK+jT01D8a1beH91
 2Rw0YW/RQJKYeuDyX6fK2FaQketl1fMmQBa30rSuj/+S7qnQFknfGgBDtx2rTC3LRGsp
 y4pQ==
X-Gm-Message-State: AJIora9pT+qVAyiFviLx7NwsgVUE7nQpZysjekwhaJK9eH+DQEGkdgn2
 Fe7kePYDY4ZrPglee+HFhuEsw58EbtdGDRw/8HtICA==
X-Google-Smtp-Source: AGRyM1vRIZqEOwogKZJcIXv6VDYldqs4L085Qun9gEFdF2cBslF60GMIX99hLqqjzW1HACZsMRx+6b3IRlXWzJ9eHZs=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr961649oap.63.1657153075078; Wed, 06 Jul
 2022 17:17:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 20:17:54 -0400
MIME-Version: 1.0
In-Reply-To: <CACeCKafya_XA+C3eJUvT4vjQSgsjdewVkCb+Jr2tA1605jjfjg@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
 <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
 <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
 <CACeCKafQT_RBrkHJNE2ezahSsHLPrbnS69QbfnjxBoUhi6hjwQ@mail.gmail.com>
 <CACeCKafya_XA+C3eJUvT4vjQSgsjdewVkCb+Jr2tA1605jjfjg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Jul 2022 20:17:54 -0400
Message-ID: <CAE-0n53kujMrzFG++5kaS4QKj2YrzLJEu5R76W887rCW_S592g@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Prashant Malani <pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-07-06 11:26:19)
>
> Stephen, any pending concerns?

No more pending concerns.

> If not,I will post a v6 series with the suggested changes:
> - Drop typec-switch binding; instead add a new top-level port with
> end-points for each Type-C connector's switch.
> - Drop it6505 patches.
> - Squash anx7625 driver patches into one patch.
> - Add a comment mentioning that we aren't registering the orientation-switch.

Ok. I'll take a look on v6.
