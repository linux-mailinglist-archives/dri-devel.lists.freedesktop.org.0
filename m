Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22A1A322E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 12:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055096E079;
	Thu,  9 Apr 2020 10:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E4C6E079
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 10:05:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039A57ho057328;
 Thu, 9 Apr 2020 05:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586426707;
 bh=j1GslTHceembFNhT40rMOJP6pLMS4NODDHZOZOkVCV4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LPOJzDJIaY0Q4xl4sWHQmUvTs/JSANyVc525+I96/6K3Q4Ev23vvttckGTDX9+Gt1
 3tvbfDlYRnhUjgW2d+x9mHl8yCJMmR7LqvRlM0iDp/u0KIdHgnAD4rjEHzdHieChIc
 S12PHxmv7F4s2oa03Bbb2Y5CTCozzSoZfKSfG1ms=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 039A57EL108371
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 9 Apr 2020 05:05:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 05:05:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 05:05:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039A547a014611;
 Thu, 9 Apr 2020 05:05:04 -0500
Subject: Re: [PATCH v9 0/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
To: Sam Ravnborg <sam@ravnborg.org>
References: <cover.1580129724.git.jsarha@ti.com>
 <d3931419-aa73-daeb-c8f6-8e29166d586a@ti.com>
 <20200407164426.GB2220@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1aaa420d-a29b-3266-d152-209a87a81ba6@ti.com>
Date: Thu, 9 Apr 2020 13:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407164426.GB2220@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 Jyri Sarha <jsarha@ti.com>, subhajit_paul@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2020 19:44, Sam Ravnborg wrote:
> On Tue, Apr 07, 2020 at 04:18:20PM +0300, Tomi Valkeinen wrote:
>> Hi Jyri,
>>
>> On 27/01/2020 18:00, Jyri Sarha wrote:
>>> This is intended to be the last patch series. I'll apply these trough
>>> drm-misc-next tomorrow.
>>
>> Were these ever merged?
> 
> See 32a1795f57eecc3974901760400618571c9d357f
> ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Ah, sorry, I replied to a wrong thread. I was looking for the patch that adds the DT data to the soc 
dts file... Somehow I thought it's in this series.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
