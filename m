Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB498ACC98E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 16:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD74310E627;
	Tue,  3 Jun 2025 14:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NmMEdMQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A946C10E627
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 14:49:31 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso6167813e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748962170; x=1749566970;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
 b=NmMEdMQTDq0PD/jAF5/yZBJZtHObneHuUcMJoYuGk3P1ATSZpwrNBjjlubjx+/UF2D
 dGofR71UM5Ggdz8F8ZXYH0zhbwPGmW6tj4vKhmJ9tQ5QZZMLWbkajfswOPYfabVxMHjP
 3d69qw5kMdbc2gHF5GxA0W4QmANoevd/2Lp1ewLtO3b5w37m2EX7XUhFONFegdTjBilN
 Ljq+3agWTCjBqFoITiZ+gKlGRxEhs/yJOJpsEGnSOyybhXA3/XOQaS97g0/UypdGazVo
 NSrMgFAI4z+M2nzQv5F46hRuLHA2zjQ73rXYhN1dOB7xEPD1haz7BVVFJmSm8Cp2zMBO
 zWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748962170; x=1749566970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ex3LHxHEHJ4BZQ38M7qwegLl2zSlvRBxwaOVQhyHde4=;
 b=aFCC4ZmNX7ZeD2gXWurOA+kroucqtutIoQi8r/oGrRm4nQUonpPq29W6JqOco2hiPr
 hihmXOfWgITxOymjiOWjDV0lAUbInMT4BfmLTybf+VPixcCcDa9Ra+bIbxr8HGR4I4aw
 aqm+S72Vh5aVHQnmA1Mq4Ri0inAIoRuo8sTk6uGgquE9XREmm6pb1GUBfaQBr69Naxsq
 0ZQiZxTFHyUUZVtx2cz+ISA1rZJuzWwcUhti+7c/7oHyC/U6JwwnyYuJsKJ+BWFuvkfS
 nR6vmdZYXpeqMLXJahEDTpu+bf9MORMLPjYHukP28F7paDaV4B06KeliKcZnxImtDjM9
 GbLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI1R6E27fvM6ylPLw7vg5FAf2QPR3WE+ORT7DV2tX4E4uGUFxRwFlape/I9F9A6L/Kxt410lkNlmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcPo9zVxUyO94IKfIk3IKm9o5KmGBcCaOYhcWK4YeXbK2NnKob
 sVWCYTxGK76DTWEvPqgTI5QHHik8fj5UahA94HyWTtyd1SctU4ngVgnzE+1p0RP38llKeOAwkY0
 aJqo+6QC4D73fZ+wfZaLOS2kA/KWbaE3mP/4FaPcKVQ==
X-Gm-Gg: ASbGncu5MbSy+RsxK5vjcQPtFhnTgpcyLdI4CSH0FBr6JL5L913S1HQf40+H9SfBz8l
 jvnQJGTjAqizavll/q9ls28AudUKkgmhh21naDilqCQPDMEHQB7K+A/VWzwA5Yutp1/EpU9tktb
 M87wm1tU93bAp8wOsckfKE+rHfjIaDhMyPcZH7Y33OllZOXRTv96Tr8jTpyby3JdnrUrjMcm2Lh
 A==
X-Google-Smtp-Source: AGHT+IHc0KihO6QMjKjy0pMBkN2tQA80vRJ1vg3x2S+UcGNd55YVBv2aTqZA0Vmu7gFOqc5cx2vs3hmS2lLX+V2bUMY=
X-Received: by 2002:a05:6512:318d:b0:553:23c4:6822 with SMTP id
 2adb3069b0e04-5533b8f6183mr5171073e87.13.1748962170032; Tue, 03 Jun 2025
 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
 <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
 <4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
 <20250603-cuddly-certain-mussel-4fbe96@kuoka>
 <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
In-Reply-To: <CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Jun 2025 16:49:18 +0200
X-Gm-Features: AX0GCFs2qeMG4HtPzgixdlaSw6fJIrCjF4lFG8AFOQDBjIfm0hhKZz_Zk6uhWO0
Message-ID: <CAMRc=Mc-jjULmc=3fS0qZgXbq9Sgfg8JBoH7peWML1PdyyyH+A@mail.gmail.com>
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

On Tue, Jun 3, 2025 at 3:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> > >
> > > The compatible string could be updated like so:
> > > "thead,th1520-aon-pwrseq"
> >
> > Should not be separate node, you already have one for AON.
> >
>
> Agreed. And as far as implementation goes, you can have the same
> driver be a PM domain AND pwrseq provider. It just has to bind to the
> device node that represents an actual component, not a made-up
> "convenience" node.
>

I'm seeing that there's already a main driver under
drivers/pmdomain/thead/th1520-pm-domains.c and a "logical sub-driver"
under drivers/firmware/thead,th1520-aon.c which exposes
th1520_aon_init() called by the former. Maybe just follow that
pattern, add a module under drivers/power/sequencing/ called
pwrseq-th1520-pwrseq.c and call its init function from the pm-domains
module?

Bart
