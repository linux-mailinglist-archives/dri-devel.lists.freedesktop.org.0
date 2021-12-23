Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BF47DD86
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 02:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3CF10E221;
	Thu, 23 Dec 2021 01:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7688A10E1BB;
 Thu, 23 Dec 2021 01:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNirQbO7V/COE3dOqgdgEQLOLJVjEh4DfSdNYHpB1uc0qQyUp8Sz6B+rpYDn0jdZsZXfpIndk+1m9Dw/pCRGhv9YhspQz1qgqBs9IRKUvHa/EJ0zeQkpKpOP8YGOHMTPeKu7c/czBdlIxbjRCOTj/eSZz2/F+D1ER4mrfaTW3DOBpXL7ZhaxjPdpXNP7wlMO2/2P/FsC+15PrvqWvtitKlydlm9k9qqGlboViQlVu0Nfl+7u22AI4QGv0oh2eFsRRV5P02KiXKEe/opnqpjyKyFFjViNqaTgZSIEiN7Gwadj7kLt6zCA1fi5NmOPUKZcSKP+nWa9ha+68VZEZNeZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVUBdQUAwi/DkbKr07aG7HwsjsPEmtn6Tw04FY2EYbA=;
 b=V8mxxgKI0kzvxls8nj2P/FTfOSgX0okKZBvc4WKN1fDCe93HRnsXIIu1Gr8rviUbE22zxvHR5kQOAbkPSCwxBaYlWUByytPtXY576BpNhAONEZ9hpF5Yfn/Zm3nUbT9HfAr5ufsVWIYlKzb1BM8mJtMuwWAOJijtdM36zSeeaVJfTbJcOTDRgpqJv7t0mWIVHoherPSBUdbZ8Hs3G+B1yt8mo+1vL9pzYgFAimyVYAFIZCDBD4wk2q/71W051XX5MZpThpIKqYkneUDz4Y26D5er07aCi7RF3C/bkig7Hlc+lT85LQxkN5uweD43lQrPFNjKP926WNwq4PAddNH1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVUBdQUAwi/DkbKr07aG7HwsjsPEmtn6Tw04FY2EYbA=;
 b=w6KUYviSxOxZ5c0NdexH6YysMip+70K4wHn1KaBqMoXax36+R+6Jrdqd93WPhHQ3s+py5Z+qBOl0fO+qhN4wnB2rJa5b+/zbBZewvYDBKtA7i9O3Bi0l2CzYcnrS7MTPyKPejZ1tvPMYQDMSyWLKM1NEhVuwNe2TI7VgUM2lKGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1527.namprd12.prod.outlook.com (2603:10b6:910:5::23)
 by CY4PR12MB1142.namprd12.prod.outlook.com (2603:10b6:903:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 01:49:54 +0000
Received: from CY4PR12MB1527.namprd12.prod.outlook.com
 ([fe80::b83d:9c56:74dd:937b]) by CY4PR12MB1527.namprd12.prod.outlook.com
 ([fe80::b83d:9c56:74dd:937b%11]) with mapi id 15.20.4801.020; Thu, 23 Dec
 2021 01:49:54 +0000
Content-Type: multipart/alternative;
 boundary="------------NENmfoTjxbriXqOEwzv4Cdzx"
Message-ID: <ebcdbdad-1d34-41be-0423-e97b994e2bb2@amd.com>
Date: Wed, 22 Dec 2021 20:49:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>, Adrian Reber <areber@redhat.com>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <YcOQN/l7W66W/X0f@phenom.ffwll.local>
X-ClientProxiedBy: CH0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:610:cd::16) To CY4PR12MB1527.namprd12.prod.outlook.com
 (2603:10b6:910:5::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8644d832-0adb-4b91-dcb7-08d9c5b68402
X-MS-TrafficTypeDiagnostic: CY4PR12MB1142:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1142DE692B9B8CCFFE763860FE7E9@CY4PR12MB1142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QXK1kq/2ZsSb4QJAi3TUxb4T1orpgE73GRLDQ2uxziDZCe8fpxbv7+zktHTQg/rhQMTih+2xdDO6PAfPM384rLZcgg2wYyd7hW8SqFrcr5zHwI9EzPyYm7wCxcJfFzrO4/m8cdKZzZH/V0uIgfrbrL0ymmDZVYRl0E8Tf7z4H+sTNUcoBDwV6ZoLSvD4DhxJ1VdzX2U2RTA2yhB2CT3AwXY3uFHvHtSroFbU1kqlUqMeSS6k4rhQX0yuXjqyJbTdFFMFN33CXacRk/wCHm5wfLFx1sZDIqisnFqct/24r8w7Mae4UlDpmj7aMFUzS3r8asgfWrR4CykNwdeEB4wkP6rtKXCCF5U/rCBWs+tmpfbkn553DF4M4cnlLB1hoeNvGzIYO+HXAtoeV9WSuauLVfjfvVRXXMeN+fS+vbpvT4nCbu9heCj71unUw9n9yrf7T9DzpdKk9yWA3bkAZKQUo8x7zVU1bhFTW67IOXin9Hv8TxE06zvdk/aVGsfl/qMtiOLgD/eOV/mMLFpQvJQibu5v019DM1U5qH81IiwdG1aoA/fnVqhjkj+uT05DPWkffnotXg5A2BSiNol32Qow4kMiNnzEum/BFHYNQlHkzfdx0PZIpVGC2Q9BQ9HWxUf5vUoiC+IUncimZolqnfJYzRRUp4GHJn6eUJAwIB/7PvDzc/JimAb77r4lqy8PjMXiga0Utww1LWpbxSWnueFwjEsYLzY116WPK3z9awyHthdv8tLE66TCCKplxUgrZIM82rhy73xQVAqThcAW6gEpo37+cmuZXVm/31KI8y096CInvJJc14JqWGM4d+ymOtQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1527.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66574015)(66556008)(38100700002)(2616005)(66946007)(2906002)(30864003)(36756003)(5660300002)(508600001)(45080400002)(4326008)(54906003)(316002)(110136005)(166002)(26005)(31696002)(966005)(186003)(83380400001)(31686004)(6486002)(8676002)(6506007)(6666004)(33964004)(8936002)(86362001)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3A5Q3I0Tk1uUzF2U3l4WHpHMmpVNW9WekVGZm56bUdUMnJUczFCbGRtSUtK?=
 =?utf-8?B?eWZXdmV1Y1pKQkd0dWZRYkQvbkF4M3lJb0FwWUViQS9qTnRlMHJmM3lzN2la?=
 =?utf-8?B?aEw4QW5mQlY1OWZDb2VPMzlLZXFVeXNpbTdYRG4zQUo3RGZFSERsL0tzNEdl?=
 =?utf-8?B?NldwUEtkYTVXQVFhK0tiRVlzZ3RWb2RRYmpTWVVoUlpiM3Z1OFRKM2g4VTRz?=
 =?utf-8?B?NzRXQ0lGWjI5YkwrRHRwVVJmcDh2T2FnL1ZBOFVXamNrTGR4eHJ1MTA2UTBM?=
 =?utf-8?B?SFJWMHdiSitHa2srNzJyY01kK2NOQlJLendzeWp1TUZDNmQ1SWxOVUdibUNY?=
 =?utf-8?B?SXlLV3EvZ2JLc0EwSk05aW15c291eDVyU1B2VVM1bGVJQU85enEzZlJoaENN?=
 =?utf-8?B?WXFWczBnQzJTT09QeWFvT2JQN05LeGpTN3hpem5hSDZ2S0t2VDh3SlM2MVl1?=
 =?utf-8?B?blgxNEwrcFpreVlNTXd4bC80aGl1ZHVFU0JKekV3VTd5ZHlwbVpFT2lDdCtM?=
 =?utf-8?B?dkppYS9OR3R0N3VEbWRCZTkyTm1oajdLTWx0aEhjR2VxSkdRSnNLaUtlcTFp?=
 =?utf-8?B?OFNhZXNkWnA3KzZKanV1UTNhY2FoQU1LZFNEcTV0ZjBSU2pzZk5RWUtoSmE5?=
 =?utf-8?B?RVVjSllpNHZZSGI0RFBRSDJuWTNXc1RmZm9OZnR6b29xU1h4MHB6UVhSYXND?=
 =?utf-8?B?WXNyL0RXeFI4Q1FQMGppdDFIQXB1VFpGd00yNDdPZmVXM1BmOUloaXZmT0kw?=
 =?utf-8?B?SHhMTnVNR1N0emFOMW5tZERIRXBSalFQTTR2TDFHamdQMHJWU3BNdndWSkJ6?=
 =?utf-8?B?cXJQV3ppcFRXUm92L1RBNnZRSndLa3QwNHljcXJRYTlPa2RVajRaRDZtLy9h?=
 =?utf-8?B?MjBjcmtuMkR0RTFoU2FuZ2ljdmxMdDFHZUt1dXhLOUNaOUVBRmpNYTBxcFJu?=
 =?utf-8?B?aUNQd01reGZ1ZTFQSFlSOGE1Y3dMTmE3RU5VY0RyaEJKOXNPQ2p5SVgwRGhi?=
 =?utf-8?B?b0lPWloyaWtFK0JUQjVvS3QydTJ6L2M0TXV3VW9EK3BHejFnQklMM09qdzAv?=
 =?utf-8?B?eWkwdEg2cVpVRi9pWWMzS0hCYlZ5end0bDJGejJwWGFrcTU0YmE3YW1tTDNp?=
 =?utf-8?B?YmRiTzhrTDhTZ25BeEcwWE1wZy9OS0hVYjBITnAvbHpuQlpua1pDTHIyV0pN?=
 =?utf-8?B?cFpXMWJCbUlRU1pPdUY0ZHFodG5iN2NzQXJtU3NqRjU5akQxaDBTUWRPNWF1?=
 =?utf-8?B?K3RENEcxSlpSbmxLUngwYXpOMkQ5WEhKUGVTQTVFR0UzWW9VQ0hiSkpGNXlP?=
 =?utf-8?B?NTBGMWdIYlpBdHAxYjR2cUJqS1dWYzFEem92TjhjK3JDdi9ZUkJKVkd0ZmtZ?=
 =?utf-8?B?U3VzN2pNSGh0MWp1blZlWnoyRk13NlpFU0JSVndHY2U0NC9pZUR0MGZibVl4?=
 =?utf-8?B?dW00SnBkZTF4ZG5Yd20xL0Y4VURGM3VMeDdNb1lMcXFiSkNzNmJ2M3hLeGcr?=
 =?utf-8?B?NUhWZTdPa0NZSUdueDVONlZjMERudnlLdU13SW1MRW1YN3VQMGNyakVhUWwv?=
 =?utf-8?B?S0x4a2NSWHZFb0JTQmxFQS9NZnIyZkpCM3ZqWDExQmVwRmZPOFpxZXl0V0Ey?=
 =?utf-8?B?RkZCK2piZzNFVW1namQ0SlBCVUJzaERNNzNwTFBGYnloeVpCZ0F6V3pxMFhi?=
 =?utf-8?B?cStuNVZNUndnUW5SR1pvTzNtYXV0NitScm52amFxNGJkdkNwdUVvdkQvbkZ1?=
 =?utf-8?B?QWtoUEZaVlh1MlhTQkJMdUlCUHhQczR2VTBLdHZ1VUhLZUFuTnlDeXE1Wmg2?=
 =?utf-8?B?blFEYlQ2MEZxajFrNWNwL3ZJRVNJVHd6bWw2NUloVXJvUFFGV09FL1ZaMS96?=
 =?utf-8?B?RUtrM3hhbWRkNDVWWUNyMk82OTlnQnR6akR3RnhhNE1FK3RVR1Rsd2JaMkl1?=
 =?utf-8?B?M0NkK2UySmIvMmx0a29CamFYT3lDbU0yTGVqeUFUUkhYdVFLWDVDd1RsZEtk?=
 =?utf-8?B?cFpaN3MzUTJtVGlSOE1CS0NRbDhma2kveWIyZzMrQ2x0TjZTNUJqRDVMVlNw?=
 =?utf-8?B?NDBwNWFvZjhkRnRrQ3FwU0JvRWdBMlZHYURSb0NOWXZGc2wzcVdWU1lpaFZv?=
 =?utf-8?B?VHAzQXYvR2JIVGxnMndGMUVIaW9TelpWdG9nZmU1Zk0yTkZITEcxRkJJc3NB?=
 =?utf-8?Q?itfO1YNWVd6WuF7Y1zNmKB4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8644d832-0adb-4b91-dcb7-08d9c5b68402
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1527.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 01:49:54.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfZikYCMBClui4gFJMZpBWdeCwGrb9YBDUEOkjz9n2fbj7BJMNDvo/PLGcLDt/rd4o1zAO6TCmDkfgPW90VSow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1142
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 criu@openvz.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------NENmfoTjxbriXqOEwzv4Cdzx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Adrian Rebel who is the CRIU maintainer and CRIU list

