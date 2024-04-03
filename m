Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A08971F3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 16:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D34112379;
	Wed,  3 Apr 2024 14:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cwgXJ9f3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2106.outbound.protection.outlook.com [40.107.93.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EAD112721;
 Wed,  3 Apr 2024 14:06:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C97vu5SS6wiN7ybe9FG+HMO/DytIc19GxTFj0g0Zd4meNVo9F0frlOvlgrxBFaYTOQFsTU1UICh/AB9egB0EsPksRQUaSt/TMblpGxn8ynlRz4VHfKVQMv0om2sg4vxX6IwErZ3Tcy+MxJSlOGkao32bcBu3Ezhywhe+lLQUr/Rjo8PgFfHizKC9H8FyAr6UDRDZfvld8rAIDbnQioY4gpK7fD/thICus8lFscorR3c/IQG7IlwAK3SU3h/uujlwAXFPBiyyDFv6JasPGU5GZYUadTKLHYjSCeKDSFFhkU479k/f8L8aZfJ2XxY7qrSBxDBgfI2GWHGaGHIzkLSIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN8MFStzxPS8poA2VNNL8CZdVRaFHsiQ72cDOySDGJk=;
 b=Ikcljm3/dR8ltH1KwFWMgjf5Od+xSJzjwzT8UIzJtiUzDKG7dlPZlQl3CpzwL8cjoeMvG2OmeO0S4IZzbLN3rnkxYvecmTbnjdWso4goWbpy2TzKV3ZPkC0B3VrvSA6hxYCnuRCZQIUhevrU8YSXM3YUUr0defOwj0pTVop68ed5rUziMXo8fnzWMQdQ5cCK+AYVpLIDxd8qaMCbPV/gO6OQdvtJs92bWIT+EmRp1Wj9ATCnsKJ0eB/10w/VX0h8tHqe1sdQ2Olv3tkuwGVlyXIhdmV9RdHmxJYtpp8Zfb1awWDRh3v1laOfsjXJApxqOSTolbuNrp8kvLc1lQsppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN8MFStzxPS8poA2VNNL8CZdVRaFHsiQ72cDOySDGJk=;
 b=cwgXJ9f3lriqnhBVJrg+CUXAkOlbi/8f7FDR8vr5VU96D28mYyOVaDAxjYR1PZ9YR0TYD1nXED9O2owwjFkJ19yJNwfu2S6cQxNWvJo2aJ3WCRyX4zgbtGD0UWmtTNCBYixD+U8Zay9WN75AF2ofyTp/CdqsGEAITX2z0wFNEX8=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 14:06:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 14:06:16 +0000
Content-Type: multipart/alternative;
 boundary="------------0CSKbNyZnNbNIhqrPoIHCV0t"
Message-ID: <27a15da3-57e8-4c74-81d2-71ad123776e4@amd.com>
Date: Wed, 3 Apr 2024 16:06:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Cross-device and cross-driver HMM support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
 <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
 <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
 <20240403125712.GA1744080@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240403125712.GA1744080@nvidia.com>
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6846:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5xJ1Mh7JmoRX4s9Z1YKOCnRFobbMfh3K0oWQZny8KgTxDqcC96Vl4knXPlRSM4T6cCaxgVyBcTEuqBZSnLJSJRlVF/32NzX7qe33MEZ/FTD8jMLaKarnFXFrgh3UveTE76LIz6UgbsfhhGFtrqjYx4KazuCE8ahH31xZVh2lcYPWk8D6rWBvkoWym/6k67ip26jKcaoSxpI/6IkpFTzlLmyIuLcExSe+jEI+iRA8WCxCfeDtof+zJdlnkpLOwtRwpyl1GpUgvndaSR1K1d8opMv0Q8l4cc1IzSVIUBgchIV/fImX+p74ShUk/+zb1aQEFgEY/rWylDIw9m/8SIh/cspbj2MOQw836wZKvo3IUDaz0+/bViCJJnXInqoPOJtI2LUltRtCEdon+62V/jmaS87m+nb+T7YykpbOwouXkaUAOkeADNCe+uDRZwlLa7MgIdtWeJRAFecCnINakqcJRDNc4T7T/lnBD8AozkQWalFurlimrBWFt7YgDepjXmnmh06LR3UqiTfYvWm2FYU1BEiv9oVqWjybHChMeXiwPxlOa+133CejpNAB/O8mA+RsTChYCJFGcURlOW2gPMHbOT5GFMTAhScbRBy6v2LQRMBWtY36qPxKXrhKJdHl7nA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFQvRXBEOEo1b2VXbzAzZW82ZkkxNW00dWNhZ0dUOG5XWHBKNE11ekZraURH?=
 =?utf-8?B?Sk9KMkxPWXl6dlFqa1RWNXNiajFNUVR6cHJpN1ZLQ3hTWnpGTXVEdzNCNTd3?=
 =?utf-8?B?cCtGQ1B4c2JGeXdHSG4wZFVmR2l0by9sZGxSNVZCSW1uZTMra3MxWFZ4cDRy?=
 =?utf-8?B?OXFHTGlhaHZ5akJXbEJIT1EwUWJMTHhoN1FDT1IwYkp3UE4xajFlbjZnZlZt?=
 =?utf-8?B?NnVCWHhuVWdaSWFEVnlIZ0NHNWMrQjl0d2V2dlNaTUQydmNjc3hRbVZMdTlm?=
 =?utf-8?B?SlFCc2hqQ212M0JKL250KzF5WEl3RlpTL0l2N1czbTBCVHdncjFsbjVHd0Nv?=
 =?utf-8?B?ZG5WaTNJU0IwemgyRFVGU1ZSYXVwWVUyeDFkZ0tBd0ZwZEpqL3pJTFc0UVJj?=
 =?utf-8?B?WmwwNWdPc0xFMGxaeDZyNDh3V2J3eDRWMHR1RXpzYStFKzJLL2xiZEpLclh6?=
 =?utf-8?B?c2YzNm9qa3pHb05jQ0VpbTV5M0ltUWlFcVJWWi9ROGtJNit4MERXR3VNa3dj?=
 =?utf-8?B?aDM2MDk1S3lwWXkyV3cyQlpJZWUzV3A1bmJGV0xSV3hzbGdmU1pOY1dUb1l6?=
 =?utf-8?B?S3llQ1JnR0VRYUxjNUJBcXRqL0JzdEwwWDgvY3hvRHdWSEtzVmYxRC8yZ0Vn?=
 =?utf-8?B?TVoxWUhTL29hTy84SG1VbFdmUlVucW1LWFl3NFhCNXk1Q0Jhc0pYNlVvTUtt?=
 =?utf-8?B?WGFtYXYzd1MzV05LZE03cEVkSDNnZXkreEZsZVpYcTlPTVBFODNPeDR1ZGd0?=
 =?utf-8?B?NTkwMHBrRmUyanVhVE44V1B1bHRPZmhJVDY5MjQ2RFVWNnZaVmJteG9CWDYv?=
 =?utf-8?B?R01XZDhaM09Uclh0WFU1NlloajZneUIwcG5SS2x2SVUySzYxTGpwc083dmZE?=
 =?utf-8?B?UlNuWFpnM1F5bVh2NTFRNDJnYjhqNmlobFFTU0pzdXFNNVAvbHlicHB4QUJz?=
 =?utf-8?B?cXQvdW1aaHh6eUpVazY1TGc5aWJ0YzBvNDBHdXZQV0haMG94dVRINFpoQ0NX?=
 =?utf-8?B?Ri9hZi9UTmxzZDB2UmUrcWZaZ0o0a3JIQlloOUVrU1lIR0E1Q3BnL3FPZkZ6?=
 =?utf-8?B?TmhxTWhHMmRKYm1NMzl1aDZ4dTdBTEEraWtYLzEzMU4wWWw2OXU2SVlIZGo2?=
 =?utf-8?B?NFU2KzZqZU8xTWE3dTUwalA2bEExNmpjQ0xTSjB0NmY5aHFzYlRZVitQL29H?=
 =?utf-8?B?cktoUDg2Q1ViZUZ6cGcwOStNcDlXUlZaK2d0WVNHa0NhTVF4Mmp3bU91RUlS?=
 =?utf-8?B?d3h5cml0ZVNoV3BJd1F1WktiZzZtdTdNUHVkTlNGSnRoV0dzaFJuYnlWTmxT?=
 =?utf-8?B?WUVQTjdjZGFFRzRUM0hNaVNTVXZHSVV6bU1iTVB5MXVpN0ZsQVlzd21JN3ZT?=
 =?utf-8?B?cWhaSlRaVmxvR1dBMFZkOW56MVRQZFdVWWg4bWo1UUNNMkk1VWp3N3BNRWlx?=
 =?utf-8?B?VWthYXltT25iVDNKTTBJVUtkU3RRS1RwZ2dIdFJRT0RKN2k5TnVianNUWFlS?=
 =?utf-8?B?NG84VGllY3VBblJFMlQvLzJ5NkZNcTRSUTNtODd0QVZtYm1aeDd6VmVsSTBs?=
 =?utf-8?B?SHl1anJwcTJkUDZLMEZtc2tRZFdOWVFjMGpEQWFxdDlOOG5XLys2TW05ei9M?=
 =?utf-8?B?d01lWHZ0bDE1QVplY1FUOWsvS1ZLRmU5bkZqcjhBV2FEb1ZUV3VjRkpXYWRZ?=
 =?utf-8?B?SHlxeDRSZk1ScUZMYk4zYVdhTEI4RU1IRFlFdlFPdGszRjRDR2diQjRHQkZw?=
 =?utf-8?B?cEsyL0I2ZGg0bTkwZFNoNWViNFNsdXd1dFdhbVZpRHJwWDlpbmMrNUVXR1RF?=
 =?utf-8?B?dm5ReWlDZFpnRnFmSzFENGYrUXRvcS9VdlVuN1VxWE1QTlpCN2Y3KzA4Mmxh?=
 =?utf-8?B?emxUNnZ3OFZZdk85Y3ZhQU0zaE1PbkUxcW1TNFFSeDlVaTM3VWgvakxhS2U2?=
 =?utf-8?B?S0FqbTQwK3RQZDV6eU0rY05nQXlEY2JNbDRZekxIQ0thcC9tOGZ4VlUwZ0hp?=
 =?utf-8?B?ZmN5ZVpidlI4WCtmVHVET1dtdTNzVDgrRk03bmdZakE5eFlSS1dXMDQvSVZE?=
 =?utf-8?B?UEZRZGhnTENCMXA3UEVZMndOUWF2MEZFdjFoSGJpOXp6QjF4NVlZNWcxSnRv?=
 =?utf-8?Q?3Zxzjcx1itM/CWynLOjAa19Vl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2367978f-80d0-4af5-36b3-08dc53e73a98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:06:16.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtQW1BX/UoHbKmTojdpbr6kULftU4uby5ZmzsUStTky0chNFXgIQNh9oMg2YYkEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
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

--------------0CSKbNyZnNbNIhqrPoIHCV0t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 03.04.24 um 14:57 schrieb Jason Gunthorpe:
> On Wed, Apr 03, 2024 at 11:16:36AM +0200, Christian König wrote:
>> Am 03.04.24 um 00:57 schrieb Dave Airlie:
>>> On Wed, 27 Mar 2024 at 19:52, Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>  wrote:
>>>> Hi!
>>>>
>>>> With our SVM mirror work we'll soon start looking at HMM cross-device
>>>> support. The identified needs are
>>>>
>>>> 1) Instead of migrating foreign device memory to system when the
>>>> current device is faulting, leave it in place...
>>>> 1a) for access using internal interconnect,
>>>> 1b) for access using PCIE p2p (probably mostly as a reference)
>> I still agree with Sima that we won't see P2P based on HMM between devices
>> anytime soon if ever.
> We've got a team working on the subset of this problem where we can
> have a GPU driver install DEVICE_PRIVATE pages and the RDMA driver use
> hmm_range_fault() to take the DEVICE_PRIVATE and return an equivilent
> P2P page for DMA.
>
> We already have a working prototype that is not too bad code wise.

