Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27FBCFB93
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6D810E316;
	Sat, 11 Oct 2025 19:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/tsO1dn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F710E316;
 Sat, 11 Oct 2025 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211659; x=1791747659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jRY/vmznC/fcRWXlesmL3vO7exxg55QlzYSDu9DYWbM=;
 b=X/tsO1dncOCTjeA2eTHbDDpQIxNpiEynCdND0ZcNTssIY0tyY8TXqDoN
 vLGENyBLPzMpF+kbFOomuUXQDSqnNpCcX9NP0xPVe7GKB479TtbHdMT40
 RhsVx9HNGKOJLuhQgvX24KPuEcdWbwTjJz1z24lRP5pG9djBZWPbmR8vO
 xfcw+HWQzBjUza2w2YkD/BEIiv9g4eslk76TWUY5ipi7w42ZDUQuNggUT
 oPipaGhctQuG9ItIVRT/56G1NrglLKCrb294EgT6XNTMY4DuCC07tDKcK
 NR8xvFI4uwk5A12DnnHaTZsmN5seuyZmHFNmzPkaytNsRBD2x+X6bdfs9 g==;
X-CSE-ConnectionGUID: Dh61pCsqTeGeaqBC8O270A==
X-CSE-MsgGUID: GzaRtFFQTQCjEI4gZSHkQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62294751"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62294751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:59 -0700
X-CSE-ConnectionGUID: vTkrVXrOS6i/KXkX5xNUwA==
X-CSE-MsgGUID: r2WiL9FnSfWwSBk3gX/Daw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181252888"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMQ2pL+YsRZbl+rW66TEUEq1WA1bo+dMh+sL/XdiTTEqIvA2oJWUXvACEUVWmFaJsAAe+S7ht1LCQG9btML/GeHkjFeEyp82i17HNpSl02aTuKpyAD8PZpYz/fXicj3ykL4JKsuheQPmStLlEdcyY4YyBC5zMXJELrgd2xG5IfdlWhvlR4tEGCyUImN5I+/FyjZpRNM2CNLjoqsUtj559/S1SVc0dfAq772wD3XPZrKBh0c0aq/9mh1KJmA44glBvjTlOdllgyA/4Snb5jzkk77JObpq+gsOBoStHvbOvotDux8iFIu/lcDZH+UsGWZ+PodUIcZeyotjVX+quhx0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUwaDuHPMOpzbWXLpeBZZOPV46K0R0IXwDc7KimvcXg=;
 b=UrJ9GUhDxjIWQk6mgpwcW7wxaZvTOrVp1aIcuPrjRxJv08Im9GBMj/p4VqpvuYg04idTLhO6/mHWvBXJMAhXOXUa4XlBOVBWdLci2Vy7gKIgT40PMgEwEmSX7ZRk+OZfLVSK5oQL/gjTgL5cVaqOdDCvyLFBqxADV/WqfXMCXLseuNtTkSJ1Kak+5ehW5710hqy4HhtHZywm9mINmk+rDCp89J1/ldtQ6Ctt+pHbot/TjF6C0SuONUhwz2/oB7HO0u4AyO6z1iJlYnqsF1voHmHTY29rJjVQk4oPTUbGQIP98MQuHQnP6rvnw2iCsSw485Ua/aGdIEpF7239jr+lxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 09/26] drm/xe/pf: Expose VF migration data size over debugfs
