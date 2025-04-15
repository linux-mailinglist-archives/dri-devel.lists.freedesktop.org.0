Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D325A8A056
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708210E79E;
	Tue, 15 Apr 2025 13:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x4Ft8lDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCB510E79E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbUl01ytGtUNQUEXWluiyEUMCOag8AYHAwRTjkMfGw5TgwVgtXLm1sOwLBFYgcJTYlzmscH3azuHaKc1EauvaKMl7VGVQo1uuH8iP1PC0zFQjc9PezhrhQNL21+zZeisDv+K6qzKZiOEmLDxyKccn3/Y0fE/marMn4cVg3qRFqQtzX31S/F/mrMyODYHA8zJw1HEy0jVQM42+yng7C183Kgawq72l/TW85spD71O+bgjs64cDCCdORPDw74tEF/yWi8SrUGNaUeQgyvM1HslNYntQITnufTS8x83P4X4iqWwL2EVCGxpbySl3i0g1x5hdnsYJcS9lFYvn2TNyoiepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O67bT80eHmK6w+wwOQcFc7OaaLvXka4UQ9jHB4aZ93Q=;
 b=AFks0O3kS1TkvIqm1Dw98GuoLO1H77qUXDP52i19OI+n18cRuGhb6njDm8uT4owVI+1Px7zZpEBNrP8o9uBIUCXgWLjSO3dwhYrA8doQkWovTS7tvdjDWV+OyGbDH91HsPuDUsdNoiP8jRErDJaCbHWb0xJ6/47F3A5DgTTLo1TOqjI9Kj39bXLAqA+X2D787qwYNH0H/S3N95DjnFQTjnPl60y3QRt0AjzG3LPkWRS/xuZ6zdzg7ov4ZJjKNSHQtMtBq9kbfahzXE8rXtCZhVG1HxiBwI2L06XeevaFydpj3UtrGMlKffMy8FHu3FHos3TA4FSPtwJa0Mb8oLYdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O67bT80eHmK6w+wwOQcFc7OaaLvXka4UQ9jHB4aZ93Q=;
 b=x4Ft8lDLcCZMJGhOoPLGERG5ZDhFHAus++9lQE+1Qjv5Ux6639DhVwZZzP25ETpHgzpyh+lkLKXG//omwC+NxVOi1VwcDw00UY1MwV2TSl2rbbrgz1bVG0xpoc6NzuiL/beaJ/7z2mPQOWBsDhNDlZEqBrJ/tru7kaKz2XU6iCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 13:57:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 13:57:23 +0000
Content-Type: multipart/alternative;
 boundary="------------D1MksvMY3wmQ7LbtvcjKkscH"
Message-ID: <5a1b160f-0ea4-4c31-b777-b8ab81b6c394@amd.com>
Date: Tue, 15 Apr 2025 15:57:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
 <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