The problem with that isn't the software but the hardware.

At least on the AMD GPUs and Intels Xe accelerators we have seen so far 
page faults are not fast enough to actually work with the semantics the 
Linux kernel uses for struct pages.

That's why for example the SVM implementation really suck with fork(), 
the transparent huge page deamon and NUMA migrations.

Somebody should probably sit down and write a performance measurement 
tool for page faults so that we can start to compare vendors regarding this.

>> E.g. there is no common representation of DMA addresses with address spaces.
>> In other words you need to know the device which does DMA for an address to
>> make sense.
> ? Every device device calls hmm_range_fault() on it's own, to populate
> its own private mirror page table, and gets a P2P page. The device can
> DMA map that P2P for its own use to get a topologically appropriate
> DMA address for its own private page table. The struct page for P2P
> references the pgmap which references the target struct device, the
> DMA API provides the requesting struct device. The infrastructure for
> all this is all there already.

The problem is the DMA API currently has no idea of inter device 
connectors like XGMI.

So it can create P2P mappings for PCIe, but anything which isn't part of 
those interconnects is ignore at the moment as far as I can see.

> There is a seperate discussion about optimizing away the P2P pgmap,
> but for the moment I'm focused on getting things working by relying on
> it.
>
>> Additional to that we don't have a representation for internal connections,
>> e.g. the common kernel has no idea that device A and device B can talk
>> directly to each other, but not with device C.
> We do have this in the PCI P2P framework, it just isn't very complete,
> but it does handle the immediate cases I see people building where we
> have switches and ACS/!ACS paths with different addressing depending
> on topology.

