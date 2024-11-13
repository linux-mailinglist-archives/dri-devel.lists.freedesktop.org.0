Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC29C6AA1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 09:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20E10E697;
	Wed, 13 Nov 2024 08:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3L7wgIU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBB610E694;
 Wed, 13 Nov 2024 08:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IURAczuw4+30wM1T8STLd/o9vQT5tEc9IbidwjczaH5g3AAmlN9NFbUBfmqAXYalxdprtn4zWjFECwbCdZhRmQnAMis6TZDlgjcmzBm1NCzmKHrJgKJK2r1O9PoDDP7vrwdvY414yCWBwIfg1EISnTi8+lfqEq9XPUQaDz+sj/0O8ScLMH2eqcz/pRCl4OxwOOcW0IAOQJSfS14S1xoTD0wKAfATCQxwGQyhyto/0KUbcPLEb1vnzDdcHTAyvp6H+BjxTQ/RO6zTR6g4dnIJ6eeOm6U49L2EahHlJ6noe0J0kYvEReJj9hOK5LsTE5KBn2Hxzv9e4qg6IlYB3F1nBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJwi+6fP8HdcWmuAuUJ3Cw/jl8l5DQkQmKejpfTl5ik=;
 b=Hp1NfeVzKJKK07NshkE/8VXUp2haGX7CbDcBEEuBiSqhw6aIF8xk+6yRAJ3ZBLcvk1I7Zyj0Yishy4F4Blw+RVWsLOwxaZDFIB2Jp8YW6i7eKet69DJh7EXRbtfALJ3SmovMvxZnejyPXFFEJVJJmTBlcpzmf19s23AlQh7nOApmWuZZzGWv3EkR7/UzuxvYCEbq9blUFuiZ/PO4kjl8n2NUjerV00inXLOnzUHBmFd5AyuSLfMyNG26I5u6hgc87lANvJeEfPhuIKB6EH2fpLQlm+IlVMnup3/DQ6TXBOQu/r1KEhbNhrQx0dHR4TV5upyIn+5I8yLURxB6mVKOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJwi+6fP8HdcWmuAuUJ3Cw/jl8l5DQkQmKejpfTl5ik=;
 b=3L7wgIU26M6T/zWEgPwOZgnSef2OB7GFjryN/D39AYUTsQQXk3h42DmvaHLJxPElTxBnS1K+7Bq5xUDVlLbiUp9XctOYugz9O2ArRwNaPZGfsaNqEkG5KdBKU8OwH2r4cIL2m+uA2uhAgnsLxM6i0WjRVI9gTT49YBEzBQtYKcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 08:37:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 08:37:11 +0000
Content-Type: multipart/alternative;
 boundary="------------2aERzTiTWHE00ELFojl2bCK0"
