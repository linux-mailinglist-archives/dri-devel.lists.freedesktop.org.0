Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E35E91F0CC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BC410E556;
	Tue,  2 Jul 2024 08:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N+VLKzdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92B10E556
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 08:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI32y+rKe8SfV7YEuvL+Q1XX+XAnHThWxgzW2lJXSrzhJ3ttaZwqhycMRofLdANnumKVs/BJ8wEwY8yyr7bMw9M+ZTIpCcNRmrXP80UMq7eHlX2rSFn8ynXHWwpPllP2N4+n/gHTBnci94xbJ212MShSN6jjd2tSDHhQnY4wE8qfKGAqbXw2Z0pTiy+jDHoqZx32UnbaaN/lfQGjHLD5UHreIfQvmmTXl1ys+ctmOpVmNhfU6dsqRloLkRV0853JbaLtjGJgaX0PkemNLkkIQj+hLOD+S1xXoOUNMsd6hhHlqbgudsz/g5Y6fp3i9g9xsEsf+7Fxfq3PjrDnq44Rmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEEYwN2dSLTu7CAscS2HwTNfGsU5rcmPdG8Oyn81134=;
 b=JvT3LhnAhraBIOpgLq/cAubAPSq+yBNSZX1yWesaXMNx4Lg1iAa6pY999C+9/rsmGf4GQBSdT680kvi099TyVmoZKFyK9KF7xCukzHPq/m0qOxCX1hLd8SgNC/HeGG/WDOeLZF3EAJwmXBJJHPxUdSVACJb9tSP2L0nwTZSSytYzGBKDASbMCFX8JuLeJ3KZmZ+28AnfIf/FfKi+b6HO1x4mnKuXORaWgTF6UIP+8dv2D11MOYUX45qObxyTpl1XiUOGSOTt5E/CTTs1I3CkRAmjDg2JtMw2HzR3kGmNCJgpcAPdSib+sPdp2mLg2gibGIJK5yJivRPyH9Y+onXSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEEYwN2dSLTu7CAscS2HwTNfGsU5rcmPdG8Oyn81134=;
 b=N+VLKzdd+v3qADuVaZNFi00IVvkrE/CGqPgnGR+nGKQapzhTgwzmM9tcFG9nVnH+3/SW3pfDdCZ2jJf/T6HC+3pFevV6BDcTyp7eoIUF1bNPcNaNOS/4Igxnoz7sZXqJw6D5VIINxctEVxCxSBC1Cto91B7YamONLZuaEo/9fkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 08:08:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 08:08:31 +0000
Content-Type: multipart/alternative;
 boundary="------------ZOLD7R9PPZP0w3ivf05BWdj4"
