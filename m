Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED2A20848
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26F710E626;
	Tue, 28 Jan 2025 10:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5044710E626
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:11:00 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5162571e761so1818339e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 02:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738059057; x=1738663857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/AAfq/RNvRQuRmMukdGgxMKHf9VpECc6Wyd77wR3+7g=;
 b=Za6zNbWa7vRsJ6mSroPvP3UxqXsqE3vliUvNgJH0lBdRFsxe7Gu5LP4Ju84SEfHQPJ
 t4BTImxUmrx1RmafWt06fOolTlSalGlT7KbdQv98RicPxD7Vai0LGEIGSln9V6++UkJv
 f9lN7I4KMNiZoIDu9GmlyodUqiXd6WZvtm/qi0NDkctLvoaL61HgqBHAWoe9Od0UBi0Q
 DSSKjOR6GU2FkANnO6rXS3ejod4ODjkkDUjEOs/2bD3d4AR8bnqRjb/SMAO3odAVwbYL
 +t299T1C8AUoLCz3cmvSJvjMucuf6LdT8sdjV6A0o4KZc5uvnmPcHznVhpa8QW0cR9Hs
 ixpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Zu8eeJSmL9TGHemnaY4KwADEoDxV/MHqLaM1T8j23KtEpw8oTMzXgXAgL2rr9ernAgm5ktzyHwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQx/cYmfA3t+JmmlUPXuJOZv1RbPvAZ5JcIwMKkil2CtRa3DRL
 n8TC3lmhyx+s1AqL5VSYj0zUQdPYvlrMj9//GcueSc4mifcBs/clp2xELMYGgV0=
X-Gm-Gg: ASbGncsrsjxWp+vrAo1QyzhkDzkNIbqvEr5n5gtUbXrPQ6b1fxBoW/aU0Pz11XzxGHL
 Qa2Ntm/YALR2d7EL6ZDiel2z8q9wGNHylpBBigE5XtSbT5xjSq7E+nDDxdZCvGOHOK8GhGFncjH
 4E4hTw63FfutfzY6evYbQDg0P2OYmyyPjjEvSb3ZGu9wfu//xcc1xkzqY7adGwDLuEjxlHTmjcG
 6uPnj2hAcIpiWU+bSVN7UcjR+WWbaPkLPEv8ClMh+emTYH9bCl1tR5vFwdivpRmvGP5jJ1qhzW3
 +eA0NqcnHvRuDSHUsMGRGyir7nUFrEmfdUqNjJVARNpKwxhW0noynA==
X-Google-Smtp-Source: AGHT+IHFwYRtzk1OVWNpH+UjvhewMY2BtuahehPXbgNztrAZln543vfJZa8YFoZvwylDHzWu97OurA==
X-Received: by 2002:a05:6122:828b:b0:51b:89e8:5cf0 with SMTP id
 71dfb90a1353d-51d592ba55cmr34498948e0c.3.1738059055947; 
 Tue, 28 Jan 2025 02:10:55 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51e4ebe9b38sm1735198e0c.39.2025.01.28.02.10.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 02:10:55 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4afefc876c6so1572365137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 02:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUcI4iS6OHnDVSc3PyjZnNWYkydtV5STx8kCudX3wHsSyexevC61gzvMaXPq4SOGXLJ8wYQx4gkvY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3ed0:b0:4af:dcbe:4767 with SMTP id
 ada2fe7eead31-4b690bd612amr35553422137.10.1738059054548; Tue, 28 Jan 2025
 02:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
 <Z5ir-7cIM6YOlzgE@ninjato>
In-Reply-To: <Z5ir-7cIM6YOlzgE@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 11:10:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfip+6wqkB+dK=F185WrVxofYs5irckxgDfEEuHOZ3pQ@mail.gmail.com>
X-Gm-Features: AWEUYZkQXyz-uBN1tjxLEVqAQZDgE5JSyEMj-kOv4nC6bhvMdYo3aHi44tHVskA
Message-ID: <CAMuHMdWfip+6wqkB+dK=F185WrVxofYs5irckxgDfEEuHOZ3pQ@mail.gmail.com>
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

On Tue, 28 Jan 2025 at 11:05, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I gave it a try on Gray Hawk Single.
>
> Oh, we have such a board? Nice! That would help a lot.

We have several! ;-)

$ git grep ti,sn65dsi86 -- arch/*/boot/dts/renesas
arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi:
compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts:
compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts:
 compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi:
compatible = "ti,sn65dsi86";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
