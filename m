Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39633BFB352
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1410E012;
	Wed, 22 Oct 2025 09:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4A10E012
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:46:59 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4e8b6144288so7985581cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761126418; x=1761731218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWYnqPsGR/+m0VSRYyHFTH5ffcOTH5Kpd/uIr+BQaho=;
 b=a5fuacfw70XbFwqwuobxZsRVW3N5vfAUVqGBcDd2PSFDtrqaFuuk6C/4NykKI3x+8r
 9+NwxK2Hnbmpk3+GyV6c+lGBrLIwVZSwJzZKkojgD4VjNQ7qKNRLGJjoKzkDJ9DWr0S9
 impooiuHal3jd++UOR1uLyRwVfYYKUy3TpGx4boUkuM2JYyV/6cvBj1UZRFlWnJJZOtE
 muOZW/tNPZM0vuIqB1emwI+bWvMsY/tHTgIEy1duarD076vhH0BJj61ToH8YOSqEoEBx
 WCLMkfJudpI+ec5G/rVSpiBA5WLsU+nVYmomGpS+U34WOeT0KaM8VnEs4XEg05fIiXPx
 cgnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Xzbm+3VCyyKrtoIY636P1QeNKGY7G0AccP62XSD4gDnJ/pecS+CIzuU0DAI46WQKhwRWAS4eZ3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlTPDqNR8aeEAiLQx19u8kFxVUlI8UK7xEJYDkXmDtVjHm0EM2
 LvdTmXqyiINiWXqOQ0HuZz3wRg61W4xalf40uQAO07kb02XHuGBLktf6SCmu42O2
X-Gm-Gg: ASbGncuHkyza5ykO2IcSNF8SGr3vskFs2eK4fuj//2SRU51SfDS7nbeTIWCKr1Z0+Yy
 p/qFPgxxa1v4d7P8IQE5MFBhUEhlo1wsFd2ggoViiWt55UJlr2yrmithZCtpS3XlkFDddVDgszb
 E7xT6OC7KtFdLGmKJLUaD1WE9HVkFA0j42B9EeAeY5gHbPN2HrIWHdNkBY9kikk/ko42nTkpDJS
 l2cO0ojf/+7uxj94Qbb2PvrFwrerqrtYLXG7t/WCqX0nLwN4EqCBfeiiA561Dr8nC4RT/9LcqcS
 376cX94+Fi/Rw9O/pjvPtpDK/VVv34J0midhg4pkrLNaKX/wvAoUbcRVJ39ygXDLUKLT1yOYD8l
 M3x4OmpEsbPx7GaYXVX0xxtZjalkTUm/aQA3JrhD5pf+fA878smKek6uoRQso+eqV2kmVFGL7TJ
 vZ8+qWbd5U6UsKPoS3n23V5P1/+qgOB/XszoBMytGtxRk7cv2D
X-Google-Smtp-Source: AGHT+IH5eQyjgGvmuniZP+1lBFHx9I1aIYgSuHbMPgxjkfC3CpML0jJ0i3JA9ccyum0tBAy2uEA7WQ==
X-Received: by 2002:a05:622a:1b88:b0:4e8:a3c7:4d10 with SMTP id
 d75a77b69052e-4e8a3c7505bmr234705901cf.39.1761126417935; 
 Wed, 22 Oct 2025 02:46:57 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com.
 [209.85.219.44]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-891cc9cacdbsm942383585a.1.2025.10.22.02.46.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:46:57 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-87c20106cbeso94994426d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoa5XDl1VjUD+yeCJTnru7r8E8++luTJeJS6CurnUmE8dzP2OWdcqafr5KlGsMqbul0nxkEMqsfPw=@lists.freedesktop.org
X-Received: by 2002:a05:6102:a4c:b0:529:e9a5:c216 with SMTP id
 ada2fe7eead31-5d7dd42f318mr6592013137.4.1761125935974; Wed, 22 Oct 2025
 02:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
X-Gm-Features: AS18NWCUxVmbBX5A4GWgkcFHdLZ81csYvV48uizjGHlywJaqitAbOBSEWovXEnU
Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
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

Hi Marek,

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

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
