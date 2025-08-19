Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BBCB2BF25
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7AA10E591;
	Tue, 19 Aug 2025 10:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2E110E591
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:40:48 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-50f8ba51c85so1739856137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755600047; x=1756204847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=doFbpw5H93w6OCFZvWHsPgEA4fiQmo1QkgmSlnIHgck=;
 b=YiDfpgrqlSFr/U+uamKr8F/KkcMRMCbbIBMPJkG8Bj46lU9UA8GrUz7RodYZNPyDlL
 AD7dZO9wz2rD4uLQMjjO/fZS1OvuHNXmnlifMvrfEDBFggy972qymX3YnJkH1yE/puxV
 Jm7tATobIUll+O6iHPvIh0Y53WOmFLmDiXnkRREVymIVBFNrgibG1EpO/eznDZATXNNg
 wVw9uMtg/SFAT5H0bUDgXMvHbC7e8y2b8zCGC3HSvNgPzq8A8FlSxlZH4crgG6vxchPT
 iqXoVw6K604NAsJW8Mspc1iUPFTagWq3WU1k59SaOKpyRK6ngWdvyps4qapVPdRvLMWL
 lCBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeO0/P6TE5FtwqOocM7ALIfHSFsiP5B4FMIRvQtWy0fDzPDtAm6drfbITrCw56RrgPcUbRD7iyTgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdaiuNFZeLL9rItGPOL1owE8lm5Qhbfnsvl4XdxGQV6HbrBHQc
 xYEMbnW1BWqi+6fd6qTnJM67o3Z8LZ7nZupjEjC9oQqiOkfK1yT1MPQ/EKkSvJ1y
X-Gm-Gg: ASbGncu0TnBS7LqJElMgyzeslSEL/h/MFWZKtqtLR0HEtB+dUZmiOeYbH0iS32SyAW6
 vCg2IMJONDWGV6qMZzU9So/5jzbEoGkcb77mK6vZ+1pd6vm7ZmjhN5+0c2D+5GLatPLY5mLJIST
 HABuZ/pX+yWKMLEk9gYW0uJrl4HSUsXWomWDkPPQXRSQLP898WJyVBMhKQLlVvAeUs2FDngagRw
 SOOTa9zJFi4F4Dz+OqPdW7yh4GTIUHAEF0tRJBqpNN5FDfKP4U2IzSrPCRu5ssOGpEB3TJKSRB7
 j3bl0jIQcRCpm2HGrzw2LiKSM+czSduuoQcPIvARNrRYLnldFDMRBySk+C3AU2WMDJvSTFq4FSF
 KrVwOfT0EMJNu64TNErXY8B0zeUG03B6Rs+ZlmCNHHslItkZm5GaUDtl/F6XD5AIq
X-Google-Smtp-Source: AGHT+IG/42P/lCvNALYhNrqSJiOju70j2dgaMetn1iokQ7P+f9DnraWA82HcpCKLV7p+VAYNuDS6fQ==
X-Received: by 2002:a05:6102:b12:b0:4fa:55e:681f with SMTP id
 ada2fe7eead31-51924b43be8mr694033137.24.1755600046960; 
 Tue, 19 Aug 2025 03:40:46 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-890277bea3esm2281741241.3.2025.08.19.03.40.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:40:46 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-53b1738e8e3so3841822e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV99hDY5Np2Z0dW7H/Pm83JbXoufYUbJzaZuO1GkdYhYQ21IvqOlXnX8KRsv7iUWqh9RY3Ucf9ocRg=@lists.freedesktop.org
X-Received: by 2002:a05:6102:548a:b0:4e6:f7e9:c4a5 with SMTP id
 ada2fe7eead31-51924b3b1c1mr573466137.22.1755600045268; Tue, 19 Aug 2025
 03:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
In-Reply-To: <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:40:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFxaCrBu0fAJX3wmY9wdgHn1O8-cVOS6OKN6HGX9v55g@mail.gmail.com>
X-Gm-Features: Ac12FXz7ywVTeSgdEqc13iyHS6v2zZGzk_1Dft3Db5rZ3MNDTn1vQslXfUK25bs
Message-ID: <CAMuHMdVFxaCrBu0fAJX3wmY9wdgHn1O8-cVOS6OKN6HGX9v55g@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/V2H(P) and RZ/V2N
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Mon, 28 Jul 2025 at 22:28, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 28, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
> > RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
> > with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, t=
he
> > RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and require=
s
> > five clocks instead of six.
> >
> > To reflect these hardware differences, update the binding schema to
> > support the reduced clock and reset requirements for RZ/V2H(P).
> >
> > Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
> > RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
> > reused for RZ/V2N.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v6->v7:
> > - Renamed pllclk to pllrefclk
> > - Preserved the reviewed by tag from Geert and Krzysztof
> >
> - Included support for RZ/V2N in the same patch
> - Updated commit description.
>
> I missed mentioning the above.

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
