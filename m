Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4F3ADF8B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 18:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFF289C25;
	Sun, 20 Jun 2021 16:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CC489C25;
 Sun, 20 Jun 2021 16:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJZtf0PHWkpw5FqbHBrkh6GYTAcBKXV4Tn74eJNQcWSdZN6mCZamEu2lf61YgtNeJ3tvU2fJ4TM4sBWksqKNvjWQ/to5mKUuOMDIC2n9rKzPkwVKbRadBjk49pVvfqiVKcUkXGNeF8e0/iVLNH1QYqX/cPSyYsfxcHqBN7hlAA5R+k9njj5nuqx2mNhn9EYF1aVOTxsq7J0zB6rf/4TAJVkBEBvvvcm/1BKY46Vr1IW35f7iRlE8w3GEHzw6POxvDo1zQfaSFSvEgZLrfrurl6upPiSeqdK3knegBKfGyZzjVdo/UeuyJLKpL0tkWpkVcnWClvC8UGby0XpeBFeBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEwcvYxjefNKF5hLIL5fI74gAy0M7moofEBlw/F50fk=;
 b=cp/ocYxN75K6WknoTSdHfrIlF1quqjgzpB1jiwOePCoWESGdob3htfzAgY3OW2WQTSdQvqXAHsskGtuRi7zTeH1M78XhFWHzJ2J7/7ObV/O2j3Jx2psHOYISL+0xHF53Jq6eY5y2xsShPJyD4AXj6OdTvWU6kHsueiEN9M5sS+MIMBTylmrVL0KA4l9vaI1Aze/jZBoWeZUJquVj/drOlXre+1rNUuZ8ONOMGoL7KtFM8x9BfJyODyU1aCgq1aLw22kqg3nMjbzCh/Yvrfg6vBnzFup8PDOie5Cd2S8h2GWMGHBOTT8MAG8IMYc9ECP6l8NRV0f/rDL8F/hp9oVxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEwcvYxjefNKF5hLIL5fI74gAy0M7moofEBlw/F50fk=;
 b=x0xT9HL1vEpg5oFFkWASxLc+LcRZTybDDFpNZtp4TyXTHNOh0qayc4gYhmgu0Mm6S0Rllg2WONtOF+KC9FyGdQGebbKVRt2xw5oFZqoFhLnov7Slpq253xDkP4KO9Nr0FgOvMBgxkkQPkRDS3bBsH5imVfHnErQeX949YfI8LtQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sun, 20 Jun
 2021 16:59:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.023; Sun, 20 Jun 2021
 16:59:32 +0000
