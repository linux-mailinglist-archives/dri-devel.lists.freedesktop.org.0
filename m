Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940A5620EB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632D911A99D;
	Thu, 30 Jun 2022 17:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156311A99D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:10:44 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317741c86fdso185769507b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C4tyH3Wyg1tODv7Sm2smKsBoDS+J8nqhwGQaq6vu3uY=;
 b=gnYGD2jS1FIJGGpq0jD3UITkms56aodG5VSVUw4KGb2NOASUoMBZF4GAF2pCZD4yuT
 1BUfIMSa7UwkVNInhHWxVQsdUY45IwPorOfEp3ZMwrgvpq7Eq/wAAm816woi+NAnVzkO
 puOGIsOCuaPz5ZUYu6Y4EcKmJFWfdgBhBGv2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4tyH3Wyg1tODv7Sm2smKsBoDS+J8nqhwGQaq6vu3uY=;
 b=wgBwOhOHR4GTlI6nBsoeAwDEACJZEJRKem9WqRlNS0tWEOWXv9AGgVAqL7m24bwA1p
 7ORjLTcujvT0B6ALvOAfxc2EzzCfPkTDkzHuAP21rBx95xy1/qH/6Dwg+WgCh5T9Djjv
 Z9NFoDBB5Pswe8DY97nAPJkmM57lzB7DeWh2zCH7JuYwIwPF6fJDff9lldSuu8PUwYUS
 rA8lyyy38+GPW+C585MVPV6FHvDYjqbfhtBTJoz9YTROoltntSm+EKn7i7ghRrn7Vjz2
 ztCE0UrlAhRYLa/wb+x8ITMC+YI+kArOUafDWe1NLUi7vBd4wBYPcts9k2ONGkRdGpLo
 Bvhw==
X-Gm-Message-State: AJIora/PxlNAD7HVeZ7tKBGNURFEcXtC0U9Myf6L1VChTmGNltXa3bY5
 rz+QUqj3TteEFFs+u9bhR/2Z9zGI4tMLwKzvmzjOI/agFGs=
X-Google-Smtp-Source: AGRyM1uMIL9QXjLW/PVKIiDg5RY+SUgQa/orAvMkYfMDivtbvx25fWOLwDlCvs4yZik4khUw0Q+DzoBnfW9oVFDgjCg=
X-Received: by 2002:a81:5745:0:b0:318:99e6:3279 with SMTP id
 l66-20020a815745000000b0031899e63279mr11262932ywb.311.1656609043950; Thu, 30
 Jun 2022 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
 <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
In-Reply-To: <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 30 Jun 2022 10:10:32 -0700
Message-ID: <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-yen Lin <treapking@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(CC+ Bjorn)

On Wed, Jun 29, 2022 at 4:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-29 15:55:10)
> > On Wed, Jun 29, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > My understanding is there are 4 DP lanes on it6505 and two lanes are
> > > connected to one usb-c-connector and the other two lanes are connected
> > > to a different usb-c-connector. The IT6505 driver will send DP out on
> > > the associated two DP lanes depending on which usb-c-connector has DP
> > > pins assigned by the typec manager.
> [...]
> >
> > We can adopt this binding, but from what I gathered in this thread, that
> > shouldn't be done, because IT6505 isn't meant to be aware of Type-C
> > connections at all.
>
> How will the driver know which usb-c-connector to route DP to without
> making the binding aware of typec connections?

I agree with you; I'm saying my interpretation of the comments of this
thread are that it's not the intended usage of the it6505 part, so the driver
shouldn't be updated to support that.

>
> HPD can be signalled out of band, or not at all (no-hpd). I suspect it's
> valid to ignore/disconnect the HPD pin here and start/stop DP when, for
> example, the HPD pin toggles within a dp-connector. HPD could be
> signaled directly to the kernel via an out of band gpio going from the
> dp-connector to the SoC. In this case HPD for each dp-connector could be
> a different gpio and the driver may be required to arbitrate between the
> two dp-connectors with some 'first to signal wins' logic or something.

Sure, it's possible. I just didn't see anything in the anx7625 datasheet
to suggest it supported 2x1-lane DP outputs.

For that matter I don't think even it6505 supports > 1 DP sink (based
on my reading of the datasheet), but I don't have too much experience
with these parts.


> > My interpretation of the current mode-switch search code [1] is that
> > a top level property of "mode-switch" is required.
>
> Yeah that's how it is right now, but does it have to stay that way?
> Could the code search the graph and look for a matching node that's
> registered with the typec framework?

I'll have to get back to you on that after reading the code a bit more.
Maybe Heikki or Bjorn have some comments about it.
The ACPI Type-C ports do require a device handle labelled "mode-switch"
which points to the switch device.
