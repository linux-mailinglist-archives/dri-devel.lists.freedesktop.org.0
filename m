Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E134B955CD0
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 15:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327F10E082;
	Sun, 18 Aug 2024 13:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9D10E082
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 13:47:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5314c6dbaa5so4682856e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723988871; x=1724593671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DOrE88eK7FNtec8CjcuF9Kbf1J+Xv+uNq/yKCjxMpHc=;
 b=ExjN4oPjRkgLjJFcp2ddGVUifpnnsuGPP/TjKk1fNknR2Nbdd1lqOyf+N78SCwuLP0
 TpYgSbgFr2e2gWtGUOvBps69Aq+AvEw/bZXn8A8x22wr2/LxGwIH6KmkGJKbBypXTWOx
 657090VbCrJGO4U//FhB3CisMNjwLbgokOgdB9ArpYBdpCNWYsOGfxCld0p8S4oWp+R5
 L597wHitWaSX1tntU4un5viBV3fzNTuSXICSD0RdFLpoC1u4JnRhpk5+57TQi4eHtMYU
 wF7HWhXWgenilT/dBN3v457Fmy59N8OkZsERLALSZRQMdq+KoptFbptC7Qy8BL7SBOxC
 rgEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1Bura3EpeNVCPJSbq4HNirOga8pNHrnrvgxzRfwM04WJioREUlS7oiePqrAUnXg0weJbrdAMCmpXhIY/RP0VH6DrSnFMLHUzrmJwHIcTu
X-Gm-Message-State: AOJu0YxepZC7JVXo1uW1dI+XKGcwaC0861T5lU7Leb/A0YM7rBwmJT8o
 tV/sXVM1OWKtWQQfmUPzo1mESBco6eQzyBJcDNtWwQLesv6afiJYsEOs7W497mU=
X-Google-Smtp-Source: AGHT+IGoEPUdHkvGgfIWKvfeChvQq+3RlbtdQ/wVNsO6q4hDV33JeDFUIeFcLImHzxkUJL3ZepnL/A==
X-Received: by 2002:a05:6512:1594:b0:52c:df77:6507 with SMTP id
 2adb3069b0e04-5331c6dca63mr5817238e87.37.1723988870692; 
 Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d41e2dasm1221048e87.200.2024.08.18.06.47.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso42674071fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5TY7qgTZ9e6fcQPYXScbza1SB4CAy2JEUD4TD/rU/rb6Te09w8dHd5Bxus1P6FV1xNyM8O6SvAC/8cwutMo+CFfiPjha9V44Zi1hXtyRn
X-Received: by 2002:a2e:b8ca:0:b0:2ef:2dc7:a8f7 with SMTP id
 38308e7fff4ca-2f3be57e7acmr67887371fa.7.1723988869939; Sun, 18 Aug 2024
 06:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-22-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-22-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:47:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Message-ID: <CAGb2v65gppDuoUDNhWbZj5vVj7jNiPkiZLPisXK_PKQnPAr=_w@mail.gmail.com>
Subject: Re: [PATCH v3 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
>
> Add a display engine mixer binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
