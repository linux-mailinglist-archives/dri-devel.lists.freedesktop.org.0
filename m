Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942909B934B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 15:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1610E2ED;
	Fri,  1 Nov 2024 14:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U48+RkV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081F910E2ED;
 Fri,  1 Nov 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730471595; x=1762007595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s89KnM15hyx1+nl05UrEFLAHc4lRGuuzISgbN7Y4R9A=;
 b=U48+RkV4D0SSC0ipnqPzCNfmBIPuz1e43lbh2eqAxreJ8TGDYrDX/2yY
 xgQNUYFZ6HmmM960N/5Qt/EeRTqBY0tBgUPgugWbXEwRdwTa3GvBf4EgL
 dFM1UIjPJKkTMzS8qnXTfyaJgqSiuE5SD2cUT1hKlfDIRUFLpewf8xYi2
 GclvNyEh1K/W5rL03a8y96fwYqA8Qp+gjyoYsZbb8T53yXUBCDIDDIWmk
 U73BL+uueAw1zsIndhqvKRfGkiWax/q4n4EibUk1bwRbnZQgu84Wa6/ql
 OsKCYPrtkItIVaoCaDFQ1XkNapBstdcP5vmhUjq3cNN2ywPhCc3MS7lT8 g==;
X-CSE-ConnectionGUID: 5INgLCcYQ1efiSle0z+Lkw==
X-CSE-MsgGUID: DCkF2HD+SjiXedXdbk3mTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47726537"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="47726537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 07:33:13 -0700
X-CSE-ConnectionGUID: RONvtwFIQmutfxUY+yHCEg==
X-CSE-MsgGUID: Fr3FnIS+TfqunMVmLekZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="86919508"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 07:33:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 07:33:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 07:33:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 07:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPhoXGrRVZigYelDFHzgEGpEgadiICRumvl1glsajh1+/wRTIoh5FXAyjererr/+AXp/nyMQJSWbRpxbky0EFw0HyQz5CTMsUknfVxc0ZpZTOT26hxqvXO9QC1OHBGRf1ToVydEj9yT+v5jNRy8ca1KWxi+HLs+yRzRfO8o6aEmaqGtc5oMQWniMMwLnGAZt+P582Ou2nUuNLgKwGD/jAfPrtW9uacBmYudTUTx9AlBfW/nGYwKLbBoHgllK0AOUYHifPDBYon4PLbZmGxYP5HMurra1t4h8eZyboXXywYIk5gqOGpOWGO0Ec95d132zwtMP9IvV+4vLN+wU8Rb/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lEcqL5QOPHI6dL8C8bh3sx+oC7p2Mx1MARqiuqJvGs=;
 b=BpCKkjtcwuqLXmWunk5tr473KI67hQ1OFAdk6udxajDHD3FdjwQ0yN5n9BCBqiQACZiXN3lBH0CHUOIBJG0DZ5AZnPWD0u0emqWPSuH6B+MsUbcIkh///zHJoRqnvEvHfRkvaCR1WagV8AYsallP6ca9uESm1YJokyxx2TBRse1KPvZ4JE+nniFcU0cem1Lp/6nYBNrMqfHSJvW2vWiAQ+cyzl24cRAp8dNINT9xBo1wjwJwKNlDIygHX5sZtj7DPDRtEfcJmOjnWK3U52J650IB5hCUR9RkfvyzTRhKudtZoAK6Wi/Zh5c9iDBZVm6OJK5jr9vG0AvjtthL4LvGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 14:33:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 14:33:05 +0000
