Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36793C3105C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22B10E5CD;
	Tue,  4 Nov 2025 12:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNeyQy/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9217A10E406;
 Tue,  4 Nov 2025 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762259952; x=1793795952;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xi1VjvopUT4ObxbJaz3uxvejkqQnV1Vn/V1q1JnrXJQ=;
 b=gNeyQy/KPRwEl9NHvSDmDT5ygdCQo9Ui6rSSNAE7cHkt0GemoQkVYAUJ
 vMmHcbSLdzmFfO7b65UVdOlx53cUSxf/py2HdXLLmUt7nYtrFJYQSrR77
 /Vf1+UMP8e7ZmV8iawXttMk8gfFMU5ez+XNeFlR5tJOVb4E2A7B1YelX+
 efdUsmJYcEB1P0Yk8B76XoTL1h5ZAVOoyDud54TQZN8Y7LMdULAeJXZt6
 ZpBvw8STvuR9uiwm/ObxtvdNZat2vZPHWmPUQzqkhH4Kz/PTBuLpjqkna
 p7RmqLTIRbw/9+cquOHRvAeBxePuoMHxdOy8Nb5OpunZZRw/8YQvWPbtF g==;
X-CSE-ConnectionGUID: 8REe9iqWTCWy9v/trl/n8Q==
X-CSE-MsgGUID: V3ngk0+ZSJC2e0k7EPXBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89815691"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="89815691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:39:11 -0800
X-CSE-ConnectionGUID: DzfpqFntRmG2yO2jEtrmvQ==
X-CSE-MsgGUID: 5s01rrM9SoCUYccaShdTSg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:39:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:39:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 04:39:10 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:39:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKnaoFPkhpsK/99+Ev7aiPNtyTNq2KQE3nFE9I4TMlOkfdv02njlsVDqixHf8zsccvJti2wkRJoMM1OofX2rfJ/5FHhveqL2pPoVmBe351gBWq3uoL7mWoKCNOw8xHq+YxTIfqPj4e2AxdxnQG9t7yRTrElG+Rs9meT2YPIAbFyjGThTqUhK9sE8bZsivCP9roLQY+Pn9Qm5REwiOyRjqmfMd13r2FUYQahXP1Pr1RGsvCfb2wquQ6lKgewv5QjydVhHRLEEK2u7ZEj7IzaY2OEeX/fBhpp0RBPoEuWgfb40w3KP1BC0iztZg9OEMhY+iTfO45Y4+kc/7dOdq/CRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVBOQmVvVfj0hAp7RU6e0wxzRRD6ifImNdrL+cR1T6w=;
 b=dZkyMkU7BMGKCnkTnSTGuwaLluwTXFpaa9gTVNu+j40umpg8IWqzlCYmvo5asPR9eg1rctUdjKWG9TeIb4unUrJaZR089XXpnhKx/ohZsUZh2Vxc1ktwPQ1O5NfRNGSy4+u6WYoV0a/4cHYZUB9XOGKaPreCkUfL/IvUZEHDoMdtpb5GWpe7OU7zuVoYzrp8iXpHxr+iWnJqi0CQgOks3Xniuu4tSIEkojHXm0TlUU1zXWWSz9dpBM9StcKHBXbTAJbBjzgSQUAl72QeHxl0d1xnCgxnJx1WoePH6d1Wjiq91F8qK5OaO2nxxFqlc/qTX2NYnlLIW+YwZgmDGnbBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Tue, 4 Nov 2025 12:39:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 12:39:08 +0000
Date: Tue, 4 Nov 2025 13:39:04 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 22/28] drm/xe/pf: Handle VRAM migration data as part
 of PF control
