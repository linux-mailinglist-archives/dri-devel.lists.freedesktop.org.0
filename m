Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FD5587B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C5B10E2CE;
	Thu, 23 Jun 2022 18:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684E510E2CE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:37:20 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id o79so551828ybc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+06H+RDgwvHqnW/mu3jxtp3uKGDdYaMeztRhDlRy+2Y=;
 b=M2d16jISsGOMxbNgUi6CrTcuiHAo8b4VfVws/IvmWXbja3y8S3/EyTmrk2MgkxQb58
 D8/UBc0Y2FUWCcofnX3ffMY/En+VFhCoVFWi4pUYKiISYOQr5gW818W1LIdjbVOEQO2F
 6fxHdW0MNcHURmuzQzoO4ksxV1gUf3uUQJ7C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+06H+RDgwvHqnW/mu3jxtp3uKGDdYaMeztRhDlRy+2Y=;
 b=NGZ/XKwdTr4Q0arzXfVYvuQndxNr6sMbka8f07528sMCiNlpoYP3Fwainm4GJgedyo
 2FFGjOoywDqx188/q33g9AJq7j09teieJHITCtVQ9JWFmPXAHEHtZI4bbG3NfAxGP/UI
 A79qKjzLTG+1In/lv/Q0vE9UisiXOszs07AIJ+xEhzaF1OmqbkmIgnw7ZG3wE6ikqV2s
 3qvuYagjsUl/Eayc/mCzagfrikV1GKHbSimqRU4aZXNkyez2KiHpyWLkvMsASMz7wkBG
 kj9sHWwWdWn8SEdL0tmLsBy2rBFjd/AxNgz1SORo2KY0bXJkofT5xk8oWkEHgo3hZpnF
 RNmQ==
X-Gm-Message-State: AJIora+rylBJ29Rq4mt9jKkE5gLKtvATufzWoNAl0OiV9+nEpzkK4M6y
 t7tlemlzdORa/yYMexwyGW04MrpBawMkatjjyJH1mg==
X-Google-Smtp-Source: AGRyM1tJ0GnhcxV8bocJAnR76WzFGYTbHrhGTY+yB5tG8hUuyoQw0mZK9As6rHzHY1b4q130MyyvmWi36ZZuF6FRnyI=
X-Received: by 2002:a25:9d89:0:b0:669:31d4:7cd9 with SMTP id
 v9-20020a259d89000000b0066931d47cd9mr10937558ybp.294.1656009439543; Thu, 23
 Jun 2022 11:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-7-pmalani@chromium.org>
 <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
In-Reply-To: <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 23 Jun 2022 11:37:08 -0700
Message-ID: <CACeCKaduttgNfxyzE2_7eD1N4NLNp_8J1EaWTnn+eqp+_P-i1A@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
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

On Thu, Jun 23, 2022 at 11:24 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-22 10:34:35)
> > From: Pin-Yen Lin <treapking@chromium.org>
> >
> > ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
> > alternate mode lane traffic between 2 Type-C ports.
>
> How does it work? From what I can tell from the information I find when
> googling this part[1] and looking at the existing binding doc is that
> this device is a DPI to DP bridge, and it outputs DP (probably 4 lanes
> of it?). Does the 2 type-c port design work by transmitting DP on two
> lanes of DP for one type-c port and another two lanes of DP for the
> other type-c port?
>
> DP could be one lane, so if this device is able to output one lane on
> any output differential pair then I suspect it could support 4 type-c
> ports if the hardware engineer connected it that way. Can you confirm my
> suspicion?

I will let Pin-Yen comment re: this hardware, but 1-lane DP is not a
supported Type-C Pin assignment
(as per VESA DP Alternate Mode Spec version 2.0 [2]), so the H/W
configuration you are suggesting shouldn't be possible.

>
> [1] https://www.ite.com.tw/en/product/view?mid=45