Date: Sat, 11 Oct 2025 21:38:30 +0200
Message-ID: <20251011193847.1836454-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 537d9cf7-dace-4270-2d80-08de08fe1879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFVHVW5JVS82dE9RSXpNOXIvSzZMV1R4WmNvUkp2Q1hiNThuL1oraU9mbEJ3?=
 =?utf-8?B?OS9tamc5UlZ4b1RkcHZac1dVUWFGaFphY0ltY1Y2YXlEUjRRREpaSWRtUnVo?=
 =?utf-8?B?M0Q3eXdOeE96N1lJWWtXUFNsR1g1VUY5Z0hRNUpidlFXTFRadFIzeEp3M2Iw?=
 =?utf-8?B?a2V1cmZVNWtGRDRsY1JSTmNONUlGTGlFK1p4dDhLWWZmOUE4OUpUcklNL2Ro?=
 =?utf-8?B?RTQveHBOeU5zMzFES0tlcWNFKzhWajlVS2xKa0JLVDJWUys2VXFWR2s1SGcw?=
 =?utf-8?B?N1Z5R1lVamdib1Zid1NDWllpSmhrSSs2anRqdHNjeUNtTkljZUhvOC9VRWtW?=
 =?utf-8?B?OHIrcE5DYTRXcm42ejByTkgvZjlLamZZNzRCMjM1ckdRVWVXZVhtcFNRRGQ3?=
 =?utf-8?B?TWkrOTI5M2hPRE9QMWM5L1hNV0Z2TEFsLzZwYW9rRUh3YWZDLzU5ekZnYXQy?=
 =?utf-8?B?bVp4djNyQzJESDFscFM4VUNWdlBMUzU4UWllc3htTVdTM21DTTduS3BpZ3cy?=
 =?utf-8?B?ZEt0a0lBekFQYWpHd0tZa3JKNGsrUWVHRk5MQy9xYVRGZkl1SHRzeFlsSEM3?=
 =?utf-8?B?SHl3cUZmM3lGSjVXQnlWTVl4ZlNIcHlDQldlVWlqeHVRYnd2RzlYcWFJem5L?=
 =?utf-8?B?aFNlbHE1MlBqdE94cDZFTlg2RGpaRng3Q0tMZmRRN1hMUU1zbFdONVBFTDYw?=
 =?utf-8?B?MVNpUVVCYkVrYkJkcmo5Wm5PRm9IMThKK2RzWFF0NzluTk1haUF6Q1BrUmRO?=
 =?utf-8?B?Vld0dUd1WXhZaG4zRTRHMHkyUjR3YWhUYzllT3hJTjVtS3ErWVZveFl2UUtO?=
 =?utf-8?B?UitxWVdtWXlwUWhDRVdXemgxUS8xOVgzTEVXczZtQjZFemF0Wm0xQjg2OVpv?=
 =?utf-8?B?eDNwb0ZEMjJxWkt5UDlCODNXWjFubUhlSElDeEw0dGRQYmtoSjV5V25BeFZm?=
 =?utf-8?B?dUZiaDdVdGpNUGlJZDIvbXp1NWRSR0FFTFdLNGluYndHU1lZUXM4Lzgyck9T?=
 =?utf-8?B?VGo0QWI3Kzg1WC9hY3FzeTFvdENYb3VpSHBQdFVlSkZ3OWJaUnhLWG11eFpQ?=
 =?utf-8?B?eGo0WGZJTnFjY0tIZUlzQWsvRE5Kamc5bjdIWnlLWFhDdVJpbkpiTnJQQkVh?=
 =?utf-8?B?eWdhb3N2bXZHbklyQ2EybStBK0d4QkFSYnBLT1FzODZyZkQ0cDFOTWlhaEtp?=
 =?utf-8?B?ZDk5N1Z0ZjQwZzY2L3dxTCtweTIrc2JpUFdsZzRPT20weTdrUXpCTngyTWZ3?=
 =?utf-8?B?alYyUkhFUUE2c2VZZEtCRlhpb2txRGVIMk0xdEtPYktVQTIvQVJxYWU4Szg4?=
 =?utf-8?B?Q21QZE1LRFZidVY2OGQzODBwaXBmaHEybkNacmhqdjQ3QUc1Zkd1cTF6Z2RF?=
 =?utf-8?B?Qkt2czQ0Q2psUXBnNk1zclRUTllTSXBieTNBeEcvWUhYd3M4VHgvdkt0QTZi?=
 =?utf-8?B?ckN5VDBoNkZGOFFzZ1RJMnBkeHRXYzJLeTI3UGhLNE9xR1l3a1J5a1VTQTV4?=
 =?utf-8?B?S2Zua1dENHdXdEdmQzFtdmFvWTR3WXVIdkl5YzBocVVhZU5VdXlaK1k2bFJD?=
 =?utf-8?B?MHpsVWJUSUw1QjlpU2VYZHg2MUNDZXRYLzRYLzFpWWNtaUoybDZpR1pIbHJx?=
 =?utf-8?B?QnBObHVZMWtJcU9jbkIwZTlpa1o4VlI0SmRmUENuL1pMczVKK3VvZGUyVUd1?=
 =?utf-8?B?S1pZeUlHNy9UbXJLd3p1SGhTcTE4eXNnL29pWmdJN1dqS3VuVGV5NUJrVlBw?=
 =?utf-8?B?Vlp3QXd5Zmp2TWhHdTBVWTd0YTcrRUZkTmtaVG9TaEdaMmhTb3NkOHovZytk?=
 =?utf-8?B?MDY0ajFaTWRxQ05vc0lCVFM3ajYraTAwTzlxdG5RN0IxQVZQcW9jaHk5NUJo?=
 =?utf-8?B?ZG4wSTh3MG9nQlZURWdlcEIzRVkwSVVMMU1PNU5iL3lrTlNyZzRnTG5hT0l6?=
 =?utf-8?B?c2M2aGpLZW9IOHpXRjE5MFhrc2gwLytoY2g3RWdVOFBhaTBKZ2hzaVZoZWV1?=
 =?utf-8?Q?26/AKZIErwVVtJf2087/fxZOrz4Psc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVM5WlZvZXNUaHlEdC9OcEdpZHlrQjkvYnpTb0wvZGpWMEZXaFMrVmdscVNV?=
 =?utf-8?B?QUlVZThML1FzUE1qSjVqU2I0N1NxcGoySHljOHhBeDZ2Z21Pb3I4WkdWdGVQ?=
 =?utf-8?B?Ym9WYWR1WGdzM2NqL2luSFB6TFUwdXlPVFo5K29xcG5Ebll1bXowV2hiZTBq?=
 =?utf-8?B?VklVMExPTGVicGJhMW5memMwNHJramtYVldSa0dVUVhYS29YY1BYMGI4NEpM?=
 =?utf-8?B?SVZCNGJ5MWJWajI2aTFpN1M2TUFuYlp3L1ZFNkhBZWx3Tkl4VzdrSjl1N0hM?=
 =?utf-8?B?MHFwL0lsNHdZRFlIQ3JrVHJPRE8zUExFZWFtMjZTNkZyN3pmTE8rRWU0blZ2?=
 =?utf-8?B?NzlDYTBNQVl0T0RpUFRlUXRoV01VZVZXQ3ZvV0pObXVWVjlRZW42US93aktJ?=
 =?utf-8?B?Mko0WVJqdkpNMTQzcENFVFJtdy9tc3ROa05Fck1RUTFuWWNuSUd1TkV4eUlo?=
 =?utf-8?B?QTVWZ3RmOXZoVzl2ZzR5ZWp5ZHVzTTRSOWZLRFA5YURPYVBOb0NEa2QwS1B1?=
 =?utf-8?B?M296aE5RUGMvbjRDUG8rM1dSQXh0M0RrYTlkQWhvOXZJZC9tMW1uMU1oRXZa?=
 =?utf-8?B?eGV6bjI4ZVU2TUR6cTFYYy9YYndzOVErVGNwakUvV0RMbUpnNzVIc2FJVmF6?=
 =?utf-8?B?WXdVcDhxNm9ZMkk2Nmd6S2ZwaHlrVjBQREpIQ3JHeUVKK1c4a3dubDRtcUlK?=
 =?utf-8?B?STZJOEZ1QU0zaHRyZ0NncUNTV011S3ZiS3BUdVBMdzRUeFRQcWJBdkVrS0Vr?=
 =?utf-8?B?SVZ3cExSWThSM2NCMWhXeGU5anBkaGZnQXJMWVQ4Q1hhaU1ud1BCY0RZZFZ2?=
 =?utf-8?B?aUN0clpxRloycTFOOEJWbzZNTEhOcE1xdFVMUUhwaFVqYTVKR1YxNlpNVkpR?=
 =?utf-8?B?azdFL1JaN0FudTAvRCtaOUVxeGhYZTV3VWZYZ0FjL1ZJS2h2Wkl3NnlHbVps?=
 =?utf-8?B?T28xbTdPZUdMQk1ya3QxVjRuRHc4aVBPN3dReDBHSTFxS2tFZkZLWCtPQk5S?=
 =?utf-8?B?WFRQZlhHZEFxcVhmbnJRd2g3SWZGWGpGeTJmV1F6a1hrYWV5djlOTTYvQUpB?=
 =?utf-8?B?WWZzYzdNaGRSZGdtOURoMmZlbXZQNG9lQ1lvWDBzaGs4U0kvQTF0aU9Qd24x?=
 =?utf-8?B?MWlZTXZxUzJ0SndkZFo2KzV6UjBSUkYzcktzcVcrdmlzVm9xTXhXNnNJV0VL?=
 =?utf-8?B?NmRvUURDaE55TzEvUUx4b0haaXJ5N3U1SHpmWnZkYW92ajVZUitHSXhyVmxQ?=
 =?utf-8?B?ZTVqVzNtNHFtMUpGTzBJeFhMZmJzcXk1UDRQYUJMVjV0SUh0MHhRYmJVYVRX?=
 =?utf-8?B?aWlqQ09IbjU4cVd1enFjQzBPQTNZSXEvTFo5MnV4UzlZTDdoWk1KM21zZElt?=
 =?utf-8?B?WXUxL2lpRFZadjM3M3ZoQVRJWjBvZytlc05GaktVclpPM3pBaWE0eVR2ZklN?=
 =?utf-8?B?RGRpckc1Z2psd3VNUk95ZUJEYmlZK0RPQkJadWl5M2Rza1BibGo2VlV6NHEv?=
 =?utf-8?B?U2Z1eHZVbXF6OHdISzV4cEUyR2pxK0JOYys1ZUN4UFdzVzROeFp3L1JxWDBR?=
 =?utf-8?B?elEzRGcyUXM3b0w5NjBpTWZaK1J6Vit1VlBseVg4M2crVy9EeTJqdWpVYmJE?=
 =?utf-8?B?ZythdThjdmgzS2IzTU05SXlxeXFTSnFraUVrWkdtM1M2Mks3QTVWVks5N29p?=
 =?utf-8?B?ZUhrc2d0S0lIUWgrYnZ1Z2sxYkQrL3ZyeFRjdUc0TnQ0czVyNVJtSy9vQ3lX?=
 =?utf-8?B?VGpYVHJPa3lvc3pvd1ZKcW9kdTU0MzZzK2lVa2gvY0pDOWRXV2xsYXdFTTgr?=
 =?utf-8?B?WXV4NDZQMXRSVWVaUjRuQ1hScXEwZWo3VmdaNUdLVkJSNllrL1BZNEdIc0hO?=
 =?utf-8?B?L0tuLy8wNlhMM1RDd0twU1BaNC9kQWR4ZzVmc1pZOFAxQmd6VHBkQzQ4dGcw?=
 =?utf-8?B?dnRNUGF6RXVGRDNWQ1NqcU9kdVl3Z1gxRG5kbVBaUDB5d3FEenJOT3VHTnZt?=
 =?utf-8?B?cVRvWFo0Y3U2akYyZTJBamoyMTVIYnIrUTEzSFZxbms5RmdqTlpTMDlVdzhx?=
 =?utf-8?B?WGRrNWsyTVRXWis1RGFDSVVpQ2w1TDdjajFseFcxUjNteWFjK0E5eGVaa2RT?=
 =?utf-8?B?NDJyRzBZQlpnZ0pITC9tSUFnMkZRbm8rdisvWW5JL0N6RkY1UlZBMFlucXRt?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 537d9cf7-dace-4270-2d80-08de08fe1879
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:55.9611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87CvCAIK3Imp4ZW7sv1vG16nxYtOZTB+iXiHAzTCcal1mGNzcGhADjCeFRpsmgWdeMzGJ7hQVyTuYKtepOYLWYX1L2umN49wzKFN+LYXUpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 18 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 34 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 582aaf062cbd4..50f09994e2854 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -395,6 +395,24 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
  * @gt: the &struct xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1e4dc46413823..e5298d35d7d7e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_pf_migration_data *data);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index ce780719760a6..b06e893fe54cf 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -203,6 +204,38 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *vfdentry = dent->d_parent;
+	struct dentry *migration_dentry = vfdentry->d_parent;
+	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
+	struct xe_device *xe = migration_dentry->d_inode->i_private;
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_assert(xe, vfid);
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -212,6 +245,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index a0cfac456ba0b..6b247581dec65 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -249,3 +249,33 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
 
 	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &struct xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0) {
+			size = ret;
+			break;
+		}
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index f2020ba19c2da..887ea3e9632bd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -14,6 +14,7 @@ struct xe_device;
 #ifdef CONFIG_PCI_IOV
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 struct xe_sriov_pf_migration_data *
 xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
-- 
2.50.1

