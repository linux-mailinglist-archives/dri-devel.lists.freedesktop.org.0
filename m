Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EA8C4C86
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 09:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3494710E2DF;
	Tue, 14 May 2024 07:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a/NpqCRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9284D10E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 07:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyoo8LaDI1LIAC38gNL+f08x7FXaYpl1GoG7hw4wbEw8olqUBmHMP/TbHuYwWbdSkOZbg7PPiupmwvwoBqPxBvc5OtgHEusKjvzdc6rH2h5gMfjMZ7iWNl2sCLDOZHk/bFf/VnF71wlx2rk+CKd96dzUIOGzWqlCV8sAOTvDTI4GrQE2k+sN9+rAeZgh1EyHAZ0DXrQQS9hxQX2Z4dOo31qncOra+UIziHYJMEhaSuHIh2dqE5FlLnITb1VtW7XROHFyM8n2NS4bf4JqPN135n3gJ0ETjmVvmXWNuwobq3g+NjE+yhmOCkDo2L1c5hAJp0YBqLljDOx0rR2dXq0dpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+Pha1IStjEE+KuDUA+SoK/9yRO4wT9yUvwKlPlV3XM=;
 b=E2nMmz7PWZZeFhKyroAVVyYoEDx/7UPdO2cfr613Z9ruORO2r6Q6V/TWaLeNB9ubjSEuJ48nRC37MmCz4to9HWHjGLpVw+PHdklaEZcGaS6XMAS52Hj0KYhLpk5xCat6630Q73x8SVwsIpBr8pQNdkoj4ud0iDLFaBA6mBgKwGPbXPOtgNIWJPsftBXYpmGtYLdbVvNHVPFk44ku2n3DCgtnQNYP8kDo8mDKPWyAPzF48XFuhasp6vtHA/EenEsv/wpDL8xeGeKPjZoqfFh/3CafCymQ+Bb1VI3vQkTSMcAjrJlMv41OuAO/GW0nKVv7ttbD/UQfYbA2Lw3a8a+Y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+Pha1IStjEE+KuDUA+SoK/9yRO4wT9yUvwKlPlV3XM=;
 b=a/NpqCRjmIsn08jFB2LzGsGH1Bs8mD2OV834oNPckiEt+WDhin0gaeQNIJuua48IlLEIol7XQHeAwHXewnDdMlgSE9wAhfsSpbeFYHrEEbh6cUbpBZ9/ogq8vCXulsKzM+RPosRYk1BSPHKDQjxoiIQbnvZ9EYMFgYM1btC4PFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 07:00:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 07:00:45 +0000
Content-Type: multipart/alternative;
 boundary="------------lDAXWP27rWPP0YRND83gggU5"
