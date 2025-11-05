Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2CC3640A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3FB10E7A0;
	Wed,  5 Nov 2025 15:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kb2XZZNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D879210E799;
 Wed,  5 Nov 2025 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355559; x=1793891559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xrDqACs55GE84yhC3cTxkO+49b3d2eMUulfmyH/0AYE=;
 b=kb2XZZNivbjLPgEoKmcSm3kzChpOt4DGK6d8hxk5zoPXikZ6CMG7ppEa
 x0VYXF28uZ0iFKYA1kX5NYwPPLnXQPa+JULRUxTZHPyOJiA4do5Tpp2JF
 wRPLnfa0A70XldZEi3piJlKz9AGQqreVpcoi7VW6p6ROcJCneoXUj+KWU
 qJh1WqHUbjoarkdWDCNmOpp09BtZbwludndImuRE6hLBG+AF0meME95vB
 log0BJKKeKiksd6eD0sPiuMstepsB4iSz3eV8bcV/T7p2mWTsihBOiwix
 riUiiBQQF/4qPnIFMzhD4Ez+Oi7TRfFz18Rswdy1yND8sv0N64YAkFu66 w==;
X-CSE-ConnectionGUID: gftZR/JbS7StQ9bbubv5lw==
X-CSE-MsgGUID: wDYPe5cpTP2JgMor7Bdh9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64510054"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64510054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:38 -0800
X-CSE-ConnectionGUID: SAQr2QQ+QWKLWrE26CeBEw==
X-CSE-MsgGUID: 09DsiPRuTi6IQivr8tCH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="224725793"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CINThGvocwOFwKcggbeB8ASxpxcVipQ0J3UWC/VBzCta6cy4kxvBol+oAeEhWToKtddISxzgCkmrEUKUjN6I9MQ4DRMY3MZ3PtepjuwD4KTet+l98dR3Z+dbT90LIcehx2E87kMNyIFYLEE2Iu/Gr9h3Df/Ni2iyjmcvVPZFplWPN29FG45bSU9yASgv8KLink94SY2EE9t9+t+hlsOY1JfWDg1jfYZeQN1O9xaugOeO8ZvaA7w+HG7xkGtRWLKkWZPyb86eyNtIDEkc0WVv/axXSrUmpRS9ZRjENcuoDZ4iYrFEsXUJT+aQHysFypllmy+uEJJ9FhW94OcxpE1N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8294im0xXfz1hbayPsQiXLJS+lPMDYkWyoQ7u3SaKY=;
 b=fUMXNliNINi6HEhCIoUUOS+X9UzsF3qNrOtOzPw+yT0lJKYItWes4Q4isDRcdcQZc2jP3rU5yVkBu7Ly18OcfCwQl2WBMHt++epAgzhaWCx7kP4OL4Iv2OTkPHJG+EgCttDk08j93YAs6y7MT5+bfVwpYcRPgjskscDn9WgHaaA4fAO9ruF2AfSU7VJT5q6vkSxyxNMLNMriAx/+ue+b8fFkOb892u/M1K9xcwJoYvbub6/7fBM6TjZx+YPkmEgGlL7fDzslT6AR/VW2np3LAguK4IWfq/zvTO7Jt0TC0yk5R870E7/4ZJt13QPIKrS+p7XnHJwzOOdjhB+OQ37pDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 21/28] drm/xe/migrate: Add function to copy of VRAM data in
 chunks
