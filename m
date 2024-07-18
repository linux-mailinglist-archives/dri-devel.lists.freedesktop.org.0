Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3593502D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 17:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A841510E18E;
	Thu, 18 Jul 2024 15:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu0aZwXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E1710E025;
 Thu, 18 Jul 2024 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721317906; x=1752853906;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=HNfm+mSO9U+NGfHLSoEgxf+dmldBCoHgDRolt1fs48o=;
 b=Gu0aZwXuVonGi2orIhz74jOpUowTyCfp/REhPI8SOf6uuKxi0TDeVQCM
 jicKaIJo0E5pojGgk/fEabZu8QKx3gnkLo+ykmVKGj4lJm+O+uIZj3xXD
 iLCyooSYcB4fj09azInVvZTYioU/4UpGwJHbJvx8wpGUOhk2Klupc+sni
 cQ6DoZXPSclXhh0D3KJcAQmcF8LXef/xfXA2aVYaU1IonjRp6Hk95kSiN
 wbGQSp/027XjNqBCMNnYVyOr1DAj6e3fk9DRkoLxQ3h6PIZvoJCNCUg18
 J2FXw77IR1yEvW7rEgP3wHh5G9qyGpLqoeAGZFseVp6SJu/pIaWCZKmVr g==;
X-CSE-ConnectionGUID: Ul1odgT6Sq+wgYm6eLNV8A==
X-CSE-MsgGUID: kQjEpqaITYK8bKqGLj/0xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19022853"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19022853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:51:46 -0700
X-CSE-ConnectionGUID: Nsvzmt7BSmSddyWnkeCanw==
X-CSE-MsgGUID: wFP0Tnh1S+6GE9ZbO8jWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81454805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 08:51:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 08:51:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 08:51:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVMxEvrRxf+2fFTKSmt6wG/eqyfhWcwximzrz4CoQpxw2wO4uEa2PQNs7UMndEjxkA5FBbMyVMLivRUHx9Qvb8wurgMdmkQa40uvc+n2P/42h/+2NPGtbYKk6Uvsb5a8uHHnUsYFjxJXldmbe8j+PmFrhVqI7Ai+xPITbBiy9neweU2kIFdDYYLkJcAQMGQ4xPJ/34tQjA7xS3vIaG/f+F9poak/NbUUT9SVHm4Ic7F538klwkR9IAKRlpLv7XeLY45ROxuqXo74ly62E7jOGYf1BxO01u9NFEEOgyuVm7pphQVbVPXjNKZaJaPUpWSvXB867vGWqA250TywxOMHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZz9/xV8GwzEGzaCjczBJKBAI3kGrnQRnFe+ULOGQtA=;
 b=LF+jqJeEYPbx1yTWRgsOMgPM4vfmjuAU0QnoMfOLS/JAJAHOyuM36HeYtJb7y/I6iiFmXX24EGF1bUlC6M1qfdZzxV/9w6lJugCzLGkamToz8E6lO2/LfMyhx4leT+ALZj1PZqcoaDkXC+lnZhrV6XypfDtMk6f1kebWoVCW7B/NUWTfymttHlBIVhKBFJk/RwjmVqHzaYhfA70HFN5i2P7rQSpsh8CeT07zk2tp52EkqY5r6ZqWC9cJePnAI4uZ0443q0LocBCHPvxKYMGol1i20fFBra/7Swd3YFJFyPD55ehC1joaI3o71j8PjDU3/esO37/D0gxXXGQF6W0o9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 15:51:42 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7762.024; Thu, 18 Jul 2024
 15:51:42 +0000
