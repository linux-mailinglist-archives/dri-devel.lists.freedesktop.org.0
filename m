Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC04C8739
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8FB10E5E5;
	Tue,  1 Mar 2022 08:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51E510E5DA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 08:58:12 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id r8so4128540ioj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 00:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEgk5klulcAQEghurpTaOMAs7TAwp8sfPglSxNFGlqA=;
 b=XG3qL7R9Ks1hhuMdeycjwObyDGh7unBtQw4SOHVvhjCMmZbQLmvyhn2q299/2DVNB0
 +ZRKx4BcoarPhhRVBGhhSFwXoMr37NYJXq1wxB6JC24A03KR01FX5p6aRy7Dc6OTbPtc
 rkJUWjpPVJQk7B/qZTXiZjEbfIh/fHRj+HGhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEgk5klulcAQEghurpTaOMAs7TAwp8sfPglSxNFGlqA=;
 b=z1EYOH/SOWUV+XLcBIfZaYsY94b+l8lY/RwlWy34UE04iKbMsPsEShk8nc6xMtq36n
 cEU6U36GOx/jvhMiJVB49HoiJiGJgvMIETsMzTtGY4gJ1MFye4IxkF2D3qOiraRXL4vD
 u7WYVSa3MtrztIf5gutP0IdpG2vxfDMVx8WnA1Cw3Wx6/O0w+XETiVj+n/kxWubfvXez
 lYO320CuXXela5WUCNnrN1YUvdTSetIWKKLSMOHAF9fu/Nn8c63N9s4uLxEzThnmZjlh
 M+OrbKvuTNaWttd532wICbC2Nfgm1VIyeITptesamRzRprixc7Mgipla9Jqaw/t3zagL
 +AUA==
X-Gm-Message-State: AOAM532CnVkj5EGPn2gsgUhFsh268D6o0o8SCv5RUDic2aU9vXRKKGRI
 kFxQqPBN07OhQCDeDmEWchRJDfWzvF607ULEjhQ9cg==
X-Google-Smtp-Source: ABdhPJwtjuUQyAbuRtHNGo/QfWRipdcVv450+DMXtNuMsDTCVePqpvJvDKSlueJ7dF0rExgYurnYzBUL+lnobGEkL64=
X-Received: by 2002:a02:2a0d:0:b0:317:380f:8fce with SMTP id
 w13-20020a022a0d000000b00317380f8fcemr6816591jaw.205.1646125092097; Tue, 01
 Mar 2022 00:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20220217082224.1823916-1-hsinyi@chromium.org>
 <20220217083119.GA3781632@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220217083119.GA3781632@anxtwsw-Precision-3640-Tower>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 1 Mar 2022 16:57:45 +0800
Message-ID: <CAJMQK-gDDtPT-kM56WodE=eo1UAZShbshLsuy_o-YuhorFe8mw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux
 read command.
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 4:31 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> On Thu, Feb 17, 2022 at 04:22:25PM +0800, Hsin-Yi Wang wrote:
> > If the previous transfer didn't end with a command without DP_AUX_I2C_MOT,
> > the next read trasnfer will miss the first byte. But if the command in
> > previous transfer is requested with length 0, it's a no-op to anx7625
> > since it can't process this command. anx7625 requires the last command
> > to be read command with length > 0.
> >
> > It's observed that if we clear the DP_AUX_I2C_MOT in read transfer, we
> > can still get correct data. Clear the read commands with DP_AUX_I2C_MOT
> > bit to fix this issue.
>
> Hi Hsin-Yi, thanks for the patch!
>
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
>
> Thanks,
> Xin

Hi Robert,

Kindly ping on this fix. Thanks.

> >
> > Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v1->v2: Offline discussed with Xin Ji, it's better to clear the bit on
> > read commands only.
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 633618bafd75d3..2805e9bed2c2f4 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -253,6 +253,8 @@ static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
> >       addrm = (address >> 8) & 0xFF;
> >       addrh = (address >> 16) & 0xFF;
> >
> > +     if (!is_write)
> > +             op &= ~DP_AUX_I2C_MOT;
> >       cmd = DPCD_CMD(len, op);
> >
> >       /* Set command and length */
> > --
> > 2.35.1.265.g69c8d7142f-goog
