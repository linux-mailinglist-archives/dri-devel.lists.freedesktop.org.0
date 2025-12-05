Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E7CA7E65
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 15:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4310EB43;
	Fri,  5 Dec 2025 14:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mpn7+3GU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAAF10EB43
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:11:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA6184449A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2AFC2BC86
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764943877;
 bh=ZMCm7W6YKxTJT59+fIMuX3/S1J4Ngcse8UNpCxHCdqM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mpn7+3GUJWOLIo6G0WA39on4/7X3i64R1qKnP37EhtEVpuMwpK8CtoXM63HejKTy8
 9mqfRySr+b2S9fWVlgZcCCYHKrI7/Ce7sKtNxicMMPtZoHJW9+sUf3vmgNPPh0IbUI
 B3ih2abaQqnvLOiOAJvfaZYpNDAV2iru3mYNkSs02rsRCBtKUN736wPZVEkcYIWioC
 Ci1ucR01Ixq5cLjt4USfu0MPI+nKaQea+frZP5IyHtYTU8AVAhjdkQwfNLgFxGWCla
 9tXxV//zK9TXO3OGzlxI/G1Udu2NDeJZRajVYpE9f0lmNnabA6/NPZm9d9FhqYusz3
 qrArgB8Tol9EA==
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-644458ec093so686661d50.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 06:11:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0VaiW0Yh0nsAyUQnfUFebCxGpkswJIwAPNHc8w678E1QqlWMVYIkER0lhQzglAaVzqYygbrycNmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBxlmhYROs4Seke0ij9biHJVEN2GZFGVWMW5Ctd6PxAVmjgbQk
 6TmYTKbnE5Yn8G4W8ch7AT0JmyBX+hVDrOHFBCI+plX8vuhtS8joFFN6PQerzt9nTtsPyuSYYm9
 aF6euGwsaAGxxcEiujfoCiYnWIrVLYaQ=
X-Google-Smtp-Source: AGHT+IEIfvC759yuVcH02RE4GW4qH2Ys7uHp2NQ72HenyKnTBQYRbNArLc/QN0zNZJGg6Ck/JosV6/HWxtziBHNuB3Y=
X-Received: by 2002:a05:690e:13cf:b0:63f:aef7:d01b with SMTP id
 956f58d0204a3-64436f96e35mr6953289d50.8.1764943877033; Fri, 05 Dec 2025
 06:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
 <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
 <20251205-strong-dandelion-newt-a776af@houat>
In-Reply-To: <20251205-strong-dandelion-newt-a776af@houat>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 5 Dec 2025 15:11:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>
X-Gm-Features: AQt7F2ooVl-aRLrmmqtuqQJpJ731dmMHgmyyfa05zyP1eQASt7uZOJRtxkCEx78
Message-ID: <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

On Fri, Dec 5, 2025 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:

> - We need to figure out the bridge ordering mess in the first place

I was thinking about what we can do here, adding various flags was
discussed and deemed too kludgy.

What exists in the kernel are things such as the MMC power sequencer
which can be found in

drivers/mmc/core/pwrseq_simple.c
drivers/mmc/core/pwrseq_emmc.c
drivers/mmc/core/pwrseq_sd8787.c

with some DT bindings in

Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml

So here the approach is that the specific sequencing requirements
are added to the hardware description (the device tree) but there the
resources are really flat, then the driver for each type of sequence
takes care of the semantics, i.e. the actual sequencing and ordering.

Maybe we want to look into something like this?

Yours,
Linus Walleij
