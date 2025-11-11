Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F633C4A2B3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2910E463;
	Tue, 11 Nov 2025 01:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2SCa+oW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1410E463;
 Tue, 11 Nov 2025 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823114; x=1794359114;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GH7P6U4pUvIy3tPY7tsq0bzQ9Rlbj7UVhDBpEkPkEBo=;
 b=b2SCa+oWvTttnPJre9HTz6wEElrlj+QOKiOYP/c60e1ZJICxZHRrkvut
 2eY1SuUmpP1/WfCpFW1yRcvZZ96jMJdu1FbiG3jQRJy9rhLI4SeumhMHG
 6DQWhnkqlHnG6xUVGw+xFmz7O8qqGpKB1lI0aDmnM2dF4P5A2aCOKTknv
 bUxNcsnF8SSq95idLBNSbRjDIqSJYk9Aepz4tw/eEK02jhyQ7rfUIU8dH
 lysrrupYsMp7vC12OQ2OJVB9iOwqhTtQAgZz9B/1DaiSwWPcT/+L9zIv9
 LbS4/5bAmZUTVESwu47vHlSgmjMdSrVVmKfeAMnq7lxAquMjvjMKBhseR g==;
X-CSE-ConnectionGUID: Jyos+/AmRCGmfuHKOqB5HQ==
X-CSE-MsgGUID: K3JaBg5mT9SbsWZGa3e5pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64789530"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64789530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:14 -0800
X-CSE-ConnectionGUID: X3vz7XwIRU2pKypkCWvtXQ==
X-CSE-MsgGUID: SSvusG5sTPyE3oStoPZSJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193203597"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:13 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD7f3FmnOwYChihfthReH0HooXLY5+kqufTWZpVHTqV/5uGkgETTMsE7Ad0aJMhTRzI0789onFJBhfGXlm+AgEfdZIoAlgjpnDv5ovUT39zL2YGPY6Keb/zioS5XNfakm37D8UnRL8vtlAsSoItUOTRPRm9dgXuS6LCcnvH8IxsZfeYr+O8+NekCXeZ7sm0+oG4SKEytojZMHMzUV/Srlz7VjxIT5ZfZHsYdZykMeZjZ55emG8mLDa7WhijHQjMUSEL9H8wDLt1NQLUvm1gsMtGdwNEKm2UOoVsHXxXGjwEEXaxa03DHM0BbqFMZeIH2eEjjkUMoyi0V1A8Obx+wfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huQFj0zKuPn+/d6ma0vaefe5HhuxhC++GZHPwKcR73s=;
 b=PW0MA5ESsXUsQSx/j4ma83amkJOCNK78TF6vu3M60B2k0J5gEooM1qJNL8ob2LFKCwYh7oKrJLxKWUmFkBywhrlsqWEPLYWjDgmyKToGr+EYypgTgpPYHT89pTogO4wIvFQhPNyUqQkKbb+0LfBMgRwVKIIHHpXy7uSsAjGWk/ZLraUX16Jx3xRgtlmLExRtNYmHcRPK1CJFmVdO2uUGcPFC/mJOG4dMWg+Vh27AZwLLq6IeMpo9gIm5dbvIl3EkT2APmiMsvYJulOmyaZY4xgDmSzuBZPKA/cR58cKbuv6CVK9dCkq3rSJX/X4nYSi+EzWMGB23xhZp7MPtyf/4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:09 +0000
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
Subject: [PATCH v5 00/28] vfio/xe: Add driver variant for Xe VF migration
Date: Tue, 11 Nov 2025 02:04:11 +0100
Message-ID: <20251111010439.347045-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0141.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 306cca43-c471-47e8-d6a9-08de20be5c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzdWNjhCRktkeU1FZmR0YUhxWVB2NmtqT2FLcjB4dEpkNVlidHBobzl0V2h3?=
 =?utf-8?B?ZlV4T3JtUjgxNVhtV2RXbndYcE8wSEIxT0UxTkdROVJ5ZzZnZnhJb3REUzZh?=
 =?utf-8?B?dWxXSXFUQ3J4VFVoc2dZK3RaTGhvdjZOMTlLcFFudkszelU1cDI4TTdCUE11?=
 =?utf-8?B?c01lN1VmN0lLSXlwaGRWdG9rNlFqd3MvTDI5MUpFYXFxYVgzYllxMjVnM0Z3?=
 =?utf-8?B?bDBKTUxmVXdJcTZoTEVTNmJLUWljd1JvODhRKzRNTk5QYzFjUEtueERpVy9v?=
 =?utf-8?B?aEU3NkZIMENJb2RwU0UzaXE3QTRQYWM5NHlwV0JFSlRZdFJ2d3A3RFE2aWtV?=
 =?utf-8?B?QVdXdG11dmV1clJHQmRmV25IQk9wY1BjWThBaFpldkIxMm84MUZ4K2I3ellX?=
 =?utf-8?B?WlIybmhwZXJjOWNsdmpqRlZLeUxjSUJBclJSSDVSNDhHTVF4OTZZTzQya2dE?=
 =?utf-8?B?YUx3ZWZBbTY4ZXNpRlZmWHZrZDA0ZnY0SlBFYVpmRU5ONGFHeWlSQU4rbytQ?=
 =?utf-8?B?N2dCM01YSHVwaFRMZlN0QkJvMlI0SzJRZ2NpTGJDZlZJTU5XMGd2OHNvQ3RR?=
 =?utf-8?B?MUVveUZlMW1MdWtQdUwrSGhFNWRBSU0raUFSVmp3dzdFdlJjcXN3QVJWSW96?=
 =?utf-8?B?YXo1cWxoeEFlMWliVmVkdm8weWt1TjZWK2ExRWhOaUplODAzU3JxUEtUVFdx?=
 =?utf-8?B?S1N2Z2JIM3I1NUx2S09ZZUxZS2VSY0M1cm5IelUzWldONmFrdml1Y1FyT0l6?=
 =?utf-8?B?ajh1OStVeVNhRmdCUUM2cG9CTDNUMjk4TmxKNGJWclJ1cDJ1QnBIYWwxOGFN?=
 =?utf-8?B?MmpYeEI3d3BOM0hDTlBxZ2QxdjAwSmZDM0crUHU2QkZVZEtlT2ZnZ3RUOVRR?=
 =?utf-8?B?TkJGcWFVYjJoditueUU1R3FuVVMxMWtWVTNQeVNuMkpjVmdOK0h1Sk5nVEov?=
 =?utf-8?B?NWlsQzZ1YTdNbGtMSEN0dG5qVm0zOHdSekVhOW04c2dyN0JtRTBtSFI4cHdD?=
 =?utf-8?B?UmczM3c5b3MwN2hCY25FSURwTXJsWXpRYWx5U25LRVl5VytiVXpqQWFlUVIw?=
 =?utf-8?B?TFAxdDlWSTFCekorRHNhc1l4Ny9qTzhlRTZ3QTlHUXN4RkF3dVRyNE9QWnRN?=
 =?utf-8?B?Zi9ha2wyNENSbTRiS3EwenBYSkhVSnFTenZGY25WblZlaHNXVUFLY0czVWZo?=
 =?utf-8?B?aXJTUHB3emszKzY2N25ZaEE2WXJJQTRtOUtZeGJsa1RvTm1HWTdxK3hUcm9C?=
 =?utf-8?B?cVBjMW1sZGFwUStkRW1Sdkd6eEFmSVdldG5wcmRkNkM0R1Q1NzN1Szg0b3Z5?=
 =?utf-8?B?L1Vsa1hxa2s5S2FTRzkrMjdrY2ZGSXgyOXMrREVWWXk5ZU5oSUdCTTY5eVZO?=
 =?utf-8?B?aTVsazUrTnhVOVBhbzY4MjRrOUVSd1daMjE5MDg4b0h2ZVlHYWZ5NFBWNkM5?=
 =?utf-8?B?Wk1xSHhVQ2dnSGxoTzNIM0ZkSXpZWCtSWmZHQTMwSExZajFZMWpMc285WjhP?=
 =?utf-8?B?VFBpR2QrN3lGVjZyV1J5SU9YQXJRTUw5K0xMQkR5azNVSEN5YytrMGxmUHk2?=
 =?utf-8?B?UjUxeVU4UDU1VjQxRTNZSXlDZzI1T1ZQUjNaOERocUx2cDlZQTlxRjZUYUF4?=
 =?utf-8?B?dlBXbXM4OGlvbDNocE5jbWVGNWc4UHpNRGE3SHJPMXNROEhKSjdvUFBFZXdp?=
 =?utf-8?B?WnFjYlVzV1lGci9pRFFBTEN3NTE2QVJ1YXhWMEN3N0UwQWRmZ04wK1djUk03?=
 =?utf-8?B?WHlJemYyU2s4QmFYblJJV0xTK1JYUzNYbWREamNiUWZHMlBUSVEzNUpMSzFZ?=
 =?utf-8?B?Z0tjcjBkT0xjNHZDOXBZRVhrajVZU0VyRFB3dnB6blp6ZXNuYzlhVW5xaWNs?=
 =?utf-8?B?MGxUbWxWU3hzQUYxSXFYU3d4bUpEMFIyZldzcERZZFVMWkV5czFJblhaZ1g4?=
 =?utf-8?B?K3k4aFZaNk00Z1dkd0RRQTNuSlBmSGJXa2E4V1ZCcFNkVGlzQ1J1ZDNDS2pU?=
 =?utf-8?B?QzVZZjlZWEw0cWhhbENTcjdjMk05ektjS0RVdDgwS1NJb0E1T2I4M2FkQnlG?=
 =?utf-8?Q?od188X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZiVHV5QUpUY2s1dUxFZWlnSlo5SEZIakgzaGdpeVpaQ3FMM1ZHc0NuM1lU?=
 =?utf-8?B?SHl1SDNOWmhqeW1EY2ZmeTdlV0dQbEJrQTlpVWoxQUZNMEpmeS85M1ZkWXA5?=
 =?utf-8?B?S0JGd1ZpcHY2REhOUWp0NG9lVVNXZEcvcEMxUVNnVUxveHM1djhHN1dLSzNB?=
 =?utf-8?B?aFVoNTBrcTFkbU1ZZ3A1bkRPOTZMQzl2MGJBU3BkWnNzUUJpeTdzQjBPbkFa?=
 =?utf-8?B?aThwd0pUekZtKzV3N2IycEdLM1NvUTNzTzEzTXNHdHZ2aU5ETnc2Rk5LTG0y?=
 =?utf-8?B?SUlhRTd5YTVMVXBXSW43ZDN4b1ZIWHY5ZWY0TTh0V1BjSHRjSzNOQWUyTzhj?=
 =?utf-8?B?UTlpb2lSbVdoTy8xdU8vRFZ1Wmt2Ukt1dCtoVmU1WENaQUtkWm4yVXhWNGV1?=
 =?utf-8?B?ak1iQllTUE5GV1FqS2wzQllQc2h1MEJMbTE3TkQzZ3Z6WEZGQytHcVJUeGVF?=
 =?utf-8?B?a0VXcDg3YUhZQ1haK1lUN0YxM1NhekRkbnJRTjVldFZ0dFJvWUlhWDkxQzRh?=
 =?utf-8?B?aFZwQTNuYWhIRGFMU2JUZmRBbE9MTFF4clc3WGoxTUs5SWU4QlNlNlhKTk54?=
 =?utf-8?B?TFBFTU1SZVZ6SmVZRGh3R05vUEoxRmJKaHRHRjk3YXBmVUpMeHcvRHoyakxL?=
 =?utf-8?B?LzNYa25NTXpnKzkreTczTnVZK1JDcDZMdXRnMFJPdUhVbFkzQVlvbVc3cWUr?=
 =?utf-8?B?TzMyL1labDFTMyt1ZVlsNmo1L1BCYURnUUo5K1I1SzhPTWJxcXNPSk9PQSth?=
 =?utf-8?B?d21tcG5La0tsdTNoVnhiK3hQaEZkZFpjaEVQTkpERThaVm50Q3JUeEdDN1Bn?=
 =?utf-8?B?MFpneXVuamR2QWhLcTZZWW1taHNOS2hpallEeUNDYTl4WDR4Ulh0TEZtb2l5?=
 =?utf-8?B?YWZwQ3U5VXR6Q3hyRURudXoxM0lETGpRSXlpTXpzV05sd0t5NldldEppNzJr?=
 =?utf-8?B?c2NxYnpEZUZ1eDNnWEd4QnFUcHE5cUZQSDRFejV2eitKaS93bFQ1NWg0TDNW?=
 =?utf-8?B?eVdkS0hGeFFveE1zMitKSFpxK2lhMzRFa1YyT0QrK2o4U013TFh3SzN3NFZr?=
 =?utf-8?B?KzdxYTVZU3BPR013OUZZdWJLdzhWL0xrNDcwblJDcFN0VDk4UXVPSUdKa0lw?=
 =?utf-8?B?QzcwRkRyazRYWHZCV1p2QytqTkxFWGdoYzlKdCtDcHoweDFRNVdBZVh0WFEy?=
 =?utf-8?B?VU1FK3RyVFhLa0JYSFQrNGZwZTNOZEJjVFRac0NxbXV2RzRXNjFFbG9IWm9P?=
 =?utf-8?B?d2hiWjlWVzlVQTZkZFN4bmVaelJoUFM2eXJxWkZjVWdjc1lpSktTbGY4UEpV?=
 =?utf-8?B?b0NkckQ4NzhoWHV3R28zWS80NWNSZkl4eHU3Y0UvdUNCYWErTmVYTU1CNkFR?=
 =?utf-8?B?QW16TFpQbExFbjd0UUlxMVk3YUdNZC9zRDRoZTJDRXR2dURWdWV4Zm9iZGVm?=
 =?utf-8?B?bEdFTGgzUldzeG9RVUlIcjAxZVZiMGt6QjF1Z3I5M0pZZU9yeWdYQ1BEeDY5?=
 =?utf-8?B?c2FRTVFnZmMrTEl5dVZLY256YnJkRlJMOXdJenNJOHovc2R0R2NJRXlML0JG?=
 =?utf-8?B?QVJ1Y0pQTzNHMjZ4bHFydldQbUNXNGF1aGt4bXdpdlFYT29YMkRpNEVWNTBG?=
 =?utf-8?B?dUphS3RXVTREMm5EOUxnZ1cyekRpbXFSb2NKcW4zMW9SQlhaYUZoYWNmN1BK?=
 =?utf-8?B?cEc0QnNFdFpOdHdaU2RzQ3l0cCtPc1lKUWZBSktXbE9sU3J5cksycFNKeUlx?=
 =?utf-8?B?cXpETzVSRzBrRmxNbzNiYmJxTXhqcStoZmQyOEMyYmcvWjJOYXM5c3crNXd4?=
 =?utf-8?B?L1EydEwzc0VXbW9hVXFUOW44dm9INEg0ZDR3a1NkUCtxSUhFLzNNRWo4TVZ5?=
 =?utf-8?B?elRsbEp2dUZOazMzOXRDKzRHZyswZUppaS9hOElOMi9VUFRiQmU5VmRkSm5m?=
 =?utf-8?B?YTd3cWVNbXYzWk5yZzdSUjdBUG5uT1RZbHljU0owWFlmbCtuMDBwcENEa0lj?=
 =?utf-8?B?Wkc1TDhvaUJxOHpWMkRUVGg0cWdQaXJTQWRWcWVuMW9RdVdXN2JmcWxHTlcx?=
 =?utf-8?B?ZWpVTStiMVl5SXIrRGJaR3NWQkY3YVJpY1dQMlB4b3F4TlBSV0tDYWl5Y21V?=
 =?utf-8?B?aDROTmxDM2NJa3Fsc1czRzRKeTdRaEkzYndqWXcrRUVvbWRHckk3b29QRHlp?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 306cca43-c471-47e8-d6a9-08de20be5c2f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:09.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXaOR+O2M+BGV7QH1Ao7la6bYLJwLB8ETJaOMvtNu6YPu7hBJFxf0lshav4ecB8X/Qb0Y2qrLGuZTe0J8HZM2w1//5PWw6s5hcKUtwe73HU=
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

