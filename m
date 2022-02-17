Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F64B954F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 02:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05C710E6D4;
	Thu, 17 Feb 2022 01:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ACB10E6D4;
 Thu, 17 Feb 2022 01:17:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH4/Os6y8OYIP9HBpkt2qdDmHqEs6Rr3Uoov0bGxFJ9YU1tRtXUdDmYLUcjYnDEs/WZjEmRhYEzcHaP6WvDA3kbuwMuv8TjVwszMsQjxT2r6pwA2yLa8FI6u/1E7AxMR2NPhMlykkgMnLA35Kjawr7NtR4lB4+YjER/18Uak/TOHgGeieXS622FNoLkKugzLYlOFgprF5e5qmtMFwXk2QuFiPKchgknI1EIO92sjkrkj21rloN8ISLk2kGQAaflmq+PK54Cz+2ewoVb/kNjpQin2ACDkAPsmrOfEeSt6Z813YAQFf86SWDuxbaInBuAQjfzwji3wPHcMpA1guMiD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMEuhpmAXulDBY6QBh0+C/j+aTHwg+xI6f3mciGWO/4=;
 b=WXk2I5CJBfc8jSbuf/Xjy+4+2G5BYyUdp0rzqTW1jHZoVCctnaO91LJVK9m3RaAkFrzz7DrOlceuoIdS50cCfUhnEWGdiyJFqVI886K2Hlg1VckjUA7Z8hHQxa3N/X079ChIC8z+xnq6z1cMeRSbKrbzyd+AocvmQIzF8BgAYZgh8koTBKuvGSYAl0V7b5LSzVRQkg6vCe3qeDeZ2zSWGSvOeZt1EFGPoqwunofNFkV/8HvERsVRy+zJ7Ogd9dUUe1a1DbIN0ttFwfhK2Tn6+JhzkibvPfp2QYW7LMu0pf1deL9Abgm5Xl/tTsEzG3kxTxmv72D6fkuGw5BgISW/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMEuhpmAXulDBY6QBh0+C/j+aTHwg+xI6f3mciGWO/4=;
 b=GWKpTPIiXHsGds6/l0PX+kmSxPY5Zznbtqg4MN+Kfg9vVB1xUqTBaTdkNapDkAPLYeHBwAabUs7DUbmBndPZfcmJOqp4Uv0L+pqBqUXKPCtpVbdVs26LscZEfHc6wq6a4Rw/daIMasSp579DbZJBcL6jHEnYZLCBsLit4Ccw6CHgUtYbr3yHgUJrHWMN/izHiBqQkZfMrYRKxRlYgpXVhgzgPwVwBNoMNbqBHC3J5sH+WWRKL8ISm72Ozd85JptE2dGmTyUbJpWqTztCjVCMZhwUnY39YHcd1fLcXzohKhYafYUxeyp/Zg73Efhh6+Yr88O2N1Xi80yguoSGXVNIEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BYAPR12MB4776.namprd12.prod.outlook.com (2603:10b6:a03:10d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 01:17:51 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%6]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 01:17:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Thu, 17 Feb 2022 12:05:39 +1100
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <20220216122600.GG4160@nvidia.com>
Message-ID: <874k4ycmva.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f4a4e9b-8375-416d-c21a-08d9f1b35121
X-MS-TrafficTypeDiagnostic: BYAPR12MB4776:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB4776C5225D5A4F55C606BC6BDF369@BYAPR12MB4776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSYGsru7tCqTqqhGWYEL2WYfCdp9E1GWbdtP1LT8vg88+Nu2kWdRh3SIYwRjXSfHyM30GQaYAVXe0RI+snffgjucqFM8DQZ9OeJU5epubGL6LsVvRM4rAw+a8c1JGcYwIiq9hEi00XDPryGx9yjs3b30y4Po+sFnNlNxREEx8WGvLEe8iWrvp7lmgtJtLHqWexBkWHihop1VG6c7oPVNcEbgxHNQlUuwYXEkfnF1Lq4sktvfDav6DI8y0tNN2fA/5G2dEhirstj2FjKlxdwWUPir2OmsuIaG+4ChfW0iRFvk3lVxOvoKGd1c6uO3zs6LoKY6Ikuls08Jb/7pNPtyUW+lHsn20mXrIk0AILlL/NuoFmz5pmynfIU7SLp+gfTe/lROd80+sVXnR0QRuv4G4wqi6mavHP0/yKLRefXDiejLxiN1TIpu3DLsV7bTnCcehMChlHXuLDFlZupjWhdgd2VuUVV1Mc3Y/z01/pkRxvS97KsJIM8k2eokCjaf0isxcfJjQdKmf2zFRmnXReq4rOz9aetkTRJPly1/0cCkLjxaUBCFg1yQb+B5Y5s154f7TWGR3P9veLGnTqykTPHt8pHS4qzUd6aG+/SlEljFYDVdthDyPzCZ65f/VniFNQMBF8LORdGqijEi0cntA/hTcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(26005)(186003)(316002)(66556008)(66476007)(6486002)(66946007)(4326008)(2906002)(6862004)(8676002)(6512007)(7416002)(9686003)(8936002)(38100700002)(53546011)(44144004)(508600001)(6636002)(54906003)(6666004)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6fFZsIH3hnaeSVsjJ+CZm1UwjTvLxTAqRl6hedw5QECLy+g9dPl9CuKedXq?=
 =?us-ascii?Q?I8dSI8ogxYJ4UedO4P8cPqo+LVhpcSvV8WIN4+mHNKxNGooyuCN/+/Ali5Kd?=
 =?us-ascii?Q?gFnv0CJ5mQFYBuBzwBE1o53/xIgaLU2w6UzrnF8grpVsr1cRLssJLMRp4C8c?=
 =?us-ascii?Q?njBosP57mBBBsidtsh2rGHsIpSVxXP9u8+whQwGG4UY6J3Us1dNQGveQLydr?=
 =?us-ascii?Q?N67yfwU8gt+aa03SiCOTFJT/NmQOWtKiWEbCKCsyN7+iSq09UGxnb59f1Haw?=
 =?us-ascii?Q?nyOYXuTfuvvCA1SYOoiAvtoaGy3nYlTZCQpqdlRk3hQwcXbYt7Mx+UAM+eba?=
 =?us-ascii?Q?S3aCmdKjgGwU4eck/MbZ3Z+/gY/f36QfcbHbu8ZSW/nghoS0HV/EmlWlMz/o?=
 =?us-ascii?Q?sNQ6yLjkmSsDna2WdeRjbC3inzzW+Hul7IVoMDJxQHVJ+62FudwCEevEZmcp?=
 =?us-ascii?Q?Th2/esSRNSa75Yif4GvUYvDUxoUdzkEGloyI8ezlcQBkfZ45bOzzC6IFSe5K?=
 =?us-ascii?Q?CnjBnhpOMmPnZmihSsJg3RDuJwbjAgEEQBnSzCCj2gNGvL+ag9jHydG44whX?=
 =?us-ascii?Q?Nfiud8AeM2/DrhhsYxqzx3HIsAKc7nyj7GkN4Q9lOCt9ZWzewgydOOGkotWP?=
 =?us-ascii?Q?422wCi5HVZrnaKqqBm3Gx2WlBt2CeUz6zu9hNK0AT0UNy3FfK3ijt4xj2rtj?=
 =?us-ascii?Q?/Kunda9sXe3ZVrJoRYGQ4qtOnHuDt8PiGuSBzckBD9SW9O5RATztEs/zTzxv?=
 =?us-ascii?Q?CTWjR/HE+k5t7pLXzGulFofh/hUALREvY92Ver41qOE73Y7D9vcro8igSdE0?=
 =?us-ascii?Q?/v/ZlUvsZ6ZKy+q7VgD9yk2pbTb05o9WijYVHhJ/S4+x05uCxmwV8UpLKm0V?=
 =?us-ascii?Q?4+QJAnGx5cTZAGMm6D/iNZDvIa3AMVFdUs6baVIWTC+xdOPeM6H83Rt92rsT?=
 =?us-ascii?Q?4rRw3Cg9eAhf8ZfeR/WQVwr5JBskrSMKrxakFnmWQ9Psk76cipv1+2vQvJDi?=
 =?us-ascii?Q?6QU0Kw8l780rnqExUtMC8VyTuI2BxQVYNxI+awheOF2UsGTeds+LmIUgvGKx?=
 =?us-ascii?Q?OaIwH8yIP8fXbSprf8ZT1WbHkpwkU4asw9Mg+0V4orMUh/L7CTF9tqN+Obme?=
 =?us-ascii?Q?b5Q4Nzv6UrSaj/pb45VwtkyaY1qAHibTu97tQj9DpiIkw/KdTQUZvig2oOSp?=
 =?us-ascii?Q?Fn1HwNZnCce0zKeGjgyegpAVZU+qDHIZL32XNPK81+agsBVJFN3Q49Dz9g3c?=
 =?us-ascii?Q?aXFi06/wXtZCMJRlj1x7D6CuBFUTSv40DZL+AC5oaS1UmmuRgcJGPmVXJ9Km?=
 =?us-ascii?Q?b75+9laHA0uqEe88oq7T7Xzvy+TxI9i4nUmOkpvWOGDPC/FqCv5ITKSK3Hv5?=
 =?us-ascii?Q?FCjun0c5ckqPjdCF90pG1/awDawBGiRNIQqdByC6ZloTtIZeVqAYL9rU4eJJ?=
 =?us-ascii?Q?rYvSKKrZTapZQWx96Jqrd0j3ad72Z6zX3TIIQqMEjkca87ILpQl1XA6e2rl1?=
 =?us-ascii?Q?qsYiMs0H3VNLoTZAc69qh3RLTiluybr+8uu39NU5d92Xdd07/Hkje1Evnsp3?=
 =?us-ascii?Q?4ehRM8QOe21Ex/arx2FrxmH2T5Mj0VHlHAhiD0KcoiYY2QDd6aiaB8q8B5iS?=
 =?us-ascii?Q?jc+Lmslcb7oXsoSNBeCO0XQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4a4e9b-8375-416d-c21a-08d9f1b35121
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 01:17:51.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkyKr/hikiEpFlK+d83fDj7F3PHsgAQusAk84J5lu8RPit/so5ruSBKEO54uqcEXmnUdDM3aP7BDFkmGvvGZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4776
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
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain
Content-Disposition: inline

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Wed, Feb 16, 2022 at 09:31:03AM +0100, David Hildenbrand wrote:
>> On 16.02.22 03:36, Alistair Popple wrote:
>> > On Wednesday, 16 February 2022 1:03:57 PM AEDT Jason Gunthorpe wrote:
>> >> On Wed, Feb 16, 2022 at 12:23:44PM +1100, Alistair Popple wrote:
>> >>
>> >>> Device private and device coherent pages are not marked with pte_devmap and they
>> >>> are backed by a struct page. The only way of inserting them is via migrate_vma.
>> >>> The refcount is decremented in zap_pte_range() on munmap() with special handling
>> >>> for device private pages. Looking at it again though I wonder if there is any
>> >>> special treatment required in zap_pte_range() for device coherent pages given
>> >>> they count as present pages.
>> >>
>> >> This is what I guessed, but we shouldn't be able to just drop
>> >> pte_devmap on these pages without any other work?? Granted it does
>> >> very little already..
>> >
>> > Yes, I agree we need to check this more closely. For device private pages
>> > not having pte_devmap is fine, because they are non-present swap entries so
>> > they always get special handling in the swap entry paths but the same isn't
>> > true for coherent device pages.
>>
>> I'm curious, how does the refcount of a PageAnon() DEVICE_COHERENT page
>> look like when mapped? I'd assume it's also (currently) still offset by
>> one, meaning, if it's mapped into a single page table it's always at
>> least 2.
>
> Christoph fixed this offset by one and updated the DEVICE_COHERENT
> patchset, I hope we will see that version merged.
>
>> >> I thought at least gup_fast needed to be touched or did this get
>> >> handled by scanning the page list after the fact?
>> >
>> > Right, for gup I think the only special handling required is to prevent
>> > pinning. I had assumed that check_and_migrate_movable_pages() would still get
>> > called for gup_fast but unless I've missed something I don't think it does.
>> > That means gup_fast could still pin movable and coherent pages. Technically
>> > that is ok for coherent pages, but it's undesirable.
>>
>> We really should have the same pinning rules for GUP vs. GUP-fast.
>> is_pinnable_page() should be the right place for such checks (similarly
>> as indicated in my reply to the migration series).
>
> Yes, I think this is a bug too.

Agreed, I will add a fix for it to my series as I was surprised the rules for
PUP-fast were different. I can see how this happened though -
check_and_migrate_cma_pages() (the precursor to
check_and_migrate_movable_pages()) was added before PUP-fast and FOLL_LONGTERM
so I guess we just never added this check there.

- Alistair

> The other place that needs careful audit is all the callers using
> vm_normal_page() - they must all be able to accept a ZONE_DEVICE page
> if we don't set pte_devmap.
>
> Jason

--=-=-=--
