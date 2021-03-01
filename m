Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DD3294FE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 23:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBFD89FDE;
	Mon,  1 Mar 2021 22:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E1689FDE;
 Mon,  1 Mar 2021 22:55:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603d70f90004>; Mon, 01 Mar 2021 14:55:53 -0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 22:55:52 +0000
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 22:55:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 22:55:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9qWKUqrnjnTYqf51DVnGXnDC+NCg6UTWGjhFNStUgs6f+JLyB/2aLGO7oBc0TrJ0bNxyAiqsgY5AErYMOQwbZ2JvDCS3a/Kgqn+TIWGhcFGUXjZoOXb4fTDVopF0pV3iJ4NGuJo41KK7ZgCi8rDyp6DNxWCOIMeTy0GDmA9u4qlDd2DSXsD4Ii39RKppIde4Z9S83ErzPIdYndVQNsD1nbk1oeFp1TYm2ZVKYTIXIwlukh/pJAkGOX2yFpZbgfoBT6Zoc+gVWGHJH1tysexccR9FbsjHyiBZQwiRWX9w8/KVkrxFKl6TUBYBhqINdTHR1Cj0ybLh0p8rNvI8ZW//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcRAqZsNAc5tyn8qB8O86feX/k1gTclG2+wu/Pv3QX0=;
 b=WgQTyQVfC239V7s48Yqcp76BTlxwbwm+M9AMuw3eNzfH3y8/DzTSSeFgv2s2RiqQha6d9z6oC/548yVVHjl9dG4MEXcUP1n3yEbaRlkAZS0fdkBH9hHaoVjUNzu46Odsuy3D9IVMcR2uHZSq2cC38a1ltV06ldj8yuxoU9Ftn4IzYW0t4Rf1mkapRbAN22qVYjUgL5mpXIzJybge2NaVvpor4zuApXdObdlqQm/HuW+Uj/fORwvR8eWyKjZ6k7a1TK7W8ITMf+kL7Cg5Lfe0rAbVJwDKjbziNZIzBFOYp54x1OWPmDRMj3WAdxataACceMuwoI9B60k5xV6Uz1vrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 1 Mar
 2021 22:55:48 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::6412:fe3d:f2:87db%8]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 22:55:48 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: RE: [PATCH v3 5/8] mm: Device exclusive memory access
