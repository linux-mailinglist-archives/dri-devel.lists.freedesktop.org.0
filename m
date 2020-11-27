Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BD2C666E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5DD6ECE6;
	Fri, 27 Nov 2020 13:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3C06EB8C;
 Fri, 27 Nov 2020 13:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxPXklWvSyhcfRtbqDFeXVxXoitci/oe8qUXRNDLJRS7d8Jlf6wsr+zNXp3cHAUgqykLGVHedt60fN4q78uqhQ9RW4RNPjYNwHMBjFPh1gjBcUxQjTxUiMaBSkveMw0kfvUCNqExyL8pNQGwm8OiDrXZ2oBRF+L4ctPA8M9ubisiKsYEWcq49GcoCKds27K9SUFUzJTQmeCKuSS0gTUjW0v/JkJSwuU5Vpo/oUrGLtT5c3G9g1a2TqSD5nogIoKKyARFgeWJ1rqFbRZ1CB/jjuagiXc7UeK6EmUnrOOuAo4Fe6gl7S/9U/tff2ApZRaxUOZUftplDaWwPck7D0o7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6kL2qhYhDYnntR3Ej6FMT5ryXkHhxlNuhADaf4JILg=;
 b=alOd4R6PT/Ehb9rcwUHYOdO4dCdvzlfxJdhZvUsW71TgxaFIYgja3pmb9KY/0Pg3AhWftU1Ib9waHn/lD4zupsc+ddlxXIaNvatluyovBcP7/++UDxyBI4UEth62DdJOAk5DNBWJfIarRw5P0jCD/kkXLtfXCFvMLCWa6hlV+hc8NqbiEIOzZfuDoRbhFzMuDsZV43su2wsikYanr3DZV1eQgBPmskr290FFqChXj3J37/kEObP3D7soMCW7JkL4yrEotMxxH+ZmfYL8EcQKIJBy6q/3R8/34J/BMbLappT+mHosMEApAP/dWS/zq1CsRmUCiC30h+vwxlFgRLuMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6kL2qhYhDYnntR3Ej6FMT5ryXkHhxlNuhADaf4JILg=;
 b=x1r5UscZzGLsdHOZSTbgnkxY9gwzka8O4lQosic3vN2a7qOFUGzf7I/LQ+U9YymgKyquHNLlvLQYAVfcGNh+iGzK7oXac8f/Qs/LqnYW2WpPZlXvNd+vm1o2sjjuq5+HYIAV51P2wIABR88pqyIbT2LdrhENBk/xrgu/BRynYyQ=
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.22; Fri, 27 Nov 2020 13:10:19 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 13:10:19 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Thread-Topic: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Thread-Index: AQHWv8Y7VDQsR3ZTHUC1s4OEGkqsDqnYr8uA//14koCAAAQfAP//sU2AgABUwoD//7PJAAAgkxgAABIww4AAAMG3gAAllkeAAATLtQAAB6MugAAGOt8AAFcf2N4=
Date: Fri, 27 Nov 2020 13:10:18 +0000
Message-ID: <DM6PR12MB434093420E04623E01ED1EB4EAF80@DM6PR12MB4340.namprd12.prod.outlook.com>
References: <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
 <20201125163621.GZ401619@phenom.ffwll.local>,
 <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
