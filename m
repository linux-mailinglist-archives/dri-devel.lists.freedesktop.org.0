Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BD97A2FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF7110E330;
	Mon, 16 Sep 2024 13:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="bx1igH/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 991 seconds by postgrey-1.36 at gabe;
 Mon, 16 Sep 2024 13:35:10 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56D10E330
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:35:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48GDHj68034329;
 Mon, 16 Sep 2024 08:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1726492665;
 bh=fopSDGdPLqn2TJrk+i+f5DpYXQwN1AJ1daawf2krZlU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=bx1igH/mAVw4z932uzNDuWd7aUmtXqNEAJK6D2ULfdfRJq06w+QcvWz0OBXDM9ma6
 RnA3ODJ/iZVYIF5xICF1b6BrfYByFxCQXvoP7sZ0ooWoLC1v24o86c7rMM5fx+xmDe
 P1IoebG8HnLmf+KvEuko8Onj+nCV4myDRlfvq+FE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48GDHjnJ111991
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Sep 2024 08:17:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Sep 2024 08:17:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Sep 2024 08:17:45 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48GDHaHH055734;
 Mon, 16 Sep 2024 08:17:37 -0500
Message-ID: <e5ea93f7-b21b-8a8e-bc74-f4d81fa27b8d@ti.com>
Date: Mon, 16 Sep 2024 18:47:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <r-ravikumar@ti.com>, <j-choudhary@ti.com>,
 <grandmaster@al2klimov.de>, <caihuoqing@baidu.com>,
 <ahalaney@redhat.com>, <cai.huoqing@linux.dev>,
 <colin.i.king@gmail.com>, <javierm@redhat.com>,
 <dmitry.baryshkov@linaro.org>, <geert+renesas@glider.be>,
 <dakr@redhat.com>, <u.kleine-koenig@pengutronix.de>, <robh@kernel.org>,
 <sam@ravnborg.org>, <simona.vetter@ffwll.ch>,
 <ville.syrjala@linux.intel.com>, <wangxiaojun11@huawei.com>,
 <yuanjilin@cdjrlc.com>, <yuehaibing@huawei.com>
References: <20240912171142.3241719-1-devarsht@ti.com>
 <20240913082428.GD25276@pendragon.ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240913082428.GD25276@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the quick review.

On 13/09/24 13:54, Laurent Pinchart wrote:
> Hi Devarsh,
> 
> On Thu, Sep 12, 2024 at 10:41:42PM +0530, Devarsh Thakkar wrote:
>> Modify license to include dual licensing as GPL-2.0-only OR MIT license for
>> tidss display driver. This allows other operating system ecosystems such as
>> Zephyr and also the commercial firmwares to refer and derive code from this
> 
> GPL-2.0 isn't incompatible with "commercial". I think you mean
> "proprietary" here.
> 

Yes, GPL-2.0 is not incompatible to commercial but there is an enforecement
that derivative code needs to be GPL-2.0 licensed which may not fit well for
projects which are not using GPL-2.0 license. But yes MIT will also help
proprietary code, so I agree it is good to mention the same in commit message.

>> display driver in a more permissive manner.
> 
> How do you envision that to work ? Zephyr doesn't have KMS, so you can't
> use the driver as-is. What exactly would TI want to use from the Linux
> kernel driver ?
> 

Not the DRM/KMS part, but the tidss specific display controller programming is
the main point of interest. For e.g. At this point, mostly I see that the TI
customers are interested to re-use/derive code from u-boot tidss driver [1]
which is quite simple and use it in their test application or RTOS based
offerring which is non-GPL code. Since their test application has much more
code apart from the display part, which is non-GPL, they can't use GPL license.

Now since the u-boot tidss driver is derived from kernel tidss driver, my
understanding was that we need to change the license of kernel tidss driver
first before changing the u-boot tidss driver.

> Personally, there's a reason why I contribute code to the kernel under
> the GPL-2.0 license, it is to make sure the code will remain open. While
> I can accept other licenses on a case-by-case basis, I don't like the
> casual approach of this patch that seem (to me) to imply that the
> license is a mere detail. For a start I would like to know what
> "commercial firmwares" you're thinking about.
> 

Understood, let me know if above information suffice or any further
information is needed.

[1]:
https://gitlab.com/u-boot/u-boot/-/blob/master/drivers/video/tidss/tidss_drv.c?ref_type=heads

Regards
Devarsh