Thread-Topic: [PATCH v3 5/8] mm: Device exclusive memory access
Thread-Index: AQHXDA+zUEPg2OP9KEOGgyZB5NMUAapvwr6Q
Date: Mon, 1 Mar 2021 22:55:48 +0000
Message-ID: <MN2PR12MB43449C6419A839E4F5605B6EC29A9@MN2PR12MB4344.namprd12.prod.outlook.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-6-apopple@nvidia.com>
In-Reply-To: <20210226071832.31547-6-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=rcampbell@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2021-03-01T22:55:50.8180700Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=a2a37e20-6c80-4404-9a3b-3c1c3dd394b8;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [2601:646:8e80:c510:10c8:3f69:ba2e:72f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f69f8736-38b6-4757-9a39-08d8dd0527a2
x-ms-traffictypediagnostic: MN2PR12MB4160:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4160C5C38C6A63D5DCE82914C29A9@MN2PR12MB4160.namprd12.prod.outlook.com>
x-header: ProcessedBy-CMR-outbound
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O2sGsCLzGcijgxrr1EeHuyeyLDVCaZBAChg+Z9uQ8uKOy0HbaqAs88VpsCGQZh8WHqBbvRn30WSY+7ZcUduUAQbNN81C/WZMbpws1osX9UHk6QdBCtLWMvl2974igCh2SHA0j+LGF0a7ayKm0i/fZDBkb8EqWsws+Vlr9C7ir6dzFxpWsiQiJc66Iey3J2AXjp5p6SSLu3hv5AeRqvdnswmatTXpjjwVGgZ312oJi9p4O7YRHn0xgCJfM0LJiMSoCORoWbnFcIdJ5OkXmhAzA/68xjravKoNZ7fIaFItM+gde1b95Ui5oO6yQ3RBrUkV3T0tX1vvTZM/dHNZ4F1DC8tEXyIdElQrnuERjM/oLclO6/jLgm6jVTU6teGi4GfcO+XhRzODuxOrSfSiN106t6x2dqahw91xQdzJEuzf/Z8bhRopOcuy+Jt4cOmwwwcSEhumduNWNCU6v6o5DYj3G7xvui2aZACq5cLd2psrHLqj1kDIZ55GgtT5eso3OgOR+w4iabMU4sN5RN/OCgt6ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4344.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(2906002)(9686003)(53546011)(66946007)(71200400001)(54906003)(66476007)(186003)(6506007)(478600001)(110136005)(316002)(64756008)(5660300002)(33656002)(55016002)(66556008)(8676002)(83380400001)(7416002)(7696005)(8936002)(52536014)(66446008)(76116006)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dUrgjAPaX0bcyS0tElQXZNvxmhZqRNVXLGg8cxHPLd/SVtEXUVyPiiuy2wwt?=
 =?us-ascii?Q?szSlOaVAu7I3vlA/bLE1ipGJCBEHJ/dNFjYDOQuqTNqiHbD0xGd7xjYBV6lB?=
 =?us-ascii?Q?ipqtW3mXKyMDdeKBjLRbLWcw+S+u3LM4PAVK+BLS0xus53/9a9YJX6emixcE?=
 =?us-ascii?Q?0+99EbBhJ/MDiWYSkEDO/Dl547kbMyJZnnuLqsg7kl3dCh54/RHfovjinTgh?=
 =?us-ascii?Q?gDY58cefGw2uuxjcim8lJFzk43IZ5NroCTLVV8ykJl2w0VopPOVGLJtxr6vm?=
 =?us-ascii?Q?JMOJV4lUw8Gm921Lz78XpW74JCRiiExHCRBrTSD1AcYV7EBoZ93pvsdZsHuL?=
 =?us-ascii?Q?3QiY/0C8JjPZh6Kzp+UT81pHSdIOMmjJEpRNNPqMIWDs2/GBbkJO0h6ZYusf?=
 =?us-ascii?Q?bUr+KuTreLYhAv14cWj+TX9ZrpgijI9hapGtC9Q307VPrQNi9H0T719a0Hko?=
 =?us-ascii?Q?LBm5Eu7kT+gzYF2WXiPltdUWla/10NKHmFHiXp+OVaFxzhg1C2SXqoHiIZkI?=
 =?us-ascii?Q?TmiAoYudxpXeJFCSvkXqQR/gud3/F3+w093jbV59uH11tiYhaIc3dGWuS6My?=
 =?us-ascii?Q?ofefrCWPPmUwRSeXL06PdV09evN+6/S4JXcwPhFH1Bvcr2Ck1iFz0P0FZBo+?=
 =?us-ascii?Q?Fy8FECLJZyjldrQaWf2JvBeoOLqqiHNRgVtor23B9OfSEdoY04SJS1G5bWr2?=
 =?us-ascii?Q?4EpfeiMPi85N2XI1/PS80M5God6jLaHs30uGlhY6GH7doCWesej7kKLKvuaY?=
 =?us-ascii?Q?6+038fQ4RDND9Fhqe4vdSbyUsQ/Ym3cX9HZZyiC1GZ9V85TDYQQ5tgQmM37T?=
 =?us-ascii?Q?tQtm8TWT6xlFtJnkQrQ6Otu6vaniTMrzkDl3JnpBdoFOL5z9tBXMqMwZhNyM?=
 =?us-ascii?Q?kUE6nYYkF2StNyU/TSsz1eLeoUb7ZhlSBYmk6ZODsjLv5kxrfcVarvv53Rrw?=
 =?us-ascii?Q?rTTh9QPLSssJ+8Q0OVhKOHRJhB6183MRjy+U0uq9pgfD4N1CF/XUD5oIOmH+?=
 =?us-ascii?Q?hjZGX56d0Ib2ooeMCYMnuSqV+vEq+GEJa67Zo12VvST8q2ElAcgVnqh9g0jz?=
 =?us-ascii?Q?R9nmasgIP5VwXvvAZ/sm2XhFIvhhuFd3+kt/0hHFvCES3ZZI67dId/hwZqI9?=
 =?us-ascii?Q?j+V4Bqtwkkkh04vMZvqHfv1PQcGXJUBTUWlT29CvLBAGf8kvlNe4jhOdjbM+?=
 =?us-ascii?Q?hJ6U2v3oIhUXeneXkUXfd6eBYGumOdMffp2RJFSRM4gAOR2eADIjaE7Fd4zD?=
 =?us-ascii?Q?/W99+uv5Ul/KAP3OTgT9pZcFylyAmrwYHs4663y17S/KzYIdVw3TQXjU5QOB?=
 =?us-ascii?Q?qJ5N0b/li+/IYn0BmJtmgLF6tWKGnkvy7pE3wO+4WQD1sQErIDSR5zDhs/GG?=
 =?us-ascii?Q?Z0QrltXIpBqNb2665nNLIVDh6R/I?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4344.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69f8736-38b6-4757-9a39-08d8dd0527a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 22:55:48.1223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DD7Z3nJYJp9x5nPA9HvtL/Y6hiXYXgbS76gc623jA1kzhMIcivgHZwWIbKrFqAdqVPWhv28g3Bl4Ui5+O93UHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614639353; bh=UcRAqZsNAc5tyn8qB8O86feX/k1gTclG2+wu/Pv3QX0=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:msip_labels:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:x-header:
 x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
 Content-Type:Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=aWShgIOPd2W6kIuuKXzDpWqwYIaz/i7KU9ttu8Njs/vR/k4kQew59ipswv+3eBPjC
 ravXV11N+/GUZOBvT8ekQauIHnIhty0R+aHA0i/xTvpYCEdC+uKJ9YGIQhXfdAz/jL
 UmDg5tW7TtHBJg47dYYAgO1tBRb8FbinJ4mHAWkDitJN1UL1SBXnHAmsHIj3OgGreR
 k4xMUi6wm+0IMgeDW/4VOqLoLFryv8CfVE7MMnWufgQhG+iP0H1o2I88yADi/KFJ3u
 T75giv2/pOLSCdE8JC/fHXjnb89rcfS6ZH9VAUt1ylswlhLaYLg2HturYxuNmueI7D
 W9P/Nom2V5edA==
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, John
 Hubbard <jhubbard@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Alistair Popple <apopple@nvidia.com>
> Sent: Thursday, February 25, 2021 11:18 PM
> To: linux-mm@kvack.org; nouveau@lists.freedesktop.org;
> bskeggs@redhat.com; akpm@linux-foundation.org
> Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; dri-
> devel@lists.freedesktop.org; John Hubbard <jhubbard@nvidia.com>; Ralph
> Campbell <rcampbell@nvidia.com>; jglisse@redhat.com; Jason Gunthorpe
> <jgg@nvidia.com>; hch@infradead.org; daniel@ffwll.ch; Alistair Popple
> <apopple@nvidia.com>
> Subject: [PATCH v3 5/8] mm: Device exclusive memory access
> 
> Some devices require exclusive write access to shared virtual memory (SVM)
> ranges to perform atomic operations on that memory. This requires CPU page
> tables to be updated to deny access whilst atomic operations are occurring.
> 
> In order to do this introduce a new swap entry type (SWP_DEVICE_EXCLUSIVE).
> When a SVM range needs to be marked for exclusive access by a device all page
> table mappings for the particular range are replaced with device exclusive swap
> entries. This causes any CPU access to the page to result in a fault.
> 
> Faults are resovled by replacing the faulting entry with the original mapping. This
> results in MMU notifiers being called which a driver uses to update access
> permissions such as revoking atomic access. After notifiers have been called the
> device will no longer have exclusive access to the region.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  Documentation/vm/hmm.rst |  15 ++++
>  include/linux/rmap.h     |   3 +
>  include/linux/swap.h     |   4 +-
>  include/linux/swapops.h  |  44 ++++++++++-
>  mm/hmm.c                 |   5 ++
>  mm/memory.c              | 108 +++++++++++++++++++++++++-
>  mm/mprotect.c            |   8 ++
>  mm/page_vma_mapped.c     |   9 ++-
>  mm/rmap.c                | 163 +++++++++++++++++++++++++++++++++++++++
>  9 files changed, 352 insertions(+), 7 deletions(-)
...
> +int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> +				unsigned long end, struct page **pages) {
> +	long npages = (end - start) >> PAGE_SHIFT;
> +	long i;

Nit: you should use unsigned long for 'i' and 'npages' to match start/end.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
