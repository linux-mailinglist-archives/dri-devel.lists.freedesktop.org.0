Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5378F1928F2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7799B6E854;
	Wed, 25 Mar 2020 12:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD226E854
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 12:53:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCqrK4106696;
 Wed, 25 Mar 2020 07:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585140773;
 bh=XwcGsUU+MMgQ/0OB3T5F7CzrjdMEgn4HGRhIo1gg2Jc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KhegpvGkNUzviYKWWSkglUvKktk6k2xCQPX5qgoo0/Sgm/h9jRt56ZyTeDEaFEa1O
 7KAuFZ8iwn5dIQ1lu1RXB2NwgBB/2+RCGBhwSRuUEZ2E3l1z5FS4Jiks3NtZQ1Yi4j
 shChuTefwmYwZW6OQ91DeQaQJ9fT/3i+1mRXw9cQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCqrIu010012
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Mar 2020 07:52:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:52:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:52:53 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCqoED098176;
 Wed, 25 Mar 2020 07:52:50 -0500
Subject: Re: [PATCHv2 05/56] drm/omap: dsi: use MIPI_DSI_FMT_* instead of
 OMAP_DSS_DSI_FMT_*
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-6-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a75efddd-d9e4-9475-fe6b-53e2fcc10d77@ti.com>
Date: Wed, 25 Mar 2020 14:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-6-sebastian.reichel@collabora.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>, "H.
 Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/02/2020 01:20, Sebastian Reichel wrote:
> This replaces OMAP specific enum for pixel format with
> common implementation.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 +-
>   drivers/gpu/drm/omapdrm/dss/dsi.c             | 49 +++++++------------
>   drivers/gpu/drm/omapdrm/dss/omapdss.h         | 10 +---
>   3 files changed, 20 insertions(+), 41 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
