Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295CA350FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4139610E239;
	Thu, 13 Feb 2025 22:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuN+Ahtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998410E156;
 Thu, 13 Feb 2025 22:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739484693; x=1771020693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=672dIEmYeJbaS5bJsLdzpvMxCZ34sN7m6Tp/SPaTNms=;
 b=cuN+Ahtr9CUtwqiejHFXyQpZ4NO+ZLiifAKuITBzieJo/ZpkSqdtmQW5
 Gt2vb0g7bDZ6w7Kv/pT53e7ggPsOVn8XUQPChIFe95fkEOwQWmu2kMwOU
 ja4gjctnDxTFI7ETLFNVGaMi+/EoV8fvs8VNU+Of6y9vMv0FWg/LzjFcz
 G25G9j9XA7a2PXr0RBOx6PWwvzWW4MVnSlV83FbkNTM3JZE6FJK8Eg0u1
 UqhzgMGcEcI86XL5HmkQr3km48gSKchcq++SsMFGyr49zfFmpmtAIj9rW
 X+QQGjLx92e7EdfwNWX/YSe1GoSuubvuFSkKGm1ufJRIStkjO8b9fYHFk A==;
X-CSE-ConnectionGUID: g1L0jYZbSYqwiw8C7Z7QXQ==
X-CSE-MsgGUID: K+Dru8QRRcqBqBhV1I0T7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51646868"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51646868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:32 -0800
X-CSE-ConnectionGUID: BcswBBDbTeWgRixnvzqQhw==
X-CSE-MsgGUID: wKehxGmwT/ubTBAp6qCcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117893031"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 14:11:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 14:11:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 14:11:31 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoeGKM5b5rr5QX00+i9gF1wF0+AYT+woTqxSskUp59gMRP8pCOm8bGOAAfbsDjyLgkqIv/nZCKyg6BCmjfvpUNSEzrfDbcIq3HoOsCnaAXf8e5HRBlXYzwtkiOwIn+KD1UKDjnC9UfxkyzhZuJBUBvezMWPzoPiFnUUGlelD3SKTrBSkwaEvLiEd5aA2APTutAHsyW47EuohldXnBi0TXawfRAPZPKmfqEIHmULRO3brQvl98rcNU1h93jQa577Dn5MUp+WV4qO+qi+fkx6khrUUXFuH7y7fKRbYfmcf++/vBQaFFIgriWbuuo0gf1ZdYTlCZaDegEOvDuLZH7ZaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvQtp0+VfysPzW1aSl783xYL1NuBDGhp4SIUOhlJImI=;
 b=kyxqpgz2X5om79xQWyvI9taAr+v4uXBywNIh/gXqRqdidK53b/NvypaURNw3MP51TXoBgXPVsg+0WVXk074HunFhkNZZRDE2egFsHEaGz4KnqxDCJaxpdY+L29Y3qPcXt/fyHgtzP5MLV6PuDFUW5+Puwa6f+1YAc4VVOIEhEzjvBGP2t8jC7MRlC6AKPh/BynvO+NIg84ZN7EaojslX85TIz6SuTHn7qA90RtjhZfvVMuPu+/X2LVEseflfq9y63YLX+1Cg0Er8uqAn+GxzyFIWGi6LM04Mn535CH00zbEg1g9wxQeLq3YSqBujBby3jWW2Z7uC9IttsDp5eRBZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 22:11:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 22:11:11 +0000
Date: Thu, 13 Feb 2025 14:12:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <corbet@lwn.net>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <ajanulgu@redhat.com>, <lyude@redhat.com>,
 <pstanner@redhat.com>, <zhiw@nvidia.com>, <cjia@nvidia.com>,
 <jhubbard@nvidia.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z65uO2BOBaJzk0AJ@lstrano-desk.jf.intel.com>
