Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA818B179A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C039410F3A8;
	Wed, 24 Apr 2024 23:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEVnF3nJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A7210EB8A;
 Wed, 24 Apr 2024 23:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714003169; x=1745539169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QZR28sK19953fCd5lDWUuErWpPajJU4tMdqigW1JJjU=;
 b=WEVnF3nJa58NFDqD022T6CKVYvwkKZJBkfYhYS7tU0niLY350DzwoOJI
 ar1SogIGShTzJvZ1DbfmdgL7pFrskDrockLGv0TLUDwomsVNQ4jGnW7XB
 l1KDGKB4ZlsC6EtGZDuh9/ZjSV5gRDd9yyVtRR6NhcOqEmsMG/lCU4SN0
 qqxFQ+z9I4tanUJHZIOpaYu1vt3w0rGn5ztqBjQGvyUwsXkdzngjsIIL5
 eDwXKUL5Ddx061I+O+k0ulC72/SFB5QHNYg8/c7s5SQ8C4s6YWMkL8Vv+
 XdRp4MXSDxz97oeKh643l5J9MjtOcb1AV/NNKqppKI8hNfl5fYG2VrATp w==;
X-CSE-ConnectionGUID: bwdxtlTqToOp/zPozzs12w==
X-CSE-MsgGUID: cp23s7b1RL+RbiPUb9rVTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20214110"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="20214110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 16:59:29 -0700
X-CSE-ConnectionGUID: WPGSLFURT12vYfaoylgfgw==
X-CSE-MsgGUID: jVNAQ8DJQTiQcR/30J1EFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="29336009"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 16:59:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 16:59:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 16:59:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 16:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY+VROrPvRouEdg8rZKVn/Tk8GD/YKlZwAVLRa2/lMWBi7SvkRxpn1o63vJpXvZ1AhnphdQXHKIZY8BT/8QkSfO12VpAS+ApOn8xi2/HVv9kNyauHQBzaF5hSJUu1JL4dKX51e5DMqTfdqD5iqcE1eNjnN3Vzdu2naePHjJtMxhJksr7AlsEIJcJoGVIZCw+UDBRe7wq0kiiNSJ1QDk/2tYyYQKnbFViTTrwI8yBTk72Vcjs8r9TUEa2y3CEOOJk1N9iSWauVO6gYmwqdQqSwCLbGXS2xpkwOYdQJHEKiVXnamJcjjeOOEgFLoh9IJkQVl2ZEk4dVTULklNRhjpQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZR28sK19953fCd5lDWUuErWpPajJU4tMdqigW1JJjU=;
 b=lv5TVjdlXiqeVRXSaAajWnrUDlz1NJit7HrvYFpCJIxg117ddXowb9G9Aqc6V+bxKDPypNQUbuqXTYmSA5Ew7KFJcqI8pb7L4PMJJfcBun3jcClhw0QW9e2qlbD38+7w361QRHeiUGQqAYg5rLpmA3LZNBJUFTSsCcr6Prbr5AyubCYUAbB0MoLSrJiu/1i9HqzGMSMO7LU74ycL1AoBcVUqtCWE135L5BKq7Glgdxb87L3IQYlvUikyIxmqhRbVStUHDj2BlDyjGmL+dstLJG0S9CI76cdrSYj20VwOXH66C2NM/E0QjdBbwwC/ZkOvxp20+aspgAm82nppYgRTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 23:59:18 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 23:59:18 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIIAAKiwAgAGpRnCAFa1zAIAAF6Wg
