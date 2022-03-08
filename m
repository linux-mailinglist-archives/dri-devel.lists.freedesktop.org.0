Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618F4D0E77
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 04:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8D10E5DF;
	Tue,  8 Mar 2022 03:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA79A10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 03:48:05 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id u61so35179509ybi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 19:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SB1pR6R36cG/5vqUJ9L1OYX7dRask2g/0weyNuOkOYQ=;
 b=Aqt++puDVTDcltryRW77a9cwhFd1XciMKNs9AsjManml5e4eEQPtDOB/5nEXjsn+P9
 GkEs/gI5+4vK3gNMFYbQocu8XMlxE9wCZPPoS8OfoPNDIE6avBWb/hU6LMu1/Cf2whCu
 FFb8lEOczvnEeE5kzWcvCMw/ecWn+5SZxlX2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SB1pR6R36cG/5vqUJ9L1OYX7dRask2g/0weyNuOkOYQ=;
 b=G2hKsfBTjNfoxqsKVy5HVdNnMBIeg8PmZqxQLsAjooW0e4qS97k0c6mHDO7+bpk8Y9
 N7vgghs6GXEzqs9t5blmJWN/rU/sPX/mBYc06kl/qZdWh2a46e0SttwRFtONCFltpWrB
 qqQLx/kndjkCBV3q7eEvRCIHcIIFmDW8Bo//vHUbjfa3Ptc2ClNpbzx/y7ru+NH/coAn
 2PlybwrU7gD+ebw7X9bWYsgBDsOhL9+Y9JW1I/mfPK8y6rnGWrxTWu0kS0ezjA3ZSLPn
 N0Wi/RWn3iB9o6B9uqlq7E/lKWVn3LufUsd+9WXicFkpSUvMFY7sgAbmMfGdSsCbVIH4
 dGJg==
X-Gm-Message-State: AOAM532L93ZI8CfImH13dHmLEt6DaXrrrTk37OYwhf+a4+nRmlQHduoI
 9cQHXNsWEKbPab+QJkpPDvrFVZWdKmfUJiB9LJchuA==
X-Google-Smtp-Source: ABdhPJyuGeWIUlb3utDkOR1PhipoTjIrNi/Cf0gmscf2NmU/0KOasS7EzcBrtPdNSmwisXmV8F84klzvCTpKGd/lH2w=
X-Received: by 2002:a25:d449:0:b0:628:945d:713c with SMTP id
 m70-20020a25d449000000b00628945d713cmr11205541ybf.164.1646711284731; Mon, 07
 Mar 2022 19:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
 <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
In-Reply-To: <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Mar 2022 11:47:53 +0800
Message-ID: <CAGXv+5H7RvczEeAyLEmJ-RNAwqV1G71FhsG3Kpi0r+qPkXVaeQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
To: Robert Foss <robert.foss@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 12:20 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I think we need to send this directly to the soc maintainers to get it
picked up before the final 5.17 release?

>
> On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > index e8f133dc96b95..8f7bf33f607da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > @@ -171,8 +171,6 @@ port@0 {
> >
> >                         anx7625_in: endpoint {
> >                                 remote-endpoint = <&dsi_out>;
> > -                               bus-type = <5>;
> > -                               data-lanes = <0 1 2 3>;
> >                         };
> >                 };
> >
> > --
> > 2.32.0
> >
