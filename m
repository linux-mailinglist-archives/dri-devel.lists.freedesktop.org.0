Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6929E3A7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 08:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2D6E821;
	Thu, 29 Oct 2020 07:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0065E6E821
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 07:14:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09T7Epbg035192;
 Thu, 29 Oct 2020 02:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603955691;
 bh=HgnCnwwSFpx9ZaERcws2hXwYNUp7AeNBWuKgmRBYCtA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=B4bK95Y007tw5aghe4GdtlBnFFx1OzHodMVDc8TlSgK88IwIXZyMnqMH7yUOaEY1R
 f28TRqX81eIQZmkrac+S3VWUHct8/jmtV5omr9RxQnJHfXUggdMwVSbUHDTN9DMFmu
 nAW5anZCqi0Tbr9A0nCpb6IgTZkkDn3ym4eJQUBw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09T7EpSe073957
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Oct 2020 02:14:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 29
 Oct 2020 02:14:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 29 Oct 2020 02:14:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09T7Enbo057460;
 Thu, 29 Oct 2020 02:14:49 -0500
Subject: Re: [PATCH 0/5] drm/tidss: Use new connector model for tidss
To: Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <bce76514-897e-ee9b-e51d-76b40345c49a@ti.com>
 <20201028141942.yuxeqrgu22i7odjw@NiksLab>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <929148a2-9a66-fd26-24d9-d9f4d728974e@ti.com>
Date: Thu, 29 Oct 2020 09:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028141942.yuxeqrgu22i7odjw@NiksLab>
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2020 16:19, Nikhil Devshatwar wrote:

>> Also, with J7 EVM and DP, when I unload the modules I see:
>>
> I confirm the same issue.
> I doubt if it is because of the change I did.
> Will try to revert the patches and confirm again
My guess is that it's not your patches as such, but that the mhdp driver does not do irq related
cleanups properly and your patches bring the issue up.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
