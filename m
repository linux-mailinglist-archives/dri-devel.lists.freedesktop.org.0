Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190C81E90A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 19:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AEF10E1ED;
	Tue, 26 Dec 2023 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66B210E0E5;
 Tue, 26 Dec 2023 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703615252; x=1735151252;
 h=date:from:to:subject:message-id:mime-version;
 bh=qreT88JgGqJ3eyvpIhZhd4Zl89phed7M31gMFi7mVvE=;
 b=UW4i0lXEEuvLaUFsYhG3e24s6G0ePyKlJCHP3wtcuSYkq85HndKgACkh
 3Hz0UtynX8TWHiBr1hfa79NFVrI6CpeSL14W2lE39MM2lhcx6FXS6bF5c
 elLnGMr4TLI/PJaIMlNW/vACW7+U9NT+gbtx7mSFRhNv4c7Br4+E3d9l1
 aKpqRR+UzPIro/OBbBlIjn3u8ApRT2DjKHolsiXKAlGKHg+glsLi2uLGX
 OuB1BM9OSCYFdWhEoUkiGqa7nlTU4wvCYhQc4o/p0ovqsnL3ZDfS/y8r6
 4JIqqSaVfF/EpgwNir2dgsnP1Vyns4EqP7m24+iOSqD7eB3tI+uBpz0Dz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="386797112"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="386797112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 10:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="806939328"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; d="scan'208";a="806939328"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 10:27:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 10:27:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 10:27:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 10:27:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 10:27:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwYg4SpEhJB2BLpASEptDZSL0Uw9ftS36H4geewdbQ/Fa2X2Ui0fBE8LW7Y/Z6jXFCHCIsCNYu4yFV+6zJDkagZvLU6E2qX3zYAAh3EWew2v5YA7D+Ccz3Q5tlTFVOksaLT6Stv8XbQmnsSzkx/WG8q1zFOn5muRV8lE6NXe2PJUhf+NqZlhMz9d+9kNyTcJH5eAo/TPXni3tJz13PRlmD6vFFF5SJiSDyxk6LZziP+6DiGIdUFJQS3arta2pczRhg5rxlg0d60XHGHXzdNZ0hui0pohRj8Fw39hBzZlrW4vVMRlmkblX4zFy8JsAomddJq85vBI4XL/naR5CY05Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T58VnkOQLqA7fd/w4OgOQiuChTP6EbLB80ISa6BhJRQ=;
 b=MDTtMcnQDTMVDrJmlOZksG/hZYEIoBfhclYwxgfLaXeZP2t6kZRJGpvAKr5TlF+aUEYDCmKo9+HsKWf5gi9c0msm1+rTwExjXxUaUIDzohrow2jjXTJikc+zDn6gI83TeCz5kPMci3eG7ZUM3+qQIIMYqZOp3Up5HNXBqN9yzsAHVzvyJBizIRZAc0Z4wKqYW85p1CGBgLRSkZzX2udoepapydiDbcMS/AOG8hoHncCDsNQ4t0Ct3asO8hAE3uAfntri2XUzYvhdRmHzcNJJIFH0Ma5XDYBY5VIg0PZzP7EwxBkYmML13RyMyymI4ASVTm6X7PJpHrEVIjqmPYp05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 18:27:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 18:27:29 +0000
