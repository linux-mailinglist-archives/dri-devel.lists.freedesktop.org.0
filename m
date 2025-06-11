Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C84AD4731
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 02:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10210E2D4;
	Wed, 11 Jun 2025 00:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlOxVw74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E31510E14D;
 Wed, 11 Jun 2025 00:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749600408; x=1781136408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o2lejv7kO3TRISP7sXF6hRF+4fuZLvsgI4iNmuCAHds=;
 b=BlOxVw74z6/5GlDi0Fe63hTnHvVFCtpE8ugOR3iJueo/DdbEbaVjkJ0d
 CBeW2Bi7wY+O7UBGCkwdibuW+rrNNs3ueeSOnPDZ1zuxsPNAOXR74CcKD
 OAoI0vcoi7qhZPfJweImkTrj5BX7JMaGX8NnDBO4wsr5MqyxWDT1KHkOQ
 b0756A6EMIqXX6G5oL0v/C5VfbRSsSatXHSU35Ewad5NvL423kVM5xcly
 ct5Q3iyLNd+Iy4T1ONDEKFDQFnZWWLiyGCCGsvKHdP1HeRjhPkAfYvCv4
 Y7V9gJ1Dsoe/5XY4gxefD6+ocCmWu0j0lW9bMpejZvqqo9IHViMPraSfq w==;
X-CSE-ConnectionGUID: pNN0PdfMSoWzUM32PDqMQA==
X-CSE-MsgGUID: R5KJli9mS/mQHHlEby4nXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51720831"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51720831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 17:06:48 -0700
X-CSE-ConnectionGUID: IGrGWmC9QLetmwuPZP/7lA==
X-CSE-MsgGUID: c/h6wD3pQb6uJ0o55A7nhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="151977677"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 17:06:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 17:06:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 17:06:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 17:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLcOpOjXeA36fsgC84xVWURxzztjFDHXgG/dTtUx3sgb4pBFp1O6SUnOMjpXVhJkHZMegRXpV8AKvG4Gat4YW/5/J/jyJVDpJ/VkySykGN4h/15FyqJ4+Ehkwwh8xCzPESC7UX1S00KOUx+R9fAwAmkfmQfAbggLzX23wPn61Te2wyQfZ6D4pOvj1j86gmVCJIf8pBOU8DyEtL1uqx/uxLbRpl0rl56sWxJWwA6CzgsgE2aJ6An8h0ILZAe8WkEVGURlq/rbqe9rY7QvxnVit0swhg01YMHvngORcT1rM6rgvYBUM/SYbCzi6WHVtl23fyK/PM2Coa6bSEP8Y4Ymdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5mXd6fUhMjAD8wM4c0lyQszHQHDDzHk4ZvU/XSS1+w=;
 b=WjR1PtRXX5F8TSUJYSQd+1FMizK/cToe9Xc3hQem3TMNAcj3xCQNLNhhwTtJh06B5DOClq7++7TW7D2GiXoHBg7JGw2PHOmVhigGhh4gtVqDmsqHA9FNfMnDoDZW6dKl1GzetZggIcLglFn/VsVr7SVR7gAuJXMAlbNJzGcBPa+W5yJQVuKRoLgNTsAXsPcAH+w9HH9DbFUy+VtkzJYbuuF/waOfkuQejP4aSZXrvj0Af8FhJndrCU58iYenDFdhFP9C3+WqYf9rPg1uI2A98ksMBPn9JPxgw39ccs0Iy+dWOqmVLy/cO5SHSq4EudL9pnJQgMJwTi5a/pBBQRx45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 11 Jun
 2025 00:06:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 00:06:39 +0000
