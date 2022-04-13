Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481F500252
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031E10F195;
	Wed, 13 Apr 2022 23:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20510F194;
 Wed, 13 Apr 2022 23:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCJm5qY/lJ1tf5H41zbsrwF+HqI5oWrTRtYYEvnKUNW9j98fec37V4Nt8b4xCuRB7w06tfnYTIOfqVIA75hrNH9uixoTssvkvhLpoMdU7Vme66zpHXH0wpcMph91QB3ngDpwdi9NDcHa92uOusV/CQsmXBUDuHe0cYeYnEDLF77lUMp5hfc9xu/PHqCS8FD1tybKU3G0ygMsSA7rlD4/KoGwj8PjhQ/WoaPWBaqa+qMUQSA5NYbjkvRT1ckWyewWnT8HS+oTZZyYXBXDS7Gr6HrujVN3+fYev+veB3/Lm9GrhKYwsBKTBq2YCmkkr/PI4LXzlXl9kbSfHM3hEYKGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8avWc8Fer/c9DIewAgxJjdmzGv7qIdQIOoZgEiYfutU=;
 b=CXlQZ152oYq+LePHCaa/zSCb1m2cbOInjrTCNeM+WPbmWG2P3bmqHJbUwU4OWuS/XDQe8pVxx54WsliS6CGtwLh/XUKte3cFOHDIau0fC3izGyzXlcvPfvt7aU7holPt/P4Px9C0zmnrnzYA4KXMTh3eE1wGsXtfTCRhYfTpE0p/OdA9Cv+AHmLLVSbg9M6b+4Vyfesp7jfmYGsEvaZg1eJMhh93dm64yLc+PQ9liFVF3HUub+cElypBRtZ9eMALzEqOAxixJ7NXSsVX7koohCpVcxYjIIaXAtVtb0rcnJn79eWTuKZ6PD4P/J45vdSnkBb+fPyNDEyObUF+P246UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8avWc8Fer/c9DIewAgxJjdmzGv7qIdQIOoZgEiYfutU=;
 b=Q0rTuU9I5U4Op2aCTBITPWJTr1SEw2UGzPOn4HYnjmelCx5zUwaSinPpmeW+jbSDPgEc8PO89pV4OCo74B3jTnAx3MBNQPI7+ZA1/fHAf/69T9EFj00TBEI3lH2SITGsLGWpvTqcbfvwePVYogbndTx8/n/wNIycbbiZq2CSXFpQj3WoaUpHqN9GD24POA0l3eLHU1waMO87mJyaiPXYueZD8m4jtNL3y9XbJGJjR3icj1g10nRu19wMP0w3CR+6gyhgtOM6s2ySR2RZxHirHySanzBAm37q6Qw2ycG47OWDGcMRSqTxZZJN3aNRcHU2ZbJcfdteAe4gVBjp1RwcSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 23:12:17 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 23:12:17 +0000
Date: Wed, 13 Apr 2022 20:12:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220413231215.GY2120790@nvidia.com>
References: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de>
 <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de>
 <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de>
 <20220413173727.GU2120790@nvidia.com>
 <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
 <20220413200418.GX2120790@nvidia.com>
 <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
