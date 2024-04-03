Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DE89728B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 16:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD39112B74;
	Wed,  3 Apr 2024 14:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JndjP0Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230C3112B72;
 Wed,  3 Apr 2024 14:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVBO/ywu4J3LfKkM9zYnvfdR81K+rlohb2YjToQvyjROe22vN6fvLgtbgRlDUSjSQdhB0GLATecX0onZPMOwI6dfoEpUiB4Kz1PHWk3rUJYqzPXGT0iqJgtlefGVNpHPydA4cciNCcuUdzY2UD6dE/m8/+5XtferCvIMWSHpcBWxAgHPMU4sbESj+Y5C545uwLPwRMBR0YccfZ2isIYFbnF8IY67LMfb8OrMqQjIYOL9Y0yQvPcG1IBihmF41K1mR9+wwfiYNuadpdlrNgo7qo/s4RECZPalMssKLZhJx7im9qSWGcwmXlHScAHgZBzfoTUQABSbfCXK46j6qP5q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlfLAZIJp09mkpStccyb8rB1wQixxLxcTVybXjAT+sE=;
 b=N/GA0BrnzkHZZ7pSA7NToNwLHgQfJndvLMjEt6k1uqv4CdUQrKRlyUHSqD21BhrJa7QkeQiC+hTlEK3UxD1rV6Pa5joa+SFbJOMyGZUhZDoC1yYEGNOnmaMQpkeiqrkwTRFKZawH5mFVwCBBPTbIFdcU5oT6F4xuFeDDp6CxQZdby5Gc9mOtmyK+3Mbvpcue03NRoWwoQqIn5MuNMlQMLrFjP6S4WYhhpZwNX2quhPn9zrIviHPMwxFf8uCsGu4X7M+Dz9YJ+wojeyTbJxS/bz4TTlyz5SIwcUBisLapHH8dskRKXfzXhZWuspWCudJjPoy3RkBXW+qVe7WcxTQ/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlfLAZIJp09mkpStccyb8rB1wQixxLxcTVybXjAT+sE=;
 b=JndjP0AwytpKQgcZOFqE23xuvo4db96MKieDyRwY5dE2kV0jptesrNuxyNZ7pA+H1JSw6Nsp47XHV9uW3AQRcMjHSmzpCkGbkCtsqfKOsCJF8Ia26p0/hOIYUSGoZpJa8XnLEqwfiCYQ2Tc3HwleIZVcne+aPWzBmqSmxS7qExk=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 14:27:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 14:27:00 +0000
