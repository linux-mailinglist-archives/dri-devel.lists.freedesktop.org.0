Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B01937751
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 13:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7236B10EBEA;
	Fri, 19 Jul 2024 11:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Hp9EJhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E210EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAXtvhyAVWCOQ4vGC4iMuU6jPZlnQe8vBiwYJfzteqnWoZYKdmUt7k00PQ8CYwEOK6dGHhp3Bs8yT2E5g7HaX+ekyVGPaWoushnGeTeAcdOJnKXeU0wsZz2kmlNn0rKglYluLVtvHORPhuTUZGtnWV/IyDDGWudApV9KLXs45jv0nZqcpSU3hefkBK0QNx4YFOoeXLqpXYSJgA9IzfeQDnal95VaGNS876SiER5NhEvMd//6AGqZUOuuodMHVxHdbJWrPZXWHNYNtQ5E+eAq3VSSZldOcbCBMGJo0qww/nKF4nbeq+zaKtXy9k3DzbWSmowEFWwuS5vt8K5GTcj3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXU2hJo52rc9cgyON+XbrjktVe3ZTZ2A7eWKOiqp0LY=;
 b=wcPdTgSKVouJIj2H1lDtjibgzIm7RDU8zfYmJirwCrO3Ov7QifQRXiPuc4jCMKboeZ//DJvmrPHKLnn8cwOG96uVG6osZnqtAXfyrA13nVPtYjaSAUdZ8MmytUmWSC4Kkc72shK00btK0Yto9ob0+rGFDoZYJ/HhKPdI8zScwoddHtDwSyY76MlIRpk61yBCft9rvZnB/bWYmWMUR9GAKAe87wJBtLyKv2wSAk6yG8PVI2BNT+9bHhHPfuP7/YbYbLUmijVvvXFhxtM5TbMWDJvbawRqhSfhhzlcpS32lC9YHowrtj9NxzQo9q6/sUUEOOfODkWyNiiGGuR/xoFn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXU2hJo52rc9cgyON+XbrjktVe3ZTZ2A7eWKOiqp0LY=;
 b=1Hp9EJhqlI42TwwlriFbz9OrhuAxLG6hFAxE+9PhXrWgqh/Rr/GLUYeODguqDVwWVxiAKyluMaEr57k4qhA8BZI+uDtttspV/HS/jhb/X8WmcxipTCKsqIkLXia3kdjQ2RX2+wytLdjthyTgiyoSkwuIY8ylkWgA7Rzjiu/2gMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 11:51:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 11:51:08 +0000