X-ClientProxiedBy: MN0P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c684cc-f491-4206-f18c-08dd7c2572ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2VyWGxnamd1Q2VZNE01QUtGUXZjeWJlRzdjTElTSmYwUm8wdWd2dDVjcm9U?=
 =?utf-8?B?dzV2WThhc3ZLdUdCZHB3OTFrZ29zWGF1Y0ZRN2RRbDlwVEM3Nmo3cFNQcE1L?=
 =?utf-8?B?ZEJ6T21mYklsU1pCVEFucUx0M0MvYksvL0VjODFTdjdjZnI3bUFNd0FITXZI?=
 =?utf-8?B?d2dWT1h2WUVsS1B2UlpxSVNJRVM0dUFNazlZbVB6ZjRyeGQ1U3hsRkpMREVr?=
 =?utf-8?B?MlF5VzZFVGc2a3c4T25tVDlTdzZkNUk4U0lSQzdybmtPcElNSnZtazlrb0g4?=
 =?utf-8?B?RkVHa00zM0dKeEkvRkdCRmVqNUY4bi9sMXZjSnJVaW9YcUZ6Q3Fkai9oQ2VU?=
 =?utf-8?B?TjdwcXN4RjFMZEV0QjdlVDNOMm9aT2owSGtzOTg4ci9BSjhTUzRqR1RhNTUw?=
 =?utf-8?B?MnRtVzk5RWtRbVBXajB6eGw1M21ZOE9qKzQ0SFUyYTE1NGtIS2dzNFI5ODZ6?=
 =?utf-8?B?bi90QUxQUG83dlZkSTZySWhHRVZCQ0F1N09oZHk0Sis0dWJIdkZxZE5qK2xH?=
 =?utf-8?B?d1NLMWwrMkM1WG04blpYSHh4MW81cFRVMjhNRkNVUis5bFZxSzllcUYrL3hn?=
 =?utf-8?B?VjUxYVlzeGlrWXVFb1JhYXZPTWlZSW1BODdnd2N0S1poc3oxblhJRlp6aDN5?=
 =?utf-8?B?dzM5T2lYUmhOOE15bUxxWnpKWXU2cms0aFVhS2d2ZmpWV2wvYUhRSGNuMzFQ?=
 =?utf-8?B?cU0zOCs3cHkxL25LV1R0eE9WODZWRHBzc1BlKzNEbzVCOE5WalBaL2xKek0x?=
 =?utf-8?B?bmQyUnlmS1V6eW96bnp2Nm50Ry9hVk9xaEtvRjBkdW1ZUVdwU2ZVSTZtT0tE?=
 =?utf-8?B?czRqOERIUE96QllSUTZoVXUwbTRnQTg1dWhrSm9zT2xWTkVvOHRNU290ZGo4?=
 =?utf-8?B?NUE3MlFGRXJvTk0yZVZucFN2dWU0MGZlMlBuVDZFY0hrQzhseGpJaUFBYlNi?=
 =?utf-8?B?dmZBQ1J5b21qdHpZRDFJOHl2ZGV1MmsvN1J4ZTdlZnZ6ZzNpekM4eG5HK0Rs?=
 =?utf-8?B?OE9YY1ZKRzBRYWpNVkt0azluUHgvQnFuZ2hNekRzVG1tVm5PdWNJelNyc0I2?=
 =?utf-8?B?blo4MkNZQkl2NUZEdk5TRnJob05GUkJYdk4rKysyUElmSXdGa1crRjNabm03?=
 =?utf-8?B?VUpNSjB1b2xLaWdaWGUvNmxtU1YwVjFzU2Z4cnhLSTBmZ0dSeFovTWdrR1ln?=
 =?utf-8?B?aitUMHpSSU9wcVFFbDlESVBTakZiYXV0R2FTVStJbzlHTEhWMkVFczhyUld5?=
 =?utf-8?B?OE03bm9oV0o4V2pQVW5kY0ZhdE9BenduWWFXakpEd1BFR1lUdGZJMThVeHI3?=
 =?utf-8?B?ZjZHaDBHZCszY1hoSVF1cHFFTms0MVhPc1VNOGE3SmhXcnRmd1lTK3Z1TmVN?=
 =?utf-8?B?aUZnU1cvcmU2MHJOb05jdjZFL3R6NC80dTFISm93SUFSY0FHMDVrV2RtY3FX?=
 =?utf-8?B?eTZ5OFJBUndUa1VJcTRVdXN0L1Z4eDQ4dW1qbGZrK1JBanhkekdKV29aeEYw?=
 =?utf-8?B?UnJQNFNOdlJQV0hoQnU5bDZ5TUNNZ0ZWYkdnbzRyNzZ2L0VVN3diTWNTUnJw?=
 =?utf-8?B?bTMzZlNPRlpVOFRrOE8yc1ZKV0JsSVFCZkg3MmhTV2tTbmI1WCsraDhSN1Ro?=
 =?utf-8?B?QkpLbHJMc3Q4cXljUHhUNFlXREYzSjNmdzQwRi85aGlMTzRkc2FnY1Q5azlu?=
 =?utf-8?B?MmQ5OCtDQ1dCdnEvaFV1cFh0eVYySllFVzN3RENFelFoRzVzUktVRkZ5OE9X?=
 =?utf-8?B?NCt5ZVlrdEtOQXF5U1o0ejJmVGM2VXJxMTdOUGgyM2hqeUJYd2ZPT0dpTFBU?=
 =?utf-8?B?Y0d5SUF1OElSOXFZQjNNZDBnRk04MTNLeE0vdXpETlNweGhMelpoREQvZmdU?=
 =?utf-8?B?eU5jVE14SkI0WDM0UGZYUnVJSGloSERUZGpuN2cvbGl2aitOamtrVEt5aHdJ?=
 =?utf-8?Q?PmCmLZv5z1w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFRc3FYNko0U0ZqTitrVHQ5bHoxVno4T0duK1VrZGExOHFzZ3BwM0MvVko0?=
 =?utf-8?B?SXpVL0FuUkkxNUM1Y1FweWxuaEdMTjRXMmNLRkwrL0VxUEcrQkZXVktuSTg3?=
 =?utf-8?B?ZnljRDgwdys1eVVzOFVac1NrSDNqY3JxYmJiSFlzRkxpYXVsNWl0MXpYUktD?=
 =?utf-8?B?ODJNMTA1dWZHN0J5NHVTU2JIWlpVdW5XL210SWV4eU9lTmk3NjgrVTRZRVdm?=
 =?utf-8?B?RVViQVl5VUd0YkR0TSsybGJtUHR1VGQ3Ty9QZjZBNWg2WklnQzlVZ0Jrbk1L?=
 =?utf-8?B?Y0p3NUYrTitPMHJuTjFOcnczYWc1cGdQbjBnWHZQREh0YWFVODZlT1hkanpO?=
 =?utf-8?B?YkxBWDR6MDd0SEIwM3FnUktXM3pwK0xrM2NZQmZRby92TFpHa1lEcGN2ekIy?=
 =?utf-8?B?NDJkblcrR2xVWHg0TlAzWUFuTlBVdFkxRG5UOFJVbkl1UlA4WmFMQS9jZDNl?=
 =?utf-8?B?RzJNOGpIRGNLVUx5empjbFJBd1o0T0VUUTJyMDJUL01QR0JrbzhPdUdQUmZj?=
 =?utf-8?B?eGNPaGg2ZFNzZFZhV1FuTFVGeTI3TkRlQXZaWFU2UWduL05ZY09hN3A2SlYv?=
 =?utf-8?B?MkN4SFMxSWozbzNpYjl0S2tWbStrWVducElvNEpPdC9jR2p4SHIwaUpjMk5L?=
 =?utf-8?B?a1YzTFYvZFFJNzJPam81L3FGWXlObExRWVN3UmdGcFRMMmlYekYxVStEOFpa?=
 =?utf-8?B?NGZWYmtja0ZUY1VEeFd3US93WURyL3M5ZmdsOEJsMTgxWkNBV2tSb0ZJejZk?=
 =?utf-8?B?eGFTZTRJeE9UM3RGamQ2S1hleWFWN0owb0FMcGV0NlN2Y2ZGaHRqZkxuYXNr?=
 =?utf-8?B?WU0yWWU5cDFLQjVFdlliZUZwOCtqUlJlU21UWFpzbWJSOWZlOHozNEh6UmxC?=
 =?utf-8?B?UmVNb3dqOUw3dTdTMENQTGticFJDdkxtQVNlbVc2Y01FRW9PQ2NGWE1HNEZa?=
 =?utf-8?B?SGhFdkNuK3lOcSt3djA3aUVGelNjZEJrT3dtVmI0R2RKL21ja3N1UGJRV01E?=
 =?utf-8?B?VnN3RzJDb3JWb28vZWp4ZFh5THJtdmdTanFNamZDL1BuRGNyZFJjVHhpbmpG?=
 =?utf-8?B?ZVhCQ3JheUZ3NVo2c3JIRWNrVUZHZjVibHF0Sk05Qzd2NTlvckNpVWNjQzJP?=
 =?utf-8?B?eG9nMmNGYjR1UTVJeEE2UW1UZ3IwUmlrMHErYWtVdmJja0tFVWE5WHlTYWM1?=
 =?utf-8?B?WjVLMFkvNmQwYnNvSUpRODh4b1g2a1F3N3BybFJIZEI3Wk5MR3hkaEhEbVU3?=
 =?utf-8?B?NDlkN01XcGNkZEV6alZ4TDZrZU92NW5kOVRFdWprcjdVMzFFVG9xWi9ON2lG?=
 =?utf-8?B?WWtDaHoyL24yOU9nVEZBVlYrK2hPbVZqUmNKWXFTcGhuVnNldmVBYkRqb1Ar?=
 =?utf-8?B?MzRlUDY1UHJRM3I3bnp1bmJ3ekZFMXF4QVlwc2szcGhGS2pYdUpaNGwwVlFG?=
 =?utf-8?B?TkNNYkc2VmpGRFBGR3YyWHNGWFNnRFZyT3FUZGtuT0hCWnd4c2RlLzRodjJL?=
 =?utf-8?B?NVV3eVlXR0NrYlN3bXpHWm9CeVNkUy82R0RPNGZVU2tzVTJWK29vQVlTcGhP?=
 =?utf-8?B?ajBSK0VRaDRIZWlpVTFtSUZmSHNyWjh2YTBkWnJ3S1FWZWFDRGlDVnN4SURJ?=
 =?utf-8?B?dS80c1diMitvY2lUUm5jQk9NSk1DZG02WVlmcWhCOTlSWmJKNDRPdG1vNEdy?=
 =?utf-8?B?dSsybUFTNWRxL3RCV3NrSUtsOUdYdnRtQVBwOUhUYXA5aG41cHNKQ3FML3Ez?=
 =?utf-8?B?cHk5ZmVQL1h1b3NTVE9qUFFlMWd4aDlGQmRUU3NMSWNJdy9XWmMzSEpZS29O?=
 =?utf-8?B?RUxvbE9rUUNOL2dVd01GNG41QVh3TXdZNS9MZzlxcVpFVmhJbDd5U2duZ1lE?=
 =?utf-8?B?V3hvNllhZTN0NFdkK1U3R21OallFL3NNTXBYTjBkTTFvc0FxYTdZVmJCOXJU?=
 =?utf-8?B?NnBRb3NlTDY2QjJPTnYxcERCTGV0R2Y0bGdkVkNEUytDS0FJUkM5Wno4UEZr?=
 =?utf-8?B?eWNydFh3WmY1dm5uSU5BdHR6c1haNjMvamNNME52ZkVmZ0NMay8xczVlWEZG?=
 =?utf-8?B?WW9GSjN3QzFoZkNvRjE5UDVnRC9ESGp5bWlsdEEwbEdlYXpxUVprUmpjK0sy?=
 =?utf-8?Q?LeZl5Hx53aULXKvjG2CSqcbQ4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c684cc-f491-4206-f18c-08dd7c2572ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:57:23.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oevHqe7drqU9VQjVkbHPtlne6uiGzHuOOIkoDfJNbasktjaAefgbXJVBdYYqMMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258
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

