Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12378258CA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030B710E635;
	Fri,  5 Jan 2024 17:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95210E635
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:02:37 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rLnaa-0006Ds-1M; Fri, 05 Jan 2024 18:02:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>
Subject: Re: (subset) [PATCH v4 00/29] Add HDMI support for RK3128
Date: Fri, 05 Jan 2024 18:02:31 +0100
Message-ID: <2568547.3Lj2Plt8kZ@diego>
In-Reply-To: <3e7aa9f2-6e37-44c3-9361-5fa7c4ef203d@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
 <170435598418.3166964.9367277671989164237.b4-ty@sntech.de>
 <3e7aa9f2-6e37-44c3-9361-5fa7c4ef203d@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 5. Januar 2024, 17:47:21 CET schrieb Alex Bee:
> Hi Heiko,
> 
> 
> Am 04.01.24 um 09:14 schrieb Heiko Stuebner:
> > On Fri, 22 Dec 2023 18:41:51 +0100, Alex Bee wrote:
> >> This is version 4 of my series that aims to add support for the display
> >> controller (VOP) and the HDMI controller block of RK3128 (which is very
> >> similar to the one found in RK3036). The original intention of this series
> >> was to add support for this slightly different integration but is by now,
> >> driven by maintainer's feedback, exploded to be a rework of inno-hdmi
> >> driver in large parts. It is, however, a change for the better.
> >>
> >> [...]
> > Applied, thanks!
> >
> > [23/29] drm/rockchip: inno_hdmi: Add variant support
> >          commit: 5f2e93e6719701a91307090f8f7696fd6b3bffdf
> > [24/29] drm/rockchip: inno_hdmi: Add RK3128 support
> >          commit: aa54f334c291effe321aa4b9ac0e67a895fd7b58
> > [25/29] drm/rockchip: inno_hdmi: Add basic mode validation
> >          commit: 701029621d4141d0c9f8b81a88a37b95ec84ce65
> > [26/29] drm/rockchip: inno_hdmi: Drop custom fill_modes hook
> >          commit: 50a3c772bd927dd409c484832ddd9f6bf00b7389
> >
> >
> > For reference, Rob has applied the rk3128 compatible in
> > https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=21960bda59852ca961fcd27fba9f92750caccd06
> thanks for keeping track on this.
> 
> Is there any reason the DT paches aren't merged yet? From what I can see
> they should be fine to be merged in your v6.8-armsoc/dts32 branch which is
> 6.7-rc1 based. There was only a txt-binding at this point and it's very
> likely that both the rockchip,inno-hdmi.yaml-conversion and the rk3128
> additon will both land in 6.8 (they are both in linux-next). Linus' 6.8
> merge-window will open earliest next week.

Exactly ... and the arm subarchitectures (Rockchip, etc) feed into the
more generic soc-tree[0]  and from there in a set of pull requests.

Normally everything needs to go to the soc tree before -rc7 .
With the whole xmas stuff, I sent some stragglers in a second pull
request on monday, but that was already before Rob applied the
binding on tuesday.

So 6.8 devicetree stuff is essentially done and the dts patches
from this series will go in to 6.9 .


Hope that explains things a bit :-)
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/

> I'm really not pressuring here and I'm fine if they land in 6.9 - it's just
> for my understanding for further submissions.
> 
> Alex
> 
> >
> > Best regards,
> 




