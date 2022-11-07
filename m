Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB16203D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708510E1F0;
	Mon,  7 Nov 2022 23:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ED510E1F0;
 Mon,  7 Nov 2022 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667864156; x=1699400156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M1yoZGZ/cPSUTUCTZk/5of3mKyxw7zO4zVUpJ24jY8E=;
 b=d55C6scfcEFF16Q7sz2kaKFU5IPmc0M6c3beRh5m1L6rWcAHWs5Z3JSu
 o3ZCF/F2bRLw7HBOEAxMKTexSty1sdabN5y60u2Uyb2ZP8H0HZ7Kzrosk
 ZCTG/ocodN9lsTlV1I3i7ofQFpoLtLKiDyLPg/pd/VVf3jj+jSXBPuFLB
 BblCVnhgHBJllmsmth1bW0+TafGGdp/hYonKZcJimDSZreygBMqiLM0r+
 HVlt7RgW8k4PEe08fv+dtvIMWHrG2mh2d77x+lcPpJ79A+Ly4QdzJEhdA
 fMFUc9Idq15dNQqwOD3483OepFduL7LMVZJsTi/867RC1v/FD4adDtVZ6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="311705139"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="311705139"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 15:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="881274762"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="881274762"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2022 15:35:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 15:35:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 15:35:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 15:35:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 15:35:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+JsNA7KcM+UDuIxCd3QWcEY95utj6YGqoroDo6zmhVWbpfdstOdne79DKhcyL5EXlHAIP5iRFD4dOA+n4fvwq8iZ6KFltrhtEnscpWRpQyTy/72i29pab7tKr6Swy/f8VTBcL86p6ilLt0047JwLk3O2+vBxP1FWXKETg/vPSOElZ8+TOuK3wV8VfTqLoTMUCVQUYoQxXnZD5GUhJbHTyaW0asV7WNbcfeRnV4QL/O9jDcJvBVHazkMeHI6ttojtwP5L0F0L9lW2O/dj2AsaxtQRovuyjGzuXtz0CiPakRDb2727rOLoZutzFRrkTl7k3dlttU/m3RZpWC5Vt7bjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwYwvwwHYaQU1Ry9LaAFpK4JUeqLTQbPXwNGuBd8eek=;
 b=SYEC8/wzlH8h5CXrI4YYEPa7dM2nmr5CWUCK0xf3F48zc+YO0l9sWRD7+vCOKOpdpldvXRZJNsIBOz8iKhie5z17uGAnQDyHm6s8W37zFcGUt3EtwukF74wVun1MnWubrkp+PTpZHUy+RDvxWTnTly+CM77VDj6qz1tRNr9xQxV//MMDMRL0em0Ws73LztzWvqyFa+y3dWkzQqaGGwaUN0b4fWV7loqLtpa7n5TcsLj8r9f2elDrZn0SFEKI6RCqg51YGa0LqPtbvBCkx4ZtTQKdeRHLwlldivcRpWv0Fh8ijjPwK5ggmcaoN18iSXxXDo5YAaGBktxiwwuUjU+sBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 23:35:53 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 23:35:53 +0000