On 12/22/2021 3:53 PM, Daniel Vetter wrote:
> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>> On 12/20/2021 4:29 AM, Daniel Vetter wrote:
>>> On Fri, Dec 10, 2021 at 07:58:50AM +0100, Christian König wrote:
>>>> Am 09.12.21 um 19:28 schrieb Felix Kuehling:
>>>>> Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
>>>>>> That still won't work.
>>>>>>
>>>>>> But I think we could do this change for the amdgpu mmap callback only.
>>>>> If graphics user mode has problems with it, we could even make this
>>>>> specific to KFD BOs in the amdgpu_gem_object_mmap callback.
>>>> I think it's fine for the whole amdgpu stack, my concern is more about
>>>> radeon, nouveau and the ARM stacks which are using this as well.
>>>>
>>>> That blew up so nicely the last time we tried to change it and I know of at
>>>> least one case where radeon was/is used with BOs in a child process.
>>> I'm way late and burried again, but I think it'd be good to be consistent


I had committed this change into our amd-staging-drm-next branch last 
week after I got the ACK and RB from Felix and Christian.


>>> here across drivers. Or at least across drm drivers. And we've had the vma
>>> open/close refcounting to make fork work since forever.
>>>
>>> I think if we do this we should really only do this for mmap() where this
>>> applies, but reading through the thread here I'm honestly confused why
>>> this is a problem. If CRIU can't handle forked mmaps it needs to be
>>> thought that, not hacked around. Or at least I'm not understanding why
>>> this shouldn't work ...
>>> -Daniel
>>>
>> Hi Daniel
>>
>> In the v2
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fa1a865f5-ad2c-29c8-cbe4-2635d53eceb6%40amd.com%2FT%2F&amp;data=04%7C01%7Crajneesh.bhardwaj%40amd.com%7Ce4634a16c37149da173408d9c58d1338%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637758031981907821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=h0z4sO19bsJecMqeHGdz%2BHZElKuyzK%2BW%2FMbLWA79I10%3D&amp;reserved=0
>> I pretty much limited the scope of the change to KFD BOs on mmap. Regarding
>> CRIU, I think its not a CRIU problem as CRIU on restore, only tries to
>> recreate all the child processes and then mmaps all the VMAs it sees (as per
>> checkpoint snapshot) in the new process address space after the VMA
>> placements are finalized in the position independent code phase. Since the
>> inherited VMAs don't have access rights the criu mmap fails.
> Still sounds funky. I think minimally we should have an ack from CRIU
> developers that this is officially the right way to solve this problem. I
> really don't want to have random one-off hacks that don't work across the
> board, for a problem where we (drm subsystem) really shouldn't be the only
> one with this problem. Where "this problem" means that the mmap space is
> per file description, and not per underlying inode or real device or
> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
> want a consistent solution across the board for this. Hence please grab an
> ack from them.
>
> Cheers, Daniel