Date: Wed, 24 Apr 2024 23:59:18 +0000
Message-ID: <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
In-Reply-To: <20240424134840.GJ941030@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: b2369c82-a50e-462c-cd7a-08dc64ba8d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?GSw+ATP2AqTBId/oSI+FNZw6jqkymLBeQKcX95vGpqYGsT8mr1l39+uS0iqf?=
 =?us-ascii?Q?XX/ftcYcHHHq0OsBP0NI4ExfZQU3vHmQgPsPwUxskAFHkP6niMlZ0fMCFg9k?=
 =?us-ascii?Q?uZEOu0SeHoLVB1SU8quv1NWIyJx/TJ9iUJ1TBz+uYVK9t+iqRivk2duxpD9A?=
 =?us-ascii?Q?LiSmIDhvbgFubGH5ZXUMQbtxYNxLJ4KlcUclYLAblXTvi7cwV8L4N6raXMLT?=
 =?us-ascii?Q?uR7FC6fcSdEJgpqOTbiUKyh+KAdkrMZWoC9Df5GGbPPjfd3CISp80a4ez2tg?=
 =?us-ascii?Q?s4+jVFaXdZqDVvUN678pPRI3GnP2TKriAtkg0gqNoYiTMxdsPZ/4zjksiBt7?=
 =?us-ascii?Q?UDfr6jp4kuFSnWbIinAn6G+3Sw891Wc1Py4wd4QUGOjomq2z04B+Sz+GPCl0?=
 =?us-ascii?Q?F2NaSPsP1qWfC3ETafVYSlEqS/BIrVZfmwVdwpexRnrRStZcMVTL7rGCdYvv?=
 =?us-ascii?Q?/Xzh/G+6jo+ZkL0isqfsVEchTHV6QDeeT5cGDAKg6Xt71Hayy4eZDWaaFscc?=
 =?us-ascii?Q?S3rDH0Aj7WzcWBAXDK1s6wP+ZP1B5X9Rl4U7umwgOs51iRvvXBbbBHimvxDU?=
 =?us-ascii?Q?NH6zwYLP/wKFTJdGghsJqwvPfemIQ8oGEmdtQPqlSLbX4oHvKpS2rKkPwDhG?=
 =?us-ascii?Q?HjiTxmpkx48eKygsgfn9MUpJROcDGNZOiTlAWzPLO29D11+dH0T6+LdTBIld?=
 =?us-ascii?Q?W6hAk5iqh6Ye98UZBeSRCLJLuUviNPEMVRAwv6WZMI4O8RgoKI/fGN/PmdPX?=
 =?us-ascii?Q?LFYP5h7Ksqqbvq8WyML8SVqLYxexRNvRHGFwIbpWOYKNQeu1r3r94nwJdcJe?=
 =?us-ascii?Q?OFPDTykcvDYwVcgMRJYBgIDIcxOS+MCAjYiyXQVEzy5ig0+nYZmSwWKT9sXq?=
 =?us-ascii?Q?I5uDl4xQOQpgP2INny6Yej+HEoGcBtb8SsLMtd4O2Z94x4KoyxHPTUOvjSqr?=
 =?us-ascii?Q?WUnBJmb36wQPjDHqXwBDCjpAbEA++uAB3PY+N29gVn+beeJzSxURwLA35cr+?=
 =?us-ascii?Q?AdIpm9xl2qJ84htIntPguOcI4fv31kPt2IIxQSXo0QW/9vTS6KvrQJj2qRGX?=
 =?us-ascii?Q?Dv3/Bt96SogfuHZndy8G1YJZfonsGHaQtMXHo3ieXCQ85hHeaujV7GQT7lHi?=
 =?us-ascii?Q?5qXp958MonfSwlJ0jxhsQgRZ57UWK/37StxjlFPcoerERtzNUIIOEx3Y9FF0?=
 =?us-ascii?Q?DdYOAS+Et9enyJZ9nTU+lahIYmXvEzxJgALutlDBBNEeS2xEzH2ZSih8oMsR?=
 =?us-ascii?Q?fhgDM60e/pSQp4pkuyV0tCSBcYJWnhlN1qNc6DEt4nYO/xZwTDqDGQQdWsQT?=
 =?us-ascii?Q?AAe1YuD+soZXcMFFGaWGY8LolL9ytRCe1jGfaHTXNoGcrw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q2675HMYqsV+2b+Z4nyTivAJnRf1Hzu9IGEmmOGPHtJHlA+ziqgb0agFbk2g?=
 =?us-ascii?Q?TC04G+7dJzowPTlLodhIPIDTHQ0GmJelknGdP4sKuhscLbZgQPHp/RI8RaO0?=
 =?us-ascii?Q?PL4xpffIozo/Xe76QCSE1EmhtYVvPznDBvys+TlsDTrkFvckZTjv2T+kaihw?=
 =?us-ascii?Q?7jDYA6mvYy1+qy3cj5GUZi0gxJ+N/2ZPGIFuzzB6eGwNTctTifDrEnp0hnMd?=
 =?us-ascii?Q?DRefJTH64FSUE+RWachy4Nwo/KtLeeY66LkeiOLu8GQ9QLuOM3xLanxpWPl2?=
 =?us-ascii?Q?3PNLDEu1MdR+LCzI4kTPECyRLDuoVuZ6+NvmgF7nI6M7rb3HXAKeP2L//tMs?=
 =?us-ascii?Q?xZlIkAIFGoWn5lXjItKX2PXGDbo9oh5DCbLN0oWA+CwVcGKftdnhVjvqyEn5?=
 =?us-ascii?Q?FOoIblPsKhGBpXDqU4D9esItz7a3CMnbUrLiCUVbT5OZ9ENOl5+61sKQ70VN?=
 =?us-ascii?Q?Znx8hXhRftQHci9m3HnYHFzd4i6OBcxwmQ/V1gMvrB9CwR8Yquu7ZhhS78oT?=
 =?us-ascii?Q?M8DL4fqowUa2DUCFCIlIKaba+E8H9jPRNcYzpUG6iGLWHeZs3r+VOYAi36US?=
 =?us-ascii?Q?yf4a2JiWgKjkahRA1UsSTHJECUzv1Fv0UFR8wxQilIHAeMMnDW0g46u/NX0p?=
 =?us-ascii?Q?DQeuvj9C4eL6SSlFngsvXe9hObpDVAPcl0XduGrwTVsYY/Z0XK8MLRsc855v?=
 =?us-ascii?Q?c0TKsHilvW0Q1n8XdHp5RgS9LW4mCDyWaE4Dkwx4d3iahlMJjH7+3dHwNUkY?=
 =?us-ascii?Q?AE8dod6ChPJPo71K901V0uABQr8NZgsQ4jdBfkxsnDspPhzy33pE6jOnpxt2?=
 =?us-ascii?Q?Wek5jCBQMs6qGfM1dLeyToaF9PEIrifrWWtCiFid6fkWoAHryXnDDqrcE17+?=
 =?us-ascii?Q?JVBgIxlTow531NmpNocrKuXJRP0pWFMJFFVpYC+j+Vj3aqtGU/DEVtNKz1Pg?=
 =?us-ascii?Q?qs7SKNB7eFNkSmnJJXsAC+ngnS9nQoKA0GLPUx8TRJq/1k+rSE0Ih9roeNes?=
 =?us-ascii?Q?TAZsCyH5Rsian/7QWl0AYUn2NgTC9d+SjzUbOiFiZ+K3CynH5V/AIBGNw2tK?=
 =?us-ascii?Q?2nwVXZ9waN0avIDv9kEIrP6Hs4CYrRzbvRrNTqhZICPw6vJQ2ELh14g8hr0x?=
 =?us-ascii?Q?IHvvA1hrFQeKjtZPNpPUvkp5IfyN6P42YDyiKhUbNu3WM4w+jSKhrNYwpjbu?=
 =?us-ascii?Q?pAnpmtKl/rmEQx1Zz5t4echR6fAweAJ9ym3i8oyLNvZ+GPTa8WhxcxF0Gpr4?=
 =?us-ascii?Q?/huf6zjnidSXYZxMXdwMxFrBD6wSYddbl8irgZLNd1dhoChVFSOc+luBqi+x?=
 =?us-ascii?Q?MMtfjWbLFnODq9BatIlD33S+YyNS444LqCZVlU+BA6EDqte4it1jCKtnQYxb?=
 =?us-ascii?Q?+PM2k5BemzOS/NsbON7IpNZLh3RXZOzaY9BSTF7cqcDjK9d6FSamH28MtU57?=
 =?us-ascii?Q?KCFbTtEK82Lp3wfm/0Ms+5RnaX0dUQSkDdmjK+METSnY0Hr4CpbBiJU5RRm0?=
 =?us-ascii?Q?oXjTtw8CDXWA+3BZh0qZdYrKefoGZIOVg4EBeelbZcuuLLa6k0DiPvYcOx3c?=
 =?us-ascii?Q?CJGA4FygJ4NVpENAINg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2369c82-a50e-462c-cd7a-08dc64ba8d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 23:59:18.0278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTTDXMGySvY8M6Nb4gfggkAPtOl/9AOCPZUAuQ40JRzdTpCrdvjjPJGF3cgq29nOKlLNrG4NQM0enai3qjKnew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