Message-ID: <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
Date: Tue, 2 Jul 2024 10:08:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
To: Icenowy Zheng <uwu@icenowy.me>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
X-ClientProxiedBy: FR5P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 1061090c-9361-4de6-8f39-08dc9a6e292f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NaZGdTNy9waXFPblEvY0JZRmhyYkd6S2ZiQk10V3JiQmZseFJmVFFDRzVS?=
 =?utf-8?B?NFpDMEt2a1ZkMWlGWUtpTFBnQ1dWUVJlelR0TDhzUWNOSHdEaFY2bXRCdGw2?=
 =?utf-8?B?QlIzVloxR0ptTUM3cDVtUG0xMkp3YzBRYlNsbzVScGZ6cW0ybHVoT3pWK0F1?=
 =?utf-8?B?RlJOMkQwQncwWWQxcXRpYm9uVjZRUmEvMFRhUnF5Ryt4WXNsT2Q5UVZsR2Q1?=
 =?utf-8?B?RWp5S1JJRFFFclIzQnlRcmVZTFExdTBBZFowNnNWeVhYV1NlazNSNzFlN3Rm?=
 =?utf-8?B?ZU9RWkkybW84cFZBQ1ZBU0wyVmMrZmJqMVhkdUNVRFNOZDYvdnVqWVRDQVM3?=
 =?utf-8?B?TndHVk52clV3MHlXQ0RpREFxMWlLMWxlTk5LaW4vWnJZc09Vc3lCNUh2Wk1m?=
 =?utf-8?B?MVQvNkFsTzhqMzJ0bE5hSTRkc3llWW5ESGtTUHNhRStoSlQ4aW5WWTZSdG5W?=
 =?utf-8?B?WDNmM3BTL1c4SHhYaERleWVTa1NKOGRUZTAwQXhqSFB3UEJ2VVlwUnpCM29V?=
 =?utf-8?B?ME44MHAzSWxCVDRjRkVJYW44VU9IOFFnMzJBTnZSV0t4eXJwbUR2b3MrYmQy?=
 =?utf-8?B?OHo5NGdJMlU2cHIySW1kV3JVNEFLWmxFcmlyV0owYlA1U29QbHM2V2h3VEFJ?=
 =?utf-8?B?UlhsTGhEQ0Q3WEtKN2xKZFJCOHlPbmcxc3A1U2NGYnQvYk9CWFZuV29EMm8v?=
 =?utf-8?B?K2NsV3Y1MGthTFdYU0cwODVXNUpxTmk1aFJnU0xCdmZ1OWJSbUFTeXA4cHlV?=
 =?utf-8?B?d3BqMVJMQk9qb2M4eHFCWnNuL2hqSlFQVHFwOHE3bkVuNzVXZGZYUHdnQ1o3?=
 =?utf-8?B?QW9qRitTc0pFOVdGVXMwQ1Y5N1FabzVtTGYxN2NSUnIrdWJxbGY0Mm10VXhP?=
 =?utf-8?B?bkNqaFJia2x6bmk3QitFSGd0R3JxV21TVDdXcFRnSzVDeEVpL0xFTDVnYzAx?=
 =?utf-8?B?bWUyak13b1RkRXNDQ2k2RFhOVmxGaGZmM2M1WGU3eFJEOWl4QmNSaUR6dFgv?=
 =?utf-8?B?WlpYOXQ3ajB3V1RZK3BBSDFKTS9oL3lheTYxbzNxbFdsTDl3QVluMDJZRytK?=
 =?utf-8?B?dDV0bE5XOVdoVjFHYldMbEI2WldqMXgxNlRYTkNuS2YxWVlETWIxbDBMRzhm?=
 =?utf-8?B?c2FHM3NQRjV1VXl3ZEU5d3lYdW1IVTVtb0dGM2k0WVFRaDFZZGF1ckVEc2x3?=
 =?utf-8?B?YnRIZ0w2YWZGaDVnbFZYb3FvWWYzbWVSUmZpczN4N0c3dmlzaGJDT3ljYU1N?=
 =?utf-8?B?SlhXTU5PenllRm0wYTVyc2cyQ0IrdUJtak5taWhpUmFUbVRGMXl6VjRIdDE1?=
 =?utf-8?B?Ym5RUmFEeUk4WStJRGVvWEEvMTVubEx1YW5UMDBaSnZ4OFVGbG1yMWE3SlJV?=
 =?utf-8?B?a3RXQllPUGhoaTdNVS95SGJIa1p6YWthODBGckVnd3lsUnpHUXFsQXE2MnN3?=
 =?utf-8?B?ZXBzWGhXSzVpN20vSW53eDJuN2dxTDNPNGhMZTBkOE12UXpsZ2V2S2ovMkgv?=
 =?utf-8?B?aGM3MVN4S1dwdXNoTUJoMHdhekZKSVQ4WWo2R2lWdlhOS1RPdG56MG8vV0ZU?=
 =?utf-8?B?dHd0MGxVMW1ZZ0R5ZWVwQlIvbEpFOUlkem95UlpvTHd4SmlEZ2xNWWpYMG0y?=
 =?utf-8?B?ZkU1ZXBaTWhDZERUL1pER3M3eDVIbEh6ZDJCbldMOHlYUGNPSEZHaDlSY3RM?=
 =?utf-8?B?NzVIWVMrZWFOWkFoSVJRd0JWaUIxR0diVk9YQnFxVXoySDlhQ08xYTdQejha?=
 =?utf-8?B?NXJ3V1dtalJIOFRBOG40bU9UMFFQSHNtNkZINmhINHRZQWJ5djJXSTQySmtD?=
 =?utf-8?B?YzlRcjd1WWVNT2VkUVZPdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckhvVU1LZ3BEYjJKdUwvUlpOYys4SDBWQkRwZ1drZnZveFpBQ0JHNEI0QzdG?=
 =?utf-8?B?TVFkZzhjc0JhdTdEbWkxdnpJTFJvSjVMczB1OU1qZGRYRE1mVE0wME9XMnk3?=
 =?utf-8?B?Sjg0RTVtdjlKQ1RKaTlTbEhCTHBHTkE5K3hHWVJFZnhYQnNpV3loVFJLVGN4?=
 =?utf-8?B?WkFLQWZBeURIdnZxNGhKYWZtWExPYjVwVWZiUXJ6amFjZE5sS0pMdWZuRzEz?=
 =?utf-8?B?bmNxZUtQOWVzZVFTQmFVS3ZsSE5TZDhPb0N4cnVxK2Zyay9idExpS0Q2cGJw?=
 =?utf-8?B?TG1hTUlSUmdyRTZ3QlpaREpEV1lHakR0RHhCRVh0Vm15WlpYMGZXSCtsQjh3?=
 =?utf-8?B?R2wzZjVERFluNGJRMGpVL3R3RFhIY05NMk9yU1J3b0dmT0tBbGpaTWNtSGgv?=
 =?utf-8?B?N3ZSbzN3amFUN2NKKzh4NzY4a3U0cXBjeVBKalFuOUhFbnVtWXpaWTIrWDNv?=
 =?utf-8?B?QkJlTlFvY2VBRzN6LzNGb2tlM0pNeUR4dzNaNmsyN3J4N0hGUmRwMmw3TjFC?=
 =?utf-8?B?dS84VnpXUGU5U0ZRL1FXTGhwNk5ORFlrTzU1VVJaVDA2dzhxR1ZPVEhHbVZU?=
 =?utf-8?B?alFDbjV2cENjU2tjVjUrcHpCZ3JBcXFmS0Vjb21HVG9BTVNlZnhOTkdXenY1?=
 =?utf-8?B?cTlOSDB2QWdac3JtcDlZakRVS0lIOHpRZjlMMmN1L1FJQ3pYelI5WXB5OWJ5?=
 =?utf-8?B?dW5uM0lHOGtkdloyYUY3MXBISjhSZkNVOERQcWpKV0ZiQVhEQXlrVjB5V2tp?=
 =?utf-8?B?eXZCMC8xUHAvRWVDdG5PbW94MXpYdWJTdWg4MVFmUGREUTU1MXNBMXlCejRX?=
 =?utf-8?B?ZjJzUHdjb0xXVk83UkE0a2kxTkZjTzMwV1VDa0cyb2VkY3dhQyt3TVc2WC9L?=
 =?utf-8?B?eHhmeTF6NEVNN0U5Tml2b3VWYzVNVWJmU3lKcUwwOVN6bWRRaG9QVkxiREdT?=
 =?utf-8?B?OFhGejlYcFdWTFhxdGMxTWtjZVhIQ3lhQWY3cmRMV3Q3WnB6VWl0RDh1N1Fy?=
 =?utf-8?B?VlBrUVZnM0F1UjdIZDZkRnA3TXpzTm1WYWdhKyttUTY3WGVKOWFYSzBrR0w4?=
 =?utf-8?B?eGJwMUxabkZJVkt2OE8xcWYrNkw0RlNWSTk3M1N0S2pnak9IL2ZNT1cvZS95?=
 =?utf-8?B?Z3NlSjBBU0Mxa0Z1VkYvR2I4MFlPZUdOZVN3TFUyRXZvUmFMRFF6aHdBcVJm?=
 =?utf-8?B?cy9JRnhHdmg5WG1PeTVjTVZFWlZ3YUk3YUYxZHBpY3d2dDlWOTMyaEV4S3gr?=
 =?utf-8?B?TDdDWmJMSlB4UXY3cFZzalVabU84OUprMmJXQmd2WTJvVklxVTNuZ29kc29h?=
 =?utf-8?B?eGxJUVp2dThTWXFvTDcrblFhaGNTOVFTTFltVktGek5WSklkZzBaUXNzeUZL?=
 =?utf-8?B?M2xtNnorNGJ2Qk1UZ3kwWnlQR0xwc1NjYlJkUFErYlAyTit1UzFydlFEajJP?=
 =?utf-8?B?cHp5S1JnMUhVaGlmaTJGR3ZUakFqN2NUdFdoSjJwY0F3QTlRU3dqZ0xMZG81?=
 =?utf-8?B?NnprbzlNM0p2Z1l4QWNLZ29qdFlZYzVSUzhOMVF4ODlZcm5aaURzUHdKTWdw?=
 =?utf-8?B?ZjIrUVVCV1JXRk5aSHZDTkgrRU5oRjFIWjREQ1E2WnlDY0M1M1dnS3FnNTRW?=
 =?utf-8?B?NUhFcWVocDQwcUVYZTNRa3dZQ0JmbG4wUWwxZGlReWVjQmFkVXo2ME1seGw3?=
 =?utf-8?B?V3R2WGV6Ujd2VUpCeGMvV2NLK3UzdTg1QXVsZ2xFZG9ZOXZqZVpZNURHbWk0?=
 =?utf-8?B?WUZlQm9hdzA2QUFjbWxlMlN2SGZuYzRhSjZ2Q2tIOVQ3cTQ3Y3I1bEMrTkNL?=
 =?utf-8?B?WGhLU1lpTTFNK1dzRDBqL0tSMVh4UWVhd25CNFBZMVB1ZUFmWk1wMXJML1FX?=
 =?utf-8?B?d1hsdEJFRnd4RlpNMjVuaVdZTkhtZ3NzWDVEalJjZlp1SWFSS0VTeDBmcllY?=
 =?utf-8?B?QjNQclF6K0FCTytVTkRjTVNLZFlhTmV0V2Vsb2VBSUdPUmRZdWQxQmcyMHhV?=
 =?utf-8?B?MTQzR000U3gxaUMvVmVYSlVnQUZFbkRoSVpndiszSkJsemw0eHdXS0wwR3c3?=
 =?utf-8?B?RGVtbWFiSllmaGdZenllUUhEQzJNTVZnZG50MWlqNFZ3eTVnR3ZWRFFUazJG?=
 =?utf-8?Q?7h3SP0tfdJWY9enxzPX+Lvoj0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1061090c-9361-4de6-8f39-08dc9a6e292f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:08:31.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yVWN+nF/3Dq+suxQnLAhxW09FjTcIeJEez6kkC7nturP/ZhxUr6ZumNWvmQnama
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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

