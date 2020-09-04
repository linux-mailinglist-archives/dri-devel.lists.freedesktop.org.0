Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D425D103
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 07:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567126E237;
	Fri,  4 Sep 2020 05:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96836E237
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 05:53:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0845rjLP115317;
 Fri, 4 Sep 2020 00:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599198825;
 bh=MdmoxK2AeCCqej9xs0bxxv1OBv8ANR9M3r35yVubq2s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KF7I1vpZblhqUvzvqPDfcc5ojQRfe0fri66/dNK0eCxj7EcMxE8xoV0fzh1i0j96z
 1NYjejsCdRJjtexH5w+A+LZoeuu5c1y4eKByCTTmdoIMplTwsHmjgj5/CTzm5Bed3t
 +55tDZ+y+Qxy6jRZlBUWgnoJZAtEBM8w7cZY6D3Y=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0845rjpx089883
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Sep 2020 00:53:45 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Sep
 2020 00:53:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Sep 2020 00:53:44 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0845reXd081865;
 Fri, 4 Sep 2020 00:53:41 -0500
Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
 <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
 <20200904022948.GE9369@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ae3b4dfb-72a7-2734-e104-7fa5b24d81f5@ti.com>
Date: Fri, 4 Sep 2020 08:53:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904022948.GE9369@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, Swapnil Jakhade <sjakhade@cadence.com>, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/09/2020 05:29, Laurent Pinchart wrote:

>> Laurent mentioned that atomic_check should not change state. Note that
>> cdns_mhdp_validate_mode_params also changes state, as it calculates tu_size, vs and line_thresh.
> 
> .atomic_check() isn't allowed to change any global state, which means
> both hardware state and data in cdns_mhdp_device. The drm_bridge_state
> (and thus the cdns_mhdp_bridge_state) can be modified as it stores the
> state for the atomic commit being checked.
> 
>> There seems to be issues with mode changes, but I think the first step would be to clarify the
>> related code a bit. cdns_mhdp_validate_mode_params() is misnamed, I think it should be renamed to
>> calculate_tu or something like that.
>>
>> cdns_mhdp_bandwidth_ok() should take display_fmt or bpp as a parameter, as currently it digs that up
>> from the current state.
>>
>> Probably cdns_mhdp_validate_mode_params() would be better if it doesn't write the result to the
>> state, but returns the values. That way it could also be used to verify if suitable settings can be
>> found, without changing the state.
> 
> This use case is actually a very good example of proper usage of the
> atomic state :-) .atomic_check() has to perform computations to verify
> the atomic commit, and storing the results in the commit's state
> prevents duplicating the same calculation at .atomic_commit() time.

Yes, you're right.

But it's still not good, as cdns_mhdp_validate_mode_params uses link details to do the calculations,
but we do link training only later and thus the calculations are invalid.

cdns_mhdp_validate_mode_params is also called from the HPD interrupt, and there it changes the
current bridge state. link_mutex is being held in every place where cdns_mhdp_validate_mode_params
is called, so I guess it's fine.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
