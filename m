Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEA8C7196
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4510E0E5;
	Thu, 16 May 2024 06:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XDUIcn5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5281C10E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhdcocV/cEmnocQm8il/4sY8UCFBGxM0uX914RQ9iHNvh8yZpBEv2aZf4/ZesW5K4gHjeFV0IQEmnc/aAa6wLSbrXWKTgm7ZofIl44SLvfLY9k0IsnJuR+MP44xsDHUBSCN1dqym5F8/C7H/BEr9DLdK4KBR9m/Vw8ZKeLbqN6d8D/VGVr3N0LfiRZEL2XsqmgEkuX1dVT0xvrS2DvIic2XC7nVZdcVBP/ANA7bZTLFH6WTcWstmWfcJwJlGmCAjAF5rnq/8bxVrQhHAq5LQd6+mQWxJCPuIdiShaul0PLqym4eeIw6UZzpMe428X5/XilCrUx9n4T+kqFE2Kjl0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWlStswwlNwVtuB99kd82Tat68s0oinrWBw3dfjUv5g=;
 b=mUVMoSlasnFmAwwyc8kGAFBJso9PL7EOa9660ZZUgp7P2rf76s7bStuQJdAYTdliwzmzP7azZqOxR6d0ztAo00FUEaYi4tbpkdNEoL6PhQHAqtuLiUvXGp77vbtotI8GJCAAlsgMtPRgX3sxn5Cwy1AJJsRv/QqXV2DXuzgrns4BYx7SrUqmPl14qZIyj5lzhKW1TboAqg7gWPlY6X629Aj2Vm7G5UZr77w1ijubYkSW3RLrVRZC4DcnsfHdx4E6gM6FjLnSEQMFRrGQ2oFWRwOmo7OSwUr6iwTV5K7ZUzDP2Q5N8IcuTkWu9E4CbbOZiKoUucBysSzZOq3F7CYB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWlStswwlNwVtuB99kd82Tat68s0oinrWBw3dfjUv5g=;
 b=XDUIcn5Givql7bmCcu4aKfePwJk7KIGzmEKGNGMe9kKC0exsuYXLnaKeE2p33W/YuFD5zlPiQKp/zaAV8svzxQZpf3NYKRLaJ5C9H5G973ENlptzbjOcYkutYLfcqeLzXQEOEAjMs/AODKOsHwz4DuRPId0uybwDX/Xz09JmrNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Thu, 16 May
 2024 06:23:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 06:23:30 +0000
