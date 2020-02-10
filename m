Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF62157166
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D1B89915;
	Mon, 10 Feb 2020 09:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61489915
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:05:06 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01A954rj101333;
 Mon, 10 Feb 2020 03:05:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581325504;
 bh=XWUFr4OBNGvkW+HWPbcJjeMgzXZBpSuW9JHDJvvkFkk=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=If4HkNwbfg/VrE90bFoYDgTUNOXUcRurxv0Jg3BoStdHbPoIO+Rtly/gNSResn63C
 yzFt3xpd8xCLA4bwbGr6sKf8yU0NfZkPZwyIC/c4cPGOPd+w+aN4Ebzto1vGT7OS8q
 6GQWNq0sQmCb0Idg5Z4NpkeHO7vTwHqvASGph1c4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01A953r6053296
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 03:05:03 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 03:05:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 03:05:02 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01A951DH055515;
 Mon, 10 Feb 2020 03:05:01 -0600
Subject: Re: [PATCH v2] drm/bridge: tfp410: add pclk limits
To: Andrzej Hajda <a.hajda@samsung.com>, <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200121094655.9092-1-tomi.valkeinen@ti.com>
 <CGME20200210082202eucas1p25526395f284a3518d6486faefd9361cc@eucas1p2.samsung.com>
 <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
 <58e2b0d6-0e18-d2e0-d139-835d22b3a364@samsung.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1868bed7-b493-303a-084e-1f52520e7a04@ti.com>
Date: Mon, 10 Feb 2020 11:05:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <58e2b0d6-0e18-d2e0-d139-835d22b3a364@samsung.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2020 10:49, Andrzej Hajda wrote:

>> Is this ok to merge?
> 
> 
> Yes, If I remember you have merge rights. If not, let me know.

Yes, I have.

Generally speaking, how do you manage bridge patches? If you give reviewed-by/acked-by, does it mean 
it's good for the sender to push to drm-misc-next? Or do you usually merge bridge patches yourself?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