Message-ID: <18e1fbea-497a-4a54-94f5-57174ca58119@intel.com>
Date: Tue, 10 Jun 2025 17:06:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250606175707.1403384-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7a6d5d-0612-418b-da85-08dda87bd6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1Y2WUFMTnY4M0ZrSTNYRHYwdFJPbmtyaXRHdE1rTGhjZXdnd1MzczNMMnk3?=
 =?utf-8?B?bEYzOTR3QWRFdUtDVnh6S2VyTUZ6cmJCNG1iMFZFdGc3VU1VRnVYNzc2dnFV?=
 =?utf-8?B?V1FldFAzV1RTNTAvY3R6WHpjaHA5Znl1VUovOFQ0aVQ2Y0tzTmh6b3Y4YmY2?=
 =?utf-8?B?TU0wa05LZzhFZzYrZ0lnZnQvOW1EMndhRXFaQjVGQTdOK1VBS0oySXVWNUlH?=
 =?utf-8?B?Vkx3czAwSzlVT0hrOHRqSlM1SHZQOG5FNGZsTzl3anA5QXBWanZsVldDeURt?=
 =?utf-8?B?VE5Tbmc3aUdBUkc5MytBUys3L1I5ZDJ3djdjOXdKRTZoQ0R4OHk1dlp3T0hh?=
 =?utf-8?B?WDJuQjhabmFJbjZ2Yjd6RUNpZHh4UUNEOE85cnhtenBYV25rVm8zMHN3WW13?=
 =?utf-8?B?S0ZXOFlrRktHUmRmSW1uQmRDTkMvSWVLQ2dQZmZ4akJGREorZzBHMTlsNE1w?=
 =?utf-8?B?VU9CdkRkS0pWa3IzR05MbDNIV2JrTThuSEJHZjQ2ZTdwUXBQSVpIa3hHSjNs?=
 =?utf-8?B?NkZ2Yk5JTUJpdkMvNWxYS3V0dkpweVZ5RzNhSi80R3Y4SHpGdjRGZUNwTGVW?=
 =?utf-8?B?NnRQUXhTQXFRd0VNKytNQVdMUGFzSDh2Z3dHRFVqMUtUd1RKU1RRYlBvN2Uw?=
 =?utf-8?B?b2ZjVnpkeWYwZW9TRkpZTnRGQlgxeHBybERua2RTQ280WE5JbmVTbzQ3S1FE?=
 =?utf-8?B?ZVNaYWp4MEZpMGc4b1ZIWWt4OEhzbGhDdDRyZE1BR0I0enlrck1GVXNlRGh6?=
 =?utf-8?B?WFBDQXErNFFsQ0RweDBjZHVsOTkvdEhRbXJMVUROanA4UE1tMGIrWS9ib3U0?=
 =?utf-8?B?REo3b0RIallMYUJmZDRNam5PdVpzamovVXRJKzNSdnN5T3hqbmtTd202SUcy?=
 =?utf-8?B?MjNkSjZrc2FrK012SDgrRk5VWG1DQWRJQzNKS0VFZThjNXR5RFNFVVdKWGJC?=
 =?utf-8?B?ZlZPZUlXTjAxMEVDOHJZR09hN2pqSG8rZHRRTXg3VmlhdldhNVNlK2V2Qjlk?=
 =?utf-8?B?K1hYWlJXTjl2T2tLbnRaSTIxRjdMdWUzd1MrZklNZkQwMlorQmxnU2t4TkZ5?=
 =?utf-8?B?c1UxV2pxeHA3aU9BVWFPblUrY1JQQ3J3ak92NFhnMFdhcnViaElNRmhDcXZs?=
 =?utf-8?B?NXcrbG10M3ZKaEJQdW5nQmxsa0VqbHp1NG1QU3VyaWsxQWRVdHpIYnhjVjJw?=
 =?utf-8?B?TVVjVnZnUnRndEc2WkZBQmdTeXFmREVyNHgzdEdlVzZxNVhwTkhVN3V2c3B1?=
 =?utf-8?B?bDJuUUFGQVYwNU1JTFN5Zjh5OHNreFIxaVljR0dJNFBmQjJXb3pVd0NLVkJx?=
 =?utf-8?B?MHovTCtNK3RyTFcrTTQ1NzhBRldBa2hTVGxFbVh0K3YweEI5cmwwb1ZBR2Fi?=
 =?utf-8?B?SDVXL3JFWjBNUkpZZmw3Y2VTd056RC9oNFI1NnVzZ2xrT0g5V1ZvTnRrS1FP?=
 =?utf-8?B?VS9IeTc5WXpqNWdTMUQ3UTdpZFlGaFl5b3I4aGkreVhYeWhia3JNbmd2Rkgr?=
 =?utf-8?B?TURldXdpQjhTZzd1WUl2d2I4UzVWZnlTYnNha0JwVFljL01PTDRvTjhwcXlF?=
 =?utf-8?B?NHlDMmd1d2FiRWh1MjhhdlVtQWdobmpqTHFnbnZEQXpzekdaVi95dmFlOEY5?=
 =?utf-8?B?WGh5T1JhbThHOTFWWE4zZGYxYkl6dmNuUm1Icnd4N3FPRFpaWVFGUkpwOXZN?=
 =?utf-8?B?dk9jMzU2V1JQUDZhR0hMRDU2TG1jVXM3SUJlUzYxMzNJeVpva0VZODFYQzNU?=
 =?utf-8?B?ZkFSK2VQaUJ3UlFlN0FQMGppNU5RRzRGNVhPcTBidU9ZdXJRY1p2akowaWdW?=
 =?utf-8?B?ZFdXQmYrNnl3UXRGc3JwSEROMWFxOVE2NEw0UHlnMEgyL1gxQS9ESTlkcGlV?=
 =?utf-8?B?dml2RzhyTFhCQUNwK2JHVk5GTEVpWWtvU1BaMVF6Nm9HcXBvWnhkdW1haWNV?=
 =?utf-8?Q?1JeQSiH3noI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNRUmd2QUw1aHF3cWpzK2VMTm9qY1hZWTlVN2t4aFVoeDIwQTR4ODFTekhp?=
 =?utf-8?B?L2RCZjl4QlQ2WUx4N3lxRksyNXBMZ2Frd3lXTGlVaWZBbjdjU1QrcHZZRCtC?=
 =?utf-8?B?cFJuMWtGbHlON1VHejhGQTFTSk5WcjR1Q1dmOW1WQlIxMEpjNTNOSkJTV2J1?=
 =?utf-8?B?V05XNGxxdXhRM0ZLNUJGeWxrRGM1RVJ0ejJhRCtkNld2SDdWc21vcWpvc2Er?=
 =?utf-8?B?dWZaZFZOcVZYMnRRSVdQRkh1OXhLNFdibksybFpjb1Q0djNYSkVheWdPekQx?=
 =?utf-8?B?T0VTNEZHTDJDVlVjUU9kRjlLQzB6Q1pVcFFVM2RoOEpFZ2hxcDBrNTJhdVdK?=
 =?utf-8?B?RzNJNzdSeFBQSVpDREV6ZlF1RndZTVZTbFZrMDJWTGNNN3BtMkRTdDcrN3Bu?=
 =?utf-8?B?NzltZVROYXNPeTVxckFYdWhWaUd1eWJpYzhBUWpaak0zcllXYmtvakdSZWZI?=
 =?utf-8?B?L0h2Z3NyYWl4eTI2S3ZQemFOS3F4WldwYnhhSERDWms0eUZHaWR4S2FLTGFz?=
 =?utf-8?B?MGpNSnJCMTNNNjgya2orbGs5UGN4Q254L0UxeFZoelJwcGtmTGtUMDgxY2I2?=
 =?utf-8?B?UFRzV2ZoVTF5T0pLcEJWQjFvcldxNTVlZmh6Tjk5MUxtTU1pdUhadFp1QUpE?=
 =?utf-8?B?YWJ4NHl6L2QrNWtOYitJK2hEN1ZLdE8rekQvSHBFZHJHb1hLZXQxSE8wa2kz?=
 =?utf-8?B?SWFTK1hrRVpTYmhTMTR0cWwyMkVSVnA2bHNHOWNMU0d6VUZYS2EwSGF6SDBu?=
 =?utf-8?B?dTA1M1ZwbGUwZS9QWGRDM1J6bHRmeXlCMDk5aTZ2U25GbFAxNisxMWJoUE9W?=
 =?utf-8?B?Mms1VFYzQ0ZFdE52Q2ZGUFozQ25UMldwL29LOUFPSitqZHJTamNpb3VWbHpR?=
 =?utf-8?B?MFVxSzNqZTZoN1ZuVTNSTlBTc01HKzNGR3U3T1VBVlVZYTZURnpGdlRNdzBP?=
 =?utf-8?B?RHlYMDNETmFkeE5kMnBubGZVL2syN0JUZW9vK0NxSkZKOWluMlVMZzAxMUoz?=
 =?utf-8?B?VTZmWnZzVnAvc1NTYitJNUdOdWhmNTFKVFdnQ1J3ZEhmNTNTOHh2LzllK01N?=
 =?utf-8?B?S2dUWW10N1pBSWxqaitLMUEwUzVrdkRPL0ZZN1FCNUwxRHdRV0dJL25QS2dz?=
 =?utf-8?B?amRCYzZNbVRUc2VyYlI0NzRxdlpCNWdScU5QYlgyaDJ0UVRtTGZuTFVXUWpa?=
 =?utf-8?B?dTkrakhweitSOXhYMHRXeFNYWis2YXFZcHo0cFkvQ0FkODA4dS9XTEZHcXo3?=
 =?utf-8?B?NWtTamxOUVcxS2k5bVZqVnF1N1dmYVlYcFN0VGNBTzZNR0lIQldHRUptTll4?=
 =?utf-8?B?UFZDWnI3Um5uNjNlYnRoTExkem9XdnF3NVRJc01NWWFzNHl0amlLOFg4U2gv?=
 =?utf-8?B?MzZUZTdIQWhONXl4MTRrb2dPaHVBOWxZSDVWNzJ3cndLeWRrN3VPamZGaE80?=
 =?utf-8?B?dGtRaWQ0TDVvSFFmdWZOQWU4RFhhZkNIQmZ5SXR1NWFFKzZpSDE1ZzlDWDlW?=
 =?utf-8?B?ZW9LT21hSGVzU1phM1M2b1VSUFI0R1QySzBVdlc0UUM0VGlyYkxUeDZHVVBw?=
 =?utf-8?B?REFSTFNFTWtJcFY2ajE5d2lYaU5qaW1LWHdZV3l1citadm93WHpaL2xhWU1r?=
 =?utf-8?B?WXM4VDg2NjliVVhqVDhBbCtwbC9kdjlvRjRwb2JpYjdoTmh1S0NFbERreHYw?=
 =?utf-8?B?bDlDNDAybVRiTFcxZSt2eGxTWFBqejh0eG9TU1RwbDBrOGhnY3dhWWQ0UlNm?=
 =?utf-8?B?RDRLaFVVWmQwY3dDSzZ3VnA3L201eWVkYkpDRFAxYjJEQWozZE1WUE9lK1NV?=
 =?utf-8?B?eHcvN0tTUUxoQmdGVmFTamJrVEFZSVl0SVB0SHBHRmUyQzA1UnFvSWEwQlRJ?=
 =?utf-8?B?ZlIyYW5UMW9UTTBmcVlmZnA2YmFrZGtLSkxic1dGWFhCclU0L2ZPZUpEdmRD?=
 =?utf-8?B?RE5NQVVCSXNpN1ZXckdOTDl6Sk9aaGNWYnhvU05tQU8vaStaZk1wSTBjOFBj?=
 =?utf-8?B?Y2kzL0N5bXhXclVGRGEweldKOVVQek9HSjZSMGpIb1gvSVc4WUxKdWNqS252?=
 =?utf-8?B?MVZ3SU5RSW5RWkZuRDRpR3dwbjhoUEp6TncwTSsrV00xRWl3L3Z5QW9LTmhq?=
 =?utf-8?B?OG5CT0x0bTJkRmtONHU5d1k1WUZKZEVJZVV0LzlTbytNWUhiV1IremVmWkpQ?=
 =?utf-8?Q?/wbFp1V0XhRQOObHEOQOl7A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7a6d5d-0612-418b-da85-08dda87bd6bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:06:39.5277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOOhPdEgRwTwpB9fOw/mQSsfdZbcVDQn0M0/77GXkbkTDP7yltzLKIM9J36tt/lWgWnra1l9qe/cc/ijvfh6Mhh4aMCSSyuwHaAln/fuSTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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