Hi,

This is a fifth round of patches introducing support for Xe SR-IOV VF
migration.
Thanks for the review feedback.

Things have started to settle down a bit, and I'm hoping we're getting
close to the final shape.
On the functional side, two relatively small fixes, one related to VFIO
migf disable logic and one to the error handling on Xe save read side.
Enabling migration without debug flag is now permitted only for GuC
version >= 70.54.0.
Other than that - relatively small changes, biggest impact being
struct_group usage removal and introduction of xe_sriov_packet_types.h

Full changelog can be found below.

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

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function to copy of VRAM data in chunks

Michał Winiarski (26):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Convert control state to bitmap
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data packet allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/xe/pf: Enable SR-IOV VF migration
  drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
  drm/xe/pf: Export helpers for VFIO
  drm/intel/bmg: Allow device ID usage with single-argument macros
  vfio/xe: Add device specific vfio_pci driver variant for Intel
    graphics

 MAINTAINERS                                   |    7 +
 drivers/gpu/drm/xe/Makefile                   |    4 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  104 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |    3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   83 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  650 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 1010 ++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   48 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    5 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   13 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |   57 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |    2 +
 drivers/gpu/drm/xe/xe_migrate.c               |  128 ++-
 drivers/gpu/drm/xe/xe_migrate.h               |    8 +
 drivers/gpu/drm/xe/xe_pci.c                   |   17 +
 drivers/gpu/drm/xe/xe_pci.h                   |    3 +
 drivers/gpu/drm/xe/xe_sa.c                    |   21 +
 drivers/gpu/drm/xe/xe_sa.h                    |    1 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  520 +++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   30 +
 drivers/gpu/drm/xe/xe_sriov_packet_types.h    |   74 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c              |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  128 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  101 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  364 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   30 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   37 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |    6 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            |  247 ++++
 drivers/vfio/pci/Kconfig                      |    2 +
 drivers/vfio/pci/Makefile                     |    2 +
 drivers/vfio/pci/xe/Kconfig                   |   12 +
 drivers/vfio/pci/xe/Makefile                  |    3 +
 drivers/vfio/pci/xe/main.c                    |  568 +++++++++
 include/drm/intel/pciids.h                    |    2 +-
 include/drm/intel/xe_sriov_vfio.h             |   30 +
 43 files changed, 4137 insertions(+), 326 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.51.2

