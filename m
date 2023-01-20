Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6095674A9F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCCB10EA14;
	Fri, 20 Jan 2023 04:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317FF10EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189023; x=1705725023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5bmhXa7+z3QxX0ClWyNv5x0J1hudZwvotAlpP4nKN4M=;
 b=NbKCxUWWw7sOXGpjf2jX0uj7H1HZk39y4URr6ZrcHBJzyGyBcg2ZUWML
 IEJpn3Q79qbAeWuYkfSosX0pjgxbCM+sdAz0Yfrg9xnCXijRJi2OMoNKe
 hd8Kna7+YMK4Be1B860KDTj3MDlloLJTY7XfWyBte5L9kCbjPhLdxXTF7
 29B1G9ELL4QP+3EbofrrYzFZuoQDeCpyh/vM2AzXRy3kR7Rx7REz/nwBO
 KJUQNP5m/0jFvdpyfgOhUKQ0v5h0k7G/VaJ7Cugf8FrRHlLmK2dKv8HkE
 6RR/cFy2Ffs0KXhK+cVX7HnBQBVNa+q8+qdw8Bo+ZEihQAdXy55O5sH5c w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352757938"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="352757938"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662415532"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="662415532"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 20:30:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 20:30:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 20:30:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 20:30:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 20:30:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOcM6MBjAiayrPEh9J2M9YkOJhPXWoRTP3WPIvW3Ks//Vhc0+BmPKO1NVhqz8BGTujyEWbe/UKVENC0ygWs8iX8kchjAc0Sb4c8A41cH/uiar5ZPcs85KBA7DeZAvUoTu+dfVFBHJhomXh4fQOyKgcNAZeolsqW/uX/2FHTt2TbErB8+LibLa0KnivKiNNTR8f4gtTaJwlDFTj0Lfdu3rfnc7ZMBUNsIOOH1xV31hELl7WwmDfprX9/+8ucG+AHgI74AZIzcAHTvNAUI0sgIBVVfJ7OrjN6qb9paAa+lRb0VRZiCZYS4P2OQDV0w3sQkqK2INoB9e2HhjXVP5sFspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La+o6cRwFebYAA49yQp1j8D3kWklibf6kAdqd77wUtw=;
 b=GaccHhoh7vW2eeuFlpz02i1JROrNq6xM3koR6/PJ3x8UmXGjB56Qn1bPDzqMN4rJsIHLNqKX2UXhS1ESjPjs6bp5NUaxa9lYgsbGz+5FAjeVoz5pAtjPwy2hbu3WWfFN+j0apomW3peXuliR2dJlsviI2D1A0H2SGJP4C9BD3lZj624w+JIThsSkwmWIaBiiyk3Cxk/n9+fIeTij5xgzOvDquzK8zIlftAWvZZpB/aWsEJi326o1so1nQD+/BrGFkjWncoxwjL0/yEVHcU2hyr7j7LbjMB3v0NV9usNRb2DwbL0fw8c7KX6GB9b5EFfEtGzFb1cr/0U92umswnx/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5347.namprd11.prod.outlook.com (2603:10b6:610:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 04:30:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Fri, 20 Jan 2023
 04:30:17 +0000
Date: Fri, 20 Jan 2023 04:30:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <Y8oYyhhsuCrN1VtK@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
 <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
 <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
 <7315d532-9527-8766-908a-a72fbb9e1afc@redhat.com>
 <Y8m6jIzJ+l3/bpDX@DUT025-TGLU.fm.intel.com>
 <5bff44a4-607f-1bd6-1f76-7961e0a274f2@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bff44a4-607f-1bd6-1f76-7961e0a274f2@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: c84c6792-8800-478c-537e-08dafa9f0835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+x+k/OWhqaphPZ8Xm4p8qIdMJW/yh2NSts1RKN6ZidC3phe3xjQINHDfz6Zhg8aLKnbwqma0FY1NQHk+q5cebc6P8KT4oOYo1UlnUknIG/Oaw+FDefOKUxSJrJDJrXi6EAw7kuOJZTxdladJqCrk/qqzG0Lo21kIUDGP7EaOUJXY/Y4qjzMBI2+8cyUt6dy4FO2pq7tciuJZb7jD1EEr7xAGYFEDLT7OxcEbSrcPmmdVLc30Vcy/yjsEbl6LacxaN8yKxqMn+wJlJigJC2C/icbYDxjn+8+0XVP8qshhoGZ8qLmG1O2dkcRa4hu9FxyTeb0RdXQJo5jrQagr2vI+ekBayMyD/4KatVqzwXsratkD/T1TNWIizr9DJbP1J22mCIkV13sJvpvxPMzdMbv+gnWHwQzu8nXWooHAATJzdbHFB7tEi2/47/q0F/FPiUpPbtHNCpIJXgiUqAmFRCRhJ50UhY9giYaPTtzx6y4QP9ordbe0rfaJe+H7bwRzDxrwojzQIuDBEVGsBVs+8rDV/ptTv4OR99cVsqORser9ujXHtKToowTdclEF1KBIGxrEn3MRqvQDAGayociTPciVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(966005)(6486002)(478600001)(26005)(41300700001)(66574015)(82960400001)(38100700002)(6512007)(66556008)(186003)(316002)(86362001)(66946007)(66476007)(53546011)(2906002)(6506007)(5660300002)(6666004)(4326008)(44832011)(30864003)(8936002)(6916009)(83380400001)(8676002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6JX3b+oNqV9vhBBcI18NVMh7Bg3cKxGzg1ONcSkSdVhQ+VV8ae4pbNtmCm?=
 =?iso-8859-1?Q?VfdRBLHkiCoKBdbBCNTuVvx/OfydbKdXNsau+jMR6Ipe7K7pKqc2qJaFBC?=
 =?iso-8859-1?Q?FRWP5piEa54Wg4P4E2kPeJwv4LJIyT4+9g+jN+KAo1A5jV0i6x8noP8xmL?=
 =?iso-8859-1?Q?Hc4PQL7SjH4CWTbaRr+41rhF9OIXgpZl+k82LoWXGOrIAD2RrlAS6s+3td?=
 =?iso-8859-1?Q?5KAH6HabP3118fMBlDBola12Rk0FcxaVnGyjTVfPTl6QztWizzcihk3O8e?=
 =?iso-8859-1?Q?q1vuYz9CSr0HY2AvKW8gcwT6L57Tv9rMMEW2m7m5FSPA4F4b2xhyYOmKu7?=
 =?iso-8859-1?Q?iUWkvhwHpB38Zr//plc/bu/vjGmMAW283BUton+VMhW8siug/jRZT3ar7Y?=
 =?iso-8859-1?Q?fDMFUIiCTEZhM4JXFD2b9RCkzjJBQFjwRwap4IJK8KTSRTIwtqEQTpgvp5?=
 =?iso-8859-1?Q?pu03koaU+EKOlDw9cSUCxogCYSwKEZrTbKQM1F478+DXjt5j7tEetvUEHi?=
 =?iso-8859-1?Q?ZPtInWq/gp7BF56V5cX4VCzG1OCmtGcfcWJpfXZaTOkhGw/RcCtBH/ve7r?=
 =?iso-8859-1?Q?VlSpDO+sLoHEyAMjdyeOniv2qeLfmrLSrn3H4tdVblVOO8vXSTJ21mXPFS?=
 =?iso-8859-1?Q?15C+BhptQA8P3ME8HMsDbeOGvlLAwQ3/jmN4NGMKqiBTNjNcPxgJUV+yoc?=
 =?iso-8859-1?Q?LKAp5TdnXL8MLOYxWPDA4U4389egzJxE/X5SofWp6rI+TlWyhsQHcgFVdf?=
 =?iso-8859-1?Q?kAG2fmFjo2V5SwK2GvJzkinuGtKDiV4FQ1I5X4m2pxGyi1FAaaFPdeAREf?=
 =?iso-8859-1?Q?DX+nuqgQj+CuvA4wvJ2guPMiPeBiB/JDbUL6rLBQCYeZGnIsbTlDJr5zr0?=
 =?iso-8859-1?Q?S/VdOzZ/GevpNBJ0t8gwiANqPSeMPUQb15kY+IgSWD0KAKCzqa/rUX9bXQ?=
 =?iso-8859-1?Q?kEUBNku3tH62wZbLXZ4RFytdeOwu9UZqz7Hqg9pLalYSWJ2XFO94WKquh5?=
 =?iso-8859-1?Q?CtellqvVzqdLBW8qeXPWCwRHHzKg2b8lhdhj5O5lHyY4pflpLMkfOVDTf5?=
 =?iso-8859-1?Q?sFOTIm9phXuxl/9UDl6Z+/YfPN1PIp9R1mpBbxCZ1ezueF/mndYYB66woZ?=
 =?iso-8859-1?Q?QB+4s6xcLtloIQtK9+6euqnlPI4IWLdMQKAriQ1NkdknT00XuwHR+opoe9?=
 =?iso-8859-1?Q?b7CoJhMi43bS1ulWURtYTbH7yprKVwmy+k2uCpcx165tZERp0VuLKQ9TKx?=
 =?iso-8859-1?Q?2uuSkQ5XmX6M/K/wIbkkz6UMmbJexTgKrJx8jwjsZztGpS7YeO9EgS03gK?=
 =?iso-8859-1?Q?+4nELNNeYDTL7ayKOx6OzBPnAZSLy7t8TAw2IMlhTLInNl8jg1nQj2Bw1c?=
 =?iso-8859-1?Q?qUhmQRjnkr4PUJTWdwM9JxyEKAvfmRASJ+WeVz8xxjbIidfiSmfw6KLXnH?=
 =?iso-8859-1?Q?nyAWu7pR3e5woYC+XXbvrXVQHR+tivUXfuIl9OPLEI2EasoCUa/b8SeRxM?=
 =?iso-8859-1?Q?l8It6/oo7F9qFH0z5PgXWnmfXfOnCTEmL9D1/TWJP3tWiVo1OuWCVJfKWd?=
 =?iso-8859-1?Q?+l4B6NOoR+XP5PvsaW7BWWKf+9QdLUZ6CmTWAaMBaDy1iJIcHnVgdssL8g?=
 =?iso-8859-1?Q?Ceko4gjfVLqhdkXlo7XkOTX9gkXllui7EUlW531Ska0vvvbjocE7udZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c84c6792-8800-478c-537e-08dafa9f0835
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 04:30:17.3146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5Vwg3eHIXTaT03QTPiCQtG0oQjsFux+fhxIvfnhY8x7vlh7u20OymKrXXdu1xrxkzJKNhgj1xhCkX6akxFaYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5347
X-OriginatorOrg: intel.com
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
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 11:25:51PM +0100, Danilo Krummrich wrote:
> On 1/19/23 22:47, Matthew Brost wrote:
> > On Thu, Jan 19, 2023 at 06:46:30PM +0100, Danilo Krummrich wrote:
> > > 
> > > 
> > > On 1/19/23 17:38, Matthew Brost wrote:
> > > > On Thu, Jan 19, 2023 at 04:36:43PM +0100, Danilo Krummrich wrote:
> > > > > On 1/19/23 05:58, Matthew Brost wrote:
> > > > > > On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote:
> > > > > > > On 1/18/23 21:37, Thomas Hellström (Intel) wrote:
> > > > > > > > 
> > > > > > > > On 1/18/23 07:12, Danilo Krummrich wrote:
> > > > > > > > > This commit provides the implementation for the new uapi motivated by the
> > > > > > > > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > > > > > > > 
> > > > > > > > > 1) Initialize a GPU virtual address (VA) space via the new
> > > > > > > > >        DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
> > > > > > > > >        space managed by the kernel and userspace, respectively.
> > > > > > > > > 
> > > > > > > > > 2) Allocate and free a VA space region as well as bind and unbind memory
> > > > > > > > >        to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> > > > > > > > >        UMDs can request the named operations to be processed either
> > > > > > > > >        synchronously or asynchronously. It supports DRM syncobjs
> > > > > > > > >        (incl. timelines) as synchronization mechanism. The management of the
> > > > > > > > >        GPU VA mappings is implemented with the DRM GPU VA manager.
> > > > > > > > > 
> > > > > > > > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
> > > > > > > > >        execution happens asynchronously. It supports DRM syncobj (incl.
> > > > > > > > >        timelines) as synchronization mechanism. DRM GEM object locking is
> > > > > > > > >        handled with drm_exec.
> > > > > > > > > 
> > > > > > > > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
> > > > > > > > > GPU scheduler for the asynchronous paths.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > > > > > ---
> > > > > > > > >      Documentation/gpu/driver-uapi.rst       |   3 +
> > > > > > > > >      drivers/gpu/drm/nouveau/Kbuild          |   2 +
> > > > > > > > >      drivers/gpu/drm/nouveau/Kconfig         |   2 +
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
> > > > > > > > >      drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
> > > > > > > > >      11 files changed, 1295 insertions(+), 4 deletions(-)
> > > > > > > > >      create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> > > > > > > > >      create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> > > > > > > > >      create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > > > > >      create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > > > > ...
> > > > > > > > > 
> > > > > > > > > +static struct dma_fence *
> > > > > > > > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > > > > > > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
> > > > > > > > > +    struct bind_job_op *op;
> > > > > > > > > +    int ret = 0;
> > > > > > > > > +
> > > > > > > > 
> > > > > > > > I was looking at how nouveau does the async binding compared to how xe
> > > > > > > > does it.
> > > > > > > > It looks to me that this function being a scheduler run_job callback is
> > > > > > > > the main part of the VM_BIND dma-fence signalling critical section for
> > > > > > > > the job's done_fence and if so, needs to be annotated as such?
> > > > > > > 
> > > > > > > Yes, that's the case.
> > > > > > > 
> > > > > > > > 
> > > > > > > > For example nouveau_uvma_region_new allocates memory, which is not
> > > > > > > > allowed if in a dma_fence signalling critical section and the locking
> > > > > > > > also looks suspicious?
> > > > > > > 
> > > > > > > Thanks for pointing this out, I missed that somehow.
> > > > > > > 
> > > > > > > I will change it to pre-allocate new regions, mappings and page tables
> > > > > > > within the job's submit() function.
> > > > > > > 
> > > > > > 
> > > > > > Yea that what we basically do in Xe, in the IOCTL step allocate all the
> > > > > > backing store for new page tables, populate new page tables (these are
> > > > > > not yet visible in the page table structure), and in last step which is
> > > > > > executed after all the dependencies are satified program all the leaf
> > > > > > entires making the new binding visible.
> > > > > > 
> > > > > > We screwed have this up by defering most of the IOCTL to a worker but
> > > > > > will fix this fix this one way or another soon - get rid of worker or
> > > > > > introduce a type of sync that is signaled after the worker + publish the
> > > > > > dma-fence in the worker. I'd like to close on this one soon.
> > > > > > > For the ops structures the drm_gpuva_manager allocates for reporting the
> > > > > > > split/merge steps back to the driver I have ideas to entirely avoid
> > > > > > > allocations, which also is a good thing in respect of Christians feedback
> > > > > > > regarding the huge amount of mapping requests some applications seem to
> > > > > > > generate.
> > > > > > > 
> > > > > > 
> > > > > > It should be fine to have allocations to report the split/merge step as
> > > > > > this step should be before a dma-fence is published, but yea if possible
> > > > > > to avoid extra allocs as that is always better.
> > > > > 
> > > > > I think we can't really ask for the split/merge steps before actually
> > > > > running the job, since it requires the particular VA space not to change
> > > > > while performing those operations.
> > > > > 
> > > > > E.g. if we'd run the split/merge steps at job submit() time the underlying
> > > > > VA space could be changed by other bind jobs executing before this one,
> > > > > which would make the calculated split/merge steps obsolete and wrong.
> > > > > 
> > > > 
> > > > Hmm, maybe I'm not understanding this implementation, admittedly I
> > > > haven't studied the gpuva manager code in detail.
> > > 
> > > The limitation I mentioned above doesn't really come from the
> > > drm_gpuva_manager, but from how the driver executes the jobs.
> > > 
> > > > 
> > > > Let me explain what we are doing in Xe.
> > > > 
> > > > Map 0x0000 - 0x3000 -> this resolves into 1 bind operation and 1 VMA
> > > > Unmap 0x1000-0x2000 -> this resolves into 1 unbind and 2 rebind operations
> > > > 
> > > > 1. unbind 0x0000-0x3000 -> destroy old VMA
> > > > 2. rebind 0x0000-0x1000 -> new VMA
> > > > 3. rebind 0x2000-0x3000 -> new VMA
> > > > 
> > > > All of the above steps resolving the operations can be done in the IOCTL
> > > > phase and VM's VMA structure is also updated. When the dependencies
> > > > are resolved the actual bindings are done on the GPU. We use the BO's
> > > > dma-resv slots to ensure there is never a window 0x0000-0x1000 and
> > > > 0x2000-0x3000 are never mapped with respect to execs (I forget the exact
> > > > details of how we do this but if you want to know I'll explain further).
> > > 
> > > Ok, so you're not only generating the split/merge steps without updating the
> > > view of the VA space (which would cause the issue I described) but also
> > > already change the view of the VA space in the IOCTL, before the actual page
> > > table update happens later on, right?
> > > 
> > 
> > Yes, we generate the operations + update the view VA space in the IOCTL
> > while the actual page table update on the GPU occurs later if there are
> > dependencies.
> > 
> > > Currently, in nouveau I do both, the actual page table update and the range
> > > allocator update, in run_job(), such that walking the allocator always
> > > represents the actual page table layout.
> > > 
> > 
> > In Xe the VA view is always if all submited bind / unbind ops has
> > completed even if some are pending.
> 
> If they're completed, yes. But in the time frame from the VA space update
> until the GPU actually updated the page tables it isn't? Not that I think
> it's a problem, just curious.
> 

There is a window where the VA space and actual page tables are not in
sync. This is definitely is fine as we've tested Xe quite thoroughly.
Essentially we are just pipelining the VA space in step with the actual
GPU page tables update in the another. The GPU page table update step
doesn't look of VA space rather the VA space step provides all the
information (statically) so the GPU page table can occur.

> > 
> > Also you may want to take a look at generic page walker Thomas Hellstrom
> > wrote for Xe which we use to program the page tables. It is pretty slick
> > and probably could use in Nouveau:
> > https://patchwork.freedesktop.org/patch/515856/?series=112188&rev=1
> > 
> > In Xe xe_pt.c is the wrapper for this, it can map, unmap, and invalidate
> > VA:
> > https://cgit.freedesktop.org/drm/drm-xe/tree/drivers/gpu/drm/xe/xe_pt.c?h=drm-xe-next
> > 
> > > How do you handle map/unmap on BO eviction?
> > > 
> > 
> > We use the dma-resv slots to order all of this.
> > 
> > Basically exec/map/unmap wait on pending BOs (I believe moves are in the
> > KERNEL slot) and BOs moves wait on pending exec/map/unmaps (I believe
> > these are BOOKKEEP slot).
> > 
> > I think more details are in the Xe kernel doc, see 'dma-resv usage':
> > https://cgit.freedesktop.org/drm/drm-xe/tree/drivers/gpu/drm/xe/xe_vm_doc.h?h=drm-xe-next
> > 
> > This might be a little stale, we dropped the idea of
> > DMA_RESV_USAGE_PREEMPT_FENCE and is now just in the BOOKKEEP but I think
> > everything else is corret.
> 
> If a BO is currently eviceted, did you consider to just add it to your
> rebind list rather than calling ttm_bo_validate() and creating the actual
> mapping right away?
>

No, but that is good idea. We probably should look at this optimization.
 
> I was thinking about this kind of "lazy mapping" approach for cases like
> partial unbind requests, where I wouldn't expect the application to need the
> mapping right away, but also for normal bind requests. I mean, when there is
> already memory pressure, why making the situation worse until an actual EXEC
> is requested?
> 
> Also, if I see it correctly unmaps caused by xe_bo_move_notify() happen on
> the CPU, right?
>

I'm not exactly sure what you asking here, but we have 3 cases here.

1. Fault mode, we just blow away the page tables, will get a fault on
next use, and then trigger a rebind.

2. Compute mode, trigger the preempt fences (kicks everything using the
BO off the hardware before the move), the rebind worker will issue a
rebind and resume execution.

3. dma-fence mode, the BO move is scheduled behind any pending execs,
the next exec IOCTL will issue the rebind.

In all case before the rebind the BO validated again perhap triggering
another move, all rebinds are scheduled behind the move.

> > 
> > > > 
> > > > Can we not use drm_gpuvs_manager in a similar manner to generate the
> > > > ops + update the VM's VMA structure early? Again maybe I missing
> > > > something here as I haven't fully studied the drm_gpuva_manager.
> > > 
> > > You can use the drm_gpuvs_manager in exactly the way you just described.
> > > Though, in your concrete example it would generate just 1 unbind and 1 bind,
> > > which it would combine in a re-bind operation. A re-bind operation always
> > > has 1 unbind and up to 2 (but a minimum of 1) bind (sub-)operations.
> > > 
> > 
> > Cool this is what I wanted to hear. Hopefully we can get around to
> > building our VM / VMA management on top the drm_gpuvs_manager soon.
> 
> I will re-work the drm_gpuva_manager memory allocation parts first, since
> those changes will influence it's API. How the internal allocator works, if
> it's drm_mm or something else, shouldn't matter to users of the
> drm_gpuva_manager from an API PoV.
>

Definitely work out the API changes first as we can work on / optimize
the internals later. If Christian can provide the benchmarks / WL that
do tons of binds we may be able to run these on Xe to help find the best
solution for the internals. VK is mostly working for Xe.

Matt
 
> - Danilo
> 
> > 
> > Matt
> > > Rebind:
> > >      1. unbind 0x0000-0x3000
> > >      2. NULL
> > >      3.   bind 0x1000-0x3000
> > > 
> > > It's then up to the driver to remove the old gpuva entry and add a new one.
> > > With the given re-bind operation the driver can conclude to just do a
> > > partial page table update from 0x0000-0x1000.
> > > 
> > > - Danilo
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > Anyway, I should be able to get rid of all the allocations to make this
> > > > > safe.
> > > > > 
> > > > > > 
> > > > > > Also BTW, great work on drm_gpuva_manager too. We will almost likely
> > > > > > pick this up in Xe rather than open coding all of this as we currently
> > > > > > do. We should probably start the port to this soon so we can contribute
> > > > > > to the implementation and get both of our drivers upstream sooner.
> > > > > 
> > > > > Sounds great!
> > > > > 
> > > > > > > Regarding the locking, anything specific that makes it look suspicious to
> > > > > > > you?
> > > > > > > 
> > > > > > 
> > > > > > I haven't looked into this too but almost certainly Thomas is suggesting
> > > > > > that if you allocate memory anywhere under the nouveau_uvmm_lock then
> > > > > > you can't use this lock in the run_job() callback as this in the
> > > > > > dma-fencing path.
> > > > > 
> > > > > Oh, sure. I already checked that, luckily there aren't any further
> > > > > allocations under this lock, so this should be safe once I changed to
> > > > > run_job() parts to pre-allocation in submit().
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > > Thomas
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > +    nouveau_uvmm_lock(uvmm);
> > > > > > > > > +    list_for_each_op(op, &bind_job->ops) {
> > > > > > > > > +        switch (op->op) {
> > > > > > > > > +        case OP_ALLOC: {
> > > > > > > > > +            bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
> > > > > > > > > +
> > > > > > > > > +            ret = nouveau_uvma_region_new(uvmm,
> > > > > > > > > +                              op->va.addr,
> > > > > > > > > +                              op->va.range,
> > > > > > > > > +                              sparse);
> > > > > > > > > +            if (ret)
> > > > > > > > > +                goto out_unlock;
> > > > > > > > > +            break;
> > > > > > > > > +        }
> > > > > > > > > +        case OP_FREE:
> > > > > > > > > +            ret = nouveau_uvma_region_destroy(uvmm,
> > > > > > > > > +                              op->va.addr,
> > > > > > > > > +                              op->va.range);
> > > > > > > > > +            if (ret)
> > > > > > > > > +                goto out_unlock;
> > > > > > > > > +            break;
> > > > > > > > > +        case OP_MAP:
> > > > > > > > > +            ret = nouveau_uvmm_sm_map(uvmm,
> > > > > > > > > +                          op->va.addr, op->va.range,
> > > > > > > > > +                          op->gem.obj, op->gem.offset,
> > > > > > > > > +                          op->flags && 0xff);
> > > > > > > > > +            if (ret)
> > > > > > > > > +                goto out_unlock;
> > > > > > > > > +            break;
> > > > > > > > > +        case OP_UNMAP:
> > > > > > > > > +            ret = nouveau_uvmm_sm_unmap(uvmm,
> > > > > > > > > +                            op->va.addr,
> > > > > > > > > +                            op->va.range);
> > > > > > > > > +            if (ret)
> > > > > > > > > +                goto out_unlock;
> > > > > > > > > +            break;
> > > > > > > > > +        }
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +out_unlock:
> > > > > > > > > +    nouveau_uvmm_unlock(uvmm);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
> > > > > > > > > +    return ERR_PTR(ret);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void
> > > > > > > > > +nouveau_bind_job_free(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > > > > > > > +    struct bind_job_op *op, *next;
> > > > > > > > > +
> > > > > > > > > +    list_for_each_op_safe(op, next, &bind_job->ops) {
> > > > > > > > > +        struct drm_gem_object *obj = op->gem.obj;
> > > > > > > > > +
> > > > > > > > > +        if (obj)
> > > > > > > > > +            drm_gem_object_put(obj);
> > > > > > > > > +
> > > > > > > > > +        list_del(&op->entry);
> > > > > > > > > +        kfree(op);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    nouveau_base_job_free(job);
> > > > > > > > > +    kfree(bind_job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct nouveau_job_ops nouveau_bind_job_ops = {
> > > > > > > > > +    .submit = nouveau_bind_job_submit,
> > > > > > > > > +    .run = nouveau_bind_job_run,
> > > > > > > > > +    .free = nouveau_bind_job_free,
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +bind_job_op_from_uop(struct bind_job_op **pop,
> > > > > > > > > +             struct drm_nouveau_vm_bind_op *uop)
> > > > > > > > > +{
> > > > > > > > > +    struct bind_job_op *op;
> > > > > > > > > +
> > > > > > > > > +    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
> > > > > > > > > +    if (!op)
> > > > > > > > > +        return -ENOMEM;
> > > > > > > > > +
> > > > > > > > > +    op->op = uop->op;
> > > > > > > > > +    op->flags = uop->flags;
> > > > > > > > > +    op->va.addr = uop->addr;
> > > > > > > > > +    op->va.range = uop->range;
> > > > > > > > > +
> > > > > > > > > +    if (op->op == DRM_NOUVEAU_VM_BIND_OP_MAP) {
> > > > > > > > > +        op->gem.handle = uop->handle;
> > > > > > > > > +        op->gem.offset = uop->bo_offset;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void
> > > > > > > > > +bind_job_ops_free(struct list_head *ops)
> > > > > > > > > +{
> > > > > > > > > +    struct bind_job_op *op, *next;
> > > > > > > > > +
> > > > > > > > > +    list_for_each_op_safe(op, next, ops) {
> > > > > > > > > +        list_del(&op->entry);
> > > > > > > > > +        kfree(op);
> > > > > > > > > +    }
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +int
> > > > > > > > > +nouveau_bind_job_init(struct nouveau_bind_job **pjob,
> > > > > > > > > +              struct nouveau_exec_bind *bind)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_bind_job *job;
> > > > > > > > > +    struct bind_job_op *op;
> > > > > > > > > +    int i, ret;
> > > > > > > > > +
> > > > > > > > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > > > > > > > +    if (!job)
> > > > > > > > > +        return -ENOMEM;
> > > > > > > > > +
> > > > > > > > > +    INIT_LIST_HEAD(&job->ops);
> > > > > > > > > +
> > > > > > > > > +    for (i = 0; i < bind->op.count; i++) {
> > > > > > > > > +        ret = bind_job_op_from_uop(&op, &bind->op.s[i]);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            goto err_free;
> > > > > > > > > +
> > > > > > > > > +        list_add_tail(&op->entry, &job->ops);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    job->base.sync = !(bind->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
> > > > > > > > > +    job->base.ops = &nouveau_bind_job_ops;
> > > > > > > > > +
> > > > > > > > > +    ret = nouveau_base_job_init(&job->base, &bind->base);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        goto err_free;
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +
> > > > > > > > > +err_free:
> > > > > > > > > +    bind_job_ops_free(&job->ops);
> > > > > > > > > +    kfree(job);
> > > > > > > > > +    *pjob = NULL;
> > > > > > > > > +
> > > > > > > > > +    return ret;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +sync_find_fence(struct nouveau_job *job,
> > > > > > > > > +        struct drm_nouveau_sync *sync,
> > > > > > > > > +        struct dma_fence **fence)
> > > > > > > > > +{
> > > > > > > > > +    u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > > > > > > > +    u64 point = 0;
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > > > > > > > +        stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > > > > > +        return -EOPNOTSUPP;
> > > > > > > > > +
> > > > > > > > > +    if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > > > > > +        point = sync->timeline_value;
> > > > > > > > > +
> > > > > > > > > +    ret = drm_syncobj_find_fence(job->file_priv,
> > > > > > > > > +                     sync->handle, point,
> > > > > > > > > +                     sync->flags, fence);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        return ret;
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +exec_job_binds_wait(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > > > > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > > > > > > > +    struct nouveau_sched_entity *bind_entity = &cli->sched_entity;
> > > > > > > > > +    signed long ret;
> > > > > > > > > +    int i;
> > > > > > > > > +
> > > > > > > > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > > > > > > > +        struct nouveau_job *it;
> > > > > > > > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > > > > > > > +        struct dma_fence *fence;
> > > > > > > > > +        bool found;
> > > > > > > > > +
> > > > > > > > > +        ret = sync_find_fence(job, sync, &fence);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            return ret;
> > > > > > > > > +
> > > > > > > > > +        mutex_lock(&bind_entity->job.mutex);
> > > > > > > > > +        found = false;
> > > > > > > > > +        list_for_each_entry(it, &bind_entity->job.list, head) {
> > > > > > > > > +            if (fence == it->done_fence) {
> > > > > > > > > +                found = true;
> > > > > > > > > +                break;
> > > > > > > > > +            }
> > > > > > > > > +        }
> > > > > > > > > +        mutex_unlock(&bind_entity->job.mutex);
> > > > > > > > > +
> > > > > > > > > +        /* If the fence is not from a VM_BIND job, don't wait for it. */
> > > > > > > > > +        if (!found)
> > > > > > > > > +            continue;
> > > > > > > > > +
> > > > > > > > > +        ret = dma_fence_wait_timeout(fence, true,
> > > > > > > > > +                         msecs_to_jiffies(500));
> > > > > > > > > +        if (ret < 0)
> > > > > > > > > +            return ret;
> > > > > > > > > +        else if (ret == 0)
> > > > > > > > > +            return -ETIMEDOUT;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +int
> > > > > > > > > +nouveau_exec_job_submit(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > > > > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > > > > > > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
> > > > > > > > > +    struct drm_exec *exec = &job->exec;
> > > > > > > > > +    struct drm_gem_object *obj;
> > > > > > > > > +    unsigned long index;
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    ret = exec_job_binds_wait(job);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        return ret;
> > > > > > > > > +
> > > > > > > > > +    nouveau_uvmm_lock(uvmm);
> > > > > > > > > +    drm_exec_while_not_all_locked(exec) {
> > > > > > > > > +        struct drm_gpuva *va;
> > > > > > > > > +
> > > > > > > > > +        drm_gpuva_for_each_va(va, &uvmm->umgr) {
> > > > > > > > > +            ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
> > > > > > > > > +            drm_exec_break_on_contention(exec);
> > > > > > > > > +            if (ret)
> > > > > > > > > +                return ret;
> > > > > > > > > +        }
> > > > > > > > > +    }
> > > > > > > > > +    nouveau_uvmm_unlock(uvmm);
> > > > > > > > > +
> > > > > > > > > +    drm_exec_for_each_locked_object(exec, index, obj) {
> > > > > > > > > +        struct dma_resv *resv = obj->resv;
> > > > > > > > > +        struct nouveau_bo *nvbo = nouveau_gem_object(obj);
> > > > > > > > > +
> > > > > > > > > +        ret = nouveau_bo_validate(nvbo, true, false);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            return ret;
> > > > > > > > > +
> > > > > > > > > +        dma_resv_add_fence(resv, job->done_fence, DMA_RESV_USAGE_WRITE);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct dma_fence *
> > > > > > > > > +nouveau_exec_job_run(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > > > > > +    struct nouveau_fence *fence;
> > > > > > > > > +    int i, ret;
> > > > > > > > > +
> > > > > > > > > +    ret = nouveau_dma_wait(job->chan, exec_job->push.count + 1, 16);
> > > > > > > > > +    if (ret) {
> > > > > > > > > +        NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
> > > > > > > > > +        return ERR_PTR(ret);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    for (i = 0; i < exec_job->push.count; i++) {
> > > > > > > > > +        nv50_dma_push(job->chan, exec_job->push.s[i].va,
> > > > > > > > > +                  exec_job->push.s[i].va_len);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    ret = nouveau_fence_new(job->chan, false, &fence);
> > > > > > > > > +    if (ret) {
> > > > > > > > > +        NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
> > > > > > > > > +        WIND_RING(job->chan);
> > > > > > > > > +        return ERR_PTR(ret);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return &fence->base;
> > > > > > > > > +}
> > > > > > > > > +static void
> > > > > > > > > +nouveau_exec_job_free(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > > > > > +
> > > > > > > > > +    nouveau_base_job_free(job);
> > > > > > > > > +
> > > > > > > > > +    kfree(exec_job->push.s);
> > > > > > > > > +    kfree(exec_job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct nouveau_job_ops nouveau_exec_job_ops = {
> > > > > > > > > +    .submit = nouveau_exec_job_submit,
> > > > > > > > > +    .run = nouveau_exec_job_run,
> > > > > > > > > +    .free = nouveau_exec_job_free,
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +int
> > > > > > > > > +nouveau_exec_job_init(struct nouveau_exec_job **pjob,
> > > > > > > > > +              struct nouveau_exec *exec)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_exec_job *job;
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > > > > > > > +    if (!job)
> > > > > > > > > +        return -ENOMEM;
> > > > > > > > > +
> > > > > > > > > +    job->push.count = exec->push.count;
> > > > > > > > > +    job->push.s = kmemdup(exec->push.s,
> > > > > > > > > +                  sizeof(*exec->push.s) *
> > > > > > > > > +                  exec->push.count,
> > > > > > > > > +                  GFP_KERNEL);
> > > > > > > > > +    if (!job->push.s) {
> > > > > > > > > +        ret = -ENOMEM;
> > > > > > > > > +        goto err_free_job;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    job->base.ops = &nouveau_exec_job_ops;
> > > > > > > > > +    ret = nouveau_base_job_init(&job->base, &exec->base);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        goto err_free_pushs;
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +
> > > > > > > > > +err_free_pushs:
> > > > > > > > > +    kfree(job->push.s);
> > > > > > > > > +err_free_job:
> > > > > > > > > +    kfree(job);
> > > > > > > > > +    *pjob = NULL;
> > > > > > > > > +
> > > > > > > > > +    return ret;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +void nouveau_job_fini(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    dma_fence_put(job->done_fence);
> > > > > > > > > +    drm_sched_job_cleanup(&job->base);
> > > > > > > > > +    job->ops->free(job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +nouveau_job_add_deps(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct dma_fence *in_fence = NULL;
> > > > > > > > > +    int ret, i;
> > > > > > > > > +
> > > > > > > > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > > > > > > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > > > > > > > +
> > > > > > > > > +        ret = sync_find_fence(job, sync, &in_fence);
> > > > > > > > > +        if (ret) {
> > > > > > > > > +            NV_PRINTK(warn, job->cli,
> > > > > > > > > +                  "Failed to find syncobj (-> in): handle=%d\n",
> > > > > > > > > +                  sync->handle);
> > > > > > > > > +            return ret;
> > > > > > > > > +        }
> > > > > > > > > +
> > > > > > > > > +        ret = drm_sched_job_add_dependency(&job->base, in_fence);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            return ret;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +nouveau_job_fence_attach(struct nouveau_job *job, struct dma_fence
> > > > > > > > > *fence)
> > > > > > > > > +{
> > > > > > > > > +    struct drm_syncobj *out_sync;
> > > > > > > > > +    int i;
> > > > > > > > > +
> > > > > > > > > +    for (i = 0; i < job->out_sync.count; i++) {
> > > > > > > > > +        struct drm_nouveau_sync *sync = &job->out_sync.s[i];
> > > > > > > > > +        u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > > > > > > > +
> > > > > > > > > +        if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > > > > > > > +            stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > > > > > +            return -EOPNOTSUPP;
> > > > > > > > > +
> > > > > > > > > +        out_sync = drm_syncobj_find(job->file_priv, sync->handle);
> > > > > > > > > +        if (!out_sync) {
> > > > > > > > > +            NV_PRINTK(warn, job->cli,
> > > > > > > > > +                  "Failed to find syncobj (-> out): handle=%d\n",
> > > > > > > > > +                  sync->handle);
> > > > > > > > > +            return -ENOENT;
> > > > > > > > > +        }
> > > > > > > > > +
> > > > > > > > > +        if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> > > > > > > > > +            struct dma_fence_chain *chain;
> > > > > > > > > +
> > > > > > > > > +            chain = dma_fence_chain_alloc();
> > > > > > > > > +            if (!chain) {
> > > > > > > > > +                drm_syncobj_put(out_sync);
> > > > > > > > > +                return -ENOMEM;
> > > > > > > > > +            }
> > > > > > > > > +
> > > > > > > > > +            drm_syncobj_add_point(out_sync, chain, fence,
> > > > > > > > > +                          sync->timeline_value);
> > > > > > > > > +        } else {
> > > > > > > > > +            drm_syncobj_replace_fence(out_sync, fence);
> > > > > > > > > +        }
> > > > > > > > > +
> > > > > > > > > +        drm_syncobj_put(out_sync);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct dma_fence *
> > > > > > > > > +nouveau_job_run(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    return job->ops->run(job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static int
> > > > > > > > > +nouveau_job_run_sync(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct dma_fence *fence;
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    fence = nouveau_job_run(job);
> > > > > > > > > +    if (IS_ERR(fence)) {
> > > > > > > > > +        return PTR_ERR(fence);
> > > > > > > > > +    } else if (fence) {
> > > > > > > > > +        ret = dma_fence_wait(fence, true);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            return ret;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    dma_fence_signal(job->done_fence);
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +int
> > > > > > > > > +nouveau_job_submit(struct nouveau_job *job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_sched_entity *entity =
> > > > > > > > > to_nouveau_sched_entity(job->base.entity);
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    drm_exec_init(&job->exec, true);
> > > > > > > > > +
> > > > > > > > > +    ret = nouveau_job_add_deps(job);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        goto out;
> > > > > > > > > +
> > > > > > > > > +    drm_sched_job_arm(&job->base);
> > > > > > > > > +    job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> > > > > > > > > +
> > > > > > > > > +    ret = nouveau_job_fence_attach(job, job->done_fence);
> > > > > > > > > +    if (ret)
> > > > > > > > > +        goto out;
> > > > > > > > > +
> > > > > > > > > +    if (job->ops->submit) {
> > > > > > > > > +        ret = job->ops->submit(job);
> > > > > > > > > +        if (ret)
> > > > > > > > > +            goto out;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    if (job->sync) {
> > > > > > > > > +        drm_exec_fini(&job->exec);
> > > > > > > > > +
> > > > > > > > > +        /* We're requested to run a synchronous job, hence don't push
> > > > > > > > > +         * the job, bypassing the job scheduler, and execute the jobs
> > > > > > > > > +         * run() function right away.
> > > > > > > > > +         *
> > > > > > > > > +         * As a consequence of bypassing the job scheduler we need to
> > > > > > > > > +         * handle fencing and job cleanup ourselfes.
> > > > > > > > > +         */
> > > > > > > > > +        ret = nouveau_job_run_sync(job);
> > > > > > > > > +
> > > > > > > > > +        /* If the job fails, the caller will do the cleanup for us. */
> > > > > > > > > +        if (!ret)
> > > > > > > > > +            nouveau_job_fini(job);
> > > > > > > > > +
> > > > > > > > > +        return ret;
> > > > > > > > > +    } else {
> > > > > > > > > +        mutex_lock(&entity->job.mutex);
> > > > > > > > > +        drm_sched_entity_push_job(&job->base);
> > > > > > > > > +        list_add_tail(&job->head, &entity->job.list);
> > > > > > > > > +        mutex_unlock(&entity->job.mutex);
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +out:
> > > > > > > > > +    drm_exec_fini(&job->exec);
> > > > > > > > > +    return ret;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct dma_fence *
> > > > > > > > > +nouveau_sched_run_job(struct drm_sched_job *sched_job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > > > > > +
> > > > > > > > > +    return nouveau_job_run(job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static enum drm_gpu_sched_stat
> > > > > > > > > +nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > > > > > +    struct nouveau_channel *chan = job->chan;
> > > > > > > > > +
> > > > > > > > > +    if (unlikely(!atomic_read(&chan->killed)))
> > > > > > > > > +        nouveau_channel_kill(chan);
> > > > > > > > > +
> > > > > > > > > +    NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
> > > > > > > > > +          chan->chid);
> > > > > > > > > +
> > > > > > > > > +    nouveau_sched_entity_fini(job->entity);
> > > > > > > > > +
> > > > > > > > > +    return DRM_GPU_SCHED_STAT_ENODEV;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void
> > > > > > > > > +nouveau_sched_free_job(struct drm_sched_job *sched_job)
> > > > > > > > > +{
> > > > > > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > > > > > +    struct nouveau_sched_entity *entity = job->entity;
> > > > > > > > > +
> > > > > > > > > +    mutex_lock(&entity->job.mutex);
> > > > > > > > > +    list_del(&job->head);
> > > > > > > > > +    mutex_unlock(&entity->job.mutex);
> > > > > > > > > +
> > > > > > > > > +    nouveau_job_fini(job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > > > > > > > +                  struct drm_gpu_scheduler *sched)
> > > > > > > > > +{
> > > > > > > > > +
> > > > > > > > > +    INIT_LIST_HEAD(&entity->job.list);
> > > > > > > > > +    mutex_init(&entity->job.mutex);
> > > > > > > > > +
> > > > > > > > > +    return drm_sched_entity_init(&entity->base,
> > > > > > > > > +                     DRM_SCHED_PRIORITY_NORMAL,
> > > > > > > > > +                     &sched, 1, NULL);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +void
> > > > > > > > > +nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
> > > > > > > > > +{
> > > > > > > > > +    drm_sched_entity_destroy(&entity->base);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static const struct drm_sched_backend_ops nouveau_sched_ops = {
> > > > > > > > > +    .run_job = nouveau_sched_run_job,
> > > > > > > > > +    .timedout_job = nouveau_sched_timedout_job,
> > > > > > > > > +    .free_job = nouveau_sched_free_job,
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > > > +               struct nouveau_drm *drm)
> > > > > > > > > +{
> > > > > > > > > +    long job_hang_limit =
> > > > > > > > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > > > > > > > +
> > > > > > > > > +    return drm_sched_init(sched, &nouveau_sched_ops,
> > > > > > > > > +                  NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > > > > > > > > +                  NULL, NULL, "nouveau", drm->dev->dev);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched)
> > > > > > > > > +{
> > > > > > > > > +    drm_sched_fini(sched);
> > > > > > > > > +}
> > > > > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..7fc5b7eea810
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > > > > > @@ -0,0 +1,98 @@
> > > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > > +
> > > > > > > > > +#ifndef NOUVEAU_SCHED_H
> > > > > > > > > +#define NOUVEAU_SCHED_H
> > > > > > > > > +
> > > > > > > > > +#include <linux/types.h>
> > > > > > > > > +
> > > > > > > > > +#include <drm/drm_exec.h>
> > > > > > > > > +#include <drm/gpu_scheduler.h>
> > > > > > > > > +
> > > > > > > > > +#include "nouveau_drv.h"
> > > > > > > > > +#include "nouveau_exec.h"
> > > > > > > > > +
> > > > > > > > > +#define to_nouveau_job(sched_job)        \
> > > > > > > > > +        container_of((sched_job), struct nouveau_job, base)
> > > > > > > > > +
> > > > > > > > > +#define to_nouveau_exec_job(job)        \
> > > > > > > > > +        container_of((job), struct nouveau_exec_job, base)
> > > > > > > > > +
> > > > > > > > > +#define to_nouveau_bind_job(job)        \
> > > > > > > > > +        container_of((job), struct nouveau_bind_job, base)
> > > > > > > > > +
> > > > > > > > > +struct nouveau_job {
> > > > > > > > > +    struct drm_sched_job base;
> > > > > > > > > +    struct list_head head;
> > > > > > > > > +
> > > > > > > > > +    struct nouveau_sched_entity *entity;
> > > > > > > > > +
> > > > > > > > > +    struct drm_file *file_priv;
> > > > > > > > > +    struct nouveau_cli *cli;
> > > > > > > > > +    struct nouveau_channel *chan;
> > > > > > > > > +
> > > > > > > > > +    struct drm_exec exec;
> > > > > > > > > +    struct dma_fence *done_fence;
> > > > > > > > > +
> > > > > > > > > +    bool sync;
> > > > > > > > > +
> > > > > > > > > +    struct {
> > > > > > > > > +        struct drm_nouveau_sync *s;
> > > > > > > > > +        u32 count;
> > > > > > > > > +    } in_sync;
> > > > > > > > > +
> > > > > > > > > +    struct {
> > > > > > > > > +        struct drm_nouveau_sync *s;
> > > > > > > > > +        u32 count;
> > > > > > > > > +    } out_sync;
> > > > > > > > > +
> > > > > > > > > +    struct nouveau_job_ops {
> > > > > > > > > +        int (*submit)(struct nouveau_job *);
> > > > > > > > > +        struct dma_fence *(*run)(struct nouveau_job *);
> > > > > > > > > +        void (*free)(struct nouveau_job *);
> > > > > > > > > +    } *ops;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct nouveau_exec_job {
> > > > > > > > > +    struct nouveau_job base;
> > > > > > > > > +
> > > > > > > > > +    struct {
> > > > > > > > > +        struct drm_nouveau_exec_push *s;
> > > > > > > > > +        u32 count;
> > > > > > > > > +    } push;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct nouveau_bind_job {
> > > > > > > > > +    struct nouveau_job base;
> > > > > > > > > +
> > > > > > > > > +    /* struct bind_job_op */
> > > > > > > > > +    struct list_head ops;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +int nouveau_bind_job_init(struct nouveau_bind_job **job,
> > > > > > > > > +              struct nouveau_exec_bind *bind);
> > > > > > > > > +int nouveau_exec_job_init(struct nouveau_exec_job **job,
> > > > > > > > > +              struct nouveau_exec *exec);
> > > > > > > > > +
> > > > > > > > > +int nouveau_job_submit(struct nouveau_job *job);
> > > > > > > > > +void nouveau_job_fini(struct nouveau_job *job);
> > > > > > > > > +
> > > > > > > > > +#define to_nouveau_sched_entity(entity)        \
> > > > > > > > > +        container_of((entity), struct nouveau_sched_entity, base)
> > > > > > > > > +
> > > > > > > > > +struct nouveau_sched_entity {
> > > > > > > > > +    struct drm_sched_entity base;
> > > > > > > > > +    struct {
> > > > > > > > > +        struct list_head list;
> > > > > > > > > +        struct mutex mutex;
> > > > > > > > > +    } job;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > > > > > > > +                  struct drm_gpu_scheduler *sched);
> > > > > > > > > +void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
> > > > > > > > > +
> > > > > > > > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > > > +               struct nouveau_drm *drm);
> > > > > > > > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched);
> > > > > > > > > +
> > > > > > > > > +#endif
> > > > > > > > 
> > > > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 