In-Reply-To: <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:3edf:49b0:3ca0:d57:1062:a8e9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aab9e64e-6732-4e58-91cf-08d892d5ca2c
x-ms-traffictypediagnostic: DM6PR12MB4578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB457896109D115BD3DE2C0736EAF80@DM6PR12MB4578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ktH1Y5oHF53W0gzLYMYo+RvwM7Ru5xSaX4NJrDv8+4SqFKqudbslQt/peVs8dT1sYwVGgp3UrXP5xzvqZX4LwxiTnLSpvNSaQ+qnILrw3GDkcHGla7vDamPAyvom6WmYHzJ40ASzteu048zYVMiPMqke/073Ov/KAUWIQ8Dyc8Myh/I+Olyr8JWmbERi4LAYWKcKnxE1Pk13G0dUVPuxwAPby9SIin3WLoonGUhfyGJxGzcdwdjEO+G/MGZVXgjWplBQmkGFMJeVimgHLy621SKs6iGIfzvLymOhQ927kF/ckbZN6tMO0tWTEBT/M5x0xnhbtSX+sfECfi+hZq+LUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(110136005)(86362001)(33656002)(66574015)(9686003)(478600001)(71200400001)(5660300002)(7416002)(4326008)(54906003)(55016002)(7696005)(8676002)(2906002)(8936002)(52536014)(83380400001)(186003)(66446008)(91956017)(76116006)(53546011)(6506007)(316002)(66556008)(66946007)(66476007)(64756008)(6636002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?XGkIjHAIKq+q7WBYRWqiXUKNsgDJ1KBFSIA4IF8AW4vsDmyQghgtE4qNTV?=
 =?iso-8859-1?Q?ZGEz3lADTNsd7jYlaD100hsvmSMnvs+ZS5Uq4NBAuW/KiV8ukv49iPdi6S?=
 =?iso-8859-1?Q?9fdcCkw5KiQkDzf8kzn3f9+hNtwKs/9pSL2gt2wLc6IZWIRh6kVBL4jIfy?=
 =?iso-8859-1?Q?ift74JHSeWmDRQYRnA9Og8hxkYfJGlhreyb0Y+pY4cQ8viQ/tANaSgL0Ze?=
 =?iso-8859-1?Q?BwvgEiBZYCys/6mKDPNp/UBcwMr0Flowy7sd77+ab7CGjQeUr+um63GpY1?=
 =?iso-8859-1?Q?dN/JEturT/u2NsVP8maX4znDOLmxZxUxJ3j/sjPgSGucOaf0VWHWqqhHUX?=
 =?iso-8859-1?Q?rIUemgcGwZDNNtOTJ0Xp+hOqTN1lp/foZDyv4C4Ay/tk0kPafsZzjVmkFm?=
 =?iso-8859-1?Q?SDkxzxq2AAOMiWmieznaEjiE5a8JJvR2dDHYSCjJybuYhwzZQZitxnXOnw?=
 =?iso-8859-1?Q?hiPHoFa2vFmX/hPM83+7iI2HN0gTG1JqWBEtt4+02+DiBwR4y42CjS6TyU?=
 =?iso-8859-1?Q?vh7cvgvwLnWefg8Gjwz7VznbbkiD/Fy4C16/020AD88swvZUSBdI+JwpQr?=
 =?iso-8859-1?Q?axTKAEw30+ImUgha/xc41qzfCRO72GR0QtZhlxQSKD0xSf1jK5w2bp0VAF?=
 =?iso-8859-1?Q?DuP2tEMQ6FkhtE+J0RgQYYrXrX+r/+/ZctEJSeF1ooAYNOCxTl6wgk4UTb?=
 =?iso-8859-1?Q?qoixgrqjUt9f9tmNlBhPnV5WuU9D07qZ8rUjsb9fboDBHVMprmPq09mh5f?=
 =?iso-8859-1?Q?kLwH2VQmWWO8VfHC1IleChjV/sD3eFLBG+isuP6G4IktTu1NUoYW9ll5rs?=
 =?iso-8859-1?Q?Tl4xHf78Og3sHYBt7E44blCQyDw0zBb/t0gPtqe01oyo2ShQLHpeqQtyDl?=
 =?iso-8859-1?Q?eNDXiwtEwoLgazk/Ntt5/+1MmgXU7ZVUH3No1pPBDg0hNgis7YcprQHA3F?=
 =?iso-8859-1?Q?A3IPLlx4o8KChY5dSXd9PEx70TIeHZeDD1xW7QLKfRuVjQRACcAXu7xiS6?=
 =?iso-8859-1?Q?5YQDv4G38uMSYKYrkM82oAlJHHgiUf0lGhQ5oeS3VGTHLK5hDwjWw2ob1c?=
 =?iso-8859-1?Q?I2qrcek1Cw0P/EnnTO1EZcA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab9e64e-6732-4e58-91cf-08d892d5ca2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 13:10:18.8681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r74+aW3CUJwOI7pbPvTbHdBRFXbjrtsHqNXf7So0acr4k2fjuOnUVC9BwsunY+30cH3wXHh0dE92b0BA8pznsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Type: multipart/mixed; boundary="===============1763502626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1763502626==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB434093420E04623E01ED1EB4EAF80DM6PR12MB4340namp_"

--_000_DM6PR12MB434093420E04623E01ED1EB4EAF80DM6PR12MB4340namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey Daniel, just a ping on a bunch of questions i posted bellow.

Andtey
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: 25 November 2020 14:34
To: Daniel Vetter <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@am=
d.com>
Cc: robh@kernel.org <robh@kernel.org>; daniel.vetter@ffwll.ch <daniel.vette=
r@ffwll.ch>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.o=
rg>; eric@anholt.net <eric@anholt.net>; ppaalanen@gmail.com <ppaalanen@gmai=
l.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; greg=
kh@linuxfoundation.org <gregkh@linuxfoundation.org>; Deucher, Alexander <Al=
exander.Deucher@amd.com>; l.stach@pengutronix.de <l.stach@pengutronix.de>; =
Wentland, Harry <Harry.Wentland@amd.com>; yuq825@gmail.com <yuq825@gmail.co=
m>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver =
use


On 11/25/20 11:36 AM, Daniel Vetter wrote:
> On Wed, Nov 25, 2020 at 01:57:40PM +0100, Christian K=F6nig wrote:
>> Am 25.11.20 um 11:40 schrieb Daniel Vetter:
>>> On Tue, Nov 24, 2020 at 05:44:07PM +0100, Christian K=F6nig wrote:
>>>> Am 24.11.20 um 17:22 schrieb Andrey Grodzovsky:
>>>>> On 11/24/20 2:41 AM, Christian K=F6nig wrote:
>>>>>> Am 23.11.20 um 22:08 schrieb Andrey Grodzovsky:
>>>>>>> On 11/23/20 3:41 PM, Christian K=F6nig wrote:
>>>>>>>> Am 23.11.20 um 21:38 schrieb Andrey Grodzovsky:
>>>>>>>>> On 11/23/20 3:20 PM, Christian K=F6nig wrote:
>>>>>>>>>> Am 23.11.20 um 21:05 schrieb Andrey Grodzovsky:
>>>>>>>>>>> On 11/25/20 5:42 AM, Christian K=F6nig wrote:
>>>>>>>>>>>> Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>> It's needed to drop iommu backed pages on device unplug
>>>>>>>>>>>>> before device's IOMMU group is released.
>>>>>>>>>>>> It would be cleaner if we could do the whole
>>>>>>>>>>>> handling in TTM. I also need to double check
>>>>>>>>>>>> what you are doing with this function.
>>>>>>>>>>>>
>>>>>>>>>>>> Christian.
>>>>>>>>>>> Check patch "drm/amdgpu: Register IOMMU topology
>>>>>>>>>>> notifier per device." to see
>>>>>>>>>>> how i use it. I don't see why this should go
>>>>>>>>>>> into TTM mid-layer - the stuff I do inside
>>>>>>>>>>> is vendor specific and also I don't think TTM is
>>>>>>>>>>> explicitly aware of IOMMU ?
>>>>>>>>>>> Do you mean you prefer the IOMMU notifier to be
>>>>>>>>>>> registered from within TTM
>>>>>>>>>>> and then use a hook to call into vendor specific handler ?
>>>>>>>>>> No, that is really vendor specific.
>>>>>>>>>>
>>>>>>>>>> What I meant is to have a function like
>>>>>>>>>> ttm_resource_manager_evict_all() which you only need
>>>>>>>>>> to call and all tt objects are unpopulated.
>>>>>>>>> So instead of this BO list i create and later iterate in
>>>>>>>>> amdgpu from the IOMMU patch you just want to do it
>>>>>>>>> within
>>>>>>>>> TTM with a single function ? Makes much more sense.
>>>>>>>> Yes, exactly.
>>>>>>>>
>>>>>>>> The list_empty() checks we have in TTM for the LRU are
>>>>>>>> actually not the best idea, we should now check the
>>>>>>>> pin_count instead. This way we could also have a list of the
>>>>>>>> pinned BOs in TTM.
>>>>>>> So from my IOMMU topology handler I will iterate the TTM LRU for
>>>>>>> the unpinned BOs and this new function for the pinned ones  ?
>>>>>>> It's probably a good idea to combine both iterations into this
>>>>>>> new function to cover all the BOs allocated on the device.
>>>>>> Yes, that's what I had in my mind as well.
>>>>>>
>>>>>>>> BTW: Have you thought about what happens when we unpopulate
>>>>>>>> a BO while we still try to use a kernel mapping for it? That
>>>>>>>> could have unforeseen consequences.
>>>>>>> Are you asking what happens to kmap or vmap style mapped CPU
>>>>>>> accesses once we drop all the DMA backing pages for a particular
>>>>>>> BO ? Because for user mappings
>>>>>>> (mmap) we took care of this with dummy page reroute but indeed
>>>>>>> nothing was done for in kernel CPU mappings.
>>>>>> Yes exactly that.
>>>>>>
>>>>>> In other words what happens if we free the ring buffer while the
>>>>>> kernel still writes to it?
>>>>>>
>>>>>> Christian.
>>>>> While we can't control user application accesses to the mapped buffer=
s
>>>>> explicitly and hence we use page fault rerouting
>>>>> I am thinking that in this  case we may be able to sprinkle
>>>>> drm_dev_enter/exit in any such sensitive place were we might
>>>>> CPU access a DMA buffer from the kernel ?
>>>> Yes, I fear we are going to need that.
>>> Uh ... problem is that dma_buf_vmap are usually permanent things. Maybe=
 we
>>> could stuff this into begin/end_cpu_access


Do you mean guarding with drm_dev_enter/exit in dma_buf_ops.begin/end_cpu_a=
ccess
driver specific hook ?


>>> (but only for the kernel, so a
>>> bit tricky)?


Why only kernel ? Why is it a problem to do it if it comes from dma_buf_ioc=
tl by
some user process ? And  if we do need this distinction I think we should b=
e able to
differentiate by looking at current->mm (i.e. mm_struct) pointer being NULL=
 for
kernel thread.


>> Oh very very good point! I haven't thought about DMA-buf mmaps in this
>> context yet.
>>
>>
>>> btw the other issue with dma-buf (and even worse with dma_fence) is
>>> refcounting of the underlying drm_device. I'd expect that all your
>>> callbacks go boom if the dma_buf outlives your drm_device. That part is=
n't
>>> yet solved in your series here.
>> Well thinking more about this, it seems to be a another really good argu=
ment
>> why mapping pages from DMA-bufs into application address space directly =
is a
>> very bad idea :)
>>
>> But yes, we essentially can't remove the device as long as there is a
>> DMA-buf with mappings. No idea how to clean that one up.
> drm_dev_get/put in drm_prime helpers should get us like 90% there I think=
.