Message-ID: <5c028e48-4482-4375-822b-e1018a98b7cb@amd.com>
Date: Tue, 14 May 2024 09:00:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: dma-buf sg mangling
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
 <CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 1334470e-3cfd-48ef-2da8-08dc73e39388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alhndThGd0xOMzhmb2U0cWtOS2l2K3NrcThxKzg5WDEvQjR5VHF0V1R5c3lP?=
 =?utf-8?B?aTVSYlIzL3lON3VzNUpIUWVCb0ZNc3hrWXBkemhPa3F5QWJkVEFpRU9ISTRa?=
 =?utf-8?B?ZTdkakRCamtjM0lPNjVwei9JSS9lVkExTjNNcExhbTlWckJuTU1TTm9TTWpF?=
 =?utf-8?B?MG55VlJGL1kwRnJLNzhLZTIwdTlyUW5BSE1tTmU5UVVMOXBGa1pReXU4bUtu?=
 =?utf-8?B?Zm43OEVycmFiT21kTXJuUTc4cUMwY25nSVVualdvVVJjR2xoTG5ENmFwSmhL?=
 =?utf-8?B?OUNSeFVlWGJpNVhhaldPa0tiVkt5dFdDMG9TQmRmdjNQY0NZSmFSVEEwNFJm?=
 =?utf-8?B?VmNkU0pCcFlkd1lsek5IcDhFZXJKaW5FNi9zbnNZMzFvMkdoaDZPZmswMzRM?=
 =?utf-8?B?WVkvMVc3d0t1QncxcGx4NFNWQTRLOGo4aDJIVVhJVzg3UE5PZytXUlB1VkNX?=
 =?utf-8?B?VDVHSk9hYW5lK253b1diTnA3SHlrdWhJQXh5UmVQRTdBZDN5VWpYVVp1SDZC?=
 =?utf-8?B?N0UzRVpsakxDTm9Td0dsTlN5RmdFQk1aZ1dPZEtIeUZXREYvRmxSNkZyQytV?=
 =?utf-8?B?aGFuMUdpR3ZlNWl4T3Q2TlpGMGs0K25kK01nOXQvcWk4WlhBcXBYbzNac0Uv?=
 =?utf-8?B?RFpXd2NLREgvTGNIU1k1NTJvaFBUUi9WMzZLZzNyK2pyeHdaNGVPVzlNYnVp?=
 =?utf-8?B?dnYvVUdNT296TTNtOFdQQWdGREVpS1BZRk1QeGphQnFpMkVIdDJKQmxzZHlV?=
 =?utf-8?B?TW5Gb1owQWFBTXF4QUxmSklIUjc4bThiWm82VkJpd09VWnZiZ0FLY2JxK3Qr?=
 =?utf-8?B?QXoxY3BLZEZUdVNxMHVQL3IrcFBpSFFhckszZTlIUjhRS3JYZFNhT29RNGd0?=
 =?utf-8?B?V1c3WW1hbys5cE9hVWt5OW52N2M0RVcrQUVhQU1XV1g0STkrUldlSGFONVIw?=
 =?utf-8?B?eUxUZDd3b2JsY01NSEt0b3lycm1SSXhENUdqWTlFbm5aSjEyMTFGNWhqcUpq?=
 =?utf-8?B?TVZVM3hjcUxhZmhsWktPeENYSEJuV1FUaEowMkk2S1BwR3VobEk4R2dvVVd4?=
 =?utf-8?B?VjZhS3VyMjFRR2tUK1ZPRFZndGdtTHpOL0JtZUZUTEEwTTVzNVg3WnZCRWRJ?=
 =?utf-8?B?Ky9wNjR0MDdQQmZQekFpUldKSDFEMFJOQjV0VEkxUWZUclJnQWRBODhmUFpB?=
 =?utf-8?B?MFBzS2s3TjE1WGFvQ2UyNzBuanRNRVBjZ0l5OXhFckpLL3RDWGtaSHFESkhV?=
 =?utf-8?B?T3JyV0hwaTZGNjhaWG82T3lnaUhlQXp6T3I2dnNaRHNGVE9OQ1VmMUl1eVBa?=
 =?utf-8?B?aFBRbWF0cDhscWlVYUJnVzh3dmx2M0llcmUvZjNxRDlQYlJFYVplKzNlVHQv?=
 =?utf-8?B?RE1RWHVqTEhvaytUd1BWMkZrdmNoOXlTWFlmai9WV0pHSEJxbHN3aHhjVXd6?=
 =?utf-8?B?UHJXOFBxQmtsRCtZMEJaRUJoSnFLejhTZUl1ODFOL2VpeU1wTmh2c29sMmM4?=
 =?utf-8?B?UnRFemJHNmlrR09JcnNBZnpZWHoxSUJ4Q2RISGg3aWM1OVZWeDQwRmJjL2pS?=
 =?utf-8?B?VjZNWDg0N3ZVYTcrVDNnOWIxS0JVUHlGWit5OVE5VTJhRlQ1ZGNqbGczdkkx?=
 =?utf-8?Q?zvduXQc6fXwIS/Wnl+ejOStzEgkZQIrj/vzdT7qGBbVQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmxPQVFib2wrNmZ3dkhQQ1l6T0J4UEFORGFXWVpjNzVDUjRVdnhtNVU1MTJ5?=
 =?utf-8?B?TldoZnFIaEI5eHpUOUJvUFpTUFRoZTkzR3ZOVks5ckFxSnVpUmR1OGtNVFZo?=
 =?utf-8?B?NHBFeUtqMU9hOGp1eEpaSVh6WnJTVkFMQlZkOE40SS9RMDlDYmw4T2l2em5Z?=
 =?utf-8?B?eWViNGlUMzRNQTVsK2J2OTRIM1FFNnpKSWpVUEtlM09VeGVhVXZzSWFRM3A4?=
 =?utf-8?B?ZFpVckwyQ3o3L084R1czR25ZK0dBaFdmMnczVGIyQTV0VTBScGJZM3VzMGhR?=
 =?utf-8?B?Z3JUK3ZFaGRtZGs1QXNOQ3hCZ2ZTTmFQbzltS0pVZTgvckRjL2FQb1ZPRnFi?=
 =?utf-8?B?TTU1WlF1MFdkTk9pQ2V5SmxsNjRpMy9YNWlGVDcvc2NBYm5MR0pvQjJnbDFU?=
 =?utf-8?B?MDZtRytEZXVvUFZMc1RqcUZYb2p1VVY0eGVuSWpOTW5VU0F1UmRKVjZSb0NM?=
 =?utf-8?B?clVNL09aRTRoaGlVT1NTRXRMaVJGWXNXdFQrQXJDTW40S0F3elpCS2tRM2Fk?=
 =?utf-8?B?TGdBSXdSU2YrMytlbWhvZjdhd2hMYlVzYmpSUHNJQmZoTGVOY2hEVlBrbElo?=
 =?utf-8?B?UzIyQlNaSlFlTmZHMjBKemlsZVFzdlRmYUhqTDRhTkg2U1JWTStLVFlOU21R?=
 =?utf-8?B?d3NuYWhFVmpyWm96eE9FdnkxVm1zTS84OUxnRjBnaTMzY1JpSTFxQXBvUTQ3?=
 =?utf-8?B?cVE3VUZRNnpOZmxRVHp3c3RMRWxBSnZwR1FKWC9FNWoySGJVNi9ObUxZSlg1?=
 =?utf-8?B?dGZJNmUxME5mRGs1TU8rN0FjWEJHQm55ZWMzMDY3VEl5bHJkUFBZVSt5QXFQ?=
 =?utf-8?B?QVBkdGlZWTk2RjBxVDdZODNUdWpJNzlPaWpydkhLYnREdkl0RTF5WmR1VG40?=
 =?utf-8?B?bjhvME8yaUUvV2hwdmRkSGNIMGlOSjZsYU5BM2NBU0FCT09rNEN2UzV4U1ZE?=
 =?utf-8?B?SUx3R284TlBGeUlhQm1ZdlRXZEV4MFlSaXRRS1pLc3ZJazA0eXhYNTd6YzVX?=
 =?utf-8?B?bVZxbGNvOFdwYVZBeUh1WXArYk82NjEvcDRQTVlWbDU1RFA0MklFU1hlMVZi?=
 =?utf-8?B?UzlZNE1CMkZzTnFra3psN1Q2dlFNVytzVGFzTHhBWlc4QkJwcGJzNk16QTVj?=
 =?utf-8?B?b2hsUFR4Z2VKWSt2Y25ja0hDYTRhUHdyc0VvOVZ6ejJ1T3RmcWRQSTZscGhu?=
 =?utf-8?B?UU5HVTJCNlVaQzhhTlZvaVpHSkJhMFhjZ3JadEdqZ0l3VmhSdjEvUU9GdDB0?=
 =?utf-8?B?MndZVDUwL0VJWkljbDJ3VmRzYWMvQnpUK0xBVEJUeE5peWtibVhVdzlzcW9m?=
 =?utf-8?B?Y3N5OHdEQWlONE13WHE5c3h3dVZwRlk4YUVPaXFkY1pKUFVER0pFbmx3VnQ2?=
 =?utf-8?B?SENtUU0yQ1p1eGdZTm9JK2dhT0dLNEFQaVQrUHV5R3JNVGlnRVByZk14blRL?=
 =?utf-8?B?ZGVpTk5EZmY4UkZzdU5Cd0pjMzFnRmZUcGhWWjJZb3drWWVydjZQOEthd21u?=
 =?utf-8?B?cnlQNFFndHhGY2xjWS9Teks4SUV1VzNpUmV2Z2wxU0NKakpvSzh1dkxNWGJX?=
 =?utf-8?B?cjczZm5sY1p6ZjRoRHhSVTdxRGQ3N1lHeGg5TWJCTkVCc1pSWE9KWHR5ME10?=
 =?utf-8?B?QWgwWWRGa0JOeDZ5TENrWnZKS3dWSXZEbjVQdEVQdzlNOW03aTVGNnp6Q1V2?=
 =?utf-8?B?Q3h4djgya1JrdUd4a1RsZzQ4ZGFZR1V3emVjN0R6WXRJSzRzc2EyRzlLQnE4?=
 =?utf-8?B?UlIzOXAzZUxHQzdHWXJIMy9IeDR1WkhpOCtwS243RUd3Zis2QnJZOE5SWE1W?=
 =?utf-8?B?eGtWWmtqZkFlTnYxZUdRU3lXc3NlbXZOL0NtL0dVL1pBc3Q0L2RMTk5yaUVi?=
 =?utf-8?B?Ymxud2ZiYzkrWkZ2QVRIdEY3MEw3djdJSjNqSlA2Rnd0OFBOaU5vUHdGMkJl?=
 =?utf-8?B?ZGVoWlpaOHc5b3Z3Z3VWQzE2ZXN0cTQvcUZSZDlKcEMzSnlIUng3bmU2Z3h0?=
 =?utf-8?B?alFhZHFRN05KcVZGcjNIRzhldVZXTTdHUWRrVExUeXJjaW1iNXBSTHlaWnFD?=
 =?utf-8?B?YkZsOXNCbkhRejdKck1Jb2pheENXcDZtZU5SMGRiZTVUVkVqTEg0b3IzWkZW?=
 =?utf-8?Q?Zsvf0mYkf7eM2CpdYzhRn2GuY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1334470e-3cfd-48ef-2da8-08dc73e39388
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 07:00:45.1108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wxDOmzUnmCod9DbZyG8SZV9n/xUmXFcD/ExZVcrTCor8rmo+A6vT2D3IaGjwJFf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086
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

