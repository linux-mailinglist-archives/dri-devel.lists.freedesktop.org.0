Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6DADABB1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387C110E2F3;
	Mon, 16 Jun 2025 09:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YyVwo6Zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDCF10E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:22:46 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-553be4d2fbfso1126808e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065764; x=1750670564;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
 b=YyVwo6ZrXc/VJ6J47kS7zxDgMk45bfNwCzK7m1TmzvTKc9c2/G/BWDdQsDEkbPYSQe
 GptAXOaXHlDLsD/qB2fFRrXz6VT2LHUnsWlcgSYeQHssx/BitYgAW3M7gUpemDv7QH3/
 oriQGvtV81JzNSruA4XihNFiKHmPnMfV64cp5BJ+AqoaeqZOx1PXMBcb9vmDYZ6VqR5U
 s7BatfZ+FMcjKixHwXfgaIDSWKsjU/kymXbVMt7dxZOK30faVBMevEktBRV0Ypnjq5XX
 xC8DJGwyx4cuADkdjbBv8UmB+qyK0wPgDspo0s0V8MndxdDf7FCwsVgO7khCrM5w4ZC0
 WCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750065764; x=1750670564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
 b=gXCCNmNVSF8YezM+sA0GgBqLBINvQEQXhbH+jhcAdINFaO4Vyxt9kLKGyefI0M061x
 DN4xCCRlhC7T/llPoNd3KatjsgcGX84ue/aZy4ohkezvKaPnKTpDrrRWwQWwlJDcqyoC
 2GrUurHTNHUb9FVznejzCg1wxmuvPtdMj8Um4z8pjfWMKltViQMdqlPwvhf9K7ltC35q
 afMsK4WzLuJ4ufdyMbf2+LsgAiEOqfurruencfhRl/0y/mVKESPvS5zwF0gS3n7DAkCg
 U0tvj4g3ApvBjOwCjOEyF0yQp/plSdZaZ+rHTIIggq2Q5LbrZQuKueU6JSSis40J+TRG
 zmLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVYV8qeQPRLzPhfu3I82HVj/kwARWc7dXGh3W4BQ5SCigVaM1l4h+coQNYLS3o9y0028g8YD5Omq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyG5rksCC9IZ5q4/dGhPdONkTDTa8/hwfoB8uHx723UF44bsh+
 XDb0ky3G4JyyOYiqZDR6l4zWCTus9vJV/+iA/rl/oGE2iMEUeiZvqo/nrabPy0EDT5eMCZ/xx5g
 crjwYDrIpbPW7+pW9I+QRTWjZG1hoFAa1ldps0Mb++w==
X-Gm-Gg: ASbGncumQb4aPfVWRZUhus0/i1xEdZp/W7xuXDiRaXj9yN6mhzDgBd3pQr1Hoq095Uz
 ulrlscr0XsYrlqrPgp5QwwS15UwFgvylJ40i7ko9MRtSkxkQf8kmFbJAQaY7WFsZ01MxjLW42v4
 FYzZVGDdY+T8+ipJEPzMmfUqImJAdQHK/gXdEYHMxkVxjrsGUj27kdgPlTBWyHqYmrjhFNeWdO1
 yw=
X-Google-Smtp-Source: AGHT+IEsBvyH0Zky97WuBrKbbjvEScgzySvzxn3rYYtDfdyw86suCq566xBi9HBUjAShIE2Mm9O+XZUWm2PEcQ1RjmQ=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr2068254e87.57.1750065764330; Mon, 16 Jun 2025
 02:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
 <CGME20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8@eucas1p2.samsung.com>
 <202506151839.IKkZs0Z0-lkp@intel.com>
 <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
In-Reply-To: <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:22:32 +0200
X-Gm-Features: AX0GCFvGdfEg2CPyKVWjNTkacG-9vOyaV6LbrgzY6YJIQBzVINyrlmiwiBnsQKI
Message-ID: <CAMRc=MeG40TxMj3ezeC0iUBBo8w99RXQWOQBsfG4ZAJdbA+dYg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, 
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

On Mon, Jun 16, 2025 at 11:09=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/15/25 12:51, kernel test robot wrote:
> > Hi Michal,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]
> >
> > url:    https://protect2.fireeye.com/v1/url?k=3D6c3bc994-0cd954c9-6c3a4=
2db-000babd9f1ba-30c2378fa012fc4a&q=3D1&e=3Dc39c960c-4d5f-44d7-aed7-0097394=
dfc81&u=3Dhttps%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMich=
al-Wilczynski%2Fpower-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driv=
er%2F20250615-021142
> > base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
> > patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4=
-8-8e3945c819cd%40samsung.com
> > patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver fo=
r RISC-V
> > config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0=
 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lk=
p@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20250615/2025061518=
39.IKkZs0Z0-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-l=
kp@intel.com/
> >
> > kismet warnings: (new ones prefixed by >>)
> >>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM=
_HELPER when selected by DRM_POWERVR
> >    WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
> >      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
>
> I believe this is triggered because RISC-V can be compiled without MMU
> support, while MMU support is mandatory for ARM64.
>
> Would an acceptable fix be to require an explicit dependency on the MMU,
> like so?
>
> depends on (ARM64 || RISCV) && MMU
>

I'd put them on separate lines. While at it: how about enabling build
with COMPILE_TEST to extend build coverage too?

Bart

> >      Selected by [y]:
> >      - DRM_POWERVR [=3Dy] && HAS_IOMEM [=3Dy] && (ARM64 || RISCV [=3Dy]=
) && DRM [=3Dy] && PM [=3Dy]
> >
>
> Best regards,
> --
> Michal Wilczynski <m.wilczynski@samsung.com>