Date: Thu, 18 Jul 2024 11:51:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <Zpk6CI0FDoTJwkSb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 325c25c2-013a-455f-7fae-08dca74184cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LCmPFDGrncFzJDHXGBojJKt3SC/pRsmR+ENVzD5X2Bi5dsAhoeTt1TfjWRow?=
 =?us-ascii?Q?Zl+cVAWDX1qiy/3+QZvDudPeQ7Xcon+XqGF/1MFY5t0T8rqCpDI05I56XkBd?=
 =?us-ascii?Q?NW0dQ9T86tPrbf8d39mfK3Mx2Tfbhvz4E+dKhTbQ3oJ8lrm+N/IPNgVrikGW?=
 =?us-ascii?Q?vSzGKNKdfb8jOITxHqvVVuazkah69IvioqnMmO5FBQ19PdSHylOU/VUV58IF?=
 =?us-ascii?Q?GGO+6SZEJKEUHdx0OFZGYmFJaVymp1P3mqve5kHaPqAnvZ0maV9ofIsTfEJJ?=
 =?us-ascii?Q?qz4bJwwogWkaT0irS64XWFDehELu4IAJA7Q390+n3tlX2jRCWgn47/Gs6U7T?=
 =?us-ascii?Q?Ue5fm+D1foeThTMw8dlqgi007qp73IBHXPFIJS+28KcUlE9pYfcnVqK4VWNk?=
 =?us-ascii?Q?niDYSsdRt0v7SQvopXkbbCFI2NXMQouW45WoXeKJklLHPKFBKFbDbok7YI46?=
 =?us-ascii?Q?61p+MXclxV9mxw2iasqIl7+YX2hxiQ7Qcm5vIP8k5m6YvwJBqMTdm6ixnra1?=
 =?us-ascii?Q?tfZvF+N4LVNVrHs2KWnxpQSgUtBC288+VmuK0xiDuI/nGYT0FaeHxubNSOFh?=
 =?us-ascii?Q?L9Txxi5QP9xD75TTtFLdeQsIF3ilXssrcKycz9MRqibqDmdITe3tTYz7iaCH?=
 =?us-ascii?Q?EFpt/cE6/syGmU7Zb9TTkN1p4KnLm4BzyfMwIk2VEzJPWgQXCdRQj1lRgMzz?=
 =?us-ascii?Q?ROM0WxDT7gqbYSR442RIbDB4SLUMXTFNvgsXag2j3wOmjqEZh/WCp2dmCpNX?=
 =?us-ascii?Q?zuMQp4ntgbCfmqEldQGtRBoiGJb3MxMOPQn5WNY5SE/QD1cxGAvyptXTdGYe?=
 =?us-ascii?Q?aaZXM0SvMFDJchz5/WFJAX29fhxRexMfiH1V6HOe8J/O8WfJS0kYOu2T9eaz?=
 =?us-ascii?Q?wM+eykG4BfMXngMhS9dkslGYUOeJH4C51MmOhEHBAeDST8WUY0h/xmT4Hh71?=
 =?us-ascii?Q?rku3tvDn0G1CZHBjuLA0xxH5rvcP2OUR1w6sR5cWBemi3E+7PjaBDyYUX6nc?=
 =?us-ascii?Q?41E/B/M2Acsdg6qRvdINqGKD1s59GDAMP4rwadoPtJppPEeJVYNSJ/rJPI/Y?=
 =?us-ascii?Q?F151y8uFoph46TptYiME35MfoA4jXaDqQYPBdyAtgyAhwRK0jbZpmdOtX7L0?=
 =?us-ascii?Q?QAimbXnyToaKq0XBclV23+Ghh566tQcTxs3SbFB36ngPP+VhZr/ohZPamTDx?=
 =?us-ascii?Q?VjC1cmykbVyxQg9HQhGWfLV/N47UUnEmcGcD9O1yvvI53ywELTwTV0zvbnMK?=
 =?us-ascii?Q?AQJFdQhZhnJsS2MWECL7klchAbY5mVOLafdu0sL9ySX/Q+mzxX0iKTDQt5j1?=
 =?us-ascii?Q?Y9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IixJBVLlK8zBktxuSsy2mmm3YU3L+80/FFWHukZ5+wOb/ipHt69QwfN7lH0S?=
 =?us-ascii?Q?iJxQIIMgsFfs7t9wdFOgd4yTEprQOyb7KEXy01XpACVvFOYCEf44c6YofRIY?=
 =?us-ascii?Q?L+Ae34PZNWUBojzFEQNXhaZ16uJGTGLnGHBW+Xe/lF6GPPfZqS9jJcgdmNAq?=
 =?us-ascii?Q?gKMWDdSggCx4FT+9pGfKUPTQIL5nlWPDLoDAqxKXgRKJoAYAfXKuFTOf8auG?=
 =?us-ascii?Q?+01qf5+gRszd86fHg0MaIgCtBTVJ9f6P5RlK+CyoDuj1QmA0LaBJ7q54EKOA?=
 =?us-ascii?Q?SMIf9NVHMwj/d5PdWcACZ4R5l33lJiBulKszNyKuRrpV8jOqkpoxq66N8nUR?=
 =?us-ascii?Q?iVXZphSlOleEQA8ERijAe8u6D6ybtsM7EeWykiD0ft/cBya1jR7CZIGx5yK9?=
 =?us-ascii?Q?A3zi81z58vOGnh74Le6f8agPGJ8R307Po8etdqX+zmggbpzdW5xY/g8jBmqS?=
 =?us-ascii?Q?/c2QUVGAKWrSAqNYK6jyOpOaKjHAMzkMrCK35SZAGMKBXMoP4sQ4CJuhAvFd?=
 =?us-ascii?Q?hVqh2n5/W4IHoX9UOQnvYrFVl7v+fnvGLz1lPUHOzO4KU3al3fe0RLxNBqkq?=
 =?us-ascii?Q?Y297533pcQOt9SdZlmBIVubRoxeoISPsUrdjFqE3sJOvrdOQtI2VTJzw7LDs?=
 =?us-ascii?Q?pXlHuX9zhkbTkzYibGStPW4PSkxkO/E4mSPq2hgLlHmJEAn9h/8UjL1m5Cpt?=
 =?us-ascii?Q?p32ThaX37YbjmtM8IA7fVSwwVS/VC6TFrACFRgjuZh5+GK7eBcjOhJN6fb+A?=
 =?us-ascii?Q?dwkBJs1/naPtWW3nsDSv68sqlCc2MbC2f6i3304/7fHuxvROMGn5f6VlPFbT?=
 =?us-ascii?Q?wMFC/DomTK1US0u3+9DhEhQHOvHk340/K6F12HVRkSVgBIq/wy7PUOoZkwj6?=
 =?us-ascii?Q?1k1+hS8HIFTaJJ8ij5bzcXqgKjb65Lf2+LPa/U3nCjR4wrvCStUC2fUSSRDJ?=
 =?us-ascii?Q?1Te2lMCQzLHnzUv9MGT6OlvhA7R1IAb7hu72uR71fI2rZapPtSq9Vkd1mcEl?=
 =?us-ascii?Q?0QdMbwt641fofHq4hp6n6DVpENv1ntmTnFZHIysvUyssBHuFkM2ALOt3fQat?=
 =?us-ascii?Q?GuvhIxPr/vQhmmJexzMXXciqW1VfpllgHnUJrBAgZ5EObCHR7GKRJ6z1qQaG?=
 =?us-ascii?Q?4YRd86+l90zO7KFcl9TPZ4g51zgjanles3vwQVqp1Xo2aXGYr6UUNjcVO9pK?=
 =?us-ascii?Q?+gT3JuLUAkwnxdsQqNPJ4sEn73sReaJ5INBV3fRgI/26US2nkarzCmCaVXB5?=
 =?us-ascii?Q?G2K+WsD+t9jKON/2iy3qMdmNood05ZexrKc8oHJlB/2Nc3q+0Zn4sOq0oDj/?=
 =?us-ascii?Q?FgezwkoIv5rxK8ACJmgJ7Uc/hGvlCi//XwJbERFQg4uU7VLBwukqSEUElx1C?=
 =?us-ascii?Q?ReiZq7G7B7jBdQAYGnWHPH0XKn9JO7SLWpM7JJfZNaiqCp4I94w+UuAUnHE5?=
 =?us-ascii?Q?jr4dBDBzSy4E1N0jhHFYIPA/IhYof0AJ1C9rW97IJSCAOBT5TSWjlUrBglxN?=
 =?us-ascii?Q?KlKk7KBmD7C9i82eO7oPGNk98+mW4Wcpv29Nl0sziTset2EfNreNbsM//ZRd?=
 =?us-ascii?Q?cRlNI6nEhpOJkJrKbCK13IYSHhDVGxcMd/qFO1l3Xzz1zlnN3JZxpg8LnGtJ?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 325c25c2-013a-455f-7fae-08dca74184cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:51:42.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vkxv5w2kQyXjlEenAqSlbVDz4S7g3tKXPftxUSwk+h6MXHxuZqzHuveMA74ideezDxEy/VgkD4CiGg/hwM3txA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

