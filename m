Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB9673F0C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38F10E9CB;
	Thu, 19 Jan 2023 16:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D879710E9C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674146335; x=1705682335;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JdiEJnTfTLpNgAK5XIUBHAHBmx1K3NROz8seoB6vmaA=;
 b=Tk6O5/ggCWWavTdPZI+TF/zihampqEbsUrpd2aBM3Ilfor2E6se/Vi5N
 i260hYBjrfoRkYWF6OjJMePs38Clmu8hRrEGYClhpM+Rktl4fE7yJ4DRY
 LmfSm/MLAHpsCuAvHo0yjWy8b4UJGmj0mWwgNNovK0Ea1vnW2ip54fANB
 XhxCwOo7rJgjGi62Ln8r/pZi/Bg+QrcjzWkhwd0jO9SLhoSpwjrEw6OIS
 ZVkb5/JLuRRW682rWgOYjPm/KvpLNrhE8iqIL4Ac6d0/+I2nH//nHqtsg
 nbN2OrFwIo8M6SeLLMACXhsoaz+ewFAMUuH4Xr3+iKDkYMa84qlrY2L0J A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324025547"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="324025547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690682100"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="690682100"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 08:38:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 08:38:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 08:38:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 08:38:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 08:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjrIqKKC4b2qUNJLwTtovXYNnyqH+wx4FgqAMG5JDKVPsfNpSN9A8aW/e/vJO3ehLICFcAf6eHvuw+rqyRsxk+lxwv0iXc9SIFVQI3XxC2NLKCMfHchxMrxjRM/F+NvFZ4eBy7+rxsJkB2+3gO1WIedXnIT8+BZwdTr51bkdGzKwoe7d0MRqYOn+gQJ4/6t+ZW35dUg1APeYJP0lJl7fXXcZCsKoMTUTiEvHH1+U7i6FG3QJdD+vh+svJGDho+vrlzDDI69c1vuHgyQylgFk+xXLwwV72JCVH6r/VPFRpztzyKBUyE76sxwPtX/EhUzu7f5yigKm2GaVBmYcKCbnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMJ/sMLKzXFEnTap5rErNFZKzJ+tNyUWij+UzNE4qFA=;
 b=HwW0GGUxZgyZOy2zp+zROt/CfpVMP9kVYyO1wuWGOHK0hMPfCmLFkIaaBXLAIfGS7Hnecw+eU5DGaCEJSo+2wjtb1+YXY35F1oXFOHWYszjb6Er3Swuq2kSv7Gviz3oR9rxqOXZIiBCA6JtYaFs1BPDsNxXEWQ5c8pr7Hg5IiowBhY0V+m66w0Z58rewFwOYDw81XwLzZJncdE5Lx6i8ebOBr0nxflQsA9dDpCE7hImLfO2q6QoA9KKsxzyyhiUuFXvRvU7bvTaF6lC00BhwD2foUIUeJudnYjwpsjWLPr8ic7xa5H0smPOO4fhsTgH8ilfXdQ1DO7i+1QNtZA/VYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 16:38:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Thu, 19 Jan 2023
 16:38:22 +0000