Message-ID: <d1bd1e59-1d6d-4ec4-a2f6-740015cbcdff@amd.com>
Date: Fri, 19 Jul 2024 13:51:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
To: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dakr@redhat.com, airlied@gmail.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20231116141547.206695-1-christian.koenig@amd.com>
 <12bfeb46149e77dc04a4d158be6a28af55fc4c43.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <12bfeb46149e77dc04a4d158be6a28af55fc4c43.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 163c4cc1-9915-4b86-856a-08dca7e913d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWFveHJPSkdNTk9JWkZ5TS9hUlFKSEIxZXloNm1ZbzRMRVdEekEvU3pvM3RZ?=
 =?utf-8?B?VHFBM04rNGVxOC9OcW9ZRnVQR2Z3b25Ec211OFpyMHA1TlcrSURzeERQK2Ez?=
 =?utf-8?B?QS9oazBSa2kzcy9kVk53VW1OZStKOHVFdWh5NDVHcHRmNm5HVkpHVW16OVFP?=
 =?utf-8?B?a05wMzhXSDlXNlVDclpSOW9WNU9hUjBPTVRWQjhhaSt1VitPem1OejRicGpk?=
 =?utf-8?B?b01aaUNyVGx5a0k1Lzl2YWdnWDlzL0pXRlE2Sy81Z3YwMXJKYURaNGlVVjVn?=
 =?utf-8?B?QTRJNmh4ZlBjR2tzK0RFR3JEQkdYRHhTanR5TUpnQjZYQzdlbCtjaDZhUVZa?=
 =?utf-8?B?aXVJdzdrcGpVRVEzSDlicjRlM0xPQUU1ejY0Q2VxaHo0SVNHb0JYTEFQM3Rw?=
 =?utf-8?B?aFN3QW1lQjFXQXZTenl2aENHbURkVFVzbVpVN1k4QkZaNUtad0dvVHNRMy81?=
 =?utf-8?B?UTMraDVBUVRZRmtYT1hzaDZxU3NaYjRTV0dzSU04M08yVEora2o0RkRTaFBj?=
 =?utf-8?B?SGttUkp5UWJSWHRtUFVabVFPTEhFaTJYenp0aVVMcmZXK2psdVhQSS9WcDhi?=
 =?utf-8?B?Zk9wWlZoTG9yVlNRRy93azE5UmZlRktTcWpmZStkV1d3NG9KZ2Y1dzd6ekNQ?=
 =?utf-8?B?WFV0NEZEb0hoeFVHZjVlL1NXcGplU3RuWmIyakJHa1Rkb0YwUXpJRjd3UHRk?=
 =?utf-8?B?bnB0WVMzdlhlMjVDVisra0p0eS9CUkZMRU1ZQW1JK09uNWtUaGw2MjhRQngy?=
 =?utf-8?B?VGx0VTgzYStCZGNKY1kvUDFjdkd0NHhWSVhtUzFBYTFZemtTbzMyNHZEL1Bs?=
 =?utf-8?B?Rk1nRERlMHJqKzVQOWgrZW1vNUFpWVZJZVBra2d4THBMZmhmQUNhSndyQ1Z2?=
 =?utf-8?B?ZTIyV080SDVkSDhWK0tLMHVocWF1a3V4a1g2a3V6eGxGRXZMNFpCckRZOU1W?=
 =?utf-8?B?MEhQRG1zTGxYaVBSVUlKdmxzUHdQNVAzNW16OFN3Y0hWNkhSRG9PYTlKNlZj?=
 =?utf-8?B?cnNyZUl0WDUycmdnY0pnU2VLbkZGQzJKN0wwT3VUVWZMNWZhYnBvTzkwaDB6?=
 =?utf-8?B?MXUvSXJXcmI4a2g3QzZ5Qm9VdUpKSmcrWG9EZVM3RFc3WXZRaU5JVmtWK05G?=
 =?utf-8?B?SHJLTjRMK2EyaDZmMWp5Qys3NStyN2NJMEJTK0JVblNXUlRaWGhFOHViU1NR?=
 =?utf-8?B?Y3V1MmhrcWRUcG9lQko5OStxR3JnMFJ5UUFiVzE5UlVNc3RSTkNMWFZhazBY?=
 =?utf-8?B?d3FDOTBzdThVaFhNM2s0TWVQMGQ5dlNxblVpZXJtOWk4YzhWaW1FNGU3bVZk?=
 =?utf-8?B?djlUclJqWmxuRjZPNElYZk94L2R0OFduY1NoWkRzeVV0anhmcGJFQnlBTm9O?=
 =?utf-8?B?d1hibXY1ZTNOdUdIWGR0eU5UazQ5QkJ5MGo5RUJuN1dhbEo0VEpXK3VXK0Jt?=
 =?utf-8?B?REgyM244VU8rUnVyWitNMDREQjZiNUk2ak1vQmJnb2lBeDYwdHRpZCt6N3k4?=
 =?utf-8?B?STh2Z29pWjFGR25Xb25XTVhLTDVWZXprYXRwZlRtSGErdTAwam1NR2tWR2FX?=
 =?utf-8?B?ZHR4cUxOc21QeDBmTFUzbFk0bzZQbkRSYXd0OFVPSHR2Y0thRVRFRWpmYi9y?=
 =?utf-8?B?eTg1cWovUTFhTHRGN3BIVFpzeDliQ09uSTBoVHRaYXVXK25wNE5SSldZV3lP?=
 =?utf-8?B?eTFQT2NtSzJyNG5pNjVPRGh1RUoyTU1wU1RocXN5MDZNZmhXTVZ1THVFaVNa?=
 =?utf-8?B?RVhXRUZtd0ZXY0QzNHNoZEx6OTlLTkY4ZGRXZmRsQm5yeFVyU2k0MGVyaERV?=
 =?utf-8?B?RFEyTkdaMFpqVXR4TkZ5RSt4dnM1VlkvVWZTZDdoNXFzZjZpZHl0NVZsRmI0?=
 =?utf-8?Q?Il2ogQ33hWR21?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTEyVHRyTDBhK2dIZW03Z1ZCVk9pdWxDRVZKYmJHdWRTVm5yNnR2OCtiUmRS?=
 =?utf-8?B?RDIzZnljUldVamRPemUxK05UNDMzdHdDeHRlWnpBdE5mM3U5cU5MNDhRRGN5?=
 =?utf-8?B?bEM5VVZpWUJka2RtSEFFMWtjYkVCKytac3VIbjJsSEJEeGttaTE3bFZzMUx4?=
 =?utf-8?B?MmlYSU5qRHR0bUNFR2owT05zdVBwNGRra3REdzRUcGc3WHoyVTJKVC8zMk94?=
 =?utf-8?B?QjlQV1ozUWxaUU9qU2ZBaXFUeGFvRWZ0eDdnYTFqalFEZHl5d2Ftb2I3ZzU5?=
 =?utf-8?B?Y3hXaUUvWjBYeldqT29rZ3FiRGtMQXBhVFhBL1JESVhIS1F0UVlQOTV2V3pi?=
 =?utf-8?B?Y0orOWZPdnh2Zm0wdHNaY2FNdkxQWXBvYTd1OGthQnFHc0lsZ0FCTVJwUXFG?=
 =?utf-8?B?MmY3ajlMRFlkNXRPOUhrbHo1eVFYcnZOMkJCYWVRUXFwdVlvQml3L0ljbFVs?=
 =?utf-8?B?WVBzU1pCS3E2Ri9Ebit3Q0h1Y1ZkdnI0Ym04SEFQdEdFR3ZiV2JiODIrQytr?=
 =?utf-8?B?bE9FOVpxbExpdVVvWjQzZXgwVE9CamlsQkcyeU1FOHJkVE5iOERpVjJzSENR?=
 =?utf-8?B?MWpCZCtZNExISUpqWHhPUjVJdDVjQlVYTWIrMFlsVVlBRXVHaldqbnlwVDBy?=
 =?utf-8?B?c1ZoSmZrT0pvKzZKNVQ3SncyaHlUVm5ONEg3N1I5Ny9YbUVmclJ4bUtZUHlC?=
 =?utf-8?B?eWsxdkFOK2NHZmVCT0hXQlVHczFwVDhGWFo1NXJ6S1lmS0VlY0d5cVdiMkJo?=
 =?utf-8?B?dC92cmtCOGpGcEIrUElXeDNzdU1uUGhlZGI2WnJ0MnRQOXRwcEZnOVN0VFRF?=
 =?utf-8?B?ZVFsaDI1TllzdFBkUENRN0NTaFZyL2lQaXJtenJKRnlWYlFUM0RIbDRwcmFU?=
 =?utf-8?B?UzlveFdrK1FEZlFtVWx6L3dRaEN3NEl2QkU5bWdNMk1wUUMzOXIzbVowNG1k?=
 =?utf-8?B?R0d1VmpVbFZpcFVubDRyQld5VHlBdmdwQVFDK0pac25qS3NaT0FsWEtNOG4r?=
 =?utf-8?B?YUNPR0o2YkdlM3FzcnhMMGl2bnYveVNWYlNwUGFpVk9ERmRVelM5V0lHNkdB?=
 =?utf-8?B?ZTdnMGdxb2QwMHJaQnhPNGhzdlNZckFQWW1abUhXVjYwWFl5V0gzc1hFY09l?=
 =?utf-8?B?enNnQmloQzNSM1BFUlZyR2lyRitPYXBqdUFWTFRuWnAvallhTVRDWWNlQWtO?=
 =?utf-8?B?cm5wdHhCbnY1MTNUYXlINEhNUGk0dFhIS1N0NmhCd0ZnbW1QT3h4d1RhUlZz?=
 =?utf-8?B?cVR6c210WCtKR3Y5ako2aEhSMHcwY2lya2NzcEFJQUQ5RkIwMlM3TitxeTBG?=
 =?utf-8?B?dTdRVThiMTFCakoxTGpLd3VkbVNKUGdQZlJ5QmZaS0x6SWdvMUZra1JKWWdM?=
 =?utf-8?B?OUNBcVFUNDc3WFc0dkFtYjFYeTVSU0RXcVNTbUQrTWpvam5mMVBERm16N2ZE?=
 =?utf-8?B?YzNUaWk5U3FlSmRKakRrUXAvN05rdWxibGE0ZGlhdExnSFhjTVV5ZmhoWWdY?=
 =?utf-8?B?eGxuRXpOTTNHTnk5Y2dqU0M4SDVYNEJWejhhMlBsdUMwN29SSXhrNVZ2TE42?=
 =?utf-8?B?Vm94OWxlSEJ6RVhLcDNtYlpNcWJ4MzNsekRXUW9yaFpUNkpOS1dMRU5Mcmt3?=
 =?utf-8?B?bEg5U1RZM1lWYzl5TG1nRFRNQXNEN2lRUFBQeHB4UnJ6RWJFeHRoU1VNenh5?=
 =?utf-8?B?eEU2TitPZm5LaVBHZktxL3FrVElwZzJpMkRBWUJhUGRETkhGZU02SGtCV2lC?=
 =?utf-8?B?RzRPWFNub1RJNG9kYlpoOVpPNUwvYy9kdnZWaWIvak9kWUdYUmhrbDV0STBH?=
 =?utf-8?B?MHRTdHd2SDYrSlRrKzNITnV4YjhBVnBYWlZmbCtSdUhveXpkUmxjSGQ2czRX?=
 =?utf-8?B?YTNpVVpxSWVPNE0vOWRqRWlBZFNpUm83WHVnd1FIdjJ3SzRISlRjR0pVQ0pB?=
 =?utf-8?B?TzlOY0JWUWdtcnVZRkNUM2x2YXJxTlZZZzh3UjBiOHUxUnlWQ2ZYV3RwNmZQ?=
 =?utf-8?B?aWFCUzh6Q0MvdmREc250a2JBTVVSRWtIc29yNmUvUXd6TnNTbVYwS3FFdXhU?=
 =?utf-8?B?SittbTRzNjNpN0dxc2JnekF4Z0l5TldVdkxTSVN5Z0JxN3QwdXJkL2RJN1Nw?=
 =?utf-8?Q?tFCm3yn241slgsME6OIdd+dsJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163c4cc1-9915-4b86-856a-08dca7e913d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 11:51:08.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+vJLry7JC8WBq4k7Fj5HStdZVJMjX3mVMUAULx1tb8HuzpihBgdlZU3dJZzEWKD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
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

