Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C81A7BECC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E388210EBC8;
	Fri,  4 Apr 2025 14:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ifWKx0C6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD70A10EBC8;
 Fri,  4 Apr 2025 14:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYv8Nxj+0XeEk2DvfV5VSbNFYzJhVHpUDbUU2WVaMd3sp2rhuEOGg0ye4XXAldA1Zsf5yod6+QS/P+FVblngtk5W1Rvg4w4KOHQOkZt7HFzh/ka8mu7JUMg+3yO6MolrFV1U8wqluGmsNXXY+cLs/Dqkhz5Nmj+LDQ0Fv0+PsL/0iuxquBIMexkOqudDkfvSWSBPT+FwyslB3EWRz7ITd0oGX7yHbnLnRjbcRJqJXdSV4hEMQGxF/Cpzou7LdB0n2aM0+yRsMm39vFNAvsknSNfVqrzrT5sVtNxsbRH1JRyYfHqgQvYDQFovhXM4RFC6WYteAYYWJ+2fUkgDiNYTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mio+YPu/nqXdrAucdVXx6/NZg5MkzzKIiFu+vi5YcpI=;
 b=Gqemhfx3pwG4oxyriGVzZqVeXYZSsBVFlmPRuls+kMJrc8sIqVDFmCmydGIsI/rK3dEgcknBASKWi9AvFHfbCqRwGtDPoeYQmV4YSSTNhdpyU9lb5OeSwcikGZq3xu4CPZbt2LRq5obhtVxrl709iG9icjUEGtOgAGhRC/OcfFuIJ2CDXfAiUN/9BghNGOO4ZNinA5XBEqpt88UAy4WTpgt8E3kYuDgFKU0rqlGTr3cOoycX49Oxi8ErzDXcKIzUn+QsdOluA7OmcHYsVeLqOc4rhcbboomuwFLJtnxDB4BGEN0CCai6fLAf93rmJq4Q1j+0yQA4Sig35IxNQh+o6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mio+YPu/nqXdrAucdVXx6/NZg5MkzzKIiFu+vi5YcpI=;
 b=ifWKx0C6F2CHzQCiwWPlA486ExgVPQNUh7Li9x5eST4EPF2H2hEE58lr1LViTDqxg2qE03hfR88poycqONOltZ9ZzJL9lT3GOo9BHicMtsnyuDh3jAS1VVgtXNhEhYzFPxXm3lK2g7LXflE5aYEoPMUWy1g+wGsrE55RVD65nHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 14:14:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 14:14:56 +0000
Content-Type: multipart/alternative;
 boundary="------------6ev6XXZJ7eFoz90WOzd3aYpc"
