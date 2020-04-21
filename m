Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF51B2FB7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 21:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496E6E2F9;
	Tue, 21 Apr 2020 19:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431666E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 19:03:10 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D43DD20747
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587495790;
 bh=zzuxna0xb8Q1TdC2MB2c2yaiRdzpJ1eGR8Ub8HY5Gd8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dlSItZt7NEZM/Xhn8o9UdDSbcwlgfVb8ydhF3rGtNtQmdEl+H3O9net1gHmR12AQ3
 G+nGtdiWxr7TRRdz25FX0gFyjfRRj2d0d3nAZzfKyyacT1RN+gE1xH2EmseDfJahAO
 HBJFoVO2yOmbas1tl76zAhDEBOt9TVZISj3h9NsE=
Received: by mail-qk1-f177.google.com with SMTP id j4so15648587qkc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:03:09 -0700 (PDT)
X-Gm-Message-State: AGi0PubxfZam2eeaBUEDnkxjXiVwhQslRePvWClrXJcWqT15tKsGXqxR
 wSbxqDmvSNgNRc+WI4RvoPhpT//UenXvxf/yhg==
X-Google-Smtp-Source: APiQypK4Yv9pvWyQXJx3JdeSn124hpxtt1JLCDuQWjVYKhF0tbCsvIrqP7V2PBuV1TcfREEdndVuo0ZBbnynFvkhgvg=
X-Received: by 2002:a37:4a85:: with SMTP id
 x127mr23060837qka.152.1587495788872; 
 Tue, 21 Apr 2020 12:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200416204158.GA1006@bogus>
 <C7C58E41-99CB-49F6-934E-68FA458CB8B1@goldelico.com>
In-Reply-To: <C7C58E41-99CB-49F6-934E-68FA458CB8B1@goldelico.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Apr 2020 14:02:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLfamBLVus65GUzq9DUu0VcK=p_7KkHbKvnLc=0uhsVvg@mail.gmail.com>
Message-ID: <CAL_JsqLfamBLVus65GUzq9DUu0VcK=p_7KkHbKvnLc=0uhsVvg@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, linux-omap <linux-omap@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 7:16 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Rob,
>
> > Am 16.04.2020 um 22:41 schrieb Rob Herring <robh@kernel.org>:
> >
> > On Wed, 15 Apr 2020 10:35:08 +0200, "H. Nikolaus Schaller" wrote:
> >> The Imagination PVR/SGX GPU is part of several SoC from
> >> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> >> Allwinner A83 and others.
> >>
> >> With this binding, we describe how the SGX processor is
> >> interfaced to the SoC (registers, interrupt etc.).
> >>
> >> In most cases, Clock, Reset and power management is handled
> >> by a parent node or elsewhere (e.g. code in the driver).
> >>
> >> Tested by make dt_binding_check dtbs_check
> >>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> ---
> >> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
> >> 1 file changed, 122 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> >>
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml:  while parsing a block mapping
> >  in "<unicode string>", line 74, column 13
>
> It turned out that there was a stray " in line 74 from the last editing phase.
> Will be fixed in v7.
>
> Would it be possible to make dt_binding_check not only report line/column but the
> contents of the line instead of "<unicode string>"?

This comes from ruamel.yaml module. I believe "<unicode string>" is
supposed to be the type of the data, not what it is. However, it is
possible to get something a bit more helpful, but it depends on which
parser is used. By default we use the C based parser (aka 'safe'). If
we use the round trip parser, we get this:

ruamel.yaml.scanner.ScannerError: while scanning a simple key
  in "<unicode string>", line 84, column 5:
        maxItems
        ^ (line: 84)

This can be enabled by passing '-n' (line numbers) to dt-doc-validate.
Currently, you have have to edit the Makefile to do this. The C parser
is a big difference in speed, so I don't want to change the default.

I can probably work around this and dump the erroring line, but I'm
not sure that's always useful. Many errors are indentation related and
those need some context. Plus just dumping the line can be done easily
with sed:

sed -n ${LINE}p <file>

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