References: <20250209173048.17398-1-dakr@kernel.org>
 <20250209173048.17398-2-dakr@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250209173048.17398-2-dakr@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 931206ed-0d6f-4ccf-6810-08dd4c7b52be
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dUaRj4nvhoO/TiJ7LpP+JRdOYj2LUQ4BM3XnIQNEvKLD/gurfM3+QDpDbq7v?=
 =?us-ascii?Q?uh6rHL3IfmRcsFqIovOCKprIvNAUSBY0NX+lshu+E563At7tY7umbI95HnBM?=
 =?us-ascii?Q?bFiDJPl4PLJhldV8TpXRjoi68elCi1dcMzk0F/EAAZNORfcgaiu/fdxMvRh+?=
 =?us-ascii?Q?JmvbPD8Bsj4XsogMBQKDDMjKBoBX5XVLaxiWZbubXXC+ebfTl8/QahEjaaNd?=
 =?us-ascii?Q?1LCxxtfXwnLxd20G/qGtp4hDe4t6dvMDJ6osJQyY5t8KsijKHnc2rS7CQYk9?=
 =?us-ascii?Q?q967EjB5xGDjy/I/CFGv1HcfE4g+rNQt7FuMmsHSRd46u3wRoLQV41wk3lrh?=
 =?us-ascii?Q?pNZ3BwNKpk/SZcxmC2MooOpsHi8Zx5b7WwvHKaK8gd9GOGqrVjT3zujY7RUt?=
 =?us-ascii?Q?EjTWrorgYBYDuroTtu6GjyqaQPwJz1l99CF+W0wjVY0WdPK/0RoMPMShcBtQ?=
 =?us-ascii?Q?FMOCQi3XXkcBiW0eiKNdh1duIlWJauUUZzgQ9Z4FYCj4Yg+56w5jXT8AOIMK?=
 =?us-ascii?Q?tw6MW3Vr9wyODrqmKbDQdnUmg9yrTY/aVJL0k/xcm0lT0WVh5LDTnesXuxYw?=
 =?us-ascii?Q?6VTA+dA2l9F6WZBf/ug1ae/8T614qpZQhU0WPiSg5Pekk1Wq0FmQkb3KWJP2?=
 =?us-ascii?Q?k2ef3DjIwpnf7AWaDULNFNq6I4VOnZEDye78LAp+ziNU1D9CFdaPfUI+nwoH?=
 =?us-ascii?Q?28GBXsdna67EBhSUg5qBiH8yTDmBZQBkOwHEPPVjQ3SxL+Q3lXLJ0P/vI04M?=
 =?us-ascii?Q?BukJ9vkGdDo0iLCj7jmL5n8JzTP8qqqsC6F3Y/YtQqejfhk/YGe3UcF2RxNE?=
 =?us-ascii?Q?DSDdaHXVmRGvWFkeK9hrHC9DXTkhW2rLRiyrjphofpdzBbTZ7Icbr4wZ1U/2?=
 =?us-ascii?Q?4OP7chYPGCDgJrkhKdn17cjz+jkSrx7mLhGhy2zxmKhQZ5RrjogBI1yCfONK?=
 =?us-ascii?Q?rD/2WbcyD7yfWMyWVD1ReJQc3QhHA8G2LLq5idSs8cqcq20g4ptL0ejYN5fX?=
 =?us-ascii?Q?1hyXcBqznP26RD6MqXXiolsWEmCBjWPGKBPJfY+bLQYKi+ucd15IsbAFBvHi?=
 =?us-ascii?Q?0V/nlh79P7mRrtyg7XNz+sESovQziKuh5eyfjMUX5kZyUKUk0Tj8XIS1YhGr?=
 =?us-ascii?Q?04ADttK/vwYqW27WOO15WZzs+j65rsGAAYDgD4nBkErR0f1WuS8JfKV9MnBq?=
 =?us-ascii?Q?Eb5TmSQoEKhBE9LgXCxdZq4AvNA1nczcc/L/ep/HuDW0rx8AwMH4GNIcm7vn?=
 =?us-ascii?Q?BEuc+xHhYwLit/6/xe1s5a5xTaqGZZS3Y6x6DHM+419Sx7duhK2RjVACSk7z?=
 =?us-ascii?Q?wP659LGdl6N6kolqxxQeEkcGDN5c+FYDjWF33YLJYuH3gA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCX+cwEEXe1eCdpDg6BzZ3YW45bG9zOUIeMLtEhpXFdZNbO04K1dnmHuorXH?=
 =?us-ascii?Q?9OfQTDP6q68OiEHZ4mJxCyiNPOaJOfcunGgbPa9adTfrUtTCCWsSioQ7pMr+?=
 =?us-ascii?Q?QxcsXnci6EB2wSPsKtOMEh7/4eRYmEhCGvh9wptTT6efsEcUmtq/cLw5jGJG?=
 =?us-ascii?Q?FBoWGVblC/aRxsLghoSSyxGr00OjykmN3j9M7mnhsjtY1ZQqwIVvYl6joTSD?=
 =?us-ascii?Q?kMK+z3U23qF/YTdK3CMmnPl1YcMdTeACVL8FiL6HxGXs3g+6jBn0Twha1RPG?=
 =?us-ascii?Q?hPFqGF1B01aFm17CN0Y8A4cuRBqedrWVW/tW3os0wF7/AuXfILazESDcDn+b?=
 =?us-ascii?Q?MOwclzBmSLUiCb3qB9o2m0rqfFSxOmttvWGdh/XvxliwnZ9usZkBMXL67fsN?=
 =?us-ascii?Q?nVCfxLUlKgCv4rdylGcP614jON0H6te9UBP/k5YozzdNsNWDD2HMxlPIqmz9?=
 =?us-ascii?Q?gisNCYOy3bchkwVvJf5ztSi6Po2/fbkbphwNoL6RSNeU5cj6QBOPM1tqTL92?=
 =?us-ascii?Q?0I7HFF5VgDT5fPJ4j0rCa/zxxGVELzbX0JfrvM1rqBc7dR2NgOORlz+8TxrL?=
 =?us-ascii?Q?z08ejKVBjxVQM09FKZCBBnlL5K8H3twtwAZ4NtnuIH4qyUGfme87lp75GtHh?=
 =?us-ascii?Q?q9fk8DRK3A7dJrBWiOCtQt/6Ft/TSnoUWwKnaMe79oECBgmMgqIUYCZ3HBXl?=
 =?us-ascii?Q?n/kN94/aFO2xa8dpSfHD5ev2AmHb9EMxyHfWmiQNpVXti2v9Udpklnovc/bY?=
 =?us-ascii?Q?WfEYnEw4yWgkiFS/cs11/if5XyqDZ7xuB5PQ3GasVHLjeiqGexQ4YbDP1mFB?=
 =?us-ascii?Q?pj+mvamqlwpoT126Zux/W0b7mdoCd59hZRCGeAr3wto/ruLz+JBKrIRfZ8lB?=
 =?us-ascii?Q?Jy8RAawfc21JUpUCIAfTRk2+188wP/DB331Svvl/R4pQgMW+gJAQpHr0HRJ5?=
 =?us-ascii?Q?bn6PAi5sM2GOeuYmMN0XX0ZjWm9FXiYis4g70U4au4t0ECaweq2uQ3Dn6qSZ?=
 =?us-ascii?Q?OgispIEQnDGa67uWEoAO+rW781VavEPz101TrMC5RaqOkDoClqbpfTWw8eOD?=
 =?us-ascii?Q?DOGlFSP5HIskOrDhmUH6NzGIBET2Mv/kTsJe7Dz7NALQLJBUcZK/odH7ZS8i?=
 =?us-ascii?Q?SJRy+qVM3LN8Xwle+h796+GJD86N49708Tkr/5n8l0++CaGfzAZscTTxR0st?=
 =?us-ascii?Q?IIjBMLvMbtHCzjpkXrXMaLtakopAHrWL4ySgLkB0ydfujLcMIiI1z96byPeu?=
 =?us-ascii?Q?ulzYyRnZPyTg/AoP9T1JYdOhI5F+p6Q581KgI3tf8lOjyFtOZEhWgGrdPW34?=
 =?us-ascii?Q?sjobzXJ3mk0cGPWX6MXMPi6pJGPbY5z2n1rNGrogjVaufQTcNkH9XatfaRgX?=
 =?us-ascii?Q?Is3etyCbvCs8fagrR5TuS8xOuueAnO17tBK/kx9jKJ0zlKJDvnHFT3HLx2tK?=
 =?us-ascii?Q?74JpOIYuMACudlKRQHE5/TbxpF52Uz0Y1Zk8UXXHSfeUlWk9aE29r6NYhZJY?=
 =?us-ascii?Q?HiWTnGzFfXah0vM+uqqlSr//JtYByMGnt6pT5T4ahNAYzaXT5067VRYzCyZy?=
 =?us-ascii?Q?TFBDY2+DlYTwIJY3sugukBavyOeR3LfIMybQzj+UEW1UfmOKjmUDdIQOddto?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 931206ed-0d6f-4ccf-6810-08dd4c7b52be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 22:11:11.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAvO8Ael4ilr0upcZG3FusLv2bbdnsiBRgJp7KX2jV/UHH7I1+ZnoGiIglnxkxCEmwKYKcuoPcZHJy4ascRP7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

