Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E309B4C39
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6806810E258;
	Tue, 29 Oct 2024 14:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOtVCVfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B5510E258;
 Tue, 29 Oct 2024 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730212666; x=1761748666;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GvmFMFo8OQgyFUrPdDXPm6F5np6YqsNXxGGy1ujRC8g=;
 b=iOtVCVfia7vBIj7UZBf8GdPoOtKTWKDX8dBv4g6ZzCymzZN0Oa2KEEy7
 c4uEihM5Z54J5A1mZyVFp3CPBKdza7d/GUyl2lDiJ6+kiQk6e6iOGcSdV
 xk0/DSRFF3hp6s6zODu9fpQqrtSmLKVOuJprl1dvFrJbkvFrYApl4ur4+
 pCA32QYjG4L3Our0BZAqLkeKzEz/EU5n1dnay3s1onBGUUCEQDxxEfcka
 7mmMe79CeH4x/CFbLw7+8pYdm3rHkCiWmtCREpmGCBgfCcq3NRNzdoolB
 jg3X0FJfQzxGZegnclHPsBy1MGAMsq0MfF+x1dCjpydM5CRfRI3UmZ417 g==;
X-CSE-ConnectionGUID: kzWZ/BV9QEWT9sAAi4TYJA==
X-CSE-MsgGUID: gVa2r6yjRnKdzR648JuYSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52415163"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52415163"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 07:37:46 -0700
X-CSE-ConnectionGUID: Wk7XpEzJRq2XhG6qFDlEPA==
X-CSE-MsgGUID: 9ftGHJm2QRS5efGwh/EjFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81535185"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 07:37:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 07:37:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 07:37:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 07:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etwj4IGO7Um0CPRvZyMKemEvbGpCQ9Lk7l2jRBQ/Awt720P0RsDYOso7jsFwtSerBMYHCWxWQmCub4+mY7wpa35O9J/3D/LxpcS2V0hkT4IoonlOokYCq6fC7XeQ17mEppSF8EPRus8QOODlnGHUjpMcF8sK1fGJkXlBHHM30QLBvtZvSNRNpg99OXujDrFTt+qhSdAUUFulQnJkqumVWtVXt5sc50J50XT4LQOkbb5qYJ4O+ule1OZp79Bm0pzd7NGclxQi5lD05+TVc/t4hnPQN8PCB8p41iieLkKG3zJwC91wofhPv0s8Vwn9agl5TnhgXe2JG5upapRfPUY6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRQppJ0ywMnmY3QxoSTJxC0KbA3hm0qLWY8cttpX3Sw=;
 b=nzpwOyDMW39/PDpnTlgYiYJIA6PCt54Am8Tap+UtzMSG+Hx4osoUo3RBJvbG1C2qXc+u6NbB0ofZqpjA4AUS5XuM25ytZi9iPd+Q9Wc2Elt3zNEpHLlZCp+eyLbf/V8bBLQ/vwNEkEG8UP5hqnLkiTBPAHCour8po7CiG7vzEGFkH5zhvr6n3Iw+uqs5twmVKNHXloaCdOQLclHdLnzSPKCvrqAFluqUsyDmIUwr4tVw9NPuxLoNrHbcoqRNK9bS31STpeucAuFUy+nz2C90ZntYleBA4jfj6tQZUcYz5m1q+Rd8S6iIYLYJQyPexi1dYGcD5BmJzVAtPyT2mW7znQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 14:37:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 14:37:41 +0000
Date: Tue, 29 Oct 2024 09:37:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Dave Airlie
 <airlied@redhat.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-next@vger.kernel.org>
Subject: Re: [PATCH drm-next] drm/xe/xe2: Remove duplicate XE2LPM_* register
 definitions