Message-ID: <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
Date: Wed, 13 Nov 2024 09:37:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 87bedfdc-2fee-4ed0-3056-08dd03be5de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDNhbFV0NDl2OG1NWVplYXJKK3hORkhoV0I2ZCsxUXFXRG4rOExuYUlPWitZ?=
 =?utf-8?B?NFNWMWM3UENZWXBpSzUrVFhqbUhza2pGZlU4dDJlbytLZ2FqSktlcGQvYWhp?=
 =?utf-8?B?SU5hTmpMQmx3OGhPOGtUemFjQ3pCNEs3M01HeTlnV3Y2T1RIVkVKVEpkeDdC?=
 =?utf-8?B?YWFFcEJHd0FnakRFSm5qVGtEUjdxalNMNTMxNWxCT2tmSjRHVFVTa1RWYVRh?=
 =?utf-8?B?aHVFZU9qRzFFRDE5bzQyR3NFY0drellwNU1VUmtOaFZBVTBsRU1Wc0hGSUVF?=
 =?utf-8?B?K0ZoanhaUDZrWk02QWo5b3l1bXN3NzBTNDVIUjM4K2pOSm5SN1h2bllFbkVX?=
 =?utf-8?B?RThqekZ5eFROekIyNTJmLzNiSitENW9OczZtancrL3lWZlg2Y1RROEhBeitI?=
 =?utf-8?B?YUpEYkNSSXM3WjZsWTdmNEJHOEhWVWhuY0NoTy9tdXkyeEdnNlp0RDBrYUoy?=
 =?utf-8?B?bmVmY01yc3EySEYxY0k5VkZ3cWRCUUMySVVMcU5lMHdlelJ2RmZoaU0yZ01u?=
 =?utf-8?B?TFdHeHR3YXdzeUVNTUdQUjBJQWIzKzluNm1McmlJQ3ZIYjNNTEtnVWFSeFR5?=
 =?utf-8?B?V3RWVm4zblo5YUZrOHNmTDIwaEl1ZllRY1dRc1dPSzQyR0NQbkJNMW0zcXVL?=
 =?utf-8?B?VTRXdEo0Y3BNbVZUQ0ZyRnYvYS9YL1dvZEZTZVB4VE9LeEtjNjhRWnBzcjNH?=
 =?utf-8?B?MXRQczFyZStPNytLQVp5S3hYb1BTQ29WYkdlV1JnOW1LWkRWcmwwdndVNmVk?=
 =?utf-8?B?R0dIRlQ5K1hVbzN1SU94YUQxWWd6S0lPTGZ2QkNnVnp3Q1d1RGtVZzRQLy8v?=
 =?utf-8?B?SFlVU3RIWnNPTlI5TnM2UVdSZENoWm9YRDd1Znl4c25Xa0M2ZGpVYjU1ajNm?=
 =?utf-8?B?WlZwVTdpVkpTY0Z2VkxpV2piVzhsRnFNY202OTh5SnlCL1JwN2lqMWJwcURO?=
 =?utf-8?B?RUZIZkozVEh6VlpCaFV4aHM2QTVhK1p0dndld2JROFRUOVZPWFlydHlMcjB1?=
 =?utf-8?B?c1NMaktLWlZqV2R6alB5a1JOWm9ZbzRGS1Y3blBZdXZObUVPWktlVUgvY3RF?=
 =?utf-8?B?em5Eb0QvWld0Q01UNnFrMUt2MEVHVkNRMHB2Q2RxeEE5azFUdXE2QzBHdlZ1?=
 =?utf-8?B?c0xqd2RkU1N1RXNleXBnejh2eHpwRGRzZlJ5VHNTcnQwTkN6cVlFQTBGR2dk?=
 =?utf-8?B?SmJCT1BvR01RY0N5c1c5a0QrQ1kwL01weEU3RjZRdmpPNlZiR1I1V2MzTDJO?=
 =?utf-8?B?RjdNY3pwdWJlRGcwbE4rSStqbTlrU2xuaHFESDhYWkFDOFRJK2tDbnFHN1Bl?=
 =?utf-8?B?NUduSFVNWXlkTjJUdUpKR0pYenI4aTRTbkNSMFNyOG04YWU2NTU5OGNudGFp?=
 =?utf-8?B?K2ZmUGJpSkVZSWtxVWtXRkZCRHdIaUdwWThPSkEwbzEzYlZ5SEhYM0Zya3Jp?=
 =?utf-8?B?LzZPbG1GTWFTQUJNci9Hc1dVOHlhZEVWMHB0QU80TS9LdkdyVW1QWEFwZUU0?=
 =?utf-8?B?QW9UODhIWTBRYlJZUSt6TWN6ZjVjeEN0T295Q0Nqd0lYSERSRVNZNVZ5VEh1?=
 =?utf-8?B?QlFWalREK3pFbWJNWU8wZ3ZwY0tRVldBSW92UzFTcXF5Q1dYeVBleSsySjJ3?=
 =?utf-8?B?NVU2QnFRSXM2NWN6NWdSdUkrRm9EanBXOVV1OEFBcm5qb0c5Wm1jUkJrMVpx?=
 =?utf-8?B?dWRCbmNJdXZvSldEK2NRZTlkQm9tR0x1Ryt0NEVuUlZIVVBXcmhZZi9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pBd3VDajNqaE9PMmJsSGhCcEVGaHZraVVabERjcnExSVFMNlRJMFhsTlpl?=
 =?utf-8?B?QkhpbDI1YzlaZGU1UUJ6TEJROWNGZi94VjN5UzFJVlVTQnI4Q3JIcmtJdENC?=
 =?utf-8?B?Z1Z4STU2eGd4bEdBRWwxVzBROFVvOTRYUmtCOFVLanNnUVNFeTZ1Q0JEQjY2?=
 =?utf-8?B?MTV0Q1V4SHlIUVRLbXZ6L1JUcmVieXllblZZZnBiOER4NGpZQk1BMkpBZS8r?=
 =?utf-8?B?TkRNZ3VNK0Qzd2JnM1VuczIwR1NIc2h0TkRaSHYwSWs5WFFpeGZscEIzNlBy?=
 =?utf-8?B?NmNwZUp3YmlEelRpWEUyenh0V3RtR0s3aE1wVXhTMElkTCtUaGlpbngzNXVV?=
 =?utf-8?B?UURwTVhjekNRdWNFVy9GTXhkNkpsSncrUWxrdllNZUZJeS9uVmxncVF1cTNI?=
 =?utf-8?B?L0h4bm5IVDJxVjVMQWlGWkxoK2htWS9vNGIzcS96TUNBQmoxRGVFbEJ0Ylly?=
 =?utf-8?B?Tld5K2pBUFdLKzl0ZG9ZNG9mcDBVR1VHQWR4S0lBOWxHbHRjSkZHQlowbHcv?=
 =?utf-8?B?RFBGTFRZdUhIdThjWGJGVURvR1loc1Nka3pCbitQNXBuSEVOTUZwd3EwMlJI?=
 =?utf-8?B?WC9DWUR6M05remE4MzVaWkpjekRzTjk0REljR1RKczBiaWxUWXdwd1VLdnRl?=
 =?utf-8?B?L3RtNWtEdWgyWk14K0Y5SkxvalQ5MU9ZMHRuN1IzajF1NFBuSThLS3NVWW5H?=
 =?utf-8?B?aitmaTVCOTAxR2dIdGRhaUtpNjNlcVA3NVJmZnljUm01RXY3aW16UUpYTytZ?=
 =?utf-8?B?Yk5QRzZpYk9WZzZ1aGxHYUUyc1ZJMWxpeHpTMU5WOCt5bHlVckhXaXVkMVdR?=
 =?utf-8?B?bzB5a2VoMGF2VmNwR2toMUlwWkpIbG9KamhOM0xmTzhJNC81NHZxa2sybS9s?=
 =?utf-8?B?aHIwa2NBM0hQZWMvZU5zSjVFU1RtYnhRVjljbytPUTV0R0dDZTdueWJkcm1W?=
 =?utf-8?B?aUNKcWpWcVFaMzVweVUraHlpYUtzV3o2UmNFQWZyZ1NLTXVVeEdPa2hKNVFY?=
 =?utf-8?B?Q2l5NDZCUHJta1lJcDc2RHVIb3A0eURKaXRyNjZSZ2RNZVRrdlovS2VkRXNF?=
 =?utf-8?B?YUdWTGEreFhxajYycHhSMmVmeHlhZ3RkRGlUZ1hKazJHcTF5c1pNbVpwcm8r?=
 =?utf-8?B?WW1ycm1kQWtWRVc2Sm1GVlZZZlNVRlhzelVVdjNRVFUyL0paRWsrMEEyTVlM?=
 =?utf-8?B?eHN4OWV2N004bzN6MC83akovSDY4djVCcHQ4MmkvYmdjUjZTdGxtdExOaDRm?=
 =?utf-8?B?YnJOWmV5bWRGNnNkTmppQlBOeEZUUjRZM3daQzdYUWtjQkZzam9jNDFmK3pk?=
 =?utf-8?B?VGowbUtITFE2R2xvRnBCRkdxS2NFbnZEVlh3VTA4bVlVa3lrQmsyaUl6OXlF?=
 =?utf-8?B?bVlid2RMdHV6dUUvd01LaUQrUDZtVTVtL1ZxKzVzc1hkUnlzUnhWTnJ6VWFq?=
 =?utf-8?B?QWtpelJ6a0VndDZtamlsL3RLOEJMK3JqZjQ5Tm4wUVRlOU5CNW9mdW91WTEv?=
 =?utf-8?B?SlRkM3R5aEdxZEN2bkFmc095OWtuWHdaVjhFZWtNTmNiWGkvTWtvOUd6RllQ?=
 =?utf-8?B?bHhzc3VIcXVvU2tnbDJwRFVhb3pzZVN2Q1dETnBaZ3FabEFobCt5THNBQlB4?=
 =?utf-8?B?ajJtWmF4VHJPdW1pMFRnOFd5K3o5ZGJuUjRkcWwzVU85V1hXbVpDNVpwbUp0?=
 =?utf-8?B?eFl5OWNIQWl1UWp1OFpBWmNadUZGZStMZU4zUlh0OUZQalAvMndsS1Rwa0Zt?=
 =?utf-8?B?NTFBb2EzK3c2S1NKNk8yTms3aTB2UmlZNStOcHVJMDFXd2dvM3RvTWRUb05o?=
 =?utf-8?B?REZWcTZZZGtKalhIUmgraVhtb09lSmxqa21ZZVBKZkJzWVF0dVpQdWVrTXdt?=
 =?utf-8?B?bERSL3kvY1FXUk5tS2tYOFNLbThWbERqWVlRVk9zb1VUaGdHMzYyLy9PanVt?=
 =?utf-8?B?U0xremVQNFhaZHB1SXZtdTA2OWRqT1YveUEvY3R2OUtHbjkvdmE5TUhmMjhG?=
 =?utf-8?B?RmcyanhFeUxZWmZOSS9OU0JNUk5ZME9Od1VyRVpqeHpMZXlDMFZWNWxKbHRM?=
 =?utf-8?B?WkdZeVVhTWhsYi9jM0dPTGtaUDBRT0N4WG11ZWErUk5wY0FSaFZWSGdpWXR5?=
 =?utf-8?Q?MKzGjezsUZ8E+PjHYKqtqEgmQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bedfdc-2fee-4ed0-3056-08dd03be5de6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 08:37:11.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD2aok1JVm1DTCjotOisWepjgily77D8b8v8agrpXTs9Sn0kvzxPzphRxi0Ossmf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
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

