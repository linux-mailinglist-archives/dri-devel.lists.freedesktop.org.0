Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311B5B2804C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6183C10E93B;
	Fri, 15 Aug 2025 13:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j49w1X6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCA010E25C;
 Fri, 15 Aug 2025 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755263040; x=1786799040;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=//NqAYmoVD7rQkXG4V0/W65w1uE6jT93cyEvMaOOGW8=;
 b=j49w1X6npU9vhf4niTbvs5yjM+ffkaw8KwIjjk7yfuus9BrUWrEkG19o
 LrN76NRHSAUlT7/Wb5iKNatzIi6iF/4aG1+Q8l3c6mZo6EQHsPbqKnh/z
 6lbahr/w2UI03sq78nkCf3AqBsNaZkHqeahQ99An84Dg7gKo2U/GEoRi6
 P4nOA85OxArhZZHVc0Ax/46DrTxegSqQ+WXww2PFJ4givnsBQLgMB75D9
 +ttbiRTOyDt/zsRyO6EOelfbc0dkJJRLbRQvqMOkT+aSN+RcMAndrYeOI
 UnNayhPiwXwlbK4q6FNzw9cCLipW6yZymWMCKwK0/mAM1GxIhWn8Gp8lt Q==;
X-CSE-ConnectionGUID: Cx2l3DR5QjSRhhxGh2nEAQ==
X-CSE-MsgGUID: b9nreJTMRkmaCM9UXk8X0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57494591"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57494591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 06:03:59 -0700
X-CSE-ConnectionGUID: W6zoUo4lQDafQ9REwuW64w==
X-CSE-MsgGUID: JGLgUhLCQma3nT0PDXCfcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197860570"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 06:03:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 06:03:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 06:03:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 06:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo+4oBZLQ8qEzQhCRL/b0ld9nk4ur/r1loAJPIwM6kBOuf1jIDmxhEvC8ucB5gz8ZuhosmWYBn38NcD2B9JWefLtXnHwvO13yMcjmWCccEtejhtmlMdSFguOOtxRBdzWcY6ye74i3oIc6iHEiumLVre9ES6whHfq8ZywDVQjnr9Iz1pe9ADFNkCzOnHd4qks/TVO2IgQdnR21ndhc90YCHC/3knKw95Pt5dooRNDUDC0BowJYjOK1aLKL5W1zUVipPFGh/n+02JUpX6URmi9x6mnOln5XTh7mLcWmTS+0p5ATHuHkMQtk77LPtWkUord/eDXVCxGn5k9M1hon2imuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnrms/Vbnd8LC94R99ZwPWdxhVvKJgSmwtLXBc2Pv1I=;
 b=CQTOdvKh/qLJ0cwhFcYtkv7esOSJEpQsp6txYUQt+NxwepbHlufDV0W2cFz55PJWbVHI4KuABe1I3AYyEFwGxu2fnUxb+QnQ/h6PtDPrj4WWhmwLTypFj6jWgScrRyXcus3qnu3ad0ktoLMUYx+YSyqAuvA9+UgQ1t6WsQMSoKb/w/VrQ87xHx+0mSRj+yVbm7cWFOA4v+5sxHZWCo9zQt/Lqq0f4Vbd1bzTvsjpyRUjaSWJAJaCy4Ro5trKNguksrL1nLBLz3wHxczEO8vCqi4/GiqiXfF782nt3O4cTQKsFxXdSSZMIRB2+PXA9IvcTU8FLT3DPJEACB3n5Px3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 13:03:56 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 13:03:56 +0000
Date: Fri, 15 Aug 2025 09:03:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <tursulin@ursulin.net>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 9/9 v3] drm/i915: Remove todo and comments about
 struct_mutex