On 6/6/2025 10:57 AM, Badal Nilawar wrote:
> Search for late binding firmware binaries and populate the meta data of
> firmware structures.
>
> v2:
>   - drm_err if firmware size is more than max pay load size (Daniele)
>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>     not be available for all possible cards (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c             |  2 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 86 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  1 +
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 37 ++++++++++
>   4 files changed, 124 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e062ddaa83bb..df4b0e038a6d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -891,6 +891,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_late_bind_init(&xe->late_bind);
>   
> +	xe_late_bind_fw_init(&xe->late_bind);

I still think this should be called from xe_late_bind_init(). You also 
need to check the return code.

> +
>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 22eb9b51b4ee..0231f3dcfc18 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/component.h>
>   #include <linux/delay.h>
> +#include <linux/firmware.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/intel/i915_component.h>
> @@ -13,13 +14,94 @@
>   
>   #include "xe_device.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   
> -static struct xe_device *
> -late_bind_to_xe(struct xe_late_bind *late_bind)

nit: might be worth modifying the previous patch to have this introduced 
in 1 line instead of modifying it here, to keep the diff cleaner.

> +static const char * const fw_type_to_name[] = {
> +		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
> +	};
> +
> +static struct xe_device *late_bind_to_xe(struct xe_late_bind *late_bind)
>   {
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	u32 uval;
> +
> +	if (!xe_pcode_read(root_tile,
> +			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> +		return uval;
> +	else
> +		return 0;
> +}
> +
> +static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_late_bind_fw *lb_fw;
> +	const struct firmware *fw;
> +	u32 num_fans;
> +	int ret;
> +
> +	if (!late_bind->component_added)
> +		return 0;
> +
> +	lb_fw = &late_bind->late_bind_fw;
> +
> +	lb_fw->type = type;

Should we validate that "type" is sane?

> +	lb_fw->valid = false;
> +
> +	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
> +		num_fans = late_bind_fw_num_fans(late_bind);
> +		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> +		if (!num_fans)
> +			return 0;
> +	}
> +
> +	lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
> +
> +	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +		 fw_type_to_name[type], pdev->device,
> +		 pdev->subsystem_vendor, pdev->subsystem_device);
> +
> +	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
> +	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);

