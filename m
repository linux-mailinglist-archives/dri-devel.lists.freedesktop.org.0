Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976964FE9E7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE3610E7EC;
	Tue, 12 Apr 2022 21:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Tue, 12 Apr 2022 21:26:22 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5D010E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 21:26:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23CLKoth058896;
 Tue, 12 Apr 2022 16:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649798450;
 bh=eI1T/bFGS1LickmovZ0igeFAK0lvOxui0sWfaIzxQeY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uO+WB20qXWzIHqPsbw2xPhAIXv1aam7N7nd5s0AcdedCLgqEK+52tIjzb5MSRP4r5
 /w2Vee7SgMLitia9QJpUlPFmqkHHzbfIUa7NOUBDYbU98YXa1p4sp6VwkF+0xq3EN8
 07pTtieb3kZfpKRdjdtit+/v1rDeP2YaI7z4zY9o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23CLKoXU093452
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Apr 2022 16:20:50 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 16:20:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 16:20:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23CLKn6Y077073;
 Tue, 12 Apr 2022 16:20:49 -0500
Date: Tue, 12 Apr 2022 16:20:49 -0500
From: Nishanth Menon <nm@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <tony@atomide.com>
Subject: Re: [PATCH] drm/tidss: Soft Reset DISPC on startup
Message-ID: <20220412212049.gjnel7aubol56azk@earache>
References: <20220314113739.18000-1-devarsht@ti.com>
 <86a07099-1074-e8d1-6d0e-1ce68414b627@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86a07099-1074-e8d1-6d0e-1ce68414b627@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Devarsh Thakkar <devarsht@ti.com>, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a-bhatia1@ti.com, vigneshr@ti.com, laurent.pinchart@ideasonboard.com,
 jyri.sarha@iki.fi, nikhil.nd@ti.com, linux-arm-kernel@lists.infradead.org,
 r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17:24-20220412, Tomi Valkeinen wrote:
> Hi,
> 
> On 14/03/2022 13:37, Devarsh Thakkar wrote:
> > Soft reset the display subsystem controller on startup and wait for
> > the reset to complete. This helps the scenario where display was
> > already in use by some other core before the linux was booted.
> 
> The reason the omapdrm doesn't do a reset is that the PM features on some of
> the DSS registers were set and controlled outside dss driver, so the dss
> driver could not do a reset just like that. That design was carried to the
> tidss driver, although I'm not sure if the reason is valid on AM6 and J7
> platforms.
> 
> If that reasoning is not valid, this patch is ok and:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

Tony - sysc control for older omap devices still control this directly?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
