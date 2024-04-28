Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D228B4D07
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 19:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0D10E72C;
	Sun, 28 Apr 2024 17:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WR9r31rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E3F10E72C;
 Sun, 28 Apr 2024 17:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls7TCVCjb7RddWPzMk7jp5pTaoVGZMNJ7p0JCEPeiLZ/EBAk+0A64gIDx7VAnBNWY15zb9DTUAnK8NBXRa6ITDFtYQVtWatddXcGLPm4EWSCvyKbFvsDQH4aXTvqYeyTjXoZ6uJh88Ce/qVPiPfZv9A9C9Px6riqCKnlqr4tYjDE/urNWesiDDY8lOEvYAzGf7Obf1w47uh5sb5i0zzjJ+uSRTFSLk8aTNveYU7powdhKI0WeUoI537VysGfM53x8FEWk9LKcVvIv/3WrFBtjx4z7OhhM9YgfnToryE3izcFkkW0Nz+IYWoC8GqFCs8KkcF3SVX4F0zE+w2fWvYxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1m3l6td1pk0xV6cLSH/kzEGj+Yabeb0COcO+ntBc5E=;
 b=XQCYwheowCkQTvUyIoH8YiCjsCUzGPmaAnKoccjlEJhhuD/SFj+R06Xz+lVKc00x03AU9T9Ab2s8ozNsCa1nyq7p3jZ3ykyoi1lRseKqRAnpeVVRKxcjOV/HWpNAXp3fIR63OWAE1oixzynV7Sk2yXOLdiXJPsY0EmQY4HaRRZf0Dsig0uUPwL+qTWwQCoJ5wQtHiRWTSZYZeBzC+pfpKbZQxW1j+myefC1BiTNPyXV+SCVNFWcZJM1mAfJMGOXcfXKZNcA9ZTQK3f7NwI9KBO65Gb6nFW7tyMjSoAtNmJ5Dd/X8DQ9HcI0u3DeYWBY5YkYK5eMmJ9I8Fk/rw4F3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1m3l6td1pk0xV6cLSH/kzEGj+Yabeb0COcO+ntBc5E=;
 b=WR9r31rjpCeHwKAzqhNtQfJgS3f3iIgTASJ1St0F5/nXmlruIs0QgPggZFrGekHO4UMGohHaZkYQOakojwIW8Gd2qtKw6aGOheS/rITUsC75jWKgkchpWE4YH63KGyKVfv8LhGoMB3ne8FPYiwRLiKq3sQ/KwHPMkIwkSlMfdrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sun, 28 Apr
 2024 17:09:09 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 17:09:09 +0000
Message-ID: <8f9f3453-569f-46e1-ab99-c128d9c5ed5f@amd.com>
Date: Sun, 28 Apr 2024 13:09:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: re-indent dpp401_dscl_program_isharp()
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <2b0a61a0-baca-415f-aad4-7dc4cde73ef7@moroto.mountain>
 <62025fa0-6141-4332-9d1c-89a3e7cce7b3@amd.com>
