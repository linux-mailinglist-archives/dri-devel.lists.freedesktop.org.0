Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F3182995
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 08:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40C06E060;
	Thu, 12 Mar 2020 07:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98006E060
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:13:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C7DBoM010246;
 Thu, 12 Mar 2020 02:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583997191;
 bh=fjYERfZUgQqc0nG8FGAu3JPItUIvc/HLycHoB+1dJS8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MAnsAHWYbQnl4E2RuhyzfPrYoPjmkJH9TNu0ubI5w9NKRTidri1yub5+zuWeLobIX
 iTP0fnFNo6/zLgplDh7cqHidhgLj0RewxcvJKQZLntJz2uvrukxUPIb5Xqk4d0P0HL
 R9cUaOUohdncf6stuJl910WmUtchTJmg0unByiJc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02C7DBFD079960
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Mar 2020 02:13:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 02:13:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 02:13:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C7D6DT060795;
 Thu, 12 Mar 2020 02:13:07 -0500
Subject: Re: [PATCH v6 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Yuti Amonkar
 <yamonkar@cadence.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
 <1582712579-28504-3-git-send-email-yamonkar@cadence.com>
 <20200311222053.GE4863@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ef6a6e31-425f-c402-83ab-886221b4a0c3@ti.com>
Date: Thu, 12 Mar 2020 09:13:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311222053.GE4863@pendragon.ideasonboard.com>
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

On 12/03/2020 00:20, Laurent Pinchart wrote:
>> +	ret = load_firmware(mhdp);
>> +	if (ret)
>> +		goto phy_exit;
>> +
>> +	drm_bridge_add(&mhdp->bridge);
> What if someone starts using the bridge before the firmware is
> operational ? It seems that you should delay bridge registration until
> the firmware is loaded. It may make it possible to remove
> bridge_attached and solve the problem you mention in mhdp_fw_cb().

Handling the fw has been a bit of a pain... This is what we came up with to support all the 
combinations (built-in/module, fw-userspace-helper/direct load, single-output/multiple-outputs).

The idea is that when the driver is loaded and probed (with or without fw), the DP is "ready". If we 
don't have fw yet, everything looks fine, but the connector stays in disconnected state. When we get 
the fw, connector will get connected (only if there's a cable connected, of course).

If we register the bridge only when we have fw, two things can happen:

- If we get the fw only rather late (in case userspace fw helper), a userspace app (e.g. weston) 
could already have been started, and failed due to there being no DRM card.

- If we have two displays from the same display controller, say, DP and HDMI, the HDMI will only be 
available when the DP is available. If the DP fw, for some reason, cannot be loaded, we never get HDMI.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