Maybe Adrian can share his views on this.

Hi Adrian - For the context, on CRIU restore we see mmap failures ( in 
PIE restore phase) due to permission issues on the (render node) VMAs 
that were inherited since the application that check pointed had 
forked.  The VMAs ideally should not be in the child process but the 
smaps file shows these VMAs in the child address space. We didn't want 
to use madvise to avoid this copy and rather change in the kernel mode 
to limit the impact to our user space library thunk. Based on my 
understanding, during PIE restore phase, after the VMA placements are 
finalized, CRIU does a sys_mmap on all the VMA it sees in the VmaEntry 
list and I think its not an issue as per CRIU design but do you think we 
could handle this corner case better inside CRIU?


>
>> Regards,
>>
>> Rajneesh
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>>      Felix
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
>>>>>>> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
>>>>>>> you!
>>>>>>>
>>>>>>> On 12/9/2021 10:27 AM, Christian König wrote:
>>>>>>>> Hi Rajneesh,
>>>>>>>>
>>>>>>>> yes, separating this from the drm_gem_mmap_obj() change is certainly
>>>>>>>> a good idea.
>>>>>>>>
>>>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>>>> access restrictions applied
>>>>>>>> exactly that is not correct. That behavior is actively used by some
>>>>>>>> userspace stacks as far as I know.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>>>>>>>> Thanks Christian. Would it make it less intrusive if I just use the
>>>>>>>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
>>>>>>>>> this patch? For our use case, just the ttm_bo_mmap_obj change
>>>>>>>>> should suffice and we don't want to put any more work arounds in
>>>>>>>>> the user space (thunk, in our case).
>>>>>>>>>
>>>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>>>> access restrictions applied so I wonder why even inherit the vma?
>>>>>>>>>
>>>>>>>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>>>>>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>>>>>>>> When an application having open file access to a node forks, its
>>>>>>>>>>> shared
>>>>>>>>>>> mappings also get reflected in the address space of child process
>>>>>>>>>>> even
>>>>>>>>>>> though it cannot access them with the object permissions applied.
>>>>>>>>>>> With the
>>>>>>>>>>> existing permission checks on the gem objects, it might be
>>>>>>>>>>> reasonable to
>>>>>>>>>>> also create the VMAs with VM_DONTCOPY flag so a user space
>>>>>>>>>>> application
>>>>>>>>>>> doesn't need to explicitly call the madvise(addr, len,
>>>>>>>>>>> MADV_DONTFORK)
>>>>>>>>>>> system call to prevent the pages in the mapped range to appear in
>>>>>>>>>>> the
>>>>>>>>>>> address space of the child process. It also prevents the memory
>>>>>>>>>>> leaks
>>>>>>>>>>> due to additional reference counts on the mapped BOs in the child
>>>>>>>>>>> process that prevented freeing the memory in the parent for which
>>>>>>>>>>> we had
>>>>>>>>>>> worked around earlier in the user space inside the thunk library.
>>>>>>>>>>>
>>>>>>>>>>> Additionally, we faced this issue when using CRIU to checkpoint
>>>>>>>>>>> restore
>>>>>>>>>>> an application that had such inherited mappings in the child which
>>>>>>>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>>>>>>>> render node VMAs helps. VMAs mapped via KFD already take care of
>>>>>>>>>>> this so
>>>>>>>>>>> this is needed only for the render nodes.
>>>>>>>>>> Unfortunately that is most likely a NAK. We already tried
>>>>>>>>>> something similar.
>>>>>>>>>>
>>>>>>>>>> While it is illegal by the OpenGL specification and doesn't work
>>>>>>>>>> for most userspace stacks, we do have some implementations which
>>>>>>>>>> call fork() with a GL context open and expect it to work.
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Cc: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: David Yat Sin<david.yatsin@amd.com>
>>>>>>>>>>> Signed-off-by: Rajneesh Bhardwaj<rajneesh.bhardwaj@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>      drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>>>>>>>      2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>>>>>>> *obj, unsigned long obj_size,
>>>>>>>>>>>                  goto err_drm_gem_object_put;
>>>>>>>>>>>              }
>>>>>>>>>>>      -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>>>>>>>> VM_DONTDUMP;
>>>>>>>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>>>>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>>>>>>>              vma->vm_page_prot =
>>>>>>>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>>>>>>>              vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>>>>>>>          }
>>>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
>>>>>>>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>>>>>>>            vma->vm_private_data = bo;
>>>>>>>>>>>      -    vma->vm_flags |= VM_PFNMAP;
>>>>>>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>>>>>>>          vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>>>>>>>          return 0;
>>>>>>>>>>>      }
--------------NENmfoTjxbriXqOEwzv4Cdzx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Adding Adrian Rebel who is the CRIU maintainer and CRIU list<br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/22/2021 3:53 PM, Daniel Vetter
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffwll=
.local">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Dec 20, 2021 at 01:12:=
51PM -0500, Bhardwaj, Rajneesh wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On 12/20/2021 4:29 AM, Daniel Vetter wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Dec 10, 2021 at 07=
:58:50AM +0100, Christian K=C3=B6nig wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Am 09.12.21 um 19:28 sch=
rieb Felix Kuehling:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Am 2021-12-09 um 10:30=
 a.m. schrieb Christian K=C3=B6nig:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">That still won't wor=
