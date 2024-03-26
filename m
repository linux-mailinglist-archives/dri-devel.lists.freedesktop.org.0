Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0588C80F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF4B10F0A6;
	Tue, 26 Mar 2024 15:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYGyhPZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B1810EC75;
 Tue, 26 Mar 2024 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711468392; x=1743004392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RS1Ntwxq8/sQAFFTf5/3b2fBhTQmwjz9foCYOB0g444=;
 b=UYGyhPZsb2e08zSe/3e4slgp3kQOYrh7F68yTgsPuw6RcsaAjZ+8B1WC
 MCfGGNIAwOVnY9xDij7/U0cYE19xzrLkLYP9hb7Ly0p+SpmZ/0ieeiQ5t
 e8t0EFyNDA1YfamuXQCunN9k4lViDezmtTN6iiQIdKY5OXCOxCx+dX9k1
 O3NC5qz7wGR19UdylPUkIKwJjA0Z445HtLBhyPYk+/zHBqFyzUH4FKe81
 PjRsVzt5qGfNpp+IqJR7+2wh4g0OfsYbFt7pnZvyX3HhznlQf67KZ98xf
 Zu8Y+Krv9Xatv2bZYlIhhmNlLwsOn5Nmz9s0HNuJC5uJSyA3AbPbQBFYp Q==;
X-CSE-ConnectionGUID: GLeLP8XDTPaIXEGl2/DMXw==
X-CSE-MsgGUID: qmCV92B2Q86OfE1jPdeQsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17160168"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17160168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15992601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 08:53:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:53:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 08:53:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 08:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PchLYWZWg0jZsDhgN5jfqmd9O0AQoBeJBrWwUZmtZCrFb2vLu6+DPhzD2QPhlk07Wzgx0Xw/E5mxCZkFWtGP8TwWaVfpih5L6wUORhQ5maDOh7KP4Wa0W+7kCZ0BQdWhAf2JQgJceqItQtns79VyvWeXGW5R3OrQkKOiZavNdhYnSIK5Mob1YyUhtHX2L0m5GBoxEIm4DgSd/bOb8kfl89sPUE7sI99vC4F6RT6x0BH7E0y3+zmsQ/qogLBhlftKBYXbtnm8/hHib9SEm2Lohjoz06sYbLxFn+h0UOqqXhRpRJUJ2e5A0xKyDQtrMbQS77yYnIy+raOr6Qwqic7JRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5d0O37pfnfV2WVu4K0KY6/HnhI0EGOP5vRLVgCG1vM=;
 b=LN9Y8hgCczy5FIAFL05hd3ypeuzZ+YSBiTx85H/mIOhJQI8Qyvn1uOTi/I4x+7pGCcbIYwdZZ6Ay9X0oUFuRJHiO5u+KMVHs471iku5kvTYtA4yQqZd/P+6sjjiH2W+N0xjhJzymuHpyda7A38v5XhTJ6Wfqkhpm2m5l7oRwUr05zWE2fx4g0gY9cYWHAjbKP7W63NQoixRSxpUqKDolQgCmx0izLEzo6HuSuC4230ijXNAZhYoT7TX72czeAgiw6LlDPMZzfnU0QzVmdsIYddFdEY6UADVvMm/leJeFegsx89VQ8uM1g20wOUI86C/wgh7L26d/gcdB6AqY/f6dGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Tue, 26 Mar
 2024 15:53:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 15:53:04 +0000
Date: Tue, 26 Mar 2024 10:52:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Chris
 Zankel" <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>, "Oded
 Gabbay" <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-mips@vger.kernel.org>, <sparclinux@vger.kernel.org>