That's not what I meant. I'm talking about direct interconnects which a 
parallel to the PCIe bus.

As far as I know we haven't even started looking into those.

>>>> and we plan to add an infrastructure for this. Probably this can be
>>>> done initially without too much (or any) changes to the hmm code
>>>> itself.
> It is essential any work in this area is not tied to DRM.
> hmm_range_fault() and DEVICE_PRIVATE are generic kernel concepts we
> need to make them work better not build weird DRM side channels.

Completely agree.

>>>> So the question is basically whether anybody is interested in a
>>>> drm-wide solution for this and in that case also whether anybody sees
>>>> the need for cross-driver support?
>> We have use cases for this as well, yes.
> Unfortunately this is a long journey. The immediate next steps are
> Alistair's work to untangle the DAX refcounting mess from ZONE_DEVICE
> pages:
>
> https://lore.kernel.org/linux-mm/87ttlhmj9p.fsf@nvdebian.thelocal/
>
> Leon is working on improving the DMA API and RDMA's ODP to
> be better setup for this:
>
> https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
>
> [Which is also the basis for fixing DMABUF's abuse of the DMA API]
>
> Then it is pretty simple to teach hmm_range_fault() to convert a
> DEVICE_PRIVATE page into a P2P page using a new pgmap op and from
> there the rest already basically exists.

Nice, that's at least one step further than I expected.

> Folks doing non-PCIe topologies will need to teach the P2P layer how
> address translation works on those buses.

Where to start with that?

Christian.

>
> Jason

--------------0CSKbNyZnNbNIhqrPoIHCV0t
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.04.24 um 14:57 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Apr 03, 2024 at 11:16:36AM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 03.04.24 um 00:57 schrieb Dave Airlie:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, 27 Mar 2024 at 19:52, Thomas Hellström
<a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi!

With our SVM mirror work we'll soon start looking at HMM cross-device
support. The identified needs are

1) Instead of migrating foreign device memory to system when the
current device is faulting, leave it in place...
1a) for access using internal interconnect,
1b) for access using PCIE p2p (probably mostly as a reference)
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I still agree with Sima that we won't see P2P based on HMM between devices
anytime soon if ever.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We've got a team working on the subset of this problem where we can
have a GPU driver install DEVICE_PRIVATE pages and the RDMA driver use
hmm_range_fault() to take the DEVICE_PRIVATE and return an equivilent
P2P page for DMA.