--------------ZOLD7R9PPZP0w3ivf05BWdj4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.07.24 um 03:46 schrieb Icenowy Zheng:
> 在 2024-07-01星期一的 13:40 +0200，Christian König写道：
>> Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
>>> 于 2024年6月30日 GMT+08:00 03:57:47，Jiaxun Yang
>>> <jiaxun.yang@flygoat.com>  写道：
>>>> 在2024年6月29日六月 上午6:22，Icenowy Zheng写道：
>>>> [...]
>>>>> @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
>>>>> ttm_buffer_object *bo,
>>>>> struct ttm_resource *res,
>>>>>                  caching = res->bus.caching;
>>>>>          }
>>>>>
>>>>> +       /* Downgrade cached mapping for non-snooping devices */
>>>>> +       if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>>>> +               caching = ttm_write_combined;
>>>> Hi Icenowy,
>>>>
>>>> Thanks for your patch! You saved many non-coh PCIe host
>>>> implementations a day!.
>> Ah, wait a second.
>>
>> Such a thing as non-coherent PCIe implementation doesn't exist. The
>> PCIe
>> specification makes it mandatory for memory access to be cache
>> coherent.
> Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X addendum
> 1.0, none of this explicitly requires the PCIe controller and the CPU
> being fully coherent. The PCI-X spec even says "Note that PCI-X, like
> conventional PCI, does not require systems to support coherent caches
> for addresses accessed by PCI-X requesters".

