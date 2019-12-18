Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77B123FDD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 07:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF766E02E;
	Wed, 18 Dec 2019 06:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BA36E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 06:57:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI6v5dH064634;
 Wed, 18 Dec 2019 00:57:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576652225;
 bh=G9290ViBa+lHQNbKvsn8Qfc7Y/Tm7Bo+wSmsxMnE7Mk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ed/sBkIelj8sak/OuIc2qGI9L42ZhCl81fJXZTWgWqa35oEb/iCMpv1BXBZ5J+hI4
 t6+EFkqJxWnwKVZEuS0YJYBFmNGSijvtKd6cCXROiDQINGqO90FZcNgC0FRl2SmfR0
 iR7OJlqZq0YETz6m/PYIMT0jwRaH3m6iJu9sFO+Y=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI6v5ts047827
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2019 00:57:05 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 00:57:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 00:57:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBI6v3Od096567;
 Wed, 18 Dec 2019 00:57:03 -0600
Subject: Re: [PATCH v3 11/50] drm/bridge: Add bridge driver for display
 connectors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
 <61bdedd0-6d88-7e1a-8229-18790439ed9d@iki.fi>
 <20191218014545.GK4874@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <50556a5e-47e7-1659-2dab-bbff238bb8e4@ti.com>
Date: Wed, 18 Dec 2019 08:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218014545.GK4874@pendragon.ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/12/2019 03:45, Laurent Pinchart wrote:

>>> +	dev_info(&pdev->dev,
>>> +		 "Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
>>> +		 drm_get_connector_type_name(conn->bridge.type),
>>> +		 conn->label ? conn->label : "<unlabelled>",
>>> +		 conn->bridge.ddc ? "with" : "without",
>>> +		 conn->hpd_gpio ? "with" : "without",
>>> +		 conn->bridge.ops);
>>
>> On AM5 EVM, we have HDMI output with DDC and HPD, but I get a kernel print:
>>
>> display-connector connector: Found HDMI-A display connector 'hdmi' without DDC bus and without HPD
>> GPIO (ops 0x0)
>>
>> I think that print may be quite confusing for someone who doesn't know the details of the drivers
>> involved.
> 
> I agree, but the information could be useful for developers. Do you
> think it should be dropped ? Or do you have an alternative wording to
> propose ?

I would just go with dev_dbg. I personally don't like to use dev_info unless it's really something a 
normal user needs to see. Otherwise it's just spam for most of the people. If everything is fine, I 
think the driver should be quiet.

Did we discuss this already earlier? =)

That said, even as a dev_dbg it's somewhat confusing. But I can't come up with alternate working... 
Somehow it should indicate that this piece of the display pipeline doesn't handle DDC/HPD, without 
implying that there are no such features.

"unassigned DDC"? I don't know... I'm fine with the print as dev_dbg.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