Subject: Re: [PATCH 0/4] delete useless function return values & remove
 meaningless if(r) check code
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210619064349.26676-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e6c51c79-52ae-5591-45c7-382d1a8f2b5d@amd.com>
Date: Sun, 20 Jun 2021 18:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210619064349.26676-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4fd6:7850:960c:7728]
X-ClientProxiedBy: PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4fd6:7850:960c:7728]
 (2a02:908:1252:fb60:4fd6:7850:960c:7728) by
 PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Sun, 20 Jun 2021 16:59:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19cdc2a0-d0a8-44b7-a458-08d9340cc5f6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4095B4F4F4FED4CE4237A8A2830B9@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFNHWfPyHDJcHZE1QZolGWBJP/Hfy5/iTOzGGL9MSjWGvJ0l2c+Z3RPWIv4Y9MnyqypUhPYDCAiF0RIXnY0KEcltz6DmoH10OzG0C/YD724AExu5fCDBzqi8dOAbYmEioJ/Y/nOJkzAiqzVdEcIOCg8XCAifiiT/Y1raIN9YCIWf4Nnqo9aXwIdx0p8+2okjhPJq7tKwbAWgwBjRaXFguaG1qRKJYGd7qy9NX4b8ylyGT3OqZUGOPI7wTSPLdL/APOIZsCeEw30Uro4YdAuKFHufpKvqA1rtEF2+qYMLHIy+yPuUX8fhO2d2vzMmVw3lPgk9f/XGZ5yXYIzWGHPwcI3FW4CG1uzJn88OxyjWFTyXXql2KMTYo9Kpvtw4eFe7kdVsy3O/ynWdcmVQEuUqSoxMUtbI0X1kP0+NuNanVlNVhzgRYUbdrOXynFpqzi1SqiaGaENCL4vfYAJwq4EvtLi9EzHhlU2NH3h/O7zQpc9lgz/8eyL4/RcjShG5SFXfpysFxtN8IxJAUu3ZDMIYMvMeSUtXQG02mJkf3+VuK5YUf6ZMOcPt3V6c1BgToMPQ1Tyg4SPuOXHs0hVbGobWuR47ez5XTgkr9jmOgTFwFJErk+hxbsR2eA5zm5sITkODwvmDMmtoFR1yS053FXXIBK0ZjMoPrzomzpGqRNDk18kZNrxV9tj1SttBngZ5mWdb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(110136005)(5660300002)(2906002)(31696002)(38100700002)(478600001)(86362001)(8936002)(16526019)(186003)(8676002)(36756003)(83380400001)(31686004)(6666004)(316002)(66556008)(2616005)(6486002)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0lxWG9tRjhYQnN2b1pKMmJwZS9pUGduK2NrRk9za1hyc3puYkh6ZDRFdVdk?=
 =?utf-8?B?cmhvK3lKTjI4VWRweTRTaFhYSXcrNXQ2NEM0U0dYdmhDUTBqT2JLUmtaRGZh?=
 =?utf-8?B?OVJzK3ZCdHA1ckFWbkpjQUlJYVZ6eHBUaWt5VWJGbFJySGhDZjdoelVvWTl5?=
 =?utf-8?B?MTY2a0ZnaWF5d2NmWTh0b1lWTlVQR1dwQURqRWk2VG9DVC9Pa1QvU0w5RlUx?=
 =?utf-8?B?UnhJR2NMQ3BFMWhyQ1lwcitSeEUyRkpmSTdpSnNJbmNBRXgrMWxWODdXSXo2?=
 =?utf-8?B?YmROZWJ4bVNDWGZHSUZ6YlNSZUdndHJFUVJiV1MzNlJ6QXlJTWg1Q25kM25i?=
 =?utf-8?B?SldCWkJZMlNOcWlqeGNYZThIdjM4TUlEcDlHQ3g4ZDJTWFVRZjNyRGZ5bWt4?=
 =?utf-8?B?SlhVbzhLTWMvTGEwNFZWV0JGMnNJRTlGcVVqdlRJbCsxdE1XQk84N0tRQnBL?=
 =?utf-8?B?Z25nOElNRWNOWTlUWDBWREJQV3liUHJCQVh2M3lhUGh4RnZTN2piWEpmNHdt?=
 =?utf-8?B?aGNNT0dEWWNLbm94aFlKUUFkQThMMnZiZ3UwdC9veE1LTTh4K3ZHUGczUHM5?=
 =?utf-8?B?MUJJM2JGMHYwbjQzWkpIVncwd2RqTmZOdzFGRlM5cXpsZk0vV3JxRXFRQ21t?=
 =?utf-8?B?Tm1hMEtWR1JoUkdqNUk2R1JqMGtoSVFJUjJHbEhsZjJ4ZFRJa3FMeTdwak9o?=
 =?utf-8?B?Q2JmNVVSNC9saEhTVG8wbmxaWmcvZXNmclhRRmtrbXN5Zy9xa1RVcmx5eEVF?=
 =?utf-8?B?c3E3MWdMdEJwSTlzZ2lvNTg1Tkd6bkZLZ1ZVLzFJUDdrNlFOY0dwclpnVWNG?=
 =?utf-8?B?Q1VZMjMxaFYwWll0aEVjYVM3U2krbWlJdkdtOWl1OEw2bXYySHA1aEV2Q1lC?=
 =?utf-8?B?N0szMnNUUE9mTjZVZEIvQTJtTGd1dFA4TVozMGU5RHFMTjRlNFZ1ekMrcURV?=
 =?utf-8?B?WjVIZGpVMUZvaFRYQ1kzZSt1eTZKaW9MVGJEQXhGTEpoTWxOajJHeW1TaG14?=
 =?utf-8?B?aW1EaGRTb1JzWHE2Q2ZFc0xXYkhuY3Z3L3dsdUFyWUxUUm5UNm5pT0gzNCs5?=
 =?utf-8?B?TlhZQUF4THF5M290c0xmT2ppaFZEWW5pMlZidTZFcW9uMVRzOG94bGpIb0R6?=
 =?utf-8?B?QnlNc3cxSUw3RnIvSTFhYzR0N2JhbjJ2eXpqQURmQWtUQ3UwZVhzZkcyNXY5?=
 =?utf-8?B?RVp1OEhubHNZVldJYkNqcm5xeVlrNzVodHRlb1N4MGFOcUkrWnpHTll3NjFw?=
 =?utf-8?B?dDloTEduYW1VNHlvMkRLaUZvNHZmcDhCaEx0WXVSUkp5bUViNDVubVd6MUs3?=
 =?utf-8?B?TVBIVjRxWGxnV244dTA5SUVmaitMTzVqbEcwR1RlWitXRDN1ZFJMdmNRMVFQ?=
 =?utf-8?B?V3U4eE8wUUI4OTIraGxrUVJ0TWhMeVhaazZMZ2hxVjMvdWEyVng4QVBWdEoz?=
 =?utf-8?B?c3ZrVVRHNGN4TDE3RHBIOS9EYmp1ZnlBUlIxREhoWlJFN21wTnY3cjYxN0Fu?=
 =?utf-8?B?U21pK0dJdHo4VjFiZm5idGgwcS9tdm5uWXhBV0ZNZG1saFF3T0NXQjBnZmly?=
 =?utf-8?B?dEJLT2ZsUG9DWG81UFlVUjFqdzk0UWlKeWJvMytMc2Y4a1NQRHRpWEJNSHY1?=
 =?utf-8?B?bTM5RmxWelJ6Z2NVL3BDQUo4ekRhOWdxRURsdEgrS1FIVEU1bmV2LzlzaDhy?=
 =?utf-8?B?czB2WUxWYzlBSVVRS2JuOU93TnhaYzFhN2p4ZkFwbStxZXcydXdvRlk5R0NS?=
 =?utf-8?B?NElOLzU4dmx0MW15Njlqb241UmVvSXF5ckNNWWhvcUFhb1NzbzQxa1h4eVJZ?=
 =?utf-8?B?d3VnUWdNcnpGVFloTjdKSlJtVXkwOU04QnYxY0FpOEhCdGZmM2xWWE5NbjRt?=
 =?utf-8?Q?tTM3KpRL2cyI0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cdc2a0-d0a8-44b7-a458-08d9340cc5f6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2021 16:59:31.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9olaTX5oGOkZRlysZoDWhQipnW57czRru3FNzgPQAZDnEB3NWLGc01IaXnqrp8YU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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

