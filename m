Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772540B7A8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A776E59F;
	Tue, 14 Sep 2021 19:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED7889152
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:11:58 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id p2so692234oif.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BSSwT7oxjsgFOMu+1NGwhgQtpViayCWoOwG64CMoBRk=;
 b=hDSs206v3195Y560qB95htiH1r7XdiqlWoYYGIMmZKsme0wdt3U7Hl0DEmzORETQAl
 oY7mro96c7tw05FWPje4aYkbJ+sv5WycBN3Nw5uuG+YACDPdMvZNHwpOSPLMWJ5tSv7Q
 K57nIq7SsAR9mAnQlW2a/GH3wsihNJPESaOnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BSSwT7oxjsgFOMu+1NGwhgQtpViayCWoOwG64CMoBRk=;
 b=ef9Bljez1AHK/zDdMjQwJkapk7UUMwjuwvWL7SN+S725p/Jgy3NqbZpw7WnMf6G7Mi
 TvUwRtdX7UxHeVnuJvNyaA9I8cIpDaz3UAJPY8K5l1iH0Df47vRl6gmz6nJjQxuI9ZPo
 vz/Ejy7UISowK2gudgsZzMsZCSqjrOaOTqL20qkqXu9CvdSJmbbMMfo0ACPjumIcLwpI
 SMo8UulKq8eblpKay8oFMcmA1EmNwy3B87OBRmw0OS8LMhLXKZY2hu0j6X7WBsBPgqgB
 NOAl1L1lAymiOYrU/7t5cT0Rv1LdR1PuUxtcmIM+d7eNFLgaQ0VnIOfSZzvwLjEkKVpD
 fxFg==
X-Gm-Message-State: AOAM531rRcBx7qlnk4BKWrR1fRdcGNvCdWVyDUjkzg9EDfsgJXkF5C0q
 5e+dgc8GxRsrWdSayhTs4gUGjDObNbZCDgyus6b/Qg==
X-Google-Smtp-Source: ABdhPJxj/G3bL5HF0hTnBTg2JQFv34CpmMFfj/HJPwzL7skUSH+a239+sjhTD9p4IGQVFNxccYFtNL83KeC+Bp7Fvi8=
X-Received: by 2002:a54:4419:: with SMTP id k25mr2725351oiw.32.1631646717560; 
 Tue, 14 Sep 2021 12:11:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 12:11:57 -0700
MIME-Version: 1.0
In-Reply-To: <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 12:11:57 -0700
Message-ID: <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] dt-bindings: drm/panel-simple-edp: Introduce
 generic eDP panels
To: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-09-09 14:00:17)
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> new file mode 100644
> index 000000000000..6a621376ff86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Probable (via DP AUX / EDID) eDP Panels with simple poweron sequences

Should that be "Probeable" or "Probe-able" or "Detectable"? It's not
about statistical probabilities right?