This log still seems like an error when it's actually an ok outcome. 
Maybe change it to something like:

drm_dbg("%s late binding fw not available for current device", 
fw_type_to_name[type])

> +		return 0;
> +	}
> +
> +	if (fw->size > MAX_PAYLOAD_SIZE) {
> +		lb_fw->payload_size = MAX_PAYLOAD_SIZE;

Why are we even setting payload_size here?

> +		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> +			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
> +		return 0;

Maybe add a comment to explain why we don't return an error here (if 
this was indeed on purpose).
Also, you're not calling release_firmware() when exiting from here.

> +	}
> +
> +	lb_fw->payload_size = fw->size;
> +
> +	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> +	release_firmware(fw);
> +	lb_fw->valid = true;
> +
> +	return 0;

This function seems to return 0 from all return calls. Is that 
intentional? if so, just switch to void.

> +}
> +
> +/**
> + * xe_mei_late_bind_fw_init() - Initialize late bind firmware
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> +{
> +	return late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
> +}
> +
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>   				       struct device *mei_kdev, void *data)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 4c73571c3e62..a8b47523b203 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -11,5 +11,6 @@
>   struct xe_late_bind;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index afa1917b5f51..c427e141c685 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,41 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   
> +#define MAX_PAYLOAD_SIZE (1024 * 4)
> +
> +/**
> + * xe_late_bind_fw_type - enum to determine late binding fw type
> + */
> +enum xe_late_bind_type {
> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
> +};
> +
> +/**
> + * Late Binding flags
> + */
> +enum csc_late_binding_flags {
> +	/** Persistent across warm reset */
> +	CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1

Should this be a define, since it is part of a bitmask of flags?

> +};

