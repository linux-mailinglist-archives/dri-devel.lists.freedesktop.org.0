Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F89AB5B1D
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA1C10E20A;
	Tue, 13 May 2025 17:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3e/uOPua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AF310E204;
 Tue, 13 May 2025 17:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SslTxG0KCEM72e+SeNrS0kZqZBDugNW5R0QVdIDFH2Mvu3WLvIzzA87cpf9eo/yQYk3Cf0uJVapKoPMowhIx00uvJ743EcPl9BCedGR3ELjKmatSRqOZhkJdBqlBUtMuuyxYTzyNStM6OJqEjbnOnAfaZMXDJ8LQg5PRBkpkNgxUYcUZMCiiLc46VdfFMxbZsU5jOEzx94uL9ZdTLVEKj04Gvn6PA9TZEBnOPwjrCyYn514EU/HNS082X7hjU1uvBAR9c1jGMx8JXXi2otBNvSpIbxX0euLyZiJQ8agqTyDqd3N8bdUn0x29LXQnP1K2vMEEQopE34vu52Wcu7Z0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI2JeV5bN39BugKoujGqm3YWaQ3YZV3yXIKf/TgxXt8=;
 b=IlpvM9pcWApU3y+LINSqNdoKgrE17H2TU9HSW2lrKA6lt0O90slUh2HQSw9xMA2hVbd+nEJLDXol7hGRbx/LZuIllhPcpr277tT4wTa4x1CnXRgly2t0PN20sy0oa+LU4DEAVnEzg4h/RWRqNMk7+YiRcE6EAPZbYtDyH9+/38ZQIuQJJMUlVd5R6W5WhULdUHKVLD5RBZqO1JyLM46blt4D8f7hRO5LI6xc62nc+2gyqYl5VL2kVEkTEl0ZqFpaHAZzS+dTUz0x7+hQcCfru/p/0uWfml+bUCH0ojrYdYUHjUJcx9joDQEg65CM6eb9MPrPi2wUJV61x2zjkrYDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI2JeV5bN39BugKoujGqm3YWaQ3YZV3yXIKf/TgxXt8=;
 b=3e/uOPuaMmc0DiI4Ee4Prtoi6PU0xHH3uaSO2D6+p/uFfLTOxgBWAZC8Jpm8Poq58AJNjylfihoKeHb/VApO6wDDcXlFBcTmlrNqo9ZRDtE97vC0Ze9QFik98VsTVZ8f/FUjkS+4nuz63DIJBFUEtFf9JqXK2j8dzm+DBz/x7lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:24:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:24:13 +0000