--------------lDAXWP27rWPP0YRND83gggU5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.05.24 um 06:15 schrieb Zack Rusin:
> On Mon, May 13, 2024 at 1:09 PM Christian König
> <christian.koenig@amd.com>  wrote:
>> Am 10.05.24 um 18:34 schrieb Zack Rusin:
>>> Hey,
>>>
>>> so this is a bit of a silly problem but I'd still like to solve it
>>> properly. The tldr is that virtualized drivers abuse
>>> drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
>>> virtgpu and xen punt on it) because there doesn't seem to be a
>>> universally supported way of converting the sg_table back to a list of
>>> pages without some form of gart to do it.
>> Well the whole point is that you should never touch the pages in the
>> sg_table in the first place.
>>
>> The long term plan is actually to completely remove the pages from that
>> interface.
> First let me clarify that I'm not arguing for access to those pages.
> What I'd like to figure out are precise semantics for all of this
> prime import/map business on drivers that don't have some dedicated
> hardware to turn dma_addr_t array into something readable. If the
> general consensus is that those devices are broken, so be it.

Well that stuff is actually surprisingly well documented, see here: 
https://docs.kernel.org/driver-api/dma-buf.html#cpu-access-to-dma-buffer-objects

It's just that the documentation is written from the perspective of the 
exporter and userspace, so it's probably not that easy to understand 
what you should do as an importer.