Am 19.07.24 um 12:29 schrieb Philipp Stanner:
> On Thu, 2023-11-16 at 15:15 +0100, Christian König wrote:
>> Start to improve the scheduler document. Especially document the
>> lifetime of each of the objects as well as the restrictions around
>> DMA-fence handling and userspace compatibility.
> Hallo Christian,
>
> thanks for working on this.
>
> I'm currently looking deeper into the scheduler and am documenting the
> pitfalls etc. that I have found so far.
>
>
> What are your current plans with this documentation series? If you
> don't intend to get it upstreamed in the foreseeable future, I would
> like to hijack the series and use it as a basis for my own improvements
> to the documentation.
>
> Please tell me what you think,

Feel free to pick that up, I have around 10 different upstream things on 
my backlog at the moment and it didn't got any smaller since the 
beginning of the year :(

I really need to sort out my time management to be able to work on 
upstream stuff without getting interrupted by anything AMD internal.

Cheers,
Christian.

>
>
> Regards,
> P.
>
>
>> v2: Some improvements suggested by Danilo, add section about error
>>      handling.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/gpu/drm-mm.rst           |  36 +++++
>>   drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++--
>> --
>>   2 files changed, 188 insertions(+), 22 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-
>> mm.rst
>> index acc5901ac840..112463fa9f3a 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -552,12 +552,48 @@ Overview
>>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>      :doc: Overview
>>   
>> +Job Object
>> +----------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Job Object
>> +
>> +Entity Object
>> +-------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Entity Object
>> +
>> +Hardware Fence Object
>> +---------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Hardware Fence Object
>> +
>> +Scheduler Fence Object
>> +----------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Scheduler Fence Object
>> +
>> +Scheduler and Run Queue Objects
>> +-------------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Scheduler and Run Queue Objects
>> +
>>   Flow Control
>>   ------------
>>   
>>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>>      :doc: Flow Control
>>   
>> +Error and Timeout handling
>> +--------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>> +   :doc: Error and Timeout handling
>> +
>>   Scheduler Function References
>>   -----------------------------
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 044a8c4875ba..026123497b0e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -24,28 +24,122 @@
>>   /**
>>    * DOC: Overview
>>    *
>> - * The GPU scheduler provides entities which allow userspace to push
>> jobs
>> - * into software queues which are then scheduled on a hardware run
>> queue.
>> - * The software queues have a priority among them. The scheduler
>> selects the entities
>> - * from the run queue using a FIFO. The scheduler provides
>> dependency handling
>> - * features among jobs. The driver is supposed to provide callback
>> functions for
>> - * backend operations to the scheduler like submitting a job to
>> hardware run queue,
>> - * returning the dependencies of a job etc.
>> - *
>> - * The organisation of the scheduler is the following:
>> - *
>> - * 1. Each hw run queue has one scheduler
>> - * 2. Each scheduler has multiple run queues with different
>> priorities
>> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
>> - * 3. Each scheduler run queue has a queue of entities to schedule
>> - * 4. Entities themselves maintain a queue of jobs that will be
>> scheduled on
>> - *    the hardware.
>> - *
>> - * The jobs in a entity are always scheduled in the order that they
>> were pushed.
>> - *
>> - * Note that once a job was taken from the entities queue and pushed
>> to the
>> - * hardware, i.e. the pending queue, the entity must not be
>> referenced anymore
>> - * through the jobs entity pointer.
>> + * The GPU scheduler implements some logic to decide which command
>> submission
>> + * to push next to the hardware. Another major use case of the GPU
>> scheduler
>> + * is to enforce correct driver behavior around those command
>> submissions.
>> + * Because of this it's also used by drivers which don't need the
>> actual
>> + * scheduling functionality.
>> + *
>> + * All callbacks the driver needs to implement are restricted by
>> DMA-fence
>> + * signaling rules to guarantee deadlock free forward progress. This
>> especially
>> + * means that for normal operation no memory can be allocated in a
>> callback.
>> + * All memory which is needed for pushing the job to the hardware
>> must be
>> + * allocated before arming a job. It also means that no locks can be
>> taken
>> + * under which memory might be allocated as well.
>> + *
>> + * Memory which is optional to allocate, for example for device core
>> dumping or
>> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate
>> error
>> + * handling taking if that allocation fails. GFP_ATOMIC should only
>> be used if
>> + * absolutely necessary since dipping into the special atomic
>> reserves is
>> + * usually not justified for a GPU driver.
>> + */
>> +
>> +/**
>> + * DOC: Job Object
>> + *
>> + * The base job object contains submission dependencies in the form
>> of DMA-fence
>> + * objects. Drivers can also implement an optional prepare_job
>> callback which
>> + * returns additional dependencies as DMA-fence objects. It's
>> important to note
>> + * that this callback can't allocate memory or grab locks under
>> which memory is
>> + * allocated.
>> + *
>> + * Drivers should use this as base class for an object which
>> contains the
>> + * necessary state to push the command submission to the hardware.
>> + *
>> + * The lifetime of the job object should at least be from pushing it
>> into the
>> + * scheduler until the scheduler notes through the free callback
>> that a job
>> + * isn't needed any more. Drivers can of course keep their job
>> object alive
>> + * longer than that, but that's outside of the scope of the
>> scheduler
>> + * component. Job initialization is split into two parts,
>> drm_sched_job_init()
>> + * and drm_sched_job_arm(). It's important to note that after arming
>> a job
>> + * drivers must follow the DMA-fence rules and can't easily allocate
>> memory
>> + * or takes locks under which memory is allocated.
>> + */
>> +
>> +/**
>> + * DOC: Entity Object
>> + *
>> + * The entity object which is a container for jobs which should
>> execute
>> + * sequentially. Drivers should create an entity for each individual
>> context
>> + * they maintain for command submissions which can run in parallel.
>> + *
>> + * The lifetime of the entity should *not* exceed the lifetime of
>> the
>> + * userspace process it was created for and drivers should call the
>> + * drm_sched_entity_flush() function from their
>> file_operations.flush
>> + * callback. So it's possible that an entity object is not alive any
>> + * more while jobs from it are still running on the hardware.
>> + *
>> + * Background is that for compatibility reasons with existing
>> + * userspace all results of a command submission should become
>> visible
>> + * externally even after after a process exits. This is normal POSIX
>> behavior
>> + * for I/O operations.
>> + *
>> + * The problem with this approach is that GPU submissions contain
>> executable
>> + * shaders enabling processes to evade their termination by
>> offloading work to
>> + * the GPU. So when a process is terminated with a SIGKILL the
>> entity object
>> + * makes sure that jobs are freed without running them while still
>> maintaining
>> + * correct sequential order for signaling fences.
>> + */
>> +
>> +/**
>> + * DOC: Hardware Fence Object
>> + *
>> + * The hardware fence object is a DMA-fence provided by the driver
>> as result of
>> + * running jobs. Drivers need to make sure that the normal DMA-fence
>> semantics
>> + * are followed for this object. It's important to note that the
>> memory for
>> + * this object can *not* be allocated in the run_job callback since
>> that would
>> + * violate the requirements for the DMA-fence implementation. The
>> scheduler
>> + * maintains a timeout handler which triggers if this fence doesn't
>> signal in
>> + * a configurable time frame.
>> + *
>> + * The lifetime of this object follows DMA-fence ref-counting rules,
>> the
>> + * scheduler takes ownership of the reference returned by the driver
>> and drops
>> + * it when it's not needed any more.
>> + */
>> +
>> +/**
>> + * DOC: Scheduler Fence Object
>> + *
>> + * The scheduler fence object which encapsulates the whole time from
>> pushing
>> + * the job into the scheduler until the hardware has finished
>> processing it.
>> + * This is internally managed by the scheduler, but drivers can grab
>> additional
>> + * reference to it after arming a job. The implementation provides
>> DMA-fence
>> + * interfaces for signaling both scheduling of a command submission
>> as well as
>> + * finishing of processing.
>> + *
>> + * The lifetime of this object also follows normal DMA-fence ref-
>> counting
>> + * rules. The finished fence is the one normally exposed outside of
>> the
>> + * scheduler, but the driver can grab references to both the
>> scheduled as well
>> + * as the finished fence when needed for pipe-lining optimizations.
>> + */
>> +
>> +/**
>> + * DOC: Scheduler and Run Queue Objects
>> + *
>> + * The scheduler object itself does the actual work of selecting a
>> job and
>> + * pushing it to the hardware. Both FIFO and RR selection algorithm
>> are
>> + * supported, but FIFO is preferred for many use cases.
>> + *
>> + * The lifetime of the scheduler is managed by the driver using it.
>> Before
>> + * destroying the scheduler the driver must ensure that all hardware
>> processing
>> + * involving this scheduler object has finished by calling for
>> example
>> + * disable_irq(). It is *not* sufficient to wait for the hardware
>> fence here
>> + * since this doesn't guarantee that all callback processing has
>> finished.
>> + *
>> + * The run queue object is a container of entities for a certain
>> priority
>> + * level. This object is internally managed by the scheduler and
>> drivers
>> + * shouldn't touch them directly. The lifetime of run queues are
>> bound to the
>> + * schedulers lifetime.
>>    */
>>   
>>   /**
>> @@ -72,6 +166,42 @@
>>    * limit.
>>    */
>>   
>> +/**
>> + * DOC: Error and Timeout handling
>> + *
>> + * Errors schould be signaled by using dma_fence_set_error() on the
>> hardware
>> + * fence object before signaling it. Errors are then bubbled up from
>> the
>> + * hardware fence to the scheduler fence.
>> + *
>> + * The entity allows querying errors on the last run submission
>> using the
>> + * drm_sched_entity_error() function which can be used to cancel
>> queued
>> + * submissions in the run_job callback as well as preventing pushing
>> further
>> + * ones into the entity in the drivers submission function.
>> + *
>> + * When the hardware fence fails to signal in a configurable amount
>> of time the
>> + * timedout_job callback is issued. The driver should then follow
>> the procedure
>> + * described on the &struct drm_sched_backend_ops.timedout_job
>> callback (TODO:
>> + * The timeout handler should probably switch to using the hardware
>> fence as
>> + * parameter instead of the job. Otherwise the handling will always
>> race
>> + * between timing out and signaling the fence).
>> + *
>> + * The scheduler also used to provided functionality for re-
>> submitting jobs
>> + * with replacing the hardware fence during reset handling. This
>> functionality
>> + * is now marked as deprecated. This has proven to be fundamentally
>> racy and
>> + * not compatible with DMA-fence rules and shouldn't be used in any
>> new code.
>> + *
>> + * Additional there is the drm_sched_increase_karma() function which
>> tries to
>> + * find the entity which submitted a job and increases it's 'karma'
>> + * atomic variable to prevent re-submitting jobs from this entity.
>> This has
>> + * quite some overhead and re-submitting jobs is now marked as
>> deprecated. So
>> + * using this function is rather discouraged.
>> + *
>> + * Drivers can still re-create the GPU state should it be lost
>> during timeout
>> + * handling when they can guarantee that forward progress is made
>> and this
>> + * doesn't cause another timeout. But this is strongly hardware
>> specific and
>> + * out of the scope of the general GPU scheduler.
>> + */
>> +
>>   #include <linux/wait.h>
>>   #include <linux/sched.h>
>>   #include <linux/completion.h>

