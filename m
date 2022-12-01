Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B030B63EC9A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C80510E592;
	Thu,  1 Dec 2022 09:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AA710E592
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:34:39 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id v8so729472qkg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KBTb30FlOeNn7g2bMTV3z6C876wmi9foz5yxG1pCxwA=;
 b=vfL7Jjbh17k7Kx8SOFYwM1SsTWe5n66XIC3s3xR7TWjfgUtA58eLk+YCNgTNIarw4Z
 Enavxk+PANqmX/8nDyWsID7uR8oVRtJjNuQ7+81gmTcArgpckmsZYq9+ay/G6Qp2nO+Q
 I+2TaxERFVne1Dw9XzmwklmTyuzp7OY8olWeK7o9xg1BewEnhb62EvhLkq2CxvPzaihu
 zTESEtRbTx4LaK+Yysn9KyLyZaRH4dEkgzjfAPgGLfOGFAv4ylcp1rI9GRzrNknU7PJX
 eOsa2Z2jfhWhVMPjeDmDl5GsLeDmbSVTzg4i87Zdxgo7z1pazAZCo9QpBPZtiNmDXZmk
 NKPA==
X-Gm-Message-State: ANoB5pm/4a8Q+Rx54ZCwsu9c5po/u2u0DS8eB02q59e9EQXa6cCCegC/
 q0DL20NwJage9OaF3gBcSzvvBMlgT/5s7Q==
X-Google-Smtp-Source: AA0mqf6ZGD70tqg+SIcn08vxHxFDyfKj2jK0qYIP01GFGSMdR+dfa7q0AytGJDSy4gIsS6WmQmbcWQ==
X-Received: by 2002:a37:ad0c:0:b0:6ee:91b3:2484 with SMTP id
 f12-20020a37ad0c000000b006ee91b32484mr56709205qkm.648.1669887278580; 
 Thu, 01 Dec 2022 01:34:38 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05620a400100b006fc2e2198easm3106459qko.95.2022.12.01.01.34.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:34:37 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id z192so1338098yba.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:34:36 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr10068854yba.380.1669887276592; 
 Thu, 01 Dec 2022 01:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-4-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
 <cb85e1f4-2292-19d4-2b7e-f16c1b43d29f@ideasonboard.com>
In-Reply-To: <cb85e1f4-2292-19d4-2b7e-f16c1b43d29f@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2022 10:34:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXH+CfOMtnPUecfAW9U7+WugbytkG5_P-wu=bk6JygLGg@mail.gmail.com>
Message-ID: <CAMuHMdXH+CfOMtnPUecfAW9U7+WugbytkG5_P-wu=bk6JygLGg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: r8a779g0: Add display related clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Dec 1, 2022 at 10:06 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 30/11/2022 21:18, Geert Uytterhoeven wrote:
> > On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> Add clocks related to display which are needed to get the DSI output
> >> working.
> >>
> >> Extracted from Renesas BSP tree.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > Not that all of this matters a lot: all of these parents are always-on,
> > and I think "dis0" is the only clock where we care about the actual
> > clock rate?
>
> No, of the clocks added above, in the drivers we only care about the
> dsiref rate. That's used for the DSI PLL, and that PLL is used as the
> DU's pclk.

IC. As the DU node has only a single clocks property, I thought that
clock is used to derive the pixel clock from.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