--------------2aERzTiTWHE00ELFojl2bCK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.11.24 um 17:33 schrieb Thomas Hellström:
> [SNIP]
>>>> This has been extensively discussed already, but was expected to
>>>> really
>>>> only be needed for low-on-memory scenarios. However it now seems
>>>> like
>>>> the need is much earlier due to the random userptr page joining
>>>> by
>>>> core
>>>> mm.
>>> Just to clarify here:
>>>    
>>> In Long-Running mode with recoverable pagefaults enabled we don't
>>> have
>>> any preempt-fences, but rather just zap the PTEs pointing to the
>>> affected memory and flush TLB. So from a memory resource POW a
>>> breakpoint should be safe, and no mmu notifier nor shrinker will be
>>> blocked.
>> That sounds like a HMM based approach which would clearly work.
>>
>> But where is that? I don't see any HMM based approach anywhere in the
>> XE
>> driver.
> This is a mode that uses recoverable pagefaults to fault either full
> userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
> (not SVM)!
>
> userptrs in xe are bo-less, and using the vm's resv, but otherwise
> using hmm similar to amdgpu: xe_hmm.c

Yeah, I have seen that one.

> fault servicing:
> xe_gt_pagefault.c
>
> PTE zapping on eviction and notifier:
> xe_vm_invalidate_vma(), xe_vm.c

Ah, that was the stuff I was missing.

So the implementation in xe_preempt_fence.c is just for graphics 
submissions? That would make the whole thing much easier to handle.

The only remaining question I can then see is if long running 
submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially block 
graphics submissions without this flag from accessing the hardware?

Thanks a lot for pointing this out,
Christian.

