Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90215A271C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190E10E85F;
	Fri, 26 Aug 2022 11:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440D210E85F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:52:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id og21so2717351ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=F7c+2Gbw+Qrd9gUvCwl0Pftu63yApmzA2ACZpPC3f3I=;
 b=xJDmZVXMoghuYMQU9CAN/JMpsept6H1O606c2yubrHk9qwI/LKvKWgyRUEGABZV9ng
 mGqSnqQVCWMzCNNjfC1nglkL7+odXUHU54vEwBdWCqG0fFjXOXEoUglhnBp/RSXKar32
 n4snURvpTP1ML6PK08dPPQ9Cu4P7FPSIru8yZBytk1xvf/MIpWwP7+Hgfp+Mh7fA4IFf
 1VbmB6MkguWtfm1i3FNXF18QwEebgQtxMfwYEp0FRh/sHKVT/CoPEeTVLMgQL6UNTTVH
 v6tVVNjFoYNabFp/5fV5wtMIgVjmaZd/Ff5lroG1S3QcNGYay2v0FRrQS7Wm3WsNGAI/
 s6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=F7c+2Gbw+Qrd9gUvCwl0Pftu63yApmzA2ACZpPC3f3I=;
 b=4CCl8+PMvHom4zfuqkiXQ+Utj+JruH9eTe/JK14mvjxUHK0JtMlcxVp+NJyMmLS/dq
 7wjE5+ruExAzva45aKtjMAVsehFjrtboL0HnhHR/tILu3s9/m/r/0jTFl7QNpIz/2rBT
 9TEZBohZIMaMKqAmmQ0kT1w1ZO2mVkgcS8vPHqemKv8SDLezka7dra0BW6X+Us5BsAuN
 P1czwWkqNd9qD+W5gFN1O7v5tZKkYZ3LOcraN32jBLaSoa56RJasRFbHTGEdY7Ja3GYI
 2sNDJh3u7QqsHwzddCd0Fl4HEb+z+a7ng4T6na4gcyHhRJSNdFlq47ynOf9R8IYKKsbl
 wcmA==
X-Gm-Message-State: ACgBeo1Ssca9quSRvWYluvWp9W+TAbgcIcdrj4MFsLhqIkOLTegMcBEm
 B+QfISd13P2Xhk0XlBhtcbpxeBnzGvX/FO94sDeT/A==
X-Google-Smtp-Source: AA6agR5KEHIgpEYIj0xtbLXaCUUOqVHAM5t99tMYaMyFe1+CXyW9FUvMSfvvBNw68iA0QfddcJfhTLvP8OZlz24N1o4=
X-Received: by 2002:a17:906:478f:b0:73d:7919:b23 with SMTP id
 cw15-20020a170906478f00b0073d79190b23mr4905970ejc.690.1661514731763; Fri, 26
 Aug 2022 04:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131901.183090-1-marex@denx.de>
 <20220801163238.GA1130127-robh@kernel.org>
 <4d917546-23a2-a33a-1f59-ec78305aa854@denx.de>
 <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
 <4788af3e-b36d-fbe9-bd17-db1db85f1b7f@denx.de>
In-Reply-To: <4788af3e-b36d-fbe9-bd17-db1db85f1b7f@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:52:00 +0200
Message-ID: <CACRpkdZ9ZbspO8HGwsp+vhH5TZwwCOZ0n_wh7uJ8F14aaYtJjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for RGB/BGR swap
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 8, 2022 at 3:57 AM Marek Vasut <marex@denx.de> wrote:
> On 8/4/22 00:41, Rob Herring wrote:
> > On Tue, Aug 2, 2022 at 5:33 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 8/1/22 18:32, Rob Herring wrote:
> >>> On Mon, Aug 01, 2022 at 03:19:00PM +0200, Marek Vasut wrote:
> >>>> The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
> >>>> document a DT property to select this swap in DT. This can be useful on
> >>>> hardware where such swap happens.
> >>>
> >>> We should ensure this series[1] works for you instead.
> >>
> >> [...]
> >>
> >>> Rob
> >>>
> >>> [1] https://lore.kernel.org/r/20220628181838.2031-3-max.oss.09@gmail.com
> >>
> >> I'm still not convinced that we should encode this pixel format value
> >> directly into the DT instead of trying to describe the DPI bus color
> >> channel width/order/shift in the DT instead. I think I mentioned that
> >> before in one of the previous versions of that series.
> >
> > I worry that it gets pretty verbose, but worth having the discussion.
> > In any case, let's have that discussion and not add yet another one
> > off property.
>
> Done, I replied

So what is the verdict? Is this patch set dropped or shall it be
applied?

Yours,
Linus Walleij
