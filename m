Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B4A397E9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823CA10E093;
	Tue, 18 Feb 2025 10:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="NxiIsn1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1889510E093
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XqV/29FN8TAKwZ9jAVPZuJgB96iWFCzrBQyx4X5GjRI=; b=NxiIsn1b7FykEg6OCLh5DpDtTw
 RDjum5Qx4uV2nMLbl4A6rKayYGAtYmRYhAH5mPNiqN74w7AOyScXoApT0M3CIAtB5pfTCduRV84jd
 8Y9wbfTlYPWDx+tG8n52sNCelLFypuJUEOv8RXNXELnwatmIl5F2DkL7iHY8TDhbx8bWA+EMZkzWV
 awy1oAO/ET4dDzpyQfTxmlkpCH5DD/0t5BSkPOJVNP06R7088+J5tbrXKad7fHL5iEhgRrswiU0aD
 P/xjDk3UO+AdXFAGXt0t8pbE8CJWS6djYfLefPC+snPPRg5SpASruOXsCRX6Fcqmmj6HbjXD424EU
 wvqiQjNA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tkKPS-0003jc-4g; Tue, 18 Feb 2025 11:00:58 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: cristian.ciocaltea@collabora.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, liujianfeng1994@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Tue, 18 Feb 2025 11:00:57 +0100
Message-ID: <1919367.CQOukoFCf9@diego>
In-Reply-To: <20250218095216.1253498-1-liujianfeng1994@gmail.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
 <20250218095216.1253498-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Am Dienstag, 18. Februar 2025, 10:52:16 MEZ schrieb Jianfeng Liu:
> Hi Cristian,
> 
> No matter one or two hdmi ports the rk3588 boards have, most of
> devicetrees in mainline kernel only have hdmi0 supported. After applying
> this patch their hdmi0 support is broken.
> 
> So I recommend moving the vop clk part to board level devicetree.
> Then support of hdmi0 won't be broken, and board maintainers can add
> HDMI1 PHY PLL clk when they are adding hdmi1 support. I can add support
> for orangepi 5 max and armsom w3 for reference by other developers.

better, fix the VOP2 driver - both for the existing hdmi0 + this hdmi1
please.

I.e. the clock is optional, and the error you are seeing comes from the

       vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
       if (IS_ERR(vop2->pll_hdmiphy1)) {
               drm_err(vop2->drm, "failed to get pll_hdmiphy1\n");
               return PTR_ERR(vop2->pll_hdmiphy1);
       }

part. clk_get_optional is supposed to return NULL when clock-retrieval
causes a ENOENT error. Seemingly going to a clock controller in a disabled
node returns a different error?

So I guess step1, check what error is actually returned.
Step2 check if clk_get_optional need to be adapted or alternatively
catch the error in the vop2 and set the clock to NULL ourself in that case.


hdptxphy0 + hdpxphy1 _are_ valid supplies for the vop, so their reference
should be in the soc-dtsi and the kernel code should just figure things out
correctly. Wiggling with clocks in each board will cause headaches down
the road.


Heiko