>
> Thanks,
> Thomas
>
>> Regards,
>> Christian.
>>
>>> Nor will there be any jobs with published dma-fences depending on
>>> the
>>> job blocked either temporarily by a pagefault or long-term by a
>>> debugger breakpoint.
>>>
>>> /Thomas
>>>
>>>
>>>> If that is done and the memory pre-empt fence is serviced even
>>>> for
>>>> debuggable contexts, do you have further concerns with the
>>>> presented
>>>> approach
>>>> from dma-buf and drm/sched perspective?
>>>>
>>>> Regards, Joonas
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>
>>>>>           This means that a breakpoint or core dump doesn't halt
>>>>> GPU
>>>>> threads, but
>>>>>           rather suspends them. E.g. all running wave data is
>>>>> collected into a state
>>>>>           bag which can be restored later on.
>>>>>
>>>>>           I was under the impression that those long running
>>>>> compute
>>>>> threads do
>>>>>           exactly that, but when the hardware can't switch out
>>>>> the
>>>>> GPU thread/process
>>>>>           while in a break then that isn't the case.
>>>>>
>>>>>           As long as you don't find a way to avoid that this
>>>>> patch
>>>>> set is a pretty
>>>>>           clear NAK from my side as DMA-buf and TTM maintainer.
>>>>>
>>>>>
>>>>>       I believe this is addressed above.
>>>>>
>>>>>       Matt
>>>>>
>>>>>
>>>>>           What might work is to keep the submission on the
>>>>> hardware
>>>>> in the break state
>>>>>           but forbid any memory access. This way you can signal
>>>>> your
>>>>> preemption fence
>>>>>           even when the hardware isn't made available.
>>>>>
>>>>>           Before you continue XE setups a new pre-emption fence
>>>>> and
>>>>> makes sure that
>>>>>           all page tables etc... are up to date.
>>>>>
>>>>>           Could be tricky to get this right if completion fence
>>>>> based
>>>>> submissions are
>>>>>           mixed in as well, but that gives you at least a
>>>>> direction
>>>>> you could
>>>>>           potentially go.
>>>>>
>>>>>           Regards,
>>>>>           Christian.
>>>>>
>>>>>
>>>>>               Regards, Joonas
>>>>>
>>>>>
>>>>>                   Regards,
>>>>>                   Christian.
>>>>>
>>>>>
>>>>>                       Some wash-up thoughts from me below, but
>>>>> consider them fairly irrelevant
>>>>>                       since I think the main driver for these
>>>>> big
>>>>> questions here should be
>>>>>                       gdb/userspace.
>>>>>
>>>>>
>>>>>                           Quoting Christian König (2024-11-07
>>>>> 11:44:33)
>>>>>
>>>>>                               Am 06.11.24 um 18:00 schrieb
>>>>> Matthew
>>>>> Brost:
>>>>>
>>>>>                                     [SNIP]
>>>>>
>>>>>                                     This is not a generic
>>>>> interface
>>>>> that anyone can freely access. The same
>>>>>                                     permissions used by ptrace
>>>>> are
>>>>> checked when opening such an interface.
>>>>>                                     See [1] [2].
>>>>>
>>>>>                                    
>>>>> [1]
>>>>> https://patchwork.freedesktop.org/patch/617470/?series=136572&r
>>>>> e
>>>>> v=2
>>>>>                                    
>>>>> [2]
>>>>> https://patchwork.freedesktop.org/patch/617471/?series=136572&r
>>>>> e
>>>>> v=2
>>>>>
>>>>>
>>>>>                               Thanks a lot for those pointers,
>>>>> that
>>>>> is exactly what I was looking for.
>>>>>
>>>>>                               And yeah, it is what I feared. You
>>>>> are
>>>>> re-implementing existing functionality,
>>>>>                               but see below.
>>>>>
>>>>>                           Could you elaborate on what this
>>>>> "existing
>>>>> functionality" exactly is?
>>>>>                           I do not think this functionality
>>>>> exists at
>>>>> this time.
>>>>>
>>>>>                           The EU debugging architecture for Xe
>>>>> specifically avoids the need for GDB
>>>>>                           to attach with ptrace to the CPU
>>>>> process or
>>>>> interfere with the CPU process for
>>>>>                           the debugging via parasitic threads or
>>>>> so.
>>>>>
>>>>>                           Debugger connection is opened to the
>>>>> DRM
>>>>> driver for given PID (which uses the
>>>>>                           ptrace may access check for now) after
>>>>> which the all DRM client of that
>>>>>                           PID are exposed to the debugger
>>>>> process.
>>>>>
>>>>>                           What we want to expose via that
>>>>> debugger
>>>>> connection is the ability for GDB to
>>>>>                           read/write the different GPU VM
>>>>> address
>>>>> spaces (ppGTT for Intel GPUs) just like
>>>>>                           the EU threads would see them. Note
>>>>> that
>>>>> the layout of the ppGTT is
>>>>>                           completely up to the userspace driver
>>>>> to
>>>>> setup and is mostly only partially
>>>>>                           equal to the CPU address space.
>>>>>
>>>>>                           Specifically as part of
>>>>> reading/writing the
>>>>> ppGTT for debugging purposes,
>>>>>                           there are deep flushes needed: for
>>>>> example
>>>>> flushing instruction cache
>>>>>                           when adding/removing breakpoints.
>>>>>
>>>>>                           Maybe that will explain the
>>>>> background. I
>>>>> elaborate on this at the end some more.
>>>>>
>>>>>
>>>>>                                             kmap/vmap are used
>>>>> everywhere in the DRM subsystem to access BOs, so I’m
>>>>>                                             failing to see the
>>>>> problem with adding a simple helper based on existing
>>>>>                                             code.
>>>>>
>>>>>                                         What#s possible and
>>>>> often
>>>>> done is to do kmap/vmap if you need to implement a
>>>>>                                         CPU copy for scanout for
>>>>> example or for copying/validating command buffers.
>>>>>                                         But that usually
>>>>> requires
>>>>> accessing the whole BO and has separate security
>>>>>                                         checks.
>>>>>
>>>>>                                         When you want to access
>>>>> only
>>>>> a few bytes of a BO that sounds massively like
>>>>>                                         a peek/poke like
>>>>> interface
>>>>> and we have already rejected that more than once.
>>>>>                                         There even used to be
>>>>> standardized GEM IOCTLs for that which have been
>>>>>                                         removed by now.
>>>>>
>>>>>                           Referring to the explanation at top:
>>>>> These
>>>>> IOCTL are not for the debugging target
>>>>>                           process to issue. The peek/poke
>>>>> interface
>>>>> is specifically for GDB only
>>>>>                           to facilitate the emulation of memory
>>>>> reads/writes on the GPU address
>>>>>                           space as they were done by EUs
>>>>> themselves.
>>>>> And to recap: for modifying
>>>>>                           instructions for example (add/remove
>>>>> breakpoint), extra level of cache flushing is
>>>>>                           needed which is not available to
>>>>> regular
>>>>> userspace.
>>>>>
>>>>>                           I specifically discussed with Sima on
>>>>> the
>>>>> difference before moving forward with this
>>>>>                           design originally. If something has
>>>>> changed
>>>>> since then, I'm of course happy to rediscuss.
>>>>>
>>>>>                           However, if this code can't be added,
>>>>> not
>>>>> sure how we would ever be able
>>>>>                           to implement core dumps for GPU
>>>>> threads/memory?
>>>>>
>>>>>
>>>>>                                         If you need to access
>>>>> BOs
>>>>> which are placed in not CPU accessible memory then
>>>>>                                         implement the access
>>>>> callback
>>>>> for ptrace, see amdgpu_ttm_access_memory for
>>>>>                                         an example how to do
>>>>> this.
>>>>>
>>>>>                           As also mentioned above, we don't work
>>>>> via
>>>>> ptrace at all when it comes
>>>>>                           to debugging the EUs. The only thing
>>>>> used
>>>>> for now is the ptrace_may_access to
>>>>>                           implement similar access restrictions
>>>>> as
>>>>> ptrace has. This can be changed
>>>>>                           to something else if needed.
>>>>>
>>>>>
>>>>>                                     Ptrace access via
>>>>> vm_operations_struct.access → ttm_bo_vm_access.
>>>>>
>>>>>                                     This series renames
>>>>> ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>>>
>>>>>                                     The above function accesses
>>>>> a BO
>>>>> via kmap if it is in SYSTEM / TT,
>>>>>                                     which is existing code.
>>>>>
>>>>>                                     This function is only
>>>>> exposed to
>>>>> user space via ptrace permissions.
>>>>>
>>>>>                           Maybe this sentence is what caused the
>>>>> confusion.
>>>>>
>>>>>                           Userspace is never exposed with
>>>>> peek/poke
>>>>> interface, only the debugger
>>>>>                           connection which is its own FD.
>>>>>
>>>>>
>>>>>                                     In this series, we implement
>>>>> a
>>>>> function [3] similar to
>>>>>                                     amdgpu_ttm_access_memory for
>>>>> the
>>>>> TTM vfunc access_memory. What is
>>>>>                                     missing is non-visible CPU
>>>>> memory
>>>>> access, similar to
>>>>>                                    
>>>>> amdgpu_ttm_access_memory_sdma.
>>>>> This will be addressed in a follow-up and
>>>>>                                     was omitted in this series
>>>>> given
>>>>> its complexity.
>>>>>
>>>>>                                     So, this looks more or less
>>>>> identical to AMD's ptrace implementation,
>>>>>                                     but in GPU address space.
>>>>> Again,
>>>>> I fail to see what the problem is here.
>>>>>                                     What am I missing?
>>>>>
>>>>>
>>>>>                               The main question is why can't you
>>>>> use
>>>>> the existing interfaces directly?
>>>>>
>>>>>                           We're not working on the CPU address
>>>>> space
>>>>> or BOs. We're working
>>>>>                           strictly on the GPU address space as
>>>>> would
>>>>> be seen by an EU thread if it
>>>>>                           accessed address X.
>>>>>
>>>>>
>>>>>                               Additional to the peek/poke
>>>>> interface
>>>>> of ptrace Linux has the pidfd_getfd
>>>>>                               system call, see
>>>>> herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>>>
>>>>>                               The pidfd_getfd() allows to dup()
>>>>> the
>>>>> render node file descriptor into your gdb
>>>>>                               process. That in turn gives you
>>>>> all the
>>>>> access you need from gdb, including
>>>>>                               mapping BOs and command submission
>>>>> on
>>>>> behalf of the application.
>>>>>
>>>>>                           We're not operating on the CPU address
>>>>> space nor are we operating on BOs
>>>>>                           (there is no concept of BO in the EU
>>>>> debug
>>>>> interface). Each VMA in the VM
>>>>>                           could come from anywhere, only the
>>>>> start
>>>>> address and size matter. And
>>>>>                           neither do we need to interfere with
>>>>> the
>>>>> command submission of the
>>>>>                           process under debug.
>>>>>
>>>>>
>>>>>                               As far as I can see that allows
>>>>> for the
>>>>> same functionality as the eudebug
>>>>>                               interface, just without any driver
>>>>> specific code messing with ptrace
>>>>>                               permissions and peek/poke
>>>>> interfaces.
>>>>>
>>>>>                               So the question is still why do
>>>>> you
>>>>> need the whole eudebug interface in the
>>>>>                               first place? I might be missing
>>>>> something, but that seems to be superfluous
>>>>>                               from a high level view.
>>>>>
>>>>>                           Recapping from above. It is to allow
>>>>> the
>>>>> debugging of EU threads per DRM
>>>>>                           client, completely independent of the
>>>>> CPU
>>>>> process. If ptrace_may_acces
>>>>>                           is the sore point, we could consider
>>>>> other
>>>>> permission checks, too. There
>>>>>                           is no other connection to ptrace in
>>>>> this
>>>>> architecture as single
>>>>>                           permission check to know if PID is
>>>>> fair
>>>>> game to access by debugger
>>>>>                           process.
>>>>>
>>>>>                           Why no parasitic thread or ptrace:
>>>>> Going
>>>>> forward, binding the EU debugging to
>>>>>                           the DRM client would also pave way for
>>>>> being able to extend core kernel generated
>>>>>                           core dump with each DRM client's EU
>>>>> thread/memory dump. We have similar
>>>>>                           feature called "Offline core dump"
>>>>> enabled
>>>>> in the downstream public
>>>>>                           trees for i915, where we currently
>>>>> attach
>>>>> the EU thread dump to i915 error state
>>>>>                           and then later combine i915 error
>>>>> state
>>>>> with CPU core dump file with a
>>>>>                           tool.
>>>>>
>>>>>                           This is relatively little amount of
>>>>> extra
>>>>> code, as this baseline series
>>>>>                           already introduces GDB the ability to
>>>>> perform the necessary actions.
>>>>>                           It's just the matter of kernel driver
>>>>> calling: "stop all threads", then
>>>>>                           copying the memory map and memory
>>>>> contents
>>>>> for GPU threads, just like is
>>>>>                           done for CPU threads.
>>>>>
>>>>>                           With parasitic thread injection, not
>>>>> sure
>>>>> if there is such way forward,
>>>>>                           as it would seem to require to inject
>>>>> quite
>>>>> abit more logic to core kernel?
>>>>>
>>>>>
>>>>>                               It's true that the AMD KFD part
>>>>> has
>>>>> still similar functionality, but that is
>>>>>                               because of the broken KFD design
>>>>> of
>>>>> tying driver state to the CPU process
>>>>>                               (which makes it inaccessible for
>>>>> gdb
>>>>> even with imported render node fd).
>>>>>
>>>>>                               Both Sima and I (and partially
>>>>> Dave as
>>>>> well) have pushed back on the KFD
>>>>>                               approach. And the long term plan
>>>>> is to
>>>>> get rid of such device driver specific
>>>>>                               interface which re-implement
>>>>> existing
>>>>> functionality just differently.
>>>>>
>>>>>                           Recapping, this series is not adding
>>>>> it
>>>>> back. The debugger connection
>>>>>                           is a separate FD from the DRM one,
>>>>> with
>>>>> separate IOCTL set. We don't allow
>>>>>                           the DRM FD any new operations based on
>>>>> ptrace is attached or not. We
>>>>>                           don't ever do that check even.
>>>>>
>>>>>                           We only restrict the opening of the
>>>>> debugger connection to given PID with
>>>>>                           ptrace_may_access check for now. That
>>>>> can
>>>>> be changed to something else,
>>>>>                           if necessary.
>>>>>
>>>>>                       Yeah I think unnecessarily tying gpu
>>>>> processes
>>>>> to cpu processes is a bad
>>>>>                       thing, least because even today all the
>>>>> svm
>>>>> discussions we have still hit
>>>>>                       clear use-cases, where a 1:1 match is not
>>>>> wanted (like multiple gpu svm
>>>>>                       sections with offsets). Not even speaking
>>>>> of
>>>>> all the gpu usecases where
>>>>>                       the gpu vm space is still entirely
>>>>> independent
>>>>> of the cpu side.
>>>>>
>>>>>                       So that's why I think this entirely
>>>>> separate
>>>>> approach looks like the right
>>>>>                       one, with ptrace_may_access as the access
>>>>> control check to make sure we
>>>>>                       match ptrace on the cpu side.
>>>>>
>>>>>                       But there's very obviously a bikeshed to
>>>>> be had
>>>>> on what the actual uapi
>>>>>                       should look like, especially how gdb opens
>>>>> up a
>>>>> gpu debug access fd. But I
>>>>>                       also think that's not much on drm to
>>>>> decide,
>>>>> but whatever gdb wants. And
>>>>>                       then we aim for some consistency on that
>>>>> lookup/access control part
>>>>>                       (ideally, I might be missing some reasons
>>>>> why
>>>>> this is a bad idea) across
>>>>>                       drm drivers.
>>>>>
>>>>>
>>>>>                               So you need to have a really
>>>>> really
>>>>> good explanation why the eudebug interface
>>>>>                               is actually necessary.
>>>>>
>>>>>                           TL;DR The main point is to decouple
>>>>> the
>>>>> debugging of the EU workloads from the
>>>>>                           debugging of the CPU process. This
>>>>> avoids
>>>>> the interference with the CPU process with
>>>>>                           parasitic thread injection. Further
>>>>> this
>>>>> also allows generating a core dump
>>>>>                           without any GDB connected. There are
>>>>> also
>>>>> many other smaller pros/cons
>>>>>                           which can be discussed but for the
>>>>> context
>>>>> of this patch, this is the
>>>>>                           main one.
>>>>>
>>>>>                           So unlike parasitic thread injection,
>>>>> we
>>>>> don't unlock any special IOCTL for
>>>>>                           the process under debug to be
>>>>> performed by
>>>>> the parasitic thread, but we
>>>>>                           allow the minimal set of operations to
>>>>> be
>>>>> performed by GDB as if those were
>>>>>                           done on the EUs themselves.
>>>>>
>>>>>                           One can think of it like the minimal
>>>>> subset
>>>>> of ptrace but for EU threads,
>>>>>                           not the CPU threads. And thus,
>>>>> building on
>>>>> this it's possible to extend
>>>>>                           the core kernel generated core dumps
>>>>> with
>>>>> DRM specific extension which
>>>>>                           would contain the EU thread/memory
>>>>> dump.
>>>>>
>>>>>                       It might be good to document (in that
>>>>> debugging
>>>>> doc patch probably) why
>>>>>                       thread injection is not a great option,
>>>>> and why
>>>>> the tradeoffs for
>>>>>                       debugging are different than for for
>>>>> checkpoint/restore, where with CRIU
>>>>>                       we landed on doing most of this in
>>>>> userspace,
>>>>> and often requiring
>>>>>                       injection threads to make it all work.
>>>>>
>>>>>                       Cheers, Sima
>>>>>
>>>>>
>>>>>                           Regards, Joonas
>>>>>
>>>>>
>>>>>                               Regards,
>>>>>                               Christian.
>>>>>
>>>>>
>>>>>
>>>>>                                     Matt
>>>>>
>>>>>                                    
>>>>> [3]
>>>>> https://patchwork.freedesktop.org/patch/622520/?series=140200&r
>>>>> e
>>>>> v=6
>>>>>
>>>>>
>>>>>                                         Regards,
>>>>>                                         Christian.
>>>>>
>>>>>
>>>>>                                             Matt
>>>>>
>>>>>
>>>>>                                                 Regards,
>>>>>                                                 Christian.
>>>>>
>>>>>
>>>>>

