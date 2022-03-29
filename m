Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52994EAE7A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 15:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF6E10F0AE;
	Tue, 29 Mar 2022 13:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D810F0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:28:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8337EB81818
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293E6C34113
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648560484;
 bh=z0lSTjpuyGdMpUgrH3yye9jNeGEzuoSxD6CJSLPeIyE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YfXBuTtb0SSlZUf+DUFdggbi9FEh/nw1Snin40IWbyolsO371+/5NauUM8yDdWvlr
 64iPxl5ySbuT05ES69glgZOcp6vrp5z7ELLQVFXX4/me5BLmDfCszxEiuenlx/wtez
 7JZFHD76noW2jFdx1+03pMBMijOZh/QGIDi2BH47Tjfn9SSrzA0L2iqdorAoD6pBwK
 yIwrePH9q9Tun5vOfraF6YTfViDKtSSNV8o0zCzddnIKR3UvHgtusxwDpIDNh4URI/
 jxzIJp8van10IalWtAZuy6LKXdtZulLnqAcnk10L9iLpH3t7YoOqMgC0ueElpSD6mW
 XoVK25/yRS3Xw==
Received: by mail-ej1-f54.google.com with SMTP id yy13so35172933ejb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 06:28:04 -0700 (PDT)
X-Gm-Message-State: AOAM533q5m50sSAp/kIIhZyinQGV/Jso9CW2V/lv61x+LyJqegWgqX/+
 J7AjnJY5/OKECbW3VB4gkVNzOEL1Vu6yApdn/A==
X-Google-Smtp-Source: ABdhPJzj3/gx2h6gfF3xH01UhGfHeUEzMlMnGo0qwB+pHUkiz744wEqEdbj9LVI48/pWxS09mmJzGL7SXddFerFK1UE=
X-Received: by 2002:a17:907:2d8d:b0:6df:a06c:7c55 with SMTP id
 gt13-20020a1709072d8d00b006dfa06c7c55mr33872249ejc.325.1648560482148; Tue, 29
 Mar 2022 06:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220328022835.2508587-1-15330273260@189.cn>
 <20220328022835.2508587-3-15330273260@189.cn>
In-Reply-To: <20220328022835.2508587-3-15330273260@189.cn>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 29 Mar 2022 08:27:50 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zO7RXzQLoPXR7Zm0mcsKCydK=8EFaNFGu-_THgJuh7Q@mail.gmail.com>
Message-ID: <CAL_Jsq+zO7RXzQLoPXR7Zm0mcsKCydK=8EFaNFGu-_THgJuh7Q@mail.gmail.com>
Subject: Re: [PATCH v13 3/6] dt-bindings: display: Add Loongson display
 controller
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 27, 2022 at 9:29 PM Sui Jingfeng <15330273260@189.cn> wrote:
>
> Add DT bindings and simple usages for Loongson display controller
> found in LS7A1000 bridge chip and LS2k1000 SoC.
>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  .../loongson/loongson,display-controller.yaml | 321 ++++++++++++++++++
>  1 file changed, 321 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> new file mode 100644
> index 000000000000..34060ed55a25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> @@ -0,0 +1,321 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
> +
> +maintainers:
> +  - Sui Jingfeng <suijingfeng@loongson.cn>
> +
> +description: |+
> +
> +  Loongson display controllers are simple which require scanout buffers
> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
> +  with a dedicated video RAM which is 64MB or more, precise size can be
> +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
> +  chip.
> +
> +  LSDC has two display pipes, each way has a DVO interface which provide
> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
> +
> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
> +  located at the DC register space. They are used to emulate two way i2c,
> +  One for DVO0, another for DVO1.
> +
> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
> +
> +  LSDC's display pipeline have several components as below description,
> +
> +  The display controller in LS7A1000:
> +     ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^             ^            |_________|
> +    | | | | |    -------|        |             |
> +    | |_| |_|    | i2c0 <--------+-------------+
> +    |            -------|
> +    |   DC IN LS7A1000  |
> +    |  _   _     -------|
> +    | | | | |    | i2c1 <--------+-------------+
> +    | |_| |_|    -------|        |             |             _________
> +    |            -------|        |             |            |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +  Simple usage of LS7A1000 with LS3A4000 CPU:
> +
> +    +------+            +------------------------------------+
> +    | DDR4 |            |  +-------------------+             |
> +    +------+            |  | PCIe Root complex |   LS7A1000  |
> +       || MC0           |  +--++---------++----+             |
> +  +----------+  HT 3.0  |     ||         ||                  |
> +  | LS3A4000 |<-------->| +---++---+  +--++--+     +---------+   +------+
> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<--->| DDR3 MC |<->| VRAM |
> +  +----------+          | +--------+  +-+--+-+     +---------+   +------+
> +       || MC1           +---------------|--|-----------------+
> +    +------+                            |  |
> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
> +                      +-------+                      +------+
> +
> +  The display controller in LS2K1000/LS2K0500:
> +     ___________________                                     _________
> +    |            -------|                                   |         |
> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> +    |  _   _     -------|        ^              ^           |_________|
> +    | | | | |           |        |              |
> +    | |_| |_|           |     +------+          |
> +    |                   <---->| i2c0 |<---------+
> +    |   DC IN LS2K1000  |     +------+
> +    |  _   _            |     +------+
> +    | | | | |           <---->| i2c1 |----------+
> +    | |_| |_|           |     +------+          |            _________
> +    |            -------|        |              |           |         |
> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> +    |            -------|                                   |_________|
> +    |___________________|
> +
> +properties:
> +  $nodename:
> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - loongson,ls7a1000-dc
> +              - loongson,ls2k1000-dc
> +              - loongson,ls2k0500-dc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  i2c@6:

NAK on made-up bus numbers. See v11 discussion for details.

Rob