We already have a working prototype that is not too bad code wise.</pre>
    </blockquote>
    <br>
    The problem with that isn't the software but the hardware.<br>
    <br>
    At least on the AMD GPUs and Intels Xe accelerators we have seen so
    far page faults are not fast enough to actually work with the
    semantics the Linux kernel uses for struct pages.<br>
    <br>
    That's why for example the SVM implementation really suck with
    fork(), the transparent huge page deamon and NUMA migrations.<br>
    <br>
    Somebody should probably sit down and write a performance
    measurement tool for page faults so that we can start to compare
    vendors regarding this.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">E.g. there is no common representation of DMA addresses with address spaces.
In other words you need to know the device which does DMA for an address to
make sense.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
? Every device device calls hmm_range_fault() on it's own, to populate
its own private mirror page table, and gets a P2P page. The device can
DMA map that P2P for its own use to get a topologically appropriate
DMA address for its own private page table. The struct page for P2P
references the pgmap which references the target struct device, the
DMA API provides the requesting struct device. The infrastructure for
all this is all there already.</pre>
    </blockquote>
    <br>
    The problem is the DMA API currently has no idea of inter device
    connectors like XGMI.<br>
    <br>
    So it can create P2P mappings for PCIe, but anything which isn't
    part of those interconnects is ignore at the moment as far as I can
    see.<br>
    <br>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <pre class="moz-quote-pre" wrap="">There is a seperate discussion about optimizing away the P2P pgmap,