--------------2aERzTiTWHE00ELFojl2bCK0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 12.11.24 um 17:33 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This has been extensively discussed already, but was expected to
really
only be needed for low-on-memory scenarios. However it now seems
like
the need is much earlier due to the random userptr page joining
by
core
mm.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Just to clarify here:
&nbsp; 
In Long-Running mode with recoverable pagefaults enabled we don't
have
any preempt-fences, but rather just zap the PTEs pointing to the
affected memory and flush TLB. So from a memory resource POW a
breakpoint should be safe, and no mmu notifier nor shrinker will be
blocked.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That sounds like a HMM based approach which would clearly work.

But where is that? I don't see any HMM based approach anywhere in the
XE 
driver.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is a mode that uses recoverable pagefaults to fault either full
userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
(not SVM)!

userptrs in xe are bo-less, and using the vm's resv, but otherwise
using hmm similar to amdgpu: xe_hmm.c</pre>
    </blockquote>
    <br>
    Yeah, I have seen that one.<br>
    <br>
    <blockquote type="cite" cite="mid:d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">fault servicing:
xe_gt_pagefault.c

PTE zapping on eviction and notifier:
xe_vm_invalidate_vma(), xe_vm.c</pre>
    </blockquote>
    <br>
    Ah, that was the stuff I was missing.<br>
    <br>
    So the implementation in xe_preempt_fence.c is just for graphics
    submissions? That would make the whole thing much easier to handle.<br>
    <br>
    The only remaining question I can then see is if long running
    submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially
    block graphics submissions without this flag from accessing the
    hardware?<br>
    <br>
    Thanks a lot for pointing this out,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Nor will there be any jobs with published dma-fences depending on
