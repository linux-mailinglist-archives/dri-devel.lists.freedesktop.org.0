Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D470FBF9191
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDF610E65D;
	Tue, 21 Oct 2025 22:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqJNZGJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859C210E663;
 Tue, 21 Oct 2025 22:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086669; x=1792622669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eI2EbLbhuV6qX5xQh+MEAAj9cYSCEcvnCWaOSs2qqmw=;
 b=kqJNZGJ5NyLd1nl4aiuAYnd023onPdMK466ORxzxaKtZWptYBSbxR+sP
 mz3ZMVJmE25A79u2xHHMs/MScL1+CCxdB8b0k3JFDblEuzgKTsdDyY9mc
 9Ft92Cut4t5l2aD/6USNQGsbkc5txPLaPd+um0CnVSXkH/M1A53y+nLjP
 mKEEyZ+fnDHMEHSkzF3CmmNEf6OUVnC1ilUZ3x/I38DMwMZr68+D2iu4N
 /9AwERi3oy1isoE5/AkK5T6RJUV7vwXp3ZcYRqDluNhmxxtPhMHSiiznu
 iKqXhHB5ijWtQav4th62CPntKXdGKQikalEdoj9dfS3WHarkkK4y8uyx6 A==;
X-CSE-ConnectionGUID: 6T9+8urLS/GC+u5FZIyjJg==
X-CSE-MsgGUID: VsmqJhivT023uWarTVmlww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62926756"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62926756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:28 -0700
X-CSE-ConnectionGUID: PhrhzIiBRLuK+fN/WT/9wg==
X-CSE-MsgGUID: v1jlVHX8T/SDF+9LU5Eg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345850"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdBE8jWzWp3zFLgOBEXBqa+hw3NtaQgShajDOknzW54DsuzggbE83NDEI4RPgZERTl5EE5dS861/QC822fR7g7kGbDARTtXgjl7Jn0VXPw1YgiJTmSje921pVCkWKqAJaRq4WNqv6nSBADgO9w1spnmjlE904PZonzgi5OousNO6nx1cqjhCc+hRHgDmp29TVsr+PbPhHKlas6fmjR3owR/V0Wtr1rQZ6MxTbsL9s3N+nNTo9vfxUL9UdMgmtjD+kLjHc51ESTAoAOv2cbL2UNkJe46N85epVjndjboFBtyy+bSYh3Nqz3fY9yoyctNrHDJTFk9i9adl6z5Xuj92yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW9NePUO7mkpRHzJnbD6YZw+KAtNXIoGZ/Nk/mmX0Rc=;
 b=F2gpqmjMVOF54tzrUHJLmrWd49dEcCE1TJ10e3t1OCwHKm/89Rt0G7rRoaeYEK/fEsXs0X4Hb2qDknmuPupveZV9XdBpb4LRNnfFZDkO055wiOqydxjDEx3p3S/Y1mHGUGf1URBX7QbC5q0ci8WQs4O4ZU6mPdG2Fy2DO3cjxUSBDVk4AMGP+GJi06yqnqQr1oVs5wvGl4MlMfbTk58XrsqbyJ+Vwsu6pWCT7S3w0NFZWzT5Ga+oEiEX8OENulQjlrIl83x8Fiq8WGFs3PGjVbrKfpnMLOCF5T9WNpvu/P+tzz6I5L5nAyzkKxahYonZo7LXnewHArK9HHoTli+R5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:17 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 21/26] drm/xe/migrate: Add function to copy of VRAM data in
 chunks
