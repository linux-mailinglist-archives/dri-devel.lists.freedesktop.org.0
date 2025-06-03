Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50936ACC7F2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427810E68A;
	Tue,  3 Jun 2025 13:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KPuetK/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7146B10E68A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:35:30 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so6601328e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748957728; x=1749562528;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIOXxCHtKeBYGzNsgywd50i1FC81LtsnP0F3u2yP/Ow=;
 b=KPuetK/sVhOFbqHCI1dDpcDcfkVdeoXxo+QPSKuDn6IEa2/hYuxI6ZZl/ICbWRcxEw
 +1uicrYp9PRC3l1NxiTy+gpV4uRCwWVbpPY+UQkTtCl3uxkvP81SUUeBmAIZJFsah4IY
 wd58ZoS/cLgUlyxRCP41B340wWh31WvUFPbil2jDxTXGUCACzEHpO2brURUDvkPmLGg4
 wH1qD+OZ8EqweEhFHDGIXJGKuxhwvQJxtdIfz38x+hIF/YrrOoKbvSdaUKMgisLUhtE8
 i9GuxE6+Let6/a9UfPrA9w+mjqGQutzFwpyDbTzvNE58UkWd8X4GqAkRSp7ennjzmH1Q
 fAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957728; x=1749562528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIOXxCHtKeBYGzNsgywd50i1FC81LtsnP0F3u2yP/Ow=;
 b=D0mbH96ryX2qwwbNuAXcUzs+6Tf5FHzhoxKFFcSlUqT/HuuHIcDNfjy00FIzdIVTEB
 Oz3Iy3Dbm/FS/yFy6kIgWZmIE4ZNGhlsUw0U0WxSc0AmLQNC5E+Wv/5IqcP/V90xTIcG
 4UU8a4Mj8O8E0ft3GC+TiCiT2YJL4N4kz4nT2jcd6bk/vSP49I1zDQ+jR/TwffRDrW/b
 Ijrc90/gD42VMg9LNvD2XgugBK/9ufb+pvu+fWOPrUyj4dddvlujpcYe+lKpUcN3vD6l
 XVoRvF0HKrasrHysumfg4wlVGXwt6XfGVJCKuLY36ZDvjtCzLPfIu3cj2/8qHaT9nztu
 3BWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnTT20vgKQH/9fcy+uKLC7O3HK8z/4D1BsL670JKRr4IKXGMTDp0pZshfNrATPUucvG+tiyrZ47ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPv9fE0FTtQavfyCPXhMJ7AZcflhp3HzXltXlXvhqZDuNoFOg8
 1nCanvWhdALefRFos+lIMDlOYW+qj81FYY9duANkvoGTaI9EElM2VCrSiiiYeXMMwbhqYWFHGSl
 y5v7JRLtuPGxVnxJUWq4H5nqyhnzV1XzJFo4WK15W7w==
X-Gm-Gg: ASbGnctKb7mFtRgfBIRMQpEExPomO1+T9wA8J27AOIH1R3RCrTqmxK1a75wZ/VOinBZ
 dCi2/A9siomCcmb90c4OrPJgiEt/R8VCPNnXlHYGmO8s+i1NHlQuDxfYq3C+k8IItB76Q4F/xUm
 kDytoiJabf+6l3T5rKvN8c4eEbBl+fF6W78YFnSkSbvc7qJgGlxFmkN4R3pMu8jFM=
X-Google-Smtp-Source: AGHT+IG+4ruICaQP9WjnJtvSTT9EmK06oaor1STRsfEcgxfGLSMohUV22g53UcbTlMgO8PAYrxi/zYRyt6cxM4CKTj0=
X-Received: by 2002:a05:6512:3a89:b0:553:2ce6:c749 with SMTP id
 2adb3069b0e04-55342f5f525mr4032820e87.24.1748957728189; Tue, 03 Jun 2025
 06:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
 <20250603-cuddly-certain-mussel-4fbe96@kuoka>
In-Reply-To: <20250603-cuddly-certain-mussel-4fbe96@kuoka>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Jun 2025 15:35:16 +0200
X-Gm-Features: AX0GCFuDYKD0oEvnMgBkM50gIAPDgZLFL7Iyce01c_hFdppjyHLpA9k0Aap5-Uk
Message-ID: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,
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

On Tue, Jun 3, 2025 at 3:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Jun 02, 2025 at 10:29:13PM GMT, Michal Wilczynski wrote:
> > >> +description: |
> > >> +  This binding describes the power sequencer for the T-HEAD TH1520 =
GPU.
> > >> +  This sequencer handles the specific power-up and power-down seque=
nces
> > >> +  required by the GPU, including managing clocks and resets from bo=
th the
> > >> +  sequencer and the GPU device itself.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: thead,th1520-gpu-pwrseq
> > >> +
> > >
> > > Before I review the rest: is this actually a physical device that
> > > takes care of the power sequencing? Some kind of a power management
> > > unit for the GPU? If so, I bet it's not called "power sequencer" so
> > > let's use its actual name as per the datasheet?
> >
> > Hi Bart,
> > Thanks for your feedback.
> >
> > The hardware block responsible for powering up the components in the
> > TH1520 SoC datasheet is called AON (Always On). However, we already hav=
e
> > a DT node named aon that serves as a power domain provider
> > (Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml).
>
> So no. One device, one device node (sometimes with cildren nodes). You
> do not get another device node just because someone wrote incomplete
> binding or because driver looks differently.
>
> >
> > Following the discussion [1] about needing a separate DT node for the
> > power sequencing capabilities of this AON block, and thinking further
> > about it, I think the binding should be more generic. The AON block can
> > manage power sequences for more than just the GPU (e.g. NPU, AUDIO,
> > DSP).
> >
> > The compatible string could be updated like so:
> > "thead,th1520-aon-pwrseq"
>
> Should not be separate node, you already have one for AON.
>

Agreed. And as far as implementation goes, you can have the same
driver be a PM domain AND pwrseq provider. It just has to bind to the
device node that represents an actual component, not a made-up
"convenience" node.

Bartosz
