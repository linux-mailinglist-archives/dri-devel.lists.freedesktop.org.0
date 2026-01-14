Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBAD1FA1C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0E310E575;
	Wed, 14 Jan 2026 15:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF33A10E326
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:11:12 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id
 71dfb90a1353d-5636784883bso4327855e0c.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403472; x=1769008272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fL62Bf3LdEer05zL+X5t7sIPwEJerT2IEVhS6PXvpSg=;
 b=ES/XEbGM9SERcshymB3EP7wKrqBziUuu20ZKpuGx1A9jo+rucEtK/S8oytPZXH3ZCD
 2QLmiEBHrWpKCxtrcARrYx9TYHGX0EKWldfp7TtxBbYuJiCde0EgcsgQ4TlRXfGZFkL+
 A4OC0yD6OVQsL7wRF5v4tqE/1A1dKK9/UR/twuIOlymovsZzB/xSQr0wFvmogi7S9cTB
 o84uXWAo9olXFvmAn2WYj3brnMhbRcPqXxg5Q9haEgqr///Z22noGE+X6bYhumcw6nNT
 YOJL0MCiR7PTDetF4jbI8NFQe4XjgsLe9dOTzE3WTRF9/28rKtgWbyAcwnPKx1/Tqr7Q
 IoOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1TtZ4WL1KO7GM2OXpzeB/s7B0uv7DYCj+FB+3PNWkY52pnBAjoWOsskjii6z7W1zwv4wI425mIoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD6Hb/s7tgyiF63zi3zDVqr0TVoE2n+iBmmWlP5ZdSyRawDLfU
 HikkWGf5jFj3QbzF6aVjqRAqOe+bGUm38lDoahbAewTtlFfKDBYcDX9EGi0JfT7xEJ4=
X-Gm-Gg: AY/fxX6L0oIpNa+tYTIm6JoQk+HjTVkR7WZz6sjr17RyqfegXoDRXo4aI3acYAdE5rP
 7G/P6XSOx5rxGeN74F4cIxdmEye0M/sZ360RWsZkamXPUiN7kS33Qz6+r0Cmnk1DpbW2bNIgAMc
 ZvUFf24Dm7O3woyP+Ex/5DtRF9JqKwCj+IAaSBRfpyx3IdQXdfFBkwLE4OkbTxTr0by/Gg00Hw1
 UO0XKmLXh0AjDzD9PsSF6Y5jN1aJxijktJWWHf+27Vs7keBRtDASPUua4P+AjVzptMS/yPEqXZd
 sadpuNpF+84pr57rer8uFH6UJAqKV7cihJg9qGdxUkFLuNj96LTTCVkmnEhSDj7Rl9myAHT2zxS
 lcgEOSC3gRYqYBP7joairMkLpcRL7/2B6/lFUHKrEqL1eGkpMh9MVmCpc2lYzrDhLAheqEi0YWI
 7O4KqFDkFDXKD3sOPSvRrspLFnzReQ/IgeCdtdaQdLG29Zr8cqDl4H
X-Received: by 2002:a05:6122:80a7:b0:563:6d01:a514 with SMTP id
 71dfb90a1353d-563a0a13139mr1050392e0c.17.1768403471425; 
 Wed, 14 Jan 2026 07:11:11 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-947ba387bb2sm1476520241.13.2026.01.14.07.11.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:11:07 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-55b09f54e98so2781815e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ds+YqKTN0Lp3EiREgVXw4UziGqF9q19r0e5TOvHleffai8RroOuntq9CKnCr274nPVIs9OGsgmQ=@lists.freedesktop.org
X-Received: by 2002:a05:6122:3113:b0:55a:ba0d:d84d with SMTP id
 71dfb90a1353d-563a093abc8mr1234630e0c.7.1768403465377; Wed, 14 Jan 2026
 07:11:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:10:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVNfKomHEkvFsmWk2qp5dVEkSvsae2sIrEVsngj9ZQvyn6LkRdKtdcLBk
Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
Subject: Re: [PATCH 15/22] media: dt-bindings: media: renesas,
 vsp1: Document RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