Date: Wed, 22 Oct 2025 00:41:28 +0200
Message-ID: <20251021224133.577765-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 719091ff-a1c6-4b3b-092d-08de10f35e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk9HbTNnQVNic1lKSjR5WXBxb3RqQ3hhcGhGLy96VllQYlJVY25YUHVhTCs0?=
 =?utf-8?B?WEkxaFJWY1hwdk1CcG5uR01MMUdDd3Z3a1RMZEF3ckx4Y0U5WFB4bExuZFhE?=
 =?utf-8?B?S0dLN2JvUGtYTmwvVk5yeTRTYTllWHQzMVltL0FwbUtNTzAwdS9hRW1zbTg1?=
 =?utf-8?B?Q0Vsb1NCaFBWUVk5T2VPeTRqVE5oUTJYUno1NHRNeituODc5YUlYSHFSczQ3?=
 =?utf-8?B?bXdCZE82S2pMQW1KakhMVmsyTkg1QWZ5VDYyRzFMeUdmVDRtWUlLcTVpdEpK?=
 =?utf-8?B?RExIaWF3T05TMEJVK0NqL0FYM3FyLzZiVDNZRmZlNkJrU29BZEE4c3lWQi9R?=
 =?utf-8?B?WkxhMDAxcHFBbUxwL2RZRVBrQStmakRvRXRSSnhlZnJ0VW1ocnVobXdIczIy?=
 =?utf-8?B?VE1SbGVJYjBOWjh1bW9RaGdXQ3VuQVFZSEx3d0I5OGo0L2NEMVNHT2tqU0Mv?=
 =?utf-8?B?UURROWpRdlM1aVBBT085L3pUNWMyN3lZV1pYZ1dKQ1NYdkQxeFQyU2ZRMkUr?=
 =?utf-8?B?dkk3WG8vamF3NTM4K05vYmJ1TEFyRERCc3FpYnJ3YW13V0lmT2thNm5HakNJ?=
 =?utf-8?B?bDA4UUdJVDVDUjJvZlVoU011N2N0WE13amlBS2hEcS94b3hVbHNEQVVYUWtS?=
 =?utf-8?B?c1JDc1V4bFVVRHZkb0dFbHk3WDJFUHJzRlkvMGRmVC9CSitBY0hJT0ZLNk5l?=
 =?utf-8?B?ajN2ZUloemFzMEhVaE9kdGVVSEE0Uy8yOHNmc2FGUWNEcWtueXU3MFVpZXlR?=
 =?utf-8?B?cGY3Mk1qMFJKZHJIUHRwODhhM2p0d01vUTFPUzVETGtBVFoyNDRYVlRxNW94?=
 =?utf-8?B?VXhmWXhDcllTaWRENDZQY3JIN1VFcWNKTW0vcHQ3T1ltZENhUjFIYlp4cWxu?=
 =?utf-8?B?cUZkOGZnYjhQSndsZXNkbHZ5STRNRnpwZU9rWFZyc2JNakx4RlplbUpsZnpO?=
 =?utf-8?B?aElQUFoxS0ppMHR5eFJUSGZDUEVRcUNnUm5vTzJWUTJtQy9uYmtrWWRVSWdL?=
 =?utf-8?B?am1tMkJwSDVxRzhuVDFubTM4dUVka2hhdG9nUHlMakNOR2U4RnJDU3lIOUVC?=
 =?utf-8?B?ZVhBMTlMTHk1Nk9zRElQTGxxTHR4bUpranMxckpKYXUrVUpjcitqTnZBVzNp?=
 =?utf-8?B?QVRIcTJaSVhZcFBtbGlEWUtUN2NlWWZoQTB0bVNRYUxNNlg3b3E2Q1krQmZ6?=
 =?utf-8?B?UE05TFlYVmU5QTRXeGN1eWNYeWJ0aWNRcENNMTVEUmFmWU9LUG9ZSGFpWnA0?=
 =?utf-8?B?TnhIMHIwem05dC9hQ0h5RkhnVlJRTGFsVnZmd05YblE0Y2pub0t6TUFGNmcr?=
 =?utf-8?B?TmdWemxRWHo0eDVKWmFFNjRRUEtMeUdtdUpTU1Y3eFFsdW9NYk1TWjhrTmFv?=
 =?utf-8?B?S2g0NERpTHoydTBNNGVKUTVHS0UvdE9CM2NlZFJHc0hleDAyTkJWcW5KVnZq?=
 =?utf-8?B?MkcrUmsybnhFNGJTTjVQRnVUWHNGbmVXbnhKZ2dySnNESHpsNVRhanBYRlVY?=
 =?utf-8?B?NFowK2lsVEdYRDN2ZWNWNFV2RFA3M2FnSFFKMzFVZmV0WjV4Myt4REk5aW5n?=
 =?utf-8?B?S0J1aHo4WnQ1RUx3OTltUllqWlVRYVczTStPWmFiZ1lsaklJd2NqOGl0ZndE?=
 =?utf-8?B?R2dXWTRsTDZzQWdwb3o4TGRzbHZGeUg0dGN5QzJrZStUUXVQdThIV0ZKUlM5?=
 =?utf-8?B?SjhIeUI4N2trWVVxZ1FJZlVlTFdJbDFNTDdtSGtWalp4RzU4MTlWSm1HQU5x?=
 =?utf-8?B?KzFuclZBK2FnNFQwMm1EZThpNUdXeVQzb3lIbkpoQ0lJZ1ovMlVKMW04anF5?=
 =?utf-8?B?SC8zcEdGTmhrczVwcHlhZmQwWWozOUs2YklPL3BNUVJkdXlCdXJYcFhiaTZ2?=
 =?utf-8?B?Szd5RGJCUlZ0aDhYTVZ6eVJYb1JkWkZtWTR6dC85NlRqSkd3NVozUWxwZmNF?=
 =?utf-8?B?Sm52K2VSenh2RWFPZCt6Q2xIUXo4L3B1YTBBT3hBZkJidkpGTFlEaGEva216?=
 =?utf-8?Q?dzxg9NpwuonzDmWiA6ATX1e7IkEwLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9HUURuRFBxekVUYjlxUUhmWnJ0TTdnSlJpcUZNUUllaUo5U1BXcHcyakN2?=
 =?utf-8?B?eG1HcWUvVXF0ckNxcmVJS25leEpnUkZzdnloSkpjejZSejY1dk5UdVJlcDVU?=
 =?utf-8?B?czVkYzhvNHIwSWhMRk5tSmQ5dHFYMmhQc21JYTJtZTBlNXZ0RHBya2xrZnE1?=
 =?utf-8?B?eWoxSTU5RUZ0YW9IWFFRQzd1T0RtdngrTFNrQi9FRGdCNnpkbWEzeERHZUpL?=
 =?utf-8?B?SnI2N3owWlFzU3JBcHU0UVRPaXVEWUxhM0tWOGg0LzlRb04yakJqYWV0YXlP?=
 =?utf-8?B?SE5UcitXSjIxc29uOWMyRFJxVlRLZndzWi8vNitZbG51V01uZzdsdUprRGxG?=
 =?utf-8?B?c3k3NUxBN2J4TGFMZm92d2M1Y0I0SjhObWxVbWZXL1oyNnFRZ3RSUmxLaG5z?=
 =?utf-8?B?WmYzODltWkplYi91Z0FyRFVpdmFDRFJYdE1mTkZZak5ZMGt0T2Zxd2hWRFpo?=
 =?utf-8?B?am5LRnFZWGlnUGkwQ2hFR3NJZWRhWW5ucVN5SlhOL0pQNFBIZm5xNVc2ZWd4?=
 =?utf-8?B?S3JycEZMVzBTdmVOekZ3QTFIbXVXYW5HRnRNTXJzYVFTNlFkTWdKclV6MUVJ?=
 =?utf-8?B?aWRVSGpJd09kMEEwckllUndzcXo0cVdLa2xPTzRKRVhySTFhSE0xd29PN0RW?=
 =?utf-8?B?S3d5RGJrblA5YmhsSTd4aFJXMnQ1M29RK285dTh6UWR0QWFxNkxwa2pjTFdZ?=
 =?utf-8?B?eFVjMnJDd3BOaEcxM2lObUYySnhDdndSUWd3NnRveklaWlpsQllDY3lWcURs?=
 =?utf-8?B?eGl2NUdOMXpkYW4yWnJpdVd4V3crSkk0MFkyMWp0Ui9TUWFNOHNpaWtSWXFz?=
 =?utf-8?B?SWk4aXpDYTREdjNWWHV5UzhYNVpMM2I5czdBL3FGOHZESUpod2RBNGFyZUpD?=
 =?utf-8?B?UzhNOWRaUCtBOTA1cUxJa3BUOVZIYVFBK1BOZXZzOW1ZNXBRWUxYY250VXVV?=
 =?utf-8?B?bE5RcERmLzh6MzBjWjF3ZDBTc2JVMlJDZXlLVG1UcGJSdnhES1NoR1YrUTFi?=
 =?utf-8?B?T2g3cHdHWVlTY2E2RzhnVW4ybXZ3My9ZUUJTUEYyYkkrL096TkRXaExUTFNz?=
 =?utf-8?B?YXM3WEZuVEFEL2hZTlFMcVhLSkZ6UE9lQW8xWWdZbmRwcXJIZzVoOUhaUUt4?=
 =?utf-8?B?Z1pBUEkxY2tPQ28wMmQ4ZnArNU41TVpNbDByZHArTXJvTkxRVGhDRG11MXYw?=
 =?utf-8?B?VCtoVDdrSUlXSEZINzdwMkVDSnM0YTk4aVE1U2E4cFNiUDdHTW9ab2F4SHRG?=
 =?utf-8?B?bTBJRHBqaS95UW0wVndKd0VXSFJQd1BJOUZoZGJ5V0FPQkV2bEVlSmlxdm9O?=
 =?utf-8?B?TSt2bUdsR1dwK08xQWtoU0hHS0NvalV4Y2t6SmpGOE81SUgyZ29ieEVIZ2Vx?=
 =?utf-8?B?aWhERDlZVzZ2UHNFMDNxT3NhRUpSYTdzMXdZd01IVzZ4RFg5MldiK1JMdkZI?=
 =?utf-8?B?eWRVVHhJNU5ja2lNL0hTK0poVjZ0cVE2djNKRjg4c28xSHJxT1laZWh2V2cw?=
 =?utf-8?B?VDRMZ0ZPNFJQbUs5OW9wTThPais4RWJZWXFnOVJvbHd5QmwxU0MwSHNkSWNF?=
 =?utf-8?B?RFFLQzV5VTZ6S085K1BhazRkSlk2UEE4M2pRME5FTmd2cCtxL0tZYVJyNGgw?=
 =?utf-8?B?M1JpNit4MnBhVkpmRDNyNkVRYzI5UmxQc1RrWUttR3YvNVFjYm9wYnd0eWRP?=
 =?utf-8?B?NHYyTWRnRjBZallXM28xRDhTQk8xSFBKWXNHQTFidzBJM2Job1RvVWdDZUVj?=
 =?utf-8?B?MkZic0Nsc0dnNmtqRTlyL1hKUVJFZjVMdGl4aWtrNldZQVVhOVRiakJIUG93?=
 =?utf-8?B?VzlmUlpOVDA5c05HaFY5QlBCdVl2VTQ3SmNhczh1QnkxN2F1aDIyTXQ5RFpO?=
 =?utf-8?B?WDAwcGwyaFJwSVBCOW85elMvWnFEblJaYjRyVWw2cTNlcEo0OW5HbVM1bmdt?=
 =?utf-8?B?SkFNQ21YRDF3K2FFb0hKY0Nyem9LNGloSUJFQ08vWWo3Y0lCOWZHMERRY2xG?=
 =?utf-8?B?RFBZY1VOSEZ1Uzd6V0pxTU9mWEgvR081enVyVTdqVUFlR29uZDBJZ0tKTkVZ?=
 =?utf-8?B?Z0VhRGdJUnZXWG9QVUl1VTcwS0VXUWdYUUY1RW5BUlhDOGJSdjROQTRKRFVU?=
 =?utf-8?B?VXJORU1Qb25haDlYRWdMTVVwY1lHVDhYTXhFTzJDS1ZTSm9DTVJXRlJhUjdv?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 719091ff-a1c6-4b3b-092d-08de10f35e1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:17.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Wl00gyTgZ4SY844bM6ijJGeOyWrC/lw05mf/eqTKI/FtQc7J7C4D5KujCoVWFlDTZ59eBSA4f+ggiySS/n/HZOz7teBc/xlPyxgAky068M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 134 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h |   8 ++
 2 files changed, 136 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3112c966c67d7..d30675707162b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -514,7 +514,7 @@ int xe_migrate_init(struct xe_migrate *m)
 
 static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 {
-	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
+	if ((!IS_DGFX(xe) || IS_SRIOV_PF(xe)) && xe_device_has_flat_ccs(xe))
 		return MAX_CCS_LIMITED_TRANSFER;
 
 	return MAX_PREEMPTDISABLE_TRANSFER;
@@ -1155,6 +1155,133 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
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
+		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
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
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
+		WARN_ON_ONCE(!dma_resv_test_signaled(vram_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+		WARN_ON_ONCE(!dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+
+		dma_fence_put(m->fence);
+		m->fence = dma_fence_get(fence);
+		mutex_unlock(&m->job_mutex);
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+		continue;
+
+err:
+		xe_bb_free(bb, NULL);
+
+		return ERR_PTR(err);
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1852,11 +1979,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
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
index 4fad324b62535..d7bcc6ad8464e 100644
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
2.50.1