but for the moment I'm focused on getting things working by relying on
it.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Additional to that we don't have a representation for internal connections,
e.g. the common kernel has no idea that device A and device B can talk
directly to each other, but not with device C.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We do have this in the PCI P2P framework, it just isn't very complete,
but it does handle the immediate cases I see people building where we
have switches and ACS/!ACS paths with different addressing depending
on topology.</pre>
    </blockquote>
    <br>
    That's not what I meant. I'm talking about direct interconnects
    which a parallel to the PCIe bus.<br>
    <br>
    As far as I know we haven't even started looking into those.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">and we plan to add an infrastructure for this. Probably this can be
done initially without too much (or any) changes to the hmm code
itself.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is essential any work in this area is not tied to DRM.
hmm_range_fault() and DEVICE_PRIVATE are generic kernel concepts we
need to make them work better not build weird DRM side channels.</pre>
    </blockquote>
    <br>
    Completely agree.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">So the question is basically whether anybody is interested in a
drm-wide solution for this and in that case also whether anybody sees
the need for cross-driver support?
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We have use cases for this as well, yes.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unfortunately this is a long journey. The immediate next steps are
Alistair's work to untangle the DAX refcounting mess from ZONE_DEVICE
pages:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/87ttlhmj9p.fsf@nvdebian.thelocal/">https://lore.kernel.org/linux-mm/87ttlhmj9p.fsf@nvdebian.thelocal/</a>

Leon is working on improving the DMA API and RDMA's ODP to
be better setup for this:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/">https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/</a>

[Which is also the basis for fixing DMABUF's abuse of the DMA API]

Then it is pretty simple to teach hmm_range_fault() to convert a
DEVICE_PRIVATE page into a P2P page using a new pgmap op and from
there the rest already basically exists.</pre>
    </blockquote>
    <br>
    Nice, that's at least one step further than I expected.<br>
    <br>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Folks doing non-PCIe topologies will need to teach the P2P layer how
address translation works on those buses.</pre>
    </blockquote>
    <br>
    Where to start with that?<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20240403125712.GA1744080@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------0CSKbNyZnNbNIhqrPoIHCV0t--
