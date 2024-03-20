Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAA880B01
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 07:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC5910ED6C;
	Wed, 20 Mar 2024 06:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsB5uX7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90110ED6C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710915008; x=1742451008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pOinMp71eRy/ae4P0/8Os+JSSOGqOOKnSI9Z73vDoxo=;
 b=FsB5uX7Q1aR04Ke52slraZIamG0HJortlXYAW/7O5hzXQNe3ln1P5Nmg
 NRdC7M3T6XF5yacvTYxnXV15hH7d3Xz0sW/Wr8gLsVwsBpIvBr5+AMo7d
 Axj/+w1yUMcSX9vTxk4z7yP9Xzanh0C9f+WiM6D3c1BdUZTbylSa+r5uq
 JQltAspw93MzuwsqtJeddmn3KrPzufNP2/MTepp3GGxCI1aTEvPk536sO
 McdV/kTg7nRTM8cjng6TT9mrTmGivdBPou+9Rz6/ZVL+Mq7aG75h7uIoJ
 Pp8Fb2aWmeVNC7glbAxD/oebEfB2Afpz/H4hADAFxsLcs3qCH4F2ZHw4g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="28296111"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="28296111"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 23:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14702306"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 23:10:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 23:10:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 23:10:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 23:10:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjkdp83v3kHuvhieifWm6viYdjWBCMmSai0ilhndu9jRfuRQBqygWaiIT1pRfoAWXgtMVKxxbMzKcK9L5tbM2Elz6tR1NAq825myY2xy+su78QkeZQCdX+goaLxlsCPcHf/YStDlbYNwpNYtbw0busCydos9XB3sSNUSOyIAyHTv4ko3bX/Bdh171gm4jGTx2osNtyPF7wmVlIwUkytIB4wPhnVuNb43LmfLePmO9gn3UUeGlZ7fqsY0tHYbwm4MmP0lvSggeJpJVdt9BoU1wG5S8cxzkL/lST7gjLZs4VTQSY66EGNNowhbkVlhh8/1urWdDG2fw+FtDOZqxu8Y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqX5IWXvPdYkys541wZ3BLxlAW0a22TL6az00ewWzRc=;
 b=E6RhAY9AGHLBa0ljCCwS9PfboetQGF2PcO/WRE82uwf/GdTpMicMQpjP0yONbVp8r9A9gkYlO+DqMVTTY6ddqPaTQIZl9zO08kqfJY+GVIRvd7Y7klJI5uz7kc88GUSh7sy9wwA5etb5LG0kOlt+7Atq4krw3hT5ZGhkRENsG55QA5ygUJHrx6EBFuKgLSCC0V8fgjgsTjJkd8o9lCDtlQxeLfUFt2zCjSjXVUyCc236OSQlsLQLK+TV5qBXJ2iMB3D7jticC8XgVq0nxc7loXJCsjODXWIX28vZ4aIInnVl1M1yHxZLTqf2Z03MqSK//uXhotfYPs+IOc+DXu9/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by LV3PR11MB8741.namprd11.prod.outlook.com (2603:10b6:408:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 06:10:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 06:10:03 +0000
