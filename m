Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB5ABB0DF
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01A10E0AE;
	Sun, 18 May 2025 16:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EC210E0AE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:41:55 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-30e8feb1886so1873051a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747586511; x=1748191311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aZDebBuIwhQGKIA5zH7FXUsKlBBCwxUk5Cqi9xBTjTY=;
 b=hE17CEUak3+GGtzXAsm1pHwYjVvmqqj65SDDyrFFMox80yLzCJRHJiiTNUZm9wucW+
 Ran9n8003XWEQ/E8Kilru6yolcTYGhf/eom34v6N9wJnMYnyg4uwoftCsNhYmUr7yCyS
 8tVA4J7o+ytquUTdO3QzzYi9PeY8nAKz8PiEqRwu0Qefb8huI6N8JZMGnLKRQoCZT0po
 tzBycxRdo3NTABTNLvlDKBFYNogmV3xP3hT0bS4FQIoeDx8SljSu6PLgofEXT6zWzMn9
 wuNHQGZay8CKmCq44P+ahy3ASd92R0jLxscnMTqFbeI+5/8facrSgeWLRhJun5ung3j6
 8J/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3LG4EiUSSuCvkuS5cLqz3+7KkmxeMHZAO7yPsFyh3kjQDVq1RzBeeXLSXJDJxTEpJj8KKwLB+8eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6D9+jqH2CznkvzFREvXqoOFiZnfWZs/jgKMP9wjbLZfFBBZHC
 QUO0uruOe+Wa1Lvw7o3KanhqBLqnAvhphrjO7cVM7PpzfxyvkGuz0+JlVNoMkTaPCiw=
X-Gm-Gg: ASbGncvoh9VdorHrwkuFsIdEllbVuj/3rgxVm5CFyI/NJlbyV6efLMbJ4fwyo3sYtgQ
 /X9klxoM2XFoaNZzyopXnjSrP+ImC1UmBehudJWbPRNGWiYKLl+Dy0nNqGYnA7wtVQD6tcI5DMx
 F8QXiZkIcckDK8vZLRDJDI4bvuMoUV5xxdj1LvNsBsnw/W88HpYA6laB9tb33C3JeGqs2Jd/nWA
 EQUWjqBfWaImlwxkQg9JcmFBBVRsWX/MkWN/3FZ+xbRwzhQ3TNyRQ/J8+tdS/W2MtOc259QAj1B
 0dmO7QMacIV7tcILNzW8KE1Pd4XraYDwrilVzbKG/TePPIaFyR9f4khcNorYxvRbGTFaqHClLhB
 DssQc
X-Google-Smtp-Source: AGHT+IF7B5+LtKReVbiT8xx6NNdh6qLn5BOzpKOGkRnyyv0+Qy9ONQAaGjEEakd8LjeQyPMrMoM0jA==
X-Received: by 2002:a05:6e02:1a48:b0:3d4:6ff4:2608 with SMTP id
 e9e14a558f8ab-3db842d139emr116847315ab.12.1747586501014; 
 Sun, 18 May 2025 09:41:41 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3db843f7fbfsm15418975ab.43.2025.05.18.09.41.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:41:39 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-86135af1045so469667139f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWu0b5iQNtkTDa1O9B2v7wObPOREpdPeTY7r6Jlees8q7l9lDcp/av7Nf3yaqelkMxNsU58su874ZE=@lists.freedesktop.org
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1346917139f.1.1747586498864; Sun, 18 May 2025
 09:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-4-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-4-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
X-Gm-Features: AX0GCFvPNTkEIdX7vf-6v-hZnL1kJZY7vaEnvAF5rZAuePObHWHQncZKVmFJnYo
Message-ID: <CAGb2v66nwNrL1bJjqeLaUKxntPbbL=amao=3fLQnVwKt6bFyFw@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
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
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group.
>
> Prepare for this by adding a function to look the blender reference up,
> with a subsequent patch to add a conditional based on the DE type.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
