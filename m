Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A891AC82C5A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 00:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0B110E276;
	Mon, 24 Nov 2025 23:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do/qk3eS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381210E26E;
 Mon, 24 Nov 2025 23:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764025733; x=1795561733;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=IQ2IErFsrT7php/2nWiiqpnCqkht1AthumPoF2w6O6s=;
 b=Do/qk3eS9/paSYvmJEAY0J9dARfBmwxbLJSgVQhUy1ekss9hsaFXYG5T
 pehuuXC7Ci8XE4ODnTAPBJlW5xhxWNZabUS6/xLpayFXk9CD+kdEkArMg
 /vTMwa4E+cpXm1+UmqFgmHpdViV+BX3K7b2aPVJPrRpbR0lISvhlSzIJq
 DoBRiJrzIfR+fQsQohetYLjlhYGzhbW/zrhlRmEAl8x8GOra7pjxxJ1EG
 fGgPSULTHQuq+SZj4EVtwV8BGbW2KXTUYc93xBPbrYi514MxssGRyqkmF
 x5YiWcBDALWeWA1TdOPiaitSqvXgJaVDrlNNlUNVjIGIdfH7sFTCp+fCp w==;
X-CSE-ConnectionGUID: mjpC+cwuQLCvpUn02lZRjA==
X-CSE-MsgGUID: deXZKJt5TQmcn8y/DFogDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77512247"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="77512247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:08:53 -0800
X-CSE-ConnectionGUID: 2uS2FBNlTxu8pbrFkiwc3A==
X-CSE-MsgGUID: PU01viTvTnCh7TPn67fe4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="192550282"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:08:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 15:08:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 15:08:51 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 15:08:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rifDkHcsPw/U06ClAqSVy7hOdih/t9P0K/4VV/X+x7Gar0Nf/bD1Qm0PVZHNAjjw5lMp1cqZNHVQbgZ+eqab2hxOYBeDiDmFBWwtqUVhpsHhY8Bw+uaDneRrkaL0/sU/wPt4gx8oLyn4ccxhnFm8Co7B7UrgohsOo3fWZCCbvRsYOjup+wSOKBjKed8uAzL9U77+GpWq3ycp22VTlHxK1AoLkBQxReXzsb7D8eOdiz0n4VpDZUKni5PKUzvsOUfChrM3tSo0e3/J5J4Y4jUF+uSTSuzcCq/JshRFqFVm3XzAr09Nrvq8D/g2oYkQTesyRlXTVLWyLvtjkg13+Yc66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzmkXNdmSIa4OnmpAXqllLKXlHNhylPcsDZKLlCYjz8=;
 b=nQzrT2XI1Hp9EgIeFxsJRyY6rvO9GnCmybwAFfEmMAqtFdSlj53H2fJLK+Db0zSNlWGQ3Oh82qDRVcMwMa+SOvLrixuefXTs+gBf2uLzRe51j7/ZWWXO2YbYT/5u6Ne823vzKMj5QqQEOTqGu/pVx+PesDrxJFvaRxo5mOrmCeuIt5XdrImWm1U0okdpQ+cPrfWgOveCUlIzc8qAlVG3zrIpJYqIbdi8H+wxn8e4SwW3MxaGK/J2S3Crm+oetp0KtgfGR5dskE48x4IQatVheV/o7l+bH4Ig+uXqwf+WH1DZJIzlgKR3AlkjeTRjgcLaucu083vSsxqtayruvlQhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:08:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:08:49 +0000
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
Subject: [PATCH v6 0/4] vfio/xe: Add driver variant for Xe VF migration
Date: Tue, 25 Nov 2025 00:08:37 +0100
Message-ID: <20251124230841.613894-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3b8192-1269-4a6c-250b-08de2bae6d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDg4V2lsYWxmQUw0ZXBwckF6WXdOTVl4ck1zOFYzdXRPYnh0RHV4N1o1ZmJY?=
 =?utf-8?B?bzRYanlrenpVMXlSL3djWWIreUphcmRqVW1iRU0rMGdrWUhodkYvczdvNXUy?=
 =?utf-8?B?TzZLSGl4Y2NaLzZwRGRqNUVQRzdNenpYQjk4OFdMMzVwejJsVTEzbEN1RXlt?=
 =?utf-8?B?WE1hQXFiOTZzWTRZTTNXLzlxZnQ4KzFxOHphUG1kNHlvbk1qWHhRKzRzaHhv?=
 =?utf-8?B?UXVlOUFvM0JIaVV2WmM1ZjYvaXN5NGdWdDJtQzRpMkpBeHVRL3FSd2c2eVU3?=
 =?utf-8?B?Wm5xQm43MUZnUWNtQW9Ca3pOTHlKQndSY0ZKbXNiY1dNb1p3ZE1qV1hTeGVJ?=
 =?utf-8?B?bHpJbjdOVmdxT1loQVpvNGpnek51SVNNR2R0L2ZOOW5RMFg5cVhrQ3pDNUxP?=
 =?utf-8?B?SlVkMm1uWHVuRlp0RTdQSXdhWkVVd2tNS3ppOUM4SSttMXZQSUxnVDRNeExY?=
 =?utf-8?B?d2wyNjZHeWRSVzdDcGRBa013S3pFeWZNRVhaSTd3NkdPSm82Y2tIN0lqa3F2?=
 =?utf-8?B?OE9NU050cVErMWJMa2NMeFFYWmpsS1ZVQnVnNEpnRjFSWWZmQVlTc1VwRFNw?=
 =?utf-8?B?eGdpQlQ0Y3hBdGM1aXFqeDdFQlJVRkVPRFJsR09pRmE0a0M1cUVpWjc3UzR0?=
 =?utf-8?B?QXZ2dzJzU0k3SW1LRTlONFBvb1JmTzdRM3pJR3o5ZG8za1lsbHBEUURXbGVi?=
 =?utf-8?B?VzhvbXpaNHIxTkhpTzdLQWNrbDRpRWdRNzdQMDZnUktzOVN5b0xBNTNId1Vn?=
 =?utf-8?B?MHZKd0pSbU1TUldKWkNaRFVONHZRajgxSHlUQTg2ZUZsZE5LUXM0cmI3RHdB?=
 =?utf-8?B?UjZTYmtDMW4yVEl1OWFURDF1NEt6LzlNN1QvVXpyUzd0d3hLQ1c3UXZyVGR0?=
 =?utf-8?B?MUR6bHNmaldaQ0dNSGNLM1ZGdnBZR1FoM1lvU2pvTnBNQWhudlFoZ0dpMGpY?=
 =?utf-8?B?ZjgxdEM1T1R4OU1vV2ZGaENhaU5qQ0FqbGxGL2xsZzRoYmw1RTBxUVFPbWpa?=
 =?utf-8?B?M1QwMXdJZVNqRjlCV3FOWWxVcVZsR2U3a1h1TWl6bHE1RDZvZU9pR0tiSmsz?=
 =?utf-8?B?TWFXN29Ielo2bGtiN2JJNXMxWXJXc2FVNFU2UDJXb2RxL2RBV3hDQm5EaWt2?=
 =?utf-8?B?TWM1cld4ZFRYUEJlR2dTUk0xck8vOWprSnZVYlF4TGhTSjFQQlBlcyszOTNs?=
 =?utf-8?B?MXE2NXAzYlg5MDlkdUtiQ3pTODdxeVZKdFljSnpEb1AzMFJvOC8wQzZmY2Zm?=
 =?utf-8?B?MlMrUnhEbWZUQndyUHMzckxBWm1lSnR4SEVTVkJnWm9HUUZFOFNCZ01IYzV1?=
 =?utf-8?B?VXk1azZ1TXBHbGdpQllqeDBoU21hSVRRcU91aS9QQzl0aGxhc25sWndOV0Mr?=
 =?utf-8?B?NnJuK2FBZTIwRFhVZHZjQitGOWVEVmNyMGlDWmpGRHJSbjdlWFhLU21mMWtI?=
 =?utf-8?B?cDVaU0o1QWJ6OVFHUGwvRlA4NUk4N3J0UGlscHd1Y1F5T3JUZWRTS3V6OEFl?=
 =?utf-8?B?a25wa0w5cTBzZzI3dFE1cHZWUnNCdG5iY1BPMGthZEhBSTd4NGhUTGFabGxO?=
 =?utf-8?B?MDcwV0g4RzZDQllOWkZqdGJrTHdoUFVuZnNMYUFRYVpQcGZNcW8xaFFscHJD?=
 =?utf-8?B?Tk5VaFRxZTRrdlVRNjM3UUJ3M3BITFNFSit1dnBtSGdkVThqVk54VHc3alE5?=
 =?utf-8?B?WVBkK0V2QTV3TkNZU2Z4cE1PODE0ZVE2dEdqMUo2RTJPbjZzT2xNdTJkNUpH?=
 =?utf-8?B?VTBKa0tYNWN4V0FyNk9wVUZzTHFvSjYxZU1lN1VoTUNaZ3I1REhPcEZrVnNM?=
 =?utf-8?B?ei8wZ1ppcmNkcTN5SHZoRUhUdnh6VkpnVXMzN1I1TkhnRjZnYnJvV2puK3RD?=
 =?utf-8?B?VDN0MmVvYTdMMktmRC9GMExZbGV1b2hkTUFnRjFrbWF5Tm5GQ1dTc2g0SkFr?=
 =?utf-8?B?MWowc01ldGx2djg3amZidjBpQUdTQnFtWXpJMXRzUFhsNFFZeE5ZZlY1a1VU?=
 =?utf-8?B?d1Z2WitLR0swNVIxMGlqK3JiNms4aVovTThBclk5Rk1Qd0thKzlpRisza1ZL?=
 =?utf-8?Q?f2052n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVlHOGw2RnRzdHl3d0JEdWg4R0EvdGFaR0JLcjZ0UXMycG51UzBPSXAxVXNR?=
 =?utf-8?B?NjB1TDlIVnV6ZTUvOS82K21BMTM2RC80WVRFSWcrYmcyeWwyUDRsRnhXVjhH?=
 =?utf-8?B?N1Y0d1ViT21WdlNqMTNOUlczdmMxczFVc0w4WXFTeUpmOWhHUFhTK2ZuQVlF?=
 =?utf-8?B?N0ltOW83d0h4RUJsOTArU1AvWm1hYURPN0hSZktYRy9QSzY2N3k5UXJuT0pw?=
 =?utf-8?B?aXJoYm1RbEsyZUs3NWlLTmtCOFdIU25ueFVaNkFmRHhqMTJNVmpCTEY5VFQy?=
 =?utf-8?B?ZjV5Z0NmYXU2cVZCQlNiaGR6cGl5SnFwSjlXRlF3U2pDRXdOYU1PMzlwaVky?=
 =?utf-8?B?ZGlPN3EwTHdOZlNVV0JCNlBkTXFEVGtpZHpLTmFJT1A3Vzl2aTZhbDJPWW84?=
 =?utf-8?B?REdiZjJ6dXBEQms1aFFkRmRDdlBraFpPNHlVc1lJTWpiUTZmZXgwQ1VDZ24y?=
 =?utf-8?B?QUlnL1FVZEhlVGZpVU1JeHA2b2ttckl2bnpRYmtNaXZSbWc3aW5iQXAyVmVh?=
 =?utf-8?B?NFdORUlQMjk3NWV5T1NiT2pCR1BTVFNwSWx5MFowM253clcrQ2N5Um41bE9D?=
 =?utf-8?B?NGY5WVBFNXdGbzVPNGdNMXNoYk16MGRIYVdEUUNta2RFU3BiQm1Bbnd5NWZz?=
 =?utf-8?B?OEk5dldtTGhtSmVxbEhJcFprOE83VFVaRE1Oc1l1aElJSDZ3Q2RCVzY3NHBz?=
 =?utf-8?B?VUs0alpNZFg5anFlUHR0d012eDczcU5WNllNZVBsN2pxVTlzZHd3TExaeWxB?=
 =?utf-8?B?SFdDNW91cUsxYXZMOTdnVS9RT3J1UEVocU1uWVE3TEJkQ3RoditpQnRWRno2?=
 =?utf-8?B?RnBQbVNiK2dLSXloL1U1bE1BbWJPUmNPNmw5cXlFRDFmdFhIYmh1eTVIbFlX?=
 =?utf-8?B?TGU4VHJPVVRESm1aYzlGMS9Ea0pXamxDaUgvQ09McGhwSGUrdjBONklZa1FZ?=
 =?utf-8?B?eW50TjBpSXRhMHZzWnRKVGxEK21hUW9raHhTdmJaSmlPd2x1ejUyTEpkOG1K?=
 =?utf-8?B?Ukl1K1laYWpxNjRJOXBSWnNOdW1UeEdFVDd5Y2VPa0dhWFBmMThaYklISHN2?=
 =?utf-8?B?NmpyYVNqVFZoRFVwREwwV2xZaHVYL1g0b0cwWC9JTzRSNS9ZRlBIeTZrT2t3?=
 =?utf-8?B?WlhHTDdaWGJRdUF6TGtMS0RGbVpuc0M2blZmWVF0S001U1JDbXl3WW96cGNL?=
 =?utf-8?B?akU0b1hVOXZLRnJ4azczUmIxOUZNZWJEYi9wOGlGT2lOSjZiTW5UQ2NRWGxt?=
 =?utf-8?B?VTZUQ3NIT1lIOTNkMTFndDJXOEdmUkoyQ0w5eHgxSkRtc08xNkc5ZFI3WElU?=
 =?utf-8?B?WHF4SGxOMG1TTUtPR2NUZExWYk9HNWl6T28rdlVHSkFENVczMko3VkpTaGRC?=
 =?utf-8?B?d09TczJ5MVpMSXFTS1lKQkF5RThva1p5V1hZVWhwUXkwQ0Q5SjlodlB1Zy8v?=
 =?utf-8?B?ODlUVFdEWjcvcVphaFo1ZUFhSlkxcklZcFB4NE1aczlSbEphYXhPbi9Ocm1C?=
 =?utf-8?B?Ti90WitWRzRXWm1GMXVTeVg4TVhsdlBuTkV4SlNsM2NvSFU4eEFTMlZCR0Rx?=
 =?utf-8?B?M2tBYlJ4cW5ZcDBncElhMUxpSFIxK25CVGdGbnB4WHd4T3pCUG52b29WVVk2?=
 =?utf-8?B?cHU3a0JoSlo4UE14YkFTc3Z3b3V2aTlJTEpVNFE3N2p3RVppbGUyR0VnbC9P?=
 =?utf-8?B?eFVpR3l2RWQ0M2F0VW5XcVREODc1QXJhTHFXOUNuZlFNaVU2WVI0NC9TVG5J?=
 =?utf-8?B?R1lzNmxIMDZzQXdMYitKZW1jVTR4MkJPc1Y0LzVIZWh1VktpY1orQWdRb0l1?=
 =?utf-8?B?dys2N1VKRzZSME1UTmYwQ1RnVFIwYzNWeW5zYjJ5bnppODRPSk1jV1pXR0ZU?=
 =?utf-8?B?bFY0OUc5M0s0d2M3K0YvajBHcEhFZVNKU1BzTWpEOEJML1poRmsvcWJsci8r?=
 =?utf-8?B?NTBHcHNvOWRMWWYyUGJDVlRnMDBCdUxMWWgySy9YTXIxT3dra0g5a0J2ZzFs?=
 =?utf-8?B?TE9aY3VqeEVrL2hSbHpMK2JmWm1OWVFvZE01LytjazAyREhlTDg1U0txOWJk?=
 =?utf-8?B?NXg4OStKRytGclhoS2VQb3VWNDhveFdadFZQRVZ3cGtZenNCOTBXaUpscS9y?=
 =?utf-8?B?bVdWYXNWZlgwVzdTSDJHOEh4ay9LdWhSc1NCRnQ1SWJwc2E4K0lydDAreEVN?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3b8192-1269-4a6c-250b-08de2bae6d7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:08:49.5992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWvdknHIfy+gGTjB0hvJg98Jxsic2TEE5I4OB4+9jrZ+HYaJDUZgXnhcSbfn/XqMTZ4M9b2jJqu0G15sJR1ERtFY11y/CuC2EI1UOGroJmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

