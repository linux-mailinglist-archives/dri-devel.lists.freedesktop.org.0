Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D139D5A6564
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3E610E04F;
	Tue, 30 Aug 2022 13:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7BB890B2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 10:03:13 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3413ad0640dso104877727b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=I3uyFklCX86QnaO4FGwtK3r174JBbykuqGUsbUF86CM=;
 b=SvE6u95A8KIYBCs4xKxTiCYBbxBSN2iF5GZ9kH5C/9wkg0aMPTTH37wmp6hMOIWLtS
 kC/9M7nTr3ZMa29TCkbg8BVblGpxJtPFxhnW8FJqUavlqEUtwodde3Xio4iCYWBbiz+z
 hHvwesFhf9khHthd7cskM2WeM28No/t0xUfgmB4T+KGuP5CQTrgnZvlIHI7T9gdPywIU
 tdb0UkPXOLOJwSGT6n2VUf/sjEKB0/gcO6ewRhMieGfTGS2g1d0Tl8nqGkj44st+zkfF
 f3/s9my62nvIu2qVuPTxTwzHqj5p7ZazPXEyDGE/e08LSjCIVVwpX0hJFmgu9qKGUShC
 NX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=I3uyFklCX86QnaO4FGwtK3r174JBbykuqGUsbUF86CM=;
 b=M57vwGu+CgGWHrTYdF+sTmfH7kP0xLo9K7FmwYtPxl79TOazaqMpHGlWZ0+mqCSMk2
 EFv0CXmouc9AmrR83hVsUiUaMrxR67BH3tFrd7UP2u2XlIS0Wout8dLFLjh3NhbFpiDj
 QdMsGH3hUZHSq9Jg/+UlRoiFTrFDUiNTOJ3l+mFS/U2XfyBS4frzovBZ24JOnDfqmc2Z
 nJOp5nkCAZ5W4GWwfFXjlubP62rZex6r7AEaGPrca6YD4lHQNE2/ziyq5i4w+3JNVyvP
 ByF+CCl2l2JBPclHzICrA33gJWWa8biFohfyW07bpEZ4LOLp+AioMRGy0qqEibmJPSQq
 iF0g==
X-Gm-Message-State: ACgBeo3f7nHuKTR8EkwgsTlElvi3904r3TOsFqF80QwpKPud62AOBp2U
 ukQDcJy8lSEMoAiOcIigpTmcP/4Zzjdi46mLpRs=
X-Google-Smtp-Source: AA6agR7cJuSH4etKCu9hKCZHGR2bD5vDU9CYpMir88OlfN8Q5rHi5hJI+n41bex3eVce9XadXKx3EOprlFLuWLXffl4=
X-Received: by 2002:a05:6902:1146:b0:699:ba1f:8934 with SMTP id
 p6-20020a056902114600b00699ba1f8934mr10959552ybu.354.1661853792903; Tue, 30
 Aug 2022 03:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e455ebd7-7949-47d6-5f9b-9869dfdd601d@linaro.org>
In-Reply-To: <e455ebd7-7949-47d6-5f9b-9869dfdd601d@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Aug 2022 11:02:46 +0100
Message-ID: <CA+V-a8so2GYf5PZAPmCzyZayYXVqnVZ7LBLbb-WUqSeWvVX_vA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dw-hdmi: Fix
 'unevaluatedProperties' warnings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for the review.

On Tue, Aug 30, 2022 at 10:23 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/08/2022 00:58, Lad Prabhakar wrote:
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
> This is not main problem. I already commented on two of your similar
> patches, so same applies here. Please describe real problem.
>
Sure will do that and send a v2 (and also for the reset of the patches).

Cheers,
Prabhakar