the
job blocked either temporarily by a pagefault or long-term by a
debugger breakpoint.

/Thomas


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">If that is done and the memory pre-empt fence is serviced even
for
debuggable contexts, do you have further concerns with the
presented
approach
from dma-buf and drm/sched perspective?

Regards, Joonas

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This means that a breakpoint or core dump doesn't halt
GPU
threads, but
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rather suspends them. E.g. all running wave data is
collected into a state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bag which can be restored later on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I was under the impression that those long running
compute
threads do
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exactly that, but when the hardware can't switch out
the
GPU thread/process
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while in a break then that isn't the case.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As long as you don't find a way to avoid that this
patch
set is a pretty
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear NAK from my side as DMA-buf and TTM maintainer.


&nbsp;&nbsp;&nbsp;&nbsp; I believe this is addressed above.

&nbsp;&nbsp;&nbsp;&nbsp; Matt


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What might work is to keep the submission on the
hardware
in the break state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but forbid any memory access. This way you can signal
your
preemption fence
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; even when the hardware isn't made available.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Before you continue XE setups a new pre-emption fence
and
makes sure that
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all page tables etc... are up to date.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Could be tricky to get this right if completion fence
based
submissions are
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mixed in as well, but that gives you at least a
direction
you could
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; potentially go.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards, Joonas


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Some wash-up thoughts from me below, but
consider them fairly irrelevant
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; since I think the main driver for these
big
questions here should be
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb/userspace.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quoting Christian König (2024-11-07
11:44:33)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Am 06.11.24 um 18:00 schrieb
Matthew
Brost:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SNIP]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is not a generic
interface
that anyone can freely access. The same
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permissions used by ptrace
are
checked when opening such an interface.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; See [1] [2].

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[1]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;r">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;r</a>
e
v=2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[2]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;r">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;r</a>
e
v=2


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks a lot for those pointers,
that
is exactly what I was looking for.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; And yeah, it is what I feared. You
are
re-implementing existing functionality,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but see below.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Could you elaborate on what this
&quot;existing
functionality&quot; exactly is?
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I do not think this functionality
exists at
this time.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The EU debugging architecture for Xe
specifically avoids the need for GDB
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to attach with ptrace to the CPU
process or
interfere with the CPU process for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the debugging via parasitic threads or
so.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Debugger connection is opened to the
DRM
driver for given PID (which uses the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptrace may access check for now) after
which the all DRM client of that
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PID are exposed to the debugger
process.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What we want to expose via that
debugger
connection is the ability for GDB to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write the different GPU VM
address
spaces (ppGTT for Intel GPUs) just like
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the EU threads would see them. Note
that
the layout of the ppGTT is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; completely up to the userspace driver
to
setup and is mostly only partially
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; equal to the CPU address space.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Specifically as part of
reading/writing the
ppGTT for debugging purposes,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; there are deep flushes needed: for
example
flushing instruction cache
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; when adding/removing breakpoints.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe that will explain the
background. I
elaborate on this at the end some more.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmap/vmap are used
everywhere in the DRM subsystem to access BOs, so I’m
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; failing to see the
problem with adding a simple helper based on existing
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What#s possible and
often
done is to do kmap/vmap if you need to implement a
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CPU copy for scanout for
example or for copying/validating command buffers.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But that usually
requires
accessing the whole BO and has separate security
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checks.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When you want to access
only
a few bytes of a BO that sounds massively like
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a peek/poke like
interface
and we have already rejected that more than once.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; There even used to be
standardized GEM IOCTLs for that which have been
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; removed by now.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Referring to the explanation at top:
These
IOCTL are not for the debugging target
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process to issue. The peek/poke
interface
is specifically for GDB only
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to facilitate the emulation of memory
reads/writes on the GPU address
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; space as they were done by EUs
themselves.
And to recap: for modifying
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instructions for example (add/remove
breakpoint), extra level of cache flushing is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; needed which is not available to
regular
userspace.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I specifically discussed with Sima on
the
difference before moving forward with this
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; design originally. If something has
changed
since then, I'm of course happy to rediscuss.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; However, if this code can't be added,
not
sure how we would ever be able
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to implement core dumps for GPU
threads/memory?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If you need to access
BOs
which are placed in not CPU accessible memory then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement the access
callback
for ptrace, see amdgpu_ttm_access_memory for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; an example how to do
this.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As also mentioned above, we don't work
via
ptrace at all when it comes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to debugging the EUs. The only thing
used
for now is the ptrace_may_access to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement similar access restrictions
as
ptrace has. This can be changed
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to something else if needed.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ptrace access via
vm_operations_struct.access → ttm_bo_vm_access.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This series renames
ttm_bo_vm_access to ttm_bo_access, with no code changes.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The above function accesses
a BO
via kmap if it is in SYSTEM / TT,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which is existing code.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This function is only
exposed to
user space via ptrace permissions.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maybe this sentence is what caused the
confusion.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Userspace is never exposed with
peek/poke
interface, only the debugger
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connection which is its own FD.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In this series, we implement
a
function [3] similar to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_access_memory for
the
TTM vfunc access_memory. What is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; missing is non-visible CPU
memory
access, similar to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
amdgpu_ttm_access_memory_sdma.
This will be addressed in a follow-up and
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; was omitted in this series
given
its complexity.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So, this looks more or less
identical to AMD's ptrace implementation,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but in GPU address space.
Again,
I fail to see what the problem is here.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What am I missing?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The main question is why can't you
use
the existing interfaces directly?

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We're not working on the CPU address
space
or BOs. We're working
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strictly on the GPU address space as
would
be seen by an EU thread if it
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; accessed address X.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Additional to the peek/poke
interface
of ptrace Linux has the pidfd_getfd
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system call, see
herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The pidfd_getfd() allows to dup()
the
render node file descriptor into your gdb
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process. That in turn gives you
all the
access you need from gdb, including
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping BOs and command submission
on
behalf of the application.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We're not operating on the CPU address
space nor are we operating on BOs
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (there is no concept of BO in the EU
debug
interface). Each VMA in the VM
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; could come from anywhere, only the
start
address and size matter. And
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; neither do we need to interfere with
the
command submission of the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process under debug.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As far as I can see that allows
for the
same functionality as the eudebug
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interface, just without any driver
specific code messing with ptrace
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permissions and peek/poke
interfaces.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So the question is still why do
you
need the whole eudebug interface in the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first place? I might be missing
something, but that seems to be superfluous
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from a high level view.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Recapping from above. It is to allow
the
debugging of EU threads per DRM
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client, completely independent of the
CPU
process. If ptrace_may_acces
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is the sore point, we could consider
other
permission checks, too. There
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is no other connection to ptrace in
this
architecture as single
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permission check to know if PID is
fair
game to access by debugger
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Why no parasitic thread or ptrace:
Going
forward, binding the EU debugging to
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the DRM client would also pave way for
being able to extend core kernel generated
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; core dump with each DRM client's EU
thread/memory dump. We have similar
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature called &quot;Offline core dump&quot;
enabled
in the downstream public
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trees for i915, where we currently
attach
the EU thread dump to i915 error state
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and then later combine i915 error
state
with CPU core dump file with a
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tool.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is relatively little amount of
extra
code, as this baseline series
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; already introduces GDB the ability to
perform the necessary actions.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It's just the matter of kernel driver
calling: &quot;stop all threads&quot;, then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; copying the memory map and memory
contents
for GPU threads, just like is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done for CPU threads.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With parasitic thread injection, not
sure
if there is such way forward,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; as it would seem to require to inject
quite
abit more logic to core kernel?


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It's true that the AMD KFD part
has
still similar functionality, but that is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; because of the broken KFD design
of
tying driver state to the CPU process
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (which makes it inaccessible for
gdb
even with imported render node fd).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Both Sima and I (and partially
Dave as
well) have pushed back on the KFD
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; approach. And the long term plan
is to
get rid of such device driver specific
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interface which re-implement
existing
functionality just differently.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Recapping, this series is not adding
it
back. The debugger connection
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is a separate FD from the DRM one,
with
separate IOCTL set. We don't allow
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the DRM FD any new operations based on
ptrace is attached or not. We
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; don't ever do that check even.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We only restrict the opening of the
debugger connection to given PID with
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptrace_may_access check for now. That
can
be changed to something else,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if necessary.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yeah I think unnecessarily tying gpu
processes
to cpu processes is a bad
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thing, least because even today all the
svm
discussions we have still hit
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear use-cases, where a 1:1 match is not
wanted (like multiple gpu svm
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sections with offsets). Not even speaking
of
all the gpu usecases where
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the gpu vm space is still entirely
independent
of the cpu side.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So that's why I think this entirely
separate
approach looks like the right
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one, with ptrace_may_access as the access
control check to make sure we
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; match ptrace on the cpu side.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But there's very obviously a bikeshed to
be had
on what the actual uapi
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; should look like, especially how gdb opens
up a
gpu debug access fd. But I
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; also think that's not much on drm to
decide,
but whatever gdb wants. And
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then we aim for some consistency on that
lookup/access control part
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ideally, I might be missing some reasons
why
this is a bad idea) across
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm drivers.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So you need to have a really
really
good explanation why the eudebug interface
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is actually necessary.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TL;DR The main point is to decouple
the
debugging of the EU workloads from the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugging of the CPU process. This
avoids
the interference with the CPU process with
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parasitic thread injection. Further
this
also allows generating a core dump
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; without any GDB connected. There are
also
many other smaller pros/cons
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which can be discussed but for the
context
of this patch, this is the
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; main one.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So unlike parasitic thread injection,
we
don't unlock any special IOCTL for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the process under debug to be
performed by
the parasitic thread, but we
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; allow the minimal set of operations to
be
performed by GDB as if those were
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done on the EUs themselves.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; One can think of it like the minimal
subset
of ptrace but for EU threads,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not the CPU threads. And thus,
building on
this it's possible to extend
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the core kernel generated core dumps
with
DRM specific extension which
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; would contain the EU thread/memory
dump.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It might be good to document (in that
debugging
doc patch probably) why
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thread injection is not a great option,
and why
the tradeoffs for
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugging are different than for for
checkpoint/restore, where with CRIU
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we landed on doing most of this in
userspace,
and often requiring
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; injection threads to make it all work.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cheers, Sima


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards, Joonas


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matt

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[3]
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;r">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;r</a>
e
v=6


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Matt


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Christian.



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

--------------2aERzTiTWHE00ELFojl2bCK0--