Content-Language: en-US
In-Reply-To: <62025fa0-6141-4332-9d1c-89a3e7cce7b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::22) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 5641d827-5120-4db3-561c-08dc67a5eb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZYOWtBeWtvbGl4cElYRklMSVJUWitRMHhjZzJEaVQra3V5UWJVM1o1eWRI?=
 =?utf-8?B?QWN4Q1RFaE42emJhdlRSL3FtSzNBNlBaKzhLblhGRUR6L0cwWnBDV1dSOFRv?=
 =?utf-8?B?ZHlnbHpOM0phek1ybUR2U0lNUGIzSGtTblV3aEVReTh1T3hlZTRCL1pNWVlq?=
 =?utf-8?B?MzdXSHBsZUpFRzBuSW1BUi9tKy95Mm1zUm03amhISWd2NFh6Qm1MMFB6UWw4?=
 =?utf-8?B?U3U0WDBscGQwRXVMc3RJallUSGJ6UXNGT1IxVGEvYUowclB5YjhzOERIWnZh?=
 =?utf-8?B?bWZ6TGVDRlR0aDlINVV6RDI2cVVWQ2d1d3M2S0ZLRTRCTDhLbHpMaEpiUHNl?=
 =?utf-8?B?d21FSnJiNEtyTEN1WTNITWxGYko0YlZYbm1KSVBZR3IvUXdiRk5vQmhGL3FM?=
 =?utf-8?B?YktKcEhDSmx6WUlIZFJ1YkljeUFaU080ZmcySzZmaFljM0QrV3R3VUlVU0Nh?=
 =?utf-8?B?WkpNY2NVcDdXeVVkVjhpc2dnLzZNaWptK0JUL1pxdk5EOVovdy9nTlpRUEc5?=
 =?utf-8?B?RldWLzk5MU5OVVFYK0ZudVlJQTEzYy9aMUVqV2w3UTMybzVOeWp3aTlsYlVk?=
 =?utf-8?B?V294aGUybEdQTk9PMzNGYzhjUncrYlhaMG9hZFljWWYyeWxRUy9ZNnEwVXBy?=
 =?utf-8?B?VUNUSmxyMWwwcTRIU1VJR1VTcmQ1OWFUem5ibnRGUGdtelZBOGpxR0YwMGNB?=
 =?utf-8?B?cVAvckQxQUdmdDJRWG9aTi96OWlOT0s4RENWQXdVZmlmN2wveWx6Wkg2bUhr?=
 =?utf-8?B?djFOT0VOTDA4MlM2K01NOVl1SmM5L1V0ZGhLZllvUDBLT0hldERvbmhEZFVo?=
 =?utf-8?B?Q1R1THFUa3NaSTZDOXh2c09LbUNkMXp3L2dvV0JRREQveGlqR1FjSHFhVE9V?=
 =?utf-8?B?ZG9BUlh5TWhkZEo3dDMyQkY5RkpxQXVkNmQ1a01NZHJ3K2pvOTFVdFFSTkhE?=
 =?utf-8?B?UHoyQ1p5VjZRQWY2VnhTUU9XZXJOZitLRU43S2E4REY5R2dUMVNkRzJtQm1i?=
 =?utf-8?B?SjdheitpdGJUaEpqeUtQckhNVytmb2FZeTR6QyszeDNGdW5ZdjZ5OWFQaG1T?=
 =?utf-8?B?dlR5Vkd5VDJBQ0V3eUlNS1B0dld4TjVMS29uQXBpbVVXQTdFRVVURWxyYlcz?=
 =?utf-8?B?Nkt0ZHdLVytrdDdLeXNXdjdRZXA2Kzk5TDVVMWNFK01IRXI5MU02TW91c0Z5?=
 =?utf-8?B?Y0FZV21tNjdsTzkrbFBBOUMzTnNkWXAzNG5Gb0poTUtGcUVsVXIxVWU2SHM5?=
 =?utf-8?B?NHVWRFJEdEFpb29yL1VvZFRmSDRBc0pCRWg5NjMzbDZCbU0xeWo4em1yTG5V?=
 =?utf-8?B?VDlXeGsyUUNWeHBQOFZ6dTlPcFZXd1pkc3gvb0oyOWlXVHFHMFVMTWZ4MmVZ?=
 =?utf-8?B?RkV0bjJZaUgxam5iTGFMVDEvTGF1TXo1MWRQU3dYblFPclIrZFZPQjVQRFl6?=
 =?utf-8?B?Y2oyTGdUUThwZnEyaitzemxBR0c1S2YwaVRVTFI5ZklEb2FXUUlmWG4ybCta?=
 =?utf-8?B?cnVsajZUR2RzYTJidmYyTzdiY0NEbjVKNC9XOVhWa3p0UUNELzFPenl2Q0tl?=
 =?utf-8?B?V0NTMlRXb2JWMGhYdjVxTTBFdXZBU1dQYVJ3dnFQeFRZNzM3L2VYV2h5T1hL?=
 =?utf-8?B?bllaLzZFd2Ewdi9xMzVBb1hHRUV6TUVYZnZLVVk1RHdxcUNpM1NEU0txUElL?=
 =?utf-8?B?Y0t3YS9aalpXRU9OYlpUNmtpMjhVdXZRV2Y0alVMYVVTNkZVRm83TzhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0VZcFpuem1GVFhreEZlQS9rbE9nS3ZrQ1dCZjJvYlNtbG5hemZ0dTJMSG1u?=
 =?utf-8?B?TG55MXBFaFFYbkF4U0wweGpZYkxxNHNrR002U1ZZS1RFeXVCYlNGZFNxeG5L?=
 =?utf-8?B?S2w4ZkV5aEdYYzdmOFI3VTYwN3FKL2tQOUxEUEhHYlZ3U0dFd2VmSS8yRG9u?=
 =?utf-8?B?OG1hVHdFK25LbDMvL1NQZWZDRjNuMDZMT3plVEluRXQ0YlBtM1F0MGw2Q2o2?=
 =?utf-8?B?YzdmNW1Nc0NpdXFkWFd6cEtvTzJvSU1obXA2Z2l5SnBJeFdCeWxRSmtGems0?=
 =?utf-8?B?VDlzbHEvdDBoaGZUMmtpaHBSYlJqY0dvU1RucHc0VVZ0U1ROMTI5ZTZaL2tn?=
 =?utf-8?B?V09TTXlHRTEweGNnVmc2NXN3MU9YN0lZQWxubWlkenFaMmRob1FTbVo3TFM2?=
 =?utf-8?B?T3NPamJqSkRNNnpMaFlsNDRsTzVELytQdG42aGxHcnlKd3FtdFBRRHU2bWlY?=
 =?utf-8?B?WVgxa0RucXlWSzdCYjFHSjByMXdEaXhDQ2RjUFVhRmhlQ3drYldxYWh1QVJ6?=
 =?utf-8?B?RENLZ2RlM2ZkTzZvU09iejQzTzFRem5KTmlRQUs4OU5nOHFYRjVJMXZXYnh4?=
 =?utf-8?B?YzRDQTNKa0JJdWZOdVA2K0UrOG4xb1JRQ1ZjbHMvdWlTNjBZekN5N2ozMDQr?=
 =?utf-8?B?TDBkdnZEYWQyRm9wTXNtOTRsYitOMEtGdXlpWFBFUVNFZ3MxL0Mya21ZRTZW?=
 =?utf-8?B?RzI1bEh0OFFTQ2hESEhaUVRKUGpTN3g1aG1wbDRJRTVUTzRBOHlVS205cDFx?=
 =?utf-8?B?M3ZxQlJTTGpsWDBxODl3OWJvUndjcTVaT0tuWTJjN0pWa3dFNUVtUWs4M0lC?=
 =?utf-8?B?ZWwyS3BEeFM0bG5yN0ViMEd0d2R6QURSSEdOOVNBbTAyNHJYN1llM2VKalJM?=
 =?utf-8?B?YXJIVjEwTFZwcFNjeUN3TmVxakFPSGYwUmttZTE4dXVGZ3FNclhDWTAzYm9J?=
 =?utf-8?B?eTdZd2t4QnN5Y1BYQ1NYVlNaTEhha3hmb0F2RlgwU3JFN3VmdzRBUmpIZVFh?=
 =?utf-8?B?ZFdBK1JrWXg3NVR2UWgvNHV6Rm00bU5NVTRqT0RHcVhwNXdqSGhOcWZFK3FI?=
 =?utf-8?B?WEwweXBja2t6UlpRTmE3V0pKTWFlQmwrd0Vza3hxeGpJa1pTN0tMSFhJMXht?=
 =?utf-8?B?SnhZOUhUZ1Yvb3FNSzFFOFRselc3YlRJT3c2N1JCeU00VlRneHdkeHNMU2Yy?=
 =?utf-8?B?SlRWQy9oMTVMdTNQVlkwUHlQMnhyV0pWbUk2cWJuNlZWWEFTbjJaTlJYZERP?=
 =?utf-8?B?OEtNQUR4cklObXdwVm5weEgwbmVWMUtGQkxFUkg3K1FQWEZWRkRsQ2Y2T0Fv?=
 =?utf-8?B?c1RnQ2FuWmxFUWtTekZvejk5ankxRkJVOVpMQUcwQlcvR0RWUHR0VERFMVMw?=
 =?utf-8?B?WVovMDZncFF5K2hka3drMForUmVzV01UUXduL0FDTDhYK0M1U2tiWU5UTWcw?=
 =?utf-8?B?WWdHNjY4bUU0ZEI5dFNzL3ZhMkQ4d0NhdkR5RGdPVGRWY1Bsa0Vadk1HenFB?=
 =?utf-8?B?YUh0dE5jYUpTeTF6T3YzRGFjbStLalZEMDdOY3ZqQW9SWkhyaGZlcFVhcUdJ?=
 =?utf-8?B?aWhxZ2tCaS81RHRjbEVSZkRzdFR5d1pEdUdnUFBiN1FZdDBHTUVlTkFqNnp6?=
 =?utf-8?B?ZjdPSm5Gd1Q5UnhqVFlIZDMxT2dMU3RuQ1duTHZ2QlEwbzNSakhYVitYaVR2?=
 =?utf-8?B?ank3TVlaODRzKzRQRThhdzRJbnlDR09qYVc4U0puTzIvekh3Nlh2dCtDdVVO?=
 =?utf-8?B?NEd0QmRnRFdNU0RySU1hWWkvSGZ2dlI2UEN6clpUYVpYOTEwaUtrVm9GTEZ6?=
 =?utf-8?B?QURiblZRK3g4WElqNUhQbXFyT2dpUDhWSnRqcU9sRy9tWlFuWXVvRjd1Qi94?=
 =?utf-8?B?UnlHeERUMUlhL09ZeHhyZjQ3NXhWTEsxQXBBZ2hCMEdkaEJ2a0h2RVFyY3g3?=
 =?utf-8?B?eW9UQkdaai9vK2t5RXFGTWxzQWhYTUFrL0Z2T2t0RExxUEZtZDN6b1Vla2k4?=
 =?utf-8?B?Z1NxR2dPOUZicW9sM3VMZjdSVWFYNE5BNURZdVF6WnpxRU9PMVNiWmZhQU1k?=
 =?utf-8?B?KzYybUQrd01rQnp6MlhNRVo0NVBsNm5OVk5kd3JBOGpZSXpiSllpMXQ4bDlY?=
 =?utf-8?Q?2AJsZ8/C4jCEANaNBr4BXIf07?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5641d827-5120-4db3-561c-08dc67a5eb45
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 17:09:09.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMomtCMT5Jz7VIwokdKAdCz2FTJ7p8fnpbc66UFvjUyozz6rZIWm2eZ2AmmnoGfs3igrEKsJjI1xbtWWMF7Q8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284
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

