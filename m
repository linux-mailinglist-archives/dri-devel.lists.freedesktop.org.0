Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864AA4595A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3E110E2D9;
	Wed, 26 Feb 2025 09:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvRi4DNE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F6810E085;
 Wed, 26 Feb 2025 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740560641; x=1772096641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oUjDW7e1YuIGheVBREfA8a5hrX62JuX8FkW68TomBOw=;
 b=RvRi4DNE2Ydpfnhplz/BKdG3Owwid5VgzDnA/moKyex5/woqW/Db8BT6
 mxFZY3Oe7WaNiwn2jDqgy0y8v5PopWnlPy6ckqJmPJWdtFp5ayP/IDcPO
 qvJQa2Bc2pjMCYdon06DvpoXrAYOIFAMkCqxxYcs0CJ+AovnDXFIvvN+J
 OaQWZVsYmXq3r9f5KBeI2lqvmescd/CTdLKhuzEdg+HvCqjxT7fUN5Nbu
 3ewGjWLLGBJ4mMw2Sr296cQDrEdWmt/ZNhm2A/VWKL9pDDmy1+6yA8E5o
 WkIK39c74xV44eTyrwRuttpjQ70Rhk9SNIkPiQu67QEwr+YKQMJUBTXEY A==;
X-CSE-ConnectionGUID: FMudQ037SmCOOg9V5U5AJA==
X-CSE-MsgGUID: 4UuTN1gDRZueogkseaUkzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63861984"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="63861984"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:04:01 -0800
X-CSE-ConnectionGUID: 8I3cztauR++8o5EVRarqAA==
X-CSE-MsgGUID: bLLZD2d1QSySe+ClCk7VpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="147471782"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:04:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 01:04:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 01:04:00 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 01:03:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt5m11qwWF/mu8BrYjrypSQFA8XlEm7vQ1GJ1jGB8dppFFOsSy+5eat4rp45hDkBTD0vhoLhweouKliOWarnDBUlmVZePhU3WZDdFVLjR4Xg2vOxKIyMNKDX1MwCDOQzvKG75HXAhB8a9roYmqb77tZAWT8eIyyzUlPz4/yI+XSme4cuvp10EmVezHOKVUaghusUO1b+bBo80li5eSRaKJ5B99/WooKWI6JV7aspzeGNAe5rzyk5ks4dlxGf766YLQHBmY8aMdqHFohjnagZuSS4nU0BBKLewtZjEsYahCPYv71mCpksZYjmK0bMvaKw4H0b6nlWnotV2o5Q/dqz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2fevAeV22gl1tfOby4GScMIonDEzLu7O1cZmeCq6aA=;
 b=yenUd4FDApNKVTMsh4s3e4HGVNEaf1185saBdhjQ5FDCNeGbQVHUSoH8zUQLktZNdxx13QMAeKP7LAzRuoc3yJ7DnK0FWPcPpXrZidFnd2jZKWT7mvU6flAL3VQcXmhksOSD1QZLzZtcAnCYSvECRS1hjBk3b66kYkFs3bspD2oigII04CqI/iP7iEpcWIxdUdN8aOZGMmgw0AoiMjUcORLXpes33NpqHL1BKlvdSD/OVtDsunD+uIcYZ6JSE+z3Mw31BJSbWtp+eWATD0G+TDkF3VdjK231EroHm+ZdbS9OktNUAFwnbguY+FKcWeWJVz1wfNCWUTUaNmO5b+TieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 09:03:52 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 09:03:52 +0000
Date: Wed, 26 Feb 2025 10:03:23 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <jeffbai@aosc.io>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Mateusz Naklicki <mateusz.naklicki@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Kexy Biscuit <kexybiscuit@aosc.io>, "Shang
 Yatsen" <429839446@qq.com>, <stable@vger.kernel.org>, Haien Liang
 <27873200@qq.com>, Shirong Liu <lsr1024@qq.com>, Haofeng Wu
 <s2600cw2@126.com>