Message-ID: <920f1df7-9566-4df1-bba5-f8a1bf29c49c@amd.com>
Date: Fri, 4 Apr 2025 16:14:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
 <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
 <72156b6a-9a8b-4485-8091-95f02c96eba8@amd.com>
 <36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org>
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: f062e746-d5c3-454a-7a32-08dd738313b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODUwUW5rclM3SXVZaDQ3MTZqL210bTZaVyt5dXErc25GRGZMZXJ1R0xMOGU3?=
 =?utf-8?B?UWpMZlpsbGN6YXJTUG5NV2lJam8rSVJEUFdQVE5qNURvdGNVY2xiL1NPWjZ1?=
 =?utf-8?B?Z2N2RVRnTHdrWjNONEwzdjEzVXdhTlphNXBDSGE1dGlUTHlScVVEZnFBM2Vy?=
 =?utf-8?B?aVhidzB2elh5M0lTZXA0cSt6YmRKVzA5V3lSTjlJTy9yTytPak9RVk9lVTZs?=
 =?utf-8?B?eTNPY1ZsRWVIQzhnWCtmdXFSNjhHa3M5YVJ4ck9WQzFQdXk3RGhENHBEdzB1?=
 =?utf-8?B?Q2toZFphWFgvY25ha1ozV2NYTVFKREdFekZCRDZPdjZIWGxiNjdmS0MwWlZU?=
 =?utf-8?B?OTJ5SFdWZmNrQk9UWkhzRVhWc3JLYkgzbmxGYTd6aDhyQ3FIMGFJc1c5a2p4?=
 =?utf-8?B?Z0Q4KzBBUS9hMlZySzlIQkdKd0c3Y0ZsVGpVZUs4c0dQQkFOaVFyM1JLOVdE?=
 =?utf-8?B?aHE2ZjBZckFBUnYyZFNGRVRnTDlnYkhaQ0xrdVgzT0wwd1VLUGNNUmRRSW9j?=
 =?utf-8?B?MzM2VDhSc20yR0ZRamE0dVk1cFFkRlAyYXVsUUJaR1REaW02aTFLTHM0Wlg4?=
 =?utf-8?B?UURURVpBRXk3Z0tvVUExY2NQa1p6M21kZk01cnd5ZDRib2d6VytQZTRJcyt4?=
 =?utf-8?B?djhMalBwYnIvMmZScExwK1pGN3lOQmZLUVp6WGJlMWFhaWlzN0lCelI0SUdP?=
 =?utf-8?B?VHpHUytncTI4VzhpZEJ1TG5PUzZzN1lQY2RHSk9Sa2k4eDdoR1REZ2Q3djI1?=
 =?utf-8?B?VXZLdTRhangrblgxbkFGNFRVT1BWK09YOWdzdUxySXJ4Kyt5R0Jqa2UyeERm?=
 =?utf-8?B?MHBhbzZsU1YzeFZIL252Q3FQTFloNHR3UElEU2tFb1pzbzg4TlhtL29saFhE?=
 =?utf-8?B?Q0tFcU9TeG5YcE4yQ1lQNVRUTzJVdFIyQktLWFNuTk9ZSjNaYitWbitRa3Nm?=
 =?utf-8?B?QW04YnhZc1VxUWVJa29YVnF1UGl3L1A3TjY5ZWduRms1ZVV1NWl4WlcxUmNn?=
 =?utf-8?B?MlU1clZjRDVRcnVwN1FBamVCV2dpbnBnMUlEUlk1Wk8zdCtqNWpzcWUwMFNE?=
 =?utf-8?B?YXV2VjJ5VUtzL3dhVS9JVDVjVWIwazd4cmF6Rk1LbXpyU3BvaDRvbGd0U3dl?=
 =?utf-8?B?dVIxL2hobExQa2x3V2N2Z0pyWjBVR2pLK3pRalFlaVlnTFlGWDR6a2ovcWcx?=
 =?utf-8?B?MEhSNGF3QnJ2SnltbzFlRFQ1aWFRY3E3aVFMeVlMaHV2dzZQOE9YOXFZR1lM?=
 =?utf-8?B?dWdvM3FrNTBCRnVTQUFnUlpKM0ltVkxIUzQxNEVWMEhLQWFjd2U4QmsxZzdx?=
 =?utf-8?B?SkxGYjJ0ZjVwc21FbkVGYlZKcGxPMUg3WjV5V0k0VlJ5WU5JRXRCaU1HaFBD?=
 =?utf-8?B?N3NIYnc1Qm5iR0hQOWR2NitVSkhkencwbzlucFpvREZjMTk4WEdDblNYM1Fo?=
 =?utf-8?B?MXNLVXc4L0R4ZkVFRVpPOVJleUFLUlNJTHp4ajBCTDRtTVpHZCtJTTIra2ta?=
 =?utf-8?B?QW93cDROWXN0TUl3UzlrbEJUTnU1L2VnYWoydlFMWlp6d1hmTThPU04zWVNN?=
 =?utf-8?B?OHBSOUZHV25YOTg5QUhWVmFzSlNiTXlMeFBmUGtqTlV1Y1JMQWp1eldhMDJ5?=
 =?utf-8?B?bmZqdVZWUUFORUEzd0dkMUI1ZHZzVWt3YndmYzUyRjNPcW5IbFVCbW5adUZB?=
 =?utf-8?B?ZXFGdDNSQVpTRU96Q0c1N1IvNXFaYjgvcmNWckk0TFdMdk1BWENucVNQWVBu?=
 =?utf-8?B?VjNqTjl4TnB2OW9JK2d2cThxN08vcUltNWEwZVMxMjQvaGJLaDdNdDdUQmtt?=
 =?utf-8?B?Nnh0VXdVVU5oOXkyMS9nWjdDV0NUSCtKVHVHcDFKYjFLSUhjYmZhSGphb3kx?=
 =?utf-8?Q?OFD2VmjdRrOdD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNZay9tczR4bTNjUldDVGZSSFhYMzBESTU0UWFxaC9qRWY5eDVSaG1NVEJO?=
 =?utf-8?B?VC9BaVZHVEZTcVVxTTV5L21MS2VwUno3ZWozRVB0S004WGJYNXV0S21ac1d6?=
 =?utf-8?B?THM3emVnSkdoSitTbkRwMkZSQ0s3YklWRWc2bDNlckhhU1FMNlBNUjBlUXl5?=
 =?utf-8?B?Y0taNGovb2wxMnFYUXh2dWkwRWtuZ1BteHprTVFGSEljRHUvUXZQSHdTaVFV?=
 =?utf-8?B?Nmx4Z2FJcGpmZWNvNnVFQmpGeExid2dkdzRiY1c0OGJPYlBTM3V1bDlnOTVa?=
 =?utf-8?B?VWpVdFJVRXJzQ0lHRGM0dFpVQWRwVGhzQWw0QStZQ08zbFVHWFNLY1Rud1h6?=
 =?utf-8?B?VFU0OEZORlZsRVBBSjBxUGltU0N2WnltU1ZQbDQ4eDUyMElkMHh2WGExeXoy?=
 =?utf-8?B?c210YVc1ZURMb2lUR043cFZKOHRjQ08rczd3QmVIYXU1SlM1QTg4UkgrN1Fp?=
 =?utf-8?B?RnMxRzRsTW1sdlI2WkNvakQvSWhDbW1HYTVscy9SRlJHeWxqdjh5a3VQc3Rm?=
 =?utf-8?B?YWF0VWVPSzZwZ2hMZTNiZXJlNktVcGQ1M2t6TmppdnU4MDhpOW50RUx6b2ZP?=
 =?utf-8?B?RGZQR0pRVW9oWmUvcEd3N1U3SEdTdzdLSFpMN1pkem9Bb0JlWEFkcHd1VWVy?=
 =?utf-8?B?ZEcvaEFrNkk0TC9pSTFXOTQzaU04TlVocGJqNnhjSkR3TFgraEpEeE02TnEz?=
 =?utf-8?B?cUFBVzFwQnlCVXpYZm80d3c1b0tjWDh6ZXZkQkVYWk16dmFIWHB4ZHRwYzlB?=
 =?utf-8?B?dDR5b2FzKzJGWWRtUk14NFJTUUVrQm9wRURqcGpSd2ppem9ET2xGWjg1ZDdy?=
 =?utf-8?B?aVZicjI2Y2FPd2Y4NkxHZGwrV3UvVjl0WXZaWW8zczFZanpGVDg5cGZCVXkw?=
 =?utf-8?B?MVIzV2w5dElRanRFdUhVcm9zajluZkVETnUyQUxFdWx4VHk5ZUhsMWtwRWVa?=
 =?utf-8?B?c2NpNEFnWGEyMjRRY0ZGck5KdE9OZVBvb1hDUFA0ZXVObGNIKzlUakh2NWlK?=
 =?utf-8?B?OUZrcTJ5R3BRVzFic2hqQmJlQ0d2dmNpWGdpMW1JRHE3UmQrZmFXSkV3ZVpp?=
 =?utf-8?B?NVVlT2V4OXg0RU0zVmNVeEZxWDFaM2paUkRGVXRLS3RodWxTWTdMa3NIQVFE?=
 =?utf-8?B?aW50dkVRNFIwcXdPNmZTbTlwMUU1TDc0czd5UUFDY1RLdVpjdGlvRG95UmNw?=
 =?utf-8?B?MVVONUYvYUFTTTBrWERmNkJYOWozNUZEUUtkN0FGaDBpV3pUaXE1YnhWdE9U?=
 =?utf-8?B?MldFWGZxZUI1OUFMMTQ5eUo5OFFaWndSOG9RTTMzT1NRYlF3R1FubENhUXVW?=
 =?utf-8?B?RHBXKzdtZFRUWlR5STFxWWV5b0lFOWQ2T3RUSGJnVHlteXRuWEsraDVVRjdZ?=
 =?utf-8?B?ZVEwSVVXbDdnR21rNks2Q3IwZDhYclVMMnBUdm5oVTRBZjJHc2ZyVm1wU3BI?=
 =?utf-8?B?NnJ1c25LdE1sUWJhaXQvVWpkQ1hvTXR1T21HK280R0MrOTlxNFhnZzdFNURZ?=
 =?utf-8?B?Y056YjBsbkxEYXFKOUdQQUxncG9DcHNoSmV5WGR2UlZUcHNQQnlEVHdpMDJQ?=
 =?utf-8?B?dm1wVU5tKzRoS2p0ZkRPc0dTK25wNmFpRW1WMmpXdkMxcmZDaUhqLzJodEh4?=
 =?utf-8?B?aXFtVGpNc0h5ZC91UXJ2eEw4R1ErVFNPTzV3cUZBcGpDaTRuMzFvMWc3V3N0?=
 =?utf-8?B?NmZyNC9NWWM4NXRNNXh3dWtGZnlMZk54N2JyY3pkT2JaQTRrZGhhZEt2dThw?=
 =?utf-8?B?YjROV2xsQi82OGJWcXFIWm03OEFMUUh2QVNjOEpRTGc3L2xtdmRodkZYallX?=
 =?utf-8?B?SmdDc2tydDJjSksrb2IyWmV3K0pTN2pMUFBaZlFzQTg2MVRuS0w2OFUvaW5h?=
 =?utf-8?B?U2RqRnhUaVIrMldxRFpJS05OSzZ6cmdWMTU2USs3NkJTaU5pQ2o0RjEvWHNq?=
 =?utf-8?B?ZUZ0ck1nblA2dTdNVFZWM2hzdjlvMUhkY3J1QmRQSnZod2lsNllkY3FDVHJN?=
 =?utf-8?B?YUtHeFBaaVhVY2JtbXQwUFNDZ3pVK3lCb3ErdG9NNGxZT1RZQ1M2TTJnT0tB?=
 =?utf-8?B?RmowMHZjM0YyVUhvVmUvd05jOE0rMmVnVkovbWRZM2NzSlk2cVRKdHBkWjBV?=
 =?utf-8?Q?DmfZtqO2Qt8DCixLCNBsShIch?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f062e746-d5c3-454a-7a32-08dd738313b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:14:56.6533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkM5Z1MlGe/yXaqAEBU4Q4dyI7Y4xNFfrBuo4tznq5EAqtC1N+tKwBy1pfJXiDss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
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