What are the other 10% ?


>
> The even more worrying thing is random dma_fence attached to the dma_resv
> object. We could try to clean all of ours up, but they could have escaped
> already into some other driver. And since we're talking about egpu
> hotunplug, dma_fence escaping to the igpu is a pretty reasonable use-case=
.
>
> I have no how to fix that one :-/
> -Daniel


I assume you are referring to sync_file_create/sync_file_get_fence API  for
dma_fence export/import ?
So with DMA bufs we have the drm_gem_object as exporter specific private da=
ta
and so we can do drm_dev_get and put at the drm_gem_object layer to bind de=
vice
life cycle
to that of each GEM object but, we don't have such mid-layer for dma_fence =
which
could allow
us to increment device reference for each fence out there related to that d=
evice
- is my understanding correct ?

Andrey


Andrey


>> Christian.
>>
>>> -Daniel
>>>
>>>>> Things like CPU page table updates, ring buffer accesses and FW memcp=
y ?
>>>>> Is there other places ?
>>>> Puh, good question. I have no idea.
>>>>
>>>>> Another point is that at this point the driver shouldn't access any s=
uch
>>>>> buffers as we are at the process finishing the device.
>>>>> AFAIK there is no page fault mechanism for kernel mappings so I don't
>>>>> think there is anything else to do ?
>>>> Well there is a page fault handler for kernel mappings, but that one j=
ust
>>>> prints the stack trace into the system log and calls BUG(); :)
>>>>
>>>> Long story short we need to avoid any access to released pages after u=
nplug.
>>>> No matter if it's from the kernel or userspace.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Andrey

