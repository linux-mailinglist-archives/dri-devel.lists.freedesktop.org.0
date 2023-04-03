Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70846D514A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE21210E0FF;
	Mon,  3 Apr 2023 19:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D216410E05D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 19:26:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 333JQ1Hh008439;
 Mon, 3 Apr 2023 14:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1680549961;
 bh=5oEyZu8GE/HGdsLPhERnzE8sdoUvCe3xOmJfok707c4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Wcca+o1xhnZqCO+UMcR/rcUHyXONeng76wBQ2ALkFR+ybSLAdVu0CaqIOeFXEbWqb
 QeW9ud1j7hTbYZbnqVIKoy+aX+qgiRrvybenOwLXU9HtPBJdWwVvck8GsoJ+yB8hte
 hFSIm1ExvjyTOIn0IeUrhqUujmwcY3KEc6ind/6M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 333JQ1h9076224
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Apr 2023 14:26:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 3
 Apr 2023 14:26:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 3 Apr 2023 14:26:00 -0500
Received: from [10.250.33.131] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 333JQ0SJ031547;
 Mon, 3 Apr 2023 14:26:00 -0500
Message-ID: <99f1da4f-810e-986d-388a-af136ade745e@ti.com>
Date: Mon, 3 Apr 2023 14:26:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
Content-Language: en-US
To: Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20200424222740.16259-1-afd@ti.com>
 <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
 <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
 <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/23 3:35 AM, Christian Gmeiner wrote:
> Hi Andrew
> 
>>
>>
>> Okay, will split for v2.
>>
>>
> 
> Was there a follow-up v2 of this patchset? AFAICT this series did not
> make it into the mainline kernel.
> Do you have any plans to work on it? If not I would like to help out
> as we have a use case where we want to
> use a dma-buf sram exporter.
> 
> 

Sure, I've been keeping it alive in our evil vendor tree, but if
there is interest upstream now I'll post a v2 and CC you.

Thanks,
Andrew
