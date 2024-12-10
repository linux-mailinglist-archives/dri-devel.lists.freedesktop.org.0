Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041199EB5F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9C10E3BB;
	Tue, 10 Dec 2024 16:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEC910E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:19:47 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7b6d6064b93so290180885a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847585; x=1734452385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4WuJQm0PMXOstokp2zkVSGJA7kGN0iowjzq4BYe14w=;
 b=vcaPhig+8EfpexHGBRzwwZXyBSL26Cex68zo39auw0hD6mJ0jD+lcCHp+3AuZvGhCT
 vTlyFgNQZheCnwMzuMXWC6/0IbrfkvZvjAQJiCWRydc6RO2sVtsfSD/zUgyLBo0EJ9pR
 SydHNIWvr4LrhN9Ze/mTt17fUg2izdvzeMKoESVcyv7CUZHUzl9vRXXuYtUWDznv/1Ci
 u2Hi4WdXBwVuPSPFJYlszPuUYSl1Fen7aKmi+BM68VvXVip4xrruGABCic3qRMJy37Sn
 xMwRImRt3mEjjnhJOoYDCCNfNnyZO4e81VOsQ8YSurFCpQ4ypUP2BmY2r4Hn7nJW5xFN
 IxUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwhqfGpccZfShphM0TXBJ4F4B9L9AZWVRFQGUSrIvd2z7DD2lelKRMEk0wg0iJn8218eWJuaMsshA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFPO5ulalYCshn3eRMLm0W3nVmIVe8u+IzU3VNiwTwAaCCffTC
 pijkNWzJ92gOTRyxgfWcYs8g4r0B6UXONCmChgZmNs+jDRlrEv+yQv2Be0OX
X-Gm-Gg: ASbGncv2Dm2aN+N8vIRNeRIoVLl3C5lrazoPASkp0rO2s4lRCNajbMNxeBoCs42O6+T
 QP5KwQENWJdncGo7aZBbq4bDT51GnTn+WqMwoSIMAwHfZYelLtE7ubVEA56Ib77qAfQ1/n9ulpA
 d3gEy1P8I4ukfGZV2vW9ipUsfDi3+uEDA2PaGmHi05GxqrwBFClCCurWIVIKBhyQ/JyZfiozrH6
 C/vNTaXYZZM2RcjH4RYODiWJfhKwo9NUWu7oZ955kq20/L5CgOHuxs8WcdGgh8gmvxw/JlS/b7r
 BNuhCEwX+4A5bPV/reAV
X-Google-Smtp-Source: AGHT+IFI3eyTN5WtZaw8a/71GsWWn5sjLIbt6MOKNQtgSlhL9Xnj+ZgW/xnch5wV76MzQAK57uINQQ==
X-Received: by 2002:a05:620a:170f:b0:7b6:7a87:744a with SMTP id
 af79cd13be357-7b6dcdc847amr803716985a.5.1733847584586; 
 Tue, 10 Dec 2024 08:19:44 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6e9c0919esm18804185a.89.2024.12.10.08.19.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:19:43 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7b6d3d51e1dso263800085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU90Zcc3i+YTsTWYM7HMRGtsnT41+Z4UBy30EvLkpTmfyTKrZHl4eGuXs7//ligPDGnV00j1aOSqok=@lists.freedesktop.org
X-Received: by 2002:a05:620a:2711:b0:7b6:cae1:a3cc with SMTP id
 af79cd13be357-7b6dce18437mr893433085a.19.1733847583252; Tue, 10 Dec 2024
 08:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-9-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-9-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 17:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwrAJXg8AH_S_NDAzYuR4FiVLy+dcAfVeVh_J8Di_j9A@mail.gmail.com>
Message-ID: <CAMuHMdUwrAJXg8AH_S_NDAzYuR4FiVLy+dcAfVeVh_J8Di_j9A@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: renesas: r8a779h0: Add display
 support
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
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
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

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add the device nodes for supporting DU and DSI.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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
