Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243EADEE29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D619510E838;
	Wed, 18 Jun 2025 13:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lhnr5EyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA12B10E838
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:43:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553644b8f56so7139821e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254194; x=1750858994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
 b=Lhnr5EyIzaLkIqO4myjI2NVUnQtKOT3kusUTPjJhc6vnHJ4QvXa1pAS9MXNAgmtP/p
 W9KfhwEqywY3A1Mj0whOO3OVm5FMUXQ5qAKQhigdXit15MSJyNGdmUVssgzRf5C4qB+b
 JDvlzZBqDQitRcsLONL0m+vzyG3ixY5DrckeZ5D2B86rmwXfIjwi7ec8KrrtQqas7bHi
 5TtZhRs1CLDmfLVAkbxGqV5eLwRndjmo3/5FyYmhF5XiM5sQKb5VUm8+sYpaT3wYvehf
 LgAvTHgVqdQVvm7QmubLbm93apY+4L8TAsp7Y+8bd/g0JPkq9ol6p0lgb3N3wui/p9i9
 Y8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254194; x=1750858994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XesD6Pa6NIjfeeecwOLBDGIW61X59xU1PHMFDOzpvY=;
 b=RrHgxWg90DwZPfjf73S4CSMDReOLa3CY+nDrNAl5o0kAciqgAeI3W4f5RSmDbeUsHs
 2J6F0wcMofqzjspTCjgq3EwykFtlg+fofSzymqtgb5PlUW63z+roU/wRs+olqXc2t3HI
 HYH8XtvJ8uC3ASXsY5loi+B4h/xpLaRdV7Hro5UvkKB5A/6yVPBDkKz0U4TF+JvCp9RS
 ztzBmzeO1AKWk7Pjl3GRZfnEG0JdFh51n0YrBUBkLeH1nKtneKKncP1MJltEhOCNZ2wG
 0QI9pnK6HhwJMz/0/CVyKPmOUkz4wnFc5QXZYjVGESf7/+5sqByOXgbmgeYE+iZuLQsy
 hpsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVve95kIq5DkXeDXNB4FUefWTiFs509V/Sl3sjuTsqq6wEY8bc4Ey7vQbkQx7VhwYsVkQhWuLDQjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxspyUL4KL0kCmwr20vTIH4byFSbMMErkq38V6+eaBl4c+jchFi
 SwS2c51wMdG6E8yODxmgifJMZ6OusUiOIJx+1W67V2szzfwY59JQUJbWaapNxv8N1PFbj3ondo5
 0xZf9RNV1rFCD0rrRmKm8ATAtSmhZOJv3Um5WNmGNSA==
X-Gm-Gg: ASbGnct166tVu4TjjXnBSXx1KvVYfTPsMpH+jnw7v71peIjCZTsQXrLtDQYU8uSn4RC
 A1yqHBondY2uxj/i0N0JwqdoB0/fEGS9Axm/WGQsE5H5gZ64FKoMro+ZVt8E6xmaKCos1G8coy4
 od3X1jinjCS3hz9vfsbqIJSuWWDe0+1VYEetRJQz6HzmnOxPHw3Edtn95QAFi7btioDSuge4e2K
 w==
X-Google-Smtp-Source: AGHT+IEECYD65Et/LmSBnvEiKApYIkAD1brUDvo7BBfhvnXlFl9/WYj3FARtHuaHKB5NARXPoTCzd7KIs42A0Z1Qt14=
X-Received: by 2002:a05:6512:2351:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-553b6f5a056mr4801515e87.57.1750254193987; Wed, 18 Jun 2025
 06:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:43:02 +0200
X-Gm-Features: AX0GCFv-psDNb6_Ffk6XjHdwrMsid_b9idm2knOXcGXYQtnqAYke8L-CxfsFZ0k
Message-ID: <CAMRc=MeiCT2f902h4viFbue1tejv7EGBvEjdQhOTuqDqEViwRg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
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
> Add the "gpu-clkgen" reset property to the AON device tree node. This
> allows the AON power domain driver to detect the capability to power
> sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
> driver for managing the GPU's complex power sequence.
>
> This commit also adds the prerequisite
> dt-bindings/reset/thead,th1520-reset.h include to make the
> TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
> dropped during a conflict resolution [1].
>
> Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d6307=
2a1573431e51893 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>
>  / {
>         compatible =3D "thead,th1520";
> @@ -234,6 +235,8 @@ aon: aon {
>                 compatible =3D "thead,th1520-aon";
>                 mboxes =3D <&mbox_910t 1>;
>                 mbox-names =3D "aon";
> +               resets =3D <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +               reset-names =3D "gpu-clkgen";
>                 #power-domain-cells =3D <1>;
>         };
>
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
