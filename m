Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BF64D9D0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412D10E524;
	Thu, 15 Dec 2022 10:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8910310E522
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:55:36 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso3339303ott.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KCza8Y681Ao9e1rZQSUK5V1OXCO8eMctom4dqQfNHfc=;
 b=fAB7Z9WfgmVcTkFWFzFuxR5lftYNCATZdu+ycm3oWGD8yZFVfpvyn2b90dZwd4q5Ro
 BW1pBNqTY9SzYkA5f0b6VeyLzdjPdH6Jblhf4sNHuuv/jmwhNFN0YJnXFZEskaVWkl1J
 B2LXpmfUf9OVko8KgujbHoKBZ5c5e+KTwwEz9tHHvvdNY/RFsnevCNf9OgCuQF4ZGey7
 wYn3oFQlUB7vhJPBprKglwdDE+owiBu5VKppU+IT9ix8tFrlQS8pG+5hldjeUzoLkPvL
 9puEy4LT93lvLyr3H843v84+otu09aBiATP0M17x/5P9l5EMJ8o03PYjUfx6ncFVIoZD
 unQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KCza8Y681Ao9e1rZQSUK5V1OXCO8eMctom4dqQfNHfc=;
 b=jKFXMXvF56TfdHyBAj6o5hRJj3lQtA64tC4EMrI2nZ92rXYd81w58tKLbhpGSIuqFJ
 ABtV55mQIHpLVf2R3ZMO2TOTr5UakKypa/mZqs5TuZwgk78Lz8W7nKGpSORwAXbRqGnz
 C3Dmg3e4Xz7NucagaxXuU/DdobasO7mnwkWrq1bUTbTqraerHXrcfM08QZX8sR0wTkn+
 9eIDR3a7akHIwHLuIDS4L4W+tTvfS0XO/a1JQnPH7HIsGVS14AH5+Ah3Mweftqxi9fsW
 uoNTMlBpPq5Gel+LPUDcPr0PQnAxDbgEUV2Yu9m+xuKQoTAaeXbL2rh5eCu5oXFodOm1
 RgBQ==
X-Gm-Message-State: ANoB5pnPKQXbohxPFMivvZ21C6RQpAqRmP/F6WrbgUppaIDEjwqPZiXk
 Iyw0+etGEHTj7soneFHcAuEeFEreMQ8jHWFqRu/hFw==
X-Google-Smtp-Source: AA0mqf6vsiFLO4/fq3hCYI2rVV8TLsFliRqkLUvOPWWBRTNBOF0C+HX+cqTaN7IbwDGYSImtaqxOh0Nf19rdCpKkX+Q=
X-Received: by 2002:a9d:6a42:0:b0:66d:a838:aa60 with SMTP id
 h2-20020a9d6a42000000b0066da838aa60mr46266563otn.104.1671101735831; Thu, 15
 Dec 2022 02:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-2-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 11:55:24 +0100
Message-ID: <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:58, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add a new ite,it6610 compatible string to the IT66121 binding
> documentation, since the two chips are very similar.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/display/bridge/ite,it66121.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> index 1b2185be92cd..72957be0ba3c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> @@ -17,7 +17,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: ite,it66121
> +    enum:
> +      - ite,it66121
> +      - ite,it6610
>
>    reg:
>      maxItems: 1
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