Date: Wed, 20 Mar 2024 14:03:17 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel test robot
 <lkp@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <oe-kbuild-all@lists.linux.dev>, "David
 Airlie" <airlied@gmail.com>, <linux-kernel@vger.kernel.org>, Michal Simek
 <monstr@monstr.eu>, <linux-arm-kernel@lists.infradead.org>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Message-ID: <Zfp8JZlR6EvM8yHt@yujie-X299>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
 <202403161704.ACHJdSJG-lkp@intel.com>
 <ce1190ad-27c2-4a16-b36f-442c0c419dcc@linux.dev>
 <20240318175032.GM13682@pendragon.ideasonboard.com>
 <6b44c9b7-e1e2-4b69-a443-4616ceab6f17@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6b44c9b7-e1e2-4b69-a443-4616ceab6f17@linux.dev>
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|LV3PR11MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c03ba1-d414-4327-23c3-08dc48a46197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5yf7HwXw3KBXieikO21DMWbbnuUF1QY0f3272gN3uxcLALJG/CVGK6sTYMxcjPrwoO3gT2Y1Jc3UUdnE7BfVzdwHB8BD6gZC0YexhXj8jbiPVAdRhAQFa4hp+8VK77qIJqM7UqTQeZFhzPtSM99yC3BLa6hxqO9I8CBi1RNQEUnOiBEAlV6gDCLksVUU3ekVI8IlDJtyB6nD/wcDpkZTvUMBTJJ9D0EpFobhSctCrOF1I+MrMKRdp5JnpfogdDFBBZHbPYPL95XeI4+gIttz5vPNxwa49l3hTvJKqmAWlj4MkqdoXM05mYVYx6zFXaH+wNoOWaT1jr878IgFfLsQflofVTrLH9arw1Io+8OdUppMnXLDxRXY8yEgP6jM4Wxx9Qr4jJPNIdcf8gtuGmm+RN9EoAPoSvNR60ayt6jWsxEEWLOQ5z/o/w4vNsaJ8FlLSOmCkhPCQeEreKfPdZf825/8ZXW0Bj0GUnUxDO0DafCgK4g7oJLIa/q5wmJTb7ytmhrsJIjNyoyx6L79v0jOY4IQPpsUG3x0W3z9d11yxLSPa1GDSE3Ly0w27DmJuhw5JEkKWUuRs2XCCX/aLuW4HUZcOwKCAkjjLGcGnKijqLUBeE5y2MGUDzzCCqZHcCO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sSclp0qNPWeP1BqJxd89Eutd+ee8acT05j3VkTnSxXOixDGtia7x+sCsmV5?=
 =?us-ascii?Q?i9TrsD6QR8hoCy3vvaRk3UHy4A/7eXywcjYcxXkMtm6OPyAOOVxaUFdiRki+?=
 =?us-ascii?Q?aedqt9CMUQjg5uNUUXhRzs9w/98Ap7zJQ2Md5jdR8WR9OJoP1QQNSRsmGqfk?=
 =?us-ascii?Q?PachmKXXEoiuxRHfKjxmq/kAW/UsbXVcf26Evcy1Gr4GQj+cmKsQf0OWLO5E?=
 =?us-ascii?Q?fYyk1c/opevmIo6tCqyWHe4X2XL9OEvo8YJwB3Tcp5rf1Rkl+T51VReGDJ5Q?=
 =?us-ascii?Q?iKYD+Jc7yBa0wjqc8zNcMjs05DHTe53gnZVDXASa07pXjnrbSsMYHEw+gRAh?=
 =?us-ascii?Q?/eNDSUZUIEBqnV/xU/2GvqZ33oGWZRR8/yyIifOfPXCNqzwBJ0k3bDKbP5qZ?=
 =?us-ascii?Q?Erc90UtgWroDpXMf9QRX3qel75p1ntbL7vRlzkNigLZn+dODrhC0wq1Pv3oD?=
 =?us-ascii?Q?0BKG+DDMFWZm10ltR1eeEmNwbIbL3v1j6UzAJ/IXsiGFD6MJvsPD1+JDhrvC?=
 =?us-ascii?Q?JoB7vGpXqPuZpfKmWFePe2OklXrNgDYxGxHdNSK0FE6JJGF4DPI2vM12yqxW?=
 =?us-ascii?Q?GtE/UnBaKnllxsKJSW+NMLOBBf5nQbrJjT4ZDt+n9sC0eFdg8jvn7qy9bCgj?=
 =?us-ascii?Q?VABywFlCRwEp5eahmIt03z9FHQRjBrFRc5diry1aKfSlooPyPRhwRYCSwGN7?=
 =?us-ascii?Q?wZeYunb2KytlCf8dCgCRZD8cAFV42myfnB4Xpo3wUfwSNVK8aVpguhkMvMia?=
 =?us-ascii?Q?qi80lW5GdZA525bX3wWwEA9IQImKRFR1Y0iHF7j9lC54rzIFSfZ5/9T2zMHy?=
 =?us-ascii?Q?nLqQt3GF6Gr3pywQNvFrwTF1QIWLWTzXpcL3OUN1RWYya+PBdRSVbbbbrpNE?=
 =?us-ascii?Q?/v9ICoWk84XdrJV/SS5T4WRFCFseWuE+th/LvbhqLwFiaw+CdS6RtLgfvuL6?=
 =?us-ascii?Q?gc2oJxl8/7fA+qNqE8+nFzENb2B0BeuiPVQpehFmemgsJaoPaIcAlxxSU4PB?=
 =?us-ascii?Q?HJz054wcHtAjlVXo2XoaoCcuhJuMT/R0C2jeVQD37N974Lq/aF+lxW9y6ldc?=
 =?us-ascii?Q?eisjW2AOWYSObRhwCE7xSDkAzMSX679V6mvcxlPhGMbyOmO1c+r2/yxGKm2p?=
 =?us-ascii?Q?bZgX/7dIU2gYtBzn/P0gwID1hTLt5WiT2QxTSK6bOvHQT+5XsEKFjjoJJqgE?=
 =?us-ascii?Q?J9Fv2Iw4zeKB93b3ICXcMyruiOyyg7waC2OFm8vpnBoYFy3JKPpAPhZHOjwM?=
 =?us-ascii?Q?xNcraOjqSl+lh179QFSC2UzOw5Vry07S5CWrqvKaw55SigbaNwBoKD7xTZcQ?=
 =?us-ascii?Q?YUHHPmbVBPlms6tGjExU224wL/cGI29MDgppzz0lHfXPOFd5wjEsT5l58aAY?=
 =?us-ascii?Q?Al3Wkj7DUub+7UPZCnRRL8XBywpcEzR7bMy+D8zJ2ZkkDaNb1Chi8wrfHO2T?=
 =?us-ascii?Q?0pR2H4spvYoB7BEBDrZgzaZZcKSi2ZFqDAfO6rDAq51gwU0H4x1g1PE7BcCa?=
 =?us-ascii?Q?hbWVA3j5SbVQRu6E3QmB4ez9iKDjGhaj3Bb0PkosUzsJcZ/k63T0frwzWi1h?=
 =?us-ascii?Q?Vu4tpdS2T1KjpxjCClIr+l5V6wnhgudZ2l9nXwsz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c03ba1-d414-4327-23c3-08dc48a46197
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 06:10:03.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbWe6kXGjOLtldINKY3s6CVoXokxkjvDgNxCVVvU92dvSEbxxa4Pu/uyp7zgi8oX+gSeNk9P1LOp/tKAaiFhCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8741
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

