Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55EC52734
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF2B10E726;
	Wed, 12 Nov 2025 13:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKnjVzho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C33410E72F;
 Wed, 12 Nov 2025 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953820; x=1794489820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ly4mmcW/4HH/yrSN8by/82mmuBmRUJWFS3MaB/oSA4w=;
 b=NKnjVzhoM53KsRe7W8mKRYirdwqTri4Yissk4bShpuT6ERdTDeQ+iwO7
 0rvlZ82YdFoNoEEMFXmz8qYVNPfb494KmsVjZ2288djokRMmKPHBHmpsC
 +wbdNy7Em62pW24znE08ZYuA7/7yuFTtjGAItUHcxOhf1m490AWBZzHHN
 ERXWGPGLm1opvNMoZyTgz7fGpY0jzhRt9Jb0UKbGRT31VD67/NgJKLKEp
 urGTzzH8NzFPExfg5X9Vk1+gdcJh3GDXucnh141hZT50YX26T+PhJAVM/
 Gyc5Vk99s+vZCJksltlNZROg/RRY1vjcD4kuMDwOQANG5XRTKn/izJMTg w==;
X-CSE-ConnectionGUID: U+IwWNdtQbK9WGYEtcwHng==
X-CSE-MsgGUID: 5MeRf0AnTdelUKuDuY6ObQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322644"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:39 -0800
X-CSE-ConnectionGUID: MfJhQFNEQXCMJDvUaiUePA==
X-CSE-MsgGUID: qelR6e/XQCeiIGB4o1qA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188857971"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:39 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGKXZKLIj5biNNnjVJ5YSuIy/CU/PMaqTuhqKYD8y/+bOBLYbRk9Ie57F21tpBS0NUXIE+7KfgOjeLB4XazJc5uatzUlxs3aiL7+15FdlCtfyXy842r2X4OXTb7n3kAqqJn0zPXbSvJ8eQIW2zsU0cnTz/XK+EgwB7a5kCFxd6mOaCIf5TMdPjmr4V8rnzbFowt+BrXBAUzTR1J7kbq7B7WqHPHFRRlCHweEc0QIyaFZWOZgfl0s7kMV0h44ZGhxPGusyZsJgXaFtv8ilHfpKmgWBicr0keHauFEi7XIvneRQPwjkTqYq3umvyhLntm+UjAfxdw8DjTSLyBmQ81/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U92x7DWXvcMQP8so1PdwErrXJ0lIhhGhewZWjHxl0gM=;
 b=w0y3DJ1vqEVmCbXYYViWDZRx3AXdR25NvwKNAAPexOm4iQgc7mN/3UMwpJZcc8/bmFIpcid47d8CgEGPWDX5MBDGzWJk//juvSDPWEPe7rrF6lOImr4Tbh8g4uYuQRXuwgjO/V4ZSDtq1SfirwCkT2n5aMag5x+mMzV5MfVQiRJz5u2dpSaAaiTPRh12ZJhBwQykXL+AnDmZX8yyimtysK5w8onTdpR+EKyuzF4cE2/CJkDYFofnj9vIn5vgS9orsKAmU+1uP4ZzExL1XeEkUSeXOIuintSoftDl9GhKiBbRrZx8NUKytSVyh7SsxM4PM48l53r6mf0FT+F1XSLenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 11/24] drm/xe: Allow the caller to pass guc_buf_cache size