--------------D1MksvMY3wmQ7LbtvcjKkscH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 15.04.25 um 15:10 schrieb Simona Vetter:
>> This is for devices who only want to do a vmap of the buffer, isn't it?
> ... it's for the vmap only case, where you might not even have a struct
> device. Or definitely not a reasonable one, like maybe a faux_bus device
> or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
> where hence dma_buf_map_attachment is just something you never ever want
> to do.

Even in that case I would still suggest to at least create an attachment to let the exporter know that somebody is doing something with it's buffer.

That is also important for move notification since you can't do those without an attachment.

BTW: What is keeping a vmap alive after dropping the reservation lock? There is no pinning whatsoever as far as I can see.

> I think we might want to transform obj->import_attach into a union or
> tagged pointer or something like that, which can cover both cases. And
> maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
> matter what if it's imported, or NULL if it's allocated on that
> drm_device?

Yeah, I had the same idea before as well. Just didn't know if that was something worth looking into.

Regards,
Christian.

>
> Cheers, Sima
--------------D1MksvMY3wmQ7LbtvcjKkscH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.04.25 um 15:10 schrieb Simona Vetter:<br>
    <blockquote type="cite" cite="mid:Z_5a3ckZiY-fINNW@phenom.ffwll.local"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This is for devices who only want to do a vmap of the buffer, isn't it?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... it's for the vmap only case, where you might not even have a struct
device. Or definitely not a reasonable one, like maybe a faux_bus device
or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
where hence dma_buf_map_attachment is just something you never ever want
to do.</pre>
    </blockquote>
    <br>
    Even in that case I would still suggest to at least create an
    attachment to let the exporter know that somebody is doing something
    with it's buffer.<br>
    <br>
    That is also important for move notification since you can't do
    those without an attachment.<br>
    <br>
    BTW: What is keeping a vmap alive after dropping the reservation
    lock? There is no pinning whatsoever as far as I can see.<br>
    <br>
    <blockquote type="cite" cite="mid:Z_5a3ckZiY-fINNW@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">I think we might want to transform obj-&gt;import_attach into a union or
tagged pointer or something like that, which can cover both cases. And
maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
matter what if it's imported, or NULL if it's allocated on that
drm_device?</pre>
    </blockquote>
    <br>
    Yeah, I had the same idea before as well. Just didn't know if that
    was something worth looking into.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Z_5a3ckZiY-fINNW@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

Cheers, Sima
</pre>
    </blockquote>
  </body>
</html>

--------------D1MksvMY3wmQ7LbtvcjKkscH--