See the very first PCI specification, AGP 2.0 and the PCIe extension for 
non-snooped access.

Originally it wasn't well defined what the PCI 1.0 spec meant with 
coherency (e.g. snooping vs uncached).

AGP was the first specification which explicitly defined that all AGP 
memory accesses must be non-snooped and all PCI accesses must snoop the 
CPU caches.

PCIe then had an extension which defined the "No Snooping Attribute" to 
allow emulating the AGP behavior.

For the current PCIe 6.1 specification the non-snoop extension was 
merged into the base specification.

Here see section "2.2.6.5 No Snoop Attribute", e.g. "Hardware enforced 
cache coherency expected"

As well as the notes under section 7.5.3.4 Device Control Register:

Enable No Snoop - If this bit is Set, the Function is permitted to Set 
the No Snoop bit in the Requester
Attributes of transactions it initiates that do not require hardware 
enforced cache coherency (see Section 2.2.6.5 ).

To summarize it: Not snooping caches is an extension, snooping caches is 
mandatory.

> In addition, in the perspective of Linux, I think bypassing CPU cache
> of shared memory is considered as coherent access too, see
> dma_alloc_coherent() function's naming.

Yes that's correct, but this is for platform devices. E.g. other I/O 
from drivers who doesn't need to work with malloced system memory for 
example.