Date: Wed, 5 Nov 2025 16:10:19 +0100
Message-ID: <20251105151027.540712-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5477502b-6cee-41e6-98a5-08de1c7dc063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1BiZnlrSWRubjFNdDRjS1ZnNkdFTXZpdGNHdENaQlFSTnFkZmE0STVtVFpS?=
 =?utf-8?B?bmtrUTFuSlhLNE9qd1l6c2pZMXlPSDFjaXBtMzFnK2hlbUczcVdJV0x5eDZP?=
 =?utf-8?B?d0VNR3pXMzI2V2JSLzdNbjJYS1lwMWFmYmdTenFoS2lFQUVVTGZDRXhFaVA3?=
 =?utf-8?B?LytFaEZ2cGZlNzJ6MjlwWVIrdGhjMkJzYVdpME5WMzZIN3NqS0tnRTNNQUpT?=
 =?utf-8?B?N1FHNzV0Wi95cDNYbGpzSUV4OTAxRFoxbFlMUTVDNWlzMXJNaDRRdHNycnlT?=
 =?utf-8?B?Wmljd0xTRE05bnpBSXVHakl2MHFKc0JmbHNETGNvcGhjYU5NYW9hbktCT3Az?=
 =?utf-8?B?SXFsZms1cDZWcmRBTkZKdWJjSjRaamVRQ3hRVC9FMGZ0NTVoRmZMamhzblVZ?=
 =?utf-8?B?RDR3Y2Qwa3BTcldYcWovQWtSbG1tTzVLbXdXcGcrQ0xOUHgxS3NsWU1aLytu?=
 =?utf-8?B?R0tRL0JOeHczYi9IY2VKV1VPMWxWU1BpbCtlL3FxUTlHVkpwZnJFODlPdU94?=
 =?utf-8?B?Q2NQZzljMXZxKzFUUU5RMHJMZzcvamh2ZUdYcyt4VFp3empnWkVaVDZnNVlX?=
 =?utf-8?B?WlcwNFVBWVByV0luVHo2RGVUYW9PYk1uR0xRRk1kMENsZG9ydDUzV3pab2w1?=
 =?utf-8?B?ekpTcWlKaTVyR2FhaW1NV3duc1BLbzIwM1lXMlRrWnlCNTdXNm54SlBwcEpI?=
 =?utf-8?B?bVBubVJuaUdyckxJOHBnaDRyU3M3b2ZSajZEVlQ4dnNuVVRHMFJFMW45K2E3?=
 =?utf-8?B?OU1hWUVXQU9RMjMxekd3bWE4UStLWlBYRmJ3NTZqQldMaFprdHBsMnBoeUk1?=
 =?utf-8?B?ejFGbTg2ZlRaRlZEUzlLcEdKVG12elF5ajJ0MjBPa1hGQ0FlV21XL2dPbjJr?=
 =?utf-8?B?Qy92SEZzcjVWTmVmK3lTMkxlcDBGdnVxMzhaN0RLN2pHbDhYL3ZDRGdMcHBi?=
 =?utf-8?B?WE5uSUE0WGZIM2YzbmdhaUJnQmpiSG9nNUtOWmQ5VFExZ0IvUXBORkhEMG1h?=
 =?utf-8?B?SjIxTVFQdi9xU3dIUDAzbUc1Rkh5SndaZEhVSzNLTDFXRkpyNFpUdjZxZStB?=
 =?utf-8?B?elpEbnRQNG5HdGlqeGl6N1JFWnE5eXV0VmgrV2EwUGJodDdMVnFuUzYwOTRz?=
 =?utf-8?B?QUhnUmhnT3BJb3pFOGl6aDl5VGFNajF2NnVzWHg1dzROWDJUTnNQNEVuREEy?=
 =?utf-8?B?N292cTZTMnhaT0dteWF0WnpVVmZqTlFsWkMxejlUeENPSnZTcktIZEdia2xv?=
 =?utf-8?B?MmVsd0tmb1U4TEY2VzZmdlhETUkxSzBIMWNJY1o3YThoUmJhVDZjS1lybDVz?=
 =?utf-8?B?a2xZNlpGNDFwM0ZTSlF0RHkwUHhVOUlqSWI5a1JkekxNV2ttLzlxbDBybTZD?=
 =?utf-8?B?bEF6QjNIcVB6S0V5L0h0SkprL1dxekg3VmNiamxIY2JBZnhuOHJTU0o2WXhG?=
 =?utf-8?B?VXAvOTV0RElQT0NYdlBBVVgwOFFDN1VJb2hlemsvWHljd2U0dTBWRHFlYjVH?=
 =?utf-8?B?SXFPUEh2cEprUEtocGZickFWbzlmdnJRWCtyeGhhODNpNWFKM3gzc3lMN2xj?=
 =?utf-8?B?VEEvSWNBSG5EeS85YlZpWkZxU1BFdkhLeVQvM1JyNFUrSDdMUEpjcHRmdmQ3?=
 =?utf-8?B?RTArL2FOMytXRGlUWFBNWDZHR2g5My9NUHNvNzlHUGFIcUFyVXVHSFNZVnpO?=
 =?utf-8?B?RlZmY3RnKzVQMFpjMlhYSEQxM2hGalF0Qld4ejZOWGlvQnJ4RFgzS1J4TS9E?=
 =?utf-8?B?WlNzK091dnVvMjN4azRTMFg3Y0pwbzR1NEQxTWFMOXNjWDhXVnBWTEUwL1NB?=
 =?utf-8?B?dUowQW9jSkptaG5SdkkzSW16UUdvcTNWeWxQSk1CODFnaXBLSnk5dXdCdmMr?=
 =?utf-8?B?elNUdU9Rb1BJUU44TGcvU2x2eWN1b1pPUjROVnJOWWdjeEFtZi9pa2lCeWdG?=
 =?utf-8?B?Ym1ZRXRYc3lTbThIVUtXVks5TVRTeEF1M0lJNk9QM3BERFlNdXVhWERBTk5S?=
 =?utf-8?Q?ejQo3vojfK5p2e4xhoOuU3dkzEIPLY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0dQTHpZR2I1V0h6TFhxL1VLZ0xhRVR1bXhnTkV4ZGZXY1BGZjZVclRuN0dV?=
 =?utf-8?B?SWFYNlNZdk9mUFpkSlh5WDZpQ1RBVDNDd0lrTTkreUEwZkZxM0YrOHMwdnZS?=
 =?utf-8?B?a1M3Y2Z3MnMveDZFSzJQR3hmYlkxM1pJamVtRzAyeFk5YlYxSHczUlNVU21s?=
 =?utf-8?B?WkMySmszSU5JMmlIQmZHMEVjYjVoUEFabXN6cDZNWXB5VkpMSGlLd21qYTdt?=
 =?utf-8?B?NWdoQkl6U0doSXdGY2VDalAvcE05aE5HTlQ3RlEvMGJqWUs2aGRhNmJ6NmNq?=
 =?utf-8?B?cVFzUytxRXBwYyt1M0RMckFidXNhbXIzdEcwQ2x4R1BVOXJrYXdTTDZXMDIy?=
 =?utf-8?B?TWQwSmM0NkJTT3ZqRDhMZEJxTHNMRmQrbGNxL0hVMHhlRHBvSitDWDV4Q1JQ?=
 =?utf-8?B?akFwaWtUMkN3SmUyTjVsaFJMaWs4Q3FWaStjTXJpRkxDQ2JMVWdvaHZqdGxX?=
 =?utf-8?B?RmwrbTRSMHBnZTZHUzRyZDFGbEF5NmVwSi9jVDhkT2htdlMyNnQrRm1uMHEz?=
 =?utf-8?B?ZzZYNStBbCtqZlJUMS9saWJIdVJXQWxPb2t0ZDJxSnNIN0paTU1adndBSlBw?=
 =?utf-8?B?YnZ1Sk8vSmUxWHkrc09lRWF6TE1EakFVT0dWWUxQWGlkWWlLVFJtTzlpSXNU?=
 =?utf-8?B?TDZuU2gxWEl1RndtYnhrRi9nSlpLdlpzcHFnSm43WmE1UjlkbUZQNFRDRHl5?=
 =?utf-8?B?LytxQTUxd0FKYjdYR0JSbjdEYXNlT3kvVkJsa2VFcVh2b3NZaFZrRlowTi9y?=
 =?utf-8?B?MS9ScHV2K1p4aUlFY0lFbnRWZXJ4c3JPbDI5WEdveDZRTVJWMC9xMXBORTRl?=
 =?utf-8?B?SnlNbnprN3VlR0Rjc1NXMlV5RjhHZUJEcTY1TkFOYnk2bnFYYkxQNU4vMnVX?=
 =?utf-8?B?WjJ2ZjZ4RU40K0R6cDNPSjRtMkhkbyttbGFneFI0MkQ1WUhvTWtBV1FyM2lU?=
 =?utf-8?B?SlhhK1VxZnlUY2ZRa3FrQzJqNkhmNlcxTjUyeGJMc2svTWk1YkRubXdZNGw1?=
 =?utf-8?B?M01RRTE4dzFOdmRIZVlkOElhNG5oWGp2K245bEJrL1YrU1c5TUVDWVZrcTVF?=
 =?utf-8?B?V2xHUUs1cm9nN1RSUnFocVBrN01QSkdWTWJWWnlwV1FON0Z3ODRiY3ZHYXBE?=
 =?utf-8?B?RmVCN0VvRmdmd28vU01uNE5jckxCdzVqODk3eGRrWDV2RGhpMU02Zy9QT3Rx?=
 =?utf-8?B?Z1YycFFhUDR0SjQ5Q3ZLQVRuVmszaURDa3hPclY1RTVmelAvbUJWRmllbmRK?=
 =?utf-8?B?VElQcmJqSXBLYjRabWZMRHI1TDJjRysySXRHNkt2ZlJSbitWdUw1UjFFbHht?=
 =?utf-8?B?cGkreUxTZ2hkSUFoRkFUN0d4SEdnWmR0cENpWUVmSXg4S09NUzBoTzJSMUE5?=
 =?utf-8?B?WDhtTTBzMm96eDVPYXFRYThlYjlHUlIvaGdZWnNsbXlTMFZRK2JRYkpBTkw2?=
 =?utf-8?B?Q0VwZU4vRUpIRzZHS0UyT1VOejFXSTB3Y29LdmxWVmR6aldaSE0vYWw5dlY3?=
 =?utf-8?B?VGl4YkYwRE5SdGpSdmtiYXZBRThFR254YTUvUE11OXB4VENLSk1lU2UvM3dH?=
 =?utf-8?B?dGtWQVd0ek5pbGcrUEdjSHZ5TjFNaENTUnM4RnBxai9aRGtmenl2QUhHZVQ5?=
 =?utf-8?B?TC9ueDNKTGJRMWwwSmRrc2ZjK3A5a1hEK2hRN2tlVHYrMzBKNGZBa21WbFEr?=
 =?utf-8?B?anJMcHVnZDI5UUZZbkN0bUlsU2pSWVJIdEJNQkVlQXN4Qy9MbTQrY0VZUHNE?=
 =?utf-8?B?d0xTSUE4ZEtaOGN4b3FacVVYMm9XWTNlK3p1WHY5dE13bEk5Y3JaUWwvNVF2?=
 =?utf-8?B?SUFQRVUvbThHWDZIQlozSE0ydWFoVjN0TGdHUG5VQ0ZLWDZ5R002WWlpVjdi?=
 =?utf-8?B?RVJuWUpKdHNaQW1ONmxweFRQVkVFT1cybkhESzNDNnUrNTNvL29OZVdRLzBD?=
 =?utf-8?B?elRwcVpGS0g2UnU0QU9MOTdaL1ZWZjVQYktIN09rN0taUXZHSVV2MWFZUjMv?=
 =?utf-8?B?QzNtS2ZTUjBtVzRqdmowS0M0Q2loWnIyTU1EWFZDQVVOb2pkR2RvL0txemVk?=
 =?utf-8?B?SEFMdmhrY0R1L0FlMGJQZE1GSit1SncxbUp6MUIySlJyNW1pakJOUENudU1z?=
 =?utf-8?B?d01EejBvbURCUDZSb0ZHYkl0OGMvVHI4NWVXNmRlSnpyMUFYcU9ySC9ONURC?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5477502b-6cee-41e6-98a5-08de1c7dc063
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:35.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+Z+6nTQpYIyq9vz0HUfD0cM5XvFN6gT879VZpG3Umhr6VpZGMyZile0DiPCR6ap/z65wGhOCem4CmVAtcADLWR5UIMinVpX6kzjevZKPb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Introduce a new function to copy data between VRAM and sysmem objects.
The existing xe_migrate_copy() is tailored for eviction and restore
operations, which involves additional logic and operates on entire
objects.
The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
from a dedicated buffer object, which is essential in case of VF
migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 128 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h |   8 ++
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5003e3c4dd170..2184af413b912 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -29,6 +29,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
@@ -1210,6 +1211,128 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object.
+ * @sysmem_offset: The sysmem offset.
+ * @size: The size of VRAM chunk to copy.
+ * @dir: The direction of the copy operation.
+ *
+ * Copies a portion of a buffer object between VRAM and system memory.
+ * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
+ * copying to system memory.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource;
+	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
+	struct xe_res_cursor vram_it, sysmem_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
+	bool use_comp_pat = to_sysmem &&
+		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
+	int pass = 0;
+	int err;
+
+	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
+	xe_assert(xe, xe_bo_is_vram(vram_bo));
+	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
+	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
+	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+
+	while (size) {
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 update_idx;
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
+
+		xe_dbg(xe, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+
+		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
+					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
+		batch_size += EMIT_COPY_DW;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			return ERR_PTR(err);
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
+
+		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (to_sysmem)
+			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
+		else
+			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			xe_bb_free(bb, NULL);
+			err = PTR_ERR(job);
+			return ERR_PTR(err);
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
+		xe_assert(xe, dma_resv_test_signaled(vram_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+		xe_assert(xe, dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+
+		scoped_guard(mutex, &m->job_mutex) {
+			xe_sched_job_arm(job);
+			dma_fence_put(fence);
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+
+			dma_fence_put(m->fence);
+			m->fence = dma_fence_get(fence);
+		}
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1912,11 +2035,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
 	return true;
 }
 
-enum xe_migrate_copy_dir {
-	XE_MIGRATE_COPY_TO_VRAM,
-	XE_MIGRATE_COPY_TO_SRAM,
-};
-
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 9b5791617f5e0..260e298e5dd7f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -28,6 +28,11 @@ struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
 
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
-- 
2.51.2

