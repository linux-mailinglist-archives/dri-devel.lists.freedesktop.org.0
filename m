Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAEA6373DD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3C10E263;
	Thu, 24 Nov 2022 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1A810E263
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:28:09 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l15so691659qtv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dwqo+aPqDnP0bEZRL6rSm5BGllSO4V9pda1/2AYM1HI=;
 b=sSgSCxA9CmHz1t+3i8r2zRr2B0o3zG9xnJVDZILcjD9UcLGu+0FMvKozovUS1oizbc
 wSEjzv+KIY7zGBNsp9hVLLMEzObkcqeqV5NCA/1nN7ZhUE0uFPevX6/CP1XZ31P/CCiY
 oCb+jbc3gfp1dJQAwSQYwMz8gN+3luz/KKu2QH5AFwYOSTeWyfwZ97NIsbJC1PnBeKeW
 qnaN5YHWf9MeVjLyxUY2xCv7u2Aae1PV9gd3ZtvbDHdKR4mrNPtQAfBb2WpRyfdZKpdC
 ICRocFlBZofWs5nm9wvqZpz1OzT3N/164Li7mPSqRCwZC4Z0y/xQlHUfZrVSZsqSyCeK
 WWIA==
X-Gm-Message-State: ANoB5plUdsDRC2lkq2CQUgwQe25qvisxftHSZg6kuBLmNHRXtVGuImGB
 BwQ6uHboNobhmLmXdFJUXY3HMnxCzY7E3w==
X-Google-Smtp-Source: AA0mqf6+cWajwbWkvp9cjP2NqmbNt/JnMLkazByJR8VwL9I4hv9p6OcLmFMimRMPsIwdagfdzTrrvQ==
X-Received: by 2002:ac8:4787:0:b0:35d:a08:70a9 with SMTP id
 k7-20020ac84787000000b0035d0a0870a9mr13912295qtq.680.1669278488687; 
 Thu, 24 Nov 2022 00:28:08 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05620a424a00b006cfc9846594sm487761qko.93.2022.11.24.00.28.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 00:28:06 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 1so1046986ybl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:28:04 -0800 (PST)
X-Received: by 2002:a25:8249:0:b0:6dd:b521:a8f2 with SMTP id
 d9-20020a258249000000b006ddb521a8f2mr10946728ybn.380.1669278483856; Thu, 24
 Nov 2022 00:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Nov 2022 09:27:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWW7vG+EQ3hNcNxuPpMaBLtLztEpZC1Y=0f4MUy9RN67g@mail.gmail.com>
Message-ID: <CAMuHMdWW7vG+EQ3hNcNxuPpMaBLtLztEpZC1Y=0f4MUy9RN67g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 8:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
