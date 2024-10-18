Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480349A3EED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2CD10E90C;
	Fri, 18 Oct 2024 12:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mtxK7hII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFEB10E908;
 Fri, 18 Oct 2024 12:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNSemtYQu282VHpFg6NKnd+4TfrJfwEGqYkIXWBZtLLIGGG/WDMmcTIe9W6nutJmBsgAfbFwcAx9nZikqL79Apx0KXJK1ck/iulwte088nGgegkMv36XhuladOBpLRPjCuQg2YDhz0Kc3ULYT2tmkTBnaa20jBzYYZQ+lT4E3uDV88bvl+mFcsmqBpEEvgRhKSfZzD88AF7yv0xcUmKwsj7eHXquCbzauOLvTWxPBKxIrJkMsn6UT7Llbk2/0ms/GV3AooMd/N8pV8NMhCyRb42PzjehIzquziievgyLL1wGwAgjDfox2WtqvM/MU/Q95phFyO7xfVtC/p7LBeJX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=481a1s/F4y8YYYtyFRvN94OtPguDpfTl0SIKXpw6B7E=;
 b=kGvm+vwrWipegFK/tNPO5Mf320Hqk92euCfDCbd0BHxf0PGarlftp1mgHA/tSmd7CyeGi/FgL2epFohQ325OCkQkZsDAYzUq3F2KFwYeJkhM2eTy9I/DrOAfJA3NIgmgzAMeXVKI0LgkwnvWTUqOwdX1nwbRJaQbltUdNpuPfBqKwdhGgYx+mhqPHLaOgthYZPWPRbGqZtUu/+Vpk9hfBleY4dLA2JR3V7LR1nBwxAkh0uK41r2HVLhTyIXmGztWlVIqoB5SNBTUHReYXuSVEmG8JuhT4n5uBxGcJzmekWmQwvODXf3wyniaoftVZ05mSv3U6O1fbUX8aGe17+fhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=481a1s/F4y8YYYtyFRvN94OtPguDpfTl0SIKXpw6B7E=;
 b=mtxK7hIICSq5v8LSIk0W72thLPbkR/NFN+Rt/8zTpu/HCnjfWMwB6JsDof3ss+7c93slUL+h5xhro8rnL5VLOTtMKp6inHSxm/2ScMFphL+pAwtSoBaHFbZ6byEGJWVUm3SdF4WMAYfyIzx85mTTYzybfeZIhvPEyojIlgZxy6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 12:54:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 12:54:52 +0000
Content-Type: multipart/alternative;
 boundary="------------hl5XxXQ1s8OQD9eij4yPc47y"
