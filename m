Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA98ABB0E2
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240DD10E0BD;
	Sun, 18 May 2025 16:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3710E0B4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:42:07 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85e751cffbeso275525739f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747586522; x=1748191322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
 b=bH6QZgw4A25xzsaZOqHv++NwElVbR2jxjFboooTfAbPIk+aL83+31OBTcZM/Oudish
 j6Bm+iKZXaw177bS75uYpar2vuGV7+zr4Nu4RvQCfFyoqOmJJGexjE5L/lCP/janXtE2
 fB8L74/mACMrJECYLvuNSGj3YsGsMYxPrInF7RX0yWFB/FrBS+CYiIYWNlWZ3W6cppnA
 CIt9Vq4uNas/Zj6EhTf695jpDeZqJ7Ios7Y8GQb53UvYdmhtIwwh+mmVlvziY8nVZ9hv
 f6KKtVFOswDDtlbBOfgcs1xQmNqaOdLTolbzfYKxdaYMN15oeHabcAJ4pwMrCM/+qreX
 5bXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+XSDJSQFHy70B+CjC2TswGtCjhaAJRwXdvLA4XDn8SvE1zLOmk+xDpAQZA499OYBN/ny/d6Bw2pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI2vhw9P4DMcwXd+AZJUxkMI2IPebLEdA7u446qm7K143TknNq
 UQk/XJFNNs/Po0TOgHvhslfDZI5qf+nOcKsPDQcED+ff2H9IX/Fv+xHOARp2uvtlWho=
X-Gm-Gg: ASbGncv3r6wYC51TYVTVrXhVxwBNFA79r69gB65K1luhW7pmQf6YOwIstfnLlKVJcuK
 z4OHdrhgKIfHrLroszLbJiDp/Y7p0BZ0oqUyoIk8PBY0aDYAUiuY4nBTADJtJ2k33qPAxo6Ylg9
 4b3dITEfu8CsMCXBDxrY818YOM1GUhZ6McPyKsB+v7wCVzvAMyoeqyGpFcPQ/Ajweegttx5GrBn
 EBO45+4TOw9vQ1vkQsWMecZT/wkMfoJLjnjfANiOoF3gKMikyZECfhoGj6gcEIbTyuqg5KCcLNl
 /7rira+ZJCveL1bx3R+Yruyw/uARorgovjrR+bqAbuwTMgzHmyDjUIns5I23ega5alOc2XahPZB
 WMya4NJse
X-Google-Smtp-Source: AGHT+IE8l61klCj82/coEJBpvpw1XH63/QAbiioR07NVvbIrthPSvmdsnCjA3GMRTlvrdlnNXjv5zw==
X-Received: by 2002:a05:6602:3986:b0:85d:b7a3:b84d with SMTP id
 ca18e2360f4ac-86a24cd23f8mr1101428839f.13.1747586522473; 
 Sun, 18 May 2025 09:42:02 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fbcc48c7a7sm1357878173.75.2025.05.18.09.42.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3da785e3f90so20693875ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWfeWXKNVoRAYjeb6QfWIof6idBuhcXhC8sST9ELItygLLs8CbITNtWokdIu5bLer46M4ZwMlbxy94=@lists.freedesktop.org
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3db857a6f7fmr111584635ab.18.1747586521124; Sun, 18 May 2025
 09:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-5-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-5-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
X-Gm-Features: AX0GCFvx955idocxBLHWdxaZkcNf0j8vEssSsAEhRIcCueVqPuT49DZqnymord0
Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
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
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
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

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Use the new blender register lookup function where required in the layer
> commit and update code.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