It is worth to mention that although there's a fix on xe_exec ioctl,
that should not cause any uapi change. It would only fix a potential
crash in the case that xe_ioctl failed with a bad sync array as input.

Thanks,
Rodrigo.

drm-xe-next-fixes-2024-07-18:
- Xe_exec ioctl minor fix on sync entry cleanup upon error (Ashutosh)
- SRIOV: limit VF LMEM provisioning (Michal)
- Wedge mode fixes (Brost)
The following changes since commit 478a52707b0abe98aac7f8c53ccddb759be66b06:

  Merge tag 'amd-drm-next-6.11-2024-07-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-18 09:20:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-07-18

for you to fetch changes up to 90936a0a4c54f0a1cdf4538f9128821ad70c36ab:

  drm/xe: Don't suspend device upon wedge (2024-07-18 10:25:37 -0400)

----------------------------------------------------------------
- Xe_exec ioctl minor fix on sync entry cleanup upon error (Ashutosh)
- SRIOV: limit VF LMEM provisioning (Michal)
- Wedge mode fixes (Brost)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup

Matthew Brost (2):
      drm/xe: Wedge the entire device
      drm/xe: Don't suspend device upon wedge

Michal Wajdeczko (1):
      drm/xe/pf: Limit fair VF LMEM provisioning

 drivers/gpu/drm/xe/xe_device.c             | 20 ++++++++++++++++
 drivers/gpu/drm/xe/xe_exec.c               | 14 +++++------
 drivers/gpu/drm/xe/xe_gt.c                 | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                 |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
 drivers/gpu/drm/xe/xe_guc.c                | 16 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.h                |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 38 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_submit.h         |  1 +
 drivers/gpu/drm/xe/xe_uc.c                 | 14 +++++++++++
 drivers/gpu/drm/xe/xe_uc.h                 |  1 +
 11 files changed, 102 insertions(+), 20 deletions(-)