On Sun, Feb 09, 2025 at 06:30:25PM +0100, Danilo Krummrich wrote:
> Add the initial documentation of the Nova project.
> 
> The initial project documentation consists out of a brief introduction
> of the project, as well as project guidelines both general and nova-core
> specific and a task list for nova-core specifically.
> 
> The task list is divided into tasks for general Rust infrastructure
> required by the project, tasks regarding GSP enablement and firmware
> abstraction, general GPU driver tasks as well as tasks related to
> external API design and test infrastructure.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Changes in v3:
>   - Replace some Rust specific rules with links to existing R4L documentation.
>   - Link in R4L submit checklist.
>   - Update task entry "Page abstraction for foreign pages" with Lina's work.
> 
> Changes in v2:
>   - Add task "Generic register abstraction".
>   - Change complexity of "Debugfs abstractions".
> ---
>  Documentation/gpu/drivers.rst              |   1 +
>  Documentation/gpu/nova/core/guidelines.rst |  24 ++
>  Documentation/gpu/nova/core/todo.rst       | 446 +++++++++++++++++++++
>  Documentation/gpu/nova/guidelines.rst      |  69 ++++
>  Documentation/gpu/nova/index.rst           |  30 ++
>  MAINTAINERS                                |   1 +
>  6 files changed, 571 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/guidelines.rst
>  create mode 100644 Documentation/gpu/nova/core/todo.rst
>  create mode 100644 Documentation/gpu/nova/guidelines.rst
>  create mode 100644 Documentation/gpu/nova/index.rst
> 
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index 1f17ad0790d7..7c2c5dcb5fd4 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -24,6 +24,7 @@ GPU Driver Documentation
>     panfrost
>     panthor
>     zynqmp
> +   nova/index
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/gpu/nova/core/guidelines.rst b/Documentation/gpu/nova/core/guidelines.rst
> new file mode 100644
> index 000000000000..a389d65d7982
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/guidelines.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==========
> +Guidelines
> +==========
> +
> +This documents contains the guidelines for nova-core. Additionally, all common
> +guidelines of the Nova project do apply.
> +
> +Driver API
> +==========
> +
> +One main purpose of nova-core is to implement the abstraction around the
> +firmware interface of GSP and provide a firmware (version) independent API for
> +2nd level drivers, such as nova-drm or the vGPU manager VFIO driver.
> +
> +Therefore, it is not permitted to leak firmware (version) specifics, through the
> +driver API, to 2nd level drivers.
> +
> +Acceptance Criteria
> +===================
> +
> +- To the extend possible, patches submitted to nova-core must be tested for
> +  regressions with all 2nd level drivers.
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> new file mode 100644
> index 000000000000..3e8d2125da9d
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -0,0 +1,446 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=========
> +Task List
> +=========
> +
> +Tasks may have the following fields:
> +
> +- ``Complexity``: Describes the required familiarity with Rust and / or the
> +  corresponding kernel APIs or subsystems. There are four different complexities,
> +  ``Beginner``, ``Intermediate``, ``Advanced`` and ``Expert``.
> +- ``Reference``: References to other tasks.
> +- ``Link``: Links to external resources.
> +- ``Contact``: The person that can be contacted for further information about
> +  the task.
> +
> +Enablement (Rust)
> +=================
> +
> +Tasks that are not directly related to nova-core, but are preconditions in terms
> +of required APIs.
> +
> +FromPrimitive API
> +-----------------
> +
> +Sometimes the need arises to convert a number to a value of an enum or a
> +structure.
> +
> +A good example from nova-core would be the ``Chipset`` enum type, which defines
> +the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
> +certain register indication the chipset AD102. Hence, the enum value ``AD102``
> +should be derived from the number ``0x192``. Currently, nova-core uses a custom
> +implementation (``Chipset::from_u32`` for this.
> +
> +Instead, it would be desirable to have something like the ``FromPrimitive``
> +trait [1] from the num crate.
> +
> +Having this generalization also helps with implementing a generic macro that
> +automatically generates the corresponding mappings between a value and a number.
> +
> +| Complexity: Beginner
> +| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
> +
> +Generic register abstraction
> +----------------------------
> +
> +Work out how register constants and structures can be automatically generated
> +through generalized macros.
> +
> +Example:
> +
> +.. code-block:: rust
> +
> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> +	   MINOR_REVISION(3:0, RO),
> +	   MAJOR_REVISION(7:4, RO),
> +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> +	])
> +
> +This could expand to something like:
> +
> +.. code-block:: rust
> +
> +	const BOOT0_OFFSET: usize = 0x00000000;
> +	const BOOT0_MINOR_REVISION_SHIFT: u8 = 0;
> +	const BOOT0_MINOR_REVISION_MASK: u32 = 0x0000000f;
> +	const BOOT0_MAJOR_REVISION_SHIFT: u8 = 4;
> +	const BOOT0_MAJOR_REVISION_MASK: u32 = 0x000000f0;
> +	const BOOT0_REVISION_SHIFT: u8 = BOOT0_MINOR_REVISION_SHIFT;
> +	const BOOT0_REVISION_MASK: u32 = BOOT0_MINOR_REVISION_MASK | BOOT0_MAJOR_REVISION_MASK;
> +
> +	struct Boot0(u32);
> +
> +	impl Boot0 {
> +	   #[inline]
> +	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
> +	      Self(bar.readl(BOOT0_OFFSET))
> +	   }
> +
> +	   #[inline]
> +	   fn minor_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn major_revision(&self) -> u32 {
> +	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
> +	   }
> +
> +	   #[inline]
> +	   fn revision(&self) -> u32 {
> +	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
> +	   }
> +	}
> +
> +Usage:
> +
> +.. code-block:: rust
> +
> +	let bar = bar.try_access().ok_or(ENXIO)?;
> +
> +	let boot0 = Boot0::read(&bar);
> +	pr_info!("Revision: {}\n", boot0.revision());
> +
> +| Complexity: Advanced
> +
> +Delay / Sleep abstractions
> +--------------------------
> +
> +Rust abstractions for the kernel's delay() and sleep() functions.
> +
> +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
> +since Oct. 24.
> +
> +| Complexity: Beginner
> +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
> +
> +IRQ abstractions
> +----------------
> +
> +Rust abstractions for IRQ handling.
> +
> +There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
> +to request IRQs.
> +
> +Besides optional review and testing work, the required ``pci::Device`` code
> +around those core abstractions needs to be worked out.
> +
> +| Complexity: Intermediate
> +| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
> +| Contact: Daniel Almeida
> +
> +Page abstraction for foreign pages
> +----------------------------------
> +
> +Rust abstractions for pages not created by the Rust page abstraction without
> +direct ownership.
> +
> +There is active onging work from Abdiel Janulgue [1] and Lina [2].
> +
> +| Complexity: Advanced
> +| Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
> +| Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
> +
> +Scatterlist / sg_table abstractions
> +-----------------------------------
> +
> +Rust abstractions for scatterlist / sg_table.
> +
> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> +mailing list yet.
> +
> +| Complexity: Intermediate
> +| Contact: Abdiel Janulgue
> +
> +ELF utils
> +---------
> +
> +Rust implementation of ELF header representation to retrieve section header
> +tables, names, and data from an ELF-formatted images.
> +
> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> +mailing list yet.
> +
> +| Complexity: Beginner
> +| Contact: Abdiel Janulgue
> +
> +PCI MISC APIs
> +-------------
> +
> +Extend the existing PCI device / driver abstractions by SR-IOV, config space,
> +capability, MSI API abstractions.
> +
> +| Complexity: Beginner
> +
> +Auxiliary bus abstractions
> +--------------------------
> +
> +Rust abstraction for the auxiliary bus APIs.
> +
> +This is needed to connect nova-core to the nova-drm driver.
> +
> +| Complexity: Intermediate
> +
> +Debugfs abstractions
> +--------------------
> +
> +Rust abstraction for debugfs APIs.
> +
> +| Reference: Export GSP log buffers
> +| Complexity: Intermediate
> +
> +Vec extensions
> +--------------
> +
> +Implement ``Vec::truncate`` and ``Vec::resize``.
> +
> +Currently this is used for some experimental code to parse the vBIOS.
> +
> +| Reference vBIOS support
> +| Complexity: Beginner
> +
> +GPU (general)
> +=============
> +
> +Parse firmware headers
> +----------------------
> +
> +Parse ELF headers from the firmware files loaded from the filesystem.
> +
> +| Reference: ELF utils
> +| Complexity: Beginner
> +| Contact: Abdiel Janulgue
> +
> +Build radix3 page table
> +-----------------------
> +
> +Build the radix3 page table to map the firmware.
> +
> +| Complexity: Intermediate
> +| Contact: Abdiel Janulgue
> +
> +vBIOS support
> +-------------
> +
> +Parse the vBIOS and probe the structures required for driver initialization.
> +
> +| Contact: Dave Airlie
> +| Reference: Vec extensions
> +| Complexity: Intermediate
> +
> +Initial Devinit support
> +-----------------------
> +
> +Implement BIOS Device Initialization, i.e. memory sizing, waiting, PLL
> +configuration.
> +
> +| Contact: Dave Airlie
> +| Complexity: Beginner
> +
> +Boot Falcon controller
> +----------------------
> +
> +Infrastructure to load and execute falcon (sec2) firmware images; handle the
> +GSP falcon processor and fwsec loading.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +GPU Timer support
> +-----------------
> +
> +Support for the GPU's internal timer peripheral.
> +
> +| Complexity: Beginner
> +| Contact: Dave Airlie
> +
> +MMU / PT management
> +-------------------
> +
> +Work out the architecture for MMU / page table management.
> +
> +We need to consider that nova-drm will need rather fine-grained control,
> +especially in terms of locking, in order to be able to implement asynchronous
> +Vulkan queues.
> +
> +While generally sharing the corresponding code is desirable, it needs to be
> +evaluated how (and if at all) sharing the corresponding code is expedient.
> +

