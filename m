Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFCB5106CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB96210E2AB;
	Tue, 26 Apr 2022 18:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2048.outbound.protection.outlook.com [40.107.95.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2E710E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BozuPZ1zkdZzIbokMeBI5Rj1TwanPb5PbJ6MpIIQ6+JzxckDK8sqiRLWSk5+YUlWDk8zQvC8+z+R8FpNc+CD0d+mxq2+mhhjZyNESRU0Vybs0ca814KyK4EHBhvaCCFImqUMgqiOti+PPGFKrFjUND63fT321NMWvPnEDs519UldYRJqAakhzEP2LLmtTtNnHI6ybmEzk91IsZl/RL6bFmtKwWT28R3A81F4Rg5mF/o2QlIiHtHAfzR7OjQ/ZfTmD0OH8G4bpW3pPbMW2/ppJP29nVDKTIpH0P8Ur8HbA8wt57UbpGpzFXh7FdxCaE++unYimQlyKzvVEVxqCbsElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTJ698ndq8MPvdgqi7HLJtdX5RzOIa7RKCImp4d4Fdo=;
 b=EsbWuMKyvcB/PzMsh4Zp3jLfnLkjM0UMfWoPNBmUpiPATUurUycArEXl5UOYHT4OZod2cGlcI10EXGP5KI7zQq6Qcxbd+9azVYdNVPPanI8p4VwQ2u01E0JjZmiWHEfjyp7CxjeL9QN3U3tI2+iiMNB2VVeHWt6a74L79BVyldETt88I7EZE1B7V4U0R1QUDI0LL5mcoe6cgc+QjR0WxbibpZy2cBw+8eAVi9nx5mxnYt9tkWWGTr+K2mbYPjnBDmxhwGI26rNd1uebYj5flVg2PGknY8ZEiHQvHYq6/FNjAe4AazkxXdd/AZH9mHRSIrVRa0bG25lA98XYJWfL5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJ698ndq8MPvdgqi7HLJtdX5RzOIa7RKCImp4d4Fdo=;
 b=gH/UYqveOcmgWG3wapPVkeGTdQ3Fk0EOcGCw2SkKLAczD8K6toqG+VDI8xp01bu21KOUFW0PJMOYsaQNJq6HkfWAZQgL4IKZQPYzyKtFzRIMFGVDdtMmfeinI80OXTb6ZjyWWvXbld9pfr0cx7zP7E7kDxYJ88mg54yoOKvJM9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN8PR12MB2980.namprd12.prod.outlook.com (2603:10b6:408:62::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 18:25:19 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 18:25:19 +0000
Message-ID: <a7a60651-04a8-4c34-e487-c7908e223124@amd.com>
Date: Tue, 26 Apr 2022 14:25:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] drm/sched: use DECLARE_EVENT_CLASS
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20220412204809.824491-1-olvaffe@gmail.com>
 <CAPaKu7RwUwuQEGBB87CQysOFzPHbzjhW6we4dq198UsOWdoJyg@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAPaKu7RwUwuQEGBB87CQysOFzPHbzjhW6we4dq198UsOWdoJyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::11) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3bb56f2-5199-4381-c57f-08da27b21e15
