Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14090B53565
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769C310EB50;
	Thu, 11 Sep 2025 14:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACFD10EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:32:04 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-544c796daa1so249070e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757601124; x=1758205924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuG9v1lMTLeiPKsVMgrQ/1maaUsWmMhO6LZ+84EqcRM=;
 b=OPnPJ0k6DFV1PQpmpceIrTIdbOHuUWC0el/DySXMh9ffVQZHjdov4MABYi+n4Y2TUl
 4UG9RrAf38wGLu1ViynrSa3Fd8wmhO05JnWs4sDjvBi/X2VPdliWKyd0d4OK3po9lAg3
 GoCYDmeVyrDp4aoxvL9EYMf2/AelHyPTtlBbrzxFDCU+LIkI1Z1/6Rcx8uEwANr4eu8+
 F909hvHhQYvJeg6Dhw1k4IsJQocussuX1VhlTUDWF7u40K/RAKXoHJ0uJ267G4IuoRvg
 +uGEDD8rGGXgmd2SIrZRh8Y9FSJpgHOOVlOVNYzAeEWH20dp2MuLvST4V7nda/Kw+r20
 G01Q==
X-Gm-Message-State: AOJu0YyOug1yaSZ0u8L1N/VGD/jF1+CQKbQoGDEh3mF9qI7HzyycTEbt
 fhqLvwuRvwmNu2bcx+GFQBakeb/Z6hmvqAD0daWBxTVBL+CplZjyWhK8vt2Wug9S
X-Gm-Gg: ASbGncs4G1BMWJeT2goRr/wAC8mph8SHoBVuXO/siWDpwAyHyUXVMxTUYyqrg1iL1Tw
 uei9rPuoqA9Cd6gxinwZPSDmR2GxEzScYEykLoMGacwj+OPJfFkxDhd+8Xsy1V7SsDFDh+zqDk7
 GStYaD1j3Z4qO3kVDJVSrVP6PqTQM2YIAIkpX3KojSfV6VA+NMQgoqfIXX6AzVuTk5g9VJywqf0
 3Dlr6tVPaZmzRFKqKPnpcw2qslGXZRGL98gMCki8TkeWiMBRN8WBdV8Z48Upo2yk4ivn3/e12yz
 PsrEFObT6meXlALdFt3Nu0PVvEBU5I715vMskloxdogqzXj9IoEtpnCgh5Qyn0RgrIQ98dYLy5t
 byVlbr95Pa475D5SbLUr3GLeRSBtp9yc4uJgxne5hsJn/7pMOY8A6VC1LtORd5ynv9p3VwW8=
X-Google-Smtp-Source: AGHT+IEFB/FQUD78fazxMUcbRT86iJUjht/02rco/GX/tf0p512MYK3vYo3V3K1vaE7Sk6lPQcUIog==
X-Received: by 2002:a05:6102:8011:b0:525:9f17:9e6e with SMTP id
 ada2fe7eead31-53d2300e8cemr6287726137.23.1757601123363; 
 Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8ccd38f8e5bsm265918241.13.2025.09.11.07.32.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-8a967f3a873so244157241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:50a3:b0:519:534a:6c24 with SMTP id
 ada2fe7eead31-53d2463053emr6229257137.34.1757601122544; Thu, 11 Sep 2025
 07:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:31:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu29vTmvvAb2fJS8ZKmqnLb6bEUHTnO3NLRe=mE+c4GA@mail.gmail.com>
X-Gm-Features: AS18NWD8YMdZPnXdMJyRLJjErW6NxacD5Z9NgH-0YDOiJVkaB7ifoDDK8rPLQHs
Message-ID: <CAMuHMdVu29vTmvvAb2fJS8ZKmqnLb6bEUHTnO3NLRe=mE+c4GA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@
 to dsi@
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Thu, 4 Sept 2025 at 23:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Rename dsi-encoder@ node to dsi@ node to follow node name pattern
> in Documentation/devicetree/bindings/display/dsi-controller.yaml .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
