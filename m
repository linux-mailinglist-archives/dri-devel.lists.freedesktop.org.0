Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8574CF3B4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 09:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6CB10E286;
	Mon,  7 Mar 2022 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393010E286
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 08:35:22 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id bc10so12631666qtb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 00:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lwoi80hKOWtc+skxMuKJlRziZR969/R4qDCbEpgM3eI=;
 b=yTovfrbW/S7qee+By7vr2Xa5Q0IpQuDVFs3J6HZKprL2KHrEZq9Y9jVAglI+IIivAi
 YRW6IX7IFFYwzlZ7iEgiTcNEPs7CYj4/DVKFD/uhG93rmPRRmVQzcsFPLYyvTisxJuki
 7AwZvrr2BEIQrkwBftNSiEGLfTX0XmZnEyguWJqnygTmm6R98SmZO4JtIYdZUjEHPSKS
 UxYbvWS2211DviWtYiUypLGMNTsjMzJhlawYE9ETjGlX4wONcMSxhICWdq+zusY2C++O
 YmviXiGXX/bNS/EXWcn4wLQ+8sBFmtc+5CzDqyl841jc7uv8eHTQM4O/eTT0GU0H7fVD
 MmRw==
X-Gm-Message-State: AOAM531ZMoS3la6PL4Orp8QFLcxPkQNF94xaDbvIIBRRGcML3bSQK76B
 5THN8DpLxi2Pv4N0qTVrp3UHCwkLvGhtZA==
X-Google-Smtp-Source: ABdhPJw4Ao/+Bxdh29J0wVmkviw1OVIB/22+rajwVFYLsTzsQ5SqVdBc3xFURSNBB0IS5M3NlmICaA==
X-Received: by 2002:ac8:570a:0:b0:2e0:65e3:6621 with SMTP id
 10-20020ac8570a000000b002e065e36621mr3531743qtw.456.1646642121393; 
 Mon, 07 Mar 2022 00:35:21 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 p4-20020a378d04000000b0047cfa3a0cffsm5886380qkd.34.2022.03.07.00.35.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:35:19 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id b35so29340194ybi.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 00:35:18 -0800 (PST)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr5533660ybn.6.1646642118604; Mon, 07 Mar
 2022 00:35:18 -0800 (PST)
MIME-Version: 1.0
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
 <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
In-Reply-To: <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Mar 2022 09:35:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS+ExaTFeNQFJdNQ7+5y8wwNh3dnDE1bTtnuNw8-81iw@mail.gmail.com>
Message-ID: <CAMuHMdWS+ExaTFeNQFJdNQ7+5y8wwNh3dnDE1bTtnuNw8-81iw@mail.gmail.com>
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, Mar 7, 2022 at 9:30 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 03/03/2022 13:44, Geert Uytterhoeven wrote:
> > It does not make sense to have a comma after a sentinel, as any new
> > elements must be added before the sentinel.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thank you!

> Tell me if you want me to apply it to drm-misc-next.

Do I have other options? ;-)
Thanks in advance!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