Message-ID: <0631afa1-952b-4fe6-9597-e870d315af19@amd.com>
Date: Thu, 16 May 2024 11:53:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.10-rc1
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
 <CAPM=9twOiwquA7Zi_mr1vKFV4RQqhnbHv+c9Xz6BadF3tGEegw@mail.gmail.com>
 <CAPM=9tyHnK_ReDmFf0eUGGuvKpXJQ0VWuKKhDqJt89URjOTU_A@mail.gmail.com>
 <CAPM=9ty+FH0wW-vuw3H6jE_qg-PimR7pqSSJDNLgyYO1NC+-XA@mail.gmail.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CAPM=9ty+FH0wW-vuw3H6jE_qg-PimR7pqSSJDNLgyYO1NC+-XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::18) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 5342a544-a424-4043-d5e4-08dc7570b441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHl3dTlFMVdHT1F5ZlZkWnMwaWpsUHZSbmZiamJaRjVvUFNNTE5iVFlic25Q?=
 =?utf-8?B?SVNWZjA0c2tBWUVuLzV0WkVJQXJEcWRSb0J5QTg3SStLRVpmSFBnaEUxL0xv?=
 =?utf-8?B?UDVLeFBadUVISUk3cS9xc3dESEx0KzJ2Znpic0k5Ni9YSjZnZ2YzTURWRmps?=
 =?utf-8?B?aFB5RGZiczVVelB3S2NRZ0MwYk5zUmVUSzVMZ0lFWFZocVBwaVBXdVRMcDB5?=
 =?utf-8?B?RnNVSmdwUGNNeGZEZTlyQW9Gdmg4L3J3RVBSd3BFaUtiN3JrOEdwZ1VlZVhV?=
 =?utf-8?B?dWNrL2ZzZXBYbnVvVm5FcFppa0JCMXJlTisxU1hlaGdjYXppWTFOdmpRNG1L?=
 =?utf-8?B?YkZ4bGVvaUlsc1g2V3RvS2orNGdxZ256VTNXUGFLK1ZNU2YxVkNPZ2RJYVh5?=
 =?utf-8?B?Q3pMMjlqQXdyVWw1dFNyNUY4MUFkc0IvdVg4TjNLVkVpVFowWUhYQ2JBUngr?=
 =?utf-8?B?QW8vdGpwRi94MHRxcmhjbEdZU28wazVyZG5TYlphL2tpL3FYaWJyaFhFYTQ0?=
 =?utf-8?B?c3plMWtwK0JIZnN5QnkrUVh5Mmhtc1FDSU90WGY4REVsRi91RFhreEp6ZEJO?=
 =?utf-8?B?RTV6dkt2SlpRVDVYZ2RWdzZTcHdXUjNueFF6bllVd0xjUEtaK0RuTjhjN3RW?=
 =?utf-8?B?QldBODVtbzkwYXBVZ1R1bmpOWm9tb2xHMEV5dHQxeEVmZlNJY3FDcVd0VG9N?=
 =?utf-8?B?aCtKd3Z1KzMvbDVGU3BSOXpDSzE5aktXaXcrdDJ1SlM2N01kOE9SS0hCVHMv?=
 =?utf-8?B?bHNMUzk2dVlaOWxpTGNEZDB0eTRiL0VaOS9PVzRCTWIrQlZqOE42Z2swRHVo?=
 =?utf-8?B?Rk1Qc0ZXQkhqNWpPMkVzV3BFUitzNUw2dFRtL1BoZ2M3U1ZBQ3JDOXRtOWRq?=
 =?utf-8?B?cjBXSjRJSkp0cC91TjRSSkhJK3hxcTR6YzFGTzEwcUczYmJhQXJmTEZVMmNo?=
 =?utf-8?B?akd0RGRBRlBIZEZGY2gvVFRqSElwZ05TZU5NdVVYUEpLbENSd2lWeHFOUmcy?=
 =?utf-8?B?RWhUN0tVQWQ0WjljVSt1bXdHdU1LczNpMVN3M3NhNDFWZllhZEVzU21KUE0w?=
 =?utf-8?B?ZGp0SVdJbzQ2ZGtuWkdaQktrY2JIdDVqb1BrU0FnV3Z6MzBmRGVzOC9NcU90?=
 =?utf-8?B?eHdoTTgvMVkrbC9CWDBLZzZkc0dWRXMzU0M2WUVPeTdJYVFMYm5rcFdBVkxY?=
 =?utf-8?B?N1FzK09qZEtsU1VMR2dWTytUNUwxbzRrem1LSjNoVXE2b2VBY2hoV2U5cHZ4?=
 =?utf-8?B?cUcxQi9RSVVZUFhmblN6a0x5a0RydVhEMXdLRStwS0Y4WVBwbm0wcUM5S1RI?=
 =?utf-8?B?cTd0NFIwN1dodkJlNUEyYzNwbUZUR0RrZDVIaW9FeklkTWQ3WmpGY2NDVlkx?=
 =?utf-8?B?dmoxZXNLaDlUN25wWHc0M0hOUWlIbVpRcGtFSUUzNTJTL3ppMjZRenJQTGtx?=
 =?utf-8?B?TmNtNHo4NVJxaEZ0K0h0cE02bGQyM1M2dWJrYlpDd0xwbnczbkRNaWFUZXJj?=
 =?utf-8?B?VFNuN0NIZkJIQ1VyY3dzNXl3UGZwdEhhRUFXand6ckliWE9KK3pPNEt4WThl?=
 =?utf-8?B?UDRHU0x4SEtBSjNBVXdIOWdIRUY5T1JtRGsvbmMwT1NWT2VsSjJUb0piemNi?=
 =?utf-8?B?ZExDSkhEOGRJbzYyOU9Hd2J5aHJiRVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1lxSlQyaGlRbFpaZnVlNGNpcWlPd29nZ05FZWpYdmdwZG9hRm9XcnpyeE41?=
 =?utf-8?B?UEhSTDIrNXdDQnlFYks5M2ZDdDdrOWNDcFNIc0ViVjMya2NTT1JKZUNMTE1H?=
 =?utf-8?B?M1UzTmEzTkZBcDVHcWdKKzlpVnVGUk5tSmhtZGZ3N2ovblV1VG0xakdRUFBi?=
 =?utf-8?B?K0JJVGxmdnA5NGJQOFoxQ2p6cEljd0l0TVdEWkJIUmRUZTB4SnYrM0J5TjI1?=
 =?utf-8?B?TTFXQ2s0a3o3ZFJ6Mnh4RExhejFBaFcxV1AzcklzMDRsSkg3cXBPaDViUVpy?=
 =?utf-8?B?ZUVRdVRiMDdZZlgvVUZYZ1M4Nkk1Tkd0eXl3MFlqNkd3M1daL2FUN3k1ZWNH?=
 =?utf-8?B?RURwYUpQUFg0L0t1OGhmdlJja3pSSFM1WkhCVHZKRVE3Z1NzZlMyM3htd1ZE?=
 =?utf-8?B?ZFR0YmV2SGpZUkNITllsbTljai9qNzNRUmFMbWlBT3JXZlBuTjZGY2wySXZI?=
 =?utf-8?B?RzBwdzV1QTNrSzVCbXZQd1d6djNWaUlRSmVpTStPMUJ2RVBhdVBscmE0WHF6?=
 =?utf-8?B?QUErTlJUQWliTU5sdW0rNGVPSCtndmg2ZWtyc1Yzc1h6MzI1NW91UEpzbStW?=
 =?utf-8?B?SWlhbnFOV3BlYzVRYU1WVW5CdHh0UmVkY0RKMVpaVWtndUlVNmYvM1BMOHJN?=
 =?utf-8?B?dWZQa3RUMlEwR29IcTJpYnhpMlBPeGZTdVdRc2V3N0lsdjlqc1FNbk4zQlZJ?=
 =?utf-8?B?aUVLYTcvZElGV1FzalZHU092Z0I2bU14SXdQM1I4a2dXQll3TW5pQldRWmwy?=
 =?utf-8?B?NXhLMDlQaTdFL1N2dnpsSzFGS09iaDREVVp0NXMrQWlDaFNQL2NTUFlyVVh5?=
 =?utf-8?B?ZXJ4blRpbURDNXJGclIweGtGTjUzOVpmb01ES2krL0Rod0xzNTFTV2kvdzVU?=
 =?utf-8?B?b2Nyc3JyYVhlTHpqR1IwSTAzUnY3eXJacE51TTMreFkzUityMW1iNnZRaDlL?=
 =?utf-8?B?d29ieFVJT3RpeWR3dWkyREVWT29FdWRXSDZOcHhVSThpTXF2MXU0THVNY1hv?=
 =?utf-8?B?dlNscUFrMHRPY1VyRjJ0UFdFRDk5Rjg5SllVb2hCb3BXNkF3TGg2TVpyTnZK?=
 =?utf-8?B?cERndGhaVVFzZUdoVGZTdlJxdS8xSkV5RVJoRENQL1lwSVJIcytkN1c3M0tB?=
 =?utf-8?B?NEdUazY4WWFPcjVyOEg5M2hrUXJSUktmazh3R0lQbTRMYm9pS2toR0UvQW5v?=
 =?utf-8?B?ekVVMjhvRHZnaHZZV3E5MDdEcVZvaTdabEJIVjRYcXFENEpvNW9oOGF0bUJp?=
 =?utf-8?B?YVZSUXUvNmdMM01mQzVYMkk4WDZDR0ZZeUw0c3g0MnloaVIydDFkQ2QvNTlE?=
 =?utf-8?B?UWxNYmdIUzBFSitrY25hOXlPUnVNWHZjU3ZNTHF3UDdCQlZIWm9IMUpXZHRE?=
 =?utf-8?B?cTRzWlVubnB0cEMySkEweDhhMTl1Lys0SEZ2MG5ZMU5wMGZuUkhFRlY4anJH?=
 =?utf-8?B?YWM2ak1RM1IxMFJOR0Zvb1J3S1FaWjJSbVgyMC8zaHRjN21LYnE4d0EzUnl6?=
 =?utf-8?B?dkJLb3A5T240dzhmZFkwZ0ZzWVpiZVVsVUVZTlVXdUs3VnN6MkVKeEJtQis3?=
 =?utf-8?B?MDF0WXV4ZTFyc2lOYVNkSXFFZVZ6anRoL3pZQ3I1ZnNqUHg5Qmt1WDRNdjQr?=
 =?utf-8?B?QjlhWjJxb3c4YWh4V3E0OThhTGNOYVZKZWtFVzZnOXpvdWx0bCt2Q2hPKzB6?=
 =?utf-8?B?OVkwOFBYMjl3Mjkzc0ppdUV0aVZLeUpUdy9HSVBJdmEzQnVBL1hESERZOWo5?=
 =?utf-8?B?bCs4OGNrSVNUZ0VTazQzNHlyaW9jU09VWVpqMHVWZDhQN2pUYmF3ZFNxV2FI?=
 =?utf-8?B?L1ZPenFLcEJuUGV1WStuajNXL3g2Z29KaUhwbDhVWlU5alJaNXhhSk5mN0Ji?=
 =?utf-8?B?VTk1ODQzdTErSkU5QUNCMll6UXR3b2xWanVvVW9OZlh0bVBVR1l5cnRPemdr?=
 =?utf-8?B?YzExdE1ac2ZCQngxKzFGQTZzczQwamVXNENqUDNFWTJ5QlkrQWh2aVNHSXU4?=
 =?utf-8?B?V2JrS2I1bFBUVksxbDdMR2hiZld6MjRJeUJQdmJGRjVwUTRSR1NrY0ZXbnVt?=
 =?utf-8?B?Ty9JbG1hbmtpVjZ5ZDJ5VzRBTkNEMmpYMEd3RU9FcjRNdC9tSzJFR0RNNEpI?=
 =?utf-8?Q?N7voj4ws3yhkJ2CpwdoKa40jk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5342a544-a424-4043-d5e4-08dc7570b441
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 06:23:30.4408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqzxp05P+lTcFLY9348if8NoYzkaw9PqJoYiHuO/jG6/ao4Y6s5fdIkjCb+nXBV8CDu92wT7VddOFr7VMazAQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
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



