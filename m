Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A474B2547B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 22:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF8E10E7BA;
	Wed, 13 Aug 2025 20:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="nD6lOj/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0EF10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 20:24:43 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DKOY7I2151908;
 Wed, 13 Aug 2025 15:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755116674;
 bh=blSyGf2qTEmaa6tvJvPYehinH7UoKZNENIW1ywwYV/4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nD6lOj/K6byJgAM1e8g6SgCOh/0s1PNxOCYo+dyio05hr0+FtxqM8GHOm7rFNUfGu
 aBfnaiZwuJAZPa0T96AkIEtE7eSmd54+5Js5i+wG163PVDC3CR3a7HWo+8p7usD+GJ
 aAbM/iibJaqr6HPRpdr766dEU2c59A96/5e8K/6M=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DKOYAg1320685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 15:24:34 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 15:24:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 15:24:33 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DKOX2k2530974;
 Wed, 13 Aug 2025 15:24:33 -0500
Date: Wed, 13 Aug 2025 15:24:33 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH 0/2] drm/bridge: it66121: Add it66122 support
Message-ID: <20250813202433.lsfiggziuzqjtfsq@passover>
References: <20250813190835.344563-1-nm@ti.com>
 <4c6a7db0-dc75-4ed1-aeae-418fa004ea53@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4c6a7db0-dc75-4ed1-aeae-418fa004ea53@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 14:32-20250813, Andrew Davis wrote:
> On 8/13/25 2:08 PM, Nishanth Menon wrote:
> > Hi,
> > 
> > Add support for IT66122, which for all practical purposes is
> > drop in replacement for IT66121 except for the ID register
> > definition.
> > 
> > BeagleY-AI uses this new part as the old part is no longer in production
> > as far as I understand.
> > 
> > Now, BeaglePlay uses it66121 at the moment, but at some point, it might
> > end up flipping over to the new part.
> > 
> > An alternate implementation could be to drop the revision check or make
> > it66121 check include alternate ID check.. but that seems a little
> > non-standard.. Anyways, I suppose mediatek platforms will face this
> > problem as well at some point.
> > 
> 
> Hmmm, since these boards will probably have to switch parts mid-production
> it would cause us to need to have a new DT with the updated compatible
> just for a otherwise transparent revision. Might be better to just
> loosen the PID check so the alternative part work just the same.

I think we can get both world.. respinning this up in v2

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
