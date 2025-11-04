Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A5C30245
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B66B10E566;
	Tue,  4 Nov 2025 09:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E894510E566
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:04:12 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-58de3ab1831so4962389137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762247052; x=1762851852;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO6dE6UElPiJpkG1mq8m4CRYqFTl9ZYqxqWs3yM4h1o=;
 b=aycw/wfTvoxIepzNbzfaGcH1AZ89teC7OxVUz7cEJkg5ygIuclQdqOxfXU0KkshXfZ
 K79bATolKt0ePGAMzNojTfccqC6QE0IL9hmiUpf4H0NL6yUd2o9Y2EA/tP2HeyIA31Ix
 izgu+Gfi7EjA0PJ+/eGtIqf9UChKoPNYvn9+R/NQH9FjU7rV6gBwCudz3SpcQ2zHSQeO
 eW3Xuk9jQP4Po8MEhPHmHud4atc6bqzpV35VehTLEC0V9pxHTmjUiRakKIWuDRvpvdCJ
 8zgtJWc/+/N/cQ9bzbB3gGYvZyaIrrY0GKuz3dWLOv0kCZiqdBvAiFBon2OvdxHU470n
 AB7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjkTMHtO1/vuTQ97t9v+G1k6y3Vr+ivsT846ykCtrl6nqbbRRrHgDsHzYMHOL9qb9VAhR3witeqb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4/K/KGbwIyMtpNuRuguFOZ6F58wNMt0ne9fsq9PPf/9Hv17/2
 v9nhgyMz4x1QHpg8FyKdcMp5k9773Bi5yx/DCpxd/Hb1oC9D39G6TSp9kNnvlN6C
X-Gm-Gg: ASbGncsP0yr2/gkOnJpIRi1K3TgIhZmqKZLsAgy3oUi5M1QXzeQy+rGZkT5TLOfZ2H/
 9/gkEwQ30VVzeyau2PLvlUxejA6TxuC5g/AEa/r26rIpedm4MXJjZiJROqQRtgLMI4vsmqOR4j6
 G19DAbLATz1Gi/JTs65A09zuLrwREK+m9xSqN3GVeUdpeseIad4E69JOv4LCgBhqpQk22X4pkqQ
 CdCTi/WikR8oRtVGWTPdRXHN69yIOp92QEnQb0DQ4TMij0M8eQiaNC+Dy0twlscia63cL5bwX+7
 csErE2WgFwon+IWMTfP7gIAmp1KBARb5GEdXEPt1zRsEkZb+oA9/JwjhDS/8t/diLAfDPbJ6qvn
 sNmtwjstyB3GIRZFaspi2rgk4+pSCj+5vdv3fELgS682AWVwlq6Yp9JTnDunnP1QnLKspTb5e2P
 CLZUG0ITo8ctfTdg8sGz6Ad/bxL+tkWBcKm9uysEoSmkSJTsDL
X-Google-Smtp-Source: AGHT+IElp/X7+dbumRT8LUXBahQamwk9OYKPc8x+J0FV4Xbx9nR52ItObZNdzr9p34jEPOOWH9lpDg==
X-Received: by 2002:a05:6102:38d0:b0:5db:2049:ac44 with SMTP id
 ada2fe7eead31-5dbb120bcb0mr4602272137.13.1762247051559; 
 Tue, 04 Nov 2025 01:04:11 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-935490e431fsm374679241.9.2025.11.04.01.04.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 01:04:10 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5db221488bfso5638395137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 01:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCJH3AQ3hVmPcHSRD0QB0t4WkOoY/Sf91hEa1gqnIi3MzFjsENzAN+B9/TECxCkKWTaW1aWOBfSCg=@lists.freedesktop.org
X-Received: by 2002:a05:6102:dcc:b0:5db:ecde:5ae7 with SMTP id
 ada2fe7eead31-5dbecde6663mr1599267137.32.1762247049753; Tue, 04 Nov 2025
 01:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmlcpVQIRAtDzcmHfsASxj-kOO0XENw5qhpcWFOCPThzyKdxDz-JN4eLYI
Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
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

On Mon, 3 Nov 2025 at 21:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
To be queued in renesas-devel for v6.19, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