Hi Jason,

I went through the conversation b/t you and Matt. I think we are pretty muc=
h aligned. Here is what I get from this threads:

1) hmm range fault size, gpu page table map size : you prefer bigger gpu vm=
a size and vma can be sparsely mapped to gpu. Our vma size is configurable =
through a user madvise api. We do plan to try 1 gigantic vma and sparse map=
ping. That requires us to reconstruct driver for a 1vma: N page table state=
 mapping. This will be stage 2 work

2) invalidation: you prefer giant notifier. We can consider this if it turn=
s out our implementation is not performant. Currently we don't know.

3) whether driver can look up cpu vma. I think we need this for data migrat=
ion purpose.


See also comments inline.


> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, April 24, 2024 9:49 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Bros=
t,
> Matthew <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky
> <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le
> from hmm range
>=20
> On Tue, Apr 23, 2024 at 09:17:03PM +0000, Zeng, Oak wrote:
> > > On Tue, Apr 09, 2024 at 04:45:22PM +0000, Zeng, Oak wrote:
> > >
> > > > > I saw, I am saying this should not be done. You cannot unmap bits=
 of
> > > > > a sgl mapping if an invalidation comes in.
> > > >
> > > > You are right, if we register a huge mmu interval notifier to cover
> > > > the whole address space, then we should use dma map/unmap pages
> to
> > > > map bits of the address space. We will explore this approach.
> > > >
> > > > Right now, in xe driver, mmu interval notifier is dynamically
> > > > registered with small address range. We map/unmap the whole small
> > > > address ranges each time. So functionally it still works. But it
> > > > might not be as performant as the method you said.
> > >
> > > Please don't do this, it is not how hmm_range_fault() should be
> > > used.
> > >
> > > It is intended to be page by page and there is no API surface
> > > available to safely try to construct covering ranges. Drivers
> > > definately should not try to invent such a thing.
> >
> > I need your help to understand this comment. Our gpu mirrors the
> > whole CPU virtual address space. It is the first design pattern in
> > your previous reply (entire exclusive owner of a single device
> > private page table and fully mirrors the mm page table into the
> > device table.)
> >
> > What do you mean by "page by page"/" no API surface available to
> > safely try to construct covering ranges"? As I understand it,
> > hmm_range_fault take a virtual address range (defined in hmm_range
> > struct), and walk cpu page table in this range. It is a range based
> > API.
>=20
> Yes, but invalidation is not linked to range_fault so you can get
> invalidations of single pages. You are binding range_fault to
> dma_map_sg but then you can't handle invalidation at all sanely.

