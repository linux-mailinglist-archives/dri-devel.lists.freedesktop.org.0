Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9FC0E4BC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1F210E4B8;
	Mon, 27 Oct 2025 14:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612BB10E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:13:58 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-5db24071011so5212174137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761574436; x=1762179236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JyGCp9ASaMEVdd7OGwSr0N7G26LNgplWkJBV0Rgw9hw=;
 b=DU/9co+fQqPZx5EZjW59kVD9eEMiLIzMD8gQ8mhMN72QmHOXjc417XyOnhvSBCJBP7
 y6WNYFCGIfixCSITbnFrUwXmCzg906lkX674MxkQvAeyxltkFOTtuvAnyHm5F8mo5d0t
 Ba110LX4vvQsHL2pYMI+RkAGugsOBrpDwqkF6IMu/LRykIp58Ph1ZshPrwZ0r2wqEHdg
 tz1P17/lCfE6rrBMbG0JX08NrBh8nCqsNixPRHb8KrmGg1yYH3Fwr+mXcptBXCiFOe50
 e7OQR1Rz48RiLnNbh8N9Exr1wJByVSO8dUBNUi9SDuobwjhSFumHPS/LZZpdW2/r0U+e
 1JCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4rFN+vdJCFWCHgKYDZFwJHFAGkmmy8XusOauPPqfn+T6QTWi0frX9yMJP1hUyNF/nO3bgiLReigw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxXtSQYp/lcIDz+BoRcIgVXB7288AvwTDtdeSSfpCI+ULvmxdY
 1HYNYawwkHcOyYG1eh24aE9SyxhQQXWB5RYaE4LQLZ9Uus5zlgdUHWzS9p8/OIAr
X-Gm-Gg: ASbGncvKP4zH0kwoLO5xfwAD7QWqIp7YwSkqfMoQCy1ddiFwfuTcMZ43EwmsfmaU9Zj
 3Yy3u6MrtWaPoBsC+heqS/Sds4ahp5tx7wVSE1sP24V5HDcoyZwOIJQXrp68bpAg68zAi3PqdsN
 TqvI7oscntil5QZmR2lUB4KBEnU0MiLUgbvdfQ7bpPqn/nx+jdauZaHtEjcjfi0etjSjvOqg1/E
 h7EspePp17TJ9MR0ELZJd2aQCYW/zX/6CXRl2JHzeMCwJZTRPq4/Nc6ZStIJdH69jNNUgfuUZKl
 /them47Zt93U7PNrzKv8vMPN8EfT5fRqimJ3mIm/Qg6VNVSjoY6sP+OeDxwjyiIG4kXuQ8bHuDG
 b/O/xnwMUnApaKUFjJS9nCANoh1EILm06PSBNScP3NH82inpi6TeVktirupnp499SRV6iCzXgWc
 dv++g2bDkOtt2eZkcNex4qUhYwuBXlbe8vFu+hcCUgHq7x+bb5
X-Google-Smtp-Source: AGHT+IEUw+6oLR9aeqlOiKmEa/qwyutgmaeVdn9Kg0X0s1pJF6CD759AUaEdDs1qPPhmCXNv4G/P+g==
X-Received: by 2002:a05:6102:418d:b0:5db:2ffb:5dd2 with SMTP id
 ada2fe7eead31-5db7bd83ed8mr170728137.1.1761574436365; 
 Mon, 27 Oct 2025 07:13:56 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5db4e5023acsm2715939137.5.2025.10.27.07.13.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:13:55 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-5db2dc4e42dso4857985137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXEgSLoEBZxyaghJOKq3tN3OT+dYsCbdUnVdBuVhCYoayORWynXm26EBgBm6o0IqpGnWF84d2+vIUw=@lists.freedesktop.org
X-Received: by 2002:a67:e443:0:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5db3e22dde3mr3134960137.16.1761574434833; Mon, 27 Oct 2025
 07:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 15:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkADagh4uPO_Rn8vJHrRcLCHt41Yo3zGWeig4Q4PkqMqdfqLZfmPk9_Qcg
Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
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

Hi Matt,

On Mon, 27 Oct 2025 at 15:08, Matt Coster <Matt.Coster@imgtec.com> wrote:
> Apologies for the delayed response, I was on holiday for the rest of
> last week =E2=80=93 I'll apply this to drm-misc-next now.
>
> On 22/10/2025 04:37, Marek Vasut wrote:
> > Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> > present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Thanks!

> And just to keep the test bot happy:
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@i=
ntel.com/

FTR, none of the 3 lines above should be added to the actual commit.

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