We're now at v6, thanks for all the review feedback.

First 24 patches are now already merged through drm-tip tree, and I hope
we can get the remaining ones through the VFIO tree.
No major changes worth highlighting in this rev. Full changelog can be
found below.

Cover letter from the previous revision:

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occurred in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

Links to previous revisions for reference.
v1:
https://lore.kernel.org/lkml/20251011193847.1836454-1-michal.winiarski@intel.com/
v2:
https://lore.kernel.org/lkml/20251021224133.577765-1-michal.winiarski@intel.com/
v3:
https://lore.kernel.org/lkml/20251030203135.337696-1-michal.winiarski@intel.com/
v4:
https://lore.kernel.org/lkml/20251105151027.540712-1-michal.winiarski@intel.com/
v5:
https://lore.kernel.org/lkml/20251111010439.347045-1-michal.winiarski@intel.com/

v5 -> v6:
* Exclude the patches already merged through drm-tip
* Add logging when migration is enabled in debug mode (Michał)
* Rename the xe_pf_get_pf helper (Michał)
* Don't use "vendor specific" (yet again) (Michał)
* Kerneldoc tweaks (Michał)
* Use guard(xe_pm_runtime_noresume) instead of assert (Michał)
* Check for num_vfs rather than total_vfs (Michał)