Message-ID: <dwcgtmtzzx3bjp5ibl2gzrp52gshna6iydi556p5lxd5ofk7sp@f67aavazuzu4>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-23-michal.winiarski@intel.com>
 <aQkuqa8u6nFVo26k@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQkuqa8u6nFVo26k@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BE1P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b96265c-2eb5-4145-35bf-08de1b9f25cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L010cWRIZGl6ajVzOC9HcVFMNHNJd0lqTjNQTUtZZk9zVFQzMnhQa2g1YU9E?=
 =?utf-8?B?bVVMeS95Tnk1S0dhcnlSSHRpQjExNjdqWmRaZ2M1R1E0MHF3MlhwcDg4VGkz?=
 =?utf-8?B?SllmY1hjZ2ttOXdwT0ZMb2cxVkJEMy9oUHFDLzZOaDV3R21KVVMrM1Y5ekI5?=
 =?utf-8?B?eUppNGxHZzNGK1hBemsyNFdZTnFzOGJNTXJCWlFHZHhVdUhCN0N3MEVVRzlN?=
 =?utf-8?B?THNCcU5xbnZ0cHlPYVJVUkkxMUErdFo2WVR3ZVpKek40Yjk1Wnd2dCtnQU5Z?=
 =?utf-8?B?VEoxTDN3KzFTMTREem8vYzB3RlFkaDZJeHdtUW9hWTd0VHFBUDk2c3lCZ01G?=
 =?utf-8?B?ZXpBNTU0cEVhejl3Nm5Jd2NQMTBIRkJGZXduUGQvMHRFMG85eXhZOU9HRmlY?=
 =?utf-8?B?Y2RqZldvWTRzNlArVm1HdXBVYSt3T1d6cFVtZTlzRTE4LzhMbkJROEhOMC9v?=
 =?utf-8?B?V0xxeVNTVHQyLzJvd244blVpbXJOM2hhMUVtZi9yWkRlSlB6azVtd1pNbzVk?=
 =?utf-8?B?b2FQUThCa0Q2ZEN4OUdHR2xKUEhhU1NMSkc2ZG9YU3N0UGdHbXU5TmRSSHZX?=
 =?utf-8?B?a3lwdXVaYmZsTDFXVEFHVVNhTVREUk56eVNoL05DVjBGSUhlYzBHQzRmWXlX?=
 =?utf-8?B?NW5Ba3JpY1E2VkFkRW5Ic2ZXZW5vd01JWUtDWnVlRThCV0VhckFDL1RlaVdr?=
 =?utf-8?B?NHZkc2hwTFFjeldxK0V0M21FRkF5K2ppdHU2SVErdTU3M242eVRVdXFnNXAz?=
 =?utf-8?B?d21KaWkvVyt2OFFHbXVtSWNZNVdaZ2N0TjZRQUc4K2I1V3dxZGxxU3hDSHhO?=
 =?utf-8?B?ZnpJQ2c5Rkw4aUUxc3YvZjRaZVdCSTRSSDlEZjZobEd1N3I2NjFvdmZnY1JG?=
 =?utf-8?B?Sy9HVElUTmNYbzV6cXJDNzV1OHF0TEZpU2lmMnFHZTFzWm9nQ21RcENaa1ZH?=
 =?utf-8?B?V1k2Q0c1OUpEWGd6NzZhd2VVRjlVeExQZWdtb2U1VEc5MXdUcjZXMHgwS0RJ?=
 =?utf-8?B?dUN6VWlFb3pYVE8wYzIwb0srK3FjaXRKSnp0dnlUUGNXeCtNU2ZyVm5yQWMw?=
 =?utf-8?B?MnlERDRRd01TK0xDTUlMa213ZlZrdW5rNWh0Y0NxMGl1U2dxZmdYZUE5RTEr?=
 =?utf-8?B?Q2pjRFQvdUhlM1NoYjNlMFVCejZ1VVEyVWJOa2RjUml1cE1MM2lRWGNETml5?=
 =?utf-8?B?TmRFR3YwZGt5WHg1ekh1NU1CVThHNzEzeTV4VDdQY01uQTl0THNFK1FXbXNW?=
 =?utf-8?B?Q3VqcUtEeFJrTEN6ekZPUWxjMksxeDR4NVB2VUFzNy9wT0RWM0FITXh1cnFq?=
 =?utf-8?B?cEFvUmdmdk54VXlzeFFWaEdwak1HeDJ0Q0pGb1RKN3dMTGgrNERtMGZrZGI3?=
 =?utf-8?B?TUhUSUVLU3FmZHlEVHAzbkdzbzgzU1MxOEZESHJQbDdtYlpaa09QNk1HcTRz?=
 =?utf-8?B?bnhnMWxwdlU1QzltakhIM2xhVnU3akdvRy9uY1VrbE5kWFg4dGkzV2lnQi9Q?=
 =?utf-8?B?aGJZYW1WcFdPNkx2ckUvUVhYei83ZnQzbE5rTjZpRU1KQk9yZ0l0a2ZMdmdp?=
 =?utf-8?B?MUxoSUxxYVJzNGF6bmVVSlFGcHZQcXJSbzlLc3B6Z3NjenBWQ1ZlcHJNS1FW?=
 =?utf-8?B?bnZ4ZmRNRzU5L2M1VDc5LytyVEwxRWVKbTFjbEFmdkpXdWROdGc0MmoyTXZT?=
 =?utf-8?B?ZVlnRlI2V1RsZjlJTWdQS1I4OW1KSy9yaEJXVFR6NGFQNUxlYWE0bkppZlZB?=
 =?utf-8?B?bzlqd1hLdW53dHJMbWV6UEQ4RVBXenlVUmJhdkY3TExMNEVYbCtFbENiSG5O?=
 =?utf-8?B?eC9zWStvWU12NnArY21mRHdMZkh3RW9NMnNUcFF3ZW0walBqRWs1TkpZUmND?=
 =?utf-8?B?L0ErREdIUmNjeHFCZmc5Q1BrRjJWWkFqcFFsdWp6QmplL3UvVWE5Uzc2SDNt?=
 =?utf-8?Q?5TApC2twBCCvKKPQk/Tr9Zkcw7LRFzqW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blppTkZ1aU80U21QcTkyTXBFNlMvQXRGdnphWkx1SlZvQXNhZXdGeGpPMTZh?=
 =?utf-8?B?WkY0a1R4NWhZdDdJQVdZd3o3NDh6MCtXbUViVEkzNFpBV1lnVDNHbHZTY0hS?=
 =?utf-8?B?MDZKT2dkSmVzVlFHZzBGYUNWVXpYWmZIYVRHQzdac3k4dERaSUpybVg0bzlI?=
 =?utf-8?B?NGFhVzVQZUs4aW9FYjNSbUwzaFNOVEdZL3FCTnU4R0JmQ3NKS09kNk5UeGk0?=
 =?utf-8?B?c0tYSzE0TGJnWVFZM081VnBUcTlZRDgySUZrYWprSVJZa1BEc3NlNWV3RW9U?=
 =?utf-8?B?K2R1bDIwVzVLLzYxN3U1WTlTSXdOYXIvU2tvcGlJV2xEZVJnYjZYMjluYkJa?=
 =?utf-8?B?Z3pCN0ZWSlZyd21oSWl3NGV2emJQaVNWT0R1YUhFVFk0MHd4aFUyb1orTXdn?=
 =?utf-8?B?RGxJbUVPcE5HY3MvajlCaWROUkdGc1YxRG8wOHdjdjdya2htRDRVT0FuSmM3?=
 =?utf-8?B?ZnpDOWdTWmpxM2k0Z3VmQVV5QUpTeDNqMVlMMW1zRkt1YXptRTcvTVdaQXFV?=
 =?utf-8?B?NHl4K3VFNU5oVmdHYmk5MjVwTFNGckNIb2xnbXA5N2F5TFFrYi9uTmhzNEZi?=
 =?utf-8?B?cUVhZ2VvTzYraUc4RDh6eit3VzJubGpUdGtxbnZ2TmNOTDUrbnBpdGdDNXV2?=
 =?utf-8?B?N2Z0QkZhYjVOOENtVUxVK0FTYU9sc3ZjRDBaVzhnQ2pXNE9uWFdlYkRjOWR1?=
 =?utf-8?B?MjZNc25PbVltaDI5dFBxOVVzMHpOUWh6RFFxeGxRcHZOaDExUEY2NzV4NVpu?=
 =?utf-8?B?QzJ6MjBzVmZ2T1hmUVRPZnVDck9WUTkzdEc2UktnVWtKU3ZpTmczUjZGaTZJ?=
 =?utf-8?B?aEdnUmlUM2gvMlFyS3pqL0t6YUNLWXVpZnJKL2V0dW9uTHJGZ1dwSzBPUVpm?=
 =?utf-8?B?UUdWTXJOSWVZZ3ZLUWZkb0Z2a0g5NDVScmd3WWFwVERJbEFEbFlaeXlrZWI3?=
 =?utf-8?B?L3J1UFpQWTNReEphaVdjaXBTYUNNWHFVU3BGdTJEaUF6akJ0NHJUWG1SaHdU?=
 =?utf-8?B?Z21BZ1Q5VWxQTlpuaGRjeTU3UkZ1bGtLOHhLWHdaanZTQkVNcmgxVCtMdWo0?=
 =?utf-8?B?bFJzQk04Wk9zV1d2NnlxVmVWVi9UaXNETXpMSXhQd1JZWW9peVlqd240OWlw?=
 =?utf-8?B?eEVySVMyQWx5aytIL09PZ3dFeFpuNS9INExLSUlSeTNTM2FlZFhvNWsyOHZU?=
 =?utf-8?B?K1l3RTgvSmx2cm5MRjI0dnp5Ri9yUWlwelZnSkM1TGp6SkNDVy8yMmxiYmlM?=
 =?utf-8?B?ZjJadlE1MkhkU1NSM29kRU1naVh1clAvOWN5TVVJemxzOWZJaldwWis5dEVY?=
 =?utf-8?B?eVdWaTF5cnZldjBlTEw0cGw4M0U5eE45NmpNVjRyRGRHQnR3c3FReE1sUEQ4?=
 =?utf-8?B?dDZvOVZlTTg3cHUybFcyaEF0aTRjb1cvUjlMQnhGNVkya3F5NXh1MXhUaFlh?=
 =?utf-8?B?TWtsWUhvcTJORjZ6L0RxcFRJVVptQ2MvbzFVSkxpL1QzY2dvUFM0bjZxZkFZ?=
 =?utf-8?B?ODBFNlJJSS9qSDF4YTd0QkxJS29aQkRLOGZrbStzd2k3Z2F6OE5wZ3REdzZl?=
 =?utf-8?B?Ti9QTUJMaFpmdHIvTklhejZLbC80YlZIV1JSa1B2M3Rka1dHY0xDa2JhRjV5?=
 =?utf-8?B?aGFlRDhhUkhGcmZRREg4bDc3dmdEb1JySE1RK2pidjlSQzdBY2pGMllZT0Ix?=
 =?utf-8?B?aVFtQVdENEw5eDFmbnpSenNFVS9lRkJkVTJCU0pSUU15QWM1dWYyWCtkdy9X?=
 =?utf-8?B?TitPYm5NUTQvYXZrMU9JNU1QaEhXdlBZREtCbWtKRmRWYm5Ba3J4ZFpiSEky?=
 =?utf-8?B?RHF3R0JkM2ZxY2dWanZOdUQ3R2xtdlFjTllyeHBod0g4UG14K1oveXA5T0dX?=
 =?utf-8?B?MUFZeWdIUFNDeFE4N0t5UThpUnFCQUNVZGJJY2k2OVhhT25oNHpYa3ZmeTlz?=
 =?utf-8?B?Y2tHMlRoQkZUdFpPOUFScmhjL211eUJNN3JQYkhpVVRvREpOMVE0SlpTaVV4?=
 =?utf-8?B?UWxlUmtVVlpiV2doL0hCMWdXZ05HREJmbmtVcmx1RERCTmppNlJTMU5HU0Ni?=
 =?utf-8?B?YmcvcUpobzlxc0tJb1ZncFJjNGRyYUVXeDBoTWZoOGM4eW1JaHExeWswMEdS?=
 =?utf-8?B?bTdCNVI1MjBGV09VdkQ4QzJSeDRqbitDNFV1Kys2K0MzOHBJNVpmL2sza0xw?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b96265c-2eb5-4145-35bf-08de1b9f25cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 12:39:08.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYzYv3oTPhSklDJB8djcIjeLPjwtb6NpQwBrfDEwPIX2FN6HyAuK90GWTLjwRP+fBmNfQy51wp5y3qk0pzAKPWrxP+gdx1Op6C7Ksvr7Tjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
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