Hi Sean,

On Mon, Mar 18, 2024 at 03:05:57PM -0400, Sean Anderson wrote:
> On 3/18/24 13:50, Laurent Pinchart wrote:
> > On Mon, Mar 18, 2024 at 11:06:40AM -0400, Sean Anderson wrote:
> >> On 3/16/24 06:14, kernel test robot wrote:
> >> > Hi Sean,
> >> > 
> >> > kernel test robot noticed the following build warnings:
> >> > 
> >> > [auto build test WARNING on v6.8]
> >> > [cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
> >> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> > And when submitting patch, we suggest to use '--base' as documented in
> >> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >> > 
> >> > url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
> >> > base:   v6.8
> >> > patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
> >> > patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
> >> > config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/config)
> >> > compiler: microblaze-linux-gcc (GCC) 13.2.0
> >> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/reproduce)

[...]

> >> > 
> >> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> > the same patch/commit), kindly add following tags
> >> > | Reported-by: kernel test robot <lkp@intel.com>
> >> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403161704.ACHJdSJG-lkp@intel.com/
> >> > 
> >> > All warnings (new ones prefixed by >>):
> >> > 
> >> >    drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
> >> >>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:31: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
> >> >     2168 |                 sprintf(name, fmt, i);
> >> >          |                               ^~~
> >> >    drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:17: note: 'sprintf' output between 18 and 20 bytes into a destination of size 19
> >> >     2168 |                 sprintf(name, fmt, i);
> >> >          |                 ^~~~~~~~~~~~~~~~~~~~~
> >> 
> >> Not a bug, as i will be at most 4, which uses 1 digit.
> > 
> > The compiler can't know that. Please fix this, there's a zero warning
> > policy.
> 
> I cannot reproduce this with GCC 13.2.0. So given that this is not a bug and I can't reproduce
> it, I don't see how I can verify any fix.

