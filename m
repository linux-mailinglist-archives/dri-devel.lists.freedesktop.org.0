Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8441AB90B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB636EAF9;
	Thu, 16 Apr 2020 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA6C6E29D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:53:04 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a23so430319plm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
 b=GoFcaSGnLowNKUY4YRjMhjiMRBGA/jdKAlUVUZTQPxoBsFvIFSTTlnUehLhjTt6XW/
 pkYTbEE6cy80TR2qnidJEqejtnyMCFJlEJd5Ry68Rf8bPBDYeQI2nD1yeqTmG3b971Pj
 BWwmiYOx0iPDY1vbwU8QfuFYq/OFuzuNQYDwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
 b=opCVivok4PKXvntnZnDCqeHBFyDKqhevpnUyFf0RbtD4zq5zelAEF+TDhyJ9j+ueVE
 kNlxjMTVDqgjv5cYn9M2KdPCc7Dopk3kd+27AWTxVWWMo+9bDRqxoKPAtvQJYCJuL9ry
 oJJrQA5aFLfxnIHV2tSOY4nlEGN5Oq/I3MUnyeM5mqyKNp+0MAWHK3zbfYgUHdNeWXKP
 UwOjCljaYyagc7+zlKYiPakwInI3jONO9IuQFXOcmQ7H68nnnKxt8JTifb/xvCjmLf67
 ngUQVciONGCYSUxokdGytAFkiidMTsSPk/zSku9wZR4tKokpS3be4xN8ZVTE2+i1jPSS
 tDYQ==
X-Gm-Message-State: AGi0PubpmlY1o2jFZ6F/t35p38Gupq4TVc7SEilp5ealqOVEYZtSURHM
 DSycWU52aEzmajquhDeNtsjFqQ==
X-Google-Smtp-Source: APiQypKW2QCwYlYY+1tV4ZUdnxB7+EL5+2eKfXLs2OXbzTVeg9HjP9FGOirAs7OCA3jRywMzN3Tt7g==
X-Received: by 2002:a17:90a:17ce:: with SMTP id
 q72mr892159pja.139.1586980384222; 
 Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id x76sm14312883pfc.190.2020.04.15.12.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 12:53:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 narmstrong@baylibre.com, robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 15 Apr 2020 12:53:02 -0700
Message-ID: <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-15 08:48:40)
> Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> example.
> 
> NOTE: The current patch adding support for hpd-gpios to the Linux
> driver for hpd-gpios only adds enough support to the driver so that
> the bridge can use one of its own GPIOs.  The bindings, however, are
> written generically.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 8cacc6db33a9..554bfd003000 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -60,6 +60,10 @@ properties:
>      const: 1
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>  
> +  hpd-gpios:
> +    maxItems: 1
> +    description: If present use the given GPIO for hot-plug-detect.

Shouldn't this go in the panel node? And the panel driver should get the
gpio and poll it after powering up the panel? Presumably that's why we
have the no-hpd property in the simple panel binding vs. putting it here
in the bridge.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