Message-ID: <da5d8d7d-cbf3-403d-89f9-465cd730ef0a@amd.com>
Date: Fri, 18 Oct 2024 14:54:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com, maraeo@gmail.com,
 friedrich.vock@gmx.de, michel@daenzer.net, joshua@froggi.es,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
 <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com> <ZxE-x6osh_jFHl5X@intel.com>
 <5a89757f-7000-4ccc-8762-1befe1fae258@amd.com>
 <ZxJYm6epuuConWdz@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZxJYm6epuuConWdz@black.fi.intel.com>
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8dd998-b70a-4999-c576-08dcef740ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWxtSnVRUUdRQ1g5YURWRTcvcGxWaUpXeTNYanQ4c096aHhWMkVmRy80czNX?=
 =?utf-8?B?TWdIL3NsOVpSbGtRaVB6MG1BaTIxc1RtSjFGUmdJUFVvZDNERXowMXcydXpG?=
 =?utf-8?B?OUhsZFNQWlJ3UEFqanl1ZkNMSnNBcjUyRjZvNnZXK2JEbE1ZaTVaMjN2NnJo?=
 =?utf-8?B?ZFhsNzJOV1lHZ2tZem9TVEg2elZqN2tKSk4rMVdQNUtxV2ZnUFgvREJDWHlK?=
 =?utf-8?B?ZDFIRkxBaE11c3pkeVUxOHlSWmV2VlJGOGl1MUpZaEo0L3VmemlOWFhORlcw?=
 =?utf-8?B?WE9TY3pUanFnWHpWNHJ1dmlXVDNaRTZIQXhIdklZU0twMWdOSmtydVhMc0hX?=
 =?utf-8?B?UUdDdUNEeVhIQ3NmU2xPNUxHU0M0Nng4S2JrUzRWVTBsenZYS1l4Wjl6YWwr?=
 =?utf-8?B?V1pmVlhnZUxiL00xbGVncDBOTW9FN05zTVdnSWNTaDJqQ1pSUXVCL2QyOCt2?=
 =?utf-8?B?MlJNN1VuSWxZYVlPQTFPREV3b0VZRlRTY2c3L1MrbkFrdjBCRjFJQnFEWG5F?=
 =?utf-8?B?TTBxWnFPZ0JRRVJLUzdhK3VOSkFxNXhTcVZ5U1ZNZjZpL3FYK3ZJRjFDUk9q?=
 =?utf-8?B?K04yaWZWdDN6MXBsT25Ld0ZUc29YRjRhMENHN2Y4cm0xUmdsaXlXZm4vZ0x0?=
 =?utf-8?B?MWFjb3RETUhYY0FqWUxJRVJIbnlBcnhINkI3L1MyU3pYbjlpSGU0RWxaQU5r?=
 =?utf-8?B?bS9ldEYzZlltTTBrWG4rbkJPM242QisvbFdkOUNjWFk2Um5xSWg3cWNlVno2?=
 =?utf-8?B?RXExT0gxMytvZG5LQmVtWEQzSEozd29SQVdjNGxtVzBFMjlXdy82UjJrNkdq?=
 =?utf-8?B?cXozK05aZ09lOXJ2WUY2UjdVbUxyMlorcGd5disxaENqSVdzSnZxa3RrbWEy?=
 =?utf-8?B?SkpoN2NjTzlmWEFLNGs3ellyQjg4SE9jYzl5VWVlMkxLNHBJR2hyN3lheXRh?=
 =?utf-8?B?WkxveS9vT3pLSkl6OEJrbC9JSFFKQVFYMlZsZFhOdVZsZUx2V0p6M0ptYWpi?=
 =?utf-8?B?ckhKV1ovTEpMK0lDbStPOFNjdWdERklKLzB3YUY0QWxmdzcxeDc3VSt4RWtB?=
 =?utf-8?B?WXMydUdZNlFnZnN2Wm1ic3Ewci83ZGlHbndlVXhOSW9ZYmIzVGZZSEdxTWdu?=
 =?utf-8?B?QUoybklkVFZlNWlwWmQ1NDQ2ZDhYTUt6SU00THdvYkRoNEduYldsTG5KTWhm?=
 =?utf-8?B?ZncxUE5ieFZwQW5ETTJjWHZ4eXBQaGhBb1NqaHJXMzYwNmVlb1RqNGdTTkZN?=
 =?utf-8?B?UUFQaTlybTY1T2dsVTR0NHZkSFdEeGU2QllGQXdkLzNyVG0zRzJSbmU1SDNr?=
 =?utf-8?B?VW41dEMxeTM4ZE1sWHB3OHpLWndzM25ubHJtQ2F5SStXVG5kQ09DSHAyajF4?=
 =?utf-8?B?ODZqRkFYMXR4UFlZTC9DSW1DTjhBOG5TR0hrcDFPQ3JsQnpsWlR0WDhMSnVP?=
 =?utf-8?B?bStpM2xPVlp0cEZrREFNb2YwQy93bnoxMkRSZFVZT0ZVUTZYcTZUa0ZsSHlM?=
 =?utf-8?B?WFgzZGRCN1VCSHNXc2pTd21ReU1ES0VZRnR4Z0cvZXdCZGRXWGZhYjd4YWNC?=
 =?utf-8?B?SDROZFRPZlJmTzlFU0J1OTF2WEc1ZXZ3Q1NsNjl0bmxkZXhpU3JGNE9HTHRt?=
 =?utf-8?B?MWhoQW43VzM3ZUVUbjNHcDVuV0JOd1hpSnB4RU82eStiSEgraFc4MTEyeUU3?=
 =?utf-8?B?dkJLWWZla0phSXVUc0FXTzh1YWdBUVdWZEFrdDNGYUdiU1VsTU4zZkVHMkQw?=
 =?utf-8?Q?AnRY06I9VufSdKR+qM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynlpc1EwMGhxTDlHZmR1Y1hhcDVYN3NGTFJtcGdhSWVWT0dTNE5zYTZOM25Q?=
 =?utf-8?B?N2xoTkhTdHg3YllsSGdkNFRsWlI3TjN2cGVxczdYRXlabGwvTjA0cHRZeTRF?=
 =?utf-8?B?Q0lwY2JidW9TcDdpM1pUZWxoaGlKUzJMa2Rua0dTSU1IMFB5MENUbzhnSkwy?=
 =?utf-8?B?RFFmdVNxaWg3dkpFR1BKZFNtRGlETjU2UENSRmZpa2ZGRS9Zd3FtSjRkcHdm?=
 =?utf-8?B?RUpLSkIycC9DU2VNVCtQL0pmc2VWQXE3Y3d2aVozMTVZM3JteHlyZ2JxLzNa?=
 =?utf-8?B?VUNWUmlScS82NCtxSlZHT2lnSnRKSVpHeE8xQW5JaUE3QnE5aWpRTDBhL0tR?=
 =?utf-8?B?NHdoRllzMDhaUEdsaG5POVZ1SVBHclc0VkxMY3NON1IremVNeGtUSUJibzB5?=
 =?utf-8?B?ZWtVZEN1aGxvQjFuaEo0d0pUd2JGRE8vU0h6dUQ2SThrcTFsSGs5eEhDdnFk?=
 =?utf-8?B?eThtdTJLZk9TaUZGbitPTGpOaVFlSytoTTRwcHdiWTFpMXBDbG85MDRBOEt3?=
 =?utf-8?B?V0RTR1FhNmN6dndhSGkxWUZ3cWNHYkc3SFZNSFVIZUswVzJ0QkE3VnZDbE1n?=
 =?utf-8?B?aDhhZFExQ0x6bWIwRmdmcFc5Nmt4RGJjWXloejRoQmg3OHhvVTB0alV2UERF?=
 =?utf-8?B?RHl6NStmbVBOZ1dvK3VSWG9ENmhzQmhuU2c4WlB5bzVvSU1WalIwVWMyZHda?=
 =?utf-8?B?cUlkNG9JalV1NmM5TG52eDB1U3NFYlVZVU9qaEVBMWM1S0tKZHhoNjRtVURh?=
 =?utf-8?B?M0s1dUZrQUxDMFJ2dDZ3T3Fuam1nekxrK29xUW5ReTNFL0JleThsUHR3bWRU?=
 =?utf-8?B?Q29HVll2QjlQaW4vQU5nMkIrZWFDaWkvZlVUbHhnVWVKakQ2dzFUa1Y4S0pk?=
 =?utf-8?B?Y0NOM3Vnb2N4R1IxNUM0WlFqS2RKTnVrRk5kSWVtdHBrL01Rd3J0QnVTZFpa?=
 =?utf-8?B?Ui9KUHg5dXg1R0g1Rld2V0tQV1VhQVR5ZDUwc2dpd0RicVo0UWk3VE5OMFUy?=
 =?utf-8?B?VU5pdnhhSS9FTFZpTzQ1ZXc4NXRWOWp1Q08xVVNYUU1UMzB5K3J3MU5Td0Yx?=
 =?utf-8?B?d2c3RjV0M25QMzYvODNFNFJXUEJpTjFMT0YxQ25hTXlrQytQamJBVDltcmM3?=
 =?utf-8?B?QXkvbnhvdHpjVkQ4OHQ4OWMwdGl1VkhZZW1uc2hnejhlZ2lWWUJ4Q1FyU0FW?=
 =?utf-8?B?bCtaR1FxZC9SODY2WlZ4NlZDTUMyQzlIV0s1RTdBeDNXcERjM3pjNU1XRjI2?=
 =?utf-8?B?VUZNejhWTWFONGRBNmQyaXFYWEk1NHd3Y2F0anErVVFBTTZyMmhHcjk1UGYz?=
 =?utf-8?B?dnVERFRVbjEzTnZTRFZpZlNRTTZHWVNKbFlPR3EzS2tobkl3YVdZcmxaN1Vs?=
 =?utf-8?B?WjNwS2RmZGdaUjY3T0IzT0dwYmxRNE4zWXpDamJuZUcvUlYrNUxzaVloY3R3?=
 =?utf-8?B?VWVyRzRUK1JtcUtnWTc3ZUQrVWMwZW52L3M1SDlvS3B6U1NIV1lTWGFnUDRZ?=
 =?utf-8?B?UnhKWkZRcS8zd04rdFRDVWhOVFFySTNUZGx1cmRmajVHRmVxcXpuWEVWQUZ2?=
 =?utf-8?B?clFyUDdLd3JxQit6cEJ0dEpndWhFVEVIZXY2bTM2WjgyVHIvTHovc0orNUgy?=
 =?utf-8?B?Qk1rbWpOQzE3NWJxZmVwaWdBNm1XY05VYVkrMzhVQW9mUzcrZXVMcTNvYm1L?=
 =?utf-8?B?WkJPbVgydXFKa3BRSVdpYTgyL0YwWTZGaDluaW5RUUMxMElJWmtkVVhQWFdD?=
 =?utf-8?B?dWh1YjRrOUcyVzBsV2QzbjB5VWVLOVlDMXFhSUdqMFZTckRSVWREeGg4RWxG?=
 =?utf-8?B?b3k2UlBqQnBlcHZzb2lKZXlYc0Z5YlcvdG5RL0FpdjVyVE5kMkpZVHN2OEZH?=
 =?utf-8?B?RGtwL3U4blI5R0VTQjVmSll4ODVoQW1qRTdYM1JoOGk3dnl5M2VoUGhmU0Yz?=
 =?utf-8?B?OXcrcGRhUDZ5MjB1enU5WG1nQzNvOGdXdzFMTXVWMEptRW00dStCMWdydEVB?=
 =?utf-8?B?d1piTFlZcDFTMzcvK25pKytsdnFmd2ZNaHZTMW10UDZkREZ6SmNIWmI1YlFm?=
 =?utf-8?B?MDJOeWlIcGZVbzYzWnR1QzFqMkNVcmRwMGJOazFhaFhZc2kramFVNGh1czQ2?=
 =?utf-8?Q?Kk56lPK36G3rA9xATySmZOGX3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8dd998-b70a-4999-c576-08dcef740ecc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 12:54:52.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/pIWZFULJ1903RKhYCHua4ZlkkTWb4yMLL8DCkbLuDp6Enyhfi0qd0NokN5zxza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017
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

