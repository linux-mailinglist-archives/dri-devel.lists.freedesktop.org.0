Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1042ADEE12
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5610E833;
	Wed, 18 Jun 2025 13:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S1BRtFdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8110E833
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:41:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-553d2eb03a0so887760e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254061; x=1750858861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrPSIGFdDvH/sqDpr0dCl/uxSDMMDHtGVw2V0lw2wqI=;
 b=S1BRtFdWvcEq1E+ykJSuonppnLdyF9HezXNFl31SncMVdh4r9b4mBSgPbv0fz/hfSv
 qLStHW9oTe7x9wEUChlCtKd1rL9F6gVfDZkR/2aXD4XTHYt80pcpvkzVRqByXycbD0MK
 KqgYfBS3MBsb4DRA3v6oMvd4BsvRiEREi9TdNjRI/2riUwYDzaJj7iBcx86HBuwG9M0x
 BGMSuNB/oJdQMPv10N0cT+lUEWIuI+U0MWJemV8SrNbHTc9AJqMHWQGPlX+wCAeuCVCz
 tD1Vcui9RSU5mNT3Lj58oEBTc1TDlHDsEVTO5suBBSCfWsjnNHOIRQaB1TdjHn+Y/sQC
 vicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254061; x=1750858861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrPSIGFdDvH/sqDpr0dCl/uxSDMMDHtGVw2V0lw2wqI=;
 b=OgFfZwlmMbZFP3QgBetjIZH4AgR52lYeqCzOoqouS93AFjzh/nrzRbF0rkxXntErKR
 Vzs8UQ3ybe74H3SHYBFuxy8tdzcbtKE6Ey/xPCoqH5dRauqM7KP+dIElcuMnOVmBtQTz
 Xmw/cDtUYIEv40pkKisCmOIOfYqmEkfG8yCSvLVt5gAhJezRXuBY0JH/a++uDWNFXuSg
 xJ7P8d/vnZTo5yYPcKYnN/88q5wDx+jX9IyUqDXrqxPW1fZQrRhIpZUtMICm09UAfSLV
 Lm9qHz5BEW7UuRZefbjQ0A+vRPTdxemho92In+jl0oldYuH+gfOkJ77sGxoItCK+gs/j
 wxDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcqHXKpyDgswNrC4+92AzeuDmQfl/bftzcJtM9DOpR0EvvDD3ASoUQygjPFTKytP1wi40rwyAr7Pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Cwx8odUwp1/kmCEBf/N6esBcUopHMD/c2RMBWwgf8ylJJebo
 OEIReU6n91f8YpRabU2Kojx9HkTkeKN522+Lcn+QNwKni4q3iREEDxpQbPyqaGV8BQZ3lmKg53u
 la2PrXMTjzmBGElIJ071DhsJz+1bZGMUFqZSuxAXSZQ==
X-Gm-Gg: ASbGncsu5cjwu8YtNRh3a06dQ9avNr2XXFFR38KBTqgWU8gXk6j1BI3CyCvFR4r4Znt
 HjKhslMKO56PN8g4VXI5uTsWBQVmMkUgNUL7LFrNvrOfH/0JARu2AZWLbvzxkxlfRXCWqojg4FC
 FEa7dkkUXCCj4pXSTrU3wV/7mM55FHMigGNJVqaN2StH661dQMqEYkVEfx4NpT70cLf++aDZvHD
 Q==
X-Google-Smtp-Source: AGHT+IFaBv4NoyscEiYMrPy3nG50l45WGg0pb5gyw3nSvWsy9OTHWeanUensQSBBIwLRpHNCc71NZbTtG782jD+L4SY=
X-Received: by 2002:a05:6512:150b:10b0:553:d884:7933 with SMTP id
 2adb3069b0e04-553d8847a54mr20662e87.6.1750254061265; Wed, 18 Jun 2025
 06:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:40:50 +0200
X-Gm-Features: AX0GCFv9aAVOTlnyOx9_bS0PZ0O5sUFY83rUOThbfDgpmQkEdj-PgI3MnYHtNsE
Message-ID: <CAMRc=Mdv24kKJRKMyp2zpNtumZLV5QN=KvvENr8GXfORAC9Cpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Extend the TH1520 AON to describe the GPU clkgen reset line, required
> for proper GPU clock and reset sequencing.
>
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen reset).
> Only the clkgen reset is exposed at the AON level, to support SoC
> specific initialization handled through a dedicated auxiliary power
> sequencing driver. The GPU core reset remains described in the GPU
> device node, as from the GPU driver's perspective, there is only a
> single reset line [1].
>
> This follows upstream maintainers' recommendations [2] to abstract SoC
> specific details into the PM domain layer rather than exposing them to
> drivers directly.
>
> Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@im=
gtec.com/ - [1]
> Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel=
.org/ - [2]
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml | 7 +++=
++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.=
yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400de7aadbb21fea21911f6f4227b09..3365124c7fd4736922717bd31=
caa13272f4a4ea6 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -32,6 +32,13 @@ properties:
>      items:
>        - const: aon
>
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: gpu-clkgen
> +
>    "#power-domain-cells":
>      const: 1
>
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
