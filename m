Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D219E34BC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 09:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3710EC2E;
	Wed,  4 Dec 2024 08:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309E310EC2E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 08:00:51 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-85ba92b3acfso827426241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 00:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733299250; x=1733904050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GONdbMSirRoIxoa5Koj9rUw2uC+DqLIh+b3SysJcOZo=;
 b=FP+TNwx1Z5CYtYSemWb0YsVMlHp66+TECv+kgeAmAzpRLffnywCLi6+aTC8drmqH3v
 lVT//8SM4SFrmCfiTXUu7rsqcJtjbtwVMjnsJ+XU0hbtumeWOm22TgCaGeyP9TSGVPfi
 hPMZl7MTajGqTkyxGOLc1qHmjH7WSk09LVq/9wsNaxf5d6NElac3FQYUomFYbAZ+/uDf
 ityob31jJ8PY2cqljsIUNxLmH+ekWCQqLTi3MXp5rQZ+OpPXjpKmcEsdc/3h8pYVJLe4
 JKCo/oG2hGZfY1oo00I+Dxy3kpjYqN2M1rMuHgyEG7IuJCQd9n1OxCeIKQ+f//xULrgI
 T8sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYHdYYsi3Th+V14u8KA6jaM5y8mF5Vh7oBYVojL4Y71PLT9jqbZ7XXUner86eM7oP2NNtJy1ttSfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Ln/uSqKGWFuJyrAhH75UbHNI1emJ6PxMlqrOZW2IuYmaJAd/
 V3nIleA66VDJXmXBQHLLJnhxooGBZCwT3h0VTgIjVMgbnSGOxEOQcgKy2Pne
X-Gm-Gg: ASbGncvu4TdNqMD7MB52u5ldl/RJ9PhMJu8agNwKnLoLKxR+RC/QVamKMyyBm+lJ/rF
 edk9cTif0UbbmOxt9CC/tZ1Pp9jQwWJ4yWd5uO88HuEGk6v8jhGmCpz2W6KruRRPHFVxQd29wPN
 3GHjEl3UrYLDgKjNq8BafSk4ZvPrhQyOHuhM1cQMBN5/3fsA7HNOxDMBDXrAwQu/nJEv82OwBzv
 HnzDNZomXoxHC+qcfmfUFYkf9Uwf2ktcu5si+lrtkg8plAsvWbGuGfPQWJMOni1aYYMMMeqHziy
 YKP2hhPMQW59
X-Google-Smtp-Source: AGHT+IEuRtaCA1Nb+3RMirNm6WbUHinbx05MD+7Tn5DYwEXoHoZbFcZFqaH+Qxgq+mNMBHzhuDZuhA==
X-Received: by 2002:a05:6102:38cd:b0:4af:4cb0:a310 with SMTP id
 ada2fe7eead31-4af9719d74fmr7026012137.11.1733299249777; 
 Wed, 04 Dec 2024 00:00:49 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4af6ecf30d9sm1480227137.18.2024.12.04.00.00.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 00:00:47 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4afa568b4e7so309008137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 00:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Z4rDu/AfXi7VWNP7iYIHkyf+ecw3sTLQt5tYcCMMmln0RpipDj6yNrgy26byy27DCdrqbke2SaY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:41a5:b0:4af:5eb5:8448 with SMTP id
 ada2fe7eead31-4af97162869mr6809478137.6.1733299246794; Wed, 04 Dec 2024
 00:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 09:00:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVatmOscaX9++y3L5SPhpPpbLw6fROqCw1Cc9iU=YJFpw@mail.gmail.com>
Message-ID: <CAMuHMdVatmOscaX9++y3L5SPhpPpbLw6fROqCw1Cc9iU=YJFpw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Add DSI/DP support for Renesas r8a779h0 V4M and
 grey-hawk board
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Tomi,

On Tue, Dec 3, 2024 at 9:02=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add everything needed to support the DSI output on Renesas r8a779h0
> (V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
> Renesas grey-hawk board.
>
> Overall the DSI and the board design is almost identical to Renesas
> r8a779g0 and white-hawk board.

Thanks for your series!

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Woot, SoB tags for cover letters ;-)

Works fine up to 2560x1440 (I don't have a 4K display).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