--_000_DM6PR12MB434093420E04623E01ED1EB4EAF80DM6PR12MB4340namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Hey Daniel, just a ping on a bunch of questions i posted bellow.</div>
<div><br>
</div>
<div>Andtey</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> 25 November 2020 14:34<br>
<b>To:</b> Daniel Vetter &lt;daniel@ffwll.ch&gt;; Koenig, Christian &lt;Chr=
istian.Koenig@amd.com&gt;<br>
<b>Cc:</b> robh@kernel.org &lt;robh@kernel.org&gt;; daniel.vetter@ffwll.ch =
&lt;daniel.vetter@ffwll.ch&gt;; dri-devel@lists.freedesktop.org &lt;dri-dev=
el@lists.freedesktop.org&gt;; eric@anholt.net &lt;eric@anholt.net&gt;; ppaa=
lanen@gmail.com &lt;ppaalanen@gmail.com&gt;; amd-gfx@lists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; gregkh@linuxfoundation.org &lt;greg=
kh@linuxfoundation.org&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.co=
m&gt;; l.stach@pengutronix.de &lt;l.stach@pengutronix.de&gt;; Wentland, Har=
ry &lt;Harry.Wentland@amd.com&gt;; yuq825@gmail.com &lt;yuq825@gmail.com&gt=
;<br>
<b>Subject:</b> Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for =
driver use</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
On 11/25/20 11:36 AM, Daniel Vetter wrote:<br>
&gt; On Wed, Nov 25, 2020 at 01:57:40PM +0100, Christian K=F6nig wrote:<br>
&gt;&gt; Am 25.11.20 um 11:40 schrieb Daniel Vetter:<br>
&gt;&gt;&gt; On Tue, Nov 24, 2020 at 05:44:07PM +0100, Christian K=F6nig wr=
ote:<br>
&gt;&gt;&gt;&gt; Am 24.11.20 um 17:22 schrieb Andrey Grodzovsky:<br>
&gt;&gt;&gt;&gt;&gt; On 11/24/20 2:41 AM, Christian K=F6nig wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Am 23.11.20 um 22:08 schrieb Andrey Grodzovsky:<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/23/20 3:41 PM, Christian K=F6nig wrote:<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 23.11.20 um 21:38 schrieb Andrey Grodzo=
vsky:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/23/20 3:20 PM, Christian K=F6nig=
 wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 23.11.20 um 21:05 schrieb Andre=
