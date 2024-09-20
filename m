Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9997D127
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 08:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3046410E7A9;
	Fri, 20 Sep 2024 06:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5A7LsMpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC6B10E7A9;
 Fri, 20 Sep 2024 06:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGjbP/4mlrxS8y+ZDTmyPT+bGn6iWqSAk+EuvnQ/ITFTFRCf/b/1xyHbBVblFcOSHBpMW9jIOEv1FyG/EjKoxYQbsH2q47PhJTEbzHJhndINaFpzxMwX488v/geZEq1XVf6N6ijsUihRNXd0bAs4CMOPtc1lxFJUBoZzPAVaMmPpFlylwa2r91mQKdJHPTehrl2A/Qy+giQRD4m07lkVgQ134cLjGSG0mPyClkwk6nzkcS6pbmw8P2QWgW5uFkWZ+hELk0nvARNRYfKpI4+qgPvswqtLh9e/KQxSUQUyj8B/L5sHp1EpsAqMo5O1g1fAZQwjkSuJrX9SXVHJM377TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8uKg4vlU0H8aSWLs1pc+GTfeuHutGPJJZ4zetagCY8=;
 b=FBSyMJylWHD5Lfa2cIOtxAl1voRBLC9KpOd17l5TVdcS6EDKX9kfWOV4gO2w75pTKwHZYc9fW1tbRr9POa/wTmnea/SPdUCAC77dIU98Y3XkpdQXmGEAK1ibpjJV6opJqME8uWIS0sxUvHFshdP/EruhN3j7InEqqDdakmAGqgq+cj1oDvRavbi+ibUBcxRPPvDTIhbYVSoSdg+g1M7NhP9L1z5JR59xtqvX4/YnTyF4wnGM4dUggLSx1PupQSUtE25Y8gXnGZX95HnTm6xMgJhvTjmtpX5UQ/aSI/zWk/ERfw5wQoww7cps4EVkKp2LeM8zsqZaSIj0b55Lgu+kkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8uKg4vlU0H8aSWLs1pc+GTfeuHutGPJJZ4zetagCY8=;
 b=5A7LsMpacLJ/DeypSkr7tjTzw2MTWdBDxnHXkNTslFwjez5jV10ed6BaAk8wXcIkuiJfocwllDZomXW6nzUkhRNDAt933CcMi1ksPuQfBzKRHJins5hkNERzkByyg8jLeHfioYc+vKmcuZigSNURgCp+SKV1KMN/4+Yt8lsRKA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 06:28:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 06:28:58 +0000
Message-ID: <ade271e8-2f6e-494b-979a-e53942b6b9a7@amd.com>
Date: Fri, 20 Sep 2024 08:28:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix typo "acccess" and improve the comment
 style here
To: WangYuli <wangyuli@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, yifan1.zhang@amd.com, vitaly.prosyak@amd.com,
 Tim.Huang@amd.com, Prike.Liang@amd.com, jesse.zhang@amd.com,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, victorchengchi.lu@amd.com,
 Jiadong.Zhu@amd.com, tao.zhou1@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, le.ma@amd.com, Wenhui.Sheng@amd.com,
 alexdeucher@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>
