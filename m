Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D3ACDE05
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935A810E76C;
	Wed,  4 Jun 2025 12:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Faf0xuPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551F710E76C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:33:13 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-32a72cb7e4dso71948991fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749040392; x=1749645192;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40H+9TTXhZnTaMd2EZ6HBT4RNOeVTmMt2oQhHbe4EDQ=;
 b=Faf0xuPehNG2ZMR25qgECbns9lXJ6x6FidU7Jl7Tunb1+E3+dc//JoFgKzS+cqJaYK
 WOR0O0/752vQkFTTwJVwOHHwD2G8vRqkK/Gvung3ftgJbQarHyiIJitw1UAD4p/qBZVq
 dJFnOMSv+tIxlZ6Keqe97P33D1Bqg34DyxUPAhUGGx+UFd9evM6CgzlFD9cVbawSqjLb
 wT5BOSKdY8+umzqL/7vmXcJndzzSjLfPddJcak66VcOONLwBSgJMdvNOuRK5pce3c1f+
 Dg/NCLo3ICMzO7b9DLEqE73KmKdFy8dIAfaNxvJ3RoDBoHL43yJpfnTd6TDEHI3Vy3An
 uCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749040392; x=1749645192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40H+9TTXhZnTaMd2EZ6HBT4RNOeVTmMt2oQhHbe4EDQ=;
 b=N746rx5txqplPMNk5K23NP0fSHvYaLdmwloDmJz9uiSh+X4yAWIyB1BOSLhCf4FHlT
 7eW9LOzjsVcBfeNvQatt9UuBssPnqF5CHdaN3sc+++iKSgqbIffg91jPJz24+DW9UyFM
 f+S/nwy4Pw0NS7ZhrYwjFBxF9YsCRy5JRFmPtfc62Ed8qyHUYrBSFhcD/1+34wsIFwGK
 oC70Rrw4GN6GZq/SMgyDv0jYeVauT/9f/6Ym+uQHzWFc8dnC7NR5Wk/xV7JZxhk04DY4
 p2qv2lotiGAB6NBLO/Am16ATHxb0Us2p9jlQTRSv9ZrwDqnucY3DgI9ha9MjanY0Jpuc
 WmgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtOBsjCXk6MrPJ1Fsux02N3brWDzYYsVOxibotqr9+P/5w3VMFM5eKm3a6VFeiSaMhzuxK+Piu4nY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX0tc5O27XmN9kGkfjrip4GxHRBf2cVDwiXijtn61PwX2aJFxp
 84TijPK+Z4wz4Ni+6R6ym0NXUlY2ZWLI0SlFZ4czKh3xD7JrUfVYCjmi9aEb8TJ7TlP5Jnpp6JD
 aupco1jZ0ifIXwXgAC+JrlsoSmTbNQWRkDmaOfOdHzg==
X-Gm-Gg: ASbGncu8hiVlbvOK005rRWOXTYfBbBeyqprPpdaI8jNn13G7iA9V+gOZZpAAZyhYrhf
 c1Kq/honzdXV2mcjWUfo3JKwDFoMc0uRQQhnGwGqVUqgFBgtCdXFyZT/uqa/Vx0uEkNDLrf4JE9
 MNzsUlawseeMnm9FK75EyjSwynSSUL7Q+HmufbZk0djZ1zm/LGt8ajS49fo7tUo/4c
X-Google-Smtp-Source: AGHT+IFq6pmnr37tc/Op7F/Fey62yojVdrF7s5RRVTPIUfG0sHj3PJlgFBWhtvoFugeUVElYakwUgAd29fPyfsZ3DLg=
X-Received: by 2002:a05:6512:3e20:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-55356ae0e10mr766979e87.9.1749040391631; Wed, 04 Jun 2025
 05:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
 <20250603-gleaming-mammoth-of-kindness-538add@kuoka>
 <c49ae9f2-3c3c-4253-be85-8fe5bbb4b42e@samsung.com>
In-Reply-To: <c49ae9f2-3c3c-4253-be85-8fe5bbb4b42e@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Jun 2025 14:33:00 +0200
X-Gm-Features: AX0GCFuJQtZdn8gggvUkoP6l-v_fzn9vXleutgIfablo4CyL1FqiXWHXgL-Yqpk
Message-ID: <CAMRc=Me75aGMic-GZuqCe+v=8MmmK8DCyfVZj=ELR4VuG-_qDQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, Jun 3, 2025 at 8:45=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/3/25 15:22, Krzysztof Kozlowski wrote:
> > On Fri, May 30, 2025 at 12:23:53AM GMT, Michal Wilczynski wrote:
> >> Add the device tree node for the T-HEAD TH1520 GPU power sequencer
> >> (gpu_pwrseq) to the th1520.dtsi file.
> >>
> >> This node instantiates the thead,th1520-gpu-pwrseq driver, which
> >
> > Explain the hardware, not what drivers do.
> >
> >> is responsible for managing the GPU's power-on/off sequence. The node
> >> specifies the gpu-clkgen reset, which is one of the resources
> >> controlled by this sequencer.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/d=
ts/thead/th1520.dtsi
> >> index bdbb1b985b0b76cf669a9bf40c6ec37258329056..6170eec79e919b606a2046=
ac8f52db07e47ef441 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -238,6 +238,12 @@ aon: aon {
> >>              #power-domain-cells =3D <1>;
> >>      };
> >>
> >> +    gpu_pwrseq: pwrseq {
> >
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://protect2.fireeye.com/v1/url?k=3Da53ea5d3-c4434f50-a53f2e9c-74fe=
48600158-c81092475ef416b3&q=3D1&e=3Dd333d06b-0b06-493e-a358-e29ca542dfe7&u=
=3Dhttps%3A%2F%2Fdevicetree-specification.readthedocs.io%2Fen%2Flatest%2Fch=
apter2-devicetree-basics.html%23generic-names-recommendation
> >
> >> +            compatible =3D "thead,th1520-gpu-pwrseq";
> >> +            resets =3D <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> >> +            reset-names =3D "gpu-clkgen";
> >
> > What is the point of pwrseq if there is no consumer/user of it? Looks
> > like simple placeholder and anyway maybe the future consumer should jus=
t
> > use reset directly.
>
> Yeah I think you're right, I wanted to explore adding the pwrseq
> provider in separate node per discussion in v2 [1]. But for the v4 I
> think I'll revert to the v2 way of handling this reset [2].
>
> [1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQ=
hQMTWy1yyrRg@mail.gmail.com/
> [2] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af=
2af96c@samsung.com/
>

I think you still need to connect the GPU node with its pwrseq
provider (which will be the aon node in this case). But you already
have this link - the aon power domain. You can parse it in the pwrseq
match callback to determine which GPU is powered by which AON module.

Bart
