Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42D7808AD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 11:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BAD10E07E;
	Fri, 18 Aug 2023 09:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042FB10E07E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 09:36:50 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-579de633419so7044187b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692351410; x=1692956210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPpEVGqtIKmhcLG/eTEzAWQK843J9IUYE2hQEuAGPKo=;
 b=jB4EATJzRxoolZU4fx0W0t9xqYwuwIX0CvZS8y0vt4ZtFjMZ+vlbw1g1/elaPqWehF
 IDc26Jdns1NPEgY/J+TM6Wu6YB9TSJ6kKYkKF1oyNnkdhx+X7RVBlP/OlLLASGJW+2s1
 K5BM3MB3MUEDtFgZJrRQXfc+3uFCbLxfHpmDfjsrKn2JC+1S56/h1uX86hJKMJRpYWIb
 nHP/o+Tui7hlDRKR/D4kllXT7biPG91Itjtv+TXAD4AlmwMIYkZ3hEveWt03c+3DS0PH
 lLkrOX+nJiu6n6jXlE7IX8d4ZRZ8blFiaxsTHmoDh4c/asehBcnya396U9IYm7go5Sat
 7nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692351410; x=1692956210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPpEVGqtIKmhcLG/eTEzAWQK843J9IUYE2hQEuAGPKo=;
 b=bAhphhBOtOtOFBmYc7NxezEdn5BE5V52Mckw4TpQwtnIYcqUNBYhAF9CBlWqAsVU3g
 Lf/6x+jprfvosE0yu1rSP7kwgRCWoGJ4m5u6ziu022oNQ7r2hPe+NjskCYdXapJeRcsY
 ysDJgYQ4rYJvFJlH5Tf/q+CkvHRXj+twehGWIH/B3wo0qrGADosSV9I0+MU90hj/i8AL
 inZqom6Rr6Eux2lkUuH/4ERy4yagq9kgNoW52eoUOtSYps/CbfbkITEUs7hp9NlERUSn
 XcoVhRI+NDDy9fnXRB4D5qVBcZnFPvA06PWKeNM5j8lqii4CI9MJDwqGPKRvHSFEal62
 KhDQ==
X-Gm-Message-State: AOJu0YwLDU22ESw3I7AzsUS2Gk1d949YJutZI/Z0ndPSNT2a8tN6Om/P
 cWWZZ0Bp9rlS4usm7j3ihr9uvRbkeAVfMf+WX4QVrw==
X-Google-Smtp-Source: AGHT+IGRK78hniY31Ki6QVVWUwoHDAJVlb6ExLmqX78KL6qCCZewH7G19LMWrACauQlVW4n4wxLc4Kmx2MonQGC8VDg=
X-Received: by 2002:a25:230f:0:b0:d12:25d:fd60 with SMTP id
 j15-20020a25230f000000b00d12025dfd60mr1987490ybj.9.1692351410142; Fri, 18 Aug
 2023 02:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-3-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-3-sarah.walker@imgtec.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Aug 2023 11:36:38 +0200
Message-ID: <CACRpkda-XnS-DQE-5WXnTFdycwVnJwffhhR=V27gp8vnxkHTrA@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
To: Sarah Walker <sarah.walker@imgtec.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sarah,

thanks for your patch!

Patches adding device tree bindings need to be CC:ed to
devicetree@vger.kernel.org
and the DT binding maintainers, I have added it for now.

On Wed, Aug 16, 2023 at 10:26=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:

> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
(...)
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,am62-gpu
> +      - const: img,powervr-seriesaxe

Should there not at least be a dash there?

img,powervr-series-axe?

It is spelled in two words in the commit message,
Series AXE not SeriesAXE?

Moreover, if this pertains to the AXE-1-16 and AXE-2-16 it is kind of a wil=
dcard
and we usually don't do that, I would use the exact version instead,
such as:
const: img,powervr-axe-1-16
any reason not to do this?

I asked about the relationship between these strings and the product
designations earlier I think :/

Yours,
Linus Walleij
