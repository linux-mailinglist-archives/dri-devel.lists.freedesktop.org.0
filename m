Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A8412AB7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 03:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966F6E8C4;
	Tue, 21 Sep 2021 01:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EFA6E8C3;
 Tue, 21 Sep 2021 01:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgO4e+nE+cqGkKZZ+oLEuvXwGR8rwvKY9qHMZFeTKWtl5Wy+cRekKanXN0qltqGkXW4czCnJkXEYvISv1aTFbhTi8BGmuThWAqwre05nNcRk7SlxBLXjjLxPtq4CPvWvEtHmxk5O/efyIadH63/p2aveZ5QIqaEsI4j32CU5TlpToxQ7/VW4dCbzRyxHLrHOBxXG4Ul6sED3pqIhnAOuue1BaYO97q8rrKH5b9aISQzYB1fDyuac4isDuPIqErgnX0tcNCRmA5kVngPRP26IK1UpVH8PWFrdRu9BetSLFWj6DGNfP+52zmn7EBrKjgrbtxnzMfrxIeFZUlF/pqb/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4HVkuQCm/1t0VC0mxa2sawdk7lU1eXCisp53UaLljg4=;
 b=k1gcraCQK9XAvRiKJ/pYclWofrDVs+pILas/H6n44N5tY+ZEzATUwsGLIrj6rupUx0iTa61TjW8oLApvj4sbiJoRuyxML45sUEWvqTPZqBWYi2vLCW3ImTJH0TTSLn6JalnawRq6hFI4XQAAgiIDsjYmkw+AXoH32t+z8HFzaqSs9cmhEWwNYolQP417JPWDSlh2Uq1EXMm05IuQ68gcVejE8Q2OU3kIHLBeECTolkHHv/s6LUrSU8GGJ43mi86ifeAnTxvBdgasxNB91WmCss09bVd5E0OLchza/lv2hRQPpb1osDXXMOB/xZHhf56Do+U4Qll+myrvBqVSOByoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HVkuQCm/1t0VC0mxa2sawdk7lU1eXCisp53UaLljg4=;
 b=N/cDkN8J8LUdwGjVclfsu8G7qnwGdcM88C73tojFrh9RgFYbrsRPGTXHGvvFooHHm69iV63D1k7814/XGptoXPoNfeHbrLqmuoctgwc05sd2at8y9xq9PrzWGFfqZRwJfel+WNW/QmkffcEpyalVYb0ZSeBKeMTcI19AEhCnIWY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 01:55:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 01:55:41 +0000