References: <F25A139789E87C3E+20240920022755.1162495-1-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <F25A139789E87C3E+20240920022755.1162495-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d710df-97f9-47aa-6510-08dcd93d8246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzNDRjQ4WHdlL3N6dTNucm1TY3NEem5QTlVRV2laeUozRVhQOGdGV1FMTlc3?=
 =?utf-8?B?MFRIWUo2Yi9uMHE0Znl3T1FlbEdzZzE2N0U0dHBDYkRBME4vQXhybysrWDhm?=
 =?utf-8?B?NmFrb1ArOWw0alNTZEhvT0lZUEpTcDRhVmlIMUlGTC9FSHNKdVprQ1psQUtZ?=
 =?utf-8?B?K2hVSkF5aTNGY3JFWFB0aXkyZytjaytoMEZRSk5tcGNGKzBzTlA1UXVTZWVi?=
 =?utf-8?B?dkRsaXF4Q2ttVXRZVU8yZkp4blNrRzBnamVyellhdjZqa084WlYveWp2MWd4?=
 =?utf-8?B?N3FwRzFKVnBMNVd6Wm1KY3NGTHdaNDhMZ3RWdzI1SnhWRVFuM0w2UFIzdHVO?=
 =?utf-8?B?KzhKUjE1UktsazYwWDM0Sm11WFFUUmljUjllZ3hhSDJUZG1KRVF2bUp4c25w?=
 =?utf-8?B?Rjk3WFFLTUE4M2YraWZCKzJZNG1jR2pYa0hVRC9iMXFib1BXejBqWGVCeFlm?=
 =?utf-8?B?SnB3ZXAweXEzUU4xUFFJZEY3Tkd4WTNEQndqRk1HeW4zZXZnaUVDd3ZHQ3Ex?=
 =?utf-8?B?MllTTXJlMmlQM2ppUWVQZ2FKaXJVTEo4Y1g5a3RjaVlvWWYxNVV1YkFxNXJG?=
 =?utf-8?B?Nlp1dEFCbktqbDJTdjZMUXBLVG1rOHBJVnNpbm5BWmZUOWVJdzFMcTZvYUtB?=
 =?utf-8?B?ZmV6ajJXRi9jNmRabnlGdVQrT1pjWlFKNEkzYjRjYU92dEZQd3JRSjJEZ20w?=
 =?utf-8?B?RDY0aC82NlNmL3dFME0xK2lnWFpGU2JQN24wcXgvQTdyNWRyMmpSS1BSMnRU?=
 =?utf-8?B?R09tZFcxMXNKdlJodGl0TjU4THBQSzlTU0VZNUZJS1RPMkV1TjVDU2wxeG5l?=
 =?utf-8?B?ZFhsenFjWXpOcHgzVFpPTlFqcDE2MS8rUXROZnVDUHNHTzIxSllRckV3Lzdq?=
 =?utf-8?B?QW1OaGZJOExRSGdKejJvZVUxYzB3azg1TXNJQ3k1OEorMnhyN25OWlYyQzYw?=
 =?utf-8?B?aFQ3dnNRWHhTcWxhcGNHVkFRayt0M0tvMk55V09VQjY5eGxsMERna0VEUWll?=
 =?utf-8?B?SHdldjN3NStsazg4TS9Xc1RsSWwwYU5Ebi9sRjE3aHYzS08zbUphUGF2Nm45?=
 =?utf-8?B?bFkxSWkwbnJ6ZVJocVE5T1dRQjZQL3dTMWY3a2xJRmpZMDBNcWl6RmYwcnlL?=
 =?utf-8?B?SmZ1b1Y4NzV2T1pXRVloOXcyY2FRVFhucUFHMFpyQWpaSkZpZC91Q216Q2pB?=
 =?utf-8?B?VWtTVFhzaWR5ZnZTbDdELzBwMHlQSnRrUm9wcFkvbWgrVVFwc0FqcFBGMXZM?=
 =?utf-8?B?VGtLclUzVFJtd05LYW83UTZQNm5EZ21IbXJhNnAyUzlsZHdIS3BnczFVSThl?=
 =?utf-8?B?T29ITHZFUzhyQ1N1NkswRU9WaDhvSFVPZlUzUEh1WUxGWDBqdXlCRGJnQ0I4?=
 =?utf-8?B?QUNqMFN1SjlnNGVOT2hCSENuNGZaTlhrSkdhZ0o3WHpQdnF2NzJxWitrWHBG?=
 =?utf-8?B?eDZyR09TdGI2MHpVckg0OGNHVUgvYjdYNHlRelFFNDQxK1FSN3R0WUlnaTBX?=
 =?utf-8?B?T2NpWkZCeDdCZkVWOFUvZ0FxdHlHeXd6ZXcrZWhMSTVVVnVpVEFKL0h3Lzl0?=
 =?utf-8?B?UFR4b2Rma3oxaGRIV0s1VVlyZlBkMmJ1ckhvelNCS1E1ZENnRk5NU2c2MkxO?=
 =?utf-8?B?RHlqS1lVZWNVYkhtamNOU0M1eXlWOEtqV3RiV2g5V2tpRmxBRnNhY2F6Vk5O?=
 =?utf-8?B?VkNpd0NkRXlnRzdNZmxEVXBRZXZ1elVVWU5hUzM2MTAvcy94aFFwMzJuLzlW?=
 =?utf-8?B?eFBCVHJYaXIreGZ5dmt1RnlQWHI1MVA3bjdPMy9iMm5vN203cXdYazBtWENP?=
 =?utf-8?B?OVpHWExENytMSktwZWVQZFN3R2V3UkQyY3c3c3JTZEdpYjVXODZvOXNpQVVY?=
 =?utf-8?B?eXdJeWttSTdCRXJCTTJwRVF6bzhMR1pmcjk0Q2V2TlF5ZlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2QzbzNyZHU4bVRHdkY0S3VXRWtYS3VrNnFHMnBHYXIrUjN4TG9EMFkxRTFT?=
 =?utf-8?B?ZE9UMWJqUlBOa2k4QkludktVYUVYN25WZndhd2ZWVG9ueitSNzhBQXlSUHRS?=
 =?utf-8?B?cVBHUE1aWnZuWTBUUmloNmE0cVlVV0lidzZuaExYZ2t3QjVYdDBHc0p3Z1k5?=
 =?utf-8?B?VHAvbEV0RGJMYW5BOGdPNUtYME9xemJEcE1nbkZDTUpkUnVNMnc2OS96dDRF?=
 =?utf-8?B?U05zcHA0MlZtTTd3cVNRQjdkSzM0L3IrS1o5TEoyTjcvWmxrNS9tV2REZkJu?=
 =?utf-8?B?NW5OU1lwWVMvVitkczI4RXdRbit2VGlxdkRJdUNyUzIyVnRkVjhPVWY3dmpt?=
 =?utf-8?B?cmM1OU9MM0xpNWRRd253OG9QWHUyOVV2QlF1U3ZvVlVpNGRzTDR6dnhiYlhS?=
 =?utf-8?B?cUxBYm4zSVJsd2ZSZzhvcmNaMkUvT2lvWDIzZWs3YkxLbHR4SHRpZzBtUUN2?=
 =?utf-8?B?Q0RET1hiWXlQa2J6eGpRZ0VKd0hoWjhMc0cvNG0waGhQcEtNL0VHY0U3UEJi?=
 =?utf-8?B?QjEyaHdaSjQwZDB4TWt1NkFMM1l0UTZ5U05Pc0xxR1p5Q0s2eEdpNktCeEhS?=
 =?utf-8?B?djBYMDdrTU1FNE1KbVFZSHkwbVBTTm15cm9XMVpCRDh1QmthaUltcVlvUTJ6?=
 =?utf-8?B?U3JXV3AzUjltNzVlM0tlM1I5U2l5a2tpMEp6Tzcyb2E1UFlKeXBEK1g1em9y?=
 =?utf-8?B?SGF1V1REWmMrSERtK29RcTE5MXVxeHlIZGVuVDVBSHowdU53bnkySVFMZTlC?=
 =?utf-8?B?ZEd0YkpzQnJuUnRNNHd1dmY4RzNxRER4K3VxQndHb2E1VVRld1JsUjZIR0Zo?=
 =?utf-8?B?VzNzd1RGdElEWTArTW9RVy8vOXI2MVVOcmJ3VWxPbkNtejl0NEVqam5sYWxJ?=
 =?utf-8?B?ZndhNnI1MTByQlBRNU03Q1RJYU9CVHhQTm5DR1RnWENwZWxvUnRGdkhBUy9k?=
 =?utf-8?B?djJ2SmZZS2xpeTZCZXZydGZzVmo3YmpjalRQZ0NwSjU3UytOcUVlVFYxTGp1?=
 =?utf-8?B?Wi9kR3E3bkE2SUwyMXdNdVpiN1dTMThFekdDQXZFOGxuM2M2ZUpyWGhtcWlw?=
 =?utf-8?B?UlBSVCsxQ2FhcGxaMTZId3dTQURwWGFvWG80MTlBUUxjRUpkZjJnbFg0dlV4?=
 =?utf-8?B?L3EvNldoTW5TMjZxa3J0SVpDNVhreXdwcGg0TFRHcytqRTdqdDMwQ2Y2K202?=
 =?utf-8?B?TklvNnpLTmdWQzlHM0k1L0VrRTBUUmRSQlhvOEt5ZzJ2a3NjY0xUNWROb1B3?=
 =?utf-8?B?WVY1cjdmc0lUWlpoYjFNcjV2RU1MUXF6aXVoNTFRcGlOdExwMHdWVVhPbTZH?=
 =?utf-8?B?MTNWREczc0lUZEpzQk5MMDJtWkx3QnVWWXhNUWF1dythTVNSbkxMRW5BSFNu?=
 =?utf-8?B?MExaeGRaZEhUVWpaMWcraVVjVVBKTzFNaCtnUzAzM1dPL1YyejhuM0ZBbUh1?=
 =?utf-8?B?eWxXTHQrSGR3cGRDMHRlTk03MW41Q1VPM3M5S09heE1xRW1RVnF5SXJNOXIz?=
 =?utf-8?B?dFRMWTJ2Y05PKzRNMUtVY3NFa0JGcWx3NzkwMzVyRS9zaC9kYXAzVVE4YTk5?=
 =?utf-8?B?YlBwTHVmVFI0anhwL0xaZkIzNFpGNnRkK0VPak5WLzVOYk5EdElBYzVpU09i?=
 =?utf-8?B?aVVGYnFvbTJ3aFRmS1BSTDlTTWN0UGxEOXBrKzN1TTRQMHdFbm1VQTBBb3pI?=
 =?utf-8?B?cTlrdnBIUWtad0JpNlduMGtBUHgzZ0JieHZrTzNIb3hQbmdYMStCZDc5NWpi?=
 =?utf-8?B?OEsveWY5em45cWtMbTF6d0RuWCtXQXBGOWp2ZUVFSkRxbklwYlRYdGtTOUQx?=
 =?utf-8?B?RjNHU0Z5NFRXT3UzcVFLRmVxamgrWFZUdm9rRHlmaWxwdFZDTExLWDhXaWRW?=
 =?utf-8?B?eGY4eTl2eGlUYXhMNmNBWDkvZndFaGFsRmJ3cEFXRlVIOUxwK0lnUnB2L040?=
 =?utf-8?B?VkNxZzM4QkpoL2FtTTNLTjljdThONU1pKzhvUzhia3hqSEljNXhmSmhwcy9U?=
 =?utf-8?B?WDN3bUFxK3lNRWlWRWMzZlBjczdxVWdVeHhDRzZwNkVqbmtjaVFMT2NSakpM?=
 =?utf-8?B?MkhIUllQVWNmeWh3Sk5IVkZHZkxpWHRwQkZYaU55ekVsWm5JWU9TVjVmejRT?=
 =?utf-8?Q?JqG0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d710df-97f9-47aa-6510-08dcd93d8246
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 06:28:58.4619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD8PwSCez8IFHvVL0JUEMp0qyRkuR/xdxR+wDXgXf6FQ+22bo6yIcwDGscdlRdWa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
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

