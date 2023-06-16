Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8D733375
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F00E10E640;
	Fri, 16 Jun 2023 14:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C16A10E640
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:23:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9DF1620AC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37BDC433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686925410;
 bh=WEmd+Rl2QTn1akC2Q9LAEATrrrV4/4j66TNK8eeysLE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t7f8ujEXpxv5H2kQ04ItZoe/Nb5NIuQoBw+iQBSJlYIVLrvq/vBcKd7V5h7bzehlD
 kLDElqkmaY6gCwvkeF5iWZ10xd0MgZOcRk2OaDFcFYhuFCnZW6Sok9xbqeeM1ihg+A
 DdHecxvuZ3hIHjfjcrAJxWRfhMDUfFpER3afzeG15RfNSHArOjDXfUGXR2mPt/oggS
 JzHXMZT007ZxDlxHsSP5dKMCD7Be8GGDb5k9Rvu3i7TuwiNw2WlvZP5IHsiIWvDWTu
 dkJcPQ3UpvvhTYQGl9BwmE4D+vAb9Jh5weXbOzhrklotHvO2p/bTEAGK1LbTnRXrXA
 ZlcKfIrSrDyPw==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so1019065e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:23:30 -0700 (PDT)
X-Gm-Message-State: AC+VfDyTZ3HuZpYd7obOhRl9vNb5qtaSD4xOx74m0+hQPJFcdEkZgeaW
 L7H9RiDtWUFufJiU6uqcl3YZzUeXQh2Ea/mJ8w==
X-Google-Smtp-Source: ACHHUZ5Rem5AJDRW6IXOWsBpD4vwN1pICW0Mv93/nnqQIArQnBjY2709ZVNITMePFUdag5fx/PyQHCgTHxXoC/vdlog=
X-Received: by 2002:a2e:9247:0:b0:2b1:aa92:8a06 with SMTP id
 v7-20020a2e9247000000b002b1aa928a06mr1942885ljg.26.1686925408972; Fri, 16 Jun
 2023 07:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
In-Reply-To: <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jun 2023 08:23:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJNEvZaL=MCP0AAJRf3uV7CnExzXz0ARgEbeUx3+v6L2g@mail.gmail.com>
Message-ID: <CAL_JsqJNEvZaL=MCP0AAJRf3uV7CnExzXz0ARgEbeUx3+v6L2g@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 "Dr. H. Nikolaus Schaller" <hns@goldelico.com>,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 6:49=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Sarah,
>
> thanks for your patch!
>
> On Tue, Jun 13, 2023 at 5:20=E2=80=AFPM Sarah Walker <sarah.walker@imgtec=
.com> wrote:
>
> > Add the device tree binding documentation for the Series AXE GPU used i=
n
> > TI AM62 SoCs.
> >
> > Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
>
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - ti,am62-gpu
> > +          - const: img,powervr-seriesaxe
>
> I don't see why you need to restrict the bindings to just the stuff
> you happen to
> be writing Linux drivers for right now.
>
> Add all of them!
>
> There is this out-of-tree binding:
> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/0ddd308a78=
926782b8a72f75c74b91417ceb9779
>
> With these two on top:
> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/053346e193=
3932815066f16ebf6e6bda45d67548
> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commit/1cb62c4cdc=
ad096d438ee7d1d51f6001998acee3
>
> They are indeed out-of-tree, but H. Nikolaus is a well-known and respecte=
d
> contributor to the kernel, and I'm pretty sure he would be contributing
> these upstream if he had the time and incentive.

He did try[1].

Rob

[1] https://lore.kernel.org/all/cover.1587760454.git.hns@goldelico.com/