Message-ID: <1f6d40c0-274e-2f86-f474-cccd9109adde@amd.com>
Date: Mon, 20 Sep 2021 21:55:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, sebastian@sebastianwick.net
Cc: Brian Starkey <brian.starkey@arm.com>,
 "Sharma, Shashank" <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mcasas@google.com, jshargo@google.com,
 Deepak.Sharma@amd.com, Shirish.S@amd.com, Vitaly.Prosyak@amd.com,
 aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com, nd@arm.com,
 uma.shankar@intel.com
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
 <20210816111029.74cisnhblllindcv@000377403353>
 <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
 <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
 <20210915173653.1e81418a@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210915173653.1e81418a@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::38) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:1::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 01:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 119c1611-3244-45f6-f5b7-08d97ca2ea2f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5425:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB542561380E3652F5CCF55CB08CA19@CO6PR12MB5425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uX6iUmPL2ufS9Q+n+Ksem+XDVCdvNDhtQdqF9n7LZb1Gbgku3rWNmt6eik9pESEDGWThR2AcIXtI47JtIiVA4WgY/Iry5ReYeKCRCal3O2+rSDMMSC206ynq+2dSIbgHVKM0/GKwf9l6XZ9kGt4mDlo4yGeRxPlO3WA7HpX5nLN1hxxGZxJvNzCaZzZuzDyM5laRI81cwLar+ahlxYIuuhrHLvbCWzHAW5Ezb4HtDg/IWpBo2mKxmhvRuMvzNG4NNk2z8dL9gWP1RmDvDdfe37iSXUjdAvVDse4soGRl6jn+GwnjQBv2USxXD2/90nKU2rmqubyNUGEsJeqSqrXpHD1l8Q4oizRGTSBJjvh3zbqFk5ELAyQdhOzmg5WqZ2KlfPOD8mo0hY4Koi3b6Es9Xoc3CbypJFznAHO+XFQ68TJfoXbtgpoh0wXSr7O63rIU1mWyizhOCt9UNXb90JsioYubCkB1BfJA+CY+75DEqs/qHnCIJ0AT5lw0a9idzEq8m9wT5+BrdKd/fcPMm3ko7EQQl9mkxtikF0zH5/SnG7Tlbrt9DDZZ696DlIUSqERqrSMwyJ+g+1deSAfr/LKzuNxzKwnjJCn/o1/tmow8JoREOUJECe2TA/Qy2+Sq6qUxPzumSlVooIvW1e2qQfv/BP0agBZ2+wn218t5WQTYJf9yO3n/D4H5s3zy1CG0/Nw3U18ftZIdkUeXEFv8Jb4ei2DtdOdW0mWU8cLtBtHKwtp76vB+tPJeW0yHeyxIfLy8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(26005)(86362001)(38100700002)(66476007)(6486002)(83380400001)(66556008)(66946007)(31686004)(36756003)(7416002)(966005)(16576012)(31696002)(8936002)(508600001)(53546011)(316002)(956004)(5660300002)(2616005)(8676002)(2906002)(54906003)(186003)(44832011)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW05c3IxYmt3anUrbTZuMzRRc0FVM3I1d20rSUpPY2wweGlkakdPTE13eWN2?=
 =?utf-8?B?NXpqVk1HcnFQNWE5U2FiUEZqVFI0STRwRVBDSzRVRDVpeHRUc0p2VUdQdjl4?=
 =?utf-8?B?SUVpcmdUNE8xVmh6YWtYWDAyMlVLUU5MTTJBL045YXVNTjZlTkRRcHlDMzVw?=
 =?utf-8?B?R1MrUTN0d0dML3pBRHNnalNmME1kbjdzeEkvWXNSdFJpTnlkdFJ2V1VkYzhw?=
 =?utf-8?B?UlZXb3FRbnVtd3cyTDlxVk9BV2FFeEV6cng4V1hXc3YrMzRRYXpRamlqSXMy?=
 =?utf-8?B?U0ZwR1JRd056ME16Wlc0RFkzMmV6cXBhSXcxWG1UTEJ3TkI3YnFON2ZGeXMz?=
 =?utf-8?B?S0d0Y0IwZEUwclpwQTVMQzBSWEtVQk00RitncXBVWngyMlpwNjRNcEgzWFdx?=
 =?utf-8?B?bEk5eVdrdmhNRW04SHM3WnIwTXErSW9XZ3dXdDVESEdBd2J0S0d0dHNZVEts?=
 =?utf-8?B?aXhnMUJuOU5PYlM1TGJ3VmtQbk9Xa1VYSDNrRGh2VDc4bnQzM3VJbTE4Y3hl?=
 =?utf-8?B?anpPWTVYUnBoV0puQWJWVlBPWVZoUHFrTE5yN0hvQ2dJeVZxT3E1K2d3bmVZ?=
 =?utf-8?B?R2hKTjVEMHB4OUFuOGFtTW03Q0JpTC9QbkNqR3JxSFdwdk1wTDduWnE4eFcy?=
 =?utf-8?B?SnhCZ0ZyZ1RPTVA0eWY2anFxQ0pKK2JBR1g3b3hYNDRROFA2QXY0SlhySm9v?=
 =?utf-8?B?S0JJVUNpUW1jRVNXSXgzaVllc2hiK1JUdWZwOGcvaHE2ZmJYL3NOQ2tGaWxI?=
 =?utf-8?B?QzBtZ3RlN3ZHZWRtek8yNnJNVHF2VzZYaXNqQURkSXd6MGU0WmUyb2lVcDNo?=
 =?utf-8?B?MU54TVROU2tOTHZCU1FQUGZVTm5CSUltMDBlL3NOeXZObVlOVSs0SnU4UjhN?=
 =?utf-8?B?VTREK3lPb1F5eWtCc01LZkZyV0Y0V3RMSnpJSjBleFpSOFJ5dHQ0NGdqc0Z1?=
 =?utf-8?B?eVBrS3NkRUlFdExmSUN5RElRUGwxeFlzUDdWZEU2a2RZS3ZZYXJNLzR3Qnpv?=
 =?utf-8?B?OGxzTktBRElGYWx2dDBmYklWc21vOWFIUC9VNEpvTi9hOFM4bWkxYkhuTVUx?=
 =?utf-8?B?dVMvUnFTR2U2YWYzNTRuYWFqSTlzay9HQnBwK3BQTDhhYkdhREd2b29CWDJ2?=
 =?utf-8?B?QStxblhXSTdlOEg2V0M3SW1vUEdVT1puZ0dXSjhZSC9OSkp3RjByL0RvU2wz?=
 =?utf-8?B?ZjBZT1FHT1k2RlM1ZTc1U3hhVW1RU2tWUWp1LzRBLy9ZNGRZSGsvcGR3d0NS?=
 =?utf-8?B?NVVGekJ5Rk1ZdHNrcGliMHdXR1g0SGlnNUZPd0VabjAyckMzN04zQWJQdE5s?=
 =?utf-8?B?UERjNUwvdGdvV0Ntd3NVWWUzU2JYN1c0SEtwWi9veHBGU3hkb0tGVEZsOXpa?=
 =?utf-8?B?MkpZSnVuVFJtYitBekdySWVOUGNTZHVhSkoySUhwMFV2Q3ZLL25rc2xyUVJn?=
 =?utf-8?B?VHpGOEEzeGFSQTJtOHpQVVJCemI4YzBkMkdJOHVaWm0waEtCVENQM3Z1ZDhE?=
 =?utf-8?B?R3JoOGVlZVg1Sk5xQzlvVnpJM2lRakRnaVlwSEI3MVl3a0o3Z1RUY1BOc1Ew?=
 =?utf-8?B?OC8yWHVBQzR1cDNieXdaclBGME10VXAxUFE0bjA4MFFuMGorSzN3Zmp4TkNK?=
 =?utf-8?B?dWNzaDZKMGdUVml2L2hkNEtEYk1rb2YrV3NuWG90cUVwVHdVazB2NktZaHcw?=
 =?utf-8?B?RFIvSUtrWHZSckRLV1ZsVlFyeHlFQ3RGQjd0emlxekNNSVF3dmxVN2svRWVw?=
 =?utf-8?Q?zcQdmqWkFvBozEXhzSACJOTp4CiWKiZvdflz3/T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119c1611-3244-45f6-f5b7-08d97ca2ea2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 01:55:40.8977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ub6xmLGlD7LKu9FS5/cot08NEsyRGYmMAw52qdU7ZSXonSRmseGz4tfPAHt92t/ZaqmZ8uausar/VzFyZXu2pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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