Looking purely from curiosity PoV...

Any plans to wrap things like GPU VM in rust?

> +| Complexity: Expert
> +
> +VRAM memory allocator
> +---------------------
> +
> +Investigate options for a VRAM memory allocator.
> +
> +Some possible options:
> +  - Rust abstractions for
> +    - RB tree (interval tree) / drm_mm
> +    - maple_tree
> +  - native Rust collections
> +

Here what about using TTM or DRM buddy?

Matt

> +| Complexity: Advanced
> +
> +Instance Memory
> +---------------
> +
> +Implement support for instmem (bar2) used to store page tables.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +GPU System Processor (GSP)
> +==========================
> +
> +Export GSP log buffers
> +----------------------
> +
> +Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
> +(even after failure to probe the driver) through debugfs.
> +
> +This is also an interesting feature for nova-core, especially in the early days.
> +
> +| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
> +| Reference: Debugfs abstractions
> +| Complexity: Intermediate
> +
> +GSP firmware abstraction
> +------------------------
> +
> +The GSP-RM firmware API is unstable and may incompatibly change from version to
> +version, in terms of data structures and semantics.
> +
> +This problem is one of the big motivations for using Rust for nova-core, since
> +it turns out that Rust's procedural macro feature provides a rather elegant way
> +to address this issue:
> +
> +1. generate Rust structures from the C headers in a separate namespace per version
> +2. build abstraction structures (within a generic namespace) that implement the
> +   firmware interfaces; annotate the differences in implementation with version
> +   identifiers
> +3. use a procedural macro to generate the actual per version implementation out
> +   of this abstraction
> +4. instantiate the correct version type one on runtime (can be sure that all
> +   have the same interface because it's defined by a common trait)
> +
> +There is a PoC implementation of this pattern, in the context of the nova-core
> +PoC driver.
> +
> +This task aims at refining the feature and ideally generalize it, to be usable
> +by other drivers as well.
> +
> +| Complexity: Expert
> +
> +GSP message queue
> +-----------------
> +
> +Implement low level GSP message queue (command, status) for communication
> +between the kernel driver and GSP.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +Bootstrap GSP
> +-------------
> +
> +Call the boot firmware to boot the GSP processor; execute initial control
> +messages.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +Client / Device APIs
> +--------------------
> +
> +Implement the GSP message interface for client / device allocation and the
> +corresponding client and device allocation APIs.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +Bar PDE handling
> +----------------
> +
> +Synchronize page table handling for BARs between the kernel driver and GSP.
> +
> +| Complexity: Beginner
> +| Contact: Dave Airlie
> +
> +FIFO engine
> +-----------
> +
> +Implement support for the FIFO engine, i.e. the corresponding GSP message
> +interface and provide an API for chid allocation and channel handling.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +GR engine
> +---------
> +
> +Implement support for the graphics engine, i.e. the corresponding GSP message
> +interface and provide an API for (golden) context creation and promotion.
> +
> +| Complexity: Advanced
> +| Contact: Dave Airlie
> +
> +CE engine
> +---------
> +
> +Implement support for the copy engine, i.e. the corresponding GSP message
> +interface.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +VFN IRQ controller
> +------------------
> +
> +Support for the VFN interrupt controller.
> +
> +| Complexity: Intermediate
> +| Contact: Dave Airlie
> +
> +External APIs
> +=============
> +
> +nova-core base API
> +------------------
> +
> +Work out the common pieces of the API to connect 2nd level drivers, i.e. vGPU
> +manager and nova-drm.
> +
> +| Complexity: Advanced
> +
> +vGPU manager API
> +----------------
> +
> +Work out the API parts required by the vGPU manager, which are not covered by
> +the base API.
> +
> +| Complexity: Advanced
> +
> +nova-core C API
> +---------------
> +
> +Implement a C wrapper for the APIs required by the vGPU manager driver.
> +
> +| Complexity: Intermediate
> +
> +Testing
> +=======
> +
> +CI pipeline
> +-----------
> +
> +Investigate option for continuous integration testing.
> +
> +This can go from as simple as running KUnit tests over running (graphics) CTS to
> +booting up (multiple) guest VMs to test VFIO use-cases.
> +
> +It might also be worth to consider the introduction of a new test suite directly
> +sitting on top of the uAPI for more targeted testing and debugging. There may be
> +options for collaboration / shared code with the Mesa project.
> +
> +| Complexity: Advanced
> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
> new file mode 100644
> index 000000000000..13ab13984a18
> --- /dev/null
> +++ b/Documentation/gpu/nova/guidelines.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==========
> +Guidelines
> +==========
> +
> +This document describes the general project guidelines that apply to nova-core
> +and nova-drm.
> +
> +Language
> +========
> +
> +The Nova project uses the Rust programming language. In this context, all rules
> +of the Rust for Linux project as documented in
> +:doc:`../../rust/general-information` apply. Additionally, the following rules
> +apply.
> +
> +- Unless technically necessary otherwise (e.g. uAPI), any driver code is written
> +  in Rust.
> +
> +- Unless technically necessary, unsafe Rust code must be avoided. In case of
> +  technical necessity, unsafe code should be isolated in a separate component
> +  providing a safe API for other driver code to use.
> +
> +Style
> +-----
> +
> +All rules of the Rust for Linux project as documented in
> +:doc:`../../rust/coding-guidelines` apply.
> +
> +For a submit checklist, please also see the `Rust for Linux Submit checklist
> +addendum <https://rust-for-linux.com/contributing#submit-checklist-addendum>`_.
> +
> +Documentation
> +=============
> +
> +The availability of proper documentation is essential in terms of scalability,
> +accessibility for new contributors and maintainability of a project in general,
> +but especially for a driver running as complex hardware as Nova is targeting.
> +
> +Hence, adding documentation of any kind is very much encouraged by the project.
> +
> +Besides that, there are some minimum requirements.
> +
> +- Every non-private structure needs at least a brief doc comment explaining the
> +  semantical sense of the structure, as well as potential locking and lifetime
> +  requirements. It is encouraged to have the same minimum documentation for
> +  non-trivial private structures.
> +
> +- uAPIs must be fully documented with kernel-doc comments; additionally, the
> +  semantical behavior must be explained including potential special or corner
> +  cases.
> +
> +- The APIs connecting the 1st level driver (nova-core) with 2nd level drivers
> +  must be fully documented. This includes doc comments, potential locking and
> +  lifetime requirements, as well as example code if applicable.
> +
> +- Abbreviations must be explained when introduced; terminology must be uniquely
> +  defined.
> +
> +- Register addresses, layouts, shift values and masks must be defined properly;
> +  unless obvious, the semantical sense must be documented. This only applies if
> +  the author is able to obtain the corresponding information.
> +
> +Acceptance Criteria
> +===================
> +
> +- Patches must only be applied if reviewed by at least one other person on the
> +  mailing list; this also applies for maintainers.
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> new file mode 100644
> index 000000000000..2701b3f4af35
> --- /dev/null
> +++ b/Documentation/gpu/nova/index.rst
> @@ -0,0 +1,30 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=======================
> +nova NVIDIA GPU drivers
> +=======================
> +
> +The nova driver project consists out of two separate drivers nova-core and
> +nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs based on
> +the GPU System Processor (GSP).
> +
> +The following documents apply to both nova-core and nova-drm.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   guidelines
> +
> +nova-core
> +=========
> +
> +The nova-core driver is the core driver for NVIDIA GPUs based on GSP. nova-core,
> +as the 1st level driver, provides an abstraction around the GPUs hard- and
> +firmware interfaces providing a common base for 2nd level drivers, such as the
> +vGPU manager VFIO driver and the nova-drm driver.
> +
> +.. toctree::
> +   :titlesonly:
> +
> +   core/guidelines
> +   core/todo
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d5b7ed7da9e..ed618e8757a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7454,6 +7454,7 @@ Q:	https://patchwork.freedesktop.org/project/nouveau/
>  B:	https://gitlab.freedesktop.org/drm/nova/-/issues
>  C:	irc://irc.oftc.net/nouveau
>  T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	Documentation/gpu/nova/
>  F:	drivers/gpu/nova-core/
>  
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
> -- 
> 2.48.1
> 
