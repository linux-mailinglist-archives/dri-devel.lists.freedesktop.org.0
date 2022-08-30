Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD75A6563
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EE10E076;
	Tue, 30 Aug 2022 13:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E0C89EB1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:19:24 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3376851fe13so258036277b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4LzcYMLA4n0/7gNYzbK/mkckLDWj4Hrt+zYpQebTjH4=;
 b=SO3qgOdHgFHXeHQcJlqYfbrWrZD8Iw0sHlWqtM/SViI75ecfevio/ANBS8vklEio/D
 OJ4WIL2E8RSLgQuJ4LWQ17wIV1ldFB8FGiKUFXjM/NfD3WO4c9SvLhbbWY0sxymF8e3X
 hHRsta6pn4uc/Wkq/47lGiXBJSuCypE5X1jNm7+OJAzUlDxaVDva9eAuV85WMIG1+E5I
 Qvo+EUEAcHdst3jlpPFPaDCOMRK5dvTe/rGnIqdEh1CEwylKa8ZMlGZOYQ+5BznRVlJj
 MY08cMyF8KlyjXhDSozG9ne+PjUGBrjuffcPpe+Vg317U5QtU1zTDcPi2dmKO33MnHHF
 OvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4LzcYMLA4n0/7gNYzbK/mkckLDWj4Hrt+zYpQebTjH4=;
 b=PtCIWprEQPa0x2SmnPvYrVlhIeVXEDD8gH5CMv/gRVfdBd3DspU9FFZqjtx4tO7cwh
 NSh6M16FQS4eitdh4/Y2XBHvOYq/Phg/wWSiCuNaydJH7HvdiCdOdvvzmg10yI+CwF1J
 tNqoIKIOtxRmyOcn+Vdgmueq1Stc6RvkIesvokMsezmS9nDX8iCAUloeqbpPqJas+X1D
 jzKx9PMgUvFDpBEzPCQgHkXFRUtwoiYCBnvHfuJZS7QohbvIAoR3iQSejuDIdSxKVC0z
 j+MIP3JmsZ6fLqFcVMTo29eedl2KLBpgvyww8U+MpV1kLnhb8pNUEVbPuFZ2Zy+Z2Vu6
 XeWg==
X-Gm-Message-State: ACgBeo0A68vxv5xLxD+UoIxzMIPGTzoGQX8eyOv8jdYPjFYYcQTPb4Fn
 yCssI/yHw+ZKCAcMRfbT64+baR1vFWtHSO1vBKI=
X-Google-Smtp-Source: AA6agR6wngvVcYUXvDSRVYgU7fd+FzO0hqISd0AH9TIazM2vBMpxMInlA0UjIOaSuYNpdfIIxOv7C9lgwFqkpoWh4hI=
X-Received: by 2002:a25:2502:0:b0:695:9024:4cfd with SMTP id
 l2-20020a252502000000b0069590244cfdmr11949686ybl.299.1661851164044; Tue, 30
 Aug 2022 02:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Yw1G69ny9tZrFWk4@pendragon.ideasonboard.com>
In-Reply-To: <Yw1G69ny9tZrFWk4@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Aug 2022 10:18:57 +0100
Message-ID: <CA+V-a8sPRTBTFnH4W=qcKU3=WYU79oX3WxBONpCG2f4m9V2ncA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dw-hdmi: Fix
 'unevaluatedProperties' warnings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 13:47:49 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Aug 30, 2022 at 12:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Aug 29, 2022 at 10:58:16PM +0100, Lad Prabhakar wrote:
> > With 'unevaluatedProperties' support implemented, there's a number of
> > warnings when running dtbs_check:
> >
> > arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: hdmi@fead0000: Unevaluated properties are not allowed ('resets' was unexpected)
> >       From schema: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> >
> > The main problem is that SoC DTSI's are including resets property, whereas
> > the renesas,dw-hdmi.yaml has 'unevaluatedProperties: false'. So just add
> > optional resets property to the binding.
>
> Given that all the DT sources in the kernel specify the resets property,
> how about making it mandatory ?
>
Agreed, will do that and send a v2.

Cheers,
Prabhakar