Subject: Re: Build regressions/improvements in v6.9-rc1
Message-ID: <gtqvjakd2qgymz2zxkaq5tch2s2akavnpb3d2ix6mtqvbtdmse@yecsvxa4f2ea>
References: <CAHk-=wgOw_13JuuX4khpn4K+n09cRG3EBQWufAPBWoa0GLLQ0A@mail.gmail.com>
 <20240325200315.3896021-1-geert@linux-m68k.org>
 <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5206:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +y1LfLdiK3ckTk7GiVF51z0wCE1aAbRjYSMtm1fOtOA2hhNg597hDC6KS2mMOHxdhb81v8oRlwZU7/5pAOb+7BypzejJCop649DKLcm+VwFm1/ZuhO8Y96ND66H6cuWCvVKrxln5Iafi8s0lnAXeVTgIkDt4cjIhCXB4wxj1lVS95xZg4vPw23mIy3ORQ3BjTYV2e0JmXRFjG/i0t6BxabO4BaT3fR7P/mEyPjPNlQr3/xP4rsObAn1QDI/qeBKsbap6ZM48YP3+yU8mE7aeifZdYIt9SdjoJRTsXTszWbkrRiZMpJOyrZh4lDt6E+rlw94eobMPOlmH6BfaWJhvetMp8btYo3uOHA/GXyT0QWZGU0RY/Gb67kqCU/0HX77KR8Xn8vYD+aaLcwUgNtdo+ku2KLETEIA2dXgdGEfAwhO3LxSdZ9wWTCWkfEb3QuxGJ+rWLttCaS8y5vRVbAZZN8zFpLaE/llRhN4oeXNQvpVaSjpx2ebr1zpOdYAvy3Ct6HFZynjRLI6tAb+OnrbQn5MAwUgs6ypA3jYworJa2aAXVI6UvLWFb7DV3Wma8gLn6dod6dwCW8rPNoXuyvRqimltoxnMBJLRLmfKtwrFShs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVFi+N5FVbZscy+Z2i7ZgJ0m7cfzwy/QcXCsI1p3lpWzHrpt7PYrH9voRChZ?=
 =?us-ascii?Q?gtp8dzQxNi+aDYP7xVwku2LPo+I8KwpRxw1AgAtRDHnc+GSd4iXtoHBJ2RYJ?=
 =?us-ascii?Q?9U7ankz47+H2vnXgXXuhAohs4sPvsCI9GWXoiLA9y0byrtutGf4Y2BSc+wQh?=
 =?us-ascii?Q?y/LoIRa1XixqWrol6dNktFH5VJLd4jE6gEQPBonC83Pni7C9HF5Y1lO7ywGa?=
 =?us-ascii?Q?l13F1MRNJnNp7ZmHnFbiDr9ukLyjz1pQuSl+tM5dQEY/b/8HXXQr0Of2H/7I?=
 =?us-ascii?Q?U/jGaU/50bt3SJ1iTixlSvceSWx5mQ+EaSwQ13IAv79psNbduc9rxBiOvJ+Q?=
 =?us-ascii?Q?4N7bBnNCZq7afb24XVQT2H6ZnJ3emuG5PHlwBXe6gJBAaa0szQ+zMHDHj6jp?=
 =?us-ascii?Q?Pk9iTjgIIMqCqfQNKhpg7PtuhSX7/U7XgtTdPQxKhjmM8EExv4faNvWEeGbg?=
 =?us-ascii?Q?AoRRWrlXRoBLrJlpsj1/kgMFSEAuX3asBLuaja4a5alUa3DMMP5tsMWXBExO?=
 =?us-ascii?Q?HMCpVB3g7KBGiHnLalnBqWb30KKVFap+DieF2IrIw+Oea+TG7OmLqchPzSEi?=
 =?us-ascii?Q?mLS1Pfs7tM5rl/2481o3Wv2pnIXqO9NH1AmDZysL5jasZn7Gjvgxqd4CFswP?=
 =?us-ascii?Q?8ezWp6pLDbBf4BflDU08lm+et3NR53Whuw34AO6iLrOWnb5bvOXbeqG49P40?=
 =?us-ascii?Q?YFT6cumcymrnEbKA8MydnYldTuLFPBAWT43dBkMxOmPQfFsAZRry4J99hJ6P?=
 =?us-ascii?Q?LGFrLMPR6wXNLM2UcmP54Oj9n3Y2FRrICfMfqhdRM95tl24/5apTwtdXiYid?=
 =?us-ascii?Q?OYuVD2mRZgXsZFstNPfHPGo0xYQRwKTlHzDrresM4xuszdfRC21QKQBabswx?=
 =?us-ascii?Q?jX4XMC1THy0Hyyq02D63aUgzTMAWeoHhPxXRnZ9IpQnBH96G2/srTX6OLH2F?=
 =?us-ascii?Q?DftEdB/0NffdNRzXSB3i3WrI7qoEeewpa4Wr7x5lGTMHcjBW65B7AKbP8yVY?=
 =?us-ascii?Q?aRCDfrMkld91vqrBXZUVAk7hj2wLzWlPOIwrkiN+vWjeFg9y1bQbrRJ9+VAX?=
 =?us-ascii?Q?x4Qm6m2u/1oZMv83u2ZeVIRuw0ZziBbnfRj7TaSkywne7N5VroSSfsdn7gYg?=
 =?us-ascii?Q?PKOZm7RZF6UqCdCshYigWNfqpTJrcVlgAcEpdgoRxUjYRSHpkwuaxTtobdjk?=
 =?us-ascii?Q?G8ovbqLjQ+RTzfE0RwW3V/c/jm+A4SliywPgMBNvAedybMHQ6R+8rwkHj/E2?=
 =?us-ascii?Q?Maee2N5z93VlMvNrOlUb/JYnZBm2PbW0Maek4eP6d+I8vAyQGvJSYDTJR//R?=
 =?us-ascii?Q?enIUDavQcrKqQaAb/bt47sKoaTRqDPzjifOqwAuuNhsZX68hjz/3FMoxyj5/?=
 =?us-ascii?Q?apwf4tMPNQ0jYzalPp9tkpRt6eHw3Ol3RPd6jIGRKuNce4SvlJrmHEPEv+aK?=
 =?us-ascii?Q?3yZJNDfTLyKi6m9WQHyIkIZ3ZC0RrDdhU9X/jWNW0askipR5K+mzG8TW7ILc?=
 =?us-ascii?Q?JdHbi582BJnVNc7GZpi0tPHQpjClxxMfoTlgFMGNQNDnuhU3jfRyfoW9Ly7P?=
 =?us-ascii?Q?aVNWwYjop1aMkGddLSWufRFyIDFsFWiF7wlXOgbOHy0tcTwQIeBloUPx2wEt?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afc13c0-b887-493c-9795-08dc4dacd285
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 15:53:04.2607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYH5TKPQYBR0VoeVj/WZPoMqfw3u55FS/sQN4GjMJ841NhotaBER+bSVQcs3sdr+uOLgoeZyDs9GuXcOUdclW+J08hC4xPtv49haYGRkxTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Tue, Mar 26, 2024 at 08:50:49AM +0100, Geert Uytterhoeven wrote:
>  + /kisskb/src/drivers/gpu/drm/xe/xe_lrc.c: error: "END" redefined [-Werror]:  => 100

fix is in the drm-xe-fixes queued for this week.
https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/0d8cf0c924732a045273c6aca6900a340ac88529

Lucas De Marchi
