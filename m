Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C5BB3EBA
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236210E199;
	Thu,  2 Oct 2025 12:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2098310E199
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:43:01 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-583a520bd81so473469137.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759408980; x=1760013780;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bGY2VuXcVd4t9vRCqA3KNBgIjrj7zClngJ+L6UFqlI8=;
 b=uJitWH8OZhjTY2oBdRUKOuKDN44jeFn9r0osAz1/cG0d9kPwyk7Bj1upyeNOrGc9u+
 NTsLG36Yw4diD+ASXrPhlr/yr5tD7/yJx5dj3B1PWmTcLfmw32Ff3wC+me+OT82t/WNk
 AWbfnJLzDwgH0bxmzs/CyIAFdWaXKBqG3l1xZu1jF24u6+kUp2jSsCQAdhbuINJYWc/M
 nf3snq5r9JZjdfnM3v4GmSxRboF01t2yJtLM1p4Uo28dX3rjmQMPkXeUzskoA+7yweDC
 86MxSrbqJb7O1xyAB2qQEvioROWSnVJZJsoP4JVvry3wSE869Jsd7NZfrq7FTvS0tdaQ
 sPEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3U5HRZyQ6BCQUy/uMgGRVx8X/oIx1efo0wVnUjQXd5DPnY+aR487crGa0SGxzHId2th718Rofgdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdww9Be14BA+Dao+ro70WZE3iFwvIqCm7hSH2c+DN5cHUMbXGA
 n8atOs8zCDoAXss5w7AnZ8NWqrts+hMaelvekUfTRCNoWjACvQVzmJxynqVglr9zDNo=
X-Gm-Gg: ASbGncvhpOyrteimSBIZltkIiSZ68fM8MNaahGm7/zl0mo6fTZf/c/rCUkrR4jPMG/T
 TmLK0Rb7LzSWt9250ip4Kl4wmnal7DNgWA8UQTH+BUwg7iYzUOzl0jgoIGFZHMyxcziFDAiAi35
 nCqp00JUNIn1gYu3fUQTh2xEVWK7bWBmRApjZvpX8jahoslesgNs7FzM35jymCoXJAAbFwdHr6j
 zWFH9cU9h74PQVx+TbxtEDxpmVi4sD8g2FWVadTGs8+upOKoVZMshNeo05+8/fiLCbWIZTHkA4t
 h5AWdypdmiFOTOGf5w5wxWdwN+gdtBcZ9S47Nr64DwEkKSRrHZ9w5ms87EVreb8pO7bcmBbwRvj
 nuTH4stbFvv4V7zgS3zcSIy40G4tIwN8qy29DOdeo+mXxc18e0RUAbzTRGqwtrqiFBZy4trYqPM
 f5d3o18Fp5
X-Google-Smtp-Source: AGHT+IG+wU9OFkqtHQcrB1/Pxgb+VLcaPdmn/Pb4OkhTQxk+M7QQAVzq63dLmfEBQZ1aqOHWMypA1A==
X-Received: by 2002:a05:6102:4410:b0:52a:c340:11db with SMTP id
 ada2fe7eead31-5d3fe6e4c32mr2756163137.27.1759408979822; 
 Thu, 02 Oct 2025 05:42:59 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5d40c505950sm568086137.5.2025.10.02.05.42.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 05:42:58 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-89018ea5625so396827241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUajJxBbbYokfbc8OZATLM6oOszZkoj1XR0UCJ38jVQVmI3dKAPwutj7ddPN8AD8HOlI2rslPzHcW8=@lists.freedesktop.org
X-Received: by 2002:a05:6102:418b:b0:555:ef1e:49d1 with SMTP id
 ada2fe7eead31-5d3fe6ba0dcmr2875038137.20.1759408978222; Thu, 02 Oct 2025
 05:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:42:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYwaqmmnz946EM_v6pQtYFVtRG5raqAvw2HXWp=wcQSw@mail.gmail.com>
X-Gm-Features: AS18NWCgQZQ0eMLLNpMbDyB3hL-2VfZ9TK7OVaQtlKFCCNmGinudcosDhtA0r-Y
Message-ID: <CAMuHMdXYwaqmmnz946EM_v6pQtYFVtRG5raqAvw2HXWp=wcQSw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
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

On Thu, 2 Oct 2025 at 14:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2L DU driver is now also used on other Renesas SoCs such as
> RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
> on these newer platforms.
>
> Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
> to be built on all relevant Renesas SoCs.
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
