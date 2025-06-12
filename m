Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DBBAD74CE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1901710E061;
	Thu, 12 Jun 2025 14:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6910E061
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:57:44 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-53119fe46d8so306008e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749740261; x=1750345061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLGpxLsJSw4q7Wykq729C6wwN0Wlwd+qKs8+s0wgaMA=;
 b=iVVciW2jwT5z3U91pWAt16AqJamHOJxyEUXqNgSAVL3KldvFoF9M+tKkI9aRVhSE8q
 B3oTBYxj0qmoiXVmRHsISkhiggfQurDCNI6R+2FGK5hfaQ0w6daeY4GLDGZhTBydyPQi
 PONxJvDAf50oaFVEm0DNxhdw1x+e7aBl4zgs1CV82ksjoVn+Pb9G0heGcAXHA6oJn9dj
 gKqXwJluUgtWovHBUEcw65GxlE2VNLdzXJg1IeiG2J9bxg/D951ygYmZeTc6ykNS98XI
 drf0Wh+JxhtrDpa3+NagzWOqeU0LtU9YHfvKDIIizf+ux3PxFvF04Qql125npQrYZqhI
 2+Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ2dPrh8gqjBO3cTmP2NqVlDqBLzoB4PWcWTkNzVQ+nXqNZLw/I2cfABTq3jXpLT5GRd2m1gXgDuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycDr42Ykqkxi7vfPcbWwzPstk9r9BjLOTaDIDRawjOLIzzm+9Y
 RfLIPVBFgfh8n1Eb5azRaK1aE3Zb5JNj7D3GZMrTBuVVABeJ3xmEhlcmlqVmEP36
X-Gm-Gg: ASbGnctdC8K3OIxf4rNXrfhAhuE++5gC4qnyU5fcnW61bNVtzbSlXEDmOWUqe70tGaz
 PzDg6yZh5v7qJpyrlL8i0qDeHalgx1p6m2jkncFziz8VX72lQrQI/pFtnorB2dsPTdofT7lU/9Y
 OTOWZHpEVYVnzofD7k4VWUy0VkyIUiklJ+KFWs2KA++xGNaGgZRB2mbv+J4bS5d2C3OJ0vWVzFe
 IkxuH4uWsShoQ81dpva+NflzPs2uPMPFxm2bZKIJEy1XCBBMswWgd4OFl5N3V+G4p/jd/LkFgNm
 zojPRcTo4tHu2gvkKeUbLy7wZYMHonLlLrXp/GI0IUw/76SS3srGzK2q0lZkJKN3Fd8fBoSmLUn
 UdCMSqZ5Xpf2lF4WOnW3dGiUVQrwZ
X-Google-Smtp-Source: AGHT+IHENhrVZZuaa9YuCkAlNUXHRo1opBz53SpH5U1xkfKJuwku8OGmxuJAhsF7KeroTNQ86EnzMg==
X-Received: by 2002:a05:6122:3c4e:b0:530:65b3:4920 with SMTP id
 71dfb90a1353d-53122284e0fmr6950793e0c.5.1749740261315; 
 Thu, 12 Jun 2025 07:57:41 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5312f65147bsm312489e0c.31.2025.06.12.07.57.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 07:57:40 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-527a2b89a11so385642e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9ePSPADrzqbN2NedUk2DItEpoEA9FySK8hM87qp8fISmgT2YS35a5ZWEU9c3la6xXUnglUhfr78=@lists.freedesktop.org
X-Received: by 2002:a05:6122:d8c:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-531223a9d6emr7462655e0c.9.1749740259843; Thu, 12 Jun 2025
 07:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:57:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpP2g_XVgV-Lo-iDonioykPxOdj5u66yacGBBKwCFiVQ@mail.gmail.com>
X-Gm-Features: AX0GCFs6fvXldOJS-VLbdO_0YPI2sLemmxiH0HgmfiLcqEebgyfY3165_oOXBxo
Message-ID: <CAMuHMdVpP2g_XVgV-Lo-iDonioykPxOdj5u66yacGBBKwCFiVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, 10 Jun 2025 at 01:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
> The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> driver changes are needed. The existing `renesas,r9a09g057-du` compatible
> will be used as a fallback for the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