Message-ID: <2ec3e1ef-16fd-4a4a-a54e-96b762f033d2@amd.com>
Date: Tue, 13 May 2025 11:24:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Hardware cursor changes color
 when switched to software cursor"
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Roman Li <roman.li@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250422150427.59679-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250422150427.59679-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0201.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::7) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7494cae8-d751-4b9b-2d4f-08dd9242fae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXo3bXV1WkZJRTFJYWptaWlnTzRPV2tyQjlxaXdhNDZlWVpreVN2TEJrajlW?=
 =?utf-8?B?TjN2aGZML0dMRS83ZGtGZm5LcThZa0NUZER3TWY5a3lIWXJqb0Nsdld1NWRx?=
 =?utf-8?B?V1RTYnJXekFnOVpnTFVRNDFXS3RjY0lGc3FieTNsZmtMSXM3d01LajB5dTNV?=
 =?utf-8?B?NzJiTHNGeU41R1kyQlhYaTQ2cjAvb0NpQlc0Mnd4R09TNGhxT0p1a3JKRFh5?=
 =?utf-8?B?RHRMQ3B3OXpLN24xQmpaM0M3aUFFZHRUUUtGMWhRd0VQZGxhbnZ5d3RwbVh0?=
 =?utf-8?B?VFA4WDRvTnZSVDUwOUpqVTRuT09tQVlaZlovSXJhWWJZN3Z3WC9SWTFPQUVn?=
 =?utf-8?B?ajhiK1A5SmJKQWRBVFZia0dKV2MzTkZ3VEpWck8zNnFBdWFzNGVpZ3QyT2ZC?=
 =?utf-8?B?bnNGWDZIZXMwbHRJTlFYZ2JENTZCblo5NUJ3citHUUUvKzhwSEtOZFFCejAv?=
 =?utf-8?B?K0habk1lUnR1WVdlYXM4ZkhLUllRZmE4eHU2bm9qc1FJV1ErUldqUTBzQXNt?=
 =?utf-8?B?YmNKcndTTlBqVkdoUnBsbUJGc3JST3pVNGd1eHZOait4dGVsNDFVMGN5RVpv?=
 =?utf-8?B?dTEyS1JMY1QzczdNb3U4bC9wYVpYYWM5dEpEV1FtSXVGSFFKM1I2SlVLSFha?=
 =?utf-8?B?a1JxL1djYkZ6VER6UE9MN0NLa2ZJS1FETkYrSlduQXVqUzVnOVVGVDBrRENL?=
 =?utf-8?B?d3pWMVg1Rjk0UnVYWnlNSjB6TFZMRWh5T3VISGZnSTFxT2hhQTNQRjhxWFA3?=
 =?utf-8?B?VkZYVlFxWDhuVVVHL0p1NGNJeCt6R1I4ek9rV252NXZ6NU1XVFh5eTdMMUpF?=
 =?utf-8?B?d0ZpN3ByZTVIQXVEVzN5bWRVNjBGQ3BOZlB2R0J3ZE9Zb04zQTA4ZEllcjJD?=
 =?utf-8?B?U1JXZk5VY2JFY1pjdGFvaGZjQlkrVjhhN2MvUWdHQmsrVFd2TDYxYUpOaW5I?=
 =?utf-8?B?RmNBazZ5YWhuMlp5bEx5Tzl5RHN2WXlaRS9NUk1rZTlNa1h6SFJSa3k5UHpE?=
 =?utf-8?B?bklvNmp0MktVSmVSS2p0YXFBNzFHaFdjdkNIbjZhZlBqTmhZbUhPdjQ4RGRu?=
 =?utf-8?B?enVtTStndzdtOEtCRkJtMHBxTExUUWpjZFhkeWZSVDdXaGpqbkFZRzAyTERW?=
 =?utf-8?B?bVF4TkVqTVJDQmtkWXRaaHpieWFWOXkvZlZROTZVeGtyb0d6RGRHelIwb2lj?=
 =?utf-8?B?WXdvYitnb2FMaVh1Vkg1TkJYQ3pjakFKQW1Xei9raEk0aXlLNlNpS2RnM1Ux?=
 =?utf-8?B?MjNKREhZdWFtZDIvTWtFOUlWNGtZeHZnb3QrMFRnbi9SL0JSb1Z4V3duT0VU?=
 =?utf-8?B?WGdIeVZNVFREUm9jdXR6cEtZSHFHVFFESGdlVUtDRDVWTEhjRUxQWGsxMzU1?=
 =?utf-8?B?MzdLR3NWc1RrYjlzeUZiRjNFN1JlaUxyOWpCeGVvWnBjRi9aakpFVE9QcE8r?=
 =?utf-8?B?RkJwaHBVM0VvOCtTTG50dVc5b0kwT2s0WFFEQ1RNNkxwSkdaa1BLQWJWejcy?=
 =?utf-8?B?aHNycWZVUThhUlJoQjN2SEVoZk8zeXkvTkVZYUg4dXJBRkVXeC9EdmN0OS9o?=
 =?utf-8?B?NTFjQWJsUzBhMEdXemNVMHY5eHVmSzA3QUd4TEExdXlJZGdWN01ublhxSG1X?=
 =?utf-8?B?bmdlQ2lIMytiNS9TTW4ya1hFRHdpbmxxU1F4Wjl5cTE1bnVGUWxBZWJIcjRV?=
 =?utf-8?B?dWdCckIwOWFqNmNEcXh3cXNUMWd4YlJCV2s1by9BN1lSSUNtVkpoUzlrcmtX?=
 =?utf-8?B?SW5rNFJ2amRlaXBJbTc2cjVkVnlOOUc2Skc1Q0NqSDhCb1REZWxTVm84c1Zv?=
 =?utf-8?Q?FCqVzch54t33Zt6TCiRpTJ3BNzhwHr7J95bnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdaOUsvaE15bW5saEYrWnVSZEhOcWZkR0ZIa3VmeHRRYytic1h4VzNubnZF?=
 =?utf-8?B?bFIvTTRKZkdRWndmSGlTWkNuWHlPVlhBOGorenlXeFVoSFQ2d2hZcDdKWXNu?=
 =?utf-8?B?QVA0ODhGQXJMOEZ5LzFIY2krcjY5Ynk0MlNHWjgwTU9mT2lqV1VEYU0xSTQv?=
 =?utf-8?B?Q0xsTGlpbVB4UGhNdU8rRTFGRXhWZHpNV0J5bEhZWUtTMytPckxUKzBjT2I5?=
 =?utf-8?B?M1VyTlJISDg2Z2hiblU4WTFaS1JWZXVTZXZSN3F1SUVxVERBR0xWY3BoR2dB?=
 =?utf-8?B?VC9wVHkvTG9JazJMVDZUZmMrUCtnallxWVFCQzF6Q2hwWmdaczJqcHB3elFo?=
 =?utf-8?B?cDFYTXp6ZUtLTmVtRlEzVG9SbGRpV1BrWmUwRXprOTVoRFBWK0xIaUVwMWcv?=
 =?utf-8?B?V0VJTW5qWEl6aHI0QlRxN01FQ25PMS9xWjkzMjRKZHNWckl2UHRYcFdjQ1Ew?=
 =?utf-8?B?emRXRVNRc0wyMXlkbnNlRVhuRURWd05KaDBzZkIzWlFBMTVWZG1xZkp3cFJr?=
 =?utf-8?B?emJDcXZodUZlRzh4cGNvTVpqcmlCTkFtNEJZWWdDZzUxSWRlUkR6ektycC9r?=
 =?utf-8?B?T2w0elNhU1BMcVR3YUd5NkxyQ0krT282eE9LM3VnS0FDQzh4ZFRGMjUvQkQx?=
 =?utf-8?B?RG5SRmxZTmlyUWh6OVltVWtWQmFpTTlHRUtVR0JGdkhxYzF1RDNJMkZ1MzdK?=
 =?utf-8?B?WWxUV0NtMnkrTThLZE5TSHJQcmJlY0Npc2ZWSm4xai9IVFlJdlJtRURhQ0Fn?=
 =?utf-8?B?QytTaFFFN3BzaXVrekRNSFJCcXMzWSt0dUJLcm8vbW1EMk1FeVJaM3dERS9k?=
 =?utf-8?B?YjBrakk5TzY2T290b3V4Q2xKV0ZhUlVtUldacEdmWnlITlVjUzBKMk4zQVVN?=
 =?utf-8?B?S1ZKQlBXWkw5Y3o2M2piWVRjaVBPSFlHWXU0OUx0YzFpM1A4WjMxUTZQS3BK?=
 =?utf-8?B?dmY5RXBKOE55YmI1QnArK00vWU5NSXNFdW5aRzlobXd0QUlpQ25oUG04eTFU?=
 =?utf-8?B?UVBZUXh1RldZOTZqM1JPcFdiWFl2YTFONTdGRDlNS1ZvaDF2bVZqK0k5RzY1?=
 =?utf-8?B?RzdIc0QrRGdOcm41VUxFd3J3OGs5OGcraTNDSnpPTHNkY0FYQVpEWW0zMFNU?=
 =?utf-8?B?WXlHVE5TcllBWEw0WEhoL3I2Zi9ubXNBRG82ZFJvc25uUTlQdHAzMi9iS0J1?=
 =?utf-8?B?UmNyT2I1ZlhOZkRWT25kU1pXamVCQ2UxcWRWTU0xazNqOGpZeFQyVHpybTlZ?=
 =?utf-8?B?NlJlNnRpU20vRGo2NU1LeEJzM2g1QmdOOWNzU054dW9uclhlYmVxQXovQzBp?=
 =?utf-8?B?NUIxalFmOHRjRFRqeVR5a09xSHA2cEhnUHpNVU5ZNmZQRmZNeU43T0piU1lp?=
 =?utf-8?B?amxscFVXbGwzMURXclROcjdUMGNLNXlVZXBkZC95cmZHd1VJWkNBNFdMSkJj?=
 =?utf-8?B?RnZRb0xjZStOdFpNVjFMeWxiRXlGSENPeENqL1didTc0RVFZN1JDZjVUcmJK?=
 =?utf-8?B?dFk1T0IyOXVGUUVhVzFmVWJUWHU1b1c2cEJkZGFLZjNkTkJKc0NHOHRoRzg2?=
 =?utf-8?B?WDMzaE5tS3FsUTc5dHFlT2ZleTA3NHFRS0lnUWlKU3B2SlhIUW9sZkRZM01Q?=
 =?utf-8?B?T0VZT3ZHZ1VwWUdKTmZOOGNLQmFhaTUyS2dvQ2c0WWFKZEV1TUJsY1lVaENT?=
 =?utf-8?B?Z0N2OExJTEoxdmx1NUZXR3E5allxK2JLRE1lV1FZSXFTRkR6OHRkT0t4ZVZH?=
 =?utf-8?B?S2JRb1ZyM096SXhDak9VRm9CdnA1d3BBNWFzTlkwelM3aEM1WVdZcmk0SUVP?=
 =?utf-8?B?L0sycmpLMmZyQ0JuTXhxTk4rSUVkdGM3dmtGSnp4OHdlcGgrK25hZ3RlN0hT?=
 =?utf-8?B?dzc5MlowbmhLbUQrV2dWNEhPcERaa1pSUnFnZkxmYjdHTS8rRHRmcjZxQjlG?=
 =?utf-8?B?cFhxNW4xd0JLaVExUGo1K0szdVdoK1FzUUJISUtNc3BEMk5rWWdSWTQza2NW?=
 =?utf-8?B?aGpuU1dZRmtwOHQrcVcxdTdXQ1hOUFlOelRKV0FtcmUvbHFoL1JJNFZFNHhi?=
 =?utf-8?B?aklIMVlqVG5YQkZwbDBCeGlBQzhZQ2d2Q0N0SEhlbndyMDk1bDRVblBVaVlr?=
 =?utf-8?Q?PSC5Esf2LiLavCLPrkeIMcB7/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7494cae8-d751-4b9b-2d4f-08dd9242fae2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:24:13.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdeNLHhPzqcBbo6VDzid2pOCyNfSRqlBRswvteQvd0QxheKqvn4EyQIkJjNLC44kldOWSd6eB1Q9h4g8iSh4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/22/25 08:58, Melissa Wen wrote:
> This reverts commit 272e6aab14bbf98d7a06b2b1cd6308a02d4a10a1.
> 
> Applying degamma curve to the cursor by default breaks Linux userspace
> expectation.
> 
> On Linux, AMD display manager enables cursor degamma ROM just for
> implict sRGB on HW versions where degamma is split into two blocks:
> degamma ROM for pre-defined TFs and `gamma correction` for user/custom
> curves, and degamma ROM settings doesn't apply to cursor plane.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1513
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2803
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4144
> Reported-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> Hi,
> 
> I suspect there is a conflict of interest between OSes here, because
> this is not the first time this mechanism has been removed from the
> DC shared-code and after reintroduced [1].
> 
> I'd suggest that other OSes set the `dc_cursor_attributes
> attribute_flags.bits.ENABLE_CURSOR_DEGAMMA` to true by default, rather
> than removing the mechanism that is valid for the Linux driver. Similar
> to what the Linux AMD DM does for the implicit sRGB [2][3], but in their
> case, they just need to initialize with 1.
> 
> Finally, thanks Michel for pointing this issue out to me and noticing
> the similarity to previous solution.
> 
> [1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/d9fbd64e8e317
> [2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/857b835f
> [3] https://gitlab.freedesktop.org/agd5f/linux/-/commit/66eba12a
> 
> Best Regards,
> 
> Melissa
> 
>   drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> index 1236e0f9a256..712aff7e17f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> @@ -120,10 +120,11 @@ void dpp401_set_cursor_attributes(
>   	enum dc_cursor_color_format color_format = cursor_attributes->color_format;
>   	int cur_rom_en = 0;
>   
> -	// DCN4 should always do Cursor degamma for Cursor Color modes
>   	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
>   		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
> -		cur_rom_en = 1;
> +		if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
> +			cur_rom_en = 1;
> +		}
>   	}
>   
>   	REG_UPDATE_3(CURSOR0_CONTROL,

