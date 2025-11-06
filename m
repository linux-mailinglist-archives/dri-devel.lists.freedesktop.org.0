Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4A5C3B7A8
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E8410E314;
	Thu,  6 Nov 2025 13:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553210E314
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:56:18 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-55966d7e871so544041e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762437377; x=1763042177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q4yuPcnMfQtBgtQPnkkk1N/Kdj4fagyAFwBx7OzVvoo=;
 b=glQMNvJ6kt5lq5kpGyoRI5JVGu8Q32fiB1tK50fBMLWuLbPVnFLgOhSmQ06Crbrxn5
 VdP6EqGiuS2My2Gn6yhmBT2anMF2hT/uFYsZd9do96TvPJ5JCZT/qtWsLdqDRAxmLmDH
 F8VRPthjTeNaZEyH1fm/EjVz0S6p2rNZsrzlCrr9GN6YnDTwcI6Fi46ZR/lg52J6qcQz
 AaCyXiLypk10x9mtuLK/xg/j2e++sVf2rAaVTMpGLKyLlWzbmJ35KGvfUZYnzED5m+do
 sLUptsJx8ytgDcAr5iignhat6funDl9M34hYlQhSezMp17ZMb3sCNpWJqKe6Aa1N4oQW
 ljoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSAt89Dxp9T5MV9AnL8H0bwivEkkw1BK/P2mvlL6jVgmPw5FXb9YdcIZJBZ9vk9z8EHKIabEs1+N8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwINvT3hjgiO/sfEF0LZ+yXphLK8knvG+DeMpyagXSsK+rmr0PU
 xPXgv+AgFJyZkNPlXkNbByyG5EB6/e1DdWfpsHm/toLcn6spujZ+bgyadQPMdede
X-Gm-Gg: ASbGncsHmCbleBeJrx9BfLHo3Jvx/gse3weCYrTVJTQ92h2I+Ut4s1AMnD622F6jDBB
 qc8mM+aodXwWTpM2iurFl94H1KybwwZm28tEiCnflPZ7XJOwSAW/9EVQr0Ut6IUC2SR47F/N0cu
 CJh7gDqVV2yFRzBUP2skuI8SPQKvPzEI3xYSNYiJGWWyvseX2BXTu8ZBHhMtS/yN/9NbNfU7EQG
 1jK2AEHcwiFhodoM7urXemhf4WE3G+UN4EumxfabX+3A2cY192A9U2/irHn8uSrvd0f8xb/p4tQ
 C/Oy7+bm5Vu5eaUM515Lg8nJHXbE8iCg4aQzTyrH3Q8iV0igSGJzlrcmvyPgNAZc+8ubOWE0Z27
 xJFAlEEddTnGapwgDj4XXgP1TDhwsrFpX9zIFiM1+VQ7mlvwiAoivpv+cIuMLwA6scJILtCCVn1
 RUuUlSX0SovMauhfwZcfTXvg24kXkC7cB4I3zjvBnNLvhATGGZK3jL+7cXR0xSWsQ=
X-Google-Smtp-Source: AGHT+IEvLDTl2t4KY5nDKU0yrqhFZ2Na8Ji59khAjHp3ir0pIHySPG1nWAlKQbxrlv1NlGyjmddG3g==
X-Received: by 2002:a05:6122:8b0f:b0:559:6b7f:b0f4 with SMTP id
 71dfb90a1353d-55994e966aamr1151402e0c.5.1762437376783; 
 Thu, 06 Nov 2025 05:56:16 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-559968c29a1sm1117022e0c.3.2025.11.06.05.56.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:56:15 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-5598942c187so1192370e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXWslrJy+sA6GjdqmSENQ7T+S7swqHIDN5KOceQxhF3VkngGrCyNHX1MomhEd8Oug9sl3zMIZRWvaQ=@lists.freedesktop.org
X-Received: by 2002:a05:6102:50a0:b0:5db:de8f:3278 with SMTP id
 ada2fe7eead31-5dd9fe53cbbmr1029811137.10.1762437374166; Thu, 06 Nov 2025
 05:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 14:56:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzK5gMh8V4hjYcfC=H3kfcEeCtJfATr_cmupgqg8xXoQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmbsl231GCYVdw4Orr5ai-by8fSvYdIEmo1Rdt2iWJzgxM7V8AP3oPqN98
Message-ID: <CAMuHMdUzK5gMh8V4hjYcfC=H3kfcEeCtJfATr_cmupgqg8xXoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Thu, 6 Nov 2025 at 00:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
