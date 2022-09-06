Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1775AF6FE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524C110E29E;
	Tue,  6 Sep 2022 21:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95AB10E29E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 21:39:03 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-127f5411b9cso136451fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=MI08UNxAOnd9oxFmv4C6SfhMJQ/93TZu/WFSwhEtO1s=;
 b=hu11akstVs9ntl1891dAVfykY83Af2p5EQ6rWXdFAkTLJGAQGS62cIlKyV3QlYy2PD
 gOUeZm4T8IiT3eMEybGWJ5SQTiwiR7gG91o5tYWuMz08AeTKSd/DOqZeisSr9wjc0kLq
 Qtb6FJe2CQaJHsy/fCZdDykudQXbgKPrcnoGTKnCGcORd52CVMa+6GZIuf5UU9asNyU9
 HpRqyMFWLU7Fs5abApoejvk130xzZZtVQ45DshXeURdqv3MxD8DmoS3QCBkZho00Eryn
 DtZ8oO7wSc76Wtrx+6ncI+FQABvCjqEFHz6qHLcCVvxNltzypIIsB8JqpOOZVA65ey0j
 /Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MI08UNxAOnd9oxFmv4C6SfhMJQ/93TZu/WFSwhEtO1s=;
 b=1d8rsqQYhfzZUHst09l1RI4bw3wjPn6YO/JjiPD41NCn1q+HxZF4w8yRpENhywvidt
 q4o4WMKJhyeuL9SNByBSM4hN1pTKB1bpLtA+uU7fNElsSTmFhGba7UHW7Rtx9bq5VxCq
 l+k+ulTvImjLlnkbytQwe7MXNDPcTcNNvXbqx1+vpUBJBZiLqoV3PLEOIsZhCuxmw1UE
 cpVk9OCWCQ7PtMlu5iwyYpvIKetJWaVuUABATW0ajCCcuqFc6x6VwdAqxB/Kh7yW0aHI
 1BwuEDuaq+vJ5aVtB7YPNXjD1+qiuYKBSFJOC2NuATB1TvEGLJPsWvn3M4dhzf4/fZzV
 8WWw==
X-Gm-Message-State: ACgBeo3K05WzSxkfTxtdWxDj09wsMLaTDdD4cWpvAECMfLEyLTpQlvHM
 CRFm3ZhZ361dko949xaoDNc6rO9Ef5w=
X-Google-Smtp-Source: AA6agR46SDnWMe7UrRNnpLt3ZcK25Zg5KVlWl/Sy/h1nPuNJeRmLNAIc0KHvWXm5glgm2002p44hAw==
X-Received: by 2002:a05:6871:b21:b0:127:69ad:538e with SMTP id
 fq33-20020a0568710b2100b0012769ad538emr162111oab.260.1662500343070; 
 Tue, 06 Sep 2022 14:39:03 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 m16-20020a056808025000b00344851ea0ddsm5766777oie.56.2022.09.06.14.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 14:39:02 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:38:59 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v2 0/5] rockchip-dsi for rk3568
Message-ID: <20220906213859.GA29434@wintermute.localdomain>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
 <CAO_MupLcjY=3mWA7_RN4AAPir1Gu_GR4q1=5_9wdSEi-qcHKSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_MupLcjY=3mWA7_RN4AAPir1Gu_GR4q1=5_9wdSEi-qcHKSQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Chris Morgan <macromorgan@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, kishon@ti.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 vkoul@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 07:57:28PM +0200, Maya Matuszczyk wrote:
> Hello,
> What other patches would I need to apply to test this series
> on Anbernic RG503?

In addition to these patches you'd need the devicetree series:
https://lore.kernel.org/linux-rockchip/20220906210324.28986-1-macroalpha82@gmail.com/

You'd need the panel driver:
https://lore.kernel.org/dri-devel/20220906183642.12505-1-macroalpha82@gmail.com/

And you'd need to update the binding for the panel in the devicetree
(example here):
https://gist.github.com/macromorgan/caff01bfe4df6995d5f74cef701ede6d

If you apply these patches and roll back the clock driver changes the
panel should start working for you as it does for me. I tested by
nuking my build-tree and starting fresh with just these patches.

https://cdn.discordapp.com/attachments/973914035890290718/1015350475152949248/IMG_2028.jpg

Thank you.

> 
> Best Regards,
> Maya Matuszczyk
> 
> 
> wt., 6 wrz 2022 o 19:52 Chris Morgan <macroalpha82@gmail.com> napisał(a):
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > This series adds support for the dsi and dphy controllers on the
> > Rockchip RK3568. I can confirm that for the Rockchip RK3568 this
> > current series DOES WORK now, but it requires rolling back clk changes
> > made for the HDMI driver. If the clock changes are not rolled back, the
> > image on the screen is shifted about 100 pixels to the right.
> >
> > Clk changes in question:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/rockchip/clk-rk3568.c?id=ff3187eabb5ce478d15b6ed62eb286756adefac3
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/rockchip/clk-rk3568.c?id=6e69052f01d9131388cfcfaee929120118a267f4
> >
> > Tested on an Anbernic RG503 and RG353P with clock changes rolled back,
> > the hardware works correctly on both devices.
> >
> > Changes since RFCv1:
> >  - Identified cause of image shift (clock changes).
> >  - Noted that driver works now.
> >  - Added devicetree nodes for rk356x.dtsi.
> >
> > Chris Morgan (5):
> >   dt-bindings: display: rockchip-dsi: add rk3568 compatible
> >   dt-bindings: phy-rockchip-inno-dsidphy: add compatible for rk3568
> >   drm/rockchip: dsi: add rk3568 support
> >   phy/rockchip: inno-dsidphy: Add support for rk3568
> >   arm64: dts: rockchip: Add DSI and DSI-DPHY nodes to rk356x
> >
> >  .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> >  .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  72 +++++++
> >  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  51 ++++-
> >  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
> >  5 files changed, 281 insertions(+), 48 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
