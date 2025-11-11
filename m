Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580CC4A2FF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCEF10E4C4;
	Tue, 11 Nov 2025 01:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECch6fFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6E610E464;
 Tue, 11 Nov 2025 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823165; x=1794359165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ly4mmcW/4HH/yrSN8by/82mmuBmRUJWFS3MaB/oSA4w=;
 b=ECch6fFMYNVb1osf5M852VqT9kLCBsaiDJyU5MDhW95UXdydNUYOPM+K
 knabfWu7In9ZR0SBStaWxSdJm1geGeltmoG4pL3nUXKQDSA8IqB0O1H7a
 v38opVs2vDavaABT9TVrBIhQyww2RbPpi2CVzzHDE5Okt+RXduCL8NKH1
 8ycrl8f2LpWIpAqwMAoK/23jBhoTCLgvpgZCALxm/2Ub4k7RXTJHiYJie
 pQyYmJHVvO3ryNdRa0oOYO/r023bwpFo5wqE6sjOH+n00tT91hnuQdc1q
 WIrzqjVh6MVbQNFyoS1VUpGTf4W8QF6In9u6qsGXta7eTTpp6qILXG7kd g==;
X-CSE-ConnectionGUID: d4RexwNzR3utu/7btuTc2g==
X-CSE-MsgGUID: ZgwWKBSERJmrZYl//KP3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277599"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:05 -0800
X-CSE-ConnectionGUID: J1aGvi97S0OAWk0lwFlSYA==
X-CSE-MsgGUID: r7jQW8MHQLCHdcF4wk5cDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:03 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXd0HLqXBkLtU316+A8COcitkZn41nTb01AoQueCgVdE1FS0N7kGaN0l1b/cQP6iycth+wdMCTGN0bbSfl+35NGiPT06ehbSIFQ0knHkSBiXndH072L8kkUBXskKekeXuv2UdJUDx2VwPJLRdZ60j30dlaY3a28eaFdvNIomwMg4g/llOdwj5Aef6/h3Nhd8OnNLVC+pzTufjgFs3l9mlCmxw3hIrqlgquzzkAlt6FEsR6i9VGFspmQzJcuxssSgtq7S3JVcoQI4hwc6OMCt6y2UFbI+ECMLUY0INV9oUen6KKC1T3IVOhuFwEz4UUjM0hnxby15BprkO/mEcyl8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U92x7DWXvcMQP8so1PdwErrXJ0lIhhGhewZWjHxl0gM=;
 b=ptVW7R90BYDQOBT3wT3i50seisub+b7oHkKmL21UJDsaSHuD3H2IiLF1XaN/60OwnkxQgzUz0Q667tgZROoRsXw93Ccb1xaAjWOk+yVyeZDPSuL5qPd7Xe3wgeQvPALBOu68hRNjo4CxzclItIZCy9yL1UMJgrwkHQ8e+GxWnYsiNWlQf5a6fk5GROx7O8kO7RBYjFFqIKqBX9kKYJoDoEQu/CgknlXkH8NJtv360lunXlRrus+HKy8h6PY/USPzEgHPKCrsp/rW+xc+EN5jZrqkY3zjWftOv7M5jIKqSwvsVuWZubsZziz8kiPj+LuqcFX56fK6XRgOWXdKFWiFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:54 +0000
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
Subject: [PATCH v5 11/28] drm/xe: Allow the caller to pass guc_buf_cache size
Date: Tue, 11 Nov 2025 02:04:22 +0100
Message-ID: <20251111010439.347045-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0046.eurprd09.prod.outlook.com
 (2603:10a6:802:1::35) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af9ced3-9345-4b91-ded9-08de20be7722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnMraWN0TW4yaWx0bndrWVRHNzUxeWgvcHkyMy9jVXloL04yWk90V01Jb3pK?=
 =?utf-8?B?djlublMyYXNmWHRqd0ZRY0hBUC83QktLdGlheVZnaWM0MWNNb3BaMW5hb01Z?=
 =?utf-8?B?WG82K0NKR3RuTGZKNWd0bEZlS2p0YkZEenRDK3lybk9CeUZTN3FxYis2WkZx?=
 =?utf-8?B?S21oL3ViZ3lGVXh4UVZRWHVWejNPU2VOemdWdE5EZ0FJbXhmRDgzQU5hUzRB?=
 =?utf-8?B?M2NMYXhTbDVrZkJEL09pUEo3ZFRYN01pbDJjcmZHNUNhWlRGYnFuYmthMWk3?=
 =?utf-8?B?V2lmRGlxMDdqV2xySmE0Q2NQemY5WVM4eWZ1SFduMVlueGxNdEEybmova0xL?=
 =?utf-8?B?NkphR3Byb095bEFBNHpFMXovYmk2cUYrK2paQXJMaG5LZGVqOFB2anllZjRO?=
 =?utf-8?B?VVBndC9zd1Z1RkVNUFVES1R1Q1FHeWdjQXR4UHdvR21nYUZVaGlxbmFYVHlk?=
 =?utf-8?B?eXdlSjVxQlkvYlIzWWhndVFHN05hSmIzVDl1dmxLN3lFcHZWK21jQUxCQ3k4?=
 =?utf-8?B?S3BEMVJBUFN3NHMwNndxWDN0Y1QvMWF3WXBlUEE1SG4zL3pmeTVyckZKZjZh?=
 =?utf-8?B?QW5ZcVZCR1dqOWFWZEZpbXA3dkFJUjVLdzR1Z1habG1BUHdXbUtGWEJCdVM2?=
 =?utf-8?B?NzAxM1FkbFNVYlhlTUt4cmpQWWxCSkw0NWI0OFdyK1lRQzBuQmRCcmo5OWxs?=
 =?utf-8?B?Y3k0OCtISk15STZtb251d2N4c25MN1Nmd0YyOTlWVGV1dFdrMlRFL1FBeENV?=
 =?utf-8?B?WFJlTnR5aVN0cUpFMTJzSytZRkRLcitwTGVobk9sMmpoQ2N3UkJiUTVqOUZu?=
 =?utf-8?B?QmV3ZkplRFlaQ2JqbmJCUlByM21lb3VMSzk2NzFtbElVQ2tEYWhycjAzSG8w?=
 =?utf-8?B?V0kwdTNFeFRqVUJ2Z0Z6N0ZEdGcvKzBxcGRkdmpKdHpIclJlMDAwQ0NsOXli?=
 =?utf-8?B?TjRkYzJpZ3ZORFBwdkk3Q1hHU0NFbGFSNWQzSDFVeThEQUJMenRNdk56a2Y3?=
 =?utf-8?B?NHQvbjNHYzRqbDRzbXlUVktia0thQVBBaDJjZVRoWXdvU0dkOVZhdzBneEtS?=
 =?utf-8?B?MG95ZG9BOVNtRDVJSFNicllYTlFCMVl1RkpVaXM0Rjc4MHhHWXE4OGk4SmpF?=
 =?utf-8?B?dDZycW9HUHg2b3VpZXh2RDFzVUl2ZFZ2b1RBK1hjc0hRYlgvanFweW56WHRp?=
 =?utf-8?B?UUVnQ1JMWkltWW9NMzVxZTRncnFhc3JVL3U2YUc3bk96QndjRGV3S01JbzFB?=
 =?utf-8?B?MDgvSHNXbzUwcS8xUjl3NUVOdGlFNFZ5QXBCRmpBak14RGs4V2Y5cFdPdGFX?=
 =?utf-8?B?QmdvRi9CZ0xia2FFSDJOOUpIV2ZkQlIxNkZURi9GYlAwdzB3eEcrRU1BcE5q?=
 =?utf-8?B?TkVNSXFxNVdPM1RmN2hlbEw1dVRtbTNpSnhoYTdXVGRRc2s2KzBGY1pTTE5o?=
 =?utf-8?B?NDNVcDdSUVYxaTc1dVRCYkVyVzF4ems4ci9GVlRXUFJ1UDkrWXlqcFlVYW8x?=
 =?utf-8?B?NEplRU5ZOXB0Vk9MNkIzT1EwS25wK0tkOFFvMjEzY0xGQ2tBdEV3KzhEcU41?=
 =?utf-8?B?M0ZmdmIraEdpckRpVjRCaWl0c0VDdnJsYmQ1cGpuU3MrdEdwQWo4WHd4RXNj?=
 =?utf-8?B?M2hFckNjVUQ0d3ovcmtuMHJrV1NPS2xnREpvaTNEZjRPS2QxeW1vVXg2YzN0?=
 =?utf-8?B?MjNjcmc2M3dxMyt4eU5ZZFlxclNoMUFqY0NRMUVlajdRZlMvVXNHeXp6dHhS?=
 =?utf-8?B?eTJucVdFZG5pb2UyWFF5WDluUnBzcDFLbHlSZWN3YnNvVEpxQUZ1aHdjK3Ba?=
 =?utf-8?B?UkZzckNROFpLRTUrQU83TllGZTByUXVCb2JpVHJUalQ1U0ZqS3RKQ3cxb2dF?=
 =?utf-8?B?VUtxb3FzM3lSVWxValNHbWVlQzBadW1mdm1RK292dkpzWDFlVWtnVkFCTTRQ?=
 =?utf-8?B?c245OWlKZ0tQT2RPUUFNZmp4WjMzUnJLRmRPY0xoTmo5clZtMXgwcTdIdTNX?=
 =?utf-8?Q?APX2qdC1bXQR7kHtTjhSRmj0DWGiGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHhEKzRsWHg0ZGdISk5uRGs4clZmQTd6VzYzeVFXMENmc05wNVZES1pJSjJs?=
 =?utf-8?B?WXZiVnR1Wm9NOG5taThFREdHdjJ6WjVERUc1aEZwM1dXOHFmdk5vRkNJakpQ?=
 =?utf-8?B?WkFTaWk5S3VDTm0ySEh2ZGNETGZjMVFRa0xWTTM1ZngrNmhUN0had0s5OS9z?=
 =?utf-8?B?eVRERi9NcTZQUlFHVWNkbTlkaEtoYVBrZ3laSm8vR3RzQTFEck9RSmJBdFdB?=
 =?utf-8?B?UkRGWG1GZHhFOHNrK1dqbzVSZ3JEMzlOdzBYeHpQc0JEUjN0Ym95Y0JFL0Fn?=
 =?utf-8?B?V25tbVlDTnk3Wlc2T0w5YlpiNUQ5QjgybVFsNFJYTGlaamZJL01OUWpaenZI?=
 =?utf-8?B?N0RKUGlQdG5pSUxWZCttTUV0WG1sSEFycEd3RTdSU3dVeVk2YTB3VS9FRFNt?=
 =?utf-8?B?bDFQVHl4V3pRbVNSM1BrUUx1ekdFUE9QZStkZVgzN2hnQUw0bi91di80bUJa?=
 =?utf-8?B?QzBuQWZCWWY5ek5aTzZxNzNqbnRoc3M0TDJIQzRDcVdtNmFST3F1eUhPd082?=
 =?utf-8?B?ZkI0VENJZEVibzQ0bmExZVRRK1NmNEpNT08wTnlrL2FkemxPbmRhKzBsaHZi?=
 =?utf-8?B?Zkh2ZGkra296RW1UQ2p3ejlJaWpETmJ5RzZSYUQ3TGhTYlByc2lVN1htSXNw?=
 =?utf-8?B?dzh1L3d1VllTeWlCa2lzNnRlaW1LOWpxU2lHV0dJWDcxdTR4K2toTG9JVnpn?=
 =?utf-8?B?VGVTRGx2ZFZ0Y2xXMnErM2dnWkIyYnFrWEN6Zk0rbnZoWTVMZTFwUWFFaTVq?=
 =?utf-8?B?UzhBT2F0ajN0UnFpUG9zOSs1R2ZXM0YweEEzMkJDckYrUmY4MVQyUnhIUy9S?=
 =?utf-8?B?czVaVTJyUVZvWmRwZDNTb3FsbElPZXo4RWhlNXZYVXdSQ2c2dlU5QVk3bWVF?=
 =?utf-8?B?OE9xTElQT1JwRmdBUjdZZE15S0N5TksxNHpIQVJTVU5vamQ0WUZWVTJtMWFa?=
 =?utf-8?B?c0FUVnUvU1NLS0VKa09oSTBVOTBacGY5cUgyMWQyeTZoTlpndHdWWjBZcHcz?=
 =?utf-8?B?N0VXTzZpUkJNUTI5SXdvdll6YkdFV2FPVnpJUlJ1V0lwREdnNFRzaTl3MEVi?=
 =?utf-8?B?UDlpTmp5U2prK0YwVVo4L3ZkRzNHa0ZjZ080T1VoTmtGdHllYUV6dUpqZmcr?=
 =?utf-8?B?a3FhdmVRdi9xMTNKMnpvYjhLVENlN1VUVDhGa2E1NFA3N2pTaThBKzdEd2hP?=
 =?utf-8?B?VXpNWGNoRStWWFZ3WEtTZDIzZGVVaGJMbGdUb1dxYUJyRi9LcjU0dWdIak9v?=
 =?utf-8?B?d0F5cTZUcGNrTEh4TFJHa2tZVGZmcjBOSVcwM1l3dzkvZWVmdGpDQjVGT0lP?=
 =?utf-8?B?Wmh1TnN6YkIwVm5UWFJjWDBiSVB4c0Ftc2p1bXowdmZ5MnYwUW9Ha0RNNWdk?=
 =?utf-8?B?K2tpMExmc3E4N21RanpBcVY2SytrblZCNEI5QmRyaXdYZllPZ3RXbzRCL0ZK?=
 =?utf-8?B?U0xmVmJCQnNIR0N5eml0Vml2bkZEYXcrazBkdlZCNEJ5R1JmMU5PWlRqcWUz?=
 =?utf-8?B?blBNOXNHSmRlRmJLVDg5eFRFalVqbE9qNmI3OTlDeThhUjByMys1UTI1U28v?=
 =?utf-8?B?QW5ZM3g4R3ZiKzVQYnZRdWRMWjEvRkRiU29kNVN5WUdib2ZQaWx5RHdVSVZv?=
 =?utf-8?B?ZWllRVh1eEh4VVJKUFhBMTVFU1lTUE9COFFsaHgzSnFvdXZBVDVhT2V5TnhG?=
 =?utf-8?B?Q1ByVUpvUkVNdFQvc3Boa0hKYzV0azFTUWZCQm96RjFxUUl5Tk5BdUx1MTEy?=
 =?utf-8?B?cU9xM3pWQ0EvS2NPQ3ZaNWhHeWNJdmZCRy95S3A5Ui95YUwxWFdMVHFpWjhD?=
 =?utf-8?B?Y2owR011Z2dtV09meFN5UE5yQ01rZTduVDcrN1lkQ3BBa3VZUmNwVDIzTDQ4?=
 =?utf-8?B?WTV6MGtpN0ppNDBadzZ4UEdRK3FSTTV1WlVaK1N6T0dXTk5SMHl5MXFHZkVV?=
 =?utf-8?B?OU52UzdmQmpnaXcyTERpSEtabmg3WVFwYksrYS9JV3lVV2hYcUFiNHBOZXdZ?=
 =?utf-8?B?VjVyZlhnMklIRExuQ2NTS0o5NHFVdWo2dmZMekxNdW9KS0Q0NnJYaXg2MjRm?=
 =?utf-8?B?ZGFFQzVrVzUvQkpYSnBLb1pPSU4xWDRoT3BETkZmT0hqZ243L0JTSkdjdkpv?=
 =?utf-8?B?TWdveGRJVXhaWXNwdEt3cldNcS9PZlo5RWs2ekJDRXM0cEs2djNMTGIzZERK?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af9ced3-9345-4b91-ded9-08de20be7722
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:54.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3I9NxAnOLF+nxpNCee5i0G56ayH/EV+dvZv752JHwqBM1rUpAHtFTTrzmpxlNvniADlikxMbZ7Mdt80iNHq5N+TzxYj7dtCqTY911fL0enY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

