Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BEACB3F1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D52110E545;
	Mon,  2 Jun 2025 14:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0Gd/+yMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DD10E545
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:46:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55329bd977aso5568640e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748875601; x=1749480401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
 b=0Gd/+yMAbEijK9E0J3rVMXhLZ2trApV87o2mlQHaKlQpFuykmwPIz9lNUjsJxi3W/D
 bNqx0fF4M/083sdxfQ5LtrK4tSBJ2LDGDCI7syNve3obqOyOS2y1le5HdpVvL4XxOpkJ
 +MN0FX/ZwtDYnDkk7jRTWE7r46s0JtUSG0Z99todwTYG1tRWBG6lrWnX2h6PketMQLow
 XA8yK3YLzfvYG/T9MnGIuPmsT3eaXXbSkV0vwxx2cYE9ZPsEqMQgI9EjlUT8lpMs7o+k
 T50WZVv59fJ0nTBCqBFlc12pMejWE61FF2tlKgdPg22zIWaSeIHhz66wtaj1LhPBCmDj
 /r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748875601; x=1749480401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
 b=NDmhEMrs2Y3TV1MzBrJMAAHZqZrQ0zDn78qVtbKKp/xWxv0h4PKIVSSV6Xexqs+2+C
 94uhl1O/rvQi649rXsiuBgR3q52pxMsPweRmLUHBroS/1o512wsfCn76U4SCDRCebBSa
 0tU4HY5JLS4/O/TUpiZPBfu0qzwb+/SiHqtjeBo2zoSBUiokJ35zKcNBaARm7DUwCndX
 JgMXLt1hfPwsviuI/RP92KUYz0G9Mux6p3b1Z0FjsOyBMC5tckEreGJEOuWo+6fAhzSd
 3D6/UPIbX8Y0JTCQ0asYnSrFIEd/xJUwmonCHA1hyJjD7WhSKcaFI6523nqkNjW5KzhR
 vKvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlW+TRWsZAJSc1QhP2KKopBftb3Yy07vcMXRJxiS+8Tv73LMKI4GJwyMnZtsSqcfQFBokECM5pY3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1Nyhb6+XGvfRkFb4V9Hyun2pLmSVcAyS2fFF2CpR/q5E4VKN2
 cnCCnnMFjxncskR4NlWO1kbk1fGCSDzFesJraOBk7cawz3UTo4kuv6J45L1UFkvlxxe8Skfocmp
 mxNUWL1bIghxXF+bd9g7BfTwmUuh1weh83nvdD6pyNQ==
X-Gm-Gg: ASbGncvZfYmQcl3685lZkyzg/RnZo8mIK7z1tX1vB2RKILEn9vO4bSKM1HPIjBcfI+z
 3jRtW6DYDMG4aCaHrJH0b6kaQs/y3nuY/4GoYob4TVy4Qihg/gzm3tqlpHl4S53YsIPD8MtZRS2
 3y/PDG0wDj2Mwku7xDAIqKYJWGNOLr+S6gzU/vE8prL5SRybC5PzyXPA79dmpQjCxP8/asltBph
 HQ=
X-Google-Smtp-Source: AGHT+IGw32F/MdMOccKhZO4XhdGXd2zDj9BI3w6oPi/36aYPhkJHPAtjAIeBiB8am3xWo3XPqYfLxYrbf7Mw3kihmy8=
X-Received: by 2002:a05:6512:118d:b0:553:2bdf:8b87 with SMTP id
 2adb3069b0e04-55335b117ebmr4997380e87.10.1748875600944; Mon, 02 Jun 2025
 07:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 16:46:29 +0200
X-Gm-Features: AX0GCFvisvrL36l-aUNnU_LsfSK7tpw2-raHvXmZ5rzs225tzGALdRdBL2pjUL8
Message-ID: <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, May 30, 2025 at 12:24=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce device tree bindings for a new power sequencer provider
> dedicated to the T-HEAD TH1520 SoC's GPU.
>
> The thead,th1520-gpu-pwrseq compatible designates a node that will
> manage the complex power-up and power-down sequence for the GPU. This
> sequencer requires a handle to the GPU's clock generator reset line
> (gpu-clkgen), which is specified in its device tree node.
>
> This binding will be used by a new pwrseq driver to abstract the
> SoC specific power management details from the generic GPU driver.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-pwrseq.yaml        | 42 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.=
yaml b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4c302abfb76fb9e243946f4ee=
fa333c6b02e59d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/thead,th1520-pwrseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 GPU Power Sequencer
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description: |
> +  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
> +  This sequencer handles the specific power-up and power-down sequences
> +  required by the GPU, including managing clocks and resets from both th=
e
> +  sequencer and the GPU device itself.
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-gpu-pwrseq
> +

Before I review the rest: is this actually a physical device that
takes care of the power sequencing? Some kind of a power management
unit for the GPU? If so, I bet it's not called "power sequencer" so
let's use its actual name as per the datasheet?

Bart