y Grodzovsky:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/25/20 5:42 AM, Christian=
 K=F6nig wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 21.11.20 um 06:21 schri=
eb Andrey Grodzovsky:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It's needed to drop io=
mmu backed pages on device unplug<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; before device's IOMMU =
group is released.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; It would be cleaner if we =
could do the whole<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; handling in TTM. I also ne=
ed to double check<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; what you are doing with th=
is function.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Check patch &quot;drm/amdgpu: =
Register IOMMU topology<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; notifier per device.&quot; to =
see<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; how i use it. I don't see why =
this should go<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; into TTM mid-layer - the stuff=
 I do inside<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; is vendor specific and also I =
don't think TTM is<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; explicitly aware of IOMMU ?<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Do you mean you prefer the IOM=
MU notifier to be<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; registered from within TTM<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and then use a hook to call in=
to vendor specific handler ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; No, that is really vendor specific=
.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; What I meant is to have a function=
 like<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ttm_resource_manager_evict_all() w=
hich you only need<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to call and all tt objects are unp=
opulated.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; So instead of this BO list i create an=
d later iterate in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; amdgpu from the IOMMU patch you just w=
ant to do it<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; within<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; TTM with a single function ? Makes muc=
h more sense.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Yes, exactly.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The list_empty() checks we have in TTM for=
 the LRU are<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; actually not the best idea, we should now =
check the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pin_count instead. This way we could also =
have a list of the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; pinned BOs in TTM.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; So from my IOMMU topology handler I will itera=
te the TTM LRU for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the unpinned BOs and this new function for the=
 pinned ones&nbsp; ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; It's probably a good idea to combine both iter=
ations into this<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; new function to cover all the BOs allocated on=
 the device.<br>
&gt;&gt;&gt;&gt;&gt;&gt; Yes, that's what I had in my mind as well.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; BTW: Have you thought about what happens w=
hen we unpopulate<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a BO while we still try to use a kernel ma=
pping for it? That<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; could have unforeseen consequences.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Are you asking what happens to kmap or vmap st=
yle mapped CPU<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; accesses once we drop all the DMA backing page=
s for a particular<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; BO ? Because for user mappings<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; (mmap) we took care of this with dummy page re=
route but indeed<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; nothing was done for in kernel CPU mappings.<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt; Yes exactly that.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; In other words what happens if we free the ring bu=
ffer while the<br>
&gt;&gt;&gt;&gt;&gt;&gt; kernel still writes to it?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;&gt; While we can't control user application accesses to th=
e mapped buffers<br>
&gt;&gt;&gt;&gt;&gt; explicitly and hence we use page fault rerouting<br>
&gt;&gt;&gt;&gt;&gt; I am thinking that in this&nbsp; case we may be able t=
o sprinkle<br>
&gt;&gt;&gt;&gt;&gt; drm_dev_enter/exit in any such sensitive place were we=
 might<br>