We have quite a bunch of V4L, sound and I also think network devices 
which work like that. But those are non-PCI devices.

>> There are a bunch of non-compliant PCIe implementations which have
>> broken cache coherency, but those explicitly violate the
>> specification
>> and because of that are not supported.
> Regardless of it violating the spec or not, these devices work with
> Linux subsystems that use dma_alloc_coherent to allocate DMA buffers
> (which is the most common case), and GPU drivers just give out cryptic
> error messages like "ring gfx test failed" without any mention of
> coherency issues at all, which makes the fact that Linux DRM/TTM
> subsystem currently requires PCIe snooping CPU cache more obscure.

No, they don't even remotely work. You just got very basic tests working.

Both the Vulkan as well as the OpenGL specification require that you can 
import "normal" malloced() system memory into the GPU driver.

This is not possible without a cache coherent platform architecture. So 
you can't fully support those APIs.

We exercised this quite extensively already and even have a confirmation 
from ARM engineers that the approach of attaching just any PCIe root to 
an ARM IP core is not supported from their side.

And if I'm not completely mistaken the RISC-V specification was also 
updated to disallow stuff like this.

So yes you can have boards which implement non-snooped PCIe, but you get 
exactly zero support from hardware vendors to run software on it.

Regards,
Christian.

>> Regards,
>> Christian.
>>
>>>> Unfortunately I don't think we can safely ttm_cached to
>>>> ttm_write_comnined, we've
>>>> had enough drama with write combine behaviour on all different
>>>> platforms.
>>>>
>>>> See drm_arch_can_wc_memory in drm_cache.h.
>>>>
>>> Yes this really sounds like an issue.
>>>
>>> Maybe the behavior of ttm_write_combined should furtherly be
>>> decided
>>> by drm_arch_can_wc_memory() in case of quirks?
>>>
>>>> Thanks
>>>>
>>>>> +
>>>>>          return ttm_prot_from_caching(caching, tmp);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_io_prot);
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> index 7b00ddf0ce49f..3335df45fba5e 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
>>>>> ttm_tt *ttm,
>>>>>                                 enum ttm_caching caching,
>>>>>                                 unsigned long extra_pages)
>>>>>    {
>>>>> +       /* Downgrade cached mapping for non-snooping devices */
>>>>> +       if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>>>> +               caching = ttm_write_combined;
>>>>> +
>>>>>          ttm->num_pages = (PAGE_ALIGN(bo->base.size) >>
>>>>> PAGE_SHIFT) + extra_pages;
>>>>>          ttm->page_flags = page_flags;
>>>>>          ttm->dma_address = NULL;
>>>>> diff --git a/include/drm/ttm/ttm_caching.h
>>>>> b/include/drm/ttm/ttm_caching.h
>>>>> index a18f43e93abab..f92d7911f50e4 100644
>>>>> --- a/include/drm/ttm/ttm_caching.h
>>>>> +++ b/include/drm/ttm/ttm_caching.h
>>>>> @@ -47,7 +47,8 @@ enum ttm_caching {
>>>>>
>>>>>          /**
>>>>>           * @ttm_cached: Fully cached like normal system memory,
>>>>> requires that
>>>>> -        * devices snoop the CPU cache on accesses.
>>>>> +        * devices snoop the CPU cache on accesses. Downgraded
>>>>> to
>>>>> +        * ttm_write_combined when the snooping capaiblity is
>>>>> missing.
>>>>>           */
>>>>>          ttm_cached
>>>>>    };
>>>>> -- 
>>>>> 2.45.2

--------------ZOLD7R9PPZP0w3ivf05BWdj4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 02.07.24 um 03:46 schrieb Icenowy Zheng:<br>
    <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">在 2024-07-01星期一的 13:40 +0200，Christian König写道：
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
于 2024年6月30日 GMT+08:00 03:57:47，Jiaxun Yang
<a class="moz-txt-link-rfc2396E" href="mailto:jiaxun.yang@flygoat.com">&lt;jiaxun.yang@flygoat.com&gt;</a> 写道：
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
在2024年6月29日六月 上午6:22，Icenowy Zheng写道：
[...]
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">@@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
ttm_buffer_object *bo,
struct ttm_resource *res,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = res-&gt;bus.caching;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Downgrade cached mapping for non-snooping devices */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!bo-&gt;bdev-&gt;dma_coherent &amp;&amp; caching == ttm_cached)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = ttm_write_combined;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Hi Icenowy,