Subject: Re: [PATCH 2/5] drm/xe/guc: use SZ_4K for alignment
Message-ID: <Z77Y26ZhWpBL9agT@fdugast-desk>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
 <Z76gAbZjF3b0jLb7@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z76gAbZjF3b0jLb7@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: ff33c500-14bb-491c-ccfb-08dd56447d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk5hN1E3VzRSN1psOHNLNXh0YSs0TVlZcllINDNjSUgzblhsenMySGFOelZK?=
 =?utf-8?B?bngyaDdmSWFGVjFtdUVmQmZldVBocFRjUHg3UENpSUVjRzVMd1p1MTRTbjI3?=
 =?utf-8?B?TURMaVNObkR3QkxZclNIU1F3M1VvNGJyS1RjVGRiTkJ5d3VGcVEyemZnYVZN?=
 =?utf-8?B?QVB0ejYrdFU0d21lTHQ5ZXpiUGJVT1gwRE1KN1FKWFdUT01maHduUlMyTFdB?=
 =?utf-8?B?Wm5WdjE4M3c3Tjhma1plWEJYbk9ZOXZ5ekhuWEFLMXlXcDJBWXIwU0xVaG9F?=
 =?utf-8?B?d244RDIxeEFweDNnVlFYaHJkdWUyTWorRVNpdXFmYUt4NUJlNUh1d3FLcVVt?=
 =?utf-8?B?U3lLQ3JaV0xXd2NGM0EreXhBNnRKYVpibWRsYWxrRUxGc0RtcjVDMnFia1NU?=
 =?utf-8?B?anlLbzRwZkdrVm9LQmhpblVZMmkxY2FONEpUTW9iMkp4anQzTUoyanFrSCsy?=
 =?utf-8?B?UTlOMGxYeDl1dVpMa2xtenVTamdPZDFZNm1HTVYvUGRpSHNXblhxU0hVNWRz?=
 =?utf-8?B?RVg4dnpkZ3JoQTRuVUM3RngrenN5WWZZaHR4enJwbXdFMXVGU1dabk5YZEs1?=
 =?utf-8?B?SWI5SW9BVUdzUkZCRG1NTVZQc2dZcXNHV0ZzTzE4V1p5djVVYnVzNzBBcXd2?=
 =?utf-8?B?TnMxaXVGRi94QXc0d3dJTk9wN3BaaWtUSXRvSk43d3pOZXhNRkFJTTlzQmtQ?=
 =?utf-8?B?RmpvTG9MZzhWOUdpdzhmSmdFRHRXcnJUQ2I0UWlzc2IwWEJTakdDT2o2OHFa?=
 =?utf-8?B?ckJWb2JYSFhpbUxLZlBlaU9mZFBLZm5GbTYvNXZ2TzU5akhOSWpJbmx1L0t0?=
 =?utf-8?B?bTkxKzhFajJ6VXFWSFFTR09sUmtjSGsxVWpVU3RvUk9CUC9nNzgzT0N3cUo0?=
 =?utf-8?B?T2RpK3k0MENmdmRiOGlyYm44bk1NcFdkSTRET0JjbHE1WWlJNGFEMDIrZ0RN?=
 =?utf-8?B?b1BFTkdyR3FUckpRcHhOQWIwcVNLRFBBMUdoQ09GeXJMa3BRZjMvRkRHOEQx?=
 =?utf-8?B?dVR4dFhNUW90ZFdOQ0YwZnNqV3M3RTB4bUh2allHWlptQ1pPemtKRHJ5UmRX?=
 =?utf-8?B?OUdoeUQ3S1VGSklZR1Y4dm9UT2o5Njl6MWpUNEdRZnlkK1h6cWwzRWV6ZjNO?=
 =?utf-8?B?a0cyUERuOVlVZHhyNlQxSlBCTUVZS01EUzd3c0Z0Y293YjdJZVd4UDhhT1pW?=
 =?utf-8?B?dkJDRkdBVFo1VjhmdDhybHI5Sy85aVk0THhvR25qejdseTliS2RIT1VjMzJ5?=
 =?utf-8?B?RHYyRlNpT0hGZ2FEbWw3WFRkNC9ScVVDVmRBTUpGVEY1MHJUeVhWakRhRkgr?=
 =?utf-8?B?UGE2dTFhOE16d0QwYzBIcWJSc1lCME9YbkhySkE5eldHTHZ4bGQ4cElDdHBG?=
 =?utf-8?B?ZytRbEFuQXh6VDBBZERxT24rbzJ0SHlZdmxmWTN5R0w5MG41RlVHRlY2cXpC?=
 =?utf-8?B?WTZOY1BLRkxCZHN4Mi8razgwTFJzQVZPVTQzZnZXaVgvR1JCWVcwKzd5NlJ0?=
 =?utf-8?B?YVRUTjRPbEl3ZldXbWprS2ZubnlERm9YYnFEWW5ZZngxYTY3cHNydW54MGJl?=
 =?utf-8?B?VjRja1JQVHphUjIwK2VZc1NJeFFESUhHZ3JuYmtHcmFoOHRVb2loZ3RncUZJ?=
 =?utf-8?B?ZjlrVWRDS0pmMVprb3ZXWVRNUTlXU2phOFRFL2ExN0daUUFjV1B2TjJKdmdB?=
 =?utf-8?B?TEp0Tlo1VDkreWpteUZWNGdBQ2l0ay81OTVVcHVSbGVkM2tGZlBaMzFxVFF5?=
 =?utf-8?B?S2VIMFcybnhnaWs5MDRkcHcwRkxBdlpLVWxWK2ZaVkd0aHVvV2FTMTAzbStz?=
 =?utf-8?B?Y2s3UmRZTTdlS0VRckRjdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDNjTFB2MlJpL1R0WFNSMm9qOWlWSlFMNnZXaFNhVmdINm4rSDBUa1h6M1dl?=
 =?utf-8?B?ZlAyQ0x6Q2ppU2NjZWV0TkhseHlHL3hzZk5ndGlVTC9yWkd5TjZ0SGppQSt6?=
 =?utf-8?B?elhrVnF4eEhtQlV3WXNKcXMrWmZLbnhzdG1HZ01oRmVzdVZwQjgrZ0dBaFZN?=
 =?utf-8?B?TFRDcU0wbTJmTVozWHRhbmpiZ0xGS1hnMHZCRkplK3YrUFZWNm1Pa3NsK0xX?=
 =?utf-8?B?U3JrSVdWWVlETWlEeW5wRTNURC96b2Fwdm5BWUYzbnhHU1Y2b29IY1FYOXZo?=
 =?utf-8?B?Rmc1Zi95WTkvcmtHWFhVazZjYkRDWmp0alFHckNFclNqUUFNb0VRZ1l6NTF6?=
 =?utf-8?B?cFVkeXF4R1lydEtlUnNFU3VwQjIyM3l2bFBTQ2VqbWRSeXV1Mk42WktoN0Ur?=
 =?utf-8?B?UzUzUWVBYVBnNU54c1RzTWNScXcyQWRDMVBpcVlWMm54c01ROVJTWkVHRUo0?=
 =?utf-8?B?cThIN2JkTVliWklqNlc0Z2o3YTVQNXF6dmlyOWRlcXpydU5LeHdwNmpmZExS?=
 =?utf-8?B?TWFUQU5hVXJrRFZ3RGYya00vNDEvMHlMZkNMZk5lcExQamg1anNnc1A2U2Fx?=
 =?utf-8?B?M2R2OXZERmx6ZzRzWjNXTzJpSGZoUUlubDBWSmRNeXcvL3hwM3FUQWFEa055?=
 =?utf-8?B?azBWRTl3aERSUks5V0duQWhQcjVBamtxdmVFU2IrbVpoSFBENXFqbzBQWEVF?=
 =?utf-8?B?d3QrTm1ubzFSaUVDR21VTVBhcC9uSEhyRUIwVE9UUWpMcUFkNzN2MDlKdkhH?=
 =?utf-8?B?ZS9CN0Mvc1V1b1NUZjRtNW03dHFFTlExQndtbG9mTFIzS1BYK2VpUzVYaDBT?=
 =?utf-8?B?RmlnMDAvREdadHpsaVpOZ1FrSnZNUnRRYWhuSFU0MHlXYWtPTFBxRXV4YkY0?=
 =?utf-8?B?WktiQVVlcTg3SVVwUjgyaVc2OXJ4RHowUWd4NE9LL1crVzh6ekxvZ1ZrVEdT?=
 =?utf-8?B?OE9uL0V5eTZ6V3ppTTdlNHArTmROa1BiNk4rQjA5TzNyTGxEUnBrWEdWNExM?=
 =?utf-8?B?anY5eXlFTytoS2xRVjlLMmZVRTNPWmFRaFF4dGtyN09TVGN2Z1BGek12Q3RV?=
 =?utf-8?B?YXpWdjcyQUs4V1lCMTBRSTYxdlZQZ2p1dzF2MjkzRk45d3lQMXhVV0Mycmxh?=
 =?utf-8?B?c1U2RkZ3ZW1GTWN3VzVIVTVBL2M1V254dmE3WUpxTzY4cGxYcjlQSUxWQmhR?=
 =?utf-8?B?cVhvT3Y2VFpMczVmVG16cExVOGZxL2pRbjBkNUdyd1pxTXloazFPclRjWFFE?=
 =?utf-8?B?K0wrWjlPbnhRRC9yMlhWeGdVWmJESXcvRXVYa3JJNGV4QTQ4MXM2VElwY3BW?=
 =?utf-8?B?a0d2R1VXS0FyNWNHelZVNUw2M0c5N1RyWTFMVERRZDMvbGIxM3B0SnFmY2pZ?=
 =?utf-8?B?OVVyVmFhYmFJUHlUcG14YStVSXpNbjNFRytORTdJRm1RME8vQjRWTXVtVmtG?=
 =?utf-8?B?YjRtcjZrUkZwUVRXQkozdlNzblphYjFoMEorbjh0TGxDVkZUSTRpNStLRkQ5?=
 =?utf-8?B?UnVQcXdxeUpuZDEwRFZoSnJhTVB6ZkV5cmU3RmFNRkNTaHc4clVOZ0R2cUk5?=
 =?utf-8?B?ODZEbS90cE9XK1FYcTBBNkF6ZEduNktJSzB1S3RKck1Ma0hDNWdYUk8zVkFJ?=
 =?utf-8?B?YWhlYjJUemo1RDM4dDFscExPNkYrbWljNEloYjdWdFRzR08wa2UwZnpFM2JW?=
 =?utf-8?B?ZkVUdWRpUlhlUGorRDVyZFd2T2RCdVR6Ylp3YnlnbEhoSFh3MzU1bk1oZzJj?=
 =?utf-8?B?T0I4a2F2YXFLdklZa1Q5V0x2aUtKSEV0WU9KZVVlMlNRZUNrOGNlem5qRWVY?=
 =?utf-8?B?ZTZqUk9HRjIrWHZQazdzWWlNMVdTOG1WUTlRaVhzdUY5Zk9EUkt0aFp3dGto?=
 =?utf-8?B?TURvVENPaFpQNDdMWXJTTG5qVE5nWE5SUWF0Um44azVZOFlnVUp6MUY0cW1E?=
 =?utf-8?B?YWpXM1NzZlhBWEp1UFlLYm5BM1JLLzBQajF5WUJ2QUNQMGlXOUsxL1lZZlFF?=
 =?utf-8?B?QlJwdGlaSmxMakpHcVZCWGhTVnFSUmhFVDc2cXY0WnFSNzJ0c3lzTjdCL2J2?=
 =?utf-8?B?UGJYWWZrakdhbCtMR3ZCNGR6MWV2Y0lZbUV1c1ZFOXFNZTUyL3kvbjhrRDd6?=
 =?utf-8?B?VkhMaFJ1SXEwNWdvZ3lhZmpOWGNvVnY3a2duYVZFTXg2VW02YXZtU3daejBY?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff33c500-14bb-491c-ccfb-08dd56447d8a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:03:52.1677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ezb3LLsSw6b2esQ1qpvNjMThwdxHyUhF54znjKSne+6XMG3gDxGoI2Y+DktHqjs/RbPRCKHvzjqPCr74bdx38yBnf3zYmFaYFGiD0bxVZ8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