k.

But I think we could do this change for the amdgpu mmap callback only.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">If graphics user mode =
has problems with it, we could even make this
specific to KFD BOs in the amdgpu_gem_object_mmap callback.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">I think it's fine for th=
e whole amdgpu stack, my concern is more about
radeon, nouveau and the ARM stacks which are using this as well.

That blew up so nicely the last time we tried to change it and I know of at
least one case where radeon was/is used with BOs in a child process.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">I'm way late and burried a=
gain, but I think it'd be good to be consistent</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <p>I had committed this change into our amd-staging-drm-next branch
      last week after I got the ACK and RB from Felix and Christian.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffwll=
.local">
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
here across drivers. Or at least across drm drivers. And we've had the vma
open/close refcounting to make fork work since forever.

I think if we do this we should really only do this for mmap() where this
applies, but reading through the thread here I'm honestly confused why
this is a problem. If CRIU can't handle forked mmaps it needs to be
thought that, not hacked around. Or at least I'm not understanding why
this shouldn't work ...
-Daniel

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Daniel

In the v2
<a class=3D"moz-txt-link-freetext" href=3D"https://nam11.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2Fa1a865f5-ad2c-2=
9c8-cbe4-2635d53eceb6%40amd.com%2FT%2F&amp;amp;data=3D04%7C01%7Crajneesh.bh=
ardwaj%40amd.com%7Ce4634a16c37149da173408d9c58d1338%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637758031981907821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sda=
ta=3Dh0z4sO19bsJecMqeHGdz%2BHZElKuyzK%2BW%2FMbLWA79I10%3D&amp;amp;reserved=
=3D0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ore.kernel.org%2Fall%2Fa1a865f5-ad2c-29c8-cbe4-2635d53eceb6%40amd.com%2FT%2=
F&amp;amp;data=3D04%7C01%7Crajneesh.bhardwaj%40amd.com%7Ce4634a16c37149da17=
3408d9c58d1338%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637758031981907=
821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dh0z4sO19bsJecMqeHGdz%2BHZElKuyzK=
%2BW%2FMbLWA79I10%3D&amp;amp;reserved=3D0</a>
I pretty much limited the scope of the change to KFD BOs on mmap. Regarding
CRIU, I think its not a CRIU problem as CRIU on restore, only tries to
recreate all the child processes and then mmaps all the VMAs it sees (as pe=
r
checkpoint snapshot) in the new process address space after the VMA
placements are finalized in the position independent code phase. Since the
inherited VMAs don't have access rights the criu mmap fails.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Still sounds funky. I think minimally we should have an ack from CRIU
developers that this is officially the right way to solve this problem. I
really don't want to have random one-off hacks that don't work across the
board, for a problem where we (drm subsystem) really shouldn't be the only
one with this problem. Where &quot;this problem&quot; means that the mmap s=
pace is
per file description, and not per underlying inode or real device or
whatever. That part sounds like a CRIU problem, and I expect CRIU folks
want a consistent solution across the board for this. Hence please grab an
ack from them.

