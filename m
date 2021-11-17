Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015F454957
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B86E507;
	Wed, 17 Nov 2021 14:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB96E507
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:54:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D75361BFA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637160891;
 bh=bgjr8yJOWsL+nIbaL9cKsP3o2b2qmUpIgL5aZebelLo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JTd+v5Z6z01TfR/bR9dmTn87qBNRyDSSvXGsI6etW0Txeu2IWFcrwMihng3+EG9mz
 LKecFZeu1/tBJmEol1kk0tGJY+wpza49zFtz0zxD9ncwSonfkgf70Oxdjp2X6g3p7T
 fxfHu+nWTwLhQptBX4c71rHmo6sjpTTuzP9WxA62K19TLz9n/CQYcGVv6h1aakx4VA
 B6aTvz9mvI5L/Q0CN+S7SuD97aCm0chOJC/75/rggKjR8MNq103umV7WwdkQlXaank
 n6+8i6L3FxSrCDuN2UNRGsp3YKneIHfGYkdPqzKWyHrPRQD19t3QDXjbbWTemFj2G3
 vv6FvS3XEMRzQ==
Received: by mail-ed1-f52.google.com with SMTP id w1so12295164edd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:54:50 -0800 (PST)
X-Gm-Message-State: AOAM533O3p/Bdap0xO6bCLBZf5gowtMuGYvbHUstVRid0mFGZSqREaz0
 l8ApTCn1QvHHJSQf7M9d48kYXDqBkFuEWUH4nQ==
X-Google-Smtp-Source: ABdhPJw0S7ajbekMY4Kz6agkssG2VWOwZDiRqdiVwjh429yqwO31JlqnTUZtYuiwYFavxe4b0vRatEav0QC/Rq3OPEs=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr22594000edh.318.1637160889361; 
 Wed, 17 Nov 2021 06:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Nov 2021 08:54:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxJj2JT-0vN45vYyoy_Sh87NnoTfJQH-4qxRoPNwtj5Q@mail.gmail.com>
Message-ID: <CAL_JsqJxJj2JT-0vN45vYyoy_Sh87NnoTfJQH-4qxRoPNwtj5Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 8:34 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> This series adds initial graphics support for the Rockchip RK356[68]
> SoCs.  Graphics support is based around the VOP2 controller which
> replaces the VOP controller found on earlier Rockchip SoCs. The driver
> has been tested with HDMI support included in this series and MIPI-DSI
> which is not included because it needs some more work. The driver is
> taken from the downstream Rockchip kernel and heavily polished, most non
> standard features have been removed for now. I tested the driver with
> the libdrm modetest utility and also with weston with both pixman and
> panfrost driver support. Michael Riesch reported the driver to work on
> the RK3566 as well, but device tree support for this SoC is not yet
> included in this series.

Can you outline what exactly you want to disable? I don't think
'status' is the right way. I think between the parent device being
disabled, an incomplete graph and user configuration choice that
should be enough to disable parts.

Rob