v4 -> v5:
* Require GuC version >= 70.54.0
* Fix VFIO migration migf disable
* Fix null-ptr-deref on save_read error
* Don't use "vendor specific" (again) (Kevin)
* Introduce xe_sriov_packet_types.h (Michał)
* Kernel-doc fixes (Michał)
* Use tile_id / gt_id instead of tile / gt in packet header (Michał)
* Don't use struct_group() in packet (Michał)
* And other, more minor changes

v3 -> v4:
* Add error handling on data_read / data_write path
* Don't match on PCI class, use PCI_DRIVER_OVERRIDE_DEVICE_VFIO helper
  instead (Lucas De Marchi)
* Use proper node VMA size inside GGTT save / restore helper (Michał)
* Improve data tracking set_bit / clear_bit wrapper names (Michał)
* Improve packet dump helper (Michał)
* Use drmm for migration mutex init (Michał)
* Rename the pf_device access helper (Michał)
* Use non-interruptible sleep in VRAM copy (Matt)
* Rename xe_sriov_migration_data to xe_sriov_packet along with relevant
  functions (Michał)
* Rename per-vf device-level data to xe_sriov_migration_state (Michał)
* Use struct name that matches component name instead of anonymous
  struct (Michał)
* Don't add XE_GT_SRIOV_STATE_MAX to state enum, use a helper macro
  instead (Michał)