Thanks for your patch! You saved many non-coh PCIe host
implementations a day!.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Ah, wait a second.

Such a thing as non-coherent PCIe implementation doesn't exist. The
PCIe 
specification makes it mandatory for memory access to be cache
coherent.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X addendum
1.0, none of this explicitly requires the PCIe controller and the CPU
being fully coherent. The PCI-X spec even says &quot;Note that PCI-X, like
conventional PCI, does not require systems to support coherent caches
for addresses accessed by PCI-X requesters&quot;.</pre>
    </blockquote>
    <br>
    See the very first PCI specification, AGP 2.0 and the PCIe extension
    for non-snooped access.<br>
    <br>
    Originally it wasn't well defined what the PCI 1.0 spec meant with
    coherency (e.g. snooping vs uncached).<br>
    <br>
    AGP was the first specification which explicitly defined that all
    AGP memory accesses must be non-snooped and all PCI accesses must
    snoop the CPU caches.<br>
    <br>
    PCIe then had an extension which defined the &quot;No Snooping Attribute&quot;
    to allow emulating the AGP behavior.<br>
    <br>
    For the current PCIe 6.1 specification the non-snoop extension was
    merged into the base specification.<br>
    <br>
    Here see section &quot;2.2.6.5 No Snoop Attribute&quot;, e.g. &quot;Hardware
    enforced cache coherency expected&quot;<br>
    <br>
    As well as the notes under section 7.5.3.4 Device Control Register:<br>
    <br>
    Enable No Snoop - If this bit is Set, the Function is permitted to
    Set the No Snoop bit in the Requester<br>
    Attributes of transactions it initiates that do not require hardware
    enforced cache coherency (see Section 2.2.6.5 ).<br>
    <br>
    To summarize it: Not snooping caches is an extension, snooping
    caches is mandatory.<br>
    <br>
    <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">In addition, in the perspective of Linux, I think bypassing CPU cache
