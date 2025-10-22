Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FBBFB2E3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB2C10E722;
	Wed, 22 Oct 2025 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA22710E722
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:36:36 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5b62ab6687dso5568940137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761125795; x=1761730595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iC35CdUT3A8sztuK5L0Sfjwp3dV7/QYG5xsuOQkj92Q=;
 b=f0Jub1WrsEJpPAXi7PxWgfipscVngt29qS6ldF6jqIiIgUReR9l96/Anwm8m0xcEzw
 MRWBudVh/MHMi7gTudCeEs3iumIVWBYGRdh8GXopYdQu80CO0t0720xd3Ni5N3+yROhK
 umiAEFA7YoSQkiTro108bxeAA8U5zXw5ml48J/m5fAX3+fdvMr2IbN3ribdHYYZy3Q1P
 8t0XenTpkcEc91EXsye/zUvLosKJY4P00NNNFrOQCaXzH9JbsOZAdtQpMATBMpvQjLNw
 Ti2NIACPMeSlIRJMFSqTa1sO1GhpJQyJHJcc91mCfaAr2dQ99DSRpYU7h+oLWFRgXXSU
 Pfrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmxpeX/OyrZI0ur22mQ5E7tbVYWfHk5Zn9Y4aj0zZMZqXTkXETvCT3QvUi1DGphRu9VcETcaikDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1ywpUpMbEApU7H5m3vbBVaKXT9xtsQCgyvDhU+o3QjFZm9rtR
 YW1TS+YLw6UH8kPSFfl3cvWtKr7LzwZ4wUTXvaZm0Gnlfeq80EI+DIWFPMz9V2wu
X-Gm-Gg: ASbGncsp3Iv4erCRn1yp6wCcUiRyZ0bf6B+vCUkTycHbXUNLuO73mqNz4dC6CUZpM7p
 Bbbwyp5tUIlUhMoJBtY5wMlqR8C8fll8fEaysRvFfsZapDy+pqnTdPuq6K3gZfyvSbaDG/LI4ok
 4Z/s/RWA4yNVV6SCsIIF9ZxEggrSWyAaKTTdstZJIQlkUd2ov1CtCz83ebd8LbFngxEN40UHsyY
 rv6kjT19TI0LJE7X+FUtAyo7aM9eVfaWTVsFO/+IoDgivRFOyMJSoWMbjP1DvO/zCBFm4j0qHsX
 YsNvj3n2olcoUSIBO3brZEGauPgYcB7IVC5JwPMfzyg71nD1boceR2YzhErPMkzzvnrL/uWlPl6
 Y93GWe3V6UcwJUHxPx85e5GKbxBfX8SAa1unTOTVWfDZKnguP95a2EemnjKXy0AurwyYbHqoT5G
 XKj8dCo9nLyhm9lBes0h6W62nGY3ER29HXkqhGeVDgCVxnMawx
X-Google-Smtp-Source: AGHT+IFwOvIa4OvYjI9PgLieBHO5be3XYhT6SAnZhxC12Fatkd62ViJoiYaSdfbMohkVyA1Ujf9R4w==
X-Received: by 2002:a05:6102:a51:b0:5d5:f6ae:3908 with SMTP id
 ada2fe7eead31-5d7dd6d3bb4mr7004793137.38.1761125795349; 
 Wed, 22 Oct 2025 02:36:35 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5d96c0bd369sm4415790137.1.2025.10.22.02.36.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:36:34 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5a7b2a6b13bso4979568137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4q941grcSAQVul0WEXBvapFE3Y4R71VNdjNRu5Hn92ry1QkyRyWR0Ey9lTx2n94rk3FV6rDxooik=@lists.freedesktop.org
X-Received: by 2002:a05:6102:d91:b0:5d6:101a:9f31 with SMTP id
 ada2fe7eead31-5d7dd6a12f8mr6743560137.31.1761125793941; Wed, 22 Oct 2025
 02:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:36:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
X-Gm-Features: AS18NWA7snoGhRQxOaxa6kVLMYHHHQNhnIPgqBT0Sy_KqfLK2Lq6CACxKqN_A0M
Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Frank Binns <frank.binns@imgtec.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
> for related userspace bits.
> ---
> V2: - Add RB from Conor
>     - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
>       maxItems count to 3 and power-domains/power-domain-names count to 2.
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string
> V3: Split up the allOf section addition

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
