Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D039A1D8C8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B34F10E55C;
	Mon, 27 Jan 2025 14:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429910E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:54:34 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-85c436db302so2367557241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989671; x=1738594471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nc7EhYWNNGPAPBjGFyDk18ipW3ZlGb/1I/eDqrYDPc=;
 b=UJcp0k77q329cc1KZYi1wyjBmNy5H8Sev2K8sdLwDZPcwqbtaT/w6HoFrC7Fa1iiwJ
 gGlwVlArZmEiE8dalSPlg5dq6ZKUALN7wPDV5BhTv/fXRltGRRXBytV3vuzy1I37H3tu
 XWsnUlDw6XO87vTl539T5x7K/yYBdlo5lL3/f8aDCuYI3arELaA7ieK2GmWJv1NQ22R7
 z0v1Sdh2q3+IL2C5sZj+qzae/3vTTpYuXSRBIkM9xTm4dP03G2o0ATRzQUno44aYTGSV
 UsbASh+53fCnzOSF9vhUBSIXb6kj8oMzkaiN5rjS+TJn8oAnwspZuM7rcSb40sXSD9WK
 BJJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHeVDPIkGJacTbP6ZOOScibZVcWcOlkobSH+8XhtzaOa1qj7x92jBvFA1GV4Uyq3WFbb0tPHh02M0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9e0Yhl5weZSc29nOWSVPnfv9wOqB04aeTT0dVSNKfhnLOBWoi
 dRqz10rcvGp1UosTre89iDP+hISwWZNXlh8wji8EiTAd6kqwiORYe1o6kuLGKaY=
X-Gm-Gg: ASbGncsbxcEwAiBNfb+jfbdFgRrZx5fZnwCMFtK2Pa7G59i1di4f4A3bc4hOyRnPjuX
 9ULGnDuA30UTgCrf8lbjvU+0gVnL5W9Eo4jDC9N1Eo528tf2ZTBwvIgbhhlIOujswT2i64faswU
 HOvTfCLZXRmx33g9OqIBevZDLvCfRH7x1DNiKlkj1IkMf7FiwU6vpQur66jJPrYLmmasQoxU9Zk
 fl6AFFM6ptWKCcuPBQJNkj5yj+dXwpX6x2fzwf5qvtjxhw/HQLtztjx2EPa8RtOIb99EwEKrOT1
 NGRSHlXW6h9EuwA0njdqacYixl8b9UPY8heLGQu6xjLT/B5+DUlDjpCO1Q==
X-Google-Smtp-Source: AGHT+IGDk+17aTBEAlpsfVmUVGBAr+mg1ktcy63Ma5+HDGetDCWJZsapnoxIEzlvkad8jLewmf5Oiw==
X-Received: by 2002:a67:e2ca:0:b0:4af:57df:8697 with SMTP id
 ada2fe7eead31-4b709d0b4f6mr10735607137.10.1737989671496; 
 Mon, 27 Jan 2025 06:54:31 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-864a9af3a53sm1916672241.11.2025.01.27.06.54.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:54:30 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-518799f2828so2256341e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQzs553biT6s06wvnyAkq93ra6NdWQGlASWGoi7AEaCIVICK6oiZ0X0v9IjO0G51HaDqrYNBhcC94=@lists.freedesktop.org
X-Received: by 2002:a05:6122:4003:b0:515:25f5:46f6 with SMTP id
 71dfb90a1353d-51e4fca5564mr10621253e0c.4.1737989670322; Mon, 27 Jan 2025
 06:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 15:54:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
X-Gm-Features: AWEUYZmdKSZIgZIfMZy-VJzd1ow6q4l6gByfQtsq1ZQj4hinISzDeB8Zc0BLYKQ
Message-ID: <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs
 entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

Hi Wolfram,

On Sat, 25 Jan 2025 at 13:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I gave it a try on Gray Hawk Single.

Old location:

    /sys/kernel/debug/1-002c
    `-- status

New location:

    /sys/kernel/debug/i2c/i2c-1/1-002c
    `-- status

Contents of the status file without a display connected:

    STATUS REGISTERS:
    [0xf0] = 0x00000000
    [0xf1] = 0x0000000b
    [0xf2] = 0x00000000
    [0xf3] = 0x00000000
    [0xf4] = 0x00000009
    [0xf5] = 0x00000020
    [0xf6] = 0x00000000
    [0xf7] = 0x00000000
    [0xf8] = 0x00000002

Contents of the status file with a 1920x1080 display connected:

    STATUS REGISTERS:
    [0xf0] = 0x00000000
    [0xf1] = 0x00000000
    [0xf2] = 0x00000000
    [0xf3] = 0x00000000
    [0xf4] = 0x00000001
    [0xf5] = 0x00000000
    [0xf6] = 0x00000002
    [0xf7] = 0x00000000
    [0xf8] = 0x00000001

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