Date: Mon, 7 Nov 2022 15:35:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Media GT and Render GT share common GGTT
Message-ID: <Y2mWV6zMqlfIC4H/@mdroper-desk1.amr.corp.intel.com>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
 <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
 <e7658756-aee3-5d29-bb8e-6d652cc89c88@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7658756-aee3-5d29-bb8e-6d652cc89c88@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 6081c280-8e2e-47a9-3ed7-08dac118cfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xqAQgGBKvbNj4lL8upclUjI/4rB9mfx4EirG8+EdAX9rIBzA7jgzazyVZ8Xf9CfLdCxwOCiIkCqfbCo74622Bn2o5Hh3+Aii+4AFTlMIvSKI2S/nQj+YHkid4jHZEeKF0TrWUn49L0PsR4rGB5xe0mGfCqGSfngNtR+qI7QxNsRztY0iN71VsVk4GIrDyZDM1XbTzW4GDXuBvP42DzIJcf9bcCgjN/Sn6YEppmSL3sMQgQH/meBeJhCZhUOilTEuduAgwMxvWD41EIgEgHfkh3db3IaPyxvp+zqPzhAxM+LaDP9ZPPgHrFRxgx7vEe8/nLIlhRs5M0vljPP1m+a4A4HVw+OABUIxJjLnsRaEJ/wczLaFnNMofWuHqhyzvC69n9Mq17HSQBYMtU9z7381cnRNXFJgF9WPAnauG2d5RWUj23gmjlkJw+2MGFv3NddfAMcV0960pI9l1T8LNZ20z1UAA2Ey3WCvjsgzA+po9hM3YrwC6TDxfNNr4u0HEjtZ+4UZnlsCzHSFPvNR2HjY6txWFPGz+gPrsrQT7SePjhpHTE6UWJ0KPWFMqOC8n5pcVnEaRk/4qLqacaDsC3o/vi1W7ZuaazyN1vfD5NElVyJ4U2V6jN4Tf+Ut7oe6vJEgJJYHv6xAlDYxdxKjIcenysTI3MPYC3xt13madUTf2oH/mSBJhBVWqXfFhRrHjDu0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(186003)(38100700002)(26005)(6512007)(6506007)(53546011)(82960400001)(5660300002)(2906002)(6862004)(8936002)(478600001)(6636002)(6486002)(66476007)(41300700001)(66946007)(316002)(4326008)(8676002)(450100002)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7/Yz532ny5GAVDjZoaXzsYu4txzhQikIo8SdhXNXfYTgYoaj/oXgQMxQjuq?=
 =?us-ascii?Q?EYXbSS/44/sJ0wLz59AqwxjFWITNWO7+u3/Mjl2R2ffw1wNdJoh/+0N9PLnV?=
 =?us-ascii?Q?CZnLQ3EHvMNI8MIINZ6UWXc0Z3oXBflLKA1w8BrQLZYiihNhZsgt5Yzz/kzy?=
 =?us-ascii?Q?ZXpYFpoS1ZnxmeJgqX5MlrMbcl8TSjPT8cljBK+k+vqqeJmBn3NoQfC9Gd2n?=
 =?us-ascii?Q?6zwtivsISofKbEPQJcSKurwy1tKt/pJpRyVl5EG1ZJ1KtP//L3X23W1AoW+6?=
 =?us-ascii?Q?TiRYVkJ+T1MPX88Ot7g5VS5uvPnmCLCQNFO7HK2sGgIw2pVP71mUlWwWiGXH?=
 =?us-ascii?Q?oI134drOfyT2+oKejqtmNg/4yTNx6wavQ/G3XNrXQf/IFRDTXzWAlskqlB8m?=
 =?us-ascii?Q?AqucJxBy6G+DXcVOeOVuMb0tXvqCTwzJB2d/o/eGkWMvyetgv5JleJ1Tx6t8?=
 =?us-ascii?Q?415+PiMvtgZ69ZYn0zApMaEvcm+92wZybYclyULB5t5sqwofcNG9P9WYsVA/?=
 =?us-ascii?Q?lCUmUTw+74MWyOSLjJ0mg7KNfqJMAo+8Ofgxrrq6OU0V6exZIS4bqwl2MLO9?=
 =?us-ascii?Q?TmzlVmvdZnfxB+c7WrB76iluAXVBIzPvpcFFOvABaxvSg06qJRmHEjK8tsKc?=
 =?us-ascii?Q?Qw6x9e+BI9j083lRTwUenr1VKVS76lrvmYtUbrPI/KMhOWub0PpAUWKBjOsp?=
 =?us-ascii?Q?F4YFe+SjJAXiD3QWytJ5nUCHA/SdYYMIo27wKvAS9drdQEtICJZ0yveVtNJc?=
 =?us-ascii?Q?QT39hwrXsE+Xp0lzy28xONC6dxlucZeBBKlJFar7lmYipqfJyJs9RTl0dVmd?=
 =?us-ascii?Q?7Oyz47Hl/GzfLiXtNwA/mLQYh0G6AnCUqNMDWxBtZv6p7y84+kAQBIMplYRw?=
 =?us-ascii?Q?f63m09jFRCEmE89Z7Yj3RDu3/7uB2epqXjJXSngzxRyPJ0ZRpobHGYFCDXAj?=
 =?us-ascii?Q?kvwrXGqXmjdNFr1RgulCaPGFN86H9Ol6e7oTKf0h9Wi/bKpGX+c2MuVeGbfS?=
 =?us-ascii?Q?Wu2xDx+57WT94q2POqFGu5A1D+cJPCn+XCyFSrcRb81qFzNZIPALir13BtMN?=
 =?us-ascii?Q?ieIbHCOfKE1aqBiiz0Veh0nPzSxiXcmgkMlYUtKfqMIa3TkqZfoz5x2zoHu1?=
 =?us-ascii?Q?29W148aiA9ztlH4OVrx2NlrlnWJkNbx3Iw0EtP+FcAP3gRCqWNVjeqfLtZOH?=
 =?us-ascii?Q?rFhULq5sK2gwnSt4KkG4NYzZ1fj6ZQRavQF+EJxxtC5Fd8BASWsX8XQ72R/I?=
 =?us-ascii?Q?2T3DRMQH5rxu0zISC0sdnhbXRLFt3KsK0TdCd44pk2+7e7BCLv98PF0Pnf6I?=
 =?us-ascii?Q?m1/5Uda14+DdLHbhiS3DoiUdPd9Bpagd+wLdZoDZ7rxHNSaGRF11LBhqhims?=
 =?us-ascii?Q?j86QmA2GU4uFtXhB+R6pvek4PWh8Tm2+wPmFyp6fB737XSarfTk2vroDo05e?=
 =?us-ascii?Q?2Uw+xcVEJYqcENce947UI9W9/Gz15fdXvb+C7v5+nGLuPpNAUTgX7raFjEDt?=
 =?us-ascii?Q?vG6NqS2MQeNFPUKtw5TLMPVoCDYfFPv9AmyEkdQiIqIwdsI7ej7aOmEtNpuF?=
 =?us-ascii?Q?HQ66b3hDb1P0XG8+pJInInvr0JRmWNPL5LV2vSmCRnbG0Uu6PZjEAmjZl4g9?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6081c280-8e2e-47a9-3ed7-08dac118cfb3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 23:35:53.5759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqUkGAuWkApCRXQYbUQ49ayJeEzmirJ3gOuNdBGHZ+FHMSN/M8AtqfqYLH/FTDE2D/OhXUzv5j2arCk5wsH0368asLcPaf2v2Wgvp9+P8no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 07:43:59PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 31-10-2022 23:16, Matt Roper wrote:
> > On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
> >> On XE_LPM+ platforms the media engines are carved out into a separate
> >> GT but have a common GGTMMADR address range which essentially makes
> >> the GGTT address space to be shared between media and render GT.
> > 
> 
> <snip>
> >>  
> >>  int intel_gt_init_mmio(struct intel_gt *gt)
> >> @@ -965,6 +973,9 @@ int intel_gt_tiles_init(struct drm_i915_private *i915)
> >>  	int ret;
> >>  
> >>  	for_each_gt(gt, i915, id) {
> >> +		if (GRAPHICS_VER(i915) >= 8)
> >> +			setup_private_pat(gt);
> >> +
> > 
> > Since the term "tile" is used for PVC-style remote tiles (which we have
> > some framework for, but haven't enabled yet), it seems confusing to have
> > the PAT setup for all GTs (including the standalone media GT) in a
> > function called intel_gt_tiles_init().  Maybe we should also have a prep
> > patch that renames this function if we're going to start doing non-tile
> > things in here too?
> 
> But isn't GT and Tile used interchangeably. Also, Could you please

The terminology has been used a bit inconsistently so far, but I think
we're trying to standardize on "tile" as referring to the PVC-style
combination of "GT + LMEM."  So I'd consider MTL's standalone media to
be a "GT," but not a "tile" because it isn't paired with its own lmem
unit.


Matt

> elaborate what do you mean by non tile related things here and as i
> understand PAT are per GT registers and in case of SA Media the
> gsi_offset get added.
> > 
> >>  		ret = intel_gt_probe_lmem(gt);
> >>  		if (ret)
> >>  			return ret;
> <snip>
> 
> Thanks,
> Aravind.

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
