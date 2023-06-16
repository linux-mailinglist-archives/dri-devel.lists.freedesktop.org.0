Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF4B733195
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F7910E616;
	Fri, 16 Jun 2023 12:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DE110E616
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:49:06 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b2d8b5fde6so629974a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686919745; x=1689511745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6qp6CYPJwvK/QdWpPuRP8ydNnMSR2Rxn7S3w8iwScw=;
 b=d613mMgesg7KYmENHpBXL2uBQV15ZXDD2hzAsyLaNKsog9juYdmosljg07WXHHik4a
 VfyU+6mgISow2FKs8rSuySF8N1iOoWOTgQQZqrg078gHUycp/xP/kcGW6BMzzVJRJmH0
 Qii6vCUYjezoalCJ4UfcppFcABA1Uyo0u/gKu0D3NFFS9jnIcICGzWwsP+OSQLw/l1t7
 NoLdtozMOzucO0vwOiKu7rOMNAT/umNkFd/J4RSK00wGaWFrrgDOGfbxwUGolqhQ27RQ
 AmRk0OBuUduuOusBGfyKc/vxJsRy3kzwF+bA+f68rH0qFsD0pv3SfbvY0Ro2AO69sENA
 JADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686919745; x=1689511745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6qp6CYPJwvK/QdWpPuRP8ydNnMSR2Rxn7S3w8iwScw=;
 b=MyWEOBsbWbxuhAXpZjvqIpZrxRmvWu2p3WEcTAgTGdqjV1n0TCxNblmp8OZaxGhA1K
 21QnoUJMPrgif4x60IyIE4plwRS4aAY82r1jGVN7y7FIUTodzGFX7MSWOKiDkc3INI2j
 nUgCjGsA96Yw7umAtDiJF7woAA6/RU8eqkOV76usn2NcTZregQqFyw596kwRW3BH19gO
 mgIfKyGgaDJuEY0E+42dxh9M+9RObxI9rNiBEJQ2oNRKfL9ugULFDj/8UZHIWFtqmiGx
 6B1CT+ZbSJiNQaBWQ8EcqBcji0BBt1/uGaRXYOhiSrS0oLM4eXW+ONa14FV5rj+aFzKd
 2ZKg==
X-Gm-Message-State: AC+VfDy3sjOT6Of954whrkOAMx6JyWUJtKaxsiUV811IEIruTQ0RJXbx
 DD1yf9lgm8I+XXgf3rBsZZtxyLwR5QDHFmO37+dXeg==
X-Google-Smtp-Source: ACHHUZ7hgTJJ+MNGw19TPKQutsaTfxchDQSvngKmUWpy5IyaQaeJNdxAcO9mUeQoGh/4JedExII5F2wCyv96fu0DXkw=
X-Received: by 2002:a05:6359:a2f:b0:128:d2d0:6967 with SMTP id
 el47-20020a0563590a2f00b00128d2d06967mr1453690rwb.3.1686919745604; Fri, 16
 Jun 2023 05:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
In-Reply-To: <20230613144800.52657-3-sarah.walker@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 14:48:54 +0200
Message-ID: <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, sumit.semwal@linaro.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sarah,

thanks for your patch!

On Tue, Jun 13, 2023 at 5:20=E2=80=AFPM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:

> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,powervr-seriesaxe

I don't see why you need to restrict the bindings to just the stuff
you happen to
be writing Linux drivers for right now.

Add all of them!

There is this out-of-tree binding:
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/0ddd308a7892=
6782b8a72f75c74b91417ceb9779

With these two on top:
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/053346e19339=
32815066f16ebf6e6bda45d67548
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/1cb62c4cdcad=
096d438ee7d1d51f6001998acee3

They are indeed out-of-tree, but H. Nikolaus is a well-known and respected
contributor to the kernel, and I'm pretty sure he would be contributing
these upstream if he had the time and incentive.

To me it seems much more like you should talk to Nikolaus about submitting
these patches initially, and then add Rogue support with patches on top of =
it.
It could be a nice series with just DT bindings.

I see that your binding uses a power domain rather than a regulator
(sgx-supply) for power and that is probably a better approach but other
than that the openpvrsgx binding looks more complete and to the point?

It will also help them to get these bindings settled so they can merge all
of the DTS patches adding the SGX block to misc platforms in the
kernel upstream so they can focus their work on the actual driver.

When I look at the PowerVR wikipedia page:
https://en.wikipedia.org/wiki/PowerVR
there is no correspondence between the product names there and
"img,powervr-seriesaxe" as used here.

I think you need to explain if these are internal product names or what
is going on, and what the relationship is to the marketing names, it could
be part of the description simply, so that people know what string to use
somewhat intuitively. Maybe all the strings in the out-of-tree documentatio=
n
are just wrong because internal code names need to be used?

Yours,
Linus Walleij
