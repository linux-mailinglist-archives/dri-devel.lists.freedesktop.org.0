Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D4015BCD1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6E6E1F1;
	Thu, 13 Feb 2020 10:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AE6E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:30:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DAU0ic101320;
 Thu, 13 Feb 2020 04:30:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581589800;
 bh=R98a9SMu5+eMeNYgNMcwCYKDHkQAW3h7Sh9JpzS1HH8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pYQ3iGUH3kWGYdlbtTIeH6xKsUJ2vKa/0sh3w2A3E1yz1TXlfOISpy3LatJUQl+PQ
 lOQqMo4Md4ocehc24lodfZaIYJFDj34XxSmimIqJMzx1djMbTBFP1lK0R3KHYlKfTV
 igt6A/JYGWI5AqysnGY1FmESBIP3eyRtRuCAnD0s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DAU0F1080260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Feb 2020 04:30:00 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 04:29:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 04:29:59 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DATtZs019005;
 Thu, 13 Feb 2020 04:29:56 -0600
Subject: Re: [PATCH v5 3/3] drm: bridge: cdns-mhdp: add j721e wrapper
To: Yuti Amonkar <yamonkar@cadence.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <maxime@cerno.tech>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
References: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
 <1581481604-24499-4-git-send-email-yamonkar@cadence.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <42a2db9b-b1ad-55be-5631-669b6bfae9a7@ti.com>
Date: Thu, 13 Feb 2020 12:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581481604-24499-4-git-send-email-yamonkar@cadence.com>
Content-Language: en-US
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
Cc: praneeth@ti.com, mparab@cadence.com, jsarha@ti.com, sjakhade@cadence.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2020 06:26, Yuti Amonkar wrote:
> Add j721e wrapper for mhdp, which sets up the clock and data muxes.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig           | 12 ++++
>   drivers/gpu/drm/bridge/Makefile          |  3 +
>   drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 14 +++++
>   drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
>   drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 79 ++++++++++++++++++++++++
>   drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 55 +++++++++++++++++
>   6 files changed, 164 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
>   create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
