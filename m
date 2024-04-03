Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768289757F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 18:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAB0112D4C;
	Wed,  3 Apr 2024 16:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="enc6td2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B8EB112D4B;
 Wed,  3 Apr 2024 16:44:26 +0000 (UTC)
Received: from [100.64.216.231] (unknown [20.29.225.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id DEC6420E8CB1;
 Wed,  3 Apr 2024 09:44:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEC6420E8CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1712162666;
 bh=JXwsd2AxoIuTbqYYBsm2eaH2T3RMwYhW+EuWf51ajaI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=enc6td2/9wYk/5AJ75GJ+d2KStC4HCCxos5X3NVTZDD2/oIurKS5e5aSfxG20NTAn
 i6QoaGybHsOcc9F8ukHIPO521Uu8BoKDrrjEMr1X1WvCtk0DqcVkd5bYcJVQCFeQeI
 efLmLz3IHfJYxowLOTc8KrIggtvkr42zcNpYJ/Ys=
Message-ID: <2d2a22a5-25cf-4b15-904e-7928a92d6ff5@linux.microsoft.com>
Date: Wed, 3 Apr 2024 09:44:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more
 inclusive
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-2-eahariha@linux.microsoft.com>
 <20240403083025.GT11187@unreal>
 <0214214a-73c4-46b4-a099-189036954aa1@cornelisnetworks.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <0214214a-73c4-46b4-a099-189036954aa1@cornelisnetworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/3/2024 8:54 AM, Dennis Dalessandro wrote:
> 
> On 4/3/24 4:30 AM, Leon Romanovsky wrote:
>> On Fri, Mar 29, 2024 at 05:00:25PM +0000, Easwar Hariharan wrote:
>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>> with more appropriate terms. Inspired by and following on to Wolfram's series
>>> to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
>>> the approved verbiage exists in the specification.
>>>
>>> Compile tested, no functionality changes intended
>>>
>>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> ---
>>>  drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
>>>  drivers/infiniband/hw/hfi1/chip.h           |  2 +-
>>>  drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
>>>  drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
>>>  drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
>>>  drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
>>>  drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
>>>  drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
>>>  drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
>>>  9 files changed, 40 insertions(+), 40 deletions(-)
>>
>> hfi1 and qib work perfectly fine with the current terminology. There is
>> no need to change old code just for the sake of change.
>>
>> Let's drop this patch.
> 
> Agreed.

Will drop in v1.

Thanks,
Easwar
