Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7A68B037
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3CC10E16C;
	Sun,  5 Feb 2023 14:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CD810E16C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:12:44 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pOfks-00077L-Ly; Sun, 05 Feb 2023 15:12:30 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Date: Sun, 05 Feb 2023 15:12:29 +0100
Message-ID: <5647788.DvuYhMxLoT@diego>
In-Reply-To: <87f5097d-1cd0-e09f-e759-8592a9165ea6@gmail.com>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <20230203182119.GA615242-robh@kernel.org>
 <87f5097d-1cd0-e09f-e759-8592a9165ea6@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, sw0312.kim@samsung.com,
 hjc@rock-chips.com, robert.foss@linaro.org, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Freitag, 3. Februar 2023, 20:02:54 CET schrieb Johan Jonker:
> 
> On 2/3/23 19:21, Rob Herring wrote:
> > On Thu, Dec 22, 2022 at 03:22:14PM +0100, Johan Jonker wrote:
> >> Convert rockchip-lvds.txt to YAML.
> >>
> >> Changed:
> >>   Add power-domains property.
> >>   Requirements between PX30 and RK3288
> >>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> ---
> >>
> >> Changed V3:
> >>   Filename matching compatible style
> >>   Drop "Regulator phandle for "
> >>   Specify properties and requirements per SoC
> >>   Sort order and restyle
> >>
> >> Changed V2:
> >>   Fix title
> >> ---
> >>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
> >>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
> >>  2 files changed, 170 insertions(+), 92 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> > 
> 
> > What's the plan for these patches? Don't see them in linux-next still. 
> > Do you want me to take patches 1-8?
> 
> Hi,
> 
> The display patches normally go through the DRM git.
> Patch 2 must merge with grf.yaml.
> Heiko has merged now 3 PHY related patches to grf.yaml first.
> 
> [PATCH v6 02/17] dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml
> 
> See current
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=for-next&qt=grep&q=jonker
> 
> Not sure what Heiko's plans are.
> Patch 2 replaces  only a description text and some accolades removal, so not "too" important.
> 
> I urgent then you could merge without conflict:
> 1, 3-8

So I've applied patches 1-7 to the drm-tree now.

For the GRF-patch, I've dropped the quotes changes, as they are somewhat
unrelated to the lvds inclusion and so prevented any conflicts when applying
the rest to the DRM tree.

@Rob, if you could pick the fusb302 patch (number8), that would be great

Thanks
Heiko