Date: Fri, 1 Nov 2024 09:33:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/xe: Fix build error for XE_IOCTL_DBG macro
Message-ID: <6um3enfackjotwj2ikhvpbnyq3ocro34b5iahx72yhzfxemjsn@xqnovtxzsapb>
References: <20241029084859.135172-1-gye976@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029084859.135172-1-gye976@gmail.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: f07466d3-a249-4615-c417-08dcfa8218b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmE5ekVhYXJxZE92ZUxqeTBVS01BUTlrZ01KbUxqSHhNWVFvV1lmYUx0VFVG?=
 =?utf-8?B?SHN0UVV3NE5mSnlwL1BhRmZ1ZHVPWVVkeWdYNEdnaDhoRDMrMzUxb0V5MnZF?=
 =?utf-8?B?T2JqMENzN2dCUDRyZXl6Z0RIMnpITmR2dC96KzN3ekx0WXJBN005aUdQOWtq?=
 =?utf-8?B?MkYvaWhSTENPRGNZN1dXcldRZldFVmhNODBNeTRhcVJlbGcvc3BKQTNzbFBt?=
 =?utf-8?B?eWVYeGNHQnNET0JaQnFkRWZITjRpSUhiVVNndnpIU0ZmMXFDWWRDRlJNNDY1?=
 =?utf-8?B?elFwYWtXREpwL3M3Tks5dlVmdkVUSEhIZlZuRmtDODR0RmN6bm1RaERoeEZZ?=
 =?utf-8?B?OURiUzRXM2wxR01TaUoycGN2R1owU2xzNHB0d2FyVTVRR0J6Z2VBMXpTdVg5?=
 =?utf-8?B?UTM2aGlzL0hYbWdZeXJ4dERmWVlqb3NmWkpRTTRZQ0tiTjdBeTNHVk5EdzVN?=
 =?utf-8?B?b2dZY0hmemZQSm9qWWxKaGMrb3o3Zk5KL2JMMDlwOHRQQjdTdTlWMFJJbDUx?=
 =?utf-8?B?cS9SWjBxNWRxWDMrZzBQSEhNQzZoMnBNV1JRdS9Rc1RKbWtyZy83TjMvMWR5?=
 =?utf-8?B?WXI4RkplWmhoTmF1NFBESTlqM2hBZEFDVlFTYXVFYmZRWldiV09sQjJ5SWNC?=
 =?utf-8?B?UTduaENYd1NocnMrOUwxNVJVSzRNUFM4K3BvcnF0VXIwZGVFenRiZ0xiZ2No?=
 =?utf-8?B?V01kdUt4S2hoRjRuOWUyay9hUzhVN1FKN2V0Q3BOa0xoRElhaGcyOGtPd21l?=
 =?utf-8?B?U0pHbWdPUXJLUGdaOWJ5eUQvcUFOV2g2a0tYZUdJNVhWWGcyMjZvbU5YOWpT?=
 =?utf-8?B?T3JzRkRqVU9nWXB0c1JyUWY4N3B0QVF6TjhTMU9lNDBYYmNXRVU0ZWxZUkxF?=
 =?utf-8?B?Tm92Tk5zL0dkd01jWnZOczNENGZzOUdKTk9FRkdJOUNsMThkQThKQ0hZQ01O?=
 =?utf-8?B?eEl1L3l6WVd3S2o5NDE0cm90UCtuYnYwZVgyaGt1bzJsVm54blFieXkzdmxN?=
 =?utf-8?B?aGNMYVJxbE9JWDlUU25tVjVqWWFOZVlCUFRvcXlLcWtwU0JVWis2TDBmY0Iz?=
 =?utf-8?B?TTF3cVBweitBRUVHVGVOM1llUzRMOXk1UnVVZDE0S1lka3pycVBRNnZleDAw?=
 =?utf-8?B?Wk1QT21IbGN1WGYrdk9adWhjanJHTHE5T1YzOEpRbGVFbUpVSXRiYXBpTUlI?=
 =?utf-8?B?TkJKcWFhRVNROE90UTdldmFZNTZFaWNsNlBxbWcvNjVsWXJRQW9xRDJqR2Ra?=
 =?utf-8?B?bTNLUlpwWmk0ZWRodG9qcG5KOUVwWGUrdHJNODlKTk50U3pBSmNnRkl2MHY3?=
 =?utf-8?B?UWtjRW1HMytQRGljODFYQ1dpYjQ2azd5NXVDK1lFcWpNOGU2VmYvSW54TnZt?=
 =?utf-8?B?dXAvM29kam5NRDdtOHFmaHJ6T05uR2M0RkJ2NG1pMlBEUFUwanNoUWtRZTJP?=
 =?utf-8?B?ZjkyaWtDSEVqNnZ4TXF3MXV0ZG1vU2JIVFdDR2tjR2EwbDAwV2t4c0ttYzJm?=
 =?utf-8?B?R1VrTEhVOXlMV3J4cFBUTWw4N2NDZ2NMZGVQcVNMZWlUZjlPNDJSYXdUckx3?=
 =?utf-8?B?MEFVTllNZTZFcFFYL0tjam85SlU5c21xUXVUcm9TdVk4OFQ5NWt3dXc3SEFn?=
 =?utf-8?B?QzVVQkVaZVY5dExFOE1lb0R5NHl4UjgwMFg1WSt2N3VMMm1kVkE2MENPVHh3?=
 =?utf-8?B?TXpJZFVvcmJVVjlKSzFuOEgwZ3o1azBJRm5sZFlZY0JlRXdwMzNKeWZlcm53?=
 =?utf-8?Q?t7CjJRgTW9JuhhCOgBeMwt4e7egHhyb32AVxlmk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3A0bDI3cnNIL3hJZG1XT0lFUWFIcjRNckd5Mk5zQXJOL1gzREk5MU80K2dC?=
 =?utf-8?B?eHBZdzdDTXlKelR4ekRwZDdlcytyazRTWU05TWo1K2EzR2lLT1ZlYlJucXhY?=
 =?utf-8?B?UklLcWJJenNZaTRaQlF0VnNCckZZTzdOc1FrZGxiK3FHK3B4aTF3MVBGOHI2?=
 =?utf-8?B?dGZNT3hZMnFVT0U5OThGd0Qvc3p1SGhvWDFKZ0pQbEp1Z3A4QlFiVGRHaTNp?=
 =?utf-8?B?RFZIaVRseDNselI5eTJEMzA0SHpoYWRpUEMrTHAxNVJvaDBjaDU5UVdKVzR5?=
 =?utf-8?B?K0pVWUIyUGM4TE44UjRUL0owcjZDaFpJdW4zaEVEc1BHTWpDK3lKbXdGQnI1?=
 =?utf-8?B?SWFXNzVsY0YrSmIxWEdsZTU4STQ5R2YvNXhIOVBFU2lIQ1Q0S1daWjh0ajBQ?=
 =?utf-8?B?ZUlscE03aVhocGtzTmI4OHhUT0V5ODROei9ZOUgrREl3OUsrSElHUVFocDFY?=
 =?utf-8?B?K2F5QjJPMlk3L2F6M3FuNUZzb2ZObEQ0UytyQ1J1OTJRUjNZM2dGVzArcll1?=
 =?utf-8?B?WVhKQkcxbWxqNDFTdEkyQmkyT2JRWEdScXp0SS9FbzNjQjEvTTVoTFVRdkdC?=
 =?utf-8?B?SjQ1MXNUbG9lOE1YdkJTRjE1eUpWcUw4M1kwMXN6K3AyVytoOERRcE91ZE1U?=
 =?utf-8?B?a3o4QmhHU3gxem5PZTZ6OXNYcFhBNjZraDJQWHhGRGFtM1ZJYkxNL2ljR203?=
 =?utf-8?B?a3Q3YnhCcXdmZVhZRFN6KzBLQXZkbm0yd0JRbFlkaFA4SEh4NFJsV3dVL3RR?=
 =?utf-8?B?ZyszSVNBT1ZWV1RWSlA3enhuRTdsaFFkYVhpVFBpdG5MTGRiQW5QN0F0L3Nm?=
 =?utf-8?B?K0FaYVo0U2JsZzNPUGNHMnAweWI2dVZOQWlHRCt0cmpBNDBkM0NHbGIzNExr?=
 =?utf-8?B?Vm90cTAxTWZXNFp2SE5WS1dwa0lHZzRyeFF6cjVJWlhyTUplOWUybDMxd3Q1?=
 =?utf-8?B?N2NkZG5aT1pPaVhoelBHL1FYSnhPMTlJblVUYWgxWDJ0WjloOHVySmRmSmZ4?=
 =?utf-8?B?c0JsQjNyY0xtbkh4Q1AyQThPaUtvSEx4UVNtMUpzMVNPMEE0THBsNDU0YUJB?=
 =?utf-8?B?ZUM3eXFkMnROd3BQb1pCdTIrOCtORmdINUV3YmNtWmxLUXVGREpXWjR0dUdu?=
 =?utf-8?B?Qk5rTy9RcEdIb2hSUS9UQWVDa2V4dE82bGFBOHZlL2FkRmJ1c2pSQ0dPNnRk?=
 =?utf-8?B?U3lWcGZCQkIwcVVmZHVxVTkxWDM2TXdmUUlSSWRSNTN2RGlDUlEzbUdSNmxj?=
 =?utf-8?B?Qk5VbVZRWkdOUE5LR2duUDBvdWhBcU05bEhZTnc3RzZ1OHdvWEdDZ1Q5VVVB?=
 =?utf-8?B?K0gyMS9ERFRVOTRLWTFWUXhRUkdXVUI0M3ppR3VXMk1yVXJRemdvVEMzcjJ0?=
 =?utf-8?B?djdpVlh3K3JSSWFuYzZnbFFiL1RmRnBRdWl2dk5DblArbzBqYlJsRFVqb0Y4?=
 =?utf-8?B?NmdqdWY2enZnR1JtK25rcDBSUVFSYzF3RVNQMWRxUVFheng2amg3VG9jMlh0?=
 =?utf-8?B?VVhRWG1EcGlyeFNaV2ZjUmxpeFdoa1dSQ3o0TGxROWE3L0FHaWJCNG5tY0R2?=
 =?utf-8?B?SnNVRWluNGNGR0V4VU5vWlpuMGhCR0Erc0R3L3lQL2VmVUtrUFNxQ1dKYlBM?=
 =?utf-8?B?aC9lYWgyRnMrMHkwY0ZUclVtMVBkZDVobUdPQW8vbzh0VWNnLzBRZDBsTEhh?=
 =?utf-8?B?YlBYRXM1SHJlTGFXZlppR2Rkb2VBUXZ1QW1RQUVKYVlMdkVzSmFSVmtoeG1W?=
 =?utf-8?B?ZDloRWF5Y25pcHNVQWhUTFFvVWQ0V3grM0NOakxtaHlYcmszM1dNbnZZZUFF?=
 =?utf-8?B?dENRZWlEcXdSL2dzajNlWGwxeU55Wi80YjNUYXZzUTRMcHplYTNwcHVhRUx0?=
 =?utf-8?B?Q21oWm9CRXB0QjlkNkdHN2xSOW1VeW0zWWNqd3hvVjV5S01MSTBmMXc2S3ha?=
 =?utf-8?B?RndZaENjZSs1aDBkbWc1b3V1QTlMeUJTTVEwVVJFY3VGOHJoTkViM0lYWkND?=
 =?utf-8?B?TFlnZDNwYTV0MzNPejFVRFBqamE3OWJldzVZYUdVT3lMR2c2ZjBUeEQ5UFYy?=
 =?utf-8?B?OWZ3bENKbCtNaERHSU91OUZOTzBXTUxtL0FGdVpYZlltenRnMUZ6TzJEbzVO?=
 =?utf-8?B?ZERXOWRORm9yMkdTSDVndEpaWHhNV1F3OGYzUXdZVXVWbzRlb2IwZWh3aWov?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f07466d3-a249-4615-c417-08dcfa8218b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 14:33:04.9088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xqzvJkKlUQfKRIcSqp3iGruOnDIxeS1ChrkKQU18MkODco7u5K6SXRUtgKnaZctg2lHrvma3dqqEB45LHukb1+Fi0cTzW3qXA+Zvorr8+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
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