An upcoming change will use GuC buffer cache as a place where GuC
migration data will be stored, and the memory requirement for that is
larger than indirect data.
Allow the caller to pass the size based on the intended usecase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 44 ++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 4d8a4712309f4..3ce4425001303 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -13,6 +13,8 @@
 #include "xe_guc_buf.h"
 #include "xe_sa.h"
 
+#define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K
+
 static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
 {
 	return container_of(cache, struct xe_guc, buf);
@@ -23,21 +25,12 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
 	return guc_to_gt(cache_to_guc(cache));
 }
 
-/**
- * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
- * @cache: the &xe_guc_buf_cache to initialize
- *
- * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
- * indirect H2G data to GuC without a need to create a ad-hoc allocation.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 {
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
@@ -48,6 +41,35 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
 	return 0;
 }
 
+/**
+ * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ *
+ * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
+ * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+{
+	return guc_buf_cache_init(cache, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
+}
+
+/**
+ * xe_guc_buf_cache_init_with_size() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ * @size: size in bytes
+ *
+ * Like xe_guc_buf_cache_init(), except it allows the caller to make the cache
+ * buffer larger, allowing to accommodate larger objects.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size)
+{
+	return guc_buf_cache_init(cache, max(XE_GUC_BUF_CACHE_DEFAULT_SIZE, size));
+}
+
 /**
  * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
  * @cache: the &xe_guc_buf_cache to query
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index c5e0f1fd24d74..e3cca553fb004 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -12,6 +12,7 @@
 #include "xe_guc_buf_types.h"
 
 int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size);
 u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
 struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
 struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
-- 
2.51.2