--------------6ev6XXZJ7eFoz90WOzd3aYpc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 03.04.25 um 16:40 schrieb Philipp Stanner:
>>>>>  
>>>>  
>>>> That looks like a really really awkward approach. The driver
>>>> basically uses a the DMA fence infrastructure as middle layer and
>>>> callbacks into itself to cleanup it's own structures.
>>>>  
>>>  
>>> What else are callbacks good for, if not to do something
>>> automatically
>>> when the fence gets signaled?
>>>  
>>  
>>  Well if you add a callback for a signal you issued yourself then
>> that's kind of awkward.
>>  
>>  E.g. you call into the DMA fence code, just for the DMA fence code
>> to call yourself back again.
> Now we're entering CS-Philosophy, because it depends on who "you" and
> "yourself" are. In case of the driver, yes, naturally it registers a
> callback because at some other place (e.g., in the driver's interrupt
> handler) the fence will be signaled and the driver wants the callback
> stuff to be done.
>
> If that's not dma_fences' callbacks' purpose, then I'd be interested in
> knowing what their purpose is, because from my POV this discussion
> seems to imply that we effectively must never use them for anything.
>
> How could it ever be different? Who, for example, registers dma_fence
> callbacks while not signaling them "himself"?

Let me try to improve that explanation.

First of all we have components, they can be drivers, frameworks, helpers like the DRM scheduler or generally any code which is more or less stand alone.

