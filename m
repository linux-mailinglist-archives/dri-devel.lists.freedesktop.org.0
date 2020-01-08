Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A215F133CD8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28EF6E85F;
	Wed,  8 Jan 2020 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D746E162
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:36:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0085aCIJ100921;
 Tue, 7 Jan 2020 23:36:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578461772;
 bh=HZPNRJuzdDiBHJDwYy9Z3EAqsCKdw2svb8xwWgVcoNQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xq3DWXnUUHz9GP1rVPMP1Jbe6mLEkncf6PFQTjuYLiiWQ/SZk81Q3BvS9XCwtbruM
 jHh8uHeqJVmIWBJoFSF43jJtuCtI6kCpXjYYkuS4P98sST/gCMzQ/PD7VHeEINhY+t
 Mk+KFY5YUFfB7bk2kPvJV6mvG18YkqQrCAvQYKsU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0085aCvP093219
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jan 2020 23:36:12 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 23:36:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 23:36:11 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0085a8TV003220;
 Tue, 7 Jan 2020 23:36:09 -0600
Subject: Re: [PATCH v3] phy: Add DisplayPort configuration options
To: Jyri Sarha <jsarha@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <maxime@cerno.tech>
References: <1578313360-18124-1-git-send-email-yamonkar@cadence.com>
 <9d849a10-493f-e297-f4c3-b34a341635ed@ti.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <5e3853dd-719b-c6a0-4af0-04967a2c6e3a@ti.com>
Date: Wed, 8 Jan 2020 11:08:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9d849a10-493f-e297-f4c3-b34a341635ed@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: praneeth@ti.com, mparab@cadence.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/01/20 12:22 AM, Jyri Sarha wrote:
> On 06/01/2020 14:22, Yuti Amonkar wrote:
>> Allow DisplayPort PHYs to be configured through the generic
>> functions through a custom structure added to the generic union.
>> The configuration structure is used for reconfiguration of
>> DisplayPort PHYs during link training operation.
>>
>> The parameters added here are the ones defined in the DisplayPort
>> spec v1.4 which include link rate, number of lanes, voltage swing
>> and pre-emphasis.
>>
>> Add the DisplayPort phy mode to the generic phy_mode enum.
>>
>> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> 
> Reviewed-by: Jyri Sarha <jsarha@ti.com>
> 
> Kishon, can you still pick this for v5.6?

Thank you Jyri and Maxime for reviewing this.

Merged it now.

Thanks
Kishon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
