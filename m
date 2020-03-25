Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44F1928C4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268846E84C;
	Wed, 25 Mar 2020 12:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B526E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 12:45:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCjh2W070540;
 Wed, 25 Mar 2020 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585140343;
 bh=if4d1y4GKLvhULNEro3+6D9TleTCzoavVv9fFj14sV8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cc5sm5q5JNxskJHNNAcFsgvWs4oReWRaTF/gX7vHQK1CJbI+wOXIdd41jZdnLwSCE
 kRkF/FGwV8BWPVd+qK6rNmeYn6v1Bm5aODSW7PMS/jVTTCY2FrCwYaZNVQPX/u9fJC
 w06Q0wmamPCArEAQoKD3+u0OBSmt0z7bfrj7kHMQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCjhNh061214
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Mar 2020 07:45:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:45:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:45:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCjcwr009138;
 Wed, 25 Mar 2020 07:45:39 -0500
Subject: Re: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-5-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <00049146-9e70-8345-4691-eb2e9aa9f02a@ti.com>
Date: Wed, 25 Mar 2020 14:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-5-sebastian.reichel@collabora.com>
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
> The panel-dsi-cm's ddata->pin_config is always NULL, so this
> callback is never called. Instead the DSI encoder gets the pin
> configuration directly from DT.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
>   drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
>   drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
>   3 files changed, 14 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
