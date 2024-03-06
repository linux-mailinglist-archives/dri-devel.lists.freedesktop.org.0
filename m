Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D348873E10
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888EB1133C6;
	Wed,  6 Mar 2024 18:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HqNC6PEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F181133C6;
 Wed,  6 Mar 2024 18:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmUBZV6tDUhvz93eTClhYbAeerpc9VU/G6zzpzffuFKaX0eQCXPiPvcir+cCbDgeWvgomj83hBBH2kNrcW2sEfawOY49ir9yV6+hIxYHZyigXGo/oKtOFTsi2L9LP/y5QbTMhShDpLoi74OTo4u/3gqUTHu0ENl/cq4+FKeV0xuGYI983F7X9Y9CBs2e62OJVvagDYBS9AmrUgmSh24GAyJ9lhwrnoGn9Se/wvJ5o0cpNdAqPGgThv4YfwjgQFfd1h0IU+TOvkotS4spngleXXLMa30mrwOfKzduu2UW/OOjNUxy+JDQWPsuNIvLuRQH9NocAP6/hkU/eEMVggescA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Y3aveE3HRFSeCGl42/ZXnYZFCUd04RKxV5QFY4mUM=;
 b=mLvaGudwmieUlbo0IEZ6MbiOurJ0dWz3+iyYIb11WE5F0pF9NVjncPCIDo3Y3wiyTGqzzZ5+aZOkXdWjOV9YT7EoH+GeGzGxowSBCaKK8ZmLprGwQmEmjZK3GilLleuY+nskZxTxLlkw5Fm4yRGEA7rTEDCfUcIf0+Lj6ZRz09soVgexoskBMx0on30nXFDQR7N01vf+vtRbftXCP8wraeh/NIQkIk9CEXr/kCqals/R/CVWWkNDODQYCK93xBLfsQhHxM9MaMvG9Qiup2WF8zN34uSKB6vFvgzMBhYYxKee6DTc8PsAswenGddVb13r8deuJQN4YCy2FKRZD1r0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8Y3aveE3HRFSeCGl42/ZXnYZFCUd04RKxV5QFY4mUM=;
 b=HqNC6PEoM5DhkOx/HHaFzra6fzrCmWdkXJuIXQUH/3BSHVJuDpyzYcdPQFkykFhD93ncOVkpm9+mdoYa7+1oa658NEsMaPC48HMDrBaE2UbNtRxebUI9vqL/Cg54PyaFhCm/Shre9DDJZAOzN/3H+ZMRIgjX02LIENzh4vnUtpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:177::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 18:02:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 18:02:54 +0000
