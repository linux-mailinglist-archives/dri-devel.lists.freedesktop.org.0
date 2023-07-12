Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D7750E9A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF3910E594;
	Wed, 12 Jul 2023 16:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BCC10E594;
 Wed, 12 Jul 2023 16:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpQkuEVN4faLOvkjcP1nHZLR3HTysm6oMPiAxItDr1lmnoK4A4PwWulJuHVK3vtMljQg3bEmtgCYRXbOGM3SToccUc6xLUWgWES6W62ZePFH2dfbhZnmiBp+8ehzIsrb1rLMxXxxrC4wcckC+8gj4wvE6Dzaso5LxQdkWYMs/ctkCbVAPM0jjp17A8tO8otwVjJR/Kmy8tlVjn2efsY1VQVafuCViWiVVzk/yzrrlYzq3WAiN7duf2ISAnZGbtVr0XZxUAAAEF3MHOltBz7AuoNGrXm6b8VsH9S2v6gBPOzBFWAMPonN2sEb38WWL3cnT1ucSPsIoROZMZpH+qXCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB4MhnTJUgwR8bIeAUiOJ5g/vTfSQnrtSwygp/RXgM8=;
 b=Zdn3l8GdHrA0ML5FT2MOv3C1T7rCdXgujxXWi946GrxCOAIGlorj3pa3sMBcOHRQTxf5Wu1CuzHGQJlWnru6Mq4CdwvKvcEPyxpu/GB02biw5cDBa1RzcGjFFCBI+n8o3YOUE9WP1W7RX04/cHSWb1vXWuRAhu5E3wnWQLmvkenYG3KR27UKMi50Ec9fjnM5Qy/RJQiw8rhT36+wLNqWOUwMEmc6v0E/oyFVCHv4NfrjQAlAjV2hj3wS66j2Mhe40tAqFgOLnp/YL0K3qma6KwigwuRrMyU6K6KojeBYbR3FrZmYyaWg0kKht32SaOV+eyQKFDcs2tdZXoF0/fBxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB4MhnTJUgwR8bIeAUiOJ5g/vTfSQnrtSwygp/RXgM8=;
 b=ioltW1OztwVlW8VRHQ7Dp/ZpOVZ5UGemUYqi1tsvtgzdqTha6cN49YnMHDIUl7H2s1eZNzAwqwYrpuj0qDi6oni+WN+y5kgBQkec7G65Zb39Gf+qyLBw2YSzSMRgVyScqz87I9wtzPTvj/MPownoeV9XhBjTedgwIuQxBU/+ia0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 16:33:02 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd%5]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 16:33:01 +0000
