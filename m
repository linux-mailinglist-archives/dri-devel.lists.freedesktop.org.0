Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB15AF334
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4310E71F;
	Tue,  6 Sep 2022 17:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B110E724
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:58:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q7so18570841lfu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ZTVrtBjQcjDz2HXOGZHir7kyjFYYhDnVRv7D7CHaO+8=;
 b=KK7KHRMtwl9+8HYywuHrGYpuJRzYwogYCmFt11etZs1KJ9SU9xCFEX2Dd3uE+lgIZp
 Q9ubct+zSFOd8O+jiZT7A1AiRpnzCnhgmiJ6EiDql57zRJDjvpG/ekbVso1zPLzrHrmV
 cddZOHdxFPyQB/Xm7KuY5iN4AqkUXfcNe+Hv9xhyB2IdXvK03qUATSyemy5eZ0LyVIar
 Mx12NCKgBNN8CPX2tOllFh1edhngP+27yZMPATW594l4ADyts39mr/v1nNa5HdpWoD7s
 iRlyA+UJM8rAhYb+HdRZBz05aGZfbv/jXahYATpFM42RN4NFiscIHN4dZxnOX+YQYbkf
 /yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZTVrtBjQcjDz2HXOGZHir7kyjFYYhDnVRv7D7CHaO+8=;
 b=EoNKMMb7V6u4Bdnl2hnfS26z6BBtLyx7LxjpEMmaNbpooiY5rcHj3KaUK0E0QcacAR
 T0AeGbw/5HL83C7EdhfQYYE1kLLHESbIHJqEaEk4YDRZ4AQRd7frPmdLCg7Jj+Hx3vHN
 BZQ270Uotz3ZY0zJJoH7179dnY2cj8nD4va6EUOQx5RRQQE94F8kuTFoKO9cwCaB/zHY
 XADrrY+f9K6sQUC5DZf1sFr3cMQq5OXT+J5/0ImJfI6hrKiWP6Sl3tK1mcF5XopLuAGK
 5PfEcR+bhfAoCHG8qGvOumwewZX/z+u8+ruMrvj6OSKfbMPERJitINqEeBMotO1vTjK9
 rv0A==
X-Gm-Message-State: ACgBeo0e71TeVKQY6XgJuW8MZ3MpjdpUycanr7RCbOSEjl1UgeswUQDe
 iXZaNZt8MYFOzf/a00INOsWngpkOwIjrYOwHd2U=
X-Google-Smtp-Source: AA6agR6JaySd7fHnpjySEXtyO5OIRPGjYFXIHEOWdxj6R0A4R9Jb3TlvKFf1KOTkbV0TvdpzisNEqC4cOUxAPw3EmF0=
X-Received: by 2002:a05:6512:2083:b0:496:272:627d with SMTP id
 t3-20020a056512208300b004960272627dmr5417670lfr.115.1662487084959; Tue, 06
 Sep 2022 10:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220906174823.28561-1-macroalpha82@gmail.com>
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Tue, 6 Sep 2022 19:57:28 +0200
Message-ID: <CAO_MupLcjY=3mWA7_RN4AAPir1Gu_GR4q1=5_9wdSEi-qcHKSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rockchip-dsi for rk3568
To: Chris Morgan <macroalpha82@gmail.com>
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

Hello,
What other patches would I need to apply to test this series
on Anbernic RG503?

Best Regards,
Maya Matuszczyk


wt., 6 wrz 2022 o 19:52 Chris Morgan <macroalpha82@gmail.com> napisa=C5=82(=
a):
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> This series adds support for the dsi and dphy controllers on the
> Rockchip RK3568. I can confirm that for the Rockchip RK3568 this
> current series DOES WORK now, but it requires rolling back clk changes
> made for the HDMI driver. If the clock changes are not rolled back, the
> image on the screen is shifted about 100 pixels to the right.
>
> Clk changes in question:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/clk/rockchip/clk-rk3568.c?id=3Dff3187eabb5ce478d15b6ed62eb286756ad=
efac3
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/clk/rockchip/clk-rk3568.c?id=3D6e69052f01d9131388cfcfaee929120118a=
267f4
>
> Tested on an Anbernic RG503 and RG353P with clock changes rolled back,
> the hardware works correctly on both devices.
>
> Changes since RFCv1:
>  - Identified cause of image shift (clock changes).
>  - Noted that driver works now.
>  - Added devicetree nodes for rk356x.dtsi.
>
> Chris Morgan (5):
>   dt-bindings: display: rockchip-dsi: add rk3568 compatible
>   dt-bindings: phy-rockchip-inno-dsidphy: add compatible for rk3568
>   drm/rockchip: dsi: add rk3568 support
>   phy/rockchip: inno-dsidphy: Add support for rk3568
>   arm64: dts: rockchip: Add DSI and DSI-DPHY nodes to rk356x
>
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
>  .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  72 +++++++
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  51 ++++-
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
>  5 files changed, 281 insertions(+), 48 deletions(-)
>
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