The definition of components is a bit tricky, but in general people usually get what they mean. E.g. in this case here we have nouveau as single component.

Now the DMA fence interface allows sending signals between different components in a standardized way, one component can send a signal to another one and they don't necessarily need to know anything from each other except that both are using the DMA fence framework in the documented manner.

When a component is now both the provide and the consumer at the same time you actually need a reason for that. Could be for example that it wants to consume signals from both itself as well as others, but this doesn't apply for this use case here.

Considering pool or billiard you can of course do a trick shot and try to hit the 8, but going straight for it just has a better chance to succeed.

>
>
>>  
>>  
>>>  
>>>>  
>>>> Additional to that we don't guarantee any callback order for the
>>>> DMA
>>>> fence and so it can be that mix cleaning up the callback with
>>>> other
>>>> work which is certainly not good when you want to guarantee that
>>>> the
>>>> cleanup happens under the same lock.
>>>>  
>>>  
>>> Isn't my perception correct that the primary issue you have with
>>> this
>>> approach is that dma_fence_put() is called from within the
>>> callback? Or
>>> do you also take issue with deleting from the list?
>>>  
>>  
>>  Well kind of both. The issue is that the caller of
>> dma_fence_signal() or dma_fence_signal_locked() must hold the
>> reference until the function returns.
>>  
>>  When you do the list cleanup and the drop inside the callback it is
>> perfectly possible that the fence pointer becomes stale before you
>> return and that's really not a good idea.
> In other words, you would prefer if this patch would have a function
> with my callback's code in a function, and that function would be
> called at every place where the driver signals a fence?
>
> If that's your opinion, then, IOW, it would mean for us to go almost
> back to status quo, with nouveau_fence_signal2.0, but with the
> dma_fence_is_signaled() part fixed.