&gt;&gt;&gt;&gt;&gt; CPU access a DMA buffer from the kernel ?<br>
&gt;&gt;&gt;&gt; Yes, I fear we are going to need that.<br>
&gt;&gt;&gt; Uh ... problem is that dma_buf_vmap are usually permanent thin=
gs. Maybe we<br>
&gt;&gt;&gt; could stuff this into begin/end_cpu_access<br>
<br>
<br>
Do you mean guarding with drm_dev_enter/exit in dma_buf_ops.begin/end_cpu_a=
ccess<br>
driver specific hook ?<br>
<br>
<br>
&gt;&gt;&gt; (but only for the kernel, so a<br>
&gt;&gt;&gt; bit tricky)?<br>
<br>
<br>
Why only kernel ? Why is it a problem to do it if it comes from dma_buf_ioc=
tl by<br>
some user process ? And&nbsp; if we do need this distinction I think we sho=
uld be able to<br>
differentiate by looking at current-&gt;mm (i.e. mm_struct) pointer being N=
ULL for <br>
kernel thread.<br>
<br>
<br>
&gt;&gt; Oh very very good point! I haven't thought about DMA-buf mmaps in =
this<br>
&gt;&gt; context yet.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; btw the other issue with dma-buf (and even worse with dma_fenc=
e) is<br>
&gt;&gt;&gt; refcounting of the underlying drm_device. I'd expect that all =
your<br>
&gt;&gt;&gt; callbacks go boom if the dma_buf outlives your drm_device. Tha=
t part isn't<br>
&gt;&gt;&gt; yet solved in your series here.<br>
&gt;&gt; Well thinking more about this, it seems to be a another really goo=
d argument<br>
&gt;&gt; why mapping pages from DMA-bufs into application address space dir=
ectly is a<br>
&gt;&gt; very bad idea :)<br>
&gt;&gt;<br>
&gt;&gt; But yes, we essentially can't remove the device as long as there i=
s a<br>
&gt;&gt; DMA-buf with mappings. No idea how to clean that one up.<br>
&gt; drm_dev_get/put in drm_prime helpers should get us like 90% there I th=
ink.<br>
<br>
<br>
What are the other 10% ?<br>
<br>
<br>
&gt;<br>
&gt; The even more worrying thing is random dma_fence attached to the dma_r=
esv<br>
&gt; object. We could try to clean all of ours up, but they could have esca=
ped<br>
&gt; already into some other driver. And since we're talking about egpu<br>
&gt; hotunplug, dma_fence escaping to the igpu is a pretty reasonable use-c=
ase.<br>
&gt;<br>
&gt; I have no how to fix that one :-/<br>
&gt; -Daniel<br>
<br>
<br>
I assume you are referring to sync_file_create/sync_file_get_fence API&nbsp=
; for <br>
dma_fence export/import ?<br>
So with DMA bufs we have the drm_gem_object as exporter specific private da=
ta<br>
and so we can do drm_dev_get and put at the drm_gem_object layer to bind de=
vice <br>
life cycle<br>
to that of each GEM object but, we don't have such mid-layer for dma_fence =
which <br>
could allow<br>
us to increment device reference for each fence out there related to that d=
evice <br>
- is my understanding correct ?<br>
<br>
Andrey<br>
<br>
<br>
Andrey<br>
<br>
<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; -Daniel<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Things like CPU page table updates, ring buffer access=
es and FW memcpy ?<br>
&gt;&gt;&gt;&gt;&gt; Is there other places ?<br>
&gt;&gt;&gt;&gt; Puh, good question. I have no idea.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Another point is that at this point the driver shouldn=
't access any such<br>
&gt;&gt;&gt;&gt;&gt; buffers as we are at the process finishing the device.=
<br>
&gt;&gt;&gt;&gt;&gt; AFAIK there is no page fault mechanism for kernel mapp=
ings so I don't<br>
&gt;&gt;&gt;&gt;&gt; think there is anything else to do ?<br>
&gt;&gt;&gt;&gt; Well there is a page fault handler for kernel mappings, bu=
t that one just<br>
&gt;&gt;&gt;&gt; prints the stack trace into the system log and calls BUG()=
; :)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Long story short we need to avoid any access to released p=
ages after unplug.<br>
&gt;&gt;&gt;&gt; No matter if it's from the kernel or userspace.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Andrey<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB434093420E04623E01ED1EB4EAF80DM6PR12MB4340namp_--

--===============1763502626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1763502626==--
