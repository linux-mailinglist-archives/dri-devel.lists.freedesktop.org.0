Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C902978AB7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C85C10EDB2;
	Fri, 13 Sep 2024 21:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TnskXcut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387F010EDB2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C5460A45A39
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB759C4CEC7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726263563;
 bh=29lldcaIiks9/LfCKap1Yktuq2JC3H3MvPcdHX/euBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TnskXcutylpvBl9psxUrUfUCRPAzJGzmd8y9uJnn49340vS09VnNflnBAhFARrcMn
 IeSpHw6/nWrPg1N6jtMkHHEJpBw96cHY8PioWhedzjHpsV3dwmsC2vTS8f9vlANP5p
 +HoUS4oiP2V76PpFhUocCnKBbWUPVpSkWJAOgahqgRMzQ9pkJy/TUgljsiqiOHeWj/
 fu6o5gKxrN51JtIBvAdl8ErSWEHkk/S9RiuQ6CZapIx8/DrqfSYzBAACLCSsdgblPm
 6TFJvXE/t+34KGDYtsxzIHLLGK5ePjSCFibY6KWREM9KQP4r5wyoCIO35Q1RDacKa+
 bfRvrVFijIrcg==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5367ae52a01so1959694e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVWs11/Wgdjs9QInXOSV4U8y9VJvrmVJC3Lw3dwi9LgvxcLhwJUgHHoTOhq9g1Xqghwp9TEDtlsE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhSGDrU7NfU71Bx5FCmch4Ja/ED0v93q3lsBZisX+MC3nqrhVV
 HMwJNiTYMDhsCPMfBWqJkfaFNiURhTh8sTW+Q3qIdjbGBrTUYqyAcaKs0lAOpy6omyMd7ZXy+Pi
 ZY0gPsvsmGV/gCuwh7mDAVmDfPQ==
X-Google-Smtp-Source: AGHT+IHja0EdX+FTr55htGcN7Jpd0i8VmeMa2FJm1kpulhqYl5C0BU8PCxBt6UcQdsqHXvue4VOMzQdKb8SnPRakjGM=
X-Received: by 2002:a05:6512:2393:b0:52e:98f6:c21f with SMTP id
 2adb3069b0e04-5367fec3915mr2947015e87.16.1726263562116; Fri, 13 Sep 2024
 14:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org>
 <20240912144430.3161717-2-treapking@chromium.org>
In-Reply-To: <20240912144430.3161717-2-treapking@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 16:39:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLhnuqASgOab7RjdrUxGs4ags8CutL0K9Vr_57HmL+TpQ@mail.gmail.com>
Message-ID: <CAL_JsqLhnuqASgOab7RjdrUxGs4ags8CutL0K9Vr_57HmL+TpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: dpi: Add
 power-domains to the bindings
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The power-domains property is used by most DT nodes using mediatek,dpi
> bindings. Add this to the bindings to fix the schema check error.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 5ca7679d5427..7e0bb88f5856 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -42,6 +42,12 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.

power-domains was already added recently, but mt8183 was not included.
So you'll need to adjust the if/then schema for it.

Rob