Date: Thu, 19 Jan 2023 16:38:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
 <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 10790433-c2bd-4805-3ccf-08dafa3b943a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRuVK8lijoEFIowFA8C86VOW7QP8iIHM27oeCr4VljS/jVx2y1Z/EPpco/JCHQCv7xHPxIyOuO1m4p+CQDExLgPBg3q2BSlTcKf4U6rberqrVx5liaap6YYxxgpRS6Rv5O6vADTYvIQcDWfC83gfwm5Id/MqQ47KBZ2/7GvTLuCexCcMgs0uDnsJ9N7INqGCOhQcIOUDKdEOZHHITUgTKYsrb+Deiq+On6tfWrfhQQudvIbTGcjUqbGSeFBCRoF1Yz63JY700CFovVHdDFN3wBCUj1UTRLWg4ZTsQlqQY53buaLPdxQtR7PN65MzpVZkdZnKyO3M804nc0c2sBL4tCflFwayyvAbw4Q734xH/9eF91DfnZ/uEB1Qqxf1cqmdyWxZXzex/k0Kshio0G7IBJhgMWlgP1rmvT8v/t8efU8PV3sir+i5iECG5TmBUW7RrrUddW6SrA5/zgh94ZdQ1Yv2t5iq688zSTHo5lbiiBV5cYZ7oQ0xcRc+bjuVaUizFgSExin/N8CQl6zno3RuuoNpqTNctcM8QbmzjjaKaaogYe4tGvFSrvpKY9yN6qAgGYXSXS3+X4VRnjoEpajM41tTZkJXdFL6harorsVtm3iQOMTVCFc8RbJVY/mmZ3gWzQdLcngGI3k1U2+evry1sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(6666004)(6486002)(6506007)(53546011)(478600001)(86362001)(2906002)(316002)(4326008)(5660300002)(82960400001)(66556008)(66946007)(66476007)(83380400001)(30864003)(44832011)(6916009)(41300700001)(8936002)(38100700002)(186003)(26005)(66574015)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WM6xWBC62+b+vL88QSfmAtIpPHgnDysp5S6SB5jeRxW0vzG8CfS6DLKOI8?=
 =?iso-8859-1?Q?YrxwRzEpUQtM615fJSFH684SfpRJoZRHrIeEcq+b4FB0aAKSrZxTePuoLh?=
 =?iso-8859-1?Q?SjeACVBMlQx/qjiHZufJ7bIWfgoCej9xzVwFPNSaK7PN+WdPsYVS4mDFn0?=
 =?iso-8859-1?Q?WGEvCYy3x1JXT6pW//fFKA6Wy0xEazrseDq0b3353NRn5OBLJT0/E+DR5K?=
 =?iso-8859-1?Q?nWHvJ2Ah4iJ1Eqa2f7vuAX4WGRWq6l7d9aHTZY0eCcFQMEt5lkCjhmdKIu?=
 =?iso-8859-1?Q?eI54wWfV0tqviqrZFzYSbrzzdfvy8uW24tzzT/GcaDOIzgpVB5okZCKWVk?=
 =?iso-8859-1?Q?BNTNdPCj/8boC7T3WyHdmEGOdzDI/2TeGMKofRRleGiXt+YuuBEYd2SdTp?=
 =?iso-8859-1?Q?8E1tLstA7L7aUS70Bpywsf15fEtL0jRw8RWiDCTMhS7YqmXX01+F1Ns7tR?=
 =?iso-8859-1?Q?jkEAs+TmSfXl+94fCOqJDQf39OpK4iM01VPlms0Yc5TmGwjN+EMcVPM3Bi?=
 =?iso-8859-1?Q?/78IKyWWCQJVtVZ4tNA/jbCV0qOyiYtS1ziZ4nSmUNcJfGH8nR+X2wOovz?=
 =?iso-8859-1?Q?GLUq6VPPu9x0LlY5jGTQ9PRrUKd9dtav/uOvjSTfz/bEjcUbo5f3yooFg1?=
 =?iso-8859-1?Q?4O4bTNl5Yw4aU/83iGc4OFzHlHQJibjfvb8USY8FBND78VEk4QTSw7nfns?=
 =?iso-8859-1?Q?4ulcfpmpTLawhKBlfK6U/ezrUxuJcTaO+w+iuVOdAwW7aMuWNJVgTM9tCv?=
 =?iso-8859-1?Q?pUVqexa6URPb/ks9SZo+sY3eOcwm7hmHnynSoJqZ+3o0OxKpz0IbB8rK6w?=
 =?iso-8859-1?Q?be2h6Z2jINwgDY4EpjtaKY5f+ktG51zoQIXt9Yv/ZFy2Dkqo0RlwhdzFSB?=
 =?iso-8859-1?Q?xp5Cu8UInZNgMz+C9dalYe+/pSfy0A9j2yBxZiT9WmRI9Q5lvAffXJ7+Ra?=
 =?iso-8859-1?Q?pLG0y4pSpxH40NrfUhiIxAI27lJ1g5M5NrnAQ/qTHbWp3xGPZVYTV6M+CU?=
 =?iso-8859-1?Q?gx3kW+xZEab2t7ysuNywapZMCFtZPAbRz0VGokq907J9/ig+/bwtG3NHRJ?=
 =?iso-8859-1?Q?fuOw7VwOPKIqBhFv42tQeHr/FhH2o//rxzvOvecaHRa6fylj1iX08A07lx?=
 =?iso-8859-1?Q?xOR2Tax9uAXKoAx1+ifi7RmCE9k1ZZcHkq1Qz1CZS3VRy5QZ+0IuPzN1Km?=
 =?iso-8859-1?Q?dQE/oj5Kk/ebTijKPzQ+uyUl5kpDYy6HkwGhKvrxO3O7vwjlJ1Onb/+tCn?=
 =?iso-8859-1?Q?TgYFTY8APLZewPR8oHdj1DhcmwlTq5ZxAleFX9Uv38eJGO5lJwjTHJLf3C?=
 =?iso-8859-1?Q?wKI0LIRpXjxvBfyHEOi7AaVIwlfeeeKPK9y3Zdd7FZSbB1hr+Cy9PT/lYR?=
 =?iso-8859-1?Q?Vx3+8VbWxFQ4jxRA6eFhL4XTPClCP6En7wzjbndjvcopIzPJUpP9Jw3lDz?=
 =?iso-8859-1?Q?AwA2jC1l1kYdvxmN6TaATtWcqDEMaB7gDVNmk2LQ2HL/cyfPvovcO07Ztv?=
 =?iso-8859-1?Q?USWSsmg9ueB8qev+iO6CsjMFH4kb+b58pJP/+WAN5OjUZKNqZcq4npIkhC?=
 =?iso-8859-1?Q?N+DIlLMCDfd6fu0i/XV3dvS4N3SuOPCMpM4KGIxT3NzyiJO3NXEChjXfI6?=
 =?iso-8859-1?Q?ligHw0qCgBO/KFk28k6d5lS/9y3o5XQLMMrtOXoFxw8emQW/npOhRUIA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10790433-c2bd-4805-3ccf-08dafa3b943a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 16:38:22.5392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cbwqQBG9XpFFQGLa2i8rDeZ5LkTQvnYtnKLNybHPNKkO71zvNHVfpOV5cKPTi1IlFK0IxeXK2vY8prMwmakbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 04:36:43PM +0100, Danilo Krummrich wrote:
