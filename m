Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBB977E13
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 12:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE34310E24C;
	Fri, 13 Sep 2024 10:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NapQ/Cwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39EF10E24C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 10:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+L6ToVtMmoxtlNCrCXi456+2/sq3aVBLTq5ewxC6O6yMGgUByzfyccvT6nVP6tZn5G5eZ5KgXFOIl2LAwzDuKjqV1oYYE8vdWbtqaka+l+R805yZmTvbc/MMlcWx+uLyjvm35AUFoaoIPUE0hgnqAYPiT4xASHEO/geKB0MlSw31TB/knknUwVXruwcTA4YGtc/tOk2l9T0ERA67ncJ06xPObhuepC+yHeJPEfVJKvtXXl/6rPU4qh2aULgrGMYaMlUaGkKBIiPbZE+MvVR5tOtKEGfDagJ1XScb4hM9Q8jNnEXVC6RQ5sddJmWKkdxEz+TXvfcWaF+e89Rf/GqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1qx2MecwwkikDO82G60HrU/Kb/A2GgbixRF98k9O6Q=;
 b=xBlO9+d0QrLLF9PkAZNky2qkbhLOGglLZ1Cgi+9mYlLJcIYeLsLlIQvA30pcUMnKCo51PZBCLbNmckwM+mpaWSEkCn4cstlc53z2XesSzKwv3TOmAnqtodO8vURc3dOnNywGfHJDiwH0Y6GFxz6A//uD2VhW9ukjXlWbAvzFkKfKIStwQmlZ0/wSk9EjllUL0HHGWNPxaAPQ2xnjPCaWp0Bcr+z7EE0BifbyRSbX6y+VuDoaqY+3HK0qBIDITqauaf5kkgXmUQ45zk+mUnHdcgHA+HXx9Fg7rfJJK5KvvdPEWrsbf06GyOE5dRmba/xcdzPkN4cNgv5VOxoZZAirQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1qx2MecwwkikDO82G60HrU/Kb/A2GgbixRF98k9O6Q=;
 b=NapQ/Cwcg+p+zJpGa+mKTnqjtForckDFHzP+VtPfLLiKYdGpXy9Si6FR7VryUUkQchP/BpN89+EHyp3XsZxBII/WFpJCHFEDDBs+8MPa9lbEVpfzlC92hwRcT8gz5J+BNQmENQTqF79YnCLPym0jDJD8MsUFObLdL7nPUNLL5bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 10:58:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 10:58:07 +0000
Message-ID: <d93f40ae-7812-4b72-8a10-272f8ed0721b@amd.com>
Date: Fri, 13 Sep 2024 12:58:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm: GPU Scheduler maintainership
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org
References: <23b1d4e3dfdbd05501385cc2b67da8901693bbff.camel@redhat.com>
 <70fdf365-7e65-4b45-9274-abbb1e8a56e2@amd.com>