Maybe we should add a sentence or two to clarify this.

>>> drm_prime_sg_to_page_array is deprecated (for all the right reasons on
>>> actual hardware) but in our cooky virtualized world we don't have
>>> gart's so what are we supposed to do with the dma_addr_t from the
>>> imported sg_table? What makes it worse (and definitely breaks xen) is
>>> that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
>>> mangle_sg_table so drm_prime_sg_to_page_array won't even work.
>> XEN and KVM were actually adjusted to not touch the struct pages any more.
>>
>> I'm not sure if that work is already upstream or not but I had to
>> explain it over and over again why their approach doesn't work.
> I'd love to see those patches. Upstream xen definitely still uses it:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/xen/xen_drm_front_gem.c#n263
> which looks pretty broken to me, especially with CONFIG_DMABUF_DEBUG
> because drm_gem_prime_import
> will call dma_buf_map_attachment_unlocked:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_prime.c#n940
> which will call __map_dma_buf
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/dma-buf.c#n1131
> which will mangle the sg's page_list before calling xen's
> gem_prime_import_sg_table. Which means the drm_prime_sg_to_page_array
> that's used in xen's gem_prime_import_sg_table is silently generating
> broken pages and the entire thing should just be a kernel oops (btw,
> it'd probably be a good idea to not have drm_prime_sg_to_page_array
> generate garbage with CONFIG_DMABUF_DEBUG and print some kind of a
> warning).

