Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0E18296B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 08:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BA789DEC;
	Thu, 12 Mar 2020 07:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2946D89DEC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:01:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C71TsD089814;
 Thu, 12 Mar 2020 02:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583996489;
 bh=2DcFuiREd1lLevtuAMxfcFQw8QwTShJd4BPuKAz9Lh0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nL4Hv1FKZs/YfiOt8XmC7MZAc+wkXNl8hk7ZXvwXvsGxmXagJd6RhnIu//VFvqN4M
 zftKyV63MeMCsh91IERuLv4S2K+/wPJlsq6ZXITZIB0qzzSHFSnsuIRHtgEs7NYw3n
 vvdkDBs130WKzqh06H8UE7NWKw1RWwvdWqsHprw4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C71TPB017366;
 Thu, 12 Mar 2020 02:01:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 02:01:28 -0500
Received: from localhost.localdomain (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 02:01:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02C71O9n084767;
 Thu, 12 Mar 2020 02:01:24 -0500
Subject: Re: [PATCH v6 3/3] drm: bridge: cdns-mhdp: add j721e wrapper
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Yuti Amonkar
 <yamonkar@cadence.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
 <1582712579-28504-4-git-send-email-yamonkar@cadence.com>
 <20200311205217.GD4863@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0e9b73b7-a960-e2a1-d8a1-f12309755176@ti.com>
Date: Thu, 12 Mar 2020 09:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311205217.GD4863@pendragon.ideasonboard.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 jsarha@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, maxime@cerno.tech,
 sjakhade@cadence.com, mparab@cadence.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 11/03/2020 22:52, Laurent Pinchart wrote:

>> +void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
>> +{
>> +	/*
>> +	 * Eneble VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected
>> +	 * to eDP DPI2. This is the only supported SST configuration on
>> +	 * J721E.
> 
> Without hardware documentation I can't really comment on this, but I'd
> like to make sure it doesn't imply that the MHDP has more than one input
> and one output.

You can download the TRM for j721e here:

http://www.ti.com/lit/pdf/spruil1

MHDP has one DP output, but 4 inputs to support MST and split/dual panel modes. None of those are 
supported by the drivers, but perhaps some thought should be paid to figure out if adding these 
features affect the DT bindings.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