Cheers, Daniel</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe Adrian can share his views on this. <br>
    </p>
    <p>Hi Adrian - For the context, on CRIU restore we see mmap failures
      ( in PIE restore phase) due to permission issues on the (render
      node) VMAs that were inherited since the application that check
      pointed had forked.&nbsp; The VMAs ideally should not be in the child
      process but the smaps file shows these VMAs in the child address
      space. We didn't want to use madvise to avoid this copy and rather
      change in the kernel mode to limit the impact to our user space
      library thunk. Based on my understanding, during PIE restore
      phase, after the VMA placements are finalized, CRIU does a
      sys_mmap on all the VMA it sees in the VmaEntry list and I think
      its not an issue as per CRIU design but do you think we could
      handle this corner case better inside CRIU? <span style=3D"color: rgb=
(201, 209, 217); font-family: ui-monospace, SFMono-Regular, &quot;SF Mono&q=
uot;, Menlo, Consolas, &quot;Liberation Mono&quot;, monospace; font-size: 1=
2px; font-style: normal; font-variant-ligatures: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: =
start; text-indent: 0px; text-transform: none; white-space: pre; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(1=
3, 17, 23); text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;"></span></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffwll=
.local">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Regards,

Rajneesh

</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
Christian.

</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
  &nbsp; Felix