X-ClientProxiedBy: MN2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::32) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 820daf41-7a2e-4c92-dfdd-08da1da30d58
X-MS-TrafficTypeDiagnostic: MW4PR12MB5643:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB5643F45EC8DD0517218AC3DDC2EC9@MW4PR12MB5643.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fnYRWLKloBrinGnrRtVwa8i1Jjr+qxp+VhhPFmzY1UUdftTgqu10ALv4cin5UeaN3YPY88Bb3iXc/YeRorv6z9pD1yjqD+rY+KwZbJPVgKRcjnDJgzadbXrlS1bX9y8z/qTXsi9g50rD/1P1dnwBr8n+rv9UUd6DRnhFjvn6oZFZdKY6BRJth4I3wwB7R3+l6DPSCqdLercDeivRBNZ5+aAR5dF2l4nSn1pLP31URwNNTkJGYv2t4jG0FYznJTjZf2zfHHz53sjUj0MNupYgTVrCcXEEvLxi7E0UbiSK9qfuqUHTOV+t+SWSvwSHCXJP+VQjY1+IxoS2KT7J+h5HPgDDfPiCQGtzkpgt8mXT59ZKMOhJAdl8+BKEnEfbEshvleeMu2GFI9/kFduLYI8hYWdaorUWp8nsEuaGMGH7CFJAcNCj+hlI4jP95nMJkotLi7KKIfo0RKw9kgihg2xIrjPQ6UIWabJAufULjLwh5ivaj4xxnkggAsEGjxpXI4KZa0yVOPVDER7r4qikIs5+y3hEyFYE5djbO4g3oQFlqyHUhOGKZ9iqUy7Zr24EFhwYUx4X+UrW5Kt4wcGeFY/8CPfjkWSkScZgnQqay/mB7zZLpwrRYLeUjHblNRqiei0V5BT1HtVJqtXi9bnGDIkmaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(8676002)(66946007)(66556008)(66476007)(53546011)(5660300002)(86362001)(4326008)(8936002)(2616005)(1076003)(508600001)(38100700002)(83380400001)(186003)(7406005)(26005)(316002)(7416002)(6486002)(6506007)(6512007)(2906002)(33656002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yOlbiW1Av4RDGJEdJUdG1g0Mq+UgNPmfusKCsO8flGmuYO3KCkgErAMsRfEi?=
 =?us-ascii?Q?AE5AjE5fr1v8Aksfz4CliPi0S0aGuF7EXsU8JWHLsZOVHzYdvLcBs5oR5T74?=
 =?us-ascii?Q?bfIMBeXF67jma/htHY2hcksjiKw+6VwOeAcDVUxC6sHkgw+iKbZVorxW8F42?=
 =?us-ascii?Q?f6mRrPks8kP1jsmfN5pRM9+AvRg3rocC7BDcIEF8N1OWOmYghU21DyiYtSeO?=
 =?us-ascii?Q?yR8rli7FODs5l4/kpOCIUXWndJCFOnNZwh7/ZhM8HWNWxtuqrHYMOq4M8JIN?=
 =?us-ascii?Q?O0DHq1gw8xXw8cRE2OFsEROhnh4a1brrXPcWqdQXfGqcBL7uXE6IJYrMPS7z?=
 =?us-ascii?Q?u67Ta0LF6yT56vCKbMx0o0VbHjn/mEQeHjpYNvNPiswdRGbRV3H5UySjBE87?=
 =?us-ascii?Q?qcztaXPMKxbt0Wmdd1S9AYfmgB/hh2qQ+z1YnmQ8bTXDbdMhe7xOIttLzlFl?=
 =?us-ascii?Q?iepIdlWbiFE6+eSK2GkCNL1wlrcZNEp0jPK4kpPvBLugPHnxYnOy06YcclsI?=
 =?us-ascii?Q?QkBZtiJdtxX9Fzb8ZWI5+rvI+FbcteSGp0zkgsXR4R0FvkF05baF5WdZ9t6m?=
 =?us-ascii?Q?MabWQ4mU4m50joGQmCwvJerwmtKvxsZxpk63adL1Hbsib4RzFU6aj2q9HLwX?=
 =?us-ascii?Q?KOf7HcyNtEqf1+0fsGjR6QE2qo6ZgzYuZbM9DyjHxmYhwlPnVleKhJ68FV+V?=
 =?us-ascii?Q?zM1mFWxZXWMrfjU2eX8TVDS2WGAg9pYi7zR0Yv+9ava4h5m2DeTvxLTVLH4t?=
 =?us-ascii?Q?SdrCZiDtOBKZzWXSqOTESl1rsrNu1g8VNTKtEKnT2uU4fCWzzK+5FgS+xfVa?=
 =?us-ascii?Q?PqGSAiXOvUPCojox8l/IztDWWLxiaiijZjlAMA935mBvPMrenExuIfCYDR/z?=
 =?us-ascii?Q?AbwVfyU/jf+tQ7h0zmZ/vy6QMzkLBvSIX0g3POUdFl6X1eomA62raDH1XNvH?=
 =?us-ascii?Q?LkzY0rw9gnTWAh4k4y94TJOLSdRROnOD1f2jRlabXvR/S8BkA3IjiNYYqsWY?=
 =?us-ascii?Q?m/25Rlxvuoaj/5IX5ZmqAI0ETwdJqLIs/WF89Tu3KxY0XBBP7KJ8vUNEzYAN?=
 =?us-ascii?Q?ChmcVe/pJjh7Frl1gIm0AXkU0k3Hx5dHMfWZeLISVwflLQKtx/RXNS0RjUgY?=
 =?us-ascii?Q?4VmaYm8SM8g0Xgembua9q9A8UEXfJdis+hsnHkWBhNEpSWdJHPYTSUYlF+Ig?=
 =?us-ascii?Q?wzfOKXlM/0s+ChsFr8y8K/3nVtloh2r+w8R5+ZHy8UW6QA6Kf4XBXwo6EHWH?=
 =?us-ascii?Q?7FuPCg4KrRd+T1vb8Swh6f5RqQzkqefIkxNZKlW3BIFMM2/FI7uVgDKt/WhD?=
 =?us-ascii?Q?UB/h4pUSQbD/5/5qhWRyx4ZxJwRIap3d3oOX7dyjnAh1LHunLcWLxBbRhBZI?=
 =?us-ascii?Q?AuC4vGwvpvfuOz5v8HA74A6jlw+aZFrmZrIogFSDQ/beqoWdgGEmbF7bjtvf?=
 =?us-ascii?Q?2QbJDZy83O8N9OXV06jkaXzF9aROwy5/8R1CVqSthQl9Lv4IPKPwL4m4uTu9?=
 =?us-ascii?Q?NwB5l5Qk+hNz3DfWuPTjam/N6QXwPQyIRWEQmVJmOpHC0LXDXo7tnLJsb9ws?=
 =?us-ascii?Q?SLSU6ikkR3VAExCFt4/2lYiGKZfSnO1hkw5BXD2m9A6iwn5LfDg3rFswWnM+?=
 =?us-ascii?Q?zA3VcWPzqI+vXDvZExmPLm36D6YRD/dFXGab1hKrQRGclOfaqzOmnN+8wRjl?=
 =?us-ascii?Q?CC3rCKaFVyNN4eiqQH66doL1aEhgA0rFfK9gVLeUJbCBuNID+sUzuDn0qATC?=
 =?us-ascii?Q?TzLzhU46xw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820daf41-7a2e-4c92-dfdd-08da1da30d58
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 23:12:16.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gc9TWdqlymT1c6KaNi+s9jEkIYeBYPhfB9wxPz+n69J2Fo0Laea7suIHnmxtrkvy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Eric Farman <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 09:08:40PM +0000, Wang, Zhi A wrote:
> On 4/13/22 8:04 PM, Jason Gunthorpe wrote:
> > On Wed, Apr 13, 2022 at 07:17:52PM +0000, Wang, Zhi A wrote:
> >> On 4/13/22 5:37 PM, Jason Gunthorpe wrote:
> >>> On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
> >>>> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
> >>>>> Yeah, I was thinking about that too, but on the other hand I think it
> >>>>> is completely wrong that gvt requires kvm at all. A vfio_device is not
> >>>>> supposed to be tightly linked to KVM - the only exception possibly
> >>>>> being s390..
> >>>>
> >>>> So i915/gvt uses it for:
> >>>>
> >>>>  - poking into the KVM GFN translations
> >>>>  - using the KVM page track notifier
> >>>>
> >>>> No idea how these could be solved in a more generic way.
> >>>
> >>> TBH I'm not sure how any of this works fully correctly..
> >>>
> >>> I see this code getting something it calls a GFN and then passing
> >>> them to vfio - which makes no sense. Either a value is a GFN - the
> >>> physical memory address of the VM, or it is an IOVA. VFIO only takes
> >>> in IOVA and kvm only takes in GFN. So these are probably IOVAs really..
> >>>
> >> Can you let me know the place? So that I can take a look.
> > 
> > Well, for instance:
> > 
> > static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
> > 		unsigned long size, struct page **page)
> > 
> > There is no way that is a GFN, it is an IOVA.
> > 
> I see. The name is vague. There is an promised 1:1 mapping between guest GFN
> and host IOVA when a PCI device is passed to a VM, I guess mdev is just
> leveraging it as they are sharing the same code path in QEMU.

That has never been true. It happens to be the case in some common scenarios.

> > So if the page table in the guest has IOVA addreses then why can you
> > use them as GFNs?
> 
> That's another problem. We don't support a guess enabling the guest IOMMU
> (aka virtual IOMMU). The guest/virtual IOMMU is implemented in QEMU, so
> does the translation between guest IOVA and GFN. For a mdev model
> implemented in the kernel, there isn't any mechanism so far to reach there.

And this is the uncommon scenario, there is no way for the mdev driver
to know if viommu is turned on, and AFAIK, no way to block it from VFIO.

> People were discussing it before. But none agreement was achieved. Is it
> possible to implement it in the kernel? Would like to discuss more about it
> if there is any good idea.

I don't know of anything, VFIO and kvm are not intended to be tightly
linked like this, they don't have the same view of the world.

Jason