There is a "reproduce" link in the bot's report. We followed the steps
in that link and found that the warning could be reproduced. Please
notice that this is a "W=1" warning. BTW, we also tested the v2 patch
and the warning has been fixed there. Just for your information.

$ cd linux
$ git checkout v6.8
HEAD is now at e8f897f4afef0 Linux 6.8
$ b4 am https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson@linux.dev
$ git am ./20240315_sean_anderson_drm_zynqmp_dp_misc_patches_and_debugfs_support.mbx
Applying: drm: zynqmp_dp: Downgrade log level for aux retries message
Applying: drm: zynqmp_dp: Adjust training values per-lane
Applying: drm: zynqmp_dp: Add locking
Applying: drm: zynqmp_dp: Split off several helper functions
Applying: drm: zynqmp_dp: Optionally ignore DPCD errors
Applying: drm: zynqmp_dp: Add debugfs interface for compliance testing

$ wget https://download.01.org/0day-ci/archive/20240316/202403161704.ACHJdSJG-lkp@intel.com/config
$ mkdir build_dir
$ cp config build_dir/.config
$ git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=microblaze drivers/gpu/drm/xlnx/zynqmp_dp.o
...
  CC [M]  drivers/gpu/drm/xlnx/zynqmp_dp.o
../drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
../drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:31: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
 2168 |                 sprintf(name, fmt, i);
      |                               ^~~
../drivers/gpu/drm/xlnx/zynqmp_dp.c:2168:17: note: 'sprintf' output between 18 and 20 bytes into a destination of size 19
 2168 |                 sprintf(name, fmt, i);
      |                 ^~~~~~~~~~~~~~~~~~~~~

Best Regards,
Yujie

> 
> --Sean
> 
> >> > vim +/sprintf +2168 drivers/gpu/drm/xlnx/zynqmp_dp.c
> >> > 
> >> >   2136	
> >> >   2137	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_rate, zynqmp_dp_rate_get,
> >> >   2138				 zynqmp_dp_rate_set, "%llu\n");
> >> >   2139	
> >> >   2140	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
> >> >   2141						  struct dentry *root)
> >> >   2142	{
> >> >   2143		struct zynqmp_dp *dp = bridge_to_dp(bridge);
> >> >   2144		struct dentry *test;
> >> >   2145		int i;
> >> >   2146	
> >> >   2147		dp->test.bw_code = DP_LINK_BW_5_4;
> >> >   2148		dp->test.link_cnt = dp->num_lanes;
> >> >   2149	
> >> >   2150		test = debugfs_create_dir("test", root);
> >> >   2151	#define CREATE_FILE(name) \
> >> >   2152		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
> >> >   2153		CREATE_FILE(pattern);
> >> >   2154		CREATE_FILE(enhanced);
> >> >   2155		CREATE_FILE(downspread);
> >> >   2156		CREATE_FILE(active);
> >> >   2157		CREATE_FILE(custom);
> >> >   2158		CREATE_FILE(rate);
> >> >   2159		CREATE_FILE(lanes);
> >> >   2160	
> >> >   2161		for (i = 0; i < dp->num_lanes; i++) {
> >> >   2162			static const char fmt[] = "lane%d_preemphasis";
> >> >   2163			char name[sizeof(fmt)];
> >> >   2164	
> >> >   2165			dp->debugfs_train_set[i].dp = dp;
> >> >   2166			dp->debugfs_train_set[i].lane = i;
> >> >   2167	
> >> >> 2168			sprintf(name, fmt, i);
> >> >   2169			debugfs_create_file(name, 0600, test,
> >> >   2170					    &dp->debugfs_train_set[i],
> >> >   2171					    &fops_zynqmp_dp_preemphasis);
> >> >   2172	
> >> >   2173			sprintf(name, "lane%d_swing", i);
> >> >   2174			debugfs_create_file(name, 0600, test,
> >> >   2175					    &dp->debugfs_train_set[i],
> >> >   2176					    &fops_zynqmp_dp_swing);
> >> >   2177		}
> >> >   2178	}
> >> >   2179	
> > 
> 
> 