--------------hl5XxXQ1s8OQD9eij4yPc47y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 18.10.24 um 14:46 schrieb Raag Jadav:
>> As far as I can see this makes the enum how to recover the device
>> superfluous because you will most likely always need a bus reset to get out
>> of this again.
> That depends on the kind of fault the device has encountered and the bus it is
> sitting on. There could be buses that don't support reset.

That is even more an argument to not expose this in the uevent.

Getting the device working again is strongly device dependent and can't 
be handled in a generic way.

Regards,
Christian.

>
> Raag

--------------hl5XxXQ1s8OQD9eij4yPc47y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 18.10.24 um 14:46 schrieb Raag Jadav:<br>
    <blockquote type="cite" cite="mid:ZxJYm6epuuConWdz@black.fi.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As far as I can see this makes the enum how to recover the device
superfluous because you will most likely always need a bus reset to get out
of this again.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That depends on the kind of fault the device has encountered and the bus it is
sitting on. There could be buses that don't support reset.</pre>
    </blockquote>
    <br>
    That is even more an argument to not expose this in the uevent.<br>
    <br>
    Getting the device working again is strongly device dependent and
    can't be handled in a generic way.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZxJYm6epuuConWdz@black.fi.intel.com">
      <pre class="moz-quote-pre" wrap="">

Raag
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------hl5XxXQ1s8OQD9eij4yPc47y--
