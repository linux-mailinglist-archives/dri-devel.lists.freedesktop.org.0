Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAA83FEF4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 08:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540A310F564;
	Mon, 29 Jan 2024 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329B810F564
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 07:17:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-510f37d6714so1512567e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 23:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706512587; x=1707117387;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKVjPpRBlhrSt/tEcTU8BHnh+3o7uF091QzM4ro5QmU=;
 b=nS/fdGEQgPK2d7DILCVfDv+OXePcBApsgNMF4BaljN1PhGEAGBjeuKDoDeQfB108kA
 BGJnuW2m6OpLFUpAvQ7y7MQdBsFZyvefwDhQY4SEX8z8gK3EUmpAG3yRSnF9wRNRGAZl
 V2IoVFwNKiNlAeqPo069AgRR6nHCqX9BvcStQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706512587; x=1707117387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKVjPpRBlhrSt/tEcTU8BHnh+3o7uF091QzM4ro5QmU=;
 b=Tpgawo3dGFIxcHLEv8BG+Zsj3VNriRnkWrzdTBNpwbg/XTEUKwULgO1kCH0/lAHfQN
 oH6q273ERrv/ZrpffdhsM93echCDhEKkyTR4Hggy/EtQQ78Ao+X8ByJ1BFLE/dT4YtH0
 rlN3UxKfXiAty7LTZjQUj04TdtA4maqbzwc3oZkoPl1p1IAKYjYJbssaGuvrpCtcNB1D
 DEvy9FT6Pzhe4GlxdK3KLgRIIt0zPJjANOINjhdvue1U07kDD1fcBrTjLVqH2KxGsddZ
 9zGY16NAyKvgi3wSZtVPLhDSlgEYfC03C2M+oMY80QxEIl5UMzsj1CDhWlHoS60KHnmv
 A0vA==
X-Gm-Message-State: AOJu0Yx5ZEYNjIQZ71XGRXKYUOiTKdhOqtWyTAfI1dawc3I60YXK6F7U
 42pjMXMwx1WJMkirLSCUEm+zDoxrM1D8j9bbSCYJ7u7vy3zN4KQniekGVvYDMjt3PoNb4CE6r3f
 L6T4ABwFjzCobeEKGRjrfjcdm2KxddxHzAmaL
X-Google-Smtp-Source: AGHT+IEb0p1syRm7CrHn7mmVEwAtW1jrbzLAGOaEIdkZmX7QHvHCjeBg+3TTT52oNs9z67jT8ZgnE281V4VmoPUshog=
X-Received: by 2002:a05:6512:201c:b0:50e:ca2a:50f8 with SMTP id
 a28-20020a056512201c00b0050eca2a50f8mr2832350lfb.63.1706512587448; Sun, 28
 Jan 2024 23:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20240126073511.2708574-1-wenst@chromium.org>
 <25e0a1c6-70dd-409b-927b-ef113e6a4cc4@linaro.org>
In-Reply-To: <25e0a1c6-70dd-409b-927b-ef113e6a4cc4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jan 2024 15:16:16 +0800
Message-ID: <CAGXv+5FN+=Y-c74R2WguvP_2PZwArvsNd2SLy=aKEs06A4NhPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: it6505: Add #sound-dai-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 6:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/01/2024 08:35, Chen-Yu Tsai wrote:
> > The ITE IT6505 display bridge can take one I2S input and transmit it
> > over the DisplayPort link.
> >
> > Add #sound-dai-cells (=3D 0) to the binding for it.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > The driver side changes [1] are still being worked on, but given the
> > hardware is very simple, it would be nice if we could land the binding
> > first and be able to introduct device trees that have this.
> >
> > [1] https://lore.kernel.org/linux-arm-kernel/20230730180803.22570-4-jia=
xin.yu@mediatek.com/
> >
> >  .../devicetree/bindings/display/bridge/ite,it6505.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it650=
5.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index 348b02f26041..7ec4decc9c21 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -52,6 +52,9 @@ properties:
> >      maxItems: 1
> >      description: extcon specifier for the Power Delivery
> >
> > +  "#sound-dai-cells":
> > +    const: 0
>
> In such case you also want to $ref /schemas/sound/dai-common.yaml.

Ack. I assume this also means I should change "additionalProperties: false"
to "unevaluatedProperties: false" in this file.

ChenYu

> Best regards,
> Krzysztof
>
