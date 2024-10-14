Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620899D5AE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F210E027;
	Mon, 14 Oct 2024 17:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g+xzqXac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD49F10E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC460A42677
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB3AC4CECE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728927547;
 bh=GSdP32UvF/3OTOvTrKWKCdA75fPSJyT8cZYVq5WuII0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g+xzqXacBIPl7JsHeHXFLj46QLlo9TKTjIvSkI1GrCtwWtFRROuWaru6uv/EvqxOP
 MBhWelqJUWvMayRlYGmZ28yzBFtnqgu1lGm0iJa4/4gBUnlXLUVeluB6fu98b1xR2G
 Cptlvy86kNxFJn1HKS0ZjwBeXdlFwoKUWe0Cc+6NROfnosjfLL71o5CO2gKti9i+d/
 IY2fvdAi9fKqZb3V8UvLgqn2rzW06i5T8i76C2s20EdpMKkXQ4CJhO9s7tYonv2NZ3
 lDgbM0YVplpA60w/3Z4EMLs/o4haWCCUVDFBA3KivRurCaW0fNE+YXZSTuCPOdaN8j
 CJ0HoiN543cbw==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539f7606199so1285114e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHK7Wn+omTpVoIM+m1RqsAqnTfvpGlomBJN7DTOoozQnEDpLXR3xfhdHkKKaJgzoxVJCmNBkXd2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA077Kt1KfQv7UHsn7SfzeExseOYq89Ued4OXHDWOVh5/WQ+lw
 PwCLXUt0Wh3DVWu2Fq5TumLj+5GVXi6KM4pF7zixIwHMO05/dWPBYAPdaPn3QrpNAuW5m2cxrFf
 UZP4jOOHaFqZkV/2RyaO0HT0eKA==
X-Google-Smtp-Source: AGHT+IGsfTRPyPm9+84ee+96fBbvWyKCzmA8qytZEXkaEUVRTaFfm7J3+vzBiqPzmo8azDKt+aN/qJ+sYpgh7e2h65c=
X-Received: by 2002:a05:6512:10cc:b0:539:e97c:cb12 with SMTP id
 2adb3069b0e04-539e97ccdadmr3183668e87.34.1728927545757; Mon, 14 Oct 2024
 10:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org>
 <20240912144430.3161717-3-treapking@chromium.org>
 <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
In-Reply-To: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 12:38:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJM3sHECd9U1aJ+HGvTarLxmrNFkXq-k4jGU4S6h8nO3A@mail.gmail.com>
Message-ID: <CAL_JsqJM3sHECd9U1aJ+HGvTarLxmrNFkXq-k4jGU4S6h8nO3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
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
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
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

On Fri, Sep 13, 2024 at 4:37=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Add the port node to fix the binding schema check.
>
> The dsi node has the same issue.

This is still causing warnings in the tree. Please respin the patch.

>
> > Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp=
@intel.com/
> >
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8183.dtsi
> > index 266441e999f2..0a6578aacf82 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
> >                                  <&mmsys CLK_MM_DPI_MM>,
> >                                  <&apmixedsys CLK_APMIXED_TVDPLL>;
> >                         clock-names =3D "pixel", "engine", "pll";
> > +
> > +                       port {
> > +                               dpi_out: endpoint { };
> > +                       };
> >                 };
> >
> >                 mutex: mutex@14016000 {
> > --
> > 2.46.0.662.g92d0881bb0-goog
> >