Message-ID: <aJ8wNzS_W--oTxGe@intel.com>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-10-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813135035.144762-10-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db3130e-0e5e-4577-772d-08dddbfc311e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1BkWDJJU09rS1k4dE5zT2xLbXNLVzIrenl1OVJoMXNscGQrL3V4UWtpS3Bw?=
 =?utf-8?B?Vk1oQ1BhUWxnc1E4NGVpdDcvTDFNL3RobERDVGI1THRZVmk5NDdtUEVDYWJn?=
 =?utf-8?B?NUdodnYwZUFWeC92NS9Zcms4REx2WFBFbFBBRjRoaU05Wmh0eXdzRmxsT2xW?=
 =?utf-8?B?cE9Pby9CQ1dEK0JTSDNYMmVKUEs5am0wdXp4M1IvMkNFS2hUcWUvelRqK3h0?=
 =?utf-8?B?VklvYkFqWjRjSEcrUXZOZUhlcExwL3dYK3lLdkxLRlZGYkIrSGFRRHZpTStC?=
 =?utf-8?B?OTQwUC8xM3VrZlp1WkM1bDVabjNpcDVkV0hMekxISUkwdTI4VEg2OEQybzdM?=
 =?utf-8?B?eks3NDdXYmJ6OUFZdWxUUXNRblBlWDlUVnM0RGZkZGhVMGNXYkxaMXJaMXRw?=
 =?utf-8?B?eUE3ajlnVlpQL3E5VUVKcldDWDhWWmhyMklHdCs5Y3RLZ1BML211RjFwTHNo?=
 =?utf-8?B?elZMSWE4ZXdOTEt5NStBc3d6c2c5c0ErZ1BGcUZRcm9RWGFiQVprSURXTVJm?=
 =?utf-8?B?aUxMRFpDOFVnL0NUUzZ5bXdBemNDeHR6ZzZWRFUyMnZodjdjbzVuNk5ERzlP?=
 =?utf-8?B?UDlBVDdDSUgzdExmUWZSVFcwYTZGV2ZDZjFwM1FkR0Zkb0JEVndjVGliS01F?=
 =?utf-8?B?RFhLMitVYnNETGhBN2lwOVdVRFU2UVBTOGVvTUlwcjlNeUgwTXpabWg1NUVZ?=
 =?utf-8?B?YWVXTkJleHJHQ05yK3oxWEdhWWZOakdmS3c4bmZHVWE4Tlp0T2t3cnNKUzgy?=
 =?utf-8?B?WEVTYThjd0ZFaXIxUVZGdVE1Rk5relowd3JxbHk1ekIrd3E1M0FlM295WWIx?=
 =?utf-8?B?b3VPN0Mrd1Mxa3dFZGFZeGx6d1NsT2QvdmU0SU56aFJPQzlWTk1Jb2IyNHY0?=
 =?utf-8?B?dGE1cmhacVpRTnVqY1Bab1FmOUt5a25jbXFGQWRMZXQ4bjg3UGVCbkRsQjdV?=
 =?utf-8?B?c3VoSWljd1ZwVzJHRm1YWDR6ZWFUcjVkRHpaUERaZHZNditNajllU2xYQkNq?=
 =?utf-8?B?YUNJZkVsbzhZd1BEcmJPcmFhVEFuTEZMVUlNMW1rNnFoNnFQMVZkRG96aXNR?=
 =?utf-8?B?NlVqY2hzM3hFd0FWTGFRa2hYdGlYSk55SmcwY3ZJRTg4VTFxRUd2YUpQVzhC?=
 =?utf-8?B?aTZ6eFFibVdIcWdCbkJGUlB2b0pzYXdKUzdncXE4USt4OU56S0g2a1RBdGxR?=
 =?utf-8?B?dS8wbEdOa0oveTdiM1FkelVOS08yN1kxNDAxWmJMcFFHYWtadVFiN3VQWm0r?=
 =?utf-8?B?Ny9uR0dYSnhjeU5JbStvVUsyc2psbTRxd0Vlc2cycjE4d3B2TjJTSlVkTm9U?=
 =?utf-8?B?SUFZNUlUTnRYTzBieURpdWhicVFYRkhrSVI1QzFtaHY5aW9MMVRGRGhQcUxw?=
 =?utf-8?B?MmFyYmwrZy82SG03L3RHbDdPL0dvbzBGVTUwc0pMSnE5Q0JJajZMb1VhK3Bm?=
 =?utf-8?B?VkpYUC9meHpMamkyZUNNU1hUM1ZxbzJuZ0cyVU5iUUo3THROMGxyQys0QzBL?=
 =?utf-8?B?SkdLcEh3OHFyY0NRaVFoK00yMkg4cGZzUXlhTm83b1JLMm1RL2h4Ykc1NmVp?=
 =?utf-8?B?TEZvMk9VRTRwZWhPK3JoMS9qV0x4enBBMTFnTDJBK2lBRjVXaVd5WENrQVpj?=
 =?utf-8?B?ZG9tTDBHQ1NYMWZUSTdwem5RdS9udUt3ZkRsdnB2Mys1dzkrbm0xUEdlUUNL?=
 =?utf-8?B?YjFZclUwT0V0WnVQNGlqZVEwZlRXNU9FdlR5ckQ3S2JHRFJMZURSUnozRHFW?=
 =?utf-8?B?TXhVbDFvTEswbnFuTnJqMHBkY1Z4QTZzM2xjdUZqTUdHcVlRaEFxRTR3VGhu?=
 =?utf-8?B?ZGppZ3RRbC91WURtWXQ4QllpdkFZUUl6S3ZPUjdwbDVDcjg2cHdxN1NpSVJN?=
 =?utf-8?B?MVdneFd0c3kvc3ZZa2RwV2tyOVhkQmt4eml0bC9qOTB5Z05adXBjNnRnMjc3?=
 =?utf-8?Q?tFh3TGQB1MU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhnVXhPdzIxcEFJS2QzWTBucFZBcTlRSlF1MzhhK0RoVEpQTUpSUk9CZWgz?=
 =?utf-8?B?THBMTllxVTBSb0x0eXVNeHlWVTFFYmgxS2R6TXQ2b2dLOFZ3WGJtYjFrcG5H?=
 =?utf-8?B?VG5RSDBNNXNGemprbVlKL014bnVhak1LWVZyY1EyY1NHRnlVdWRPeDlCR3c0?=
 =?utf-8?B?ai9kcUF4Q1E4YUR0TThCajgzYUZUU2FxSk9tV2ZUUEdmYWIwcGFPUjVHK1k0?=
 =?utf-8?B?Q2d5R2tSaDJGeSt4Y3hkdlpCbCtpWmZEUjJQOW9xcHYxVW1Iay8wTlU0c1V3?=
 =?utf-8?B?dzh3QjNPS0NQWG13M0ZpdkJoSk5oY3pNL202Wmp4c0J0eXVCK0I3WnVBVmM5?=
 =?utf-8?B?OTZSaUZJZHdjaVNpNHJsZGJacm9EbVZFampqTUt1bHROVENFaEdMZUVsUWRV?=
 =?utf-8?B?QzJLS29Na3ZqTUJIZ0gvNW41Rk1nczJNUzJHMkJjSXBZN2l6cVNJWlJZWlZl?=
 =?utf-8?B?ZURpZDNyN3FsUEQ4d0YvT1NKRjVpUy9QRTJRNU1BdmhPMWVxR3FpMTIwZ2hH?=
 =?utf-8?B?ZDlrS3hFeEtyQmxOaHBXcTFUenVmZHc1N0JGU3FMNFJKQzBFODJzREJXK1Bv?=
 =?utf-8?B?L3FqbExsYjU0a3lpYVVYdmRsNFRXbVEwOE1IbTltcVpxaGtYaS9DallKWTRy?=
 =?utf-8?B?dm5PVHduWVVuZHpWOHpzaGhHT2dJUHhMd2EwSWFyaVNjYUIvYWJMWlgrakIz?=
 =?utf-8?B?VThha1JNRmF5UGFkY2ZxNXkrdXk1azNNcU1jYXg3MFRjMkhpMHdKTFB4QnlC?=
 =?utf-8?B?b2dtd1QvN21XVENpZ1dxeUdnckovNXhtcFVkQXJDV2NBalZlMTZRcEZwa0Fi?=
 =?utf-8?B?bzNoVmVHSkpHK2p0cVU0WEVBRjBJWXhaTG9XcGxnRVhHeUtacEJUSzBCRkM4?=
 =?utf-8?B?Y2c3SXZ4ZzdESGswMmlmOHpwbHZ4Rnh1RUJzcmxGWTJ5N0dVUjFQWkF3dG03?=
 =?utf-8?B?Z3kvVVY1UDdZL1BsaDNjNEQ0MHlSNzEzWWhJdHd3eGdibU0valdKbmQ4VFRv?=
 =?utf-8?B?N2xNd0YraVI5WHZybHdIR0FlWHZVVmg0VVI2MGdyRldKeGVuT3phbzBMK29u?=
 =?utf-8?B?ZDRXZUdZbk0xeWx5RVZyM1BlSnZqSEhNZFh3YllaREtkaVFyTlVFbGlCVDI0?=
 =?utf-8?B?RzFRQlNIbGVKemNiWDFoSUhpc1dVbzl5VEwvbzVXaWlsYVlOSXYvM2RjM3V6?=
 =?utf-8?B?SUtSN2E0S1I2RVo4cjZiSU1jd21vYnRUSWoxZUcrdHI2dmh1bmRvY3RnQkJq?=
 =?utf-8?B?OE0vN3pGUHUySE44Q3o2N0wwVXNOTVU5OHkza2dXU0t4V3Q3cjVpRy9FRUVn?=
 =?utf-8?B?N0xsdkxrSCtHRGtpeXd4OEM5akVJTjYrRXkvc2R1dkFYeXpTOEdjL0ZadTJP?=
 =?utf-8?B?aTB1N3k3bmNEWTI3dkQwbXJDYTBVVklIRFdqNnUxS2VoWjhwRE5vSmxmQWxm?=
 =?utf-8?B?aHVqQVFwbzEzYmY5bERIK1FkSGh5QytzNFV2eDNBWVYwQjR6R0RTMEZBOWVi?=
 =?utf-8?B?MXNYRTIrY2ZLc3Avb1NtVktVSDRBNVJ6S3lNZWplaGMvSTZyZ3hyOGdBUlZn?=
 =?utf-8?B?SDVrNjV2R01BVFNzM0NaNVd2clFXUDVMUmJhbFVvTXRKbHF4ZldEQzFxU3Rn?=
 =?utf-8?B?MWRTYVlwNlZrajRFWXJ1a2JFcDhMUkJXTllDTFRQVHdUTWltT2MwZmNKWkV5?=
 =?utf-8?B?TGNFK1ZVSCt2Ylp5encxRDlmUGRlVzBSWjlnVjB1cVJaNnNXSzltTE1EWDJl?=
 =?utf-8?B?OUIvZ3psOHYybU5iR2JLMTJxQUNGZm5hbVlHekUvb0FwMHdaVjJ4Q25qK09B?=
 =?utf-8?B?bTN0Z1hNUGpsOVd1blBpRFY5Tkh0M0VVVkdOSTdSa3pjNGE0Sk9jNmE0OUI4?=
 =?utf-8?B?R2Y5bkVReGtBaGlkZ3ZxejJnYy9tOUhYN1dRMFlYTmV1UXJXUXNGL0JyeG5j?=
 =?utf-8?B?eUY3MnlCNG1hd3Qrak5zMGxKSFhNQXdaVUhvb2NFM2pxc3pvNVQwOXdERGtY?=
 =?utf-8?B?UHJWb0haWXVtM205emh2b2t3djMxb1pYQjFXY3crOVJoaHpRVm02b1BvZTFY?=
 =?utf-8?B?K0g2Y3M3N25jRG1GVkpxckplTDFCak8xbUFBdWYxZmd2WS8yU0hIMGkwSk9O?=
 =?utf-8?Q?4QIwLdEHM8DNo64qR+1dSor3V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db3130e-0e5e-4577-772d-08dddbfc311e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 13:03:56.2143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqrb/NUBvSaQKdBVylHa7xgHk6TXkInAsPRAtjgn2ooaeOhJpVxuxiwaq5Vb7bV/r1n0vc61c2nxdbhfHlKGaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

