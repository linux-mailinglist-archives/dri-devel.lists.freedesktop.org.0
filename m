Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A8B53576
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0867510EB53;
	Thu, 11 Sep 2025 14:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454110EB53
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:33:15 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-544aeeb296aso455248e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757601195; x=1758205995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hiuhbKCWVVhxdsKroAmlHWewkQOhNypPZ4OriaNJghs=;
 b=h3jDtMiIiZaaVAxbsma2pVxZlcpiuHzXAY0Ut1bL/7I76LI/y39LaI93UUsAZbRO+W
 +Ob1uwFYb5uB0qe9UOnL6T7c3oYLN2UKXYmfef3eRzcqzhTbgldd2VfaMxlT5mCivusp
 LG5F7+AnehGj1JrtnsrH1/R4x1GRsN/YQY5ldxImC22Q5RiDRmmeR+qF0lLyInA52Ilp
 W3rR/Jjd5Y8xNnf5ggNA7b7X8SKOgA0syHkrFNBaZ5YHcIZQwcfjvoggkDt9FwClcoev
 imr052Nno+rO0D/84N2xk03wkTQHv5DkuB8to5ycFIUjcky2jobIiL91Q2A7f9zEP23d
 vMrg==
X-Gm-Message-State: AOJu0YyUkAtg9oKzkW2G+JcsXWSBKBGIhhkO0AfZwyaHgUvH0RUiQCvb
 9eSWyaH5lWNdhpBGmnXzezQP+YLDhKYtrksfvRg/5Qhc8tJwRwpjx48ehLjwHvXG
X-Gm-Gg: ASbGncu9Cbj22x/Z2RX1fWtBvX2hSQ1KkzTFQv4SXCP7yq+IHF86E/i6rWPonjVwVYD
 uaNv0QoBYeSFw+KKLbMYiLd9j3t7Ul0Z2QcBEe07GqlF0md+gDMT0mXElnfEwmw8oXA4ZEv45vV
 MHSTeIpD2las03rRjvyjNqa8n/XLZsLHyBohfMsPA178Gk407CgPrE8EJ0sBvWKRu6N2quJ5bv5
 jAfT+dcRWwRuUMojjNCJJsFb7P57RMOq+iDuMzmp4qeOC4QJvJf4NDhO9CDY9XLe2LlqbVY9RTO
 niiJFSEZnfeWcs7fC/e/K5EFFJK9wufHQfYUhV7BNrMGOIktTm66tTUEnZkAOR3zCNA5djnT4FE
 pDB/rQxOqqssna5WDkJxw2gh1efKNbYWnoWUvnxDv3JmIu56/YdZQpHUd5+OUxM2U0QOxQBSMSl
 tY6k7zDA==
X-Google-Smtp-Source: AGHT+IHGGyCOhU+wV8GarqTHJIJJdymzvn9Xeo/2GCjfzQ40Jk/cGuPKYCp0eIF5QS5fWviXwJMX1Q==
X-Received: by 2002:a05:6122:2a50:b0:545:df94:e5f1 with SMTP id
 71dfb90a1353d-5472c2cf8damr6811138e0c.10.1757601194507; 
 Thu, 11 Sep 2025 07:33:14 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-54a0d40b865sm271522e0c.25.2025.09.11.07.33.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 07:33:14 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-8a1d640b50eso555243241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:33:14 -0700 (PDT)
X-Received: by 2002:a05:6102:38ce:b0:4e5:9c40:824d with SMTP id
 ada2fe7eead31-53d217e8e3dmr7178916137.16.1757601193870; Thu, 11 Sep 2025
 07:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:33:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMvntAp+1jXtaq00VWt_H1ve_gQMzCO8+-XXMkdUUkLQ@mail.gmail.com>
X-Gm-Features: AS18NWAkNjkhFfnvLiCqdymOJJqMhhU8VAOilED558TJ2nRrUGNRMgRWyD2k9Lo
Message-ID: <CAMuHMdXMvntAp+1jXtaq00VWt_H1ve_gQMzCO8+-XXMkdUUkLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a779h0: Rename dsi-encoder@
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
i.e. will queue in renesas-devel for v6.18, combined with the previous
patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
