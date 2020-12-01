Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FCF2CA09A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26D589E05;
	Tue,  1 Dec 2020 10:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6089E05
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:59:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AxL0s036578;
 Tue, 1 Dec 2020 04:59:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606820361;
 bh=i4cgKS/QFFgGqhHZNPCQGPkZq4i4HGbJdagbl5kQUz4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tNd4/9jnh1F4/div+Bt+uiYiyHGnDt1gq140DI5hQVjvw77oKpg28OZDuowaawKyR
 Rx8Ix5AxSF7Vsl1yp1Mi/lOJ2LxoxqqnsxisYTliu6TfazkwwWcz/bACfkmm1UhXgS
 xj42iB7D4nB03X9D8noWGnKgkR2bYRcpy/IhoM/k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1AxLRg018252
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:59:21 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:59:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:59:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AxJ9W009378;
 Tue, 1 Dec 2020 04:59:19 -0600
Subject: Re: [PATCH v4 61/80] drm/omap: dsi: send nop instead of page & column
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-62-tomi.valkeinen@ti.com>
 <20201130095837.GM4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5ba290be-8b5f-bf67-6f1a-2bcbbd7a7108@ti.com>
Date: Tue, 1 Dec 2020 12:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130095837.GM4141@pendragon.ideasonboard.com>
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
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 11:58, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:19PM +0200, Tomi Valkeinen wrote:
>> The OMAP DSI command mode panel driver used to send page & column
>> address before each frame update, and this code was moved into the DSI
>> host driver when converting it to the DRM bridge model.
>>
>> However, it's not really required to send the page & column address
>> before each frame. It's also something that doesn't really belong to the
>> DSI host driver, so we should drop the code.
>>
>> That said, frame updates break if we don't send _something_ between the
>> frames. A NOP command does the trick.
>>
>> It is not clear if this behavior is as expected from a DSI command mode
>> frame transfer, or is it a feature/issue with OMAP DSI driver, or a
>> feature/issue in the command mode panel used. So this probably needs to
>> be revisited later.
> 
> This is important information, could you capture it in a comment in the
> code ?

I think this is related to the following (from DSI spec):

"To enable PHY synchronization the host processor should  periodically end HS transmission and drive
the Data Lanes to the LP state. This transition should take place at least once per frame"

And in OMAP TRM:

"Special care must be taken in the case of the last line of the frame. The LPS transition is
required when the link is in HS mode for the whole frame."

I'm not 100% sure about that, but I'll change the commit description and add a comment to reflect
the above text.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