</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
Christian.

Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">Sounds good. I wil=
l send a v2 with only ttm_bo_mmap_obj change. Thank
you!

On 12/9/2021 10:27 AM, Christian K=C3=B6nig wrote:
</pre>
                  <blockquote type=3D"cite">
                    <pre class=3D"moz-quote-pre" wrap=3D"">Hi Rajneesh,

yes, separating this from the drm_gem_mmap_obj() change is certainly
a good idea.

</pre>
                    <blockquote type=3D"cite">
                      <pre class=3D"moz-quote-pre" wrap=3D"">The child cann=
ot access the BOs mapped by the parent anyway with
access restrictions applied
</pre>
                    </blockquote>
                    <pre class=3D"moz-quote-pre" wrap=3D"">exactly that is =
not correct. That behavior is actively used by some
userspace stacks as far as I know.

Regards,
Christian.

Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
</pre>
                    <blockquote type=3D"cite">
                      <pre class=3D"moz-quote-pre" wrap=3D"">Thanks Christi=
an. Would it make it less intrusive if I just use the
flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
this patch? For our use case, just the ttm_bo_mmap_obj change
should suffice and we don't want to put any more work arounds in
the user space (thunk, in our case).

The child cannot access the BOs mapped by the parent anyway with
access restrictions applied so I wonder why even inherit the vma?

