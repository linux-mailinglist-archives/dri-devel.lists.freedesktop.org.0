Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9E591FD8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 15:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4536D131A;
	Sun, 14 Aug 2022 13:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392AD1300
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 13:11:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso6634985wma.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=AwhK7wTBXcBXgJI8gYQWdu+no9daQGPqNzLmnBIJk/Y=;
 b=i2DReFLns7Fc0u+ltP6g2mGaoIGlbozNy1cckeaLmSueCXTgtqvrVuhYwrKpJMw2w7
 +jhgnTwrMsvUB72dyJ7jsaZwVrb34oZGho2Zcdk7aC1GXOiAqUemzz3dh3Bd1W4K90+Z
 WxDEus9fCX9hu3/GN4NAVFQV4fZFaAKPjjpyca6kn2E1ugUGatoiEslHnsQDd6zBecNj
 0CAFVi1xlMCiKoSXwPzUMOr9C4cQs+IQ1AcPQELPWOxZatTo7kcDIqp2k+moA8cp3r65
 H3eamcbSIGbvtp2wiby02RbbXOXDVeXsHRHP4RBeJZq7869hbUoZzI6uDqNJYxytZcGJ
 8kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AwhK7wTBXcBXgJI8gYQWdu+no9daQGPqNzLmnBIJk/Y=;
 b=1clbf3ANm5/oIcgZjV7Df4eT0zz8/TrzB+h5P+iQNLJM1mmRMl/YSzy4/vArqhc0vu
 IBgaiMdFxcyqLs/A/i+DVUMtNQGK1NG9HU6iEv7PI6rqPZ9CjhOuDcHtENDkpTplsY/P
 dHgMfNUTmlYwExOsiAmYNYGzV1k63zyUcvmFChl+m9V0YGRKOSr80llVxHk+VlhHd4M4
 k16I5mfSnv1AVWH1qmDr6rRxYROgtObO8xGsNSXEtegMAU7aJYnjgdscYDrVbAtRhi/f
 neORwTiXztebauMyf7DCt+NxArCLMEnmSZNCE7HS4o+uLqbPa6CTUr+gl6R7tNCvZTc6
 KDfA==
X-Gm-Message-State: ACgBeo25X5WLV3BKYsENpvCWBTNQZJk0yMQveCZHNrsoJ6Sc+vFB6iu6
 oH3kKWa8WASkhXJ1fy+oFSkRIH4td7gg5rEMchg=
X-Google-Smtp-Source: AA6agR5efggXY+S2mxoio8litXwouBnsyAK6zubmq0Kp4pzIcv/kqz9XG5Z24VzuncXXvhfpWZ6fKxiwDXznkK/mSlk=
X-Received: by 2002:a05:600c:1e1c:b0:3a5:b668:4e2 with SMTP id
 ay28-20020a05600c1e1c00b003a5b66804e2mr12767740wmb.112.1660482681273; Sun, 14
 Aug 2022 06:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143247.25825-1-macroalpha82@gmail.com>
In-Reply-To: <20220812143247.25825-1-macroalpha82@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sun, 14 Aug 2022 15:11:09 +0200
Message-ID: <CAMdYzYqno-kWvUjU37XjTwOQQKbf1uvpU02hHbB4hhVOEDVgig@mail.gmail.com>
Subject: Re: [RFC 0/4] rockchip-dsi for rk3568
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Chris Morgan <macromorgan@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, "Kishon Vijay Abraham, I" <kishon@ti.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 4:33 PM Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>

Good Afternoon,

>
> This series adds support for the dsi and dphy controllers on the
> Rockchip RK3568. I can confirm that for the Rockchip RK3568 this
> current series DOES NOT WORK properly yet. The image on the screen
> is shifted about 100 pixels to the right and does not appear to be
> a timing issue. This behavior was observed on both the Anbernic RG503
> and RG353 portable gaming devices with different screens. These changes
> were also tested on an RK3326 based device (an Odroid Go Advance) with
> no noticeable regressions.
>
> An example of the issue on multiple devices:
> https://media.discordapp.net/attachments/973914035890290718/1007407064647221299/IMG_1999.jpg
> https://media.discordapp.net/attachments/995430498677571604/1003754966932008960/AB25898E-73EC-40A9-BD47-3FB970DDFB31.jpg
>
>
> Given the fact that the DSI controller is identical on the PX30 and
> RK3568 aside from different grf registers I am assuming the PHY is
> likely where the bugs are currently. I'm posting this as an RFC in the
> hopes that someone more knowledgeable than I can help identify the
> problem.

Thank you for this. It will be a few weeks before I'm in the position
to test your series, but what you have described matches what I have
observed in my attempts as well. I suspect the issue is actually in
the VOP2 driver, since the PHY test functions display without
corruption and loading up a 1080P hdmi connection allows DSI to
display correctly.

Very Respectfully,
Peter Geis

>
> Chris Morgan (4):
>   dt-bindings: display: rockchip-dsi: add rk3568 compatible
>   dt-bindings: phy: phy-rockchip-inno-dsidphy: add compatible for rk3568
>   drm/rockchip: dsi: add rk3568 support
>   phy/rockchip: inno-dsidphy: Add support for rk3568
>
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
>  .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  51 ++++-
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
>  4 files changed, 209 insertions(+), 48 deletions(-)
>
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