Patch has been merged to amd-staging-drm-next.

On 4/28/24 12:09 PM, Aurabindo Pillai wrote:
> Thanks for the fix!
> 
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> 
> On 4/28/24 8:42 AM, Dan Carpenter wrote:
>> Smatch complains because some lines are indented more than they should
>> be.  I went a bit crazy re-indenting this.  ;)
>>
>> The comments were not useful except as a marker of things which are left
>> to implement so I deleted most of them except for the TODO.
>>
>> I introduced a "data" pointer so that I could replace
>> "scl_data->dscl_prog_data." with just "data->" and shorten the lines a
>> bit.  It's more readable without the line breaks.
>>
>> I also tried to align it so you can see what is changing on each line.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   | 93 ++++++-------------
>>   1 file changed, 30 insertions(+), 63 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c 
>> b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
>> index c20376083441..696ccf96b847 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
>> @@ -779,75 +779,42 @@ static void dpp401_dscl_program_isharp(struct 
>> dpp *dpp_base,
>>           const struct scaler_data *scl_data)
>>   {
>>       struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
>> +    const struct dscl_prog_data *data;
>>       if (memcmp(&dpp->scl_data, scl_data, sizeof(*scl_data)) == 0)
>>           return;
>>       PERF_TRACE();
>>       dpp->scl_data = *scl_data;
>> -    // ISHARP_EN
>> -    REG_SET(ISHARP_MODE, 0,
>> -        ISHARP_EN, scl_data->dscl_prog_data.isharp_en);
>> -        // ISHARP_NOISEDET_EN
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_NOISEDET_EN, 
>> scl_data->dscl_prog_data.isharp_noise_det.enable);
>> -        // ISHARP_NOISEDET_MODE
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_NOISEDET_MODE, 
>> scl_data->dscl_prog_data.isharp_noise_det.mode);
>> -        // ISHARP_NOISEDET_UTHRE
>> -        REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
>> -                ISHARP_NOISEDET_UTHRE, 
>> scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
>> -        // ISHARP_NOISEDET_DTHRE
>> -        REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
>> -                ISHARP_NOISEDET_DTHRE, 
>> scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_NOISEDET_MODE, 
>> scl_data->dscl_prog_data.isharp_noise_det.mode);
>> -        // ISHARP_NOISEDET_UTHRE
>> -        REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
>> -                ISHARP_NOISEDET_UTHRE, 
>> scl_data->dscl_prog_data.isharp_noise_det.uthreshold);
>> -        // ISHARP_NOISEDET_DTHRE
>> -        REG_SET(ISHARP_NOISEDET_THRESHOLD, 0,
>> -                ISHARP_NOISEDET_DTHRE, 
>> scl_data->dscl_prog_data.isharp_noise_det.dthreshold);
>> -        // ISHARP_NOISEDET_PWL_START_IN
>> -        REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
>> -                ISHARP_NOISEDET_PWL_START_IN, 
>> scl_data->dscl_prog_data.isharp_noise_det.pwl_start_in);
>> -        // ISHARP_NOISEDET_PWL_END_IN
>> -        REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
>> -                ISHARP_NOISEDET_PWL_END_IN, 
>> scl_data->dscl_prog_data.isharp_noise_det.pwl_end_in);
>> -        // ISHARP_NOISEDET_PWL_SLOPE
>> -        REG_SET(ISHARP_NOISE_GAIN_PWL, 0,
>> -                ISHARP_NOISEDET_PWL_SLOPE, 
>> scl_data->dscl_prog_data.isharp_noise_det.pwl_slope);
>> -        // ISHARP_LBA_MODE
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_LBA_MODE, 
>> scl_data->dscl_prog_data.isharp_lba.mode);
>> -        // TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
>> -        // ISHARP_FMT_MODE
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_FMT_MODE, 
>> scl_data->dscl_prog_data.isharp_fmt.mode);
>> -        // ISHARP_FMT_NORM
>> -        REG_SET(ISHARP_MODE, 0,
>> -                ISHARP_FMT_NORM, 
>> scl_data->dscl_prog_data.isharp_fmt.norm);
>> -        // ISHARP_DELTA_LUT
>> -        dpp401_dscl_set_isharp_filter(dpp, 
>> scl_data->dscl_prog_data.isharp_delta);
>> -        // ISHARP_NLDELTA_SCLIP_EN_P
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_EN_P, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_p);
>> -        // ISHARP_NLDELTA_SCLIP_PIVOT_P
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_PIVOT_P, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_p);
>> -        // ISHARP_NLDELTA_SCLIP_SLOPE_P
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_SLOPE_P, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_p);
>> -        // ISHARP_NLDELTA_SCLIP_EN_N
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_EN_N, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.enable_n);
>> -        // ISHARP_NLDELTA_SCLIP_PIVOT_N
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_PIVOT_N, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.pivot_n);
>> -        // ISHARP_NLDELTA_SCLIP_SLOPE_N
>> -        REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0,
>> -                ISHARP_NLDELTA_SCLIP_SLOPE_N, 
>> scl_data->dscl_prog_data.isharp_nldelta_sclip.slope_n);
>> -        PERF_TRACE();
>> +    data = &scl_data->dscl_prog_data;
>> +
>> +    REG_SET(ISHARP_MODE, 0,    ISHARP_EN, data->isharp_en);
>> +
>> +    REG_SET(ISHARP_MODE, 0,                  ISHARP_NOISEDET_EN,    
>> data->isharp_noise_det.enable);
>> +    REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  
>> data->isharp_noise_det.mode);
>> +    REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, 
>> data->isharp_noise_det.uthreshold);
>> +    REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, 
>> data->isharp_noise_det.dthreshold);
>> +    REG_SET(ISHARP_MODE, 0,               ISHARP_NOISEDET_MODE,  
>> data->isharp_noise_det.mode);
>> +    REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_UTHRE, 
>> data->isharp_noise_det.uthreshold);
>> +    REG_SET(ISHARP_NOISEDET_THRESHOLD, 0, ISHARP_NOISEDET_DTHRE, 
>> data->isharp_noise_det.dthreshold);
>> +    REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_START_IN, 
>> data->isharp_noise_det.pwl_start_in);
>> +    REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_END_IN, 
>> data->isharp_noise_det.pwl_end_in);
>> +    REG_SET(ISHARP_NOISE_GAIN_PWL, 0, ISHARP_NOISEDET_PWL_SLOPE, 
>> data->isharp_noise_det.pwl_slope);
>> +
>> +    REG_SET(ISHARP_MODE, 0, ISHARP_LBA_MODE, data->isharp_lba.mode);
>> +    // TODO: ISHARP_LBA: IN_SEG, BASE_SEG, SLOPE_SEG
>> +    REG_SET(ISHARP_MODE, 0, ISHARP_FMT_MODE, data->isharp_fmt.mode);
>> +    REG_SET(ISHARP_MODE, 0, ISHARP_FMT_NORM, data->isharp_fmt.norm);
>> +
>> +    dpp401_dscl_set_isharp_filter(dpp, data->isharp_delta);
>> +
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_EN_P,    data->isharp_nldelta_sclip.enable_p);
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_PIVOT_P, data->isharp_nldelta_sclip.pivot_p);
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_SLOPE_P, data->isharp_nldelta_sclip.slope_p);
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_EN_N,    data->isharp_nldelta_sclip.enable_n);
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_PIVOT_N, data->isharp_nldelta_sclip.pivot_n);
>> +    REG_SET(ISHARP_NLDELTA_SOFT_CLIP, 0, 
>> ISHARP_NLDELTA_SCLIP_SLOPE_N, data->isharp_nldelta_sclip.slope_n);
>> +    PERF_TRACE();
>>   } // dpp401_dscl_program_isharp
>>   /**
>>    * dpp401_dscl_set_scaler_manual_scale - Manually program scaler and 
>> line buffer
> 

-- 
--

Thanks & Regards,
Aurabindo Pillai