> On 1/19/23 05:58, Matthew Brost wrote:
> > On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote:
> > > On 1/18/23 21:37, Thomas Hellström (Intel) wrote:
> > > > 
> > > > On 1/18/23 07:12, Danilo Krummrich wrote:
> > > > > This commit provides the implementation for the new uapi motivated by the
> > > > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > > > 
> > > > > 1) Initialize a GPU virtual address (VA) space via the new
> > > > >      DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
> > > > >      space managed by the kernel and userspace, respectively.
> > > > > 
> > > > > 2) Allocate and free a VA space region as well as bind and unbind memory
> > > > >      to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> > > > >      UMDs can request the named operations to be processed either
> > > > >      synchronously or asynchronously. It supports DRM syncobjs
> > > > >      (incl. timelines) as synchronization mechanism. The management of the
> > > > >      GPU VA mappings is implemented with the DRM GPU VA manager.
> > > > > 
> > > > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
> > > > >      execution happens asynchronously. It supports DRM syncobj (incl.
> > > > >      timelines) as synchronization mechanism. DRM GEM object locking is
> > > > >      handled with drm_exec.
> > > > > 
> > > > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
> > > > > GPU scheduler for the asynchronous paths.
> > > > > 
> > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > ---
> > > > >    Documentation/gpu/driver-uapi.rst       |   3 +
> > > > >    drivers/gpu/drm/nouveau/Kbuild          |   2 +
> > > > >    drivers/gpu/drm/nouveau/Kconfig         |   2 +
> > > > >    drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
> > > > >    drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
> > > > >    drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
> > > > >    drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
> > > > >    drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
> > > > >    drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
> > > > >    drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
> > > > >    drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
> > > > >    11 files changed, 1295 insertions(+), 4 deletions(-)
> > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > ...
> > > > > 
> > > > > +static struct dma_fence *
> > > > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
> > > > > +    struct bind_job_op *op;
> > > > > +    int ret = 0;
> > > > > +
> > > > 
> > > > I was looking at how nouveau does the async binding compared to how xe
> > > > does it.
> > > > It looks to me that this function being a scheduler run_job callback is
> > > > the main part of the VM_BIND dma-fence signalling critical section for
> > > > the job's done_fence and if so, needs to be annotated as such?
> > > 
> > > Yes, that's the case.
> > > 
> > > > 
> > > > For example nouveau_uvma_region_new allocates memory, which is not
> > > > allowed if in a dma_fence signalling critical section and the locking
> > > > also looks suspicious?
> > > 
> > > Thanks for pointing this out, I missed that somehow.
> > > 
> > > I will change it to pre-allocate new regions, mappings and page tables
> > > within the job's submit() function.
> > > 
> > 
> > Yea that what we basically do in Xe, in the IOCTL step allocate all the
> > backing store for new page tables, populate new page tables (these are
> > not yet visible in the page table structure), and in last step which is
> > executed after all the dependencies are satified program all the leaf
> > entires making the new binding visible.
> > 
> > We screwed have this up by defering most of the IOCTL to a worker but
> > will fix this fix this one way or another soon - get rid of worker or
> > introduce a type of sync that is signaled after the worker + publish the
> > dma-fence in the worker. I'd like to close on this one soon.
> > > For the ops structures the drm_gpuva_manager allocates for reporting the
> > > split/merge steps back to the driver I have ideas to entirely avoid
> > > allocations, which also is a good thing in respect of Christians feedback
> > > regarding the huge amount of mapping requests some applications seem to
> > > generate.
> > > 
> > 
> > It should be fine to have allocations to report the split/merge step as
> > this step should be before a dma-fence is published, but yea if possible
> > to avoid extra allocs as that is always better.
> 
> I think we can't really ask for the split/merge steps before actually
> running the job, since it requires the particular VA space not to change
> while performing those operations.
> 
> E.g. if we'd run the split/merge steps at job submit() time the underlying
> VA space could be changed by other bind jobs executing before this one,
> which would make the calculated split/merge steps obsolete and wrong.
> 

Hmm, maybe I'm not understanding this implementation, admittedly I
haven't studied the gpuva manager code in detail.

Let me explain what we are doing in Xe.

Map 0x0000 - 0x3000 -> this resolves into 1 bind operation and 1 VMA
Unmap 0x1000-0x2000 -> this resolves into 1 unbind and 2 rebind operations

1. unbind 0x0000-0x3000 -> destroy old VMA
2. rebind 0x0000-0x1000 -> new VMA
3. rebind 0x2000-0x3000 -> new VMA