On 2021-09-15 10:36, Pekka Paalanen wrote:
> On Mon, 16 Aug 2021 15:37:23 +0200
> sebastian@sebastianwick.net wrote:
> 
>> On 2021-08-16 14:40, Harry Wentland wrote:
>>> On 2021-08-16 7:10 a.m., Brian Starkey wrote:  
>>>> On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote:  
>>>>> Hello Brian,
>>>>> (+Uma in cc)
>>>>>
>>>>> Thanks for your comments, Let me try to fill-in for Harry to keep the 
>>>>> design
>>>>> discussion going. Please find my comments inline.
>>>>>   
>>>
>>> Thanks, Shashank. I'm back at work now. Had to cut my trip short
>>> due to rising Covid cases and concern for my kids.
>>>   
>>>>> On 8/2/2021 10:00 PM, Brian Starkey wrote:  
>>>>>>   
>>>>
>>>> -- snip --
>>>>   
>>>>>>
>>>>>> Android doesn't blend in linear space, so any API shouldn't be built
>>>>>> around an assumption of linear blending.
>>>>>>   
>>>
>>> This seems incorrect but I guess ultimately the OS is in control of
>>> this. If we want to allow blending in non-linear space with the new
>>> API we would either need to describe the blending space or the
>>> pre/post-blending gamma/de-gamma.
>>>
>>> Any idea if this blending behavior in Android might get changed in
>>> the future?  
>>
>> There is lots of software which blends in sRGB space and designers
>> adjusted to the incorrect blending in a way that the result looks right.
>> Blending in linear space would result in incorrectly looking images.
> 
> Hi,
> 
> yes, and I'm guilty of that too, at least by negligence. ;-)
> 
> All Wayland compositors do it, since that's what everyone has always
> been doing, more or less. It's still physically wrong, but when all you
> have is sRGB and black window shadows and rounded corners as the only
> use case, you don't mind.
> 
> When you start blending with colors other than black (gradients!), when
> you go to wide gamut, or especially with HDR, I believe the problems
> start to become painfully obvious.
> 
> But as long as you're stuck with sRGB only, people expect the "wrong"
> result and deviating from that is a regression.
> 
> Similarly, once Weston starts doing color management and people turn it
> on and install monitor profiles, I expect to get reports saying "all
> old apps look really dull now". That's how sRGB is defined to look
> like, they've been looking at something else for all that time.
> :-)
> 
> Maybe we need a sRGB "gamut boost" similar to SDR luminance boost. ;-)
> 