Ok, I understand your point now.

Yes strictly speaking we can get invalidation of a single page. This can be=
 triggered by core mm numa balance or ksm (kernel samepage merging). At pre=
sent, my understanding is, single page (or a few pages) invalidation is not=
 a very common case. The more common cases are invalidation triggered by us=
er munmap, or invalidation triggered by hmm migration itself (triggered in =
migrate_vma_setup). I will experiment this.

User munmap obviously triggers range based invalidation.

The invalidation triggered by hmm vma migration is also range based as we s=
elect to migration at vma granularity due to performance considerations as =
explained.

I agree in case of single page invalidation, the current codes is not perfo=
rmant because we invalidate the whole vma. What I can do is, look at the mm=
u_notifier_range parameter of the invalidation callback, and only invalidat=
e the range. The requires our driver to split the vma state and page table =
state. It is a big change. We plan to do it in stage 2

>=20
> > From your previous reply ("So I find it a quite strange that this
> > RFC is creating VMA's, notifiers and ranges on the fly "), it seems
> > you are concerning why we are creating vma and register mmu interval
> > notifier on the fly. Let me try to explain it. Xe_vma is a very
> > fundamental concept in xe driver.
>=20
> I understand, but SVA/hmm_range_fault/invalidation are *NOT* VMA based
> and you do need to ensure the page table manipulation has an API that
> is usable. "populate an entire VMA" / "invalidate an entire VMA" is
> not a sufficient primitive.

I understand invalidate entire VMA might be not performant. I will improve =
as explained above.

I think whether we want to populate entire VMA or only one page is still dr=
iver's selection. For us, populate a whole VMA (at 2M bytes by default but =
overwritable by user) is still a performant option. If we populate one page=
 per time, we would run into continuous gpu page fault when gpu access the =