All of the above steps resolving the operations can be done in the IOCTL
phase and VM's VMA structure is also updated. When the dependencies
are resolved the actual bindings are done on the GPU. We use the BO's
dma-resv slots to ensure there is never a window 0x0000-0x1000 and
0x2000-0x3000 are never mapped with respect to execs (I forget the exact
details of how we do this but if you want to know I'll explain further).

Can we not use drm_gpuvs_manager in a similar manner to generate the
ops + update the VM's VMA structure early? Again maybe I missing
something here as I haven't fully studied the drm_gpuva_manager.

Matt

> Anyway, I should be able to get rid of all the allocations to make this
> safe.
> 
> > 
> > Also BTW, great work on drm_gpuva_manager too. We will almost likely
> > pick this up in Xe rather than open coding all of this as we currently
> > do. We should probably start the port to this soon so we can contribute
> > to the implementation and get both of our drivers upstream sooner.
> 
> Sounds great!
> 
> > > Regarding the locking, anything specific that makes it look suspicious to
> > > you?
> > > 
> > 
> > I haven't looked into this too but almost certainly Thomas is suggesting
> > that if you allocate memory anywhere under the nouveau_uvmm_lock then
> > you can't use this lock in the run_job() callback as this in the
> > dma-fencing path.
> 
> Oh, sure. I already checked that, luckily there aren't any further
> allocations under this lock, so this should be safe once I changed to
> run_job() parts to pre-allocation in submit().
> 
> > 
> > Matt
> > 
> > > > 
> > > > Thanks,
> > > > 
> > > > Thomas
> > > > 
> > > > 
> > > > > +    nouveau_uvmm_lock(uvmm);
> > > > > +    list_for_each_op(op, &bind_job->ops) {
> > > > > +        switch (op->op) {
> > > > > +        case OP_ALLOC: {
> > > > > +            bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
> > > > > +
> > > > > +            ret = nouveau_uvma_region_new(uvmm,
> > > > > +                              op->va.addr,
> > > > > +                              op->va.range,
> > > > > +                              sparse);
> > > > > +            if (ret)
> > > > > +                goto out_unlock;
> > > > > +            break;
> > > > > +        }
> > > > > +        case OP_FREE:
> > > > > +            ret = nouveau_uvma_region_destroy(uvmm,
> > > > > +                              op->va.addr,
> > > > > +                              op->va.range);
> > > > > +            if (ret)
> > > > > +                goto out_unlock;
> > > > > +            break;
> > > > > +        case OP_MAP:
> > > > > +            ret = nouveau_uvmm_sm_map(uvmm,
> > > > > +                          op->va.addr, op->va.range,
> > > > > +                          op->gem.obj, op->gem.offset,
> > > > > +                          op->flags && 0xff);
> > > > > +            if (ret)
> > > > > +                goto out_unlock;
> > > > > +            break;
> > > > > +        case OP_UNMAP:
> > > > > +            ret = nouveau_uvmm_sm_unmap(uvmm,
> > > > > +                            op->va.addr,
> > > > > +                            op->va.range);
> > > > > +            if (ret)
> > > > > +                goto out_unlock;
> > > > > +            break;
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +out_unlock:
> > > > > +    nouveau_uvmm_unlock(uvmm);
> > > > > +    if (ret)
> > > > > +        NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
> > > > > +    return ERR_PTR(ret);
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +nouveau_bind_job_free(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > > > +    struct bind_job_op *op, *next;
> > > > > +
> > > > > +    list_for_each_op_safe(op, next, &bind_job->ops) {
> > > > > +        struct drm_gem_object *obj = op->gem.obj;
> > > > > +
> > > > > +        if (obj)
> > > > > +            drm_gem_object_put(obj);
> > > > > +
> > > > > +        list_del(&op->entry);
> > > > > +        kfree(op);
> > > > > +    }
> > > > > +
> > > > > +    nouveau_base_job_free(job);
> > > > > +    kfree(bind_job);
> > > > > +}
> > > > > +
> > > > > +static struct nouveau_job_ops nouveau_bind_job_ops = {
> > > > > +    .submit = nouveau_bind_job_submit,
> > > > > +    .run = nouveau_bind_job_run,
> > > > > +    .free = nouveau_bind_job_free,
> > > > > +};
> > > > > +
> > > > > +static int
> > > > > +bind_job_op_from_uop(struct bind_job_op **pop,
> > > > > +             struct drm_nouveau_vm_bind_op *uop)
> > > > > +{
> > > > > +    struct bind_job_op *op;
> > > > > +
> > > > > +    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
> > > > > +    if (!op)
> > > > > +        return -ENOMEM;
> > > > > +
> > > > > +    op->op = uop->op;
> > > > > +    op->flags = uop->flags;
> > > > > +    op->va.addr = uop->addr;
> > > > > +    op->va.range = uop->range;
> > > > > +
> > > > > +    if (op->op == DRM_NOUVEAU_VM_BIND_OP_MAP) {
> > > > > +        op->gem.handle = uop->handle;
> > > > > +        op->gem.offset = uop->bo_offset;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +bind_job_ops_free(struct list_head *ops)
> > > > > +{
> > > > > +    struct bind_job_op *op, *next;
> > > > > +
> > > > > +    list_for_each_op_safe(op, next, ops) {
> > > > > +        list_del(&op->entry);
> > > > > +        kfree(op);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +int
> > > > > +nouveau_bind_job_init(struct nouveau_bind_job **pjob,
> > > > > +              struct nouveau_exec_bind *bind)
> > > > > +{
> > > > > +    struct nouveau_bind_job *job;
> > > > > +    struct bind_job_op *op;
> > > > > +    int i, ret;
> > > > > +
> > > > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > > > +    if (!job)
> > > > > +        return -ENOMEM;
> > > > > +
> > > > > +    INIT_LIST_HEAD(&job->ops);
> > > > > +
> > > > > +    for (i = 0; i < bind->op.count; i++) {
> > > > > +        ret = bind_job_op_from_uop(&op, &bind->op.s[i]);
> > > > > +        if (ret)
> > > > > +            goto err_free;
> > > > > +
> > > > > +        list_add_tail(&op->entry, &job->ops);
> > > > > +    }
> > > > > +
> > > > > +    job->base.sync = !(bind->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
> > > > > +    job->base.ops = &nouveau_bind_job_ops;
> > > > > +
> > > > > +    ret = nouveau_base_job_init(&job->base, &bind->base);
> > > > > +    if (ret)
> > > > > +        goto err_free;
> > > > > +
> > > > > +    return 0;
> > > > > +
> > > > > +err_free:
> > > > > +    bind_job_ops_free(&job->ops);
> > > > > +    kfree(job);
> > > > > +    *pjob = NULL;
> > > > > +
> > > > > +    return ret;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +sync_find_fence(struct nouveau_job *job,
> > > > > +        struct drm_nouveau_sync *sync,
> > > > > +        struct dma_fence **fence)
> > > > > +{
> > > > > +    u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > > > +    u64 point = 0;
> > > > > +    int ret;
> > > > > +
> > > > > +    if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > > > +        stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > +        return -EOPNOTSUPP;
> > > > > +
> > > > > +    if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > +        point = sync->timeline_value;
> > > > > +
> > > > > +    ret = drm_syncobj_find_fence(job->file_priv,
> > > > > +                     sync->handle, point,
> > > > > +                     sync->flags, fence);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +exec_job_binds_wait(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > > > +    struct nouveau_sched_entity *bind_entity = &cli->sched_entity;
> > > > > +    signed long ret;
> > > > > +    int i;
> > > > > +
> > > > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > > > +        struct nouveau_job *it;
> > > > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > > > +        struct dma_fence *fence;
> > > > > +        bool found;
> > > > > +
> > > > > +        ret = sync_find_fence(job, sync, &fence);
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        mutex_lock(&bind_entity->job.mutex);
> > > > > +        found = false;
> > > > > +        list_for_each_entry(it, &bind_entity->job.list, head) {
> > > > > +            if (fence == it->done_fence) {
> > > > > +                found = true;
> > > > > +                break;
> > > > > +            }
> > > > > +        }
> > > > > +        mutex_unlock(&bind_entity->job.mutex);
> > > > > +
> > > > > +        /* If the fence is not from a VM_BIND job, don't wait for it. */
> > > > > +        if (!found)
> > > > > +            continue;
> > > > > +
> > > > > +        ret = dma_fence_wait_timeout(fence, true,
> > > > > +                         msecs_to_jiffies(500));
> > > > > +        if (ret < 0)
> > > > > +            return ret;
> > > > > +        else if (ret == 0)
> > > > > +            return -ETIMEDOUT;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +int
> > > > > +nouveau_exec_job_submit(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
> > > > > +    struct drm_exec *exec = &job->exec;
> > > > > +    struct drm_gem_object *obj;
> > > > > +    unsigned long index;
> > > > > +    int ret;
> > > > > +
> > > > > +    ret = exec_job_binds_wait(job);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    nouveau_uvmm_lock(uvmm);
> > > > > +    drm_exec_while_not_all_locked(exec) {
> > > > > +        struct drm_gpuva *va;
> > > > > +
> > > > > +        drm_gpuva_for_each_va(va, &uvmm->umgr) {
> > > > > +            ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
> > > > > +            drm_exec_break_on_contention(exec);
> > > > > +            if (ret)
> > > > > +                return ret;
> > > > > +        }
> > > > > +    }
> > > > > +    nouveau_uvmm_unlock(uvmm);
> > > > > +
> > > > > +    drm_exec_for_each_locked_object(exec, index, obj) {
> > > > > +        struct dma_resv *resv = obj->resv;
> > > > > +        struct nouveau_bo *nvbo = nouveau_gem_object(obj);
> > > > > +
> > > > > +        ret = nouveau_bo_validate(nvbo, true, false);
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        dma_resv_add_fence(resv, job->done_fence, DMA_RESV_USAGE_WRITE);
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static struct dma_fence *
> > > > > +nouveau_exec_job_run(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > +    struct nouveau_fence *fence;
> > > > > +    int i, ret;
> > > > > +
> > > > > +    ret = nouveau_dma_wait(job->chan, exec_job->push.count + 1, 16);
> > > > > +    if (ret) {
> > > > > +        NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
> > > > > +        return ERR_PTR(ret);
> > > > > +    }
> > > > > +
> > > > > +    for (i = 0; i < exec_job->push.count; i++) {
> > > > > +        nv50_dma_push(job->chan, exec_job->push.s[i].va,
> > > > > +                  exec_job->push.s[i].va_len);
> > > > > +    }
> > > > > +
> > > > > +    ret = nouveau_fence_new(job->chan, false, &fence);
> > > > > +    if (ret) {
> > > > > +        NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
> > > > > +        WIND_RING(job->chan);
> > > > > +        return ERR_PTR(ret);
> > > > > +    }
> > > > > +
> > > > > +    return &fence->base;
> > > > > +}
> > > > > +static void
> > > > > +nouveau_exec_job_free(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > > > +
> > > > > +    nouveau_base_job_free(job);
> > > > > +
> > > > > +    kfree(exec_job->push.s);
> > > > > +    kfree(exec_job);
> > > > > +}
> > > > > +
> > > > > +static struct nouveau_job_ops nouveau_exec_job_ops = {
> > > > > +    .submit = nouveau_exec_job_submit,
> > > > > +    .run = nouveau_exec_job_run,
> > > > > +    .free = nouveau_exec_job_free,
> > > > > +};
> > > > > +
> > > > > +int
> > > > > +nouveau_exec_job_init(struct nouveau_exec_job **pjob,
> > > > > +              struct nouveau_exec *exec)
> > > > > +{
> > > > > +    struct nouveau_exec_job *job;
> > > > > +    int ret;
> > > > > +
> > > > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > > > +    if (!job)
> > > > > +        return -ENOMEM;
> > > > > +
> > > > > +    job->push.count = exec->push.count;
> > > > > +    job->push.s = kmemdup(exec->push.s,
> > > > > +                  sizeof(*exec->push.s) *
> > > > > +                  exec->push.count,
> > > > > +                  GFP_KERNEL);
> > > > > +    if (!job->push.s) {
> > > > > +        ret = -ENOMEM;
> > > > > +        goto err_free_job;
> > > > > +    }
> > > > > +
> > > > > +    job->base.ops = &nouveau_exec_job_ops;
> > > > > +    ret = nouveau_base_job_init(&job->base, &exec->base);
> > > > > +    if (ret)
> > > > > +        goto err_free_pushs;
> > > > > +
> > > > > +    return 0;
> > > > > +
> > > > > +err_free_pushs:
> > > > > +    kfree(job->push.s);
> > > > > +err_free_job:
> > > > > +    kfree(job);
> > > > > +    *pjob = NULL;
> > > > > +
> > > > > +    return ret;
> > > > > +}
> > > > > +
> > > > > +void nouveau_job_fini(struct nouveau_job *job)
> > > > > +{
> > > > > +    dma_fence_put(job->done_fence);
> > > > > +    drm_sched_job_cleanup(&job->base);
> > > > > +    job->ops->free(job);
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +nouveau_job_add_deps(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct dma_fence *in_fence = NULL;
> > > > > +    int ret, i;
> > > > > +
> > > > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > > > +
> > > > > +        ret = sync_find_fence(job, sync, &in_fence);
> > > > > +        if (ret) {
> > > > > +            NV_PRINTK(warn, job->cli,
> > > > > +                  "Failed to find syncobj (-> in): handle=%d\n",
> > > > > +                  sync->handle);
> > > > > +            return ret;
> > > > > +        }
> > > > > +
> > > > > +        ret = drm_sched_job_add_dependency(&job->base, in_fence);
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +nouveau_job_fence_attach(struct nouveau_job *job, struct dma_fence
> > > > > *fence)
> > > > > +{
> > > > > +    struct drm_syncobj *out_sync;
> > > > > +    int i;
> > > > > +
> > > > > +    for (i = 0; i < job->out_sync.count; i++) {
> > > > > +        struct drm_nouveau_sync *sync = &job->out_sync.s[i];
> > > > > +        u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > > > +
> > > > > +        if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > > > +            stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > > > +            return -EOPNOTSUPP;
> > > > > +
> > > > > +        out_sync = drm_syncobj_find(job->file_priv, sync->handle);
> > > > > +        if (!out_sync) {
> > > > > +            NV_PRINTK(warn, job->cli,
> > > > > +                  "Failed to find syncobj (-> out): handle=%d\n",
> > > > > +                  sync->handle);
> > > > > +            return -ENOENT;
> > > > > +        }
> > > > > +
> > > > > +        if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> > > > > +            struct dma_fence_chain *chain;
> > > > > +
> > > > > +            chain = dma_fence_chain_alloc();
> > > > > +            if (!chain) {
> > > > > +                drm_syncobj_put(out_sync);
> > > > > +                return -ENOMEM;
> > > > > +            }
> > > > > +
> > > > > +            drm_syncobj_add_point(out_sync, chain, fence,
> > > > > +                          sync->timeline_value);
> > > > > +        } else {
> > > > > +            drm_syncobj_replace_fence(out_sync, fence);
> > > > > +        }
> > > > > +
> > > > > +        drm_syncobj_put(out_sync);
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static struct dma_fence *
> > > > > +nouveau_job_run(struct nouveau_job *job)
> > > > > +{
> > > > > +    return job->ops->run(job);
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +nouveau_job_run_sync(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct dma_fence *fence;
> > > > > +    int ret;
> > > > > +
> > > > > +    fence = nouveau_job_run(job);
> > > > > +    if (IS_ERR(fence)) {
> > > > > +        return PTR_ERR(fence);
> > > > > +    } else if (fence) {
> > > > > +        ret = dma_fence_wait(fence, true);
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +    }
> > > > > +
> > > > > +    dma_fence_signal(job->done_fence);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +int
> > > > > +nouveau_job_submit(struct nouveau_job *job)
> > > > > +{
> > > > > +    struct nouveau_sched_entity *entity =
> > > > > to_nouveau_sched_entity(job->base.entity);
> > > > > +    int ret;
> > > > > +
> > > > > +    drm_exec_init(&job->exec, true);
> > > > > +
> > > > > +    ret = nouveau_job_add_deps(job);
> > > > > +    if (ret)
> > > > > +        goto out;
> > > > > +
> > > > > +    drm_sched_job_arm(&job->base);
> > > > > +    job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> > > > > +
> > > > > +    ret = nouveau_job_fence_attach(job, job->done_fence);
> > > > > +    if (ret)
> > > > > +        goto out;
> > > > > +
> > > > > +    if (job->ops->submit) {
> > > > > +        ret = job->ops->submit(job);
> > > > > +        if (ret)
> > > > > +            goto out;
> > > > > +    }
> > > > > +
> > > > > +    if (job->sync) {
> > > > > +        drm_exec_fini(&job->exec);
> > > > > +
> > > > > +        /* We're requested to run a synchronous job, hence don't push
> > > > > +         * the job, bypassing the job scheduler, and execute the jobs
> > > > > +         * run() function right away.
> > > > > +         *
> > > > > +         * As a consequence of bypassing the job scheduler we need to
> > > > > +         * handle fencing and job cleanup ourselfes.
> > > > > +         */
> > > > > +        ret = nouveau_job_run_sync(job);
> > > > > +
> > > > > +        /* If the job fails, the caller will do the cleanup for us. */
> > > > > +        if (!ret)
> > > > > +            nouveau_job_fini(job);
> > > > > +
> > > > > +        return ret;
> > > > > +    } else {
> > > > > +        mutex_lock(&entity->job.mutex);
> > > > > +        drm_sched_entity_push_job(&job->base);
> > > > > +        list_add_tail(&job->head, &entity->job.list);
> > > > > +        mutex_unlock(&entity->job.mutex);
> > > > > +    }
> > > > > +
> > > > > +out:
> > > > > +    drm_exec_fini(&job->exec);
> > > > > +    return ret;
> > > > > +}
> > > > > +
> > > > > +static struct dma_fence *
> > > > > +nouveau_sched_run_job(struct drm_sched_job *sched_job)
> > > > > +{
> > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > +
> > > > > +    return nouveau_job_run(job);
> > > > > +}
> > > > > +
> > > > > +static enum drm_gpu_sched_stat
> > > > > +nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> > > > > +{
> > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > +    struct nouveau_channel *chan = job->chan;
> > > > > +
> > > > > +    if (unlikely(!atomic_read(&chan->killed)))
> > > > > +        nouveau_channel_kill(chan);
> > > > > +
> > > > > +    NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
> > > > > +          chan->chid);
> > > > > +
> > > > > +    nouveau_sched_entity_fini(job->entity);
> > > > > +
> > > > > +    return DRM_GPU_SCHED_STAT_ENODEV;
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +nouveau_sched_free_job(struct drm_sched_job *sched_job)
> > > > > +{
> > > > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > > > +    struct nouveau_sched_entity *entity = job->entity;
> > > > > +
> > > > > +    mutex_lock(&entity->job.mutex);
> > > > > +    list_del(&job->head);
> > > > > +    mutex_unlock(&entity->job.mutex);
> > > > > +
> > > > > +    nouveau_job_fini(job);
> > > > > +}
> > > > > +
> > > > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > > > +                  struct drm_gpu_scheduler *sched)
> > > > > +{
> > > > > +
> > > > > +    INIT_LIST_HEAD(&entity->job.list);
> > > > > +    mutex_init(&entity->job.mutex);
> > > > > +
> > > > > +    return drm_sched_entity_init(&entity->base,
> > > > > +                     DRM_SCHED_PRIORITY_NORMAL,
> > > > > +                     &sched, 1, NULL);
> > > > > +}
> > > > > +
> > > > > +void
> > > > > +nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
> > > > > +{
> > > > > +    drm_sched_entity_destroy(&entity->base);
> > > > > +}
> > > > > +
> > > > > +static const struct drm_sched_backend_ops nouveau_sched_ops = {
> > > > > +    .run_job = nouveau_sched_run_job,
> > > > > +    .timedout_job = nouveau_sched_timedout_job,
> > > > > +    .free_job = nouveau_sched_free_job,
> > > > > +};
> > > > > +
> > > > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > > > +               struct nouveau_drm *drm)
> > > > > +{
> > > > > +    long job_hang_limit =
> > > > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > > > +
> > > > > +    return drm_sched_init(sched, &nouveau_sched_ops,
> > > > > +                  NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > > > > +                  NULL, NULL, "nouveau", drm->dev->dev);
> > > > > +}
> > > > > +
> > > > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched)
> > > > > +{
> > > > > +    drm_sched_fini(sched);
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > new file mode 100644
> > > > > index 000000000000..7fc5b7eea810
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > > > @@ -0,0 +1,98 @@
> > > > > +// SPDX-License-Identifier: MIT
> > > > > +
> > > > > +#ifndef NOUVEAU_SCHED_H
> > > > > +#define NOUVEAU_SCHED_H
> > > > > +
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +#include <drm/drm_exec.h>
> > > > > +#include <drm/gpu_scheduler.h>
> > > > > +
> > > > > +#include "nouveau_drv.h"
> > > > > +#include "nouveau_exec.h"
> > > > > +
> > > > > +#define to_nouveau_job(sched_job)        \
> > > > > +        container_of((sched_job), struct nouveau_job, base)
> > > > > +
> > > > > +#define to_nouveau_exec_job(job)        \
> > > > > +        container_of((job), struct nouveau_exec_job, base)
> > > > > +
> > > > > +#define to_nouveau_bind_job(job)        \
> > > > > +        container_of((job), struct nouveau_bind_job, base)
> > > > > +
> > > > > +struct nouveau_job {
> > > > > +    struct drm_sched_job base;
> > > > > +    struct list_head head;
> > > > > +
> > > > > +    struct nouveau_sched_entity *entity;
> > > > > +
> > > > > +    struct drm_file *file_priv;
> > > > > +    struct nouveau_cli *cli;
> > > > > +    struct nouveau_channel *chan;
> > > > > +
> > > > > +    struct drm_exec exec;
> > > > > +    struct dma_fence *done_fence;
> > > > > +
> > > > > +    bool sync;
> > > > > +
> > > > > +    struct {
> > > > > +        struct drm_nouveau_sync *s;
> > > > > +        u32 count;
> > > > > +    } in_sync;
> > > > > +
> > > > > +    struct {
> > > > > +        struct drm_nouveau_sync *s;
> > > > > +        u32 count;
> > > > > +    } out_sync;
> > > > > +
> > > > > +    struct nouveau_job_ops {
> > > > > +        int (*submit)(struct nouveau_job *);
> > > > > +        struct dma_fence *(*run)(struct nouveau_job *);
> > > > > +        void (*free)(struct nouveau_job *);
> > > > > +    } *ops;
> > > > > +};
> > > > > +
> > > > > +struct nouveau_exec_job {
> > > > > +    struct nouveau_job base;
> > > > > +
> > > > > +    struct {
> > > > > +        struct drm_nouveau_exec_push *s;
> > > > > +        u32 count;
> > > > > +    } push;
> > > > > +};
> > > > > +
> > > > > +struct nouveau_bind_job {
> > > > > +    struct nouveau_job base;
> > > > > +
> > > > > +    /* struct bind_job_op */
> > > > > +    struct list_head ops;
> > > > > +};
> > > > > +
> > > > > +int nouveau_bind_job_init(struct nouveau_bind_job **job,
> > > > > +              struct nouveau_exec_bind *bind);
> > > > > +int nouveau_exec_job_init(struct nouveau_exec_job **job,
> > > > > +              struct nouveau_exec *exec);
> > > > > +
> > > > > +int nouveau_job_submit(struct nouveau_job *job);
> > > > > +void nouveau_job_fini(struct nouveau_job *job);
> > > > > +
> > > > > +#define to_nouveau_sched_entity(entity)        \
> > > > > +        container_of((entity), struct nouveau_sched_entity, base)
> > > > > +
> > > > > +struct nouveau_sched_entity {
> > > > > +    struct drm_sched_entity base;
> > > > > +    struct {
> > > > > +        struct list_head list;
> > > > > +        struct mutex mutex;
> > > > > +    } job;
> > > > > +};
> > > > > +
> > > > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > > > +                  struct drm_gpu_scheduler *sched);
> > > > > +void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
> > > > > +
> > > > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > > > +               struct nouveau_drm *drm);
> > > > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched);
> > > > > +
> > > > > +#endif
> > > > 
> > > 
> > 
> 
