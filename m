Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5206C3030B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9110E59C;
	Tue,  4 Nov 2025 09:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD2F10E58B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:14:17 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-54a7bf06edfso2023390e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762247656; x=1762852456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Rhdb+Q/JnShH/beTKgwAN0mc3vq4HcuoW0J6c97au4=;
 b=B6GtsOFnvIVyBDNZSU568JSqXH8Xoju8RDqAh4Fn/Y1Ni4Gq8Vb27t/4w0B24f0jMR
 J+GwnNqDBNiZGs6OJekIlN3pFzIULNQY+5RTHmUSZZufPjBONpCUBT4tHAAWCbJPoCDy
 z+m7xo0yOX2MDCgywPomKwNjMA0puyCcvPxtnkLs69booEuKuebiWIKuYcDLJCobKe/F
 LGHav3fnvQCdq8/X9KeuIaGv9vgEWznWOrF4bx/SbHknDKc7HkEJpgMBg5Jtj4/GDJUI
 qdeW4ywYyvTdNO70Ngpjl41m8TTc1KgyakJJYEte8B3LBKxvRP8ncg5KTCSb0nbwaftr
 MyAg==
X-Gm-Message-State: AOJu0YzCN1vOmDFD4Yo5RlL1gCeT4kvmOX86n5EcEk5fBFs+wwHTG0oq
 pBgqcBfJkbTt7J4Gi3ioqRu38FtDXChlECMUjCnox5iOFGk1O7FPocj/CpfYEeHm
X-Gm-Gg: ASbGncttJqO5FebBzraUat4VkXO/Yfc2HVlJYP+1nP6udf2ZONy4OoDk4M6rxPSdqd1
 XxJoy2tJZelq+uezeKtPMkSah7a32Mb46hG64ov7TYP5Blu6pK8Ma4QW3yU1MS01biwvcoxSCr2
 Oq6XZUT6Zfbmmlup4IhGq/1cu3ZT6W/JY2IjQm1aweSh/mNV4dEolr6L64/14IOgMUVvtHJKAxl
 N25lJ3oRfDQOoo8bykEoc/esvkYS9cSU+H1Tig5+VPQFNGh6mpg6Q2r5cKEqNHt7fO/p+n+gJoQ
 azZ/+8lUUbQceyeh4xn25pIDZwxg/3R11aFoEmMfOA4zGoODLDqBnvWhPJZp887Gsy4YCvfz2Fj
 WsV0IvUpsG1ZOaMDY1Y3Nd58mok3yTj6zJc95AZjzV6zvIFPsqOcnXRx7hSy/YoRU+mrv1OOwOp
 /r8kNqhwvXg69/kbUttP3y77DpFW8zzQ4VmGthkhrd9g==
X-Google-Smtp-Source: AGHT+IEnmVIn38R3JK0uGQRgIdBbgMHAPrGTOO89SNjiYz9daPG4AQoSnZwH62lxa9V6okLYAKL2fw==
X-Received: by 2002:a05:6122:d1a:b0:559:7acd:1d3a with SMTP id
 71dfb90a1353d-5597acd1ea9mr365698e0c.2.1762247656026; 
 Tue, 04 Nov 2025 01:14:16 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55973bf5d89sm841561e0c.6.2025.11.04.01.14.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 01:14:15 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-559748bcf99so922025e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:14:15 -0800 (PST)
X-Received: by 2002:a05:6102:c03:b0:5db:f424:5b9f with SMTP id
 ada2fe7eead31-5dbf42466b1mr1343933137.25.1762247655617; Tue, 04 Nov 2025
 01:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:14:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX29=a2RWEp2-s9VqAdOt==wA8+Nm7ZrgKNpKzE1G7wHg@mail.gmail.com>
X-Gm-Features: AWmQ_bkAARguUxuCuAtORfzfuH5zx7dwTjZKFID94CY-bRv0DDhFBhuCd2nuPuw
Message-ID: <CAMuHMdX29=a2RWEp2-s9VqAdOt==wA8+Nm7ZrgKNpKzE1G7wHg@mail.gmail.com>
Subject: Re: [PATCH] drm/display: bridge_connector: Assign
 bridge_connector->bridge_hdmi_cec
 before drmm_connector_hdmi_cec_register()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
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

On Mon, 3 Nov 2025 at 21:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Set valid bridge_connector->bridge_hdmi_cec pointer before calling
> possibly calling drmm_connector_hdmi_cec_register(), because
> drmm_connector_hdmi_cec_register() directory calls
> drm_bridge_connector_hdmi_cec_funcs .init callback,
> which does access and use bridge_connector->bridge_hdmi_cec
> and expects a valid pointer there.
>
> Without this fix, on Renesas R-Car E3 R8A77990 , the system
> crashes on NULL pointer dereference.

Thanks for your patch!

See "[PATCH v2 0/3] drm/display: bridge_connector:
get/put the stored bridges: fix NULL pointer regression"
(https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/)
I even took it into renesas-drivers-2025-10-28-v6.18-rc3 when I ran into it ;-)

> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored bridges")

Following the Link:-tag in that commit would have found the posted fix...
But I agree it is problematic that the fix is still not in linux-next, almost
3 weeks after the first bug report.

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