following pages. In most of our compute workload, gpu need to process big c=
hunk of data, e.g., many MiB or even GiB. And page fault overhead is huge p=
er our measurement.

Do you suggest per page based population? Or do you suggest to populate the=
 entire address space or the entire memory region? I did look at RDMA odp c=
odes. In function ib_umem_odp_map_dma_and_lock, it is also a range based po=
pulation. It seems it populate the whole memory region each time, not very =
sure.=20

>=20
> > The gpu page table update, invalidation are all vma-based. This
> > concept exists before this svm work. For svm, we create a 2M (the
> > size is user configurable) vma during gpu page fault handler and
> > register this 2M range to mmu interval notifier.
>=20
> You can create VMAs, but they can't be fully populated and they should
> be alot bigger than 2M. ODP uses a similar 2 level scheme for it's
> SVA, the "vma" granual is 512M.

Oh, I see. So you are suggesting a much bigger granularity. That make sense=
 to me. Our design actually support a much bigger granularity. The migratio=
n/population granularity is configurable in our design. It is a memory advi=
se API and one of the advise is called "MIGRATION_GRANULARITY". This part o=
f the codes is not in my series yet as it is being work by Himal who is als=
o on this email list. We will publish that work soon for review.=20

>=20
> The key thing is the VMA is just a container for the notifier and
> other data structures, it doesn't insist the range be fully populated
> and it must support page-by-page unmap/remap/invalidateion.

Agree and I don't see a hard conflict of our implementation to this concept=
. So the linux core mm vma (struct vm_area_struct) represent an address ran=
ge in the process's address space. Xe driver would create some xe_vma to co=
ver a sub-region of a core mm vma. For example, if the core mm vma is 1GiB,=
 we might create xe-vma of 512MiB or 2MiB, depending on our MIGRATION_GRANU=
LARITY setting.=20

As explained, we can support page-by page map/unmap. Our design makes sure =
we can map/unmap at any page boundary if we want. The granularity setting i=
s all depends on performance data.


>=20
> > Now I try to figure out if we don't create vma, what can we do? We
> > can map one page (which contains the gpu fault address) to gpu page
> > table. But that doesn't work for us because the GPU cache and TLB
> > would not be performant for 4K page each time. One way to think of
> > the vma is a chunk size which is good for GPU HW performance.
>=20
> From this perspective invalidation is driven by the range the
> invalidation callback gets, it could be a single page, but probably
> bigger.

Agree