* Kernel-doc fixes (Michał)

v2 -> v3:
* Bind xe-vfio-pci to specific devices instead of using vendor and
  class (Christoph Hellwig / Jason Gunthorpe)
* Don't refer to the driver as "vendor specific" (Christoph)
* Use pci_iov_get_pf_drvdata and change the interface to take xe_device
  (Jason)
* Update the RUNNING_P2P comment (Jason / Kevin Tian)
* Add state_mutex to protect device state transitions (Kevin)
* Implement .error_detected (Kevin)
* Drop redundant comments (Kevin)
* Explain 1-based indexing and wait_flr_done (Kevin)
* Add a missing get_file() (Kevin)
* Drop redundant state transitions when p2p is supported (Kevin)
* Update run/stop naming to match other drivers (Kevin)
* Fix error state handling (Kevin)
* Fix SAVE state diagram rendering (Michał Wajdeczko)
* Control state machine flipping PROCESS / WAIT logic (Michał Wajdeczko)
* Drop GUC / GGTT / MMIO / VRAM from SAVE control state machine
* Use devm instead of drmm for migration-related allocations (Michał)
* Use GGTT node for size calculations (Michał)
* Use mutex guards consistently (Michał)
* Fix build break on 32-bit (lkp)
* Kernel-doc updates (Michał)
* And other, more minor changes