Message-ID: <nsur2olzlwqlvjqdz2kvqps2qf3ysc77fkrnhrdkwuwf52fmsp@rj2xzrqgsdf6>
References: <20241029093033.600098-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241029093033.600098-1-geert+renesas@glider.be>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 277768fa-5681-479d-4a93-08dcf8273e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4IiEuOCTw+H5u0smmBHTpfvuVGYuhMM/hbZJbXujxJbtfAXAdqLuY0cijroa?=
 =?us-ascii?Q?ubwQk5sgzypMKguDkfO0rtfNTjMORSj/llm375vA3OfNMgBpAS4rI7mP+UDL?=
 =?us-ascii?Q?aiTRvBB5PPC6KPb0odtXMFqUWBbGIsXsW5ZoLOFrGBHOFeUgApBb389C71wy?=
 =?us-ascii?Q?8PumZ+ACALTLXkAFL5mi+lXDfNLruXEXgeJKCigF9n5TLGy5W5RpouumweV3?=
 =?us-ascii?Q?pbsOvmf07ax8cRDM+mKpFvpFUWq52UCmU4JHCOJrXuUvUjZCg3KXdlvBPwHb?=
 =?us-ascii?Q?CmnvrOrvzKgiAoXIEjLq6zhr+12NCYjcFOT7gNeYtU7Hbh5QyBQwMnpn4riW?=
 =?us-ascii?Q?7FYjfVMec4dhdeDEc8zxMl71kg+ghmEahhUUviytAIj9OXrrlBVS1/xGP7bT?=
 =?us-ascii?Q?v2Y7jhmoOCL2vOOATtnwQBBWLAnAdN2kyn9IYJPNsAjoGoY80GcK0WpIGz6h?=
 =?us-ascii?Q?3ZO/YSpayHLO4rh8zfMEf/Y4FDjtXsc3Uxey4pkT/6lFrwQQ3S+ebwFNgLnj?=
 =?us-ascii?Q?NM3M420WG7r2toSXuwg3XWAmAYW96hEGRdgAh7wAoDpUhHoAq+2+R009yPQw?=
 =?us-ascii?Q?jA0zwkDpj8OE4hhpIrhA7IoLME5KzFRBfk+SN3sUHJTg44BJ9484QcbYNUcw?=
 =?us-ascii?Q?6QcoZV32yOReElNFIwPusbFU7uhepAj1/dbnj9VkF8/SUPQLxKlCvUBEULL2?=
 =?us-ascii?Q?M+0lp1s9nxxex7osXbz9kAMhmVY+t/iBwOVFF2rpYYa4v6NDPEyHVEHvGpCa?=
 =?us-ascii?Q?wL9UlbvjilC6ntK2AEA+7WtEZNfrhh64AfRA0zpyGxGZCpsF5MSFFJt7IRjl?=
 =?us-ascii?Q?+3TNDZw+LVr2R/GtvbOh1qInQobwUVZt4sJVjqlTfKb/+vR4+ufpnv3mgd+3?=
 =?us-ascii?Q?Z01i6u8XikaMM8lIQQe9bIbYltVOrY3AYeHtuzU9LyQQt76Kfm2NsgkA5cQp?=
 =?us-ascii?Q?fh79tSrMHRpw16XqThUTpstxXMn7GlfW1YMtWK+AWL4l1i7NiVmGjH5fcVgO?=
 =?us-ascii?Q?Bqv2MXUCZ1FlDGTsPirhLjyNni3Nzv2neHXOqpt1kdrESKJX23+wZfMqvevF?=
 =?us-ascii?Q?teRAWMR5z5BH+noy0vVmdaTLOkS/uqeWtEVXqchaFC9VKz/zXvoU24j10Jsu?=
 =?us-ascii?Q?elubNxBuc8rplViuwlOfvUO9Ei3lOMKec+hBqdBMebHuf6YvkwCVAcdrEOCv?=
 =?us-ascii?Q?Krj51kycOOI3AbqMhG7dX1/2l1eqpRJTnm1OnTYFvF1J17NiwNwKksZExET7?=
 =?us-ascii?Q?dsjrRpZkxC7wldJWdUqu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ISHnOhT3xyN1gCGdRR1ooH7u6KgSS4UUK2uireSkB4ZW1INXiHoyZIAARa+P?=
 =?us-ascii?Q?/e7kWA9C0AdN6/x210TcyWGJjvsF438PWcw6Zns41wGHYxQnY+84tZb83ajV?=
 =?us-ascii?Q?ZxDubMGBDL1pXnKa1PQgbvC21VCM8gSZxUPnCaC3gDp4PACTxvlaIVjNvMkr?=
 =?us-ascii?Q?7C+7e5T+tRfWvd4XMQPIHh0w9EY27f27XYI0hdgRWA9Tj4R+WTsbkX0GjY+A?=
 =?us-ascii?Q?d0z6vO++kDgWkn+4Zp37S3fOiYufNM0Ig0BSDuQB18etbdVJzuKCq6Cd//hh?=
 =?us-ascii?Q?DSY3EfUfoW3DjTqmUPNLieQLkvMDHltYZGMIcwrrFBi2FEpI8xTdzfc9PHIM?=
 =?us-ascii?Q?xD/BPs3yvO8nUSOqnnpA7LngfH+xg5cgFmJHKlLgWODuf4Ln03Zb0Joygw8V?=
 =?us-ascii?Q?BuGj6CfImY5Mqt2/6eEXPZadjDHQ3D0EoygE4MKNVMvmf5OJ/kQaj71iBHQm?=
 =?us-ascii?Q?phFbu5skQKlJc37d/uGIhXK1Yn6yZ4310+tmvtMicA5TcwUwcTJ9Sm3wej60?=
 =?us-ascii?Q?U36oapzlh9ISP9+tdS836qu+TJuy+BEta+Y7M9tGgUJZRe02fubr2VUjoVJY?=
 =?us-ascii?Q?VoCUzI/nOu66XDK3SEuE8U6cyCeVm5IPkFpxHLVvQEe/Yb5SiRqTvM1SxrK0?=
 =?us-ascii?Q?XNRdu7ciqetSSEOMxAcJdePu8i/VK0hXTe/JtsV+9qw7p2c6iYny9jcmekBz?=
 =?us-ascii?Q?6ukwQTyDpHG1ekXwh15trjvriLxM20r3ylxG7cG6HmGZI81ilKUKtcu+ZmqK?=
 =?us-ascii?Q?DzD+8maK2hzWrlVdMthRSWBiJRRgR6IAjtzaWsXnUGWol5uCcbsWMZdbi08+?=
 =?us-ascii?Q?dfUHzbRFDVWk8NqZ0etYAr2ON7eDyFqrQji+IqQ7FFF1icIjR9HiSJREWGs5?=
 =?us-ascii?Q?f31Zm3zicrAro/oRyAcxbVKMKbnHBLRAqIsXtOwD7dP7Kloquwi3cWCXrded?=
 =?us-ascii?Q?amKft8PiZwyZcDOA1R6FejHVJeir0GZHP66NP9qQUEksGPGHk17IjfJBvUS4?=
 =?us-ascii?Q?iBIYhPpJ7qHyVVTjNbfPmNk8bj7STNQdKNp+nTpqzUggzodYE7/1sV4a7Rs2?=
 =?us-ascii?Q?tpsmOgFEgPJdtanTHTYM/E+oEj3zQj5+DU+uYSnA/rMsNMfF4QFDFcw66lpi?=
 =?us-ascii?Q?G6RB8H91Ba0QLr8dT67Mux5lcZDloCVRLNmshP9WX4irXsbsfQv4lXXz5nJD?=
 =?us-ascii?Q?JXOJ1zwI01vs04Jgc091hdURJVCJ6+IyYDVkzFy5z3X1Djun2+2NEe2YbqvU?=
 =?us-ascii?Q?6Tw+6wmusHXkMil2tCDJNTtgnOd/Xh7X9b1m4SsCE+AjLfnLNhsmNNSgPH5K?=
 =?us-ascii?Q?zv9LACQKpcxeNz4GdV0Y5wzCeXaflzmkaNQV18DzCFAOc07S7+6Ukfo+wKFO?=
 =?us-ascii?Q?VNI+B3DWcpQbR3l8CC07j+o0KR3hK1M5jEBS/Pu5aQFPPvoM828wNdW/M5CC?=
 =?us-ascii?Q?Be1GkdfOMeTpvrYMwxnEL5tKBJQKemu0ah3B4jpmSvZldwv4XnsWfOgno2XC?=
 =?us-ascii?Q?8KuqQbDQYY9sKFHAd2LK/pmhVFj3IyuEfZqr9OFZ+TaQAj3skNVE65FWmEQ/?=
 =?us-ascii?Q?t2OvewsiTZwQC9xZRatOXvQcfttJ9o4w+cPCqdfl1M9k+Id8+D96nMZl7Ojt?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 277768fa-5681-479d-4a93-08dcf8273e3f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:37:41.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iCzfwCucznSJZ01AyqqW+VGyzvGai5GvZINEsREvrg+OeVHrAsTSyZfEeBoP90hU7bsjP9UOYIFczdN2ZgWAtJB/Imcu+G7MY6yn82+iyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On Tue, Oct 29, 2024 at 10:30:33AM +0100, Geert Uytterhoeven wrote:
>Merging commits e1f813947ccf2326 ("drm/xe/xe2: Extend performance tuning
>to media GT") and 876253165f3eaaac ("drm/xe/xe2: Add performance tuning
>for L3 cache flushing") with their upstream counterparts
>6ef5a04221aaeb85 and 3bf90935aafc750c accidentally left multiple
>identical copies of the XE2LPM_L3SQCREG2, XE2LPM_L3SQCREG3, and
>XE2LPM_SCRATCH3_LBCF register definitions.
>
>Fixes: 26bb2dc102783fef ("Merge tag 'drm-xe-next-2024-10-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")

Dave, this is only in drm-next. It doesn't show up in drm-xe-next
or in drm-tip neither since it's undone by the next merge of
drm-next into drm-tip. Can you take it directly in drm-next?

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ------
> 1 file changed, 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index d428d04164d9d3df..42dc55cb23f4a334 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -410,12 +410,6 @@
>
> #define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
>
>-#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>-
>-#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>-
>-#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
>-
> #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>
> #define XE2_TDF_CTRL				XE_REG(0xb418)
>-- 
>2.34.1
>