Date: Wed, 12 Nov 2025 14:22:07 +0100
Message-ID: <20251112132220.516975-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: dde5a204-35d9-4ac6-72e3-08de21eeaf45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdGdTN1T2tFbDliQVZMWTQyNWd2QStkTEtFYjkvSjBRY2RGejRXQUNWZDVs?=
 =?utf-8?B?UHl5Rm8xNldmNTl6eEQwa2lyNUVKeWtSUDQrYjdOQmpkYytkVnAySWlvNGdr?=
 =?utf-8?B?a2FJRSt3UjcxRVoyRExZMlJYR1AvWHFXM0FIY1dYRDdqQ3gyT0lTUTR6R3py?=
 =?utf-8?B?Z0wyMHF5TzhiTDl6a05HTjRlODNWT0FWb0NIZDdsVWpMeHRReDJSWHloZWwy?=
 =?utf-8?B?L016V0oyR0F5Wk1XcjlpRTR3U1VLWDhDbEZzZWdTTHRrYUptRWZpT3RZaWUz?=
 =?utf-8?B?U3VackVyMGExTk9Uc0JJK05HaHhDcW1RekJ0TnVNUFRhZm1nbm4vYWhla3Rx?=
 =?utf-8?B?NTFpdVowdU5QY0g1ZGhUQytIaFdpeS9BdmNtRDBKSWhLbnFEOEs3RGNoc1pv?=
 =?utf-8?B?ZGthcFhCZWR1OXZHT1lZYWZ3aEJXTFdxZERWOGZsZmJoZVJBeDhHeFpOVlVq?=
 =?utf-8?B?elppSnAyMUhZWHJpL0pnckFJZDIwVUpnRnZtVEdKWEVacGNsREl2SWdLdWNJ?=
 =?utf-8?B?Z0I2VUhwWWU1eXZtTWFsc3dGVnFzRyticUNBMnVickFLdXBJQVdheTNuVks2?=
 =?utf-8?B?eWVqWEFjRXVqbGF5Yk1EYlBqUjUyc2huMkYycVMyWnJpRXZJT0hEdW9HWlha?=
 =?utf-8?B?akNoQUd0aGVaeGQ3aENCZVV1L2EzczJyWlAwOUoyYytJOEJZaDZpWStGekp3?=
 =?utf-8?B?MjBtZGJHeloxaENPOVg3QWxRZXplVU9ES3l3dElGVzM3Y09VdGRBSFE2dEcx?=
 =?utf-8?B?ZmRiOFhnRFNLalhWNmtDSTN0S3ZnRWJWR3p3WlZlb2wrcmJjdGl2NGtwYXBm?=
 =?utf-8?B?TS9CdTVGOXcxVk5KdUVieEZGcElIK2tqZWk5U3NPT3V4UityemdNUWlvRzh2?=
 =?utf-8?B?YS9GMmduOTZ0SE9CUkNlSHQ2dlM2cmdxNmlUNDlLSW9YQ2RJRkVGR2R6UlVH?=
 =?utf-8?B?Q0NXMjM4cXp4dlN5UEh3WmlRK0Q5STljTksyVmdkZkJrVlRrZTlyRklOWXJT?=
 =?utf-8?B?eGRZQ2J3WUtOUk1VdzlCMmdoUFB6c0hwc25XR3FXek1veFhxM1F3eEZGU0ZQ?=
 =?utf-8?B?ekN2dWd5T01iYmJPZlFSN0hLWTEyaVI3eTRxRER1eVRCK2VLeHJybXQ1L3lY?=
 =?utf-8?B?dmpMRDhOWjZuUjBpSVdjL3k0WExNcUlqQ3VaeWMwbmRsL2c0cnBVNVFxOVEy?=
 =?utf-8?B?NGp4VmRRWDR5Z0NRT3BxK0t0TkZWc05QNThESjhUc1l3Tk12ajAydHk1L2R1?=
 =?utf-8?B?cmVlQytVM0JPVHdnRlRxRzhBMlYxdkZ0WDRoaXcyM1dOei9IVlY1YlMzVStm?=
 =?utf-8?B?azUvWkFnS3Y1MUhKU3l4UGFQbXJFeDJKKzRtVUdQb0I4aHRUR2g1WUZXMlFL?=
 =?utf-8?B?NGU1T1lxdXlJbCt6eXlCdWJrRGtWeUM3QXRxalozdkZlR1hqYk5BeWpxVGN2?=
 =?utf-8?B?Nm5zS3BNUDdjVVpjdFBJT2FaMUFibEJKY255ajA3WUhHWjFEdUpKZ0VyVG5a?=
 =?utf-8?B?aDZLNytWdEYvMXJkY3hzQ003UHR2cmpDWXAzbXRUWlo4anMrazhsUmNyNUJG?=
 =?utf-8?B?cFBqUzVkMGxJelQrS3ZJSU85VGZqUjBadDk4cVFNWUN0a2V4YTRIZHdGYXNK?=
 =?utf-8?B?a0l0VThCNWdpcmVYZFJSVDNEc1M2Q0d3Q1NBaFV6V3ZVcnVHSmZ0NzNuRkM4?=
 =?utf-8?B?VDNEUTZhekp4Z3U5Rmdyc0piaEdvSEFobXNTeVBoWldERTZYQ3czb2ViZmJX?=
 =?utf-8?B?Ym1zL3FVY056TnNJUXJmbURGQWxGemJoK1VmUFZIdmFXQzM4aTg5Z2E5bWlQ?=
 =?utf-8?B?aFhndVU0eDNhUStWTHVIcEpYcW1xZkFLSWE5MTdyS1VLNG1tVVFnSWF0NVFL?=
 =?utf-8?B?SG1IQWd0MlNJYTJUUkZVbjZKMFBxTzIvUTUzblArZGMyMjJxNHJmRE1iWGsz?=
 =?utf-8?Q?mG6mKs2i8Su0CPBTL9E+Rk8A/FjZRfDi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhmZ2RPYllUaEhYMm1rUXF2MUNnb1dhRnhTMEU3K2FwZ1FGSVdZZjdITEFz?=
 =?utf-8?B?WFY1TGFnL29pOGU2UTBXNjFoWjRlU3FTa05lN0o0cnFFTGR0azBMOHpLOHJC?=
 =?utf-8?B?R1oyYTdqQnpNckhCNUZYbWVzOUl2b1Z3R3hUTjZPMUp2eUkwOXZTUlJ1N2NC?=
 =?utf-8?B?UkJrRFJZaENsWTZiVkJiWFQ2MUwyUG1odXNwaURsSWtsckpUdmhnUHc4V0p3?=
 =?utf-8?B?WUt1L01qT3p1SDZZSStEVnUyOWRmZ2RyZDZwczRJalo2Z01acUJFeHFsWjRu?=
 =?utf-8?B?UEtDOVlURVFsR1JvQnRIYzJpV0Z2UE5BcjVEVlM4YzFoVk1ZcnFUL2RPNkov?=
 =?utf-8?B?MU11TXBRc1pLb0JNUFgweksyYXh0UG0wNENKbm5BdmxVcFVEc25FdFkyZlhC?=
 =?utf-8?B?MUxOTEhFeDdYKy9peFRROGdxRDdpc2FhaFExVGVHOUwxUVUrRXlxRUFDUTda?=
 =?utf-8?B?Z2JzN0oyMzZYbThlbGNBT243VnpDSzVLSUxuS0NtVVhQMkNBakNKM1NJYkNW?=
 =?utf-8?B?eHJYVDFzQW9GM1dMU01XWDk1dWFmYlBwWmx5NEhvQWw4dThTcHlOVjhpQmVZ?=
 =?utf-8?B?YXIwUFlpRDlMUmJkUG94d0R1NDkxRmhyUEtTc2VmV25PWjN4UUdrdDdOMU5E?=
 =?utf-8?B?aFlWaG12VmU0L01jRUVnSlI5S3lXNjIvVWJZcGtVRlFrd2NtTldOb3RrSHho?=
 =?utf-8?B?VFpwWTF3YlJTR0M5bXdGZ2p2Nm1kbkNCTk53QTAwaWdYZE1oZnl4ViszYW9x?=
 =?utf-8?B?VWNNc2g1VkY2dG1lbWlVdFlvUkwzaWtIYlNHQXZwdGhvQnNacWFNNzNyUGpZ?=
 =?utf-8?B?Vk01UnJQcTUzVVNuTTVILzJ4M045WjZuNjdFR1E2Z2dVMTdYWjd0UFZhMUpR?=
 =?utf-8?B?dXJyS1FxRFJrYmU3eHZ1bDZwaGVTY1ZMaU4ycE9abEpUdWQybmI2bFg1Q1RP?=
 =?utf-8?B?dkhVVlF3NVlNd05XVjJtYlJGb3A3K05TWm5ONkkxQldSUlVrWGxTdjVLajIw?=
 =?utf-8?B?NjQ0NkZyRm52Qlc2Y1czWEU4L2dlWWJ0NTBuMGUvaVorejFrUnpaUWFNeHVr?=
 =?utf-8?B?U3cyVHhKK05KbXd0ekpLRUcxdUJibnYxUFNsdjFVWDNDV0hBUCtaWnc4U2c2?=
 =?utf-8?B?Tmx6dURjS0NQMTRUV0ovWGhKOXBSaExCaGFmYVRDOVBUaDJMMjNpL3VHMUYx?=
 =?utf-8?B?Mkh2bmhiK2owUnhtVlpoZ1gyK0J4Ujg4WVhqRW5ydVVLMEV4T2ZnVDIrakNv?=
 =?utf-8?B?anM3RFR4Q0pZUHNCK1hrQ1hiVFBIaUNEWXB2cTA4ckg0RmtZN08yNGtDQVpJ?=
 =?utf-8?B?czdnOXQxUWZWU0VFT0xvL0lhQmU3YllrL3orZHNYcURRa3BSVElFOTBtdXNr?=
 =?utf-8?B?SDdFeXpDMWFvSGttQnBTbkVWMVhkeXdxSkpmbzc1T0hrMnVaRE4zY2ZwMXZT?=
 =?utf-8?B?ZTQ2Z0krZU9mTUhwQkdJaWVhK0FuQmwxb284d1ovR2J6MTNFMnl5WnhxcHF1?=
 =?utf-8?B?OG9IYkU3a1V0cGMzOEhqcGl3Ym5TQXEzUVgyRkJXTkhpMTlpeXpQamd6bFdu?=
 =?utf-8?B?UXhzcituS0dDZWVPSGZ5YUpJWnBJYWdWeEIvcjNBdjdlbURhYUNaUFl2Mlpu?=
 =?utf-8?B?Umw2dXNjUHg4RUMwanhIalNITFJwYzl0NURoeFJHZ0VncnJiUDNUeklyTWxD?=
 =?utf-8?B?MVBwTnk5dnk3emlCcEFDZ1ZCT3VQdi9UT09wenRCRkpHNGRlN1J6UEFpWSsv?=
 =?utf-8?B?WGd5T3hoeHRoc2tob1pXODUrRWM3cU8xQy9kZDdiRHlGbWt1ZDAzcnlVMFZm?=
 =?utf-8?B?TDVyVHlHd2xaaUR5b1k5WGZUM1ZtVjJsbjRPQ0E3QmNnVHF3Y1UxZmhMSTQ4?=
 =?utf-8?B?T2FSeVZGQUVmTUlyYXFTVEtmNWQ2YS9iRmNGaXhaTE16T0R0ZWxMbVVVMVZV?=
 =?utf-8?B?YkN0ZEQ0eDlhVERNbWZjV0RoT1NxWER0NStJdXNlWklEbWw0UGZzNFkzOEFt?=
 =?utf-8?B?ZWp5WWN2NUpSRXN1UnlmSE8zRThuZkxJUFlDQUNoTlBLa3pFczhkc0VEeWdU?=
 =?utf-8?B?SmZib25ISXphZHpFalc0NkVoY0UyaEVpZDIwYkRoajdPVUovc01lL3VaNGx3?=
 =?utf-8?B?cDFIUU4rRHhLeG1tWm05WDErVWF0aTJhbHRQMUlwVVRmZ0I2TCtoa2FndkhR?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dde5a204-35d9-4ac6-72e3-08de21eeaf45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:36.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMmlweubyHDrJb7aTRxc2lkopb3YAYCpBisJfIGjoz5giMPkzkNvBxKwaLXLhsaUjeZMITNUBH3fP9DWEfZtkkeIV4kCbdb4LYJ3XGVfIFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