v1 -> v2:
* Do not require debug flag to support migration on PTL/BMG
* Fix PCI class match on VFIO side
* Reorganized PF Control state machine (Michał Wajdeczko)
* Kerneldoc tidying (Michał Wajdeczko)
* Return NULL instead of -ENODATA for produce/consume (Michał Wajdeczko)
* guc_buf s/sync/sync_read (Matt Brost)
* Squash patch 03 (Matt Brost)
* Assert on PM ref instead of taking it (Matt Brost)
* Remove CCS completely (Matt Brost)
* Return ptr on guc_buf_sync_read (Michał Wajdeczko)
* Define default guc_buf size (Michał Wajdeczko)
* Drop CONFIG_PCI_IOV=n stubs where not needed (Michał Wajdeczko)
* And other, more minor changes

Michał Winiarski (4):
  drm/xe/pf: Enable SR-IOV VF migration
  drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
  drm/xe/pf: Export helpers for VFIO
  vfio/xe: Add device specific vfio_pci driver variant for Intel
    graphics

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |   9 +
 drivers/gpu/drm/xe/xe_pci.c                   |  17 +
 drivers/gpu/drm/xe/xe_pci.h                   |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  35 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   1 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vfio.c            | 276 +++++++++
 drivers/vfio/pci/Kconfig                      |   2 +
 drivers/vfio/pci/Makefile                     |   2 +
 drivers/vfio/pci/xe/Kconfig                   |  12 +
 drivers/vfio/pci/xe/Makefile                  |   3 +
 drivers/vfio/pci/xe/main.c                    | 568 ++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h             |  30 +
 15 files changed, 964 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.51.2