Am 19.06.21 um 08:43 schrieb Bernard Zhao:
> Function radeon_fence_driver_init always returns success,
> the function type maybe coule be changed to void.
> This patch series will first delete the check of the return
> value of the function call radeon_fence_driver_init, then,
> optimise the function declaration and function to void type.

Please merge all of this into a single patch, I don't see any point 
separating this.

Christian.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Bernard Zhao (4):
>    drm/radeon: remove meaningless if(r) check code
>    drm/radeon: remove meaningless if(r) check code
>    drm/radeon: remove meaningless if(r) check code
>    drm/radeon: delete useless return values
>
>   drivers/gpu/drm/radeon/cik.c          | 4 +---
>   drivers/gpu/drm/radeon/evergreen.c    | 4 +---
>   drivers/gpu/drm/radeon/ni.c           | 4 +---
>   drivers/gpu/drm/radeon/r100.c         | 4 +---
>   drivers/gpu/drm/radeon/r300.c         | 4 +---
>   drivers/gpu/drm/radeon/r420.c         | 5 +----
>   drivers/gpu/drm/radeon/r520.c         | 4 +---
>   drivers/gpu/drm/radeon/r600.c         | 4 +---
>   drivers/gpu/drm/radeon/radeon.h       | 2 +-
>   drivers/gpu/drm/radeon/radeon_fence.c | 5 +----
>   drivers/gpu/drm/radeon/rs400.c        | 4 +---
>   drivers/gpu/drm/radeon/rs600.c        | 4 +---
>   drivers/gpu/drm/radeon/rs690.c        | 4 +---
>   drivers/gpu/drm/radeon/rv515.c        | 4 +---
>   drivers/gpu/drm/radeon/rv770.c        | 4 +---
>   drivers/gpu/drm/radeon/si.c           | 4 +---
>   16 files changed, 16 insertions(+), 48 deletions(-)
>

