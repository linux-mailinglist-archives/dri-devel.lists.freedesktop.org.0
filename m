Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9546EE81
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84AF10E34A;
	Thu,  9 Dec 2021 16:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F64B10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 07:08:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x6so16366668edr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 23:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChkLI7VHoNsJE7+WbzM7VYIiW7/FpdqY5JZPm/p6Dmc=;
 b=daTWLOGbyL3rDlqt3K4wAXwAZt2Zi2ok6anQj7AyGgNeQUo4LTgluX2VGbGdADqTSZ
 9ddk0KKdJFzlVehfl//nIz7ABiBdz+T+ucbdU86cYfS3v1GMKZdzZp8ro3osfvcQAw7x
 ZpN76qldh9iqlT9Y6ifBZ/6nSE1MNNRYhkg0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChkLI7VHoNsJE7+WbzM7VYIiW7/FpdqY5JZPm/p6Dmc=;
 b=nDf2qCfFbPBhnVLO7Mjn7Rmr/Y+pIgv0DU3100xsrddaZbeTCjkd4ZPy8h17oNXfKM
 3fpdd7MUIycspQ2MKQkwvlsqD7JXLCnkEi2Lm54SzaM8y4E2yfQO2Cak5FDPFUJUZv1y
 PULtauKM2o5P6KndozeRYjIkj5f0WlFb1mvIFO07OebCwZgsbRvD5QVT1W08ri02jA0s
 KeZ5M3AVxKdJyC6hE7iwz/ucbfm5Yx+ph/85ePuX2TlKts6IRm9XBk0lAyaGkSRkNQY1
 u849TXXogJkGXEtRjC3qe2ffarXf0o0cDNDfxjbLUESVVWetzEisG8eGORsM+b3UV4S0
 8RCA==
X-Gm-Message-State: AOAM5315By/5qJGrJX+TxF3+HAPU6uyvjNUd/gkJKdbHxqGIeCQPgXor
 IM1OU3rmz3Yq8STrkvub7NOPgWkwSUXaOlbJEivNWw==
X-Google-Smtp-Source: ABdhPJwG2HgYsRmsj5taDUlEFH2BHNT+lWwQqNutrBbXxZR42AkgPINsP7gCluVxlLuxTi6J3/cJLZZGfthDxgLzcEs=
X-Received: by 2002:a17:906:e115:: with SMTP id
 gj21mr13603496ejb.348.1639033725556; 
 Wed, 08 Dec 2021 23:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211118091955.3009900-4-alexander.stein@ew.tq-group.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 9 Dec 2021 12:38:34 +0530
Message-ID: <CAMty3ZCffJ=Oi6_mc1b5bpWbD8WAm2scU7gW_xthLZq8qbN8ww@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Add a VCC regulator which needs to be enabled before the EN pin is
> released.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index c3f3e73f740a..48a97bb3e2e0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -32,6 +32,9 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for bridge_en pin (active high).
>
> +  vcc-supply:
> +    description: A 1.8V power supply (see regulator/regulator.yaml).

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