Date: Tue, 26 Dec 2023 13:27:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>, <lucas.demarchi@intel.com>,
 <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <ZYsbDPBLUiqDevLt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d9a7ff-e38e-4166-1d7a-08dc064050c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSFmrOhcbpQBosT1LXDhXZwQRNJb5wEQuhovWpMgJDhnA6nJ8Hj4vAMe2TjkAJq3S1OBWrONvIYPjGTYmDm4p3OAOG4npJU1AYAsaJlhMsr/gvD7p7nkfrG5egjL8YKNHXzJuqe0O9iYYWLrVYmL6L+u8Y1mcVM4EDailC0HRv6/Gi74MCUfU3yEamABis/36gmL+eNO5vD/2y7p+9ac3rOlUTomPzfn2a3E6l/bGjbobj6KdY7XnezOGRT49PnF68KBr5SO3DcaAtqbYj3XMok9TdQO1l79xqpfWBGjPpvJCmLrBgAlFPyGufGzF4ZndTWZ3cs9X+WL9KKgiRtoZjwsTTnZ1npByCRjOJSb476qLQKCaSBpcVPobxZHfYEmFrNb5kAf0l2ZITJK4Q0yltHF76zE4ou8K5lzHtmmOmKYG9GY1noMgXrmB21OfVwp3mHJMKkOvkuFN0/tBBeqzeIEO/XFb3wTfAVAY02Do0fsicYvpCF0E7kslAWQ7a72EIhelTMyHLGD1kzdDI1kOJOjAcB+kyaO282vUHZQPqGzDOUS955KTg/Q6r472wXiBsEE3f7p3IMnUzjPNZSIxkJXe1zb4oMo9vl3hA88jz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(36756003)(6666004)(6512007)(6506007)(966005)(66946007)(66556008)(66476007)(6486002)(86362001)(82960400001)(26005)(38100700002)(83380400001)(2616005)(41300700001)(2906002)(5660300002)(4001150100001)(8936002)(8676002)(478600001)(44832011)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iyeH3J4xWnR7KW11x8fjGg7j+CZxSN42Hliqd7ROz1jblMrYlzaWDVE4wZiU?=
 =?us-ascii?Q?7BAmpt+lSS6z4u1blNkdQb6r4ltd306OJouygheI+lT34VXGbyigkV9TCxvY?=
 =?us-ascii?Q?LSj6oFe1YpiGCJfucOUgKxXZIKYC4TPZveaQVt8ubq7ZVklXGCXgArb/BLiE?=
 =?us-ascii?Q?q7aKNSL/eZBe3cUWSpoxnWeR/wA1+jdOQHUApCz4uonI+YyRFSCX70eenUgo?=
 =?us-ascii?Q?G/w8zScBYP5m2+FsfmmNmJkgxey8aUS6TsEVdPh+3JSkxwuOcAPaRN2DWBct?=
 =?us-ascii?Q?QuJnZzzt1wz2B5GTwKDep8mpYfQtPaKpwX/wjMiZcWmNsNbqTlvjArwmCHXv?=
 =?us-ascii?Q?iIDFxZobkjrnUlWo6LVT15MdQ2KMQKUTqXz6JA87JWTIF/psgsG4tYrcEgNy?=
 =?us-ascii?Q?g7TWoLGl6bmbh7ireYha7Hy3qCKT3kTtmmLudl9qukdkYOViI441iATpbgEI?=
 =?us-ascii?Q?xvfI1cYIoKW7PmA0OgZIODMw3hiAfDvgTj6yd+a15ULgVS0KQhcmpbFy/mQV?=
 =?us-ascii?Q?scG32NOd84icnyEpYeY9XmxHrPUrcZurmTnk3+2ZUq/1vooq67cwk0DBPsJ7?=
 =?us-ascii?Q?01I0QKSPOlB7yYJPQs3peXdxxP1VZEFA5HNOxonDp9V++AwGLMNWoORRtlGg?=
 =?us-ascii?Q?N6qWaJlsiaYIsFhO/WGtQ2kmOwdKv+S4EA7/2ROhsqoSOHhr6yAFPShJYo+G?=
 =?us-ascii?Q?RkEgNaObov5P4HrKICtMB1BxX1cxOV5vDde3xcS7L1HmvjcFYttLUL/ateTv?=
 =?us-ascii?Q?fSUnoHYb3/V504dt6monXJlXpkrU6NTc++wuwCaSrE06krMt6KwqmSWK47du?=
 =?us-ascii?Q?38HFROMPxfFh3Ok3DzUHUwepiY+45ooujjx+x9b+rKuH9peQOzNU4Vhg9orD?=
 =?us-ascii?Q?+MolKHciukVQlaWnKo7GEYEalzDaW8cyRCP4BNERaQwt7WEqMAHarmEUl6i+?=
 =?us-ascii?Q?Bk6qwDTbtaz5MtSE48vzERlLoegfJU7vx8ipzNt9pnESokJqWDvtUmW/W35K?=
 =?us-ascii?Q?BXkV057GYyHxYFmOrhfbWitSJU+cfDzK8CFWDG8701n/bOrLa8btrFlksHJE?=
 =?us-ascii?Q?R5gkVqPfUEJ3fqruOcXNx6/vf+1TDR1YCNDMVKzfgp4FtapAiquMDD+nA1ub?=
 =?us-ascii?Q?yGwYvK7oIa1zMFOq+pRPf1a8wfSpE5mUMgcP3h0EIpgY8YYiFmF8VuRzt04e?=
 =?us-ascii?Q?AGUYO1q3USvDJ6EsAuy3Cue7Fs3eYqb2AHUKoqdko5scFgDqTjO1rK2EBik2?=
 =?us-ascii?Q?8tX2SH7VHWyjBAFVkdnjOpSGy7XNwxXvwSxb0L+8s5iWl399v23HcAJUIG65?=
 =?us-ascii?Q?jAwyexf1MraSVeuLGwqkmQdbbX+dvYLo9pGuuCxCDFj2G2wtrE/natWk3K+e?=
 =?us-ascii?Q?lRG7JzKr7mIlGCB5GiM/EQzjL3XiGMoX7LVZg0zCxWuZCas4QjT1/oPSt7Vq?=
 =?us-ascii?Q?HmYEr0UBto0yN/wIRTklHf0Y+AarqJ8SYAy2igGPmR8lvI1pdFZ+GJjdjFRH?=
 =?us-ascii?Q?1/wyC2zdL4UyyhVtEKDPIeJR6CxlWTOnDuBOYNgEL1l4Vce+aORn7qrv975Z?=
 =?us-ascii?Q?1wO/7SViQUPPqEg7OeJveMIdzlpUftopK/iCyHXh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d9a7ff-e38e-4166-1d7a-08dc064050c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 18:27:28.4326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpM49otKIPZqEHzXctBplJSpcUMPtuenV+VincNRAIMAAMjdNxZi/znZfEOQ0BKfBckA7lFWSccWIgClYta52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

Here goes the fixes that I had promised last week.

With these in place we should be good now with the all yes config W=1
and different compilers.

Thanks for already include that one that disables the 32-bit. I had
just noticed when I was trying to cherry-pick it to the -next-fixes branch.

Thanks,
Rodrigo.

The following changes since commit 92242716ee92d2aa3c38c736b53d8910d443566d:

  Merge tag 'drm-habanalabs-next-2023-12-19' of https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into drm-next (2023-12-22 14:52:04 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2023-12-26

for you to fetch changes up to 315acff5196f4e2f84a2a2d093000e0c6b0b4d1c:

  drm/xe: Fix warning on impossible condition (2023-12-26 12:53:26 -0500)

----------------------------------------------------------------
- Fix couple unfined behavior cases to calm UBSAN and clang (Matt Brost, Lucas)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe: Fix warning on impossible condition

Matthew Brost (1):
      drm/xe: Fix UBSAN splat in add_preempt_fences()

 drivers/gpu/drm/xe/xe_vm.c              | 3 +++
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 1 +
 2 files changed, 4 insertions(+)