AFAIU those 2 enums are not internal to Xe and are defined as part of 
CSC interface instead, but that's not clear here. IMO better to either 
move them to a file in the abi folder, or at least make it extremely 
clear that those values are CSC-defined. Moving then to 
late_bind_mei_interface.h could also be an option since they're values 
for that interface.

> +
> +/**
> + * struct xe_late_bind_fw
> + */
> +struct xe_late_bind_fw {
> +	/** @late_bind_fw.valid */
> +	bool valid;
> +	/** @late_bind_fw.blob_path: late binding fw blob path */
> +	char blob_path[PATH_MAX];
> +	/** @late_bind_fw.type */
> +	u32  type;
> +	/** @late_bind_fw.flags */

Missing descriptions for these 3 vars

> +	u32  flags;
> +	/** @late_bind_fw.payload: to store the late binding blob */
> +	u8  payload[MAX_PAYLOAD_SIZE];
> +	/** @late_bind_fw.payload_size: late binding blob payload_size */

if you only set payload_size when the fw init is successful you can use 
it being non-zero as a valid check instead of having a dedicated 
variable for that. not a blocker.

> +	size_t payload_size;
> +};
> +
>   /**
>    * struct xe_late_bind_component - Late Binding services component
>    * @mei_dev: device that provide Late Binding service.
> @@ -34,6 +69,8 @@ struct xe_late_bind {
>   	bool component_added;
>   	/** @late_bind.mutex: protects the component binding and usage */
>   	struct mutex mutex;
> +	/** @late_bind.late_bind_fw: late binding firmware */
> +	struct xe_late_bind_fw late_bind_fw;

The code seems to be designed from multiple type of late binding FW in 
mind (hence the type), but here there is only one. Maybe switch this to 
an array, even if it only has one entry for now. That way if we need to 
extend it later we just increase the array size.

Daniele

>   };
>   
>   #endif

