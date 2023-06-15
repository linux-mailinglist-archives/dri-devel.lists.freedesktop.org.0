Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6E732116
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9DE10E547;
	Thu, 15 Jun 2023 20:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C10910E547
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:50:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DADE61820
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5214C433CA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686862240;
 bh=rAQtdxQg55X1a/67rV1rB9JIi/+IJoJGicz35sh7WTQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LPvDSprK9FftIr/Mf8vASbIewYlsBGj+SWNi/IqxTQebWrd2os6Gp6m4pwEpk9w+k
 x3pF9i6h/miNyrQERm2Bd42zT8kjq3ukME9+JWYIW1y/MHPPMA2JscGC5aGNzkPYfs
 8sU9LGUB0iZREFKCHc3Zr8+mhB0Y5whTjNo0KxFXhwyJ04pwi/QXMmpzdP9IDpGNwU
 W/7mwyaRoyfXwAqHF5+TzC2KVSf4cPm9Txkz3PiOo7sm1fC19Klkw7tlnUgfDoHeuZ
 L7GBR3NDHzi++gEuSFBzYZixNtuZBn9miz/r63UPw1gE5YuzTXUl9QOFEW3hBpV/i7
 ipPenZ9Y8F3pA==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b44c4cfe6aso7266261fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:50:40 -0700 (PDT)
X-Gm-Message-State: AC+VfDyqZr8ZvCKaQOeJjHqnLfIeK1Z5P4WDZyczVZYOf9nF+0unhAIr
 rXrWcUxwBQr4blge8b4j4gk3DLEzD16MDsLuVw==
X-Google-Smtp-Source: ACHHUZ7bITV7ID6rvLliw2GOyG4xHpOg8o9x6cGMqXSGoKsann8saWkIb9RDs6Vd0AIeVYaRp+O1dD7hcuVBgpdj4aM=
X-Received: by 2002:a2e:2e08:0:b0:2b1:ea42:6d26 with SMTP id
 u8-20020a2e2e08000000b002b1ea426d26mr355350lju.18.1686862238890; Thu, 15 Jun
 2023 13:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
In-Reply-To: <20230613144800.52657-3-sarah.walker@imgtec.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jun 2023 14:50:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bhCCHLY9=ponhGn3iLwueTRgmM_tRHA5cHGAuYC88gw@mail.gmail.com>
Message-ID: <CAL_Jsq+bhCCHLY9=ponhGn3iLwueTRgmM_tRHA5cHGAuYC88gw@mail.gmail.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 9:20=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:
>
> Add the device tree binding documentation for the Series AXE GPU used in
> TI AM62 SoCs.
>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 71 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yam=
l

Please use get_maintainers.pl and send your patches to the correct
people and lists or they won't get reviewed.

Rob
