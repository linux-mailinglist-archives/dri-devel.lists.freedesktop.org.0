Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC34BAF04
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DC810E356;
	Fri, 18 Feb 2022 01:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E31710E356;
 Fri, 18 Feb 2022 01:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXNkW2SmNMb4KFPYNTZx4rlnbFoFwiy2mI4WjPc6Oit/eB3WDGIk/O/n64Oe/ilZhfd/227fMUZc2ymYGJ8CyKh7ZVvyIaKYvlazeWgj7hLjHbFC1RHsRwPrnKEivnddIobwfDXnOsYhGDzPyEMBLszxTgtnHafGea1YAosI1Y49KOyni2eHLx2oeLQYuuy5ilBSt7KSYPpyximaEtP2ApS13fOqMwXwHJDGqYo21MO9KH+rzuEgxdhJXG49Or/v2RnlCcIqkXDY88vyoEM+BtCi0k3cZVqlvmsTDoLHpLC4EZbcpgKaClZRTJQbpAMfqDImqux78E8jnbv2g7Ny0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR3ppvXIp6VkfAZu9guR5WfW9L7my/yU8rhhf9NmwOk=;
 b=PorOKQtt3nAYcli3saxCMFby7oMwvUs2Ff9MnSiPMcJEobQNO58jHyYUyhZah/dticjeLbAefhyQreBQANnjrSRgkuqfkxH6yMYYSmJEyJZ+lW90+0lWAqWYQYokozLXsxutZ81vqtACITd4bi9jNJi5QnvDvrtj2XpQ1YANIeuiThKV0C3+D4qDAXOSgd/9cPAON6zJklGMGtr+ZmUnxz7Ttcb7b26MQOkeJOetpt4yogkBmMq+aNU8yujXezCVP8gs07uEG7xRjNpIkI75Yi/MEY1JSjcjJlQTJVugozKV0p82B3GKW+cUIxoi/kyd2sZxaDb0c7HINfJK9NwuyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR3ppvXIp6VkfAZu9guR5WfW9L7my/yU8rhhf9NmwOk=;
 b=kIrUsddmunGSp/hro4XWBjJ/5rmfe83pk9UOzPJSqAPqMVrreB4i694/mypPghcAiCrB+D32bm4BCA8N6EYi44E+bm0oz4Qh5AnWAEY35GiJDAYNzwMYiIJ2FS4kt1OXaaCh96kAFWw7E25S2lxE0J7xgLTB22v75a1QLfN9c0mb95DyY9wFr+1EIfiQuDhPFPje1zmlzIdWu3kiyqtlRdqLBK38+R8BugrOUEwPb8ATZNuy1WiBz9oPHyW6zYwo1z5fzQ6FQPXEmsycYU6TMYHRyLEK2tD0QRFkWW4PQ2INkGVq03WRUQFTP2Zd04BKsMowvdUKW+pHglNxs09hbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Fri, 18 Feb
 2022 01:09:59 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c8a0:e8df:3661:63b8]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c8a0:e8df:3661:63b8%3]) with mapi id 15.20.4995.018; Fri, 18 Feb 2022
 01:09:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Fri, 18 Feb 2022 11:59:37 +1100
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
 <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