Message-ID: <53f3afba-4759-4ea1-b408-8a929b26280c@amd.com>
Date: Wed, 3 Apr 2024 16:26:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 02/14] drm/amdgpu, drm/radeon: Make I2C terminology more
 inclusive
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
 Alexander Richards <electrodeyt@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Alan Liu <haoping.liu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Lewis Huang <lewis.huang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Jun Lei <jun.lei@amd.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Le Ma <Le.Ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Darren Powell <darren.powell@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
 <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan> <Zg1NW0jqwFn4lvEP@intel.com>
 <87sf02d1zf.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <87sf02d1zf.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0035.eurprd09.prod.outlook.com
 (2603:10a6:802:1::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9038:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKTi7FgZqau3yIko/NzpfJBC9GXNsLV9HkP53TKAVzIViaaMBbZjEyPiCB3SRn0Yc3UWfWD5DyHtfmbnCGSJvP9Dt5Zu8tfiTg0wYzGeggc/crNd9+IVCYGl1d3CjZzqfYPH5XfoUFqDO1QDD6MBUQk+zuN1DCPiceL9DQjpvSRL7pcU8O+zAB0alwZuj++4njSD3KrDnK0GE4m9cSQoTMoCMSF+cZDkYjFAOh2+LjpGTrLVPUnxFR1NF+uNUdZrBqqUovvWUlcL20gPyjeW3kq5yDNUp56JI/BLZsGfXL8NXyB8foBVv9eLeoTVCZ2RcdwoqHIFhRLrdPsoUiR+RYkcvNhKmJYaV0+xJqEXrpUyNl26ZkRSX3uiBvz7ao+qAsXztVtEL7wkJLa/pTs2zL0QKxi2ec4WH8/WW5fzE7WgLhpBwmAG2TUV7ByZlxvNx+CG6bkKC7cGF1RfFpOyGfsU3IDFv7tzJpEzbw1IT5WfGy9MsCtmxNAUtZIQYvGgMUc4AI50nnxoLyci8IEkJs8aVdt02rabLDIpFLLIQccmaJZgbx3HKC8Sdo7R20xaG2n9kW2bwode0t8xemQpT3xVd9Rxi/TS9SDaVQJip6Jb39KaJl3LO4gO4+aWkEEyl71Josr26/ly60Ab2cHD5j+UanvrNfp91C+W01jN/QA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Slc5M2U1cW10REpWVnJrdzlDb2REdG5pV1RudS9oNlZ1TGkvSzNjUFNabkVU?=
 =?utf-8?B?REwvQnpJaVhEdkRRcTk3TUY5SVZWRkhrNERsWnFjeWtiSXpwTUF0d1czVUMw?=
 =?utf-8?B?ZXIyRlp6RDlnZmNqelB0Z0ZkcERzN3RpbGVucmMvdW51Mm5VNTVmTzkyT0Yz?=
 =?utf-8?B?SVdEcWdUK0dQdnV4YmVtVDFreUtkbGZMVTlpc2orSEptcGsvY2QxeTFqMHVW?=
 =?utf-8?B?dkNIMDZyZ2pOVzN5RUNCeElyNVlOMXNWTkQvWWYrSzVKczhXYmUrck1VeUpj?=
 =?utf-8?B?c2ZhUVpDOFkraWgwUnEvWSsxUnBEVGFhRnR2OGt6UmZxSWpQZmNNWFRPVndV?=
 =?utf-8?B?Uk90S2p4MHZZcHFMZ2lxT0ZtMUhSTkYxQlgvY1ZGODFkVjZHU2djL2h3YnZM?=
 =?utf-8?B?WTdibGJUU2pKcHVZWi91bDNUS2pwR1BBS3ZtMWl4MmpTOU1JTVN3SHVBS3F2?=
 =?utf-8?B?R1JNZEtQZHVRVXhIeWF5V1FxODhoRmJIa2hsaEhxaVpDYnNSMEp3TFFZVTBY?=
 =?utf-8?B?amFLU2F1eWtsMTdvYW5ITmpzT0Q4NVhoNlJyS2VaQjJsSXhxS2JySXVNMDRK?=
 =?utf-8?B?cmo5ei9RTkJKMWJqcjd6Z21na3FSRHNYT3FaVkxtWWNYU3VBVDBTMXp3NXJi?=
 =?utf-8?B?UEorYU5GSVBqV011THB5MkVMUnhVUGx5a3cva0J4ZTRsMStQZ0svVGN6SWJU?=
 =?utf-8?B?TnlVelFrcHcwYjcwQXUxOW5rL2VQRjh5RkJ0dUhEL3Y2TjZkZ09GaWJzbHJI?=
 =?utf-8?B?L2E4dUxBSk84d2NTSmdoQkdQVjNVUFJtTXlJYlpXSXBLZXU4VHdLTE5lejk0?=
 =?utf-8?B?OHAyMG9pU0orT2djclFSeFBsZkNaM0ZyMVFzRDE5K0tldEl1Zm1PbmUrY0Zu?=
 =?utf-8?B?WUYwdXpEajE1V2VDNHNqOENXSGRWcnBzQ3ExK0c5VlFHOHJMTkJ5czZYWEpv?=
 =?utf-8?B?aytwbE8yUHhSMlhXYisrakVhTy9aMVhtOWRSZ2QyaUJkQzNiR09vZjFEWkxN?=
 =?utf-8?B?cjMvbHNJTEV2MjYwY3ByMFJ1eU03dU9RN2Nqdy9VcTJZT29DTnc3ZUtldFNP?=
 =?utf-8?B?cDdleWN1Yis1a0xJQlVwU0pNK1JsWERvUGdYcEEzNjJPeUhTQU1wUEdlT2hG?=
 =?utf-8?B?aC9nUCtVMmdtd0xSV3BkRmg5RTQzRXoyTXZnRFdackpZd0tkR1dyQnI0UXRI?=
 =?utf-8?B?UFQzVldHRE5SMzJTZVJnYXA5amxVM1J6R3pETFVqRjVsWncwL2dBb3J1M3BO?=
 =?utf-8?B?YWpjaEovQWN0eWgwUnZxdmpiNkt4K1o4YXNYUVhSSFFTZGlJVncxb293eUZV?=
 =?utf-8?B?U1FJUGFkR2g3Z3FsV0hsT1BtOEtEQW5kNG1XcDZ6S1plOFArSFplSDdvekl2?=
 =?utf-8?B?a1JERzl6Z1hCWWVWeVF6WlRDcjBLQ1lFeTdFczFkb3ArUWN6dzdqUjVQWS9l?=
 =?utf-8?B?V1JvZWRUNkRjMFlkV0Z3dGtKeUQvWkZjK093azhLNTVnQk96anNxaUt5Y0VE?=
 =?utf-8?B?TzN5UWNDZ3M4b2FadHFDQVdaenRUVVp4MXZocjVNbmJNZ1plTnc4MmhQK0pS?=
 =?utf-8?B?OURFT3VvNFFBbTM3ZytaYWpqTEozaXlrd0t5UVlPOGRCR0lRQ1NQcGtlb1p5?=
 =?utf-8?B?dTZCNno0RTFWbHFydW85VlhMNVh2NllNSHQ4bloybWxpNDdoNXJSVmJNdmFz?=
 =?utf-8?B?ZUlHb2U0UUlkTVZwaWd0MXRqTUFhcHBicUZCYW9sSUlTaHhCNEp6ZXhBVFBp?=
 =?utf-8?B?dHBxZ1ZEUTN0UUZwTGxEdjZnUkFoTWNlNEJuSVladzVJNHdjdjl4SWdLR1hD?=
 =?utf-8?B?OHlTcm96cExseUhYd05WOU15cEhyRXQwdEUrUGdzdk44US9LL2hHYTdyY0tZ?=
 =?utf-8?B?Ym1qeGVJK1g0RnNCa1U3VFd3bXg3Uzl5eCtldkc1dU5KL2JrTXh4dUdmaStt?=
 =?utf-8?B?M25BR1h6c1dKYVZ1TjNJZVRsRktUcUhxRlo3WjRSZXk5c3VyYW1FVmVLOVFU?=
 =?utf-8?B?R1ArblFFeVczVTB5d254elY0UWdiRXNxeTRhYi9CMkhSeUZaNVM1TmxCM0ds?=
 =?utf-8?B?NjNhSnQzVVNGTi9kN1NBd1pBZjErSmhlRzhYZDJrODlIYnlBVnY2NVl4QlZY?=
 =?utf-8?Q?zvyY05yUsYD69l1J7CU+Myylz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6756c8b5-902d-488c-db44-08dc53ea1f98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:26:59.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rreBfafSxtVurBuIAA4q31122OzlMWG7bk2mmpgKWjuEjKR33b0iRxLPB+UY9o9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
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

Am 03.04.24 um 15:12 schrieb Jani Nikula:
> On Wed, 03 Apr 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Fri, Mar 29, 2024 at 06:38:10PM +0100, Andi Shyti wrote:
>>> Hi,
>>>
>>> On Fri, Mar 29, 2024 at 10:28:14AM -0700, Easwar Hariharan wrote:
>>>> On 3/29/2024 10:16 AM, Andi Shyti wrote:
>>>>> Hi Easwar,
>>>>>
>>>>> On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
>>>>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>>>> I don't understand why we forget that i3c is 1.1.1 :-)
>>>> That's because it's a copy-paste error from Wolfram's cover letter. :) I'll update
>>>> next go-around.
>>> not a binding comment, though. Just for completeness, because we
>>> are giving the version to the i2c and smbus, but not i3c.
>>>
>>>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>>>> in the specification.
>>>>> The specification talks about:
>>>>>
>>>>>   - master -> controller
>>>>>   - slave -> target (and not client)
>>>>>
>>>>> But both you and Wolfram have used client. I'd like to reach
>>>>> some more consistency here.
>>>> I had the impression that remote targets (i.e external to the device) were to be called clients,
>>>> e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
>>>> I chose the terminology according to that understanding, but now I can't find where I got that
>>>> information.
>>> The word "client" does not even appear in the documentation (only
>>> one instance in the i3c document), so that the change is not
>>> related to the document as stated in the commit log. Unless, of
>>> course, I am missing something.
>>>
>>> I'm OK with choosing a "customized" naming, but we need to reach
>>> an agreement.
>>>
>>> I raised the same question to Wolfram.
>> I don't know where that discussion happened, but my opinion
>> is NAK to "client". Life is already confusing enough with
>> these renames, so let's not make it even more confusing by
>> inventing new names nowhere to be found in the spec.
>>
>> And let's especially not invent names that don't even fit
>> the purpose. "Client" makes me think of "client/server" or
>> some real world analogy. Neither of which seem to have any
>> resemblence to how the term would be used for i2c.
> Agreed.
>
> I2C 7.0, I3C 1.1.1, and SMBus 3.2 have all switched to controller/target
> terminology. The SMBus spec has additionally converted generic host
> references to controller.
>
> At least for i915 where I have some say in the matter, controller/target
> it shall be.

+1 for using the same vocabulary in amdgpu as in the specifications.

My personal opinion is that master/slave was actually a pretty good 
description of the relationship.

The "slave" or rather target of the communication is forced into 
operation, can't speak back and potentially won't get any payment for 
the serving.

If we remove the word slave from our vocabulary society will just sooner 
or later start to forget the meaning, and that is probably not a good thing.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>