Content-Language: en-US
In-Reply-To: <70fdf365-7e65-4b45-9274-abbb1e8a56e2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 556e42e1-0c3b-45ef-f607-08dcd3e2f2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2V2amduRTRPVzJBdGR2VGhPNVd2emlKeVlSTUJsanVsN1kvbkY1VTlRREdt?=
 =?utf-8?B?MjlIMC9Uc3AwaEVWTXRnQ3hkVHgxUUFmRS9wMXpHK2c2dk13MjFrNE5wREZK?=
 =?utf-8?B?aURXeVFlb3RmN3Z6UG15SWtjeWlIR2tLa1lGZ3Evck56aktnaVpkeTNUdnJ5?=
 =?utf-8?B?cDkwQ09SZEU0T3d2MSs0ZDAxT2xxSTg3RFVORFZlRGZ3NG11d0o3TFhLODBE?=
 =?utf-8?B?K0pPdzM4Nys4WmxaTjA4QWUvR09VbW93UmdUTXVFaVFyRGplRHNtNnJ4cTFD?=
 =?utf-8?B?NGl6ekpNTUVHeGZzWmd6K2tibmhsQ3QzakFyVGRqamYyL20vRTZsZnptTVg0?=
 =?utf-8?B?d3pQZGIyMVJ5S0FGaHJqOWxKK1M0bXlOc1dFRk42alo1Wkh3Qm82N3I1eXVl?=
 =?utf-8?B?THdaMmF0UTBLc1RyNEFwYWFZSmxYbXkvOW1FOE9rOU9DNU1LbjJyWnBqMC9F?=
 =?utf-8?B?dG9IYjhwellvaG9tRWprVncyN0lrOUN4cjhXY2x3cnZ2UDlzSkRBbktNQkh0?=
 =?utf-8?B?OXYvdy9YUS9KQkNpaGk4a0hyN0wrcTV4QTlPREwwZHBvQi9OaUxjaDhRRlZ4?=
 =?utf-8?B?OGRjYWZkanRhU3U4YzV3TklmUzk3alN5RS9xbUxQa0F5UzdYVTdDVCt6dGxl?=
 =?utf-8?B?UURYWVhzYnFNODh5R3Z4K3FBVDJMQmxUV0c0ZnJRbnFFYjNQQ01Dc1Q0V2xC?=
 =?utf-8?B?M0xZWDI0YjY2bkZLL1hSZ3lrYW9xNHhrZ1ZWZ0Y1OWUyRkdSYmdjOFNiNUln?=
 =?utf-8?B?K1dNblIxWlhTVHJKK1B3MFI4K3p4aVFUNDBJQ0VsbFdmUDBvYWpxNTdYZ1NS?=
 =?utf-8?B?Rk5qRVJHUnd3Y2FtdWtmWThDQzBlTU9obFNYZ0UvTE5GVXQrbTVkbnRSdG9h?=
 =?utf-8?B?a3VWNTBYS29PMy8waVNFWVNQWWpWZWZvSnl3RWQ0ekUrU3IvNWE4cm5PeEpM?=
 =?utf-8?B?elM4L1NSS1dJSlpFM2xmY2J4YkUveDgzZVlqN295WUpud1JBQlltWmdqQkFK?=
 =?utf-8?B?TklkN281cTl5N2pnK28yZC9FWXFwNUxMWTgxejlMUnRWUzA0bGpRaTM1c213?=
 =?utf-8?B?Nnc5N3BvM1dtUVI3c3BDR2lkOS9FL2FkU0F6Z3k1a21IOGpHTWtGZm1zQ3hT?=
 =?utf-8?B?K1JUaU1VSnJuSzhnYXFLTzJSYmdrbFlIK0M3WE1DbkN1d3Q5VjJDNEdTdy82?=
 =?utf-8?B?cTBhdEFVUVVlRHczQ2k4TEN1bzRWSFIvVjFFUUlzT1lCQ0ljL1I3M01LdWd6?=
 =?utf-8?B?eTZsd2k1OHRpaXVmWkV5NjNKdTNaYWNLWHY0Tk1nUk5SODdjV1psN1dWNTlq?=
 =?utf-8?B?aE93VGs3UDljaXZNeTJzMFlRZllTNjRYMFFkMkhJYS8xbzh3am81ZmpWNDll?=
 =?utf-8?B?ZC9kd3FudTZiUEtQWjJEcWtRUlZuZmpwUklOYkpybGlMbnZiWFZ1OGw3aTJa?=
 =?utf-8?B?ZHNHNW40QklETFlDMnlsT2ZSc0xzcDZ4WStpZUE2N242a3FKeXdmOHJLa01y?=
 =?utf-8?B?OURsZHNTcnI4R1RhOXEyNGJjdE02MktXWjBzMVM3K2xXWkxtb0NTNWZQQTY5?=
 =?utf-8?B?RW5GZnFadzBDWkFlZkRHaCtQU2JoeXk5YlVmdHVDT1BqTnJQSXlKZlVWVVA0?=
 =?utf-8?B?cjJ5dVFVdWZRb0xYVE5ndjVZTFJRTTBiQlRkMnMvMmxtVFJEdmtUNkZzZ2Fz?=
 =?utf-8?B?bWdIdThBVnR3TlNYU3BOT3NyUzZDWndSNEpGWlhnWk1xWHFJVlRRTVVlNVJV?=
 =?utf-8?B?dUdlbnA0Zmt2Z3N6Uk84ZHU5R29pN0ZmZ1hMRHlDYVVnVTZOWGJMVFEwaER5?=
 =?utf-8?B?MFlwT2FGM05TUzBUdmE5UU9YWU95VDFpQmtzSC9La0JBbHF1SFFrSTBPOWtl?=
 =?utf-8?B?VWR3L1dvNmh2dDkxTGNTMHhEaVdkUW52WlBMMUt3YVoyeEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VQUXpTNVIweHdTbC92MkpEdEFHVExubGF6NEdLRzl6YlR0TytFMUFWSm12?=
 =?utf-8?B?dzJ4ZjRjd2VObEtCM3NaY0xaYVhRQ3RuQ3M0NWJkdXM4U09vL3c2L2pMRXcv?=
 =?utf-8?B?T0NlRnowdjg3VjdCNHcyMlRodHVLYnUyRGd6NFZKdERNNXdNV0VoUWdWZ0xm?=
 =?utf-8?B?Q3VURzlJUmJUVGg5RGdIeS81a1krZUNoY3dCYjY5SFVsV3R2M2tHOTh5TnNm?=
 =?utf-8?B?ekZUd2pSbHZEZzZxT0hrU0JoWnR2UzBkRmRhbHNOS2pTekpvYU0wbyt4UUMr?=
 =?utf-8?B?clduZUpMdVVPR1g2VHNjTXMzbGh6N3pSNi9uNXVsb21iRDBHTHdNS1ovVTY5?=
 =?utf-8?B?SlRGNUZmUmJLV01TTERQT0g2cFpHclYxMkRucFYzbHhaVmloR2RIbmZUbFM2?=
 =?utf-8?B?S3dLSUZ6WmVkdVhaRXlFS1lROXlXZ0NTcU5INHI5QWM2TWtrNDBkaXdadGJG?=
 =?utf-8?B?cUJzMHk1eGRSU0NyRzhRQmxVZHhSQ2pkNkhzUTNFUXN1TkcyQUN5RDJWU0l1?=
 =?utf-8?B?QityblNpcTVodEZyZjdBcFY0dlNnbmlDK01jS0l6R2QyVGR3Z1Q4K0JBZXND?=
 =?utf-8?B?akZadzhmMnoydE9xOVZZcXdRNzh5bHNNY2RxNkpCVlJ1dGVLcllKWGtIVXRy?=
 =?utf-8?B?VGNaZUE3cC83ODB0aE01RHpJVkFIcXM3Zks5ZWRHeDNLeW1VbVBhTHlxcUxT?=
 =?utf-8?B?a1VxQ0kxQW5XTmd4WnRhMnFpYUNud2ZIVEVMN3VSZmVmS1lkRHhHUHF4Nlpl?=
 =?utf-8?B?WjhUZElzNXUrVlNlQWp0ZXJTd2JwTzZtc1IyaFhrOWFienZzZjltT2lhenJG?=
 =?utf-8?B?d0REYmlHM2FTWDNFTjJaaXAxN3J6U1V5RDlGdDFkcE1kRlJ0eUxiN0kxbnlZ?=
 =?utf-8?B?RlNVTkp1VkI5RjNKOXJjenN0QXlodjNLZHN3K0orVkNrRlI1akxBaWFwMDBN?=
 =?utf-8?B?a0xjb2NLNm1PQXlaSVJldWIvODllMlNWRGhlODVRUVhjdlY1bjREUk9DNkky?=
 =?utf-8?B?RFJvcklnbXJwUjZ3dU51WHdkdVk3MkdHNWlRTGpWc1k0QVZDZkI4QVQ5M3lQ?=
 =?utf-8?B?UTRQSFQxZkV1N1RySzJtUEFZcHNEOGxHaGtBeXdjZTVESU1YTmRDUzBEd1Ay?=
 =?utf-8?B?L0lBTmtCZGJSMlNacGMrdkVYQ2FJUnZsM3cxTUN6SytHZCs0bkxvK1NRWGEz?=
 =?utf-8?B?Q3dmRkJRcVV4dGhuU21UQTFTVXFKb2dVU2RFTHVJSzNhaHRRNkhwa1FmRmJE?=
 =?utf-8?B?enN0T0FGdmdhRkxSWTI0MXpaVWNpbzdhTCtzdTlOY25VcTY4SE8rY2ZRUTZE?=
 =?utf-8?B?d3MrUlhRajFRTnYxTFMwY2VBN2t3UFVXWTF3YzlHRmNSR2xtTnZQRGZUZEtz?=
 =?utf-8?B?NlFvTGlBV2ZUdkl2MWM4WmRsc002U3dVWEFLMkorQjNUS2lVYTMwbGIwZlgz?=
 =?utf-8?B?TUJydDFOYWg1SWlTQWl4OUhJRnZyM1NORU1uQUJkREJZZHJxZSs2NGw1WVd2?=
 =?utf-8?B?YXJ1ZzNnbHk5eXFtckhkVkpMSHAyWnhhTDEzZys4dWFWcE02YW9aK2t5QUpI?=
 =?utf-8?B?TTF4MGJLRFhRME5oOCtLT1RGZ1lMUkU0RnZOOGlINmJ0UENFcFdxTHMzMGI4?=
 =?utf-8?B?ZHZOb0JoMVpneVQ3dkJKeDhLREwwdENpYXhROUdqL3lCNm9KdzBRSmhGaWMy?=
 =?utf-8?B?RmdEclpiM0cvTEYxVWJ4ZUY1NDNCR2FDUSsyRVg0L0pjeGtSOXQySWlhc3Fj?=
 =?utf-8?B?MWl6UTNZMEVjWGV3Tnd3K2VOMFdDVHUwd0wxOS8zS25VcUlXU0paVnZLVWlD?=
 =?utf-8?B?dFl3MGhVNVlKS28rWG5mbUh1WXY4cEtZczhUbHJxVzdwQzU5RUxoMCtEWDZZ?=
 =?utf-8?B?dWVIMUR5UzFPL0FvOU1hODFMakpZcEFPSUV1ZVRKeEpQYS9hczdLaW1PVkg1?=
 =?utf-8?B?SmZvRVI4aGFXUWRpTktLeEltbTdwWDJLeEpLbUlPY1RBQWx0STc4M2tVTmtt?=
 =?utf-8?B?NWs1LzdjdVNNSnFaKzJIQnVsK1dBOXJZbWwvcEFlbjRNczhvZTJKeSsvRzNO?=
 =?utf-8?B?MmNtaG84MFozeFVBejNva2ZuYlhKNDU5azZCUjdWTEtTSXZiNFd0VWdMNGI0?=
 =?utf-8?Q?jzt4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556e42e1-0c3b-45ef-f607-08dcd3e2f2d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 10:58:07.2152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8l63QMEq5/51Vgl+3yJMizWcX9r84jnQKQXevSuhfaOkFp5W2jZa7SiU13ofvpn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283
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