Am 20.09.24 um 04:27 schrieb WangYuli:
> There are some spelling mistakes of 'acccess' in comments which
> should be instead of 'access'.
>
> And the comment style should be like this:
>   /*
>    * Text
>    * Text
>    */
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Link: https://lore.kernel.org/all/f75fbe30-528e-404f-97e4-854d27d7a401@amd.com/
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/all/0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  | 6 ++++--
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 6 ++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index d3e8be82a172..33fd2da49a2a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -1893,8 +1893,10 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
>   	soc21_grbm_select(adev, 0, 0, 0, 0);
>   	mutex_unlock(&adev->srbm_mutex);
>   
> -	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	/*
> +	 * Initialize all compute VMIDs to have no GDS, GWS, or OA
> +	 * access. These should be enabled by FW for target VMIDs.
> +	 */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> index 408e5600bb61..57b55b6d797d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -1247,8 +1247,10 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(struct amdgpu_device *adev,
>   	soc15_grbm_select(adev, 0, 0, 0, 0, GET_INST(GC, xcc_id));
>   	mutex_unlock(&adev->srbm_mutex);
>   
> -	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	/*
> +	 * Initialize all compute VMIDs to have no GDS, GWS, or OA
> +	 * access. These should be enabled by FW for target VMIDs.
> +	 */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_BASE, 2 * i, 0);
>   		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_SIZE, 2 * i, 0);