On Mon, Nov 03, 2025 at 02:37:29PM -0800, Matthew Brost wrote:
> On Thu, Oct 30, 2025 at 09:31:29PM +0100, Michał Winiarski wrote:
> > Connect the helpers to allow save and restore of VRAM migration data in
> > stop_copy / resume device state.
> > 
> > Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 213 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   5 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
> >  5 files changed, 238 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 7cd7cae950bc7..de0f63610e780 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -880,6 +880,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> >  		return -EAGAIN;
> >  	}
> >  
> > +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM)) {
> > +		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
> > +		if (ret == -EAGAIN)
> > +			return -EAGAIN;
> > +		else if (ret)
> > +			return ret;
> > +
> > +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM);
> > +
> > +		return -EAGAIN;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1095,6 +1107,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> >  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> >  		break;
> > +	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
> > +		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
> > +		break;
> >  	default:
> >  		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 5e90aeafeeb41..7ccd43545fdac 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_migrate.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_migration_data.h"
> > @@ -505,6 +506,207 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> >  	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
> >  }
> >  
> > +static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!xe_gt_is_main_type(gt))
> > +		return 0;
> > +
> > +	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
> > +}
> > +
> > +static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
> > +						struct xe_bo *vram, u64 vram_offset,
> > +						struct xe_bo *sysmem, u64 sysmem_offset,
> > +						size_t size, bool save)
> > +{
> > +	struct dma_fence *ret = NULL;
> > +	struct drm_exec exec;
> > +	int err;
> > +
> > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> 
> It is a bit incongruent that the dma-resv lock is interruptible here.
> 
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err) {
> > +			ret = ERR_PTR(err);
> > +			goto err;
> > +		}
> > +
> > +		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err) {
> > +			ret = ERR_PTR(err);
> > +			goto err;
> > +		}
> > +	}
> > +
> > +	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
> > +					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
> > +
> > +err:
> > +	drm_exec_fini(&exec);
> > +
> > +	return ret;
> > +}
> > +
> > +#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
> > +static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
> > +			      struct xe_bo *src_vram, u64 src_vram_offset,
> > +			      size_t size)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +	struct dma_fence *fence;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> > +					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> > +					   src_vram_offset, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	fence = __pf_save_restore_vram(gt, vfid,
> > +				       src_vram, src_vram_offset,
> > +				       data->bo, 0, size, true);
> > +
> > +	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
> 
> Then here the dma-fence wait is non-interruptible.
> 
> > +	dma_fence_put(fence);
> > +	if (!ret) {
> > +		ret = -ETIME;
> > +		goto fail;
> > +	}
> > +
> > +	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data save (%zu bytes)\n", vfid, size);
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_sriov_migration_data_free(data);
> > +	return ret;
> > +}
> > +
> > +#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
> > +static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	loff_t *offset = &migration->save.vram_offset;
> > +	struct xe_bo *vram;
> > +	size_t vram_size, chunk_size;
> > +	int ret;
> > +
> > +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> > +	if (!vram)
> > +		return -ENXIO;
> > +
> > +	vram_size = xe_bo_size(vram);
> > +
> > +	xe_gt_assert(gt, *offset < vram_size);
> > +
> > +	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
> > +
> > +	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	*offset += chunk_size;
> > +
> > +	xe_bo_put(vram);
> > +
> > +	if (*offset < vram_size)
> > +		return -EAGAIN;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_bo_put(vram);
> > +	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> > +	return ret;
> > +}
> > +
> > +static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
> > +				       struct xe_sriov_migration_data *data)
> > +{
> > +	u64 end = data->hdr.offset + data->hdr.size;
> > +	struct dma_fence *fence;
> > +	struct xe_bo *vram;
> > +	size_t size;
> > +	int ret = 0;
> > +
> > +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> > +	if (!vram)
> > +		return -ENXIO;
> > +
> > +	size = xe_bo_size(vram);
> > +
> > +	if (end > size || end < data->hdr.size) {
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data restore (%llu bytes)\n", vfid, data->size);
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
> > +				       data->bo, 0, data->hdr.size, false);
> > +	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
> 
> And also here the dma-fence wait is non-interruptible.
> 
> Aside from the incongruence, the usage of drm-exec, dma-fences looks correct.

All of this code is executed from the PF control state worker, so using
non-interruptible sleep is fine.
I'll drop the DRM_EXEC_INTERRUPTIBLE_WAIT flag from drm_exec_init().

Thanks,
-Michał

> 
> Matt
> 
> > +	dma_fence_put(fence);
> > +	if (!ret) {
> > +		ret = -ETIME;
> > +		goto err;
> > +	}
> > +
> > +	return 0;
> > +err:
> > +	xe_bo_put(vram);
> > +	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_save_vf_vram_mig_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_restore_vf_vram_mig_data(gt, vfid, data);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
> >   * @gt: the &xe_gt
> > @@ -544,6 +746,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  		size += sizeof(struct xe_sriov_pf_migration_hdr);
> >  	total += size;
> >  
> > +	size = pf_migration_vram_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	if (size > 0)
> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> > @@ -602,6 +811,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> >  	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> >  
> >  	migration->save.data_remaining = 0;
> > +	migration->save.vram_offset = 0;
> >  
> >  	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
> >  	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
> > @@ -611,6 +821,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> >  
> >  	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
> >  	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
> > +
> > +	if (pf_migration_vram_size(gt, vfid) > 0)
> > +		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_VRAM, &migration->save.data_remaining);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index b0eec94fea3a6..85b43b2cceb73 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -25,6 +25,11 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> >  int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_migration_data *data);
> > +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> > +
> > +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
> >  
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 9f24878690d9c..f50c64241e9c0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
> >  	struct {
> >  		/** @save.data_remaining: bitmap of migration types that need to be saved */
> >  		unsigned long data_remaining;
> > +		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
> > +		loff_t vram_offset;
> >  	} save;
> >  };
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > index c2768848daba1..aac8ecb861545 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_printk.h"
> > @@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
> >  		return ret;
> >  
> >  	for_each_gt(gt, xe, id) {
> > +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> > +
> >  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
> >  		if (ret)
> >  			return ret;
> > -- 
> > 2.50.1
> > 