Message-ID: <87y229askb.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e61b08-0bf2-42f9-a08e-08d9f27b6210
X-MS-TrafficTypeDiagnostic: DM6PR12MB4137:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB413774529716C7C680B97B11DF379@DM6PR12MB4137.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajqKC+yuoXfDqX0hL66cOQ8CUlFp3eRMxRrPltDpV+gA1gcq5XSUpZ78L9VOfxd6SOzojjJIMsqjk4y7lG/LlKOz8i6nF3aVwJ+KH5hl60+8wwYHS0mc5Bp6n6v4T0PjO9/eK2oMVulL6UbPvyQiMoQuOeMIUQ/R9DbYYKMnMug7vy/cQb5ancboM97t8ZFQVB8l47fyVuRmdRvc6YcTUWDdtCsrtpO81dOmo2HW32rVupZx+5Ls6v++W7tP5x7WYJczJHxoDdjq2qawKF2X6vwuSeqT/8A0STDc1a2Y4QsvV/koOiqXgrVJUi5Zv9Rxez9a622NLZXH5iXHxZ2HYfdYPnkAvCnZyDq9iSvE1Y/Nb45qdNQ1xoiIt0egj82+yWLUXjT1eYofBzmpXjNvGOJVFO4XtOvQ6sgq4uNfOTOc9oIxJPRJz/Dp22AK0yfDLj+XrkQGFRM5yPA9623FAlcZvAoGLdUNmw5RSCs7eM68pzVH1DtAPi7OSoeGbaIm+y4CVTTWwtx8QvoBZzLjdyRCDrmyHU5F/URoRZbEgWdrd1tlMuz8Juqtd7kHPD0Qc1n8TIK1MAfwzpK+A2cCoE92ErcDzlnZzSFzXsw+4UX0IOFS5UJBkV/WdSjhTyydmB6FHIpvmBDm8vZKXxFLFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(2906002)(86362001)(4326008)(316002)(66946007)(83380400001)(66556008)(54906003)(66476007)(8676002)(8936002)(186003)(7416002)(44144004)(33964004)(6506007)(6512007)(6666004)(9686003)(26005)(5660300002)(508600001)(6486002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdSTFVkcUthSFJoR0I1OUNTajFQNE5BcFhEQmNycENjOGR4WWdMWm9BbXhX?=
 =?utf-8?B?dEZKd1NzaXZBZm04YlBVNnZ4eGRQVndZWmZGSkVWdm5zSGNLWE94ckt1QVJ1?=
 =?utf-8?B?UzJucEg1QVVEKy9kQVJsQnMvZHRtcVdPOVF3MldXWTU3Q1hJQTZBTnNNS0hY?=
 =?utf-8?B?NVZubGRYLzg2VkVsTDN1akprZ2RWVTIyenNtRVN0cUpqVVZkN3djL09Sb0Nq?=
 =?utf-8?B?UFFDbXlKS09tbHpaZ0p4MlFNNGl0SEZ0bkN4QnpJaHd2TW9ucWdTVSt3cEdw?=
 =?utf-8?B?ZkRjTlF4S3BDbkd6QWV4RmdvRFl2c2dDMlowVTJVZVN6eDlOa2QyU1VzSllY?=
 =?utf-8?B?QWdwUzFMQVplMXE1RVJMeU4wMDlveU5YOXAybXh3cVNEaUhiSElmVDNlbUNj?=
 =?utf-8?B?cjZpN2ZTZEdIVTN2N1pKb2xQU2hDMGpuU2ZoRnltbis4N1F5Rlp3M0Q4cjl6?=
 =?utf-8?B?dHpXMzk0VU90amZmaHM1aVRpNm50YitOajNOYWhsMlpCTUducHNWTkpMRk5N?=
 =?utf-8?B?dEM4VEkwZmx0c0tweFRuQjA3b3o0bnd5OWxBVlNRbTNST2xPRElTZDdQSjd1?=
 =?utf-8?B?ZjVqZGRnaXJkaWVGU1F1U2RtaEdDa01xVUZGKy95bE9IazNLL0k4WHpNV3Jm?=
 =?utf-8?B?MjdrVFIwL1FCcER6WEJYYlRobllTOTZ4UjFiaVg1blh3ZnAxeGt6S1FTaktW?=
 =?utf-8?B?cldrbXQ1VmU3T2o4QzJjZEc1aDRsRVpyOVJIUE1acUVyVkdZOUVBU3hheGRJ?=
 =?utf-8?B?RVlIVVVwUnRhQ0lLelhTNW9zaTVhcy9uUS9mTnNQRzI4V1NFZ0ZBZjlMS2Fy?=
 =?utf-8?B?R0dkc0lFczdRRDBYMk44Ry94MHlLb0pEemtWWHl1VlVCM1dOVkIrMEJxV1Bo?=
 =?utf-8?B?U1FLa3RVaS93b05XMUR1Snl6T0hmZUFvZ0hTNWxDK212VXVKUWVPZ3RHOTB5?=
 =?utf-8?B?bTJSa05FeWN3ZGJxTHZhdGRVTythUDREc0NMbHNsOTg1OVM3QlFzV1FuV2FU?=
 =?utf-8?B?ZlBCVy9jT3A2dnFZemRDMy9LbHdaMHFXUHQ3SXVhcU5vby9HdVpIRDNCaGEv?=
 =?utf-8?B?eEhOeHJyNmczTlNqK1A3engza3V2Y3pzVWJqUmFLY3NNRmdtVXBrR2xGRlly?=
 =?utf-8?B?L0dFdTBhNnJxcmh6U0NmcmptTkdvYk5weVBXc0RHSENjYSs1T0xFQ2gvN1VE?=
 =?utf-8?B?RlZHQXhQaHNwS1p4MGdFTU5mbkFvUC9zaDk0UCtsdWIwd0pRSnpsRzV1c1U3?=
 =?utf-8?B?QzBtZ2dUa1ZITUl4emoxbVBQeEovaURuRjF3YVJJV0xNNzUvSFk2SHR3b21n?=
 =?utf-8?B?d2hSdUQzK1ZVOTc2aVBEdHh4UW51Q2R3dThET01JNmpnN2FRQ3FCYTVLNXNM?=
 =?utf-8?B?dE5VaklES3plZWJrSGFzaXpDa2g3eFBTMTJoQzJmaXR1eXpqY1ZyVGpGeTcy?=
 =?utf-8?B?VGNoelRyTXBQSWg1ZUFEMiswbHVtZXNqYTFLU0ZXMy9ZRk5GUGxSYXFMNkJK?=
 =?utf-8?B?YmFtR05uRVBaKzZJRHFKVlpPdUtUYzNRY1FCdURJWlJBYjhWMU5UZ2tMMjBO?=
 =?utf-8?B?cGprd2lkU3VUT2hJNUZLaGEvdmlYaWQ0RVhka004cFo4eld4Nzh2ZytRL3pW?=
 =?utf-8?B?MmNSaDJaVmNGRDZPVUtrQ3ExVWQva090QW9aMW02bzREQnk1UU9sSWE4bmVX?=
 =?utf-8?B?Q0F5elJsc1NOZjYzZjNmVzlSM3gyV1NCczFuVVdRNDNGSjV6eFllU1gwbDE0?=
 =?utf-8?B?SEtmKzVaM3lqa010WDhodzhRQlBwa291RW11bVRsTk9KT0VWRllCbWM3S2Mr?=
 =?utf-8?B?RFVSOEZzaGdENG5pYW1SSXZDLzFzWjZoOSs4Y2lWTTJsaE5CNjdSUGRUVFJS?=
 =?utf-8?B?azRsQnVjU3dRVzMzNHVFaGV3My9JMW5nQ3dkbHdBRDBvWlpCTzlSQnNRb044?=
 =?utf-8?B?WWEyVFl6cVFORjJIRW83bXVDS3hOcytTQ1RTbDkxVU1JS044ak1Oc0I0Mmxs?=
 =?utf-8?B?bGNQK1E4WE5Kd0dnekhOVllOemhqd0hYMnZRelFHVXpPQ0x3MDRrRHlkRTVG?=
 =?utf-8?B?WDUwVlVIMlFNZE9rK0V0eU95YXpQTXFIMFJ3Qkc5UW5IdnJMWG53TG5NTDJu?=
 =?utf-8?B?RHNJVmpTT0tzdytBckRHR3dEd1FVWWJQOXVOZ05FdlZwVFpqTHR3VS9VbnNn?=
 =?utf-8?Q?7fIpfaNfkoXiq6araxzfHto=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e61b08-0bf2-42f9-a08e-08d9f27b6210
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 01:09:59.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oz5aC1I4Gm72YzZtfcVMmDU8vcB+SoplxNgJ8R+x37KHgNOybSQViuJ7MuaAqn00FKoc0+Sma2Un9OnOHXpZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Felix Kuehling <felix.kuehling@amd.com> writes:

> Am 2022-02-16 um 07:26 schrieb Jason Gunthorpe:
>> The other place that needs careful audit is all the callers using
>> vm_normal_page() - they must all be able to accept a ZONE_DEVICE page
>> if we don't set pte_devmap.
>
> How much code are we talking about here? A quick search finds 26 call-sit=
es in
> 12 files in current master:
>
>    fs/proc/task_mmu.c
>    mm/hmm.c
>    mm/gup.c
>    mm/huge_memory.c (vm_normal_page_pmd)
>    mm/khugepaged.c
>    mm/madvise.c
>    mm/mempolicy.c
>    mm/memory.c
>    mm/mlock.c
>    mm/migrate.c
>    mm/mprotect.c
>    mm/memcontrol.c
>
> I'm thinking of a more theoretical approach: Instead of auditing all user=
s, I'd
> ask, what are the invariants that a vm_normal_page should have. Then chec=
k,
> whether our DEVICE_COHERENT pages satisfy them. But maybe the concept of =
a
> vm_normal_page isn't defined clearly enough for that.
>
> That said, I think we (Alex and myself) made an implicit assumption from =
the
> start, that a DEVICE_COHERENT page should behave a lot like a normal page=
 in
> terms of VMA mappings, even if we didn't know what that means in detail.

Yes I'm afraid I made a similar mistake when reviewing this, forgetting tha=
t
DEVICE_COHERENT pages are not LRU pages and therefore need special treatmen=
t in
some places. So for now I will have to withdraw my reviewed-by until this h=
as
been looked at more closely, because as you note below accidentally treatin=
g
them as LRU pages leads to a bad time.

> I can now at least name some differences between DEVICE_COHERENT and norm=
al
> pages: how the memory is allocated, how data is migrated into DEVICE_COHE=
RENT
> pages and that it can't be on any LRU list (because the lru list_head in =
struct
> page is aliased by pgmap and zone_device_data). Maybe I'll find more diff=
erences
> if I keep digging.
>
> Regards,
> =C2=A0 Felix
>
>
>>
>> Jason

--=-=-=--