>=20
> mapping is driven by the range passed to hmm_range_fault() during
> fault handling, which is entirely based on your drivers prefetch
> logic.

In our driver, mapping can be triggered by either prefetch or fault.=20

Prefetch is a user API so user can decide the range.

The range used in fault is decided by MIGRATION_GRANULARITY user setting. T=
he default value is 2MiB as said.=20


>=20
> GPU TLB invalidation sequences should happen once, at the end, for any
> invalidation or range_fault sequence regardless. Nothing about "gpu
> vmas" should have anything to do with this.
>=20
> > And the mmu notifier... if we don't register the mmu notifier on the
> > fly, do we register one mmu notifier to cover the whole CPU virtual
> > address space (which would be huge, e.g., 0~2^56 on a 57 bit
> > machine, if we have half half user space kernel space split)? That
> > won't be performant as well because for any address range that is
> > unmapped from cpu program, but even if they are never touched by
> > GPU, gpu driver still got a invalidation callback. In our approach,
> > we only register a mmu notifier for address range that we know gpu
> > would touch it.
>=20
> When SVA is used something, somewhere, has to decide if a CPU VA
> intersects with a HW VA.
>=20
> The mmu notifiers are orginized in an interval (red/black) tree, so if
> you have a huge number of them the RB search becomes very expensive.
>=20
> Conversly your GPU page table is organized in a radix tree, so
> detecting no-presence during invalidation is a simple radix
> walk. Indeed for the obviously unused ranges it is probably a pointer
> load and single de-ref to check it.
>=20
> I fully expect the radix walk is much, much faster than a huge number
> of 2M notifiers in the red/black tree.
>=20
> Notifiers for SVA cases should be giant. If not the entire memory
> space, then at least something like 512M/1G kind of size, neatly
> aligned with something in your page table structure so the radix walk
> can start lower in the tree automatically.

In our implementation, our page table is not organized as a radix tree. May=
be this an area we can improve. For validation, we don't need to walk page =
table to figure out which range is present in page table. Since we only reg=
ister a mmu notifier when a range is actually mapped to gpu page table. So =
all the notifier callback is with a valid range in gpu page table.

I agree many 2M small notifiers can slow down the red/black tree walk from =
core mm side. But with giant notifier, core mm callback driver much more ti=
mes than small notifier - driver would be called back even if a range is no=
t mapped to gpu page table.

So I am not sure which approach is faster. But I can experiment this.


>=20
> > > > For example, when gpu page fault happens, you look
> > > > up the cpu vm_area_struct for the fault address and create a
> > > > corresponding state/struct. And people can have as many cpu
> > > > vm_area_struct as they want.
> > >
> > > No you don't.
> >
> > See explains above. I need your help to understand how we can do it
> > without a vma (or chunk). One thing GPU driver is different from
> > RDMA driver is, RDMA doesn't have device private memory so no
> > migration.
>=20
> I want to be very clear, there should be no interaction of your
> hmm_range_fault based code with MM centric VMAs. You MUST NOT look
> up
> the CPU vma_area_struct in your driver.

Without look up cpu vma, we even can't decide whether our gpu accessed an v=
alid address or not.

When GPU accesses an address, valid or not (e.g., out of bound access), har=
dware generates a page fault. If we don't look up cpu vma, how do we determ=
ine whether gpu has a out of bound access?

Further more, we call hmm helpers migrate_vma_setup for migration which tak=
e a struct migrate_vma parameter. Migrate_vma has a vma field. If we don't =
look up cpu vma, how do we get this field?

Oak


>=20
> > It only need to dma-map the system memory pages and use
> > them to fill RDMA page table. so RDMA don't need another memory
> > manager such as our buddy. RDMA only deal with system memory which
> > is completely struct page based management. Page by page make 100 %
> > sense for RDMA.
>=20
> I don't think this is the issue at hand, you just have some historical
> poorly designed page table manipulation code from what I can
> understand..
>=20
> Jason
