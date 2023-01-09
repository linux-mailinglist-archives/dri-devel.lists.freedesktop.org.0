Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECF66201B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EE710E290;
	Mon,  9 Jan 2023 08:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AA310E294
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:36:12 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 3so4166368iou.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mHG6QBVWalNbc6K28lbxbgnje/+7/XEu+lQ22LFlbhA=;
 b=RKb0bQ46rB+LGlcgXPPcXSNSsBvnsTEP2Ke81j6fsN0R18E5e0VfOaEeNTYQFYp3x1
 rQFXcYT9aKh2BFfqA/O8uH3QqudY/Yc8uhKMip+5WT6Rn1tw59rzHMo9cNqN3/zAz14j
 91oDYYt33C+AYk5ZdCGXa5TaDVBFg7RndXr/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mHG6QBVWalNbc6K28lbxbgnje/+7/XEu+lQ22LFlbhA=;
 b=jQmv/84cjozOsxotVKwpW2gOVpE1EmXWQiXUQMgYpRaKMOVKwXBrVjDgHJZCDVWCqi
 pMbwYtxwHjwVhpJygoK4oXJPjGfPVNyJhpKEzLqf+H6AksiaanYCqd/efhjU3RcyLfjh
 AvUykkN1sE8LRiNYBNk+7YWrshIgj37bSKlXhK1WgZWuhb1hWnXDYZFklz/MirSJ5Ot7
 xgEa2V2BrQ1vKG/xJBqrgqQR0/7T5Lggn0G7ZNg1/sjmKhR3QH/z3r//R1D/1dPkk8SJ
 qmUiYoG/rLXnu0uYPaazFkV1gL/atYkxmr0JekdUI9Mt8SGSFvALWssUIuZSOSRr2a0U
 0AJw==
X-Gm-Message-State: AFqh2kriao5Flw1aVCKFQlVeKgcqAWMMCH7SZxrQ0uqxh+9cYTEw020i
 HIYkVoc3F+1Dv24UAr62OyPk90kgkE4ySKUi8iI+lA==
X-Google-Smtp-Source: AMrXdXuhMXzijzQbdmdDY+GL4BvF6UUNKOAXtws2POVhvMJvpc7JldHYHGfsgcPDVIsfECU7qR+WcgzqvnWgYoZMK4Y=
X-Received: by 2002:a5e:c00f:0:b0:6e3:38c6:e35f with SMTP id
 u15-20020a5ec00f000000b006e338c6e35fmr5425568iol.153.1673253371768; Mon, 09
 Jan 2023 00:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20230107102231.23682-1-treapking@chromium.org>
 <20230107102231.23682-8-treapking@chromium.org>
 <7f672ee7-7b78-dad9-ca58-2eb4c2c2dd39@linaro.org>
In-Reply-To: <7f672ee7-7b78-dad9-ca58-2eb4c2c2dd39@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 9 Jan 2023 16:36:00 +0800
Message-ID: <CAEXTbpd+yfCeg+SyVy0gbhh4g3MHNhQXZFi7M5svDfkjfDrWpw@mail.gmail.com>
Subject: Re: [PATCH v8 7/9] dt/bindings: display: bridge: it6505: Add
 mode-switch support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thanks for your review.

On Sun, Jan 8, 2023 at 10:59 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/01/2023 11:22, Pin-yen Lin wrote:
> > ITE IT6505 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v8:
> > - Updated bindings for data-lanes property
> > - Fixed subject prefix
>
> How? It is still wrong. You have slash there.

Sorry, I didn't even notice that. I'll fix this in v9.
>
> >
>
> (...)
>
> >                  port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> >                      reg = <1>;
> > -                    it6505_out: endpoint {
> > +                    it6505_out: endpoint@0 {
> > +                        reg = <0>;
> >                          remote-endpoint = <&dp_in>;
> >                          data-lanes = <0 1>;
> >                      };
> > @@ -148,3 +173,49 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c3 {
>
> Just i2c

I missed this when preparing v8. I'll fix this in v9.
>
>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
