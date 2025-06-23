Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522DAE46D0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6305210E1E7;
	Mon, 23 Jun 2025 14:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qYOjZqTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA5210E1E7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:33:07 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553d2eb03a0so5869334e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750689185; x=1751293985;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
 b=qYOjZqTSnKPkeB43GDXHQsprv+Tqc+ysaR4xBb5KzQRTdodgvOY5sYq8f9mPU5KQPo
 4N6zylHt9ttj8ANxTMh5bws52cQw4hPuywYChiQK6LraJi8pO4qX0uuwYeHN4XJzJ7jR
 DHIQ46LwJQP/vPV+HFp1A6M88IGYazt8erMkRgGQ+STm+NoQbqtsu1Se02u5uwkZomMF
 ft+zWBYDCrEEnuHUDivz627gIVlDXrKyXvrtUM3wgrmuLRp6MMGipqoF7jaCzSkZrtq9
 oCZVehppG1aYSs9oxUJhbXje5qco/qHNKCHQ8+kdt4iW0FLqiqg1WBnm2rqafaUwATBI
 NEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750689185; x=1751293985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9kmviqp5IY6ttItDCr2Op9/HvBDwWl4i3kTfEm4FXc=;
 b=nNPdwuDfhHv57I6OD1mNpiGQRWs45bKmpRlONbyfAU8t2uTsFNMSjvXOnbbC+mE5+o
 aW98DrQ+5pKObBFVnYC583GD6xWvFW1F8nhhAzLuYeujPMBch7OUo0B9Mj3KWnj9gz6T
 XnTF3GMA1dCrQYZSM8qht9C52uIB9+/XVsL5RvYk/aprCoBtDQs2nACdbJd/r8BTDpi4
 g/9Ghc2ShliwY3juyaEzl0t6YVGHpJsntulg8m5eS4xoVJH34P/vx2kp7PajUaAOnzzd
 Fs4T08NTjiI27VDRsxOLVChc3WChVfANkpsvH7qu8g1UhO3xHcTIJwIfpj1aYkxOtHZi
 cNkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaQiOJ1u8IN4YUR9qacgML3emuM2tnFsC45w4QnQCAwih2XwO5xRmXGEyEgiynIPRkFyezNUyDHpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9GS3oHFneq+ZNSDHGLYEQ+JdRDsaS2VZ5Pxup8aqrENtqKbEk
 PojJjZQxyi25M76XpO1fakZ4ql1oEWCFYfOmb3H2OueTzhwGwAMS7OuMHRadmBFE1bTzBlEJEW+
 dMdwZYc826GYeVpXltXAYPqJ7vVHTX8b5NQsHqmnwFA==
X-Gm-Gg: ASbGnctEK6zWdq1QJCNAJgTisZV03V8HBPY8ULEUUuX0YZbZP3np/tsF1a59Ejw6wI5
 O6yQVwx+xqR3bsq4z9CLzodXnNU++wCAByvA2kBt3kC5n2UAldp7nP3ar7F7oNYFiEkx8RhLSz0
 Td51EeDVws8Bfg9dncPUiZ+R6Vbxo+eV3l0LNuCZ6uvHsvFBd99Mi+FRZmuuf3Y5cARXpHWoJld
 w==
X-Google-Smtp-Source: AGHT+IHy7lPbB51UgKZbeAiEHWJjzs4pV8mJk0NbuirPhDOStHcXQ3Z+f7X+tD5fIjGZbRD5DTCBFLexuzsXjZ0eBBQ=
X-Received: by 2002:a05:6512:3b25:b0:549:8ff1:e0f3 with SMTP id
 2adb3069b0e04-553e4fdf72dmr3670967e87.5.1750689183720; Mon, 23 Jun 2025
 07:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2@eucas1p2.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 16:32:52 +0200
X-Gm-Features: AX0GCFtTbdiml00OQLqQ03QSeuySTknlMk23hbdQ1cT1QnS7KP2eYmI1IjWfLlA
Message-ID: <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
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

On Mon, Jun 23, 2025 at 1:44=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Introduce the pwrseq-thead-gpu driver, a power sequencer provider for
> the Imagination BXM-4-64 GPU on the T-HEAD TH1520 SoC. This driver
> controls an auxiliary device instantiated by the AON power domain.
>
> The TH1520 GPU requires a specific sequence to correctly initialize and
> power down its resources:
>  - Enable GPU clocks (core and sys).
>  - De-assert the GPU clock generator reset (clkgen_reset).
>  - Introduce a short hardware-required delay.
>  - De-assert the GPU core reset. The power-down sequence performs these
>    steps in reverse.
>
> Implement this sequence via the pwrseq_power_on and pwrseq_power_off
> callbacks.
>
> Crucially, the driver's match function is called when a consumer (the
> Imagination GPU driver) requests the "gpu-power" target. During this
> match, the sequencer uses clk_bulk_get() and
> reset_control_get_exclusive() on the consumer's device to obtain handles
> to the GPU's "core" and "sys" clocks, and the GPU core reset.  These,
> along with clkgen_reset obtained from parent aon node, allow it to
> perform the complete sequence.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

> +
> +       /* Additionally verify consumer device has AON as power-domain */
> +       if (pwr_spec.np !=3D ctx->aon_node || pwr_spec.args[0] !=3D TH152=
0_GPU_PD) {
> +               of_node_put(pwr_spec.np);
> +               return 0;
> +       }
> +
> +       of_node_put(pwr_spec.np);
> +
> +       /* If a consumer is already bound, only allow a re-match from it =
*/
> +       if (ctx->consumer_node)
> +               return ctx->consumer_node =3D=3D dev->of_node;
> +

That should be `!!(ctx->consumer_node =3D=3D dev->of_node)` or preferably
`ctx->consumer_node =3D=3D dev->of_node ? 1 : 0`. I can amend it when
applying if you have no objections. The rest looks good to me and I'd
like to pick it up into pwrseq/for-next in the next two days.

Bart

[snip]
