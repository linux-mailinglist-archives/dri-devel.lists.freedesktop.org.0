Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FB8803CC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 18:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083F10FC13;
	Tue, 19 Mar 2024 17:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 17:44:56 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694CA10FC13;
 Tue, 19 Mar 2024 17:44:56 +0000 (UTC)
Message-ID: <7f5308ff-e7d6-4d0b-b940-b7b95a3dd622@dakr.org>
Date: Tue, 19 Mar 2024 18:39:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau/gsp: don't check devinit disable on GSP.
Content-Language: en-US
To: Timothy Maden <terminatorul@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240314014521.2695233-1-airlied@gmail.com>
 <utciie$rai$1@ciao.gmane.io>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <utciie$rai$1@ciao.gmane.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/19/24 18:38, Timothy Maden wrote:
> Hello
> 
> Can this be merged please ?

Applied this to drm-misc-next-fixes a couple of hours ago.

- Danilo

> 
> On 3/14/24 03:45, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> GSP should be handling this and I can see no evidence in opengpu
>> driver that this register should be touched.
>>
>> Fixed acceleration on 2080 Ti GPUs.
>>
>> Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
>> index 666eb93b1742..11b4c9c274a1 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
>> @@ -41,7 +41,6 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
>>       rm->dtor = r535_devinit_dtor;
>>       rm->post = hw->post;
>> -    rm->disable = hw->disable;
>>       ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
>>       if (ret)
> 
> 
