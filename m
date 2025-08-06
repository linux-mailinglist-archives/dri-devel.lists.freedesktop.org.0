Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C283B1D30D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC0F10E7E3;
	Thu,  7 Aug 2025 07:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QALehhaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E66C10E3C2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 08:02:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-61571192ba5so9416239a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 01:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754467356; x=1755072156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+BQBZ9mG3r8g8Z8ux87XZsQLdiS0Ur33NaYL2k9WZM=;
 b=QALehhaQpepchj5P+1DJtj4mIIW3y39rDaBJT9h2PGk6iD7k6RKgOsuFPF3ntWoCFZ
 0VvpGKiDXCg9XnnwUUSXERykwOSoAu62QZOdtx/W1e91mvcZkOMPQlYsDy9ZFArYiYGX
 jDRQK6K9/1FuvKXcV16X5tIQG+/eftP02tvUguiMdktYRzGpPpQ+hRzRCY+YXH9H7Fu4
 mjLM6RTZ3muCIzqwRYjKVNoncljcIyKII0DLVo1tVvBN8aFv/OYCklCJ4VtxVak7XaSK
 0Rqvpm5K87Tk/dW+IL2PN+H1QCKkC1XBhh7/NJc9ZuPTpZMCDVzIJmzxiqIoXAf1hdBg
 xaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754467356; x=1755072156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+BQBZ9mG3r8g8Z8ux87XZsQLdiS0Ur33NaYL2k9WZM=;
 b=B8QMrBO9foOT8C02dj26ev1b44H0ad5EBG7rdkq69chTagIaby4pa2tScUn4FHywIT
 GMyJDIYO1l5rvgabrdt4kV7szaIHWZtt0v+Tvsh/+Je346jZpVg52vbuyf6L2WJa9hWk
 LL2RuAWkriHsMUC/XXcy6lxOJVZ9JMcFDhCMxQaL/LXBo6rmqzpdg14U/qz6BJszGA33
 ETtxbzdzlKbTHKoYZMkD9CRWHcOyOa8w8J06jWmj8TzAB6ebO6/FHksq1tDwygByF9bR
 MI1bLAHFTRHZAvI/L9UVF1HkgHsi4yNbnNzuRNKzjAa6e3ftWJNfWlEji+75GdK5SiSK
 2bBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe9hR3CmPyo705+7lXAAdt5DHYFfHbRPd0XuIkmYK7cqnOSjWliuuMl0uADBgbvMxk1epkHhbP+KU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3/HJ60TOifMimi5LfaPe2CsRlRyYtHPv5z34heWRKatx5yVbg
 xABBWmhrMxQryKaE/13Yk8h3QKG5P0+haiCgjfpzhCLbC4qNJNGYSLPLDrLAFzCBr5yk9gW/Fd0
 8g80JAi7OJGfkGIq8Ov6s2ljkIxnL0rQ=
X-Gm-Gg: ASbGnct1geIey3Q+1cSNgRZ+6sRi2GegY9BoPaIRGncUgX0F4cmOrMdpiPK+ZBSBLVP
 72RGmbzooQ2u38R2VRR/cep5PisbFqawbt4TSuod5Asu7JMTio/3yC1K5QxUtZhjsEIrLIxPMl2
 YNMJrXk5heU0AhXJvo908/e5ZEdNeZshyqZizkS0Jv7CgHiW6q4AYy3+jNuDgw5aYJYwZWfAyK8
 m1ayz1u
X-Google-Smtp-Source: AGHT+IFD4X0byf602nADPBsKiAQLFDAiRC9TUU40lAq/ZCTpU6bR09x0oY7ZhxA4B8X5VLMex/+d/Zi80UJ5Alpt8NI=
X-Received: by 2002:a05:6402:3591:b0:615:8ab1:9c92 with SMTP id
 4fb4d7f45d1cf-61796159531mr1447474a12.21.1754467355532; Wed, 06 Aug 2025
 01:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
 <20250731-ums9230-drm-v3-2-06d4f57c4b08@abscue.de>
 <175424005938.523766.7181495703090197785.robh@kernel.org>
In-Reply-To: <175424005938.523766.7181495703090197785.robh@kernel.org>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 6 Aug 2025 16:01:57 +0800
X-Gm-Features: Ac12FXzzmyNFSW-GAa7ORzdn2Ncnq6gmb7eKB9qLWiH4giH7zpoSz4OF3UOCSYM
Message-ID: <CAF12kFtpXdw7UyFvdFOZ+kzfYrRLLOt4Cpeg54TC3rHMwefz6Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: display: sprd: use more descriptive
 clock names
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Orson Zhai <orsonzhai@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin3.tang@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
 David Airlie <airlied@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, 
 Kevin Tang <kevin.tang@unisoc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

Rob Herring (Arm) <robh@kernel.org> =E4=BA=8E2025=E5=B9=B48=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=B8=80 00:54=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On Thu, 31 Jul 2025 17:51:15 +0200, Otto Pfl=C3=BCger wrote:
> > Introduce new clock names that actually describe what the clock input i=
s
> > used for instead of referring to a specific clock source.
> >
> > The new clock input names are based on information from clock drivers
> > such as drivers/clk/sprd/ums512-clk.c. The 128M clock appears to be
> > CLK_DISPC0_DPI, the clock used for the DPI output from the DPU, while
> > the 384M clock is CLK_DISPC0, the actual DPU core clock. The DSI
> > controller's 96M clock is most likely CLK_DSI_APB, the APB clock used
> > for accessing its control registers.
> >
> > Since it seems possible to configure different frequencies for these
> > clocks, the old bindings do not even accurately describe the hardware.
> > Deprecate the old clock names.
> >
> > Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> > ---
> >  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml         | 17 +++++++++=
++------
> >  .../bindings/display/sprd/sprd,sharkl3-dsi-host.yaml    | 11 ++++++++-=
--
> >  2 files changed, 19 insertions(+), 9 deletions(-)
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
>
Reviewed-by: Cixi Geng <cixi.geng@linux.dev>