X-MS-TrafficTypeDiagnostic: BN8PR12MB2980:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2980685DF74A7001CEF31055EAFB9@BN8PR12MB2980.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Im67qHManmnt1asbDA1pvJpoT4nSro/6kebu+8FpCwumjgKA///HwFxJJxHxYdfW4p/5ZJPD40iKM3jVEVN/vALQnP9mzdldfqNA86eWeLybbww3PGizC4kIsVojs8myF0uE7iueaEPtafTjK9KhDugfOpBeVRnl4j7lUpVyJW6Hsof3iD/GMZdEAjNqEyjaCNVifAI8ru17l7+HXaruMDGPaQtU9z0IjBQc6QCw9gaYlLyIVrKqs/x5ey0oztSlMEvN8NWBEiRm6d5nSFNt2836Ra0iarXcLZr+0VkPh4v94KGTlwL/Sh3sVQFyNqY1aAJcF/NCjl+w25EXu0tAdsi52knN6RZ3oaiJ3XyXlmxE0+YScUkgHJFkdWRWNr/Mpt4+AEfKF+209L19UFsTmWFhLJzwUOiXsHhrUNi6/mOGQA3zeliIS10kdhqlBdY+/0ahJSRmMCy2Y0PVLfyBIrjcOltWfhNieG5NIGOCuzw5YfRqXooE+RmEIZip1+4cEFsT1R1ppzO5QRs+CDIj5ejRSwBckZXrLHoEZoGsdAq1L3zg5Fx2M94TYhaKQA0ES8yENavudiiouO51yvyJN82JORuIdvfWox5B5b7yiX+T0zBD9ZBtbao8/8ToMWlkuo1Qe8b/uabTPECvmmMOB4rl3iGxbbT9nafrppOfSpxUwfp8CbgtLYIeBcP0pfTQP2gNBsGoY9t0LWKfZSkcQfk5rzdSVZzjrJbAVAvbTBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(83380400001)(110136005)(54906003)(4326008)(8936002)(8676002)(2616005)(316002)(31686004)(186003)(36756003)(66946007)(66476007)(6486002)(66556008)(44832011)(4744005)(38100700002)(2906002)(508600001)(6512007)(31696002)(86362001)(6666004)(5660300002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNCSXNWb014WHJsTzFiMUpsRTluQ2JMcFl1QllTTE5LeENGNVFKcHVmMnY5?=
 =?utf-8?B?Q2J1Z2F1cWVIWlBUZHFIVGplYzlmYnpWdlg2MVB4a3c0Q0lGQldXcG1LaWNq?=
 =?utf-8?B?L3ptMFRpQmQ4OVJRY2hKN1pMTU8vY05SWDlJRXBVWTlKNFczdWhyUDBJQVFy?=
 =?utf-8?B?NTYvdC9qeGJ4YnRxbzJ4L3ZYWTJPMjJnbmRpczhoSXlQWmo1Q1ZnL2VGUmRr?=
 =?utf-8?B?UU0raEpuVmQ5NVBrTkxodHUreUFhNWx4MmFSMHN6Ym82WnN2QmJpakRUcENO?=
 =?utf-8?B?RmpxRVAzZ3gvbkhXUHJtTWNqMVpaL2lJMUFvcERxUklqQTBYNE9LaitpTWp6?=
 =?utf-8?B?YUZ0QkRuYVU3S1dLeW5LaGgzR0ppcmVYTUtKWkZHREhOMThOdDZ1a0MwR1dU?=
 =?utf-8?B?bVB4M0JLNW5Hdy9pREhaNWYrZUdVQUwwWGZVaGJzV0JGcHZJcjlxa2FtWEhO?=
 =?utf-8?B?KzlWRlYvajdCcmcvTElJWk0zM1c3azZLQi9nbUZGSXplOEM1MU9VUVRLRzdR?=
 =?utf-8?B?VnlUQ0p2U1ZIVGFWL1lFWVZLVDEyNUdmQkgvTDJ3ZUZYMlN4WXBOd2FGVVU3?=
 =?utf-8?B?dklhVTRqNnNKMlVhSURTZ2wwOEVXUTV1L21SK2poOUtzTWt6TmhUYW9MZkw1?=
 =?utf-8?B?MmlPeGtPQW54SHBySU9UOE90cTRZYVRuTmplZ1NzZzBpaDhPSlFwWFRRR0pE?=
 =?utf-8?B?QjJXQmlIcUk4ajJhOTFESlVrVUtPRzVKZVNSZ1BtRnFrTCtKSGZKQi9QRnpj?=
 =?utf-8?B?elRNRCtRZjFYUDdWK0dzM1JxeDN3Zk9SWkp4RXBTZXdIaGJEb2NLQkM2RTF6?=
 =?utf-8?B?bGJyRW15dFAvN2Vxb3RPQU01djVCRHcwcW1QY1ZzeU1DVHM2OUh4bGdvWWlY?=
 =?utf-8?B?OGM0dTRNcHAvR1J3bEVsdjQ0ZmoyNm5yN00zQ2hRc2xWOUF4UXlqdTYzaTZN?=
 =?utf-8?B?YjhjUG1DWGorbnpENCtRWjQvZ215STNONUk3Z05aMUJ0MnA2U3llVEJMeUR1?=
 =?utf-8?B?aGFFcGFlVldXUUI3a1NQR3NsNEJYVFNMMHQzVkNWOS9LdUVOZ1NMUlpDNWRF?=
 =?utf-8?B?Lzh6K3E1T2N5YWN2NDJjRGNDSEJ2bXltTjhDUnNGdllyUHVGUWoxQnZTWVl0?=
 =?utf-8?B?aG52Z3R2VCtnYWhJa2tYMXBZU080ZGcxbnlDMytWK1pxSjV4RldBaW41UUY4?=
 =?utf-8?B?anpaMklDYXpTN0lxanNUSjVLalo1MmhDSnJkd0ZpenF3UWlqY3hMck5DT0RV?=
 =?utf-8?B?bjdZd0UxcVhzcytUTitxNU8rdzR0UkZ5ZkJEckE3c2lmQ3J2V3VHajdSdUg3?=
 =?utf-8?B?U2sxbU43bDdYcTQ1QWl3Rmh3MjRETXdONmNzWmlRbW9rb1QzL3NmMDBYMGU3?=
 =?utf-8?B?V3FjMHRZa0lraFkybjV4YXpwWFQ5NHoxOTJGcVNvTkxMVWp1Y2tsK2hyZTRM?=
 =?utf-8?B?c2x2V1E4RWl6blRraUc4R3RJQXJNeHhSZnU0NDdoK2lYSzlpTmY5RWd4ZTNH?=
 =?utf-8?B?STUzUmFHM0E1aFNENFhJNmgvVlRqMEhiUm5iWGlERzY1VFpRc3pYSHczbkpT?=
 =?utf-8?B?eTZ5UGYwYVliWEtHSEU2bHpkMTlTK3JRRG5yTllXeXpoaGtxVjVSN1FaU2RI?=
 =?utf-8?B?dlFLNHpiMU94RTNha3dINExvdzVrTHl0RmFBMGtFVE54dVpUY01semNGNDRa?=
 =?utf-8?B?U3dFUmppdHpDSnlHeko1OU1WamEvK0JHSG5aQzEzakl2bWY4WFNzL0ZDWW5m?=
 =?utf-8?B?T0tpTjNGR29nZWdiaFhCb2lhaFNud1NIM2FMOTloTk9PenBtbFdXUktjRlgz?=
 =?utf-8?B?TVZtOU8vY1pvMytBM043dFduNFdLcHE0UGEvWCt4WHYyNWZnTGpxaWRkV0l3?=
 =?utf-8?B?MldKNmhSSDZOcXJmdzVLS0FjVFFCL3JpMmlZVWZFK3hqT011c0NvemxvSFJH?=
 =?utf-8?B?ZDRIYU0zT2JqWGZxcERKU2tLb1daOEhpUnZaaFN1UkdSWDk3ZU5TRW5FbHdm?=
 =?utf-8?B?RG9pTjZnbVExVE9wVzhsRVRVVEgwZXc3TFh6Q3dDU2g0VW9LUkVmdGlPZVVr?=
 =?utf-8?B?V1AvZGo0T29YZjJvQ2YyUjM4MVU4ZjQ1NklSSExyOCtCMHdIeHo1Rm1TTFlE?=
 =?utf-8?B?VnJILzMyWlBiYWdINHdJTElnRmJUMTdEL3dyekoyWlFsN1RrT0QzVklZMDgr?=
 =?utf-8?B?dHJiYVc1Q2I0T1ZsVUZud2swd2V5MUd5NVZBcGRnWVF5RnQvdHBneWEyeGlZ?=
 =?utf-8?B?MlYwRkxPVFJVb2hSNDFOSWI4TzNuZU5lT3ZOazhoYzJSSzcxTlNHVmd0aG4x?=
 =?utf-8?B?Nzl3cGJTbk4xRzlnNVhEb21rZjdoRU5uK0kxdklzblRtcFBtMmV6eHhUQkpi?=
 =?utf-8?Q?HpPbjmHP5bAgrrdKgvuAB4p8OOqixd+2/iblbciuAp3xz?=
X-MS-Exchange-AntiSpam-MessageData-1: xYeqTqiYDLCqeg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bb56f2-5199-4381-c57f-08da27b21e15
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:25:19.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsfHC5z+E4WQiw44FVZP7qqXA8iGMAWBzH5ssBo6pnH8H3lVt5uf229o3JUW5nz8kfOMwv/419cCzKgcpxYmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2980
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's ok to land but it wasn't, do you have push permissions to 
drm-misc-next ? If not, I will do it for you.

Andrey

On 2022-04-26 12:29, Chia-I Wu wrote:
> On Tue, Apr 12, 2022 at 1:48 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>> drm_sched_job and drm_run_job have the same prototype.
>>
>> v2: rename the class from drm_sched_job_entity to drm_sched_job (Andrey)
>>
>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> This series has been reviewed.  Is it ok to land (if it hasn't)?