I honestly didn't followed the discussion to the end, but both Sima and 
me pointed that out to the XEN people and there were quite a bit of back 
and forth how to fix it.

Let me try to dig that up.

>
>>> The reason why I'm saying it's a bit of a silly problem is that afaik
>>> currently it only affects IGT testing with vgem (because the rest of
>>> external gem objects will be from the virtualized gpu itself which is
>>> different). But do you have any ideas on what we'd like to do with
>>> this long term? i.e. we have a virtualized gpus without iommu, we have
>>> sg_table with some memory and we'd like to import it. Do we just
>>> assume that the sg_table on those configs will always reference cpu
>>> accessible memory (i.e. if it's external it only comes through
>>> drm_gem_shmem_object) and just do some horrific abomination like:
>>> for (i = 0; i < bo->ttm->num_pages; ++i) {
>>>       phys_addr_t pa = dma_to_phys(vmw->drm.dev, bo->ttm->dma_address[i]);
>>>       pages[i] = pfn_to_page(PHYS_PFN(pa));
>>> }
>>> or add a "i know this is cpu accessible, please demangle" flag to
>>> drm_prime_sg_to_page_array or try to have some kind of more permanent
>>> solution?
>> Well there is no solution for that. Accessing the underlying struct page
>> through the sg_table is illegal in the first place.
>>
>> So the question is not how to access the struct page, but rather why do
>> you want to do this?
> Rob mentioned one usecase, but to be honest, as I mentioned in the
> beginning I'd like to have a semantic clarity to the general problem
> of going from dma_addr_t to something readable on non iomem resources,
> e.g. get the IGT vgem<->vmwgfx tests running, i.e.:
> vgem_handle = dumb_buffer_create(vgem_fd, ....);
> dma_buf_fd = prime_handle_to_fd(vgem_fd, vgem_handle);
> vmw_handle = prime_fd_to_handle(vmw_fd, dma_buf_fd);
> void *ptr = vmw_map_bo(vmw_fd, vmw_handle, ...); <- crash
>
> trying to map that bo will crash because we'll endup in
> ttm_bo_vm_fault_reserved which will check whether
> bo->resource->bus.is_iomem, which it won't be because every vmwgfx
> buffer is just system memory and it will try to access the ttm pages
> which don't exist and crash:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_bo_vm.c#n249

Going through TTM for the VM fault is completely illegal to begin with. 
What you do instead is to re-route the mmap() request to the exporter, 
see how dma_buf_mmap() is being used by drm_gem_shmem_mmap() for an example.

It was even discussed to do this generally in the GEM layer, but IIRC it 
was rejected because driver stacks should avoid doing this and use the 
original exporter for the mmap() instead when possible.

Sima and Thomas probably knew this better than me, but I think the 
problem might be that VMWGFX didn't used that GEM layer until recently 
and so most likely never enforced some of the restrictions there.

> On our hypervisors that are less than 8 years old all of vmwgfx
> buffers are always system memory, and when we get an external buffer
> from vgem, which is also system memory we have no currently supported
> way of populating the ttm::pages to be able to map/read it.
>
> It's fine if the general consensus is "that's crazy, we can't fault on
> external buffers pages" and "without some gart like thing in your
> device we can not make prime work" but I do want to have some clarity
> on how/whether this is supposed to work.