Message-ID: <1ce952e9-ba06-4b02-83d0-107df0e4d13c@amd.com>
Date: Wed, 6 Mar 2024 12:02:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Hamza.Mahfooz@amd.com, Harry.Wentland@amd.com, Sunpeng.Li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <2333702.irdbgypaU6@xavers-framework>
 <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
 <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:806:d0::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 289c93f6-8adb-4f85-5506-08dc3e07a569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLt//YJE7vw3utECkjux8sjca3+7lo8IjJWkOHJkcLJW03h3AA7g8K5lKkquwPX34f596Qn0zxVjXAqpYGYgCGc4cyEXjp4wXcTr8831RZygD15WGe6u7v4xYD/Z46qVQVhj/f8loxh6OfqyQVkLTvk23Aw5b+hcl8THpcnMC6rnqClwPXxgKRyk8uQ2jq5E8SmlaH9OO0dgy6rvcrnlUklPKhdoMvOfGJ/to2hzUpPiswSghkmGfRNMxOdcB4KKo+XPYNR71aOdCM5EWBohBQjNVgxZKq4BHbhK5vykk/cz5ZnPgBCtYYcRfrRzWeTEtpXSV5BlKAZefHtp0IFuNuYe3rJ/w+sxpEveR4F+1Vl2wwkdpJU8boR6Q+7anAO1CmzuLSGeDWC3gD09FjQf+pSb4TLkDHqqKy3Vx9WtjZbQWcMmsDBY984CXYhbLZHrS+GoYy2a9HIzqBdUkLT2AHIejtaKkGKPYQW2/a6MVF4cEXVofG2V3MxZwsA5Cl2IIiKsBnGPy1EjFQzLQjJy9cinseZmaK1NXYQNNb6NsvYSB8ZqmLLHqqmW7bjGdqgiTQycuQLvUwGNueKOt7PErg0wNYgHZ29W28XzwrnkrwelkmayUrklIGaKXugyJGXOEWlCraoXtc1gZyQh6pHDZyiPBDuHk32HfOKEdWZiRU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVA5RE5rV0hLR25ZSXA4WGxSa2dLN3FJYW1ibzR2L2JvbUIxT3N4U2JtVENR?=
 =?utf-8?B?UmZLSmt2cFJMZzdDQWRncndJeENRZmVIenErTG1IVFp6ZVMrck5weXJ4TktD?=
 =?utf-8?B?QTd3UDZtNXRrZUZLam9LK3lUTys3Yi93YUtxcmFVdGozR0h6SEhkZUI1M24x?=
 =?utf-8?B?M002OG1mK2x4emk4dlJBZGFuNzIzeVVXK2d0MVJHMnd2SkNRczIzTTV3bDlE?=
 =?utf-8?B?UUs1cll3eTQ1bnkzYXh4UUJlK1BTOEMwcjhWNTFIenpiUFdhTjE0blNSQnd5?=
 =?utf-8?B?d2VsNExpSDcrL1p0bXMya2wrdXBiTk53RXREdENBZERIWERGUUZQUTd2ejVM?=
 =?utf-8?B?TlhhN1VUWllVcTViVjdqYi9KTDdkVk91N2R6TDZmZ3hrSUdyeWhsRkxVbU1J?=
 =?utf-8?B?eGE2RGFSWGoveHBMTHpYbkVjRmFMK1VBdk1TNng0UVIxUTVxTk54UmIwaXlO?=
 =?utf-8?B?U1BlN0hSeW9rci9oY2hyZFdLQy96cUk5M2ZBWkdMOWs4OCtuQlhVM1BmbDlP?=
 =?utf-8?B?VTRVVStLVzJVUUU3RFNvSG1VUDlaTWF6OTZIM2wwL1VKSHQvT3YvbUJHRCs2?=
 =?utf-8?B?WjdscmpKR1UvYlZBSjBPSzNrcU1YVWhtK1RIdnN4Mk5NdC9uVjRjOFhYSXMv?=
 =?utf-8?B?ZS9rQW00VngzNmt3VkExOTJrSmkxRFFKNzBVZlpURWV0Kzg4SVYwNGwrRzg3?=
 =?utf-8?B?TUV2c0Y1aDE0RUljTUpsRkVBcXdtOXd2TDhadGllZVh5b3c3R1Q4Q045M0Rk?=
 =?utf-8?B?UEhHNTRsU2lWcklFdCswZ01wNjlpY25XbllHS0cxQVRQRVFISitSTENvM2hm?=
 =?utf-8?B?UHB3Wnpjd2ZvUWJuL3laQmNvRXBaZHVMSmtzWTkwa2hiU1pEUERTOXZNTHJ5?=
 =?utf-8?B?UGNONWZuMDVXR2hzR3NNbnhwMmtBOGdOQSs2c0ZIRlJWUHpmSEYxWVJNR1k4?=
 =?utf-8?B?TG9xa1FqaE9SVnNHVldvaG9xeGd4cU5NUjMzRHF0aFJKaC93Ymg4Qk54bXhz?=
 =?utf-8?B?YnZ3bCtOZzQyNS9JY3RXc0RBT1o4QnRZZzlLY1M2OEpZdXpqcGdjaXpWS3ph?=
 =?utf-8?B?cXhjT3pIUW5TaWM1TWo1dGxvc3hGTFJLV3ZCRTdreFNtVFlPZllkVmc0bkgx?=
 =?utf-8?B?bG1Rd1VWVlp3TWJnY1lrd3ZLeGwxdnV4VnhxWnh1VkVPY0pMV3hPUFBFbEkr?=
 =?utf-8?B?S2NHUzhzZnhrc3Q0WndJa0IvbGpFL1d5dHAxdTlsZWphWmVqNlhtWmIwTjhp?=
 =?utf-8?B?L0l1eXBwdXh6VjVWMFpaa0oxT0FkOXFnMnhUd204c0RPRENuTG9uOEtDeXZB?=
 =?utf-8?B?dDRJaDJicGZuM0FHS2tCNC9oampKcEJJbjJKMTlVSVlQQWpqQlc5L2kyeURi?=
 =?utf-8?B?YXF6MndDa3dNUXVQcjhMdmp5SUNuNW5JczJweTluRVcvQkdlOW1sZW0wU0o3?=
 =?utf-8?B?QXJCaDJvaWV6YmdRY3ZqdlRpSkNRWVZYSEMvS1dIVmFQcE1HSnV3a2x6YjRY?=
 =?utf-8?B?SmU0bHBiVnBrNjFhTm9WMnlieTlEWXEweTNrNEFaUkV6RjFzSm5hVEtnZFZh?=
 =?utf-8?B?TGNhREJObjlHVUxTNFQySURuUFBkdG5kSUd0MUtsTmtpcGYwaEpLN3YwaDR5?=
 =?utf-8?B?NmE1aktoclNhWGp6RWd0dTkwYmZIeVNOcTBnS2FVOHdRUjZQVVd1eEVjaU5m?=
 =?utf-8?B?Z1ZiT3hLcVR3VHZldGFrcm5qc0djZTNPbGN3Njdzd0M5QWtheklRSVErU2tX?=
 =?utf-8?B?alJJZDJDNSttT1FubWRzeU1WVFppeW0xRTRYeGozUXBEQmMrTFBucHNtdWxm?=
 =?utf-8?B?dlhma1RZSFJlc2pzWXBhdnMxV2VxK2FtRlFxZHYwTk41dDlzVGFGN1NTRGVv?=
 =?utf-8?B?VmV6NXlSemg1K1dqY2tSV1hzcldIR0NTTmpHOFFaZzhQekxyMU9nTHBCVU9u?=
 =?utf-8?B?WjY2SjFXZkdRc0VJamtCZEQrMlZ3eHpmbFY3M1VDMzJEaHEzNnpKNXllcm4z?=
 =?utf-8?B?dlBhdHZWWm5NMDRWTktob0tsSmRCaGx6N2dVNElBRHA3RDZnMk52emVNTkk4?=
 =?utf-8?B?VmV6cFR2SUxHODVNTnFsbjAyblZlbWNIR290dzlTNFd3REVaSGxJRWRmL0hS?=
 =?utf-8?Q?uSYgLWypGk2bN1kVsfbWfuiUJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289c93f6-8adb-4f85-5506-08dc3e07a569
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:02:54.2175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbigYQz3uIVvXIpNSU9s7yugNmjV7cltR6PY224Ifql5Axpn5yZUSIWybZ9idhidKrfRMfcm1wQoRoHzp9it+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
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

On 3/6/2024 12:00, Xaver Hugl wrote:
> Am Mi., 6. März 2024 um 18:19 Uhr schrieb Mario Limonciello
> <mario.limonciello@amd.com>:
>> So the idea being if the compositor isn't using it we let
>> power-profiles-daemon (or any other software) take control via sysfs and
>> if the compositor does want to control it then it then it writes a DRM
>> cap and we destroy the sysfs file?
> 
> Yes. That way still only one party controls it at a given time, and we
> can get both good default behavior for display servers that don't care
> (like Xorg or compositors without color management support), and
> compositors that want to put in the effort can do more specific things
> with it.

I think that's a very good solution.

Harry, Hamza, what do you guys think?