I wonder how other OSes deal with this change in expectations.

I also have a Chromebook with a nice HDR OLED panel but an OS that
doesn't really do HDR and seems to output to the full gamut
(I could be wrong on this) and luminance range of the display.
It makes content seem really vibrant but I'm equally worried how
users will perceive it if there's ever proper color management.

>>>> I still think that directly exposing the HW blocks and their
>>>> capabilities is the right approach, rather than a "magic" tonemapping
>>>> property.
>>>>
>>>> Yes, userspace would need to have a good understanding of how to use
>>>> that hardware, but if the pipeline model is standardised that's the
>>>> kind of thing a cross-vendor library could handle.
>>>>   
>>>
>>> One problem with cross-vendor libraries is that they might struggle
>>> to really be cross-vendor when it comes to unique HW behavior. Or
>>> they might pick sub-optimal configurations as they're not aware of
>>> the power impact of a configuration. What's an optimal configuration
>>> might differ greatly between different HW.
>>>
>>> We're seeing this problem with "universal" planes as well.  
>>
>> I'm repeating what has been said before but apparently it has to be said
>> again: if a property can't be replicated exactly in a shader the
>> property is useless. If your hardware is so unique that it can't give us
>> the exact formula we expect you cannot expose the property.
> 
> From desktop perspective, yes, but I'm nowadays less adamant about it.
> If kernel developers are happy to maintain multiple alternative UAPIs,
> then I'm not going to try to NAK that - I'll just say when I can and
> cannot make use of them. Also everything is always up to some
> precision, and ultimately here it is a question of whether people can
> see the difference.
> 
> Entertainment end user audience is also much more forgiving than
> professional color management audience. For the latter, I'd hesitate to
> use non-primary KMS planes at all.
> 
>> Either way if the fixed KMS pixel pipeline is not sufficient to expose
>> the intricacies of real hardware the right move would be to make the KMS
>> pixel pipeline more dynamic, expose more hardware specifics and create a
>> hardware specific user space like mesa. Moving the whole compositing
>> with all its policies and decision making into the kernel is exactly the
>> wrong way to go.
>>
>> Laurent Pinchart put this very well:
>> https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html
> 
> Thanks for digging that up, saved me the trouble. :-)
> 

Really good summary. I can see the parallel to the camera subsystem. Maybe
now is a good time for libdisplay, or a "mesa" for display HW.

Btw, I fully agree on the need to have clear ground rules (like the newly
formalized requirement for driver properties) to keep this from becoming an
unmaintainable mess.

Harry

> 
> Thanks,
> pq
> 

