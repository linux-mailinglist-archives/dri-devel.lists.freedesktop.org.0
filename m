Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A29573F40
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033C10ECB1;
	Wed, 13 Jul 2022 21:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF7D10ECD7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 21:58:18 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ef5380669cso126663147b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Y/kMPSFak6KTkDH8JrbRublyvpU6jPq482xurs5eSI=;
 b=Pg8WFVRV86+5cOKU60Qmv48iCaAGyTTjOhRWK3NKVzBIbS/gpDDLSZqiEOvAwGhA1w
 eC+Rpyx6Ranio0sdXI60+nvvCdWxK/oy3Lg5TfHGhVqSseUCZiZFdLIFn3WE5gmHC+Iu
 eGp12EEND6O4XUTvWCyBwcnm44P/YV+oYrBVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y/kMPSFak6KTkDH8JrbRublyvpU6jPq482xurs5eSI=;
 b=lO9qLizQP4RyqVGyUf8a6bYjJC5lSiu8JFbDmBFH5SSYSIUGVUlqUoq9uvKc3R4S/C
 yJuA6immgKmicvJsmxfiw5scsSmAPy7ouWTKxC4s4Prx4EqkWOOP6sufq9JzoKYCgdJX
 9cNKPfFFFLe5ZljcktyPToBKdAiFuW0z+ma+GdlDMjONnLerEEosgOzAkMg3ySLX5Ajk
 n2H+zR+faY7cScK+QAnzdAws3N8FNpqn0pcbMnuSsZopUhI/axnr2+d/cZmhMXXZJIlX
 4MsK7gyr7ykI6p4uEwQL94aPFf2pDEkn9Qn/tK3dVK3+FRRK5KjjDjUkakg0QlMCH4Kr
 wGfQ==
X-Gm-Message-State: AJIora/eFuKvF7z2QRoDMFLi6AlCwkwglCym/iDPb84gCw02uzPNt6YJ
 o113pXK3HPwxmQf3l+AmxhQMnQG59yCnjNvD/7gbJA==
X-Google-Smtp-Source: AGRyM1uOLl/nyHKXS2jhjDxyKbBGONhgOkRFVWmPxxPn9Mf/Wi0UT72Je7hCFLzPAuLiJemb/Bk4TEMynSpqwiPKvDM=
X-Received: by 2002:a81:7b8b:0:b0:31d:17d1:4666 with SMTP id
 w133-20020a817b8b000000b0031d17d14666mr6695386ywc.269.1657749497528; Wed, 13
 Jul 2022 14:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
 <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
 <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
 <20220712174551.GG1823936-robh@kernel.org>
In-Reply-To: <20220712174551.GG1823936-robh@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 13 Jul 2022 14:58:05 -0700
Message-ID: <CACeCKafRuzk3nWbkgjM1kz9aUhcnttaVq9P1q9M8Pfba-hBpvQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Rob Herring <robh@kernel.org>
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
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 10:45 AM Rob Herring <robh@kernel.org> wrote:
>
> > I agree with you; I'm saying my interpretation of the comments of this
> > thread are that it's not the intended usage of the it6505 part, so the driver
> > shouldn't be updated to support that.
>
> That's not the right interpretation. There should not be some Type-C
> specific child mux/switch node because the device has no such h/w within
> it. Assuming all the possibilities Stephen outlined are valid, it's
> clear this lane selection has nothing to do with Type-C. It does have an
> output port for its DP output already and using that to describe the
> connection to DP connector(s) and/or Type-C connector(s) should be
> handled.

Got it. Thanks for the clarification.

>
> Whether the driver is type-C aware is a separate question from the
> binding. I would think the driver just needs to be told (or it can ask)
> which endpoint should be active and it just enables output on the
> corresponding lanes for that endpoint.

Is it acceptable to tag the end-points with a "mode-switch" /
"orientation-switch"
property? Something like the following:

```
        dp-bridge@5c {
            compatible = "ite,it6505";
            ...
            port {
                #adderss-cells = <1>;
                #size-cells = <0>;

                ite_typec0: endpoint@0 {
                    reg = <0>;
                    mode-switch;
                    remote-endpoint = <&typec_connector0>;
                };
                ite_typec1: endpoint@1 {
                    reg = <1>;
                    mode-switch;
                    remote-endpoint = <&typec_connector1>;
                };
            };
        };
```
Or should the DRM bridge device binding not have those properties in
the end-points either?
The reasons those are required are:
- The Type-C matching code looks for the "mode-switch" identifier in
the fwnode while performing the switch matching [1]
- While we can look up whether the remote-endpoint is a
"usb-c-connector" in the bridge driver the
"mode-switch"/"orientation-switch" property tells the bridge driver
whether to register just a mode-switch, an orientation switch or both.

Best regards,

- Prashant

[1] https://elixir.bootlin.com/linux/v5.19-rc6/source/drivers/usb/typec/mux.c#L347
