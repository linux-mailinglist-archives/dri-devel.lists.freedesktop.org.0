Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019118D712D
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 18:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CAF10E1A3;
	Sat,  1 Jun 2024 16:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sIS3bpZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FB310E1A3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:42:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 451GffZ8036681;
 Sat, 1 Jun 2024 11:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717260101;
 bh=+ocxchH9u2Icz4prOAtSV5xvLRJJKRxfx+7US0r/Pik=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=sIS3bpZwCELHxccweU6x52eq+2O1Ue4QnQ+3wx6sWd9Ph/5SBvnFK0mTKgHaGJndb
 vKZsUkZ3Oe7to6ThCH6xsu0xc89qM9QE8q7nFH1EGG/+3PLTYE1IabyCy1d1zv0tG/
 +1848s9cQKrZRfDRz9FDEJPR6fOi8gD/x+EeypAc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 451GffhU069778
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jun 2024 11:41:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 1
 Jun 2024 11:41:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 1 Jun 2024 11:41:40 -0500
Received: from [10.249.130.181] ([10.249.130.181])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 451GfTpn129505;
 Sat, 1 Jun 2024 11:41:30 -0500
Message-ID: <1d35fe9f-79f3-4d64-81d6-97a63b333bfc@ti.com>
Date: Sat, 1 Jun 2024 22:11:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and
 functions
To: Randy Dunlap <rdunlap@infradead.org>, <mchehab@kernel.org>,
 <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
 <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
 <broonie@kernel.org>, <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
 <davidgow@google.com>, <dlatypov@google.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171220.1295881-1-devarsht@ti.com>
 <c14215bd-96ff-4aec-83c4-e25375f6fe88@infradead.org>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <c14215bd-96ff-4aec-83c4-e25375f6fe88@infradead.org>
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

On 01/06/24 00:01, Randy Dunlap wrote:
> Hi,
> 
> On 5/31/24 10:12 AM, Devarsh Thakkar wrote:
>> Add documentation for rounding, scaling, absolute value and difference,
>> 32-bit division related macros and functions exported by math.h header
>> file.
>>
> 
> I don't see any kernel-doc for division functions in this header file.
> 
> Do some division functions get rendered somehow?
> 

Good catch. I see couple of them having adequate documentation just
missing the sphynx syntax, will enable for DIV_ROUND_CLOSEST and
DIV_ROUND_CLOSEST_ULL.

Regards
Devarsh