Short summary is that you redirect your mmap() call to the 
dma_buf_mmap() instead of handling it yourself.


> Or to put it another way: imagine two different cpu vgem like drivers,
> how does one driver import the sg_table from another and convert it to
> something userspace readable?

Well you don't touch the sg_table at all in that case.

If you need an userspace mapping you use dma_buf_mmap(), if you need a 
kernel mapping you use the vmap interface.

If you are a hypervisor like XEN, KVM and VMW you basically don't touch 
any of that and just mirror parts of an address space between host and 
guest through an MMU notifier (include faults and invalidation).

See the recent (~2 month old) discussion between Christoph Hellwig, the 
KVM people and me on the some mailing lists.

Regards,
Christian.

>
> z

--------------lDAXWP27rWPP0YRND83gggU5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 14.05.24 um 06:15 schrieb Zack Rusin:<br>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, May 13, 2024 at 1:09 PM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Am 10.05.24 um 18:34 schrieb Zack Rusin:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hey,

so this is a bit of a silly problem but I'd still like to solve it
properly. The tldr is that virtualized drivers abuse
drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
virtgpu and xen punt on it) because there doesn't seem to be a
universally supported way of converting the sg_table back to a list of
pages without some form of gart to do it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well the whole point is that you should never touch the pages in the
sg_table in the first place.

The long term plan is actually to completely remove the pages from that
interface.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
First let me clarify that I'm not arguing for access to those pages.
What I'd like to figure out are precise semantics for all of this
prime import/map business on drivers that don't have some dedicated
hardware to turn dma_addr_t array into something readable. If the
general consensus is that those devices are broken, so be it.</pre>
    </blockquote>
    <br>
    Well that stuff is actually surprisingly well documented, see here:
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/driver-api/dma-buf.html#cpu-access-to-dma-buffer-objects">https://docs.kernel.org/driver-api/dma-buf.html#cpu-access-to-dma-buffer-objects</a><br>
    <br>
    It's just that the documentation is written from the perspective of
    the exporter and userspace, so it's probably not that easy to
    understand what you should do as an importer.<br>
    <br>
    Maybe we should add a sentence or two to clarify this.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">drm_prime_sg_to_page_array is deprecated (for all the right reasons on
actual hardware) but in our cooky virtualized world we don't have
gart's so what are we supposed to do with the dma_addr_t from the
imported sg_table? What makes it worse (and definitely breaks xen) is
that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
mangle_sg_table so drm_prime_sg_to_page_array won't even work.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
XEN and KVM were actually adjusted to not touch the struct pages any more.

I'm not sure if that work is already upstream or not but I had to
explain it over and over again why their approach doesn't work.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd love to see those patches. Upstream xen definitely still uses it:
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/xen/xen_drm_front_gem.c#n263">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/xen/xen_drm_front_gem.c#n263</a>
which looks pretty broken to me, especially with CONFIG_DMABUF_DEBUG
because drm_gem_prime_import
will call dma_buf_map_attachment_unlocked:
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_prime.c#n940">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_prime.c#n940</a>
which will call __map_dma_buf
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/dma-buf.c#n1131">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/dma-buf.c#n1131</a>
which will mangle the sg's page_list before calling xen's
gem_prime_import_sg_table. Which means the drm_prime_sg_to_page_array
that's used in xen's gem_prime_import_sg_table is silently generating
broken pages and the entire thing should just be a kernel oops (btw,
it'd probably be a good idea to not have drm_prime_sg_to_page_array
generate garbage with CONFIG_DMABUF_DEBUG and print some kind of a
warning).</pre>
    </blockquote>
    <br>
    I honestly didn't followed the discussion to the end, but both Sima
    and me pointed that out to the XEN people and there were quite a bit
    of back and forth how to fix it.<br>
    <br>
    Let me try to dig that up.<br>
    <br>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The reason why I'm saying it's a bit of a silly problem is that afaik
