Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CD702F36
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6419010E1E1;
	Mon, 15 May 2023 14:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763FA10E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:07:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so11988261f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159629; x=1686751629; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n75gxWwijMMTI9GiXx1bdZzw1eSKDQ/JY3MbdqyyfJ8=;
 b=MybEwHb7tKFR+czM65dq6Won8HWSGsgYs9IN4ez2NUgHvZhPq/Fjq3SQvBRDwj2apk
 TQlRnqRGsmPdmCCiuAQcNV5mzBWUfS345LKMeMaqnYmHN1XGmlqe+rc1IsW5hQGIN2hY
 Sk7HLb6fGLLzfm46sD0+z8iN/0C24ndOXGjNqF6egg+usyu0Bf3KHWzTofwatANRJWl4
 NM6U67P7oQUYPeY4ghnVyPngLeXR/uhODxoz4qrOAMKkje2MBG2F+8kinM7BX0ZLPHGd
 S/9F6uqsD+yaKQT/H6KccQdorGqjBBxvsrr+IBeIoiXO2e2PeafrSkbg/OX5wBedzpfb
 rR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684159629; x=1686751629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n75gxWwijMMTI9GiXx1bdZzw1eSKDQ/JY3MbdqyyfJ8=;
 b=BeTVHCGZMLN4rXK/tTpHAFw/XSI1OuA/iHUK/7WwnJxzywIqf+2zYpm7CZuduwWa/Y
 LdNP5y4i3REvFz85J894tbZzGqARHSQ/qu+kq/3Cg5QaNz1i9DG5E2Zz9YFVVuey8pNE
 i1+XlQc+7vUdvSH4fn4XJB/Ee4OQ16AadJ/NTc6MMYNzlJ3YUpRdu90EHGgHEzfiDwS3
 oG4AQTPQ3z0vbN+lhKoNya6IzuZaY36XyrpcTPrVL2rNs7RxiE4rgXFlAfq0RtodrE9a
 Xotdb1tCL3y/V8ZrDfP73chZwPe7pCLGjQBmb/4P0wrs/a3ObvsJbQ4YlUBuCt4N8AAi
 3Jbw==
X-Gm-Message-State: AC+VfDyE75vp2myTKV3dCZ/M+OSAhTrBgslJyZvmyi6Oqpqmo5HGuS3z
 RP9TNyQh63sC7vljlCpSzJBrLsG921wMc+uQvbZw3Z5i
X-Google-Smtp-Source: ACHHUZ79hANfbDvpP6oNPyXKE1ftm/gHtkEaa9Icb1GGlaeSnOsVu4I4PEo/Jz9DCazNFmJCLmAmFg==
X-Received: by 2002:adf:e492:0:b0:306:2dd6:95d3 with SMTP id
 i18-20020adfe492000000b003062dd695d3mr30832770wrm.22.1684159629085; 
 Mon, 15 May 2023 07:07:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c224200b003f4253ddb7dsm23548392wmm.43.2023.05.15.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:07:08 -0700 (PDT)
Date: Mon, 15 May 2023 16:07:07 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > +#define CSIxB_OFFSET		0x1000
>
> What if we grab two (or three?) iospaces from devicetree?
>
> - base (global)
> - csi_a
> - csi_b
>
> That would make it possible to maybe eventually extend this driver to more
> versions (older or newer) of the CSI PHY IP without putting fixes offsets
> inside of platform data structures and such.
>
Hi Angelo,
The register bank of the CSI port is divided into 2:
* from base address to base + 0x1000 (port A)
* from base + 0x1000 to base +0x2000 (port B)
Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
1 clock) and use either port A or port B.

For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
2 * 2D1C and CSI1 which can use only 4D1C mode

2D1C mode can not be tested and is not implemented in the driver so
I guess adding csi_a and csi_b reg value may be confusing?

What do you think?

Regards,
Julien
