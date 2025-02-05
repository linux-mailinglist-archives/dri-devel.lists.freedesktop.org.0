Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36EA283EB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 06:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EC210E73A;
	Wed,  5 Feb 2025 05:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MYaPiSsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83B10E73A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 05:53:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5155rOGr2539826
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2025 23:53:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738734804;
 bh=L+Es0Z7ExR1BfvlZ8zpT2vGl+Yi893ljUGmHDmA3OqQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=MYaPiSszI6ZiIWmc2IWCuR5Mt7Et2a7+thy8BPTO4tFp26ehmwgmOUFu5ZvZNRFxV
 tfNCjLvWgPEaCRTkYUhYi4KmnG87votnt9tBn8xBn6Qnzp1Jx5Zk97e/Sw8UulvsA+
 4YKLL+5wwD+4+0XWD4f+HWuMntOo4jKy1HzfDnfs=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5155rOV2068555
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Feb 2025 23:53:24 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 23:53:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 23:53:23 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5155rHMa048688;
 Tue, 4 Feb 2025 23:53:17 -0600
Message-ID: <5f122a31-771f-93c9-57fe-bc5766c1fccc@ti.com>
Date: Wed, 5 Feb 2025 11:23:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/tidss: Add support for AM62L display subsystem
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, "jyri.sarha@iki.fi"
 <jyri.sarha@iki.fi>, "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>, "Raghavendra, Vignesh"
 <vigneshr@ti.com>, "Jain, Swamil" <s-jain1@ti.com>, "Donadkar, Rishikesh"
 <r-donadkar@ti.com>, "Choudhary, Jayesh" <j-choudhary@ti.com>, "Shenoy,
 Harikrishna" <h-shenoy@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-3-devarsht@ti.com>
 <eab600f6-bfc2-489c-b384-5b620164a556@linux.dev>
 <dea025e1-98d4-2dcf-e729-19c9d49bf3ae@ti.com>
 <c6179f0b-c93f-483b-bfeb-322d800e5170@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <c6179f0b-c93f-483b-bfeb-322d800e5170@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi

>> Thanks for pointing out, I probably missed this since the use-case still
>> worked since VP interrupts were still enabled and those were sufficient to
>> drive the display
>> but the VID underflow interrupts and VID specific bits were probably not
>> enabled at-all due to above miss, so agreed
>> we should probably go ahead with a different reg space for AM62L due to
>> aforementioned differences.
> 
> I think I disagree here. Afaiu, AM62L has plane at hw index 1 (VIDL1), but the
> plane at hw index 0 (VID1) is not instantiated in the hardware. But the
> registers are the same, i.e. AM62L's registers for VIDL1 match AM65x/AM62x
> registers, right?
> 
> If so, we just need to tell the driver the hw index, instead of creating new
> register offsets as done in v2.
> 
> Or am I missing something here? (I haven't looked at the HW manual yet).
> 

No that's not the only difference. For AM62L, the VID_IRQENABLE/STATUS
registers start at +0x4 as compared to AM65x/AM62x/ :

AM62L:
        [DISPC_VID_IRQENABLE_OFF] =             0x48,

        [DISPC_VID_IRQSTATUS_OFF] =             0x5c,

AM62x/AM65x:

        [DISPC_VID_IRQENABLE_OFF] =             0x44,

        [DISPC_VID_IRQSTATUS_OFF] =             0x58,

So it seems okay to me to have a separate reg offset struct.

Regards
Devarsh
