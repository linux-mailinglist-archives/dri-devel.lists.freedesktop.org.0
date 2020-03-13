Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A700184826
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 14:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8B96E193;
	Fri, 13 Mar 2020 13:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102036E193
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:30:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DDUHsr019041;
 Fri, 13 Mar 2020 08:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584106217;
 bh=vDfj8jJB5hSYkSYm7c1MlJRkqhABlBFGQzvMo0VwcDY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HdRKnh3BZkT50CjZMARtVRZswTFW77pyzmc7cQtmMrxYixd2pf9SDUVXina6qHclK
 Mfd5yEK926eyYWyOjSfhLZLAafx03FZFtkjZzzAxKbHAhLzDuAezw0HlJCtUfBsdVO
 sbZT6JhMCUABv6vIxFPLrUckJ2vkTLVlx/LsaZEk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DDUHrR059228;
 Fri, 13 Mar 2020 08:30:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 08:30:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 08:30:17 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DDUF6U087889;
 Fri, 13 Mar 2020 08:30:16 -0500
Subject: Re: [PATCH] omapfb: Remove unused writeback code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313122410.7528-1-tomi.valkeinen@ti.com>
 <20200313132244.GB4751@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <249364fc-bc83-6fe6-d3bf-f709505c299e@ti.com>
Date: Fri, 13 Mar 2020 15:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313132244.GB4751@pendragon.ideasonboard.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2020 15:22, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 02:24:10PM +0200, Tomi Valkeinen wrote:
>> Remove unused writeback code. This code will never be used, as omapfb is
>> being deprecated.
> 
> I'm fine with that, but out of curiosity, is there any particular reason
> to remove that code now instead of letting omapfb bitrot slowly ?

It conflicts with tidss's writeback code in TI kernel, when compiling tidss and omapfb into the 
kernel. I thought this is the easiest way to resolve that, as all the removed code is dead code, 
instead of trying to invent new names in tidss for a lot of functions.

Probably the functions in tidss still could use some renaming in the future, but I didn't want to be 
forced to do that because of omapfb's dead code...

So, not a super good reason, but on the other hand, removing dead code is always a good thing.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