On 5/16/2024 8:12 AM, Dave Airlie wrote:
> On Thu, 16 May 2024 at 10:06, Dave Airlie <airlied@gmail.com> wrote:
>> On Thu, 16 May 2024 at 09:50, Dave Airlie <airlied@gmail.com> wrote:
>>> On Thu, 16 May 2024 at 06:29, Linus Torvalds
>>> <torvalds@linux-foundation.org> wrote:
>>>> On Wed, 15 May 2024 at 13:24, Linus Torvalds
>>>> <torvalds@linux-foundation.org> wrote:
>>>>> I have to revert both
>>>>>
>>>>>    a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>>>>    e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
>>>>>
>>>>> to make things build cleanly. Next step: see if it boots and fixes the
>>>>> problem for me.
>>>> Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
>>>> this, and everything looks fine.
>>>>
>>>> Let's see if the machine ends up being stable now. It took several
>>>> hours for the "scary messages" state to turn into the "hung machine"
>>>> state, so they *could* have been independent issues, but it seems a
>>>> bit unlikely.
>>> I think that should be fine to do for now.
>>>
>>> I think it is also fine to do like I've attached, but I'm not sure if
>>> I'd take that chance.
>> Scrap that idea, doesn't die, but it makes my system unhappy, like
>> fbdev missing,
>>
>> so for quickest path forward, just make the two reverts seems best.
>>
>> I've reproduced it here, so I'll track it down,
> https://lore.kernel.org/amd-gfx/20240514145636.16253-1-Arunpravin.PaneerSelvam@amd.com/T/#t
>
> This patch seems to fix it for me, I might just pull it into my tree
> and send it to you.
Sorry for the noise, Dave's link is the right fix for this issue. Have 
you already picked it up or should I push it to
drm-misc-next-fixes?

Thanks,
Arun.
>
> Dave.