Hi,

On Tue, Feb 25, 2025 at 09:00:49PM -0800, Matthew Brost wrote:
> On Wed, Feb 26, 2025 at 10:00:19AM +0800, Mingcong Bai via B4 Relay wrote:
> > From: Mingcong Bai <jeffbai@aosc.io>
> > 
> > Per the "Firmware" chapter in "drm/xe Intel GFX Driver", as well as
> > "Volume 8: Command Stream Programming" in "Intel® Arc™ A-Series Graphics
> > and Intel Data Center GPU Flex Series Open-Source Programmer's Reference
> > Manual For the discrete GPUs code named "Alchemist" and "Arctic Sound-M""
> > and "Intel® Iris® Xe MAX Graphics Open Source Programmer's Reference
> > Manual For the 2020 Discrete GPU formerly named "DG1"":
> > 
> >   "The RINGBUF register sets (defined in Memory Interface Registers) are
> >   used to specify the ring buffer memory areas. The ring buffer must start
> >   on a 4KB boundary and be allocated in linear memory. The length of any
> >   one ring buffer is limited to 2MB."
> > 
> > The Graphics micro (μ) Controller (GuC) really expects command buffers
> > aligned to 4K boundaries.
> > 
> > Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
> > kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
> > causes driver failures after loading the GuC firmware:
> > 
> > [    7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (device ID 56a1) display version 13.00 stepping C0
> > [    7.410429] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.36.0
> > [   10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status = 0x800001EC, time = 3297ms, freq = 2400MHz (req 2400MHz), done = 0
> > [   10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x76, UKernel = 0x01, MIA = 0x00, Auth = 0x02
> > [   10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:09:00.0 as wedged.
> >                Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
> > [   10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100
> > 
> > Correct this by revising all instances of `PAGE_SIZE' to `SZ_4K' and
> > revise `PAGE_ALIGN()' calls to `ALIGN()' with `SZ_4K' as the second
> > argument (overriding `PAGE_SIZE').
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC log buffer")
> > Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and update ADS size for error capture")
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > Tested-by: Haien Liang <27873200@qq.com>
> > Tested-by: Shirong Liu <lsr1024@qq.com>
> > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > Co-developed-by: Kexy Biscuit <kexybiscuit@aosc.io>
> > Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> 
> Typo in last reply:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Nit: in order to improve clarity and to limit potential mistakes in
the future, you could add:

    /* GuC really expects command buffers aligned to 4K boundaries. */
    #define GUC_ALIGN SZ_4K

Then use s/SZ_4K/GUC_ALIGN/ in your changes. It would make clear this
value does not come from PAGE_SIZE or XE_PAGE_SIZE.

Francois

> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c         |  4 ++--
> >  drivers/gpu/drm/xe/xe_guc_ads.c     | 32 ++++++++++++++++----------------
> >  drivers/gpu/drm/xe/xe_guc_capture.c |  8 ++++----
> >  drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_log.c     |  4 ++--
> >  drivers/gpu/drm/xe/xe_guc_pc.c      |  4 ++--
> >  6 files changed, 27 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 408365dfe4eed02336bbd208b60491aea27a8a6e..595873780a5774501f04b2f01ebdf8a45c7ac931 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -88,7 +88,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> >  
> >  static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> >  {
> > -	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> > +	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> XE_PTE_SHIFT;
> >  	u32 flags;
> >  
> >  	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> > @@ -141,7 +141,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> >  
> >  static u32 guc_ctl_ads_flags(struct xe_guc *guc)
> >  {
> > -	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
> > +	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> XE_PTE_SHIFT;
> >  	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
> >  
> >  	return flags;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index fab259adc380be28c79fae5946e123427359ec60..65e88ad43e8adef752889300abd0197a0ac4a1a3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
> >  
> >  static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
> >  {
> > -	return PAGE_ALIGN(ads->golden_lrc_size);
> > +	return ALIGN(ads->golden_lrc_size, SZ_4K);
> >  }
> >  
> >  static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
> >  {
> > -	return PAGE_ALIGN(ads->ads_waklv_size);
> > +	return ALIGN(ads->ads_waklv_size, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
> >  {
> > -	return PAGE_ALIGN(ads->capture_size);
> > +	return ALIGN(ads->capture_size, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> > @@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> >  
> >  static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
> >  {
> > -	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
> > +	return ALIGN(ads_to_guc(ads)->fw.private_data_size, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
> > @@ -183,7 +183,7 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
> >  	offset = guc_ads_regset_offset(ads) +
> >  		guc_ads_regset_size(ads);
> >  
> > -	return PAGE_ALIGN(offset);
> > +	return ALIGN(offset, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> > @@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> >  	offset = guc_ads_golden_lrc_offset(ads) +
> >  		 guc_ads_golden_lrc_size(ads);
> >  
> > -	return PAGE_ALIGN(offset);
> > +	return ALIGN(offset, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
> > @@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
> >  	offset = guc_ads_waklv_offset(ads) +
> >  		 guc_ads_waklv_size(ads);
> >  
> > -	return PAGE_ALIGN(offset);
> > +	return ALIGN(offset, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> > @@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> >  	offset = guc_ads_capture_offset(ads) +
> >  		 guc_ads_capture_size(ads);
> >  
> > -	return PAGE_ALIGN(offset);
> > +	return ALIGN(offset, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
> > @@ -223,7 +223,7 @@ static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
> >  	offset = guc_ads_um_queues_offset(ads) +
> >  		guc_ads_um_queues_size(ads);
> >  
> > -	return PAGE_ALIGN(offset);
> > +	return ALIGN(offset, SZ_4K);
> >  }
> >  
> >  static size_t guc_ads_size(struct xe_guc_ads *ads)
> > @@ -276,7 +276,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
> >  			continue;
> >  
> >  		real_size = xe_gt_lrc_size(gt, class);
> > -		alloc_size = PAGE_ALIGN(real_size);
> > +		alloc_size = ALIGN(real_size, SZ_4K);
> >  		total_size += alloc_size;
> >  	}
> >  
> > @@ -612,12 +612,12 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
> >  					 offsetof(struct __guc_ads_blob, system_info));
> >  
> >  	/* first, set aside the first page for a capture_list with zero descriptors */
> > -	total_size = PAGE_SIZE;
> > +	total_size = SZ_4K;
> >  	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
> >  		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
> >  
> >  	null_ggtt = ads_ggtt + capture_offset;
> > -	capture_offset += PAGE_SIZE;
> > +	capture_offset += SZ_4K;
> >  
> >  	/*
> >  	 * Populate capture list : at this point adps is already allocated and
> > @@ -681,10 +681,10 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
> >  		}
> >  	}
> >  
> > -	if (ads->capture_size != PAGE_ALIGN(total_size))
> > +	if (ads->capture_size != ALIGN(total_size, SZ_4K))
> >  		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
> > -			  ads->capture_size, PAGE_ALIGN(total_size));
> > -	return PAGE_ALIGN(total_size);
> > +			  ads->capture_size, ALIGN(total_size, SZ_4K));
> > +	return ALIGN(total_size, SZ_4K);
> >  }
> >  
> >  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
> > @@ -928,7 +928,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
> >  		xe_gt_assert(gt, gt->default_lrc[class]);
> >  
> >  		real_size = xe_gt_lrc_size(gt, class);
> > -		alloc_size = PAGE_ALIGN(real_size);
> > +		alloc_size = ALIGN(real_size, SZ_4K);
> >  		total_size += alloc_size;
> >  
> >  		/*
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> > index f6d523e4c5feb7f07d695af90f4c44c7a9072c2d..dac51f8720fc6c7d27baa31a1b5c567f560e8c1f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -590,8 +590,8 @@ guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
> >  		return -ENODATA;
> >  
> >  	if (size)
> > -		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
> > -				   (num_regs * sizeof(struct guc_mmio_reg)));
> > +		*size = ALIGN((sizeof(struct guc_debug_capture_list)) +
> > +			      (num_regs * sizeof(struct guc_mmio_reg)), SZ_4K);
> >  
> >  	return 0;
> >  }
> > @@ -738,7 +738,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> >  	 * sequence, that is, during the pre-hwconfig phase before we have
> >  	 * the exact engine fusing info.
> >  	 */
> > -	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
> > +	total_size = SZ_4K;	/* Pad a page in front for empty lists */
> >  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> >  		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
> >  			if (xe_guc_capture_getlistsize(guc, i,
> > @@ -758,7 +758,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> >  		total_size += global_size;
> >  	}
> >  
> > -	return PAGE_ALIGN(total_size);
> > +	return ALIGN(total_size, SZ_4K);
> >  }
> >  
> >  static int guc_capture_output_size_est(struct xe_guc *guc)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 72ad576fc18eb583110b44b118abeba4c6be936a..a58c58e599122f3e9ebd1e8374c17c3b4663a5ed 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	struct xe_bo *bo;
> >  	int err;
> >  
> > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > +	xe_gt_assert(gt, !(guc_ct_size() % SZ_4K));
> >  
> >  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
> >  	if (!ct->g2h_wq)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 0ca3056d8bd3fa37bdb79a7a71ef671270771657..9975005732f645b4735f95fbae8ebe431e793ebe 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
> >  	 *  |         Capture logs          |
> >  	 *  +===============================+ + CAPTURE_SIZE
> >  	 */
> > -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> > +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> >  		CAPTURE_BUFFER_SIZE;
> >  }
> >  
> > @@ -331,7 +331,7 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
> >  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
> >  {
> >  	enum guc_log_buffer_type i;
> > -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> > +	u32 offset = SZ_4K;	/* for the log_buffer_states */
> >  
> >  	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> >  		if (i == type)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index df7f130fb663fc2fd170a94cc1b835b4b4cca167..0f97c6310a3a5696490aaa4827eb3aa0d45ea6d6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -1000,7 +1000,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  {
> >  	struct xe_device *xe = pc_to_xe(pc);
> >  	struct xe_gt *gt = pc_to_gt(pc);
> > -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
> >  	unsigned int fw_ref;
> >  	int ret;
> >  
> > @@ -1110,7 +1110,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	struct xe_bo *bo;
> > -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
> >  	int err;
> >  
> >  	if (xe->info.skip_guc_pc)
> > 
> > -- 
> > 2.48.1
> > 
> > 
