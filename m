Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AEB45660
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 13:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9510EB85;
	Fri,  5 Sep 2025 11:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TaEX2cGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF9810EB85
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 11:33:22 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-337f6cdaf2cso15700311fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757072001; x=1757676801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
 b=TaEX2cGymx98O+TEK/EMW09wmqqoO3tF9/Ko7h7E7X3FL+gBlMhPOKQHxhSkqsYXIW
 sCB/9ypUuXheG2czJ4Kw9zthagNsGxCAPYl3tb1DxkZahu5n7GO2gIM8bYeDS5Njngak
 vjnNlF+WLmcx7d/zQwl1Vdq2TivAVCzoq+CG+gaID8yO/SdjGTgE/rXIBl2hY09zHeEA
 L1+2yuAdrVnlpx4ELMATtgGrsRT+0J70Nyn1fWCIwQTdyA5LdjRz6uLs8sMHljd315M1
 o6oLitfoMF5IwFvKY9r+TIcBit1QijFmOR6xMhga99pZ8Yq1nsDuufYceyTC2QDxmS1P
 mdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757072001; x=1757676801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
 b=o1sTbcjI6O+h9F3ZDaYoJideLPJp317gu/xjTwQC9iZI96EXwc7VKMzfKfUQ/W1w39
 85Ly6vEmoBlVbY8ohmB4GGMXya4Y82J3o0paGFhRpZPJwDkui4DTeKEcrhvg1ehShgCz
 lFLj0fVWg7CWOIFIqgdrPvLko1CgeFNKL5MWrytyYXrsIMC1ZgUEK/pkWJofkZk8J1Sj
 hFxKukz7iSuUFqganjLeez68FgpV4GcQNRu4TVGAF+O54dnJjprMNre9mgjP/E7ECTD/
 d5fj9HzHMNborgAG/Z+1J2gc7EnrEN1cOw3Qzq/EWg/XWrAYWj1VIVSi4ARvi1cwWtRi
 C80A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLKU5CDQrA/TRjbIdVEJJkiSwg/dOHidgqTWMIMSSl3iDdXL+VNTC77C8euH2hzvbcKmFAxHoVTFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcP8tvJs1hS9WqmPbfbo2MhepNzfCWDuOr+QolZmU+gdGlEW/t
 jgUMl13Wk74kpicm87vfjvGjLwc0jzKSzzD0txYAEQ0SNiYCgHyfAeB2wifdlH4B+L3/Ad4dIbm
 +TFoBH6ku2vBgcc4NUdS7tU/g9UenTkbquRsrHscM+Q==
X-Gm-Gg: ASbGncvU810eykL+taxkIXukQ2ASDPqDlAUsRBl2gmhX6eGhiqTjfqBD/8MsOKD+5xp
 680Y7RVrSN0mnXLuoxEvEGmosvdQJe+zRXdp6s+6u/SMd24JYabpl3BNRcffIWYhAdgqGUVwpfD
 0WX8UWtV3JAsH7m2RsFt6441rL8qeAt8Ek3RwXo/QjbSdqcutsZVUQFh7lrY843mnBJuul/5Iip
 XzQN61tc16AwGeHhw==
X-Google-Smtp-Source: AGHT+IGSWO4nCHB8o/6t/y6RH8BOysPzoQ6jiv8gZqcTwwokf+Kq7hYmaaHYY9kCJZ1mu3fJ8bEoY6l6Nt8aDc5ponQ=
X-Received: by 2002:a2e:a482:0:b0:336:7c7c:5ba5 with SMTP id
 38308e7fff4ca-336cad21f17mr50388961fa.23.1757072001159; Fri, 05 Sep 2025
 04:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
 <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
In-Reply-To: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 13:33:09 +0200
X-Gm-Features: Ac12FXx6o0aglHH6TQGfVH200HSX_9WYooYS5LFefZX_Ln3xQz4XYXPyVN0c3dY
Message-ID: <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
 angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, 
 davem@davemloft.net, edumazet@google.com, flora.fu@mediatek.com, 
 houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, 
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
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

On Fri, Sep 5, 2025 at 12:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> > Hi Ariel,
> >
> > thanks for your patch!
> >
> > On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
> > <ariel.dalessandro@collabora.com> wrote:
> >
> > > +  ce-gpios:
> > > +    description: GPIO connected to the CE (chip enable) pin of the c=
hip
> > > +    maxItems: 1
> >
> > Mention that this should always have the flag GPIO_ACTIVE_HIGH
> > as this is required by the hardware.
> >
> > Unfortunately we have no YAML syntax for enforcing flags :/
>
> Theoretically there can be an inverter on the line, so from the AP point
> of view the line is active low while from the peripheral POV the pin is
> active high...

Yes, I think someone even proposed adding inverters to the
device tree and was nixed.

It's a matter of phrasing I would say:

"Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware."

s/always/nominally/g

Yours,
Linus Walleij
