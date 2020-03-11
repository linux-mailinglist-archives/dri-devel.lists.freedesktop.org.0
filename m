Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9596B1819E9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854C16E98A;
	Wed, 11 Mar 2020 13:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E5FD89C6C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:35:30 +0000 (UTC)
X-UUID: 1b2608dd0db04fff83e9cf39cfe30b47-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=McO5u8qL+2dJhFVvrj+B5fmGSNs+dJJtNOnC6DdTdJc=; 
 b=Aq27vvjZcvPOEPPn1VNJtKGPz6WrJtnaFEyaa8jSyrsFfrILJyPzYOqgxePyAya8KC2mLT8/vgOfd6KPFoZSr+Y4pZ9gWMtNGzSiletX7KV/lmGONr6a2bmjO6WedI3oBdfT8+Ak1lf87cpENZBvc4592FWQK54VW8YlFht246c=;
X-UUID: 1b2608dd0db04fff83e9cf39cfe30b47-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1823203278; Wed, 11 Mar 2020 21:35:27 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:35:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:35:10 +0800
Message-ID: <1583933726.1550.1.camel@mtksdaap41>
Subject: Re: [PATCH v11 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Wed, 11 Mar 2020 21:35:26 +0800
In-Reply-To: <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-6-enric.balletbo@collabora.com>
 <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-11 at 14:26 +0100, Matthias Brugger wrote:
> 
> On 11/03/2020 12:56, Enric Balletbo i Serra wrote:
> > In the actual implementation the same compatible string
> > "mediatek,<chip>-mmsys" is used to bind the clock drivers
> > (drivers/soc/mediatek) as well as to the gpu driver
> > (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
> > that the only probed driver is the clock driver and there is no display
> > at all.
> > 
> > In any case having the same compatible string for two drivers is not
> > correct and should be fixed. To fix this, and maintain backward
> > compatibility, we can consider that the mmsys driver is the top-level
> > entry point for the multimedia subsystem, so is not a pure clock
> > controller but a system controller, and the drm driver is instantiated
> > by that MMSYS driver.
> > 
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Same here.

Acked-by: CK Hu <ck.hu@mediatek.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