On Wed, Aug 13, 2025 at 10:50:33AM -0300, Luiz Otavio Mello wrote:
> This patch completes the removal of struct_mutex from the driver.
> 
> Remove the related TODO item, as the transition away from struct_mutex
> is now complete.
> 
> Also clean up references to struct_mutex in i915.rst to avoid outdated
> documentation.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/i915.rst |  7 -------
>  Documentation/gpu/todo.rst | 25 -------------------------

drm,drm-misc maintainers, ack to merge this through drm-intel-next?

>  2 files changed, 32 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 72932fa31b8d..eba09c3ddce4 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -358,8 +358,6 @@ Locking Guidelines
>  #. All locking rules and interface contracts with cross-driver interfaces
>     (dma-buf, dma_fence) need to be followed.
>  
> -#. No struct_mutex anywhere in the code
> -
>  #. dma_resv will be the outermost lock (when needed) and ww_acquire_ctx
>     is to be hoisted at highest level and passed down within i915_gem_ctx
>     in the call chain
> @@ -367,11 +365,6 @@ Locking Guidelines
>  #. While holding lru/memory manager (buddy, drm_mm, whatever) locks
>     system memory allocations are not allowed
>  
> -	* Enforce this by priming lockdep (with fs_reclaim). If we
> -	  allocate memory while holding these looks we get a rehash
> -	  of the shrinker vs. struct_mutex saga, and that would be
> -	  real bad.
> -
>  #. Do not nest different lru/memory manager locks within each other.
>     Take them in turn to update memory allocations, relying on the object’s
>     dma_resv ww_mutex to serialize against other operations.
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 92db80793bba..b5f58b4274b1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -173,31 +173,6 @@ Contact: Simona Vetter
>  
>  Level: Intermediate
>  
> -Get rid of dev->struct_mutex from GEM drivers
> ----------------------------------------------
> -
> -``dev->struct_mutex`` is the Big DRM Lock from legacy days and infested
> -everything. Nowadays in modern drivers the only bit where it's mandatory is
> -serializing GEM buffer object destruction. Which unfortunately means drivers
> -have to keep track of that lock and either call ``unreference`` or
> -``unreference_locked`` depending upon context.
> -
> -Core GEM doesn't have a need for ``struct_mutex`` any more since kernel 4.8,
> -and there's a GEM object ``free`` callback for any drivers which are
> -entirely ``struct_mutex`` free.
> -
> -For drivers that need ``struct_mutex`` it should be replaced with a driver-
> -private lock. The tricky part is the BO free functions, since those can't
> -reliably take that lock any more. Instead state needs to be protected with
> -suitable subordinate locks or some cleanup work pushed to a worker thread. For
> -performance-critical drivers it might also be better to go with a more
> -fine-grained per-buffer object and per-context lockings scheme. Currently only
> -the ``msm`` and `i915` drivers use ``struct_mutex``.
> -
> -Contact: Simona Vetter, respective driver maintainers
> -
> -Level: Advanced
> -
>  Move Buffer Object Locking to dma_resv_lock()
>  ---------------------------------------------
>  
> -- 
> 2.50.1
> 