On 12/9/2021 2:54 AM, Christian K=C3=B6nig wrote:
</pre>
                      <blockquote type=3D"cite">
                        <pre class=3D"moz-quote-pre" wrap=3D"">Am 08.12.21 =
um 21:53 schrieb Rajneesh Bhardwaj:
</pre>
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">When an ap=
plication having open file access to a node forks, its
shared
mappings also get reflected in the address space of child process
even
though it cannot access them with the object permissions applied.
With the
existing permission checks on the gem objects, it might be
reasonable to
also create the VMAs with VM_DONTCOPY flag so a user space
application
doesn't need to explicitly call the madvise(addr, len,
MADV_DONTFORK)
system call to prevent the pages in the mapped range to appear in
the
address space of the child process. It also prevents the memory
leaks
due to additional reference counts on the mapped BOs in the child
process that prevented freeing the memory in the parent for which
we had
worked around earlier in the user space inside the thunk library.

Additionally, we faced this issue when using CRIU to checkpoint
restore
an application that had such inherited mappings in the child which
confuse CRIU when it mmaps on restore. Having this flag set for the
render node VMAs helps. VMAs mapped via KFD already take care of
this so
this is needed only for the render nodes.
</pre>
                        </blockquote>
                        <pre class=3D"moz-quote-pre" wrap=3D"">Unfortunatel=
y that is most likely a NAK. We already tried
something similar.

While it is illegal by the OpenGL specification and doesn't work
for most userspace stacks, we do have some implementations which
call fork() with a GL context open and expect it to work.

Regards,
Christian.

</pre>
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">Cc: Felix =
Kuehling <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Felix.Kuehling@a=
md.com">&lt;Felix.Kuehling@amd.com&gt;</a>

Signed-off-by: David Yat Sin <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:david.yatsin@amd.com">&lt;david.yatsin@amd.com&gt;</a>
Signed-off-by: Rajneesh Bhardwaj <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
---
  &nbsp; drivers/gpu/drm/drm_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 =
++-
  &nbsp; drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
  &nbsp; 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..d9c4149f36dd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
*obj, unsigned long obj_size,
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto err_drm_gem_object_put;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
  &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D =
VM_IO | VM_PFNMAP | VM_DONTEXPAND |
VM_DONTDUMP;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_IO | V=
M_PFNMAP | VM_DONTEXPAND
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | VM_DONTDUMP | VM_DONTCOPY;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_page_pr=
ot =3D
pgprot_writecombine(vm_get_page_prot(vma-&gt;vm_flags));
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_page_pr=
ot =3D pgprot_decrypted(vma-&gt;vm_page_prot);
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 33680c94127c..420a4898fdd2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
*vma, struct ttm_buffer_object *bo)
  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_private_data =3D bo;
  &nbsp; -&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_PFNMAP;
+&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_PFNMAP | VM_DONTCOPY;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_IO | VM_DONTEXPAN=
D | VM_DONTDUMP;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
  &nbsp; }
</pre>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>=

--------------NENmfoTjxbriXqOEwzv4Cdzx--