Well it could potentially be cleaned up more, but as far as I can see only the two lines I pointed out in the other mail need to move at the right place, yes.

I mean it's just two lines. If you open code that or if you make a nouveau_cleanup_list_ref() function (or similar) is perfectly up to you.

Regards,
Christian.

>
>
> P.
>
>>  
>>  
>>>  
>>>
>>>  
>>>>  
>>>> Instead the call to dma_fence_signal_locked() should probably be
>>>> removed from nouveau_fence_signal() and into
>>>> nouveau_fence_context_kill() and nouveau_fence_update().
>>>>
>>>> This way nouveau_fence_is_signaled() can call this function as
>>>> well.
>>>>  
>>>  
>>> Which "this function"? dma_fence_signal_locked()
>>>  
>>  
>>  No the cleanup function for the list entry. Whatever you call that
>> then, the name nouveau_fence_signal() is probably not appropriate any
>> more.
>>  
>>  
>>>  
>>>
>>>  
>>>>  
>>>> BTW: nouveau_fence_no_signaling() looks completely broken as
>>>> well. It
>>>> calls nouveau_fence_is_signaled() and then list_del() on the
>>>> fence
>>>> head.
>>>>  
>>>  
>>> I can assure you that a great many things in Nouveau look
>>> completely
>>> broken.
>>>
>>> The question for us is always the cost-benefit-ratio when fixing
>>> bugs.
>>> There are fixes that solve the bug with reasonable effort, and
>>> there
>>> are great reworks towards an ideal state.
>>>  
>>  
>>  I would just simply drop that function. As far as I can see it
>> severs no purpose other than doing exactly what the common DMA fence
>> code does anyway.
>>  
>>  Just one less thing which could fail.
>>  
>>  Christian.
>>  
>>  
>>>  
>>>
>>> P.
>>>
>>>
>>>  
>>>>  
>>>> As far as I can see that is completely superfluous and should
>>>> probably be dropped. IIRC I once had a patch to clean that up but
>>>> it
>>>> was dropped for some reason.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>  
>>>>>  
>>>>> +	dma_fence_put(&fence->base);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>  	ret = fctx->emit(fence);
>>>>>  	if (!ret) {
>>>>>  		dma_fence_get(&fence->base);
>>>>> @@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence
>>>>> *fence)
>>>>>  			return -ENODEV;
>>>>>  		}
>>>>>  
>>>>> -		if (nouveau_fence_update(chan, fctx))
>>>>> -			nvif_event_block(&fctx->event);
>>>>> +		nouveau_fence_update(chan, fctx);
>>>>>  
>>>>>  		list_add_tail(&fence->head, &fctx->pending);
>>>>>  		spin_unlock_irq(&fctx->lock);
>>>>> @@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence
>>>>> *fence)
>>>>>  
>>>>>  		spin_lock_irqsave(&fctx->lock, flags);
>>>>>  		chan = rcu_dereference_protected(fence-
>>>>>> channel,
>>>>> lockdep_is_held(&fctx->lock));
>>>>> -		if (chan && nouveau_fence_update(chan, fctx))
>>>>> -			nvif_event_block(&fctx->event);
>>>>> +		if (chan)
>>>>> +			nouveau_fence_update(chan, fctx);
>>>>>  		spin_unlock_irqrestore(&fctx->lock, flags);
>>>>>  	}
>>>>>  	return dma_fence_is_signaled(&fence->base);
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>>>> index 8bc065acfe35..e6b2df7fdc42 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>>>> @@ -10,6 +10,7 @@ struct nouveau_bo;
>>>>>  
>>>>>  struct nouveau_fence {
>>>>>  	struct dma_fence base;
>>>>> +	struct dma_fence_cb cb;
>>>>>  
>>>>>  	struct list_head head;
>>>>>  
>>>>>  
>>>>   
>>>   
>>  
>>  

--------------6ev6XXZJ7eFoz90WOzd3aYpc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.04.25 um 16:40 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">&nbsp;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">&nbsp;
That looks like a really really awkward approach. The driver
basically uses a the DMA fence infrastructure as middle layer and
callbacks into itself to cleanup it's own structures.
&nbsp;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;
What else are callbacks good for, if not to do something
automatically
when the fence gets signaled?
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;Well if you add a callback for a signal you issued yourself then
that's kind of awkward.
&nbsp;
&nbsp;E.g. you call into the DMA fence code, just for the DMA fence code
to call yourself back again.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Now we're entering CS-Philosophy, because it depends on who &quot;you&quot; and
&quot;yourself&quot; are. In case of the driver, yes, naturally it registers a
callback because at some other place (e.g., in the driver's interrupt
handler) the fence will be signaled and the driver wants the callback
stuff to be done.

If that's not dma_fences' callbacks' purpose, then I'd be interested in
knowing what their purpose is, because from my POV this discussion
seems to imply that we effectively must never use them for anything.

How could it ever be different? Who, for example, registers dma_fence
callbacks while not signaling them &quot;himself&quot;?</pre>
    </blockquote>
    <br>
    Let me try to improve that explanation.<br>
    <br>
    First of all we have components, they can be drivers, frameworks,
    helpers like the DRM scheduler or generally any code which is more
    or less stand alone.<br>
    <br>
    The definition of components is a bit tricky, but in general people
    usually get what they mean. E.g. in this case here we have nouveau
    as single component.<br>
    <br>
    Now the DMA fence interface allows sending signals between different
    components in a standardized way, one component can send a signal to
    another one and they don't necessarily need to know anything from
    each other except that both are using the DMA fence framework in the
    documented manner.<br>
    <br>
    When a component is now both the provide and the consumer at the
    same time you actually need a reason for that. Could be for example
    that it wants to consume signals from both itself as well as others,
    but this doesn't apply for this use case here.<br>
    <br>
    Considering pool or billiard you can of course do a trick shot and
    try to hit the 8, but going straight for it just has a better chance
    to succeed.<br>
    <br>
    <blockquote type="cite" cite="mid:36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
&nbsp;
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">&nbsp;
Additional to that we don't guarantee any callback order for the
DMA
fence and so it can be that mix cleaning up the callback with
other
work which is certainly not good when you want to guarantee that
the
cleanup happens under the same lock.
&nbsp;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;
Isn't my perception correct that the primary issue you have with
this
approach is that dma_fence_put() is called from within the
callback? Or
do you also take issue with deleting from the list?
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;Well kind of both. The issue is that the caller of
dma_fence_signal() or dma_fence_signal_locked() must hold the
reference until the function returns.
&nbsp;
&nbsp;When you do the list cleanup and the drop inside the callback it is
perfectly possible that the fence pointer becomes stale before you
return and that's really not a good idea.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In other words, you would prefer if this patch would have a function
with my callback's code in a function, and that function would be
called at every place where the driver signals a fence?

If that's your opinion, then, IOW, it would mean for us to go almost
back to status quo, with nouveau_fence_signal2.0, but with the
dma_fence_is_signaled() part fixed.</pre>
    </blockquote>
    <br>
    Well it could potentially be cleaned up more, but as far as I can
    see only the two lines I pointed out in the other mail need to move
    at the right place, yes.<br>
    <br>
    I mean it's just two lines. If you open code that or if you make a
    nouveau_cleanup_list_ref() function (or similar) is perfectly up to
    you.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:36b076dc17083f9edd9b100bd8fa57badde41158.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">


P.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;

&nbsp;
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">&nbsp;
Instead the call to dma_fence_signal_locked() should probably be
removed from nouveau_fence_signal() and into
nouveau_fence_context_kill() and nouveau_fence_update().

This way nouveau_fence_is_signaled() can call this function as
well.
&nbsp;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;
Which &quot;this function&quot;? dma_fence_signal_locked()
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;No the cleanup function for the list entry. Whatever you call that
then, the name nouveau_fence_signal() is probably not appropriate any
more.
&nbsp;
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;

&nbsp;
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">&nbsp;
BTW: nouveau_fence_no_signaling() looks completely broken as
well. It
calls nouveau_fence_is_signaled() and then list_del() on the
fence
head.
&nbsp;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;
I can assure you that a great many things in Nouveau look
completely
broken.

The question for us is always the cost-benefit-ratio when fixing
bugs.
There are fixes that solve the bug with reasonable effort, and
there
are great reworks towards an ideal state.
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;I would just simply drop that function. As far as I can see it
severs no purpose other than doing exactly what the common DMA fence
code does anyway.
&nbsp;
&nbsp;Just one less thing which could fail.
&nbsp;
&nbsp;Christian.
&nbsp;
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;

P.


&nbsp;
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">&nbsp;
As far as I can see that is completely superfluous and should
probably be dropped. IIRC I once had a patch to clean that up but
it
was dropped for some reason.

Regards,
Christian.


&nbsp;
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">&nbsp;
+	dma_fence_put(&amp;fence-&gt;base);
+	if (ret)
+		return ret;
+
&nbsp;	ret = fctx-&gt;emit(fence);
&nbsp;	if (!ret) {
&nbsp;		dma_fence_get(&amp;fence-&gt;base);
@@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence
*fence)
&nbsp;			return -ENODEV;
&nbsp;		}
&nbsp;
-		if (nouveau_fence_update(chan, fctx))
-			nvif_event_block(&amp;fctx-&gt;event);
+		nouveau_fence_update(chan, fctx);
&nbsp;
&nbsp;		list_add_tail(&amp;fence-&gt;head, &amp;fctx-&gt;pending);
&nbsp;		spin_unlock_irq(&amp;fctx-&gt;lock);
@@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence
*fence)
&nbsp;
&nbsp;		spin_lock_irqsave(&amp;fctx-&gt;lock, flags);
&nbsp;		chan = rcu_dereference_protected(fence-
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">channel,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">lockdep_is_held(&amp;fctx-&gt;lock));
-		if (chan &amp;&amp; nouveau_fence_update(chan, fctx))
-			nvif_event_block(&amp;fctx-&gt;event);
+		if (chan)
+			nouveau_fence_update(chan, fctx);
&nbsp;		spin_unlock_irqrestore(&amp;fctx-&gt;lock, flags);
&nbsp;	}
&nbsp;	return dma_fence_is_signaled(&amp;fence-&gt;base);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..e6b2df7fdc42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -10,6 +10,7 @@ struct nouveau_bo;
&nbsp;
&nbsp;struct nouveau_fence {
&nbsp;	struct dma_fence base;
+	struct dma_fence_cb cb;
&nbsp;
&nbsp;	struct list_head head;
&nbsp;
&nbsp;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6ev6XXZJ7eFoz90WOzd3aYpc--
