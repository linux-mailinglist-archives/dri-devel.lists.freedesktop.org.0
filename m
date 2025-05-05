Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDECAA96DF
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC6210E2D5;
	Mon,  5 May 2025 15:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ADD10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 15:04:46 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c922734cc2so514556085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 08:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746457484; x=1747062284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQ9jug1fRN1yvNW6wnb1QXO89WpVeOCqzDCpI6ZRvAQ=;
 b=pZcGsfdukCad/pR5qNgpIu+tyRs2SpEnHWSoSKA20rcf8yFmfMVvajuPEaAUu3Eonh
 VUu7pPT+2DLQUqjRqYgxmn5D039ijUeXJ8b/6i9J9JGy1QWc3fLGrPFUZ/TjyNC9nuJ/
 e7erkXbDJRKvTZisqzH5aOaPlbyT+QqFbOzuL4iCkvcQSQVxVpBX1vF+wrvJdRQjeDQY
 PKcicHk1/QP1Xvc+vEVO0iKYqDKcC13lHlLJQ4d4jAUXdggz6m9xT4nYo8F7D+LsPfli
 d6X93Nppwk/+OE2G9Cxw3Zg7u3Gf/f6fLBdJKRgxI6nvnsT2sZdlkcXPHxR0RDHftoQU
 bvag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHXQDznNnQCuSvYpHZ2hHfue8YXMRYfmoXojQlnF2t7HoFrLPJ2aHH80WcsBVW//7WYHeR5J0WBwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4xQhbTWPj9RPXYlKTDZSUIomVYdLOTOqRNYZmkaMCmt2TL3fN
 GF9yn6hDJRKXmrqNLw4pUqg2I3JdV0RFzcDU9eutwasF5jRjWP2d/zhmBu0B
X-Gm-Gg: ASbGnctetbJFyQrOVd4L2qg9OCZUCEtK+Rpo4gO7WkbfhfU8ylFoafeXH0eSp/1wu7b
 fAN9Axhi+/uYXwdUYTqpOQIs7sCqcc4VIlzk3akRDXiGI4pVOWPh0+9FpFIAFqOCrCirjs/jka9
 yqd/GGG7pq485iNDjia6FZQ1HBDxxuFMEDjpItFbXRwF5UzNsIIKBTysmR9hdM7bt2qn7+cYINP
 5AYy6usKtS/b+nmtUHleIyG4zFyvxFaFyuEAImGC0qCp77eREV3yDJe2FbZKefy2gJH0spByKWE
 fhRGLRRE4aKduvIbH4Bm1HeIj6JQNW5EGgr7EiFjQbJWJePPJkfKVqGm0kmvLhwBn/88lS5GVuR
 gr6d7/H4=
X-Google-Smtp-Source: AGHT+IGmkE3qyKsQ5uWm7F1VwMLo908kq9dL37yiz631pitIuuO3wB0TPJaPlThRS6XvXP/1HXUMcw==
X-Received: by 2002:a05:620a:178d:b0:7c4:bca3:6372 with SMTP id
 af79cd13be357-7cad5668ddbmr1989996385a.0.1746457484449; 
 Mon, 05 May 2025 08:04:44 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cad242b587sm575785285a.77.2025.05.05.08.04.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 08:04:43 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c9376c4dbaso529001485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 08:04:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9K8QtaY4ZSw0I1ofvqDfBAG7Zpvr9OoJwgheioD6eXBTk/9mpoOMdVLIEb6Q662QQrey/+apCVGU=@lists.freedesktop.org
X-Received: by 2002:a05:620a:1aa4:b0:7c5:93bd:fbf2 with SMTP id
 af79cd13be357-7cacea249abmr2184067585a.19.1746457483117; Mon, 05 May 2025
 08:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 17:04:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaUQL5SpHn3LhOAXjekcSny4dqVRpOsoH55+LpCZbc1g@mail.gmail.com>
X-Gm-Features: ATxdqUEOtG3XXxLqmzQMjTNb2y4P8FgtJLglgkF0XPtmWs1pQXZT1INZTTkHBh8
Message-ID: <CAMuHMdXaUQL5SpHn3LhOAXjekcSny4dqVRpOsoH55+LpCZbc1g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N
 SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
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

On Fri, 2 May 2025 at 18:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a compatible string for the Renesas RZ/V2N SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
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
