Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606572D552B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9C6E182;
	Thu, 10 Dec 2020 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7006E182
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 08:17:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BA8HJ3g090088;
 Thu, 10 Dec 2020 02:17:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607588239;
 bh=aq30/Nsk4XW/atnB6va78QseWw7cJP4bpMBbViEyW2Y=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=whAFRW1IfqUovpGNCsxflfJiZdnRCfK3E9oVUZLSN9HH29opk7L4lLcXYkpx+UYvx
 lU+b6x1TltJQZOgjKIGZYQ/uHrU6ojgVxPhByE+4j30/fGpalbWd13li5iHkYWnA1d
 L3WqWTDm0Vg3/hUFy3HxlTP0OZQSMyQx1Vp/Uud4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BA8HJhv053315
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 02:17:19 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 02:17:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 02:17:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BA8HG0F095817;
 Thu, 10 Dec 2020 02:17:17 -0600
Subject: Re: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent
 early
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-30-tomi.valkeinen@ti.com>
 <X8+gXWBwLItZA7gA@pendragon.ideasonboard.com>
 <c5139c54-78c1-fe16-7f50-c60efd1f447b@ti.com>
Message-ID: <64bbe541-53fb-2bd0-0069-c0a28a064a17@ti.com>
Date: Thu, 10 Dec 2020 10:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5139c54-78c1-fe16-7f50-c60efd1f447b@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2020 09:34, Tomi Valkeinen wrote:

> But we don't have anything stopping omap_dsi_host_transfer being called after the whole bridge has
> been detached (or called before attach). So, if we have a guarantee that the panels won't be doing
> dsi transfers before/during bridge attach or after/during bridge detach, we have no issue. If we
> don't have such a guarantee, it's broken.
> 
> I'll try to figure out if there's such a guarantee, but maybe it's safer to add a flag to indicate
> if the bridge is available, and check that during omap_dsi_host_transfer.

I don't think this can happen. I mixed up the bridge attach/detach and the dsi host attach/detach.
The cancel_delayed_work_sync happens in omap_dsi_host_detach, and I think it's a sensible
expectation that the panel won't first do mipi_dsi_detach(), and then try to do DSI transfers.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