Using Tvrtko's updated mail address.

Am 13.09.24 um 12:55 schrieb Christian König:
> Am 13.09.24 um 12:49 schrieb Philipp Stanner:
>> Hi everyone,
>>
>> it seemed to me in recent weeks that the GPU Scheduler is not that
>> actively maintained.
>>
>> At least I haven't seen Luben posting that much, and a trivial patch of
>> mine [1] has been pending for a while now. We also didn't have that
>> much discussion yet about looking deeper into the scheduler teardown
>> [2].
>>
>> @Luben, Matthew: How's it going, are you still passionate about the
>> scheduler? Can one help you with anything?
>>
>> I certainly would be willing to help, but at this point would judge
>> that I understand it far too badly to do more than reviews.
>>
>> *glances at Christian*
>> ;)
>
> Yeah, I've already wanted to suggest that you and maybe Tvrtko step up 
> and start to help out as maintainers here.
>
> And I have >1489 mails unread and can't find time to take care of 
> them. I'm happy to help with design questions, but I'm seriously not 
> taking any more maintainer work any my shoulders.
>
> Regards,
> Christian.
>
>>
>>
>> P.
>>
>>
>> [1] 
>> https://lore.kernel.org/all/74a7e80ea893c2b7fefbd0ae3b53881ddf789c3f.camel@redhat.com/
>> [2] 
>> https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
>>
>

