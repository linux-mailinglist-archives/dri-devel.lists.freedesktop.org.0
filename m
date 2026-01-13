Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DED1840C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1C110E323;
	Tue, 13 Jan 2026 10:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FB310E323
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:58:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id
 46e09a7af769-7c6cc44ff62so5896075a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 02:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768301893; x=1768906693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MR0NoHyZdJndLOZGMkASZoG8F5TIOzALE+PpGAFfY78=;
 b=IsIZsRJ75epabrnRzfUwBM7wMfEwUvcWgm2ks4UaFo4gSVMNHlg/jugF6HIuuKEVtC
 8T3CWrVsnUcy6INPmRW+vDw8D4QAPsks7o8quJnnEIM/iXqRCImtGRc3Cn4kMhf6b+WS
 lRAdJZBhtapEb4MH+H10yt/qOG2Y/4JSHZYbcJp8/bMU67hd/WQ80bXo2g7ymwLsOiqu
 b81oFQYGtMe/x9abaajFLpScOAHCI9577ymy99dJxOmkn7JJ0Mu6tlBIPVduFPyqZnmp
 64cXn9BzFt7Uxo5bHYzLXzXojyiK+7LeAbNkOVr8zcryAvKcQrSmUyuOmcFqZt8C9jNQ
 98nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVULhSk5u9Nd7dGjNo/EPthG4JQ6E9hhUi8rZTdIcZDuOrWI1RYBVEYPphUZZYcv5KXwHe7Gu5RAj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV0vzlAB5R9HqI73p5m1lDbt8hv/H8q9z8sTljwJILpJAtik8h
 ptwWwWuiUt+Iu5/Vzdn9gg6MlmsDmkPLLZha8+d38sKZBMWVJvOIdswBvufFe+n+xOs=
X-Gm-Gg: AY/fxX5H1v9iXCIZbgLoE28TznAW8X0TV6Wu+u9KQ9OgO0k14+mQXBSVrEZHWjLFdt1
 1HJItVZmiQx8midn8nRJTPVWWIAQBE2/rWyMVpk0YzGqC0P7asROLDqx5EDLP1kAQfFxbMu9twH
 fJDGYLo0zqExakEUCQtRXZIVKielNPr5+icvBJSjhwGAnXwEpDSezDOVcoj6LIZJE941PVPbiu6
 MFvs2HupsTSkv5gGUizzqkLfdySpoMb/vFHMZscyakCk3BpUUUCczxXHw2q27RHuHqe+JlFejLd
 R9ZGPIMTvGaxuRUjLYpdEaH/yf0zTV24IWRcPqStZ8fcZfvkx26fCi/B2Pb11DaPuRDz0NzdQI2
 Bt6dJg6fIBv5Gx6WV5IuXuaPnOABDkNs+vLCvt8jQtzjdkC+iPbbvc25P4/Ww07JYImZ+cl+ZGc
 0Sy+xNDHJuK1TE37bjOD/WEtnfg52bzmh4xSX6N4lgY4HxBJM8
X-Google-Smtp-Source: AGHT+IHehMAvT4hUnkoXYjoLSl0ck7VVq/Fl8Go1ybdnZpTlCTdNfej5TclV1V/OnoYyKdljFBZxAA==
X-Received: by 2002:a05:6122:1d0d:b0:563:72d8:ea6 with SMTP id
 71dfb90a1353d-56372d810f9mr3984400e0c.10.1768295620786; 
 Tue, 13 Jan 2026 01:13:40 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5633a1ea810sm18870664e0c.5.2026.01.13.01.13.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 01:13:40 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-9412edb5defso2042750241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW+qBYnn9AITFcgDyUAd6chC51lI2NgKWgU6aXmirNIH+TEhobLMe9yByeR/9G8sncs73+4doMOHbc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:419e:b0:5df:ab05:d846 with SMTP id
 ada2fe7eead31-5ecbae4aedemr6860725137.40.1768295619640; Tue, 13 Jan 2026
 01:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 10:13:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
X-Gm-Features: AZwV_Qhh8RJBBYa7gKoAKpUlBeVNsz1RZyqK3-3_U_RszPPYx3TukXyRJOwF8cM
Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

Hi Marek,

On Tue, 13 Jan 2026 at 01:07, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.
>
> While these panels are described as DPI panels, they are generally part
> of a larger unit in non-removable metal casing, so the actual internal
> configuration is not known. It is likely that internally, those panels
> are LVDS panels, connected to ICN6211 DSI-to-DPI bridge and then another
> unknown DPI-to-LVDS bridge.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0

scripts/checkpatch.pl:

    WARNING: DT binding documents should be licensed (GPL-2.0-only OR
BSD-2-Clause)
    #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:

which matches what panel-simple.yaml uses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