of shared memory is considered as coherent access too, see
dma_alloc_coherent() function's naming.</pre>
    </blockquote>
    <br>
    Yes that's correct, but this is for platform devices. E.g. other I/O
    from drivers who doesn't need to work with malloced system memory
    for example.<br>
    <br>
    We have quite a bunch of V4L, sound and I also think network devices
    which work like that. But those are non-PCI devices.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
There are a bunch of non-compliant PCIe implementations which have 
broken cache coherency, but those explicitly violate the
specification 
and because of that are not supported.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Regardless of it violating the spec or not, these devices work with
Linux subsystems that use dma_alloc_coherent to allocate DMA buffers
(which is the most common case), and GPU drivers just give out cryptic
error messages like &quot;ring gfx test failed&quot; without any mention of
coherency issues at all, which makes the fact that Linux DRM/TTM
subsystem currently requires PCIe snooping CPU cache more obscure.</pre>
    </blockquote>
    <br>
    No, they don't even remotely work. You just got very basic tests
    working.<br>
    <br>
    Both the Vulkan as well as the OpenGL specification require that you
    can import &quot;normal&quot; malloced() system memory into the GPU driver.<br>
    <br>
    This is not possible without a cache coherent platform architecture.
    So you can't fully support those APIs.<br>
    <br>
    We exercised this quite extensively already and even have a
    confirmation from ARM engineers that the approach of attaching just
    any PCIe root to an ARM IP core is not supported from their side.<br>
    <br>
    And if I'm not completely mistaken the RISC-V specification was also
    updated to disallow stuff like this.<br>
    <br>
    So yes you can have boards which implement non-snooped PCIe, but you
    get exactly zero support from hardware vendors to run software on
    it.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Unfortunately I don't think we can safely ttm_cached to
ttm_write_comnined, we've
had enough drama with write combine behaviour on all different
platforms.

See drm_arch_can_wc_memory in drm_cache.h.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Yes this really sounds like an issue.

Maybe the behavior of ttm_write_combined should furtherly be
decided
by drm_arch_can_wc_memory() in case of quirks?

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Thanks

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ttm_prot_from_caching(caching, tmp);
&nbsp; }
&nbsp; EXPORT_SYMBOL(ttm_io_prot);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
b/drivers/gpu/drm/ttm/ttm_tt.c
index 7b00ddf0ce49f..3335df45fba5e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
ttm_tt *ttm,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum ttm_caching caching,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long extra_pages)
&nbsp; {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Downgrade cached mapping for non-snooping devices */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!bo-&gt;bdev-&gt;dma_coherent &amp;&amp; caching == ttm_cached)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = ttm_write_combined;
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;num_pages = (PAGE_ALIGN(bo-&gt;base.size) &gt;&gt;
PAGE_SHIFT) + extra_pages;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;page_flags = page_flags;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;dma_address = NULL;
diff --git a/include/drm/ttm/ttm_caching.h
b/include/drm/ttm/ttm_caching.h
index a18f43e93abab..f92d7911f50e4 100644
--- a/include/drm/ttm/ttm_caching.h
+++ b/include/drm/ttm/ttm_caching.h
@@ -47,7 +47,8 @@ enum ttm_caching {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @ttm_cached: Fully cached like normal system memory,
requires that
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * devices snoop the CPU cache on accesses.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * devices snoop the CPU cache on accesses. Downgraded
to
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ttm_write_combined when the snooping capaiblity is
missing.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm_cached
&nbsp; };
-- 
2.45.2
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------ZOLD7R9PPZP0w3ivf05BWdj4--
