Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630694A809D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79010E5F1;
	Thu,  3 Feb 2022 08:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8010E1E0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 273FC61899
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A49C340F2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643878200;
 bh=ihHjHUr1oEH6ZA3ulHJb07aFif6seE+3ESgHvcNb1iA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lVtHEBtc/bKhTf81fQ3nwY6+9YBga79QG6LlsGMeGU+lNdIBDt1xM1vNfzsXbsmiF
 bxaI0dh1uPuWHWParpHYrzi/AyfoBbPndzSMwJELrUEg1MIMl52YFRre+msoi1ie+v
 BfT9ovo37qNQHTpdysSBLe58fZNusX2e/O+CYD2e/0Aas66B7SkoZ0ZBn589jhcI9z
 iyKe86r5lv1oW6bDovsbKMvdiLUNq1/+fpN/Hj1oFCMeopTqM3fQ25yaiGK23xhOhO
 eELXPzdjMwfzh7Toxa7DyOzPFQxAkS5K7QJsrtUuqXNoHOwHSb89QwKcjHzpq4Mn/e
 a/rAHrnsGM8IA==
Received: by mail-yb1-f176.google.com with SMTP id c6so6779979ybk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 00:49:59 -0800 (PST)
X-Gm-Message-State: AOAM533Gr9TstWxICFHvOm/VaWErowUd4e4E16zf+gHdgjMAnWgzTn40
 hyiLlBQAYqIfc+z9ko7v+F0cXBz/e7AWk1yiaFs=
X-Google-Smtp-Source: ABdhPJwtjbMqcbCBpVtFo7bhQwzghNKjGZNT/wOybgv98AO6b9O9wTK/T6GePaiHKeH1VJcgGsWcJUYwq/y6m20YjCI=
X-Received: by 2002:a25:708b:: with SMTP id l133mr770491ybc.48.1643878199067; 
 Thu, 03 Feb 2022 00:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-4-15330273260@189.cn>
In-Reply-To: <20220203082546.3099-4-15330273260@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Feb 2022 09:49:44 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfLSyrmr=dpqphnC-4dnEwaBP4-sOktW+TE8CY8r-=s6A@mail.gmail.com>
Message-ID: <CAJKOXPfLSyrmr=dpqphnC-4dnEwaBP4-sOktW+TE8CY8r-=s6A@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] dt-bindings: mips: loongson: introduce board
 specific dts
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 at 09:26, Sui Jingfeng <15330273260@189.cn> wrote:
>
> From: suijingfeng <suijingfeng@loongson.cn>
>

You gave subject prefix "dt-bindings" but I do not see any bindings
here. Maybe you meant "MIPS: dts:" ?

> For board specific devices which is outside of the cpu and bridge chip.
> This patch introduce two dts, one for lemote a1901(aka LX-6901) motherboard
> which one only one vga output connected to DVO1.
> more document can be found from [1].
>
> Another one is ls3A4000+ls7a1000 evb board, this board have a VGA and DVO
> interface. The VGA is connected to the DVO0 and the dvi is connected to
> DVO1.
>
> We need introduce board specific dts because of we need the device tree
> to tell how does the connectors and encoders are connected to the DVO port
> of the display controller.

All this is unparseable. Could you use some more advanced grammar
check? If you can access Google GMail, it provides a really good
grammar helper.

>
> [1] https://wiki.godson.ac.cn/device:lemote_a1901
>
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  arch/mips/boot/dts/loongson/lemote_a1901.dts  | 64 +++++++++++++++++
>  .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 68 +++++++++++++++++++
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  2 +-
>  3 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
>  create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
>
> diff --git a/arch/mips/boot/dts/loongson/lemote_a1901.dts b/arch/mips/boot/dts/loongson/lemote_a1901.dts
> new file mode 100644
> index 000000000000..81828945ba52
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/lemote_a1901.dts
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson64g-package.dtsi"
> +#include "ls7a-pch.dtsi"
> +
> +/ {
> +       compatible = "lemode,a1901", "loongson,loongson64g-4core-ls7a";

You need to document the new compatible in the bindings.

> +       model = "lemode,a1901";

Model should not be the same as compatible but a user-parseable string.

> +};
> +
> +&package0 {
> +       htvec: interrupt-controller@efdfb000080 {
> +               compatible = "loongson,htvec-1.0";
> +               reg = <0xefd 0xfb000080 0x40>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&liointc>;
> +               interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +                            <25 IRQ_TYPE_LEVEL_HIGH>,
> +                            <26 IRQ_TYPE_LEVEL_HIGH>,
> +                            <27 IRQ_TYPE_LEVEL_HIGH>,
> +                            <28 IRQ_TYPE_LEVEL_HIGH>,
> +                            <29 IRQ_TYPE_LEVEL_HIGH>,
> +                            <30 IRQ_TYPE_LEVEL_HIGH>,
> +                            <31 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&pch {
> +       msi: msi-controller@2ff00000 {
> +               compatible = "loongson,pch-msi-1.0";
> +               reg = <0 0x2ff00000 0 0x8>;
> +               interrupt-controller;
> +               msi-controller;
> +               loongson,msi-base-vec = <64>;
> +               loongson,msi-num-vecs = <192>;
> +               interrupt-parent = <&htvec>;
> +       };
> +};
> +
> +&lsdc {
> +       /* use_vram_helper; */
> +       output-ports = <&dvo0 &dvo1>;
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       dvo0: dvo@0 {
> +               /* 0 for DVO0 */
> +               reg = <0>;
> +               status = "disabled";
> +       };
> +
> +       dvo1: dvo@1 {
> +               /* 1 for DVO1 */
> +               reg = <1>;
> +               connector = "vga-connector";
> +               encoder = "adi,adv7125";
> +               status = "okay";
> +       };
> +};
> diff --git a/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
> new file mode 100644
> index 000000000000..ff07f529ea43
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson64g-package.dtsi"
> +#include "ls7a-pch.dtsi"
> +
> +/ {
> +       compatible = "loongson,loongson64g-4core-ls7a";
> +       model = "loongson,ls3a4000_7a1000_evb";
> +       version = "v1.4";

Is there such a dt property?


Best regards,
Krzysztof
