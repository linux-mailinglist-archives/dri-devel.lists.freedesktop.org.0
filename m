Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C11AA90D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426D36E9A3;
	Wed, 15 Apr 2020 13:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ECC6E9A3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:51:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 058912076D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586958682;
 bh=tgRWJgcQnzKnLeznzhvqULTc+zIFVRd3kVZ1uDyLL4w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xyi7WTFF1Ivk4AODkFjXnSTYive/d79InJiM153usRGt4/wRuN866slUW6VebcJFa
 6ykBjbm0i7Q02mno8mWmn+Xw9XUFojyv3RWQU1hwipMpKTX/BZRAwbfDHhl+qDVpJS
 ujrLqag7FiRoHeztpZ2PnxWADR/hHDmM3272wLWM=
Received: by mail-qk1-f178.google.com with SMTP id m67so17149072qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:51:21 -0700 (PDT)
X-Gm-Message-State: AGi0PuaI2OHgfQgxL1nRTcSLBKrIrkjzPuYP5XNUnZH+53oxQYMe7M0X
 GsFN4GuqhN7uP6H2NpCoEfOTFQ5UCskTbR5DLw==
X-Google-Smtp-Source: APiQypJ3111GBMYlDRbfn4eXTDJL7JtT27pCtIPZGQwiYB10ssWlg+vntVXMHZ59a9Y9Ehae3ReAQAzk3dJAf4jH+1E=
X-Received: by 2002:a37:cc1:: with SMTP id 184mr23450327qkm.254.1586958681147; 
 Wed, 15 Apr 2020 06:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200415005427.GY19819@pendragon.ideasonboard.com>
 <20200415005909.18650-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200415005909.18650-1-laurent.pinchart+renesas@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Apr 2020 08:51:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTMJgbW5uJ4LcetUXcNGWacWMvB6RN-1s_S8+C9QZ_Lw@mail.gmail.com>
Message-ID: <CAL_JsqJTMJgbW5uJ4LcetUXcNGWacWMvB6RN-1s_S8+C9QZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v1.1 2/4] dt-bindings: display: bridge: Convert
 simple-bridge bindings to YAML
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 7:59 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The simple-bridge driver supports multiple simple or dumb bridges,
> covered by different compatible strings but otherwise identical DT
> bindings. Some of those bridges have undocumented bindings, while others
> are documented in text form in separate files. Group them all in a
> single binding and convert it to YAML.
>
> The psave-gpios property of the adi,adv7123 is dropped, as it isn't
> supported by the driver and isn't specified in any DT file upstream.
> Support for power saving is available through the enable-gpios property
> that should cover all the needs of the ADV7123 (as the device only has a
> /PSAVE pin and no enable pin).
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes since v1:
>
> - Mention dropping psave-gpios in the commit message.
> ---
>  .../bindings/display/bridge/adi,adv7123.txt   | 50 ----------
>  .../bindings/display/bridge/dumb-vga-dac.txt  | 50 ----------
>  .../display/bridge/simple-bridge.yaml         | 99 +++++++++++++++++++
>  .../bindings/display/bridge/ti,ths813x.txt    | 51 ----------
>  4 files changed, 99 insertions(+), 151 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