Message-ID: <ca5fca94-619e-653a-4392-c4a5b6723fdc@amd.com>
Date: Wed, 12 Jul 2023 12:32:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Content-Language: en-CA
To: Melissa Wen <mwen@igalia.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
 <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <20230712162424.z3yncg4ijoyvthqr@mail.igalia.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230712162424.z3yncg4ijoyvthqr@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::25) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e834f8-70bb-43f0-f661-08db82f5a8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BzgqFbY3jP17WzTE/cUbVbF/GwFjrNw1gMxjMP3JLpJzeHutscvcAubSWeZKp0d/9W0y7l8yU2Fkn6Tl/Kezyqq6GUVKAAcxFW/Abaw1t6Hm5wFiYpVswwmCgYZ4CwVi7C9DqlvjLmKpSxgGQSA9Nw0tXE5OBqCEku0fwtCJ9fKSdkwP/DjxoN+gEG5t9C2gmQ1U2utOyAI4mzo2ckS/idCErX3gJSu8VA7DK1AR5btX84ADZ6JbIGPL8kTByTQQGXqouEQToUKRqwyp7JDo64kevNxlaRwbEaSmZurZB5x218eN1bEkhfpYCUIpyNrr9s/+/8yAHwQSk1oejtokwS03OXBGswRFOKdxBH9oDBGDo5sYdpHHQe1qZV14e5EqSW36Hn6Ylk1DKTC5gl/KyugjgVuzyMOr547no4H1gCMGJdGwuqbcme0RNLcewo2IfW/cHhDEaGw6asJ1sFE/pttoZLhj2QRBna3UKaBt2PJMOzYNyqXGPNv8YPkB5QKuotQP7bs0qacyHhM4hgnkM33xjfMLooevYt37slcryZnXoz7XjGBMNAWDtE2OCT5lMbZ9XcB0JP2cQWLZ9oWVnxVlUFSHbcu9xTVsD7MlPHU7+5ta8zuMKYZVIiiEvlQ6E+hmrMUEw6M9kOLaG8qHWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(6486002)(6916009)(4326008)(66476007)(66946007)(66556008)(478600001)(6666004)(26005)(6506007)(53546011)(38100700002)(54906003)(316002)(31696002)(41300700001)(6512007)(31686004)(8676002)(8936002)(86362001)(83380400001)(5660300002)(44832011)(186003)(2616005)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUVHaVFlN1ZBdlg2aW1ubEhER3lZY1dEdzJKTE5UZjZ3SWk4RllGMDhwQW1m?=
 =?utf-8?B?WkgyVUQ3dnFMbjFvVEsvL3ZIb2JIcmpzSXlGMWVUT0xGZlZ3Ym1ZYldKZUNm?=
 =?utf-8?B?REZEeW1HSm1reU5PVUZHVjlGc25hcFBLRWJFeStvQktFR05ZYUxpU2s2aG5P?=
 =?utf-8?B?aUZuTHQrdSsxZ3Zxd0hoMW5qa2hVejNzQ0EwUCt4YUczdE1IOHp4aE1OdGhP?=
 =?utf-8?B?U2JWdW9VbGFOTWxCSmRWdW4yL1pxOU5qTldsQTJ0UDlhdTVpZEdZUFNGTU0y?=
 =?utf-8?B?eUkydUZiTWNZWVY0VjJ2blplMFdNTHBDRHBKY3JzakltTWlCeXU2akpxdDJO?=
 =?utf-8?B?T0luV25CdGlJb1pDdytxUENiNWV2U2pYS3B1ZEQyVkdudWUvZElheDd5TVNV?=
 =?utf-8?B?aFoxUzE0K0VPRm50OXdac3VpRWtRNnlTdmVlaFZrbjRmY3dWNlM5SERyN1pm?=
 =?utf-8?B?Ukc3TTNwSys5Y0JFeGc2RjN2eDRqNFVhUmVDeDB3bzlUYkJWV3EwQm00MDQ4?=
 =?utf-8?B?dGdGMitDUTZUUGtzRWZVb0YvSThNU3dWa3JGQkdaM1puS1NrVFBDQmphTjUw?=
 =?utf-8?B?V1pxNGhDRFlLazF5eXYzek01WFNDWjJCU21SKzNHSldhSmlITEM2VEJFNHRv?=
 =?utf-8?B?SkU2YUVsamZHVlFCU09zcHE0eXJXbTJ4TFdHMUF4bERpUjFVVCsvd09ac2xz?=
 =?utf-8?B?NXFZeDM1RmZ3U1FmMlo3N3ZWR0dvNzNWcHNPakNtRXJnWk1VcGs3U1hkSzR3?=
 =?utf-8?B?SG54a3JqdmxQTUEwUVEvajBxQlRDRjZ5U1luSWRFSTZGMk1BbC9EOExSSkF6?=
 =?utf-8?B?K1haTk9QUnlsT3REWnFJcXcyK243TVg0U3prczhYOGJoTml2NWd0Y3BTWnBp?=
 =?utf-8?B?Wm9KbHlCbmx2Nk5Cd213WkhpWjdITWlWZ2dMOXdwb3VoK2twcVBkc3dXR09D?=
 =?utf-8?B?QlJJV3plc2d2Lzh1ZitrVld2ZkIzdTZ4NDV0bC8vRkZWSEhINk1nYVErQ1BP?=
 =?utf-8?B?eWQzZFR2VjFlSHV0Z3cwRklUK3E2bUpPUFhkQ0E1ZHQ5dEtjYXhxZDB1MGcz?=
 =?utf-8?B?ZzZHcmRhQmp0Q0FwNlhpcFFPM1l3QmlOTC9EWmZ6QmhGVUJNMWFhOU9pSEpw?=
 =?utf-8?B?ajZndWZGaFhmelRkT3BmUmg1Yis3ZlJMOGxVZ2V0Ym1KMjJsa3p5VHNIdzQw?=
 =?utf-8?B?M3lzbHMzb0xBWnJrV2ZiSzQzRU5aVnBsczVjc3hjRG9wRVgvV1Bxb3JFYnNG?=
 =?utf-8?B?NlJVTU02MG1BaS80ZHZTUEdlRitXc2pIUllnbGErVnlObnNTZk1mTjVNWU10?=
 =?utf-8?B?ZU1ZWC81bkNYdU8vdHhXVkpQeGJ6WE1mMGQ4eE00Q2UxWU9LcXdqM09QVVpM?=
 =?utf-8?B?N29kN0R6U3RqYXo3TkpIYXNKOXprd2s1SWZWWmlrSitjZVFtVnJlcWxySS9z?=
 =?utf-8?B?dWhQMU5wME1uOXZXTWg5aGVwd2hWWWJuSmV5NVR5NXdLNzBEeTBmL3ozRVQ2?=
 =?utf-8?B?cHJsejNhTUhFNVN5aUNMbjFRdlhyc0Eyd1dkMGw3YXBlRzFIdkxRUThzTTMy?=
 =?utf-8?B?ZE41UGhwZllJVFg5STJDZW42ZmtwWVhUNk5zWmYxemhQL24wVjlROER5NVl0?=
 =?utf-8?B?am41dXF2T293cVJHZmVGV2x6cFZ6clA2RHVFdFNXclRjOU44T3VDdUVFYUta?=
 =?utf-8?B?TFN6M0J4ZUJncmNkSzQ0dlM3eWJ6c29kYlc3TGZFWFFYV25aNVYwYk53Vm9J?=
 =?utf-8?B?ZXAyRnFsYTVyRGVPVDhyVzdtSHNXNEx5clF6QWRQc3MwajM5dEhycG1zb2hh?=
 =?utf-8?B?OU5rSURvZFB3cTRON1VBRFVjYkorRENVR0pRa0lqc3VrU1JCcWRoOVB3UjFj?=
 =?utf-8?B?alhBV2taanFUcjBwYXdTSGU2K1N1ZzJJeTBXL2FpOGNEMmlNelRna2g2N0Iv?=
 =?utf-8?B?enFWVnBObDNpVzBFc3dFTVd5elMvMFpqRllURUI4akQydVBFd1MvU0g2MGhD?=
 =?utf-8?B?UzFUU2FHejlNZld1SUNYMGViWEFMdERLd0R6UG5PN1hlT0dEczZmNTFMTUJ0?=
 =?utf-8?B?TUU5c2MzZHc1YThpaGp4eGt2dmtZUlRMODZDaDI0bHAyVmdBcU12bVZPNnc4?=
 =?utf-8?Q?sOYZTPfDD7hRC6URkJFF8Nhey?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e834f8-70bb-43f0-f661-08db82f5a8f7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:33:01.7842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEyzjs2sHKPjhf96Y10vdTybkSH917vYXrW8uG+FrGgGmkjb3sKdxQavrm8qK2dWP/PsHFV3u/bflhMW+z7wcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
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
Cc: "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, "Patel,
 Swapnil" <Swapnil.Patel@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 12:24 PM, Melissa Wen wrote:
> On 07/12, Pillai, Aurabindo wrote:
>> [Public]
>>
>> Hi Guilherme,
>>
>> Sorry there was one more patch which I missed to attach. Please add this 3rd patch and retry.
>>
>> Reverting that patch would cause high power consumption on Navi2x GPU also cause hangs on certain multi monitor configurations. With these 3 patches, you're getting the same effect as reverting the aforementioned patches, but it makes the reverted sequence available only for Steam deck hardware.
>>
> 
> Hi Jay,
> 
> Thanks for looking at this issue.
> 
> You mention power consumption and multi-monitor configuration issues
> that can affect a driver if we revert this OTG change, and both sounds
> quite relevant to me. Can they not affect DCN301 too? Is there something
> that needs further work so the DCN301 can benefit from this improvement
> as well?
> 
> Also, let us know if we can contribute in any way.
> 

Hi Melissa,

Unfortunately, DCN301 does not support Firmware Assisted Memory Clock 
Switching, which is the feature that gets blocked on Navi2x if we revert 
the patch in question.  This is the feature that enables lower power 
consumption on some multi monitor configurations and high refresh rate 
single monitor configurations.

Navi2x is configured to use FAMS in the driver, but without this change, 
firmware wont be able to actually enable the feature in DMCUB, which 
puts the driver in a unexpected state. On DCN301, this unexpected state 
will not occur, because there is no FAMS support in driver nor firmware.

--
Jay



