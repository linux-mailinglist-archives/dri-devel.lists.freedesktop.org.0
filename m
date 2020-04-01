Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A919AB55
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 14:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4896D6E088;
	Wed,  1 Apr 2020 12:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5F6E088
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 12:09:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031C9P8a091776;
 Wed, 1 Apr 2020 07:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585742965;
 bh=5IaTEDrQgJjdu/7yF0s5OsEdojoFFxCD6wr2zUPxmbo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=K8iDVkcP72xHpSYe/uDdwDm5ZXgsOu1gOzn3PcdLALA0EwRtbuDL+KSSYr5WuzuYe
 1xCUL3gCNSuXIQ1rrW6vtuIKdhwU5mcBVNPCPW87bHLTkOvs3P2LjkWw6BHfykSfHl
 3V3KCzsShc253JQLykbFgbk3C4aoeYw1u5GoQWi0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031C9PhF104321;
 Wed, 1 Apr 2020 07:09:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 07:09:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 07:09:25 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031C9M50101834;
 Wed, 1 Apr 2020 07:09:23 -0500
Subject: Re: [PATCHv2 18/56] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3
 defines
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-19-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2ce834ec-6025-24c9-2045-9949562bf828@ti.com>
Date: Wed, 1 Apr 2020 15:09:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-19-sebastian.reichel@collabora.com>
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
> Drop local definition of common MIPI DCS 1.3 defines.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>   drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