On Tue, Oct 29, 2024 at 05:48:58PM +0900, Gyeyoung Baek wrote:
>if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
>'drm_dbg' function is replaced with '__dynamic_func_call_cls',
>which is replaced with a do while statement.
>so in the previous code, there are the following build errors.
>
>include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
>  221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
>      |                                                          ^~
>include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
>  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>      |         ^~~~~~~~~~~~~~~~~~~~~~~
>include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
>  425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
>      |         ^~~~~~~~~~~~~~~~~~~~~~
>include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
>  504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>      |         ^~~~~~~~~~~
>include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
>  522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>      |                                 ^~~~~~~~~~~~~~
>drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
>   14 |         ((cond) && (drm_dbg(&(xe)->drm, \
>      |                     ^~~~~~~
>drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
> 2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))
>
>the problem is that,
>XE_IOCTL_DBG uses this function for conditional expr.
>
>so I fix the expr to be compatible with the do while statement,
>by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
>
>v2: I modified this to print when only cond is true.
>
>Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
>---
> drivers/gpu/drm/xe/xe_macros.h | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>index daf56c846d03..ac2bd103bb22 100644
>--- a/drivers/gpu/drm/xe/xe_macros.h
>+++ b/drivers/gpu/drm/xe/xe_macros.h
>@@ -11,8 +11,12 @@
> #define XE_WARN_ON WARN_ON
>
> #define XE_IOCTL_DBG(xe, cond) \
>-	((cond) && (drm_dbg(&(xe)->drm, \
>-			    "Ioctl argument check failed at %s:%d: %s", \
>-			    __FILE__, __LINE__, #cond), 1))
>+({ \
>+	if ((cond)) \
>+		drm_dbg(&(xe)->drm, \
>+			"Ioctl argument check failed at %s:%d: %s", \
>+			__FILE__, __LINE__, #cond); \
>+	(cond); \

there's a double cond evaluation here and given any expression can be
given to XE_IOCTL_DBG(), this doens't look very safe. I think this would
be safer as:

#define XE_IOCTL_DBG(xe, cond) ({                                       \
         int cond__ = !!(cond);                                          \
         if (cond__)                                                     \
                 drm_dbg(&(xe)->drm,                                     \
                         "Ioctl argument check failed at %s:%d: %s",     \
                         __FILE__, __LINE__, #cond);                     \
         cond__;                                                         \
})

as it then evaluates cond just once. Also the generated code seems to be
sane compared to what we had before too.

And I also needed this to build-test:

| diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
| index 08cfea04e22bd..82585d442f017 100644
| --- a/drivers/gpu/drm/drm_print.c
| +++ b/drivers/gpu/drm/drm_print.c
| @@ -215,9 +215,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
|  {
|         const struct drm_device *drm = p->arg;
|         const struct device *dev = drm ? drm->dev : NULL;
| -       enum drm_debug_category category = p->category;
|  
| -       if (!__drm_debug_enabled(category))
| +       if (!__drm_debug_enabled(p->category))
|                 return;
|  
|         __drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);

as otherwise it complains category is unused.

Lucas De Marchi