currently it only affects IGT testing with vgem (because the rest of
external gem objects will be from the virtualized gpu itself which is
different). But do you have any ideas on what we'd like to do with
this long term? i.e. we have a virtualized gpus without iommu, we have
sg_table with some memory and we'd like to import it. Do we just
assume that the sg_table on those configs will always reference cpu
accessible memory (i.e. if it's external it only comes through
drm_gem_shmem_object) and just do some horrific abomination like:
for (i = 0; i &lt; bo-&gt;ttm-&gt;num_pages; ++i) {
     phys_addr_t pa = dma_to_phys(vmw-&gt;drm.dev, bo-&gt;ttm-&gt;dma_address[i]);
     pages[i] = pfn_to_page(PHYS_PFN(pa));
}
or add a &quot;i know this is cpu accessible, please demangle&quot; flag to
drm_prime_sg_to_page_array or try to have some kind of more permanent
solution?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well there is no solution for that. Accessing the underlying struct page
through the sg_table is illegal in the first place.

So the question is not how to access the struct page, but rather why do
you want to do this?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Rob mentioned one usecase, but to be honest, as I mentioned in the
beginning I'd like to have a semantic clarity to the general problem
of going from dma_addr_t to something readable on non iomem resources,
e.g. get the IGT vgem&lt;-&gt;vmwgfx tests running, i.e.:
vgem_handle = dumb_buffer_create(vgem_fd, ....);
dma_buf_fd = prime_handle_to_fd(vgem_fd, vgem_handle);
vmw_handle = prime_fd_to_handle(vmw_fd, dma_buf_fd);
void *ptr = vmw_map_bo(vmw_fd, vmw_handle, ...); &lt;- crash

trying to map that bo will crash because we'll endup in
ttm_bo_vm_fault_reserved which will check whether
bo-&gt;resource-&gt;bus.is_iomem, which it won't be because every vmwgfx
buffer is just system memory and it will try to access the ttm pages
which don't exist and crash:
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_bo_vm.c#n249">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_bo_vm.c#n249</a></pre>
    </blockquote>
    <br>
    Going through TTM for the VM fault is completely illegal to begin
    with. What you do instead is to re-route the mmap() request to the
    exporter, see how dma_buf_mmap() is being used by
    drm_gem_shmem_mmap() for an example.<br>
    <br>
    It was even discussed to do this generally in the GEM layer, but
    IIRC it was rejected because driver stacks should avoid doing this
    and use the original exporter for the mmap() instead when possible.<br>
    <br>
    Sima and Thomas probably knew this better than me, but I think the
    problem might be that VMWGFX didn't used that GEM layer until
    recently and so most likely never enforced some of the restrictions
    there.<br>
    <br>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On our hypervisors that are less than 8 years old all of vmwgfx
buffers are always system memory, and when we get an external buffer
from vgem, which is also system memory we have no currently supported
way of populating the ttm::pages to be able to map/read it.

It's fine if the general consensus is &quot;that's crazy, we can't fault on
external buffers pages&quot; and &quot;without some gart like thing in your
device we can not make prime work&quot; but I do want to have some clarity
on how/whether this is supposed to work.</pre>
    </blockquote>
    <br>
    Short summary is that you redirect your mmap() call to the
    dma_buf_mmap() instead of handling it yourself.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Or to put it another way: imagine two different cpu vgem like drivers,
how does one driver import the sg_table from another and convert it to
something userspace readable?</pre>
    </blockquote>
    <br>
    Well you don't touch the sg_table at all in that case.<br>
    <br>
    If you need an userspace mapping you use dma_buf_mmap(), if you need
    a kernel mapping you use the vmap interface.<br>
    <br>
    If you are a hypervisor like XEN, KVM and VMW you basically don't
    touch any of that and just mirror parts of an address space between
    host and guest through an MMU notifier (include faults and
    invalidation).<br>
    <br>
    See the recent (~2 month old) discussion between Christoph Hellwig,
    the KVM people and me on the some mailing lists.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

z
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------lDAXWP27rWPP0YRND83gggU5--
