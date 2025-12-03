Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB4C9F118
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE0A10E15E;
	Wed,  3 Dec 2025 13:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ux7GUcRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888EC10E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Yf8ExgbSlMPD7LWUJduOjMd3Sa0XRBlO2q5BwY90/A=; b=Ux7GUcRzbgklhQNdwHPQj0edn4
 gXI0ffUdY7/yrLNvEU4RIBMGtwCu6aI4O/1JMPA3bf3WFAHTF3+z6+Daz7XtUJyHSQJGjIL+s0xdm
 kQs3db6LnH5tm+XB81rBy0aM09bigmOXrw/IFtPS6FStfPdvuxSkhmqxro1by4cACjrobSw7GaORM
 GtKH7M2mOC9jhRHJjFBbStLFLt8O80bdstFJ588V5UiO30AXxsyjE7IxaFRRyVEgz+qHt2kayIVpL
 7fRMPtbndw1T/msSHOkgJBXMIw/JqpBRosdo1PvrdD+japOSL0JVqKJFsrD1+XhkhGM+PwAwoGRMP
 opX+LRgQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQmc2-008Gvd-71; Wed, 03 Dec 2025 14:09:42 +0100
Message-ID: <93ccb928-7c0a-4adc-9374-e115033bb535@igalia.com>
Date: Wed, 3 Dec 2025 13:09:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Some small TTM cleanups
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <fdbab4cb-5011-451b-bec9-f246f3949c76@igalia.com>
 <989105d9-fd72-4a9b-9517-be37d24d2603@igalia.com>
 <f5ea0445-c5b0-44cd-879b-9f1426640d2e@igalia.com>
 <2c660e05-526f-4885-b7d7-4e843655fb3d@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2c660e05-526f-4885-b7d7-4e843655fb3d@amd.com>
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


On 03/12/2025 12:57, Christian König wrote:
> Sorry, I'm mostly on sick leave at the moment (cold/flu).

No rush in this case, series has been waiting from September so it can 
wait a bit longer.

> I couldn't find the original patches, neither in my inbox nor using google.
> 
> Could you send them out once more?

This is the series:

https://lore.kernel.org/dri-devel/20250919131530.91247-1-tvrtko.ursulin@igalia.com/

It still applies but let me know if you would regardless prefer me to 
re-send.

Regards,

Tvrtko

> On 12/3/25 12:34, Tvrtko Ursulin wrote:
>>
>>
>> 3rd ping, and apologies, for some reason I thought Thomas you were listed as maintainer for TTM.
>>
>> Correcting the To: list to Christian and Huang.
>>
>> Again, asking for acks to merge this trivial series.
>>
>> Regards,
>>
>> Tvrtko
>>
>> On 21/11/2025 10:02, Tvrtko Ursulin wrote:
>>>
>>> A gentle ping. Two really trivial cleanups are ready to merge just need maintainer acks.
>>>
>>> On 05/11/2025 15:33, Tvrtko Ursulin wrote:
>>>>
>>>> + Christian & Thomas
>>>>
>>>> On 19/09/2025 14:15, Tvrtko Ursulin wrote:
>>>>> Some small cleanups, nothing intentionally functional. It is mostly about
>>>>> applying some consistency to when to use a local variable to cache something,
>>>>> when not, and making the code use the ones already there.
>>>>>
>>>>> Tvrtko Ursulin (4):
>>>>>     drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx
>>>>>       re-ordering
>>>>>     drm/ttm: Resource cannot be NULL in ttm_resource_intersects
>>>>>     drm/ttm: Tidy ttm_operation_ctx initialization
>>>>>     drm/ttm: Tidy usage of local variables a little bit
>>>>
>>>> I got acks for trivial cleanups patch 1 & 3 from this series. Are you okay if I push the two to drm-misc-next?
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>    drivers/gpu/drm/ttm/ttm_bo.c       | 64 +++++++++++++++---------------
>>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c  | 57 ++++++++++++--------------
>>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
>>>>>    drivers/gpu/drm/ttm/ttm_device.c   |  5 +--
>>>>>    drivers/gpu/drm/ttm/ttm_pool.c     | 26 ++++++------
>>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 14 ++-----
>>>>>    drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
>>>>>    7 files changed, 83 insertions(+), 97 deletions(-)
>>>>>
>>>>
>>>
>>
> 

