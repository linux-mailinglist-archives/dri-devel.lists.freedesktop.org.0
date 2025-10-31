Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F19C26677
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A29210E0F5;
	Fri, 31 Oct 2025 17:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ4WCPln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740E310E0F5;
 Fri, 31 Oct 2025 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761932365; x=1793468365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bkcrJGOTsi4pxkpmopMcT7JLuhq/owcgx8ztHk1ZqXs=;
 b=MJ4WCPln9BvPD3TpgFRS2mwE0KTyuBr7YNoU9jeGkyx0RSVnhLclICNU
 MSluSgQYxvWO+q3yPOnlLQ8teWLS5iDrF932L8muDJPSpZ4h3ls/8glkF
 plyJ54zl5+w5sWN0xabcaejfs+CI42brhryfEZGXLdK79PpQN+0zA/z31
 TMnO84cB/dGIckMHmP7b6dwllr0WIUnxAmvYL1lV8qXjG+Z+SiFHp33be
 xfhKvGxfj56TutKzybjhvfn7z8eLwahZfvhA4rQ44/uODEA3Me1rUe7Oy
 YyFwEL59LiytXLmCJ+48oR5BnXznSVj/6U73WEF1nX7fk8ttf9T43r1IX Q==;
X-CSE-ConnectionGUID: /zCPRpXXRhaNekO5JpNYtA==
X-CSE-MsgGUID: +vJrkEzCQ7KnzdlnQ5JwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67754179"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67754179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 10:39:22 -0700
X-CSE-ConnectionGUID: /isdVv2mTz2+v2g+QaT24g==
X-CSE-MsgGUID: QNhal/HZSHq0qHlUQCUyOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="209853505"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 10:39:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:39:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 10:39:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVe2GcHXBXVU6hgPNBzFXr4qCXLhZQhqw6Bw2WEEQnUgxSO7/lS9Q+6nrh54RANlK+G8Ez4+dQDV5z2LYxvaTFnVe4usUGOibsFfY6UojZs+DCPHFXRZFecaBOi/B/iyAdvpg/PKChYUXdWmJztyx+242f3mKEpkwqTOdlSpQoUOWKehnd+trD3gwhjWanRn/jFYtDDYWjacDZHAx9mrqX/aJSflBJnHDagPawKdx3YaCHBRR41RgDFn7QRGX/NYj9zoZdq3g766DSUolhW8AL11TB6gOqOcWYC1w+SRLewOR46cSXW76V/5u3xWQYbUYoR2x/KQz9s+a42t/rRrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6VzCDjUNMAaB2cY7lN2+1Qz8tGr9o7nF1yA3mqmkgk=;
 b=uZnASMgIeS1V+QfAo57mv7+Nkdb35KiPjZHnHBjIk1USh30/Al2UzPdxubJI0YfiUoug7RBZ0iy5ZKcCGy+0hEBuQg4Clbgom3F4iFRbuFFHGcO/8ubj6hIVQ/UMqc5KAUogdcjmkw6f/gt745veb2Lrv1teCiiBYilLgwpIh74SXmYG4hRBM3d3SvPbNcWK9/IXjYISTmhCUgFqe4egJWMRjiqLg93pxiCh500q4V0fyMI/VPPDVl7wrG9uokJZhRqUFuEYtKdpMHiddqvvdgHWXK0C4Anqc6s4xcxm1HENjYNaYSngdlOIqDgbjAL+xe7fS/EygXp7LW03LYaifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 17:39:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 17:39:17 +0000
Message-ID: <a2e355aa-87d7-4459-b34e-1e04be02fb93@intel.com>
Date: Fri, 31 Oct 2025 18:39:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/28] drm/xe/pci: Introduce a helper to allow VF
 access to PF xe_device
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-26-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-26-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 371a2cb8-b06d-4a78-d851-08de18a46a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHlrbzFxNlBZSjRoUkhJVlVxdEZPdms0K2dZbVJCMExMTkp2c1hPQTNoRVpx?=
 =?utf-8?B?MTlmNjI5NlZ3N1o3amxZWEZEQk1jL3BVeDJoSmszOExuamMySkhzOTloL1Fv?=
 =?utf-8?B?Y0VQZ0lmVmFYUTYzb2ZUTjZPbFRUS0FTOHpIN0VwVG5qZUhhaDBUWXV1dTND?=
 =?utf-8?B?dWZ6cmh4ak81NEczSy9JQUNJK1NUY2tDcWxERTRXSllFelFyN0R3dTI3SGRj?=
 =?utf-8?B?UUpWbGt2VDZ6NzRSUnhFNWxrOU00bDhSVnhmZmpreUUya0tBb0VqUEpEdGht?=
 =?utf-8?B?Wit3cjZXZkMwYlZiZVQ0UExab2w1NU9YdmFnbGxMd2FLUFhPbHlJTjh0OTc4?=
 =?utf-8?B?ZkowUHZnRU1KNUpjOTlzekdFRWFYdmlIcEtlaTRBUFo5UkxIejg2eHlwWFMw?=
 =?utf-8?B?YzlvWkRTNjY3aCtQeTVvMGE1NW5QKzZndThZSHdlbHNnclFUQXpmdlBqNGwy?=
 =?utf-8?B?ZDg4T2NaYXpXbTBVUUVuczAzZzVCOXFvVjdaanlJNVdRVU4weG9KWXpRYUo1?=
 =?utf-8?B?S3NVZkdSckJSOGxFbktBRktudFZvY1MwSFdsU2loOTBrUlk0K21iV2pSSXpZ?=
 =?utf-8?B?NU9DOWFkMmtYaDdzWmNRZVpYdlR4cTdkNzB0bnZtN2p6ZUl5WUlMTmljR29u?=
 =?utf-8?B?M0NkTmdWU25LY1o5d3FFdlZLd3Z2NE9xMDVNMldpdEF5VTVPZWlDVXRSaEcw?=
 =?utf-8?B?VlJ0N0RrSitRakpDcVJDRGE4MG8wMG9QR0hmaVJHYjNYVlR3UjdJUmtYUndW?=
 =?utf-8?B?SnlSMW9aL1cxN3RyTm5BNDZTRnc0MURvL0FzNmMvMDd4RkZxc1NQVFJRbWc3?=
 =?utf-8?B?Q0xORXB6VlRteDNvRlhXYTIyMVF6LzJYaHllVEZvL1hzUFFUR0VPbkdBa1lv?=
 =?utf-8?B?UU9SOUZvSmozd3VGdWIxM3cvVHlzeHpjMmo1MG5wcUV5amd1a21ZZSt4ZzJZ?=
 =?utf-8?B?ejJZRW45bmJkaVFLNld6US9MRlRXNlZkeDIwOGI0bE5mc3ZSTEgxWmRxZXQx?=
 =?utf-8?B?Y1daQm51YVJMcmlOUlBUTnJNU2VFVDhxNmVwTTcxdzVJNXBSeE05amxocytW?=
 =?utf-8?B?K2tYWFE2NjVXYjNQUTIyQ28xOTY4TFcvOGYrRXdWc0ZHT0hJbTU3VVJlZm8y?=
 =?utf-8?B?ZmVYTjVpbDhhUEkwU2xwNjZnRnFGM285cXd3YStiZVFtbDBRWUx0YmhDQmdX?=
 =?utf-8?B?TC9jUVYvMDRlOG83OWhPT21Xbi9WeFIzUjdJWVd0YlJBcW5GQklGcmx0U2M0?=
 =?utf-8?B?UFhFWHFMTWM3ZGl3aTliNUtHN0pOZjJFVXVSTmVwZ2lSemMrc0RFU0lTVGFu?=
 =?utf-8?B?N3ozQjl2M1Y3dzhCUFowMVEzQU1zdlJyOCtnOVFZaVdWc1Ird1EyeDdyNm5w?=
 =?utf-8?B?dTZyTHZ2RDJ0YndyelhQNXNmQWVmbjM1NmtXbkdtVUdPL0pGbU1JeE5DOG5F?=
 =?utf-8?B?RDZMZUxEbTN2R2xZQXJTTEtpbjhkQ01OaDNuTC9walBLWHNOc2FwOEx4UDBv?=
 =?utf-8?B?WUVTLzJOSldoYTFCemNJbWZFMXI3bEpnZnU5bjhKMzhSamdCeVcwa25ZUzNQ?=
 =?utf-8?B?Y25BSFpHeTU5eE93WFlCQ0o5NDRxY0xRamJtWUdzTXVWTC8xbEZzNFpOUW5v?=
 =?utf-8?B?OVN5TkY2cTJWKzNkdWF0OUZ6Y2ZMRDg5OTdyZVJWZHRoRGZyN0RpTDd3c2tl?=
 =?utf-8?B?bkRjTU5QdHlZTFc0VGdyODQ1NDlNMzBWOU4rQVVUNXpJTDlTV1U2OTR1YXlo?=
 =?utf-8?B?Uk0zOWU4VHhOZDBZVWg2VkZCS1E1Tm1vem1tYjVtbEYvekJsY3RIVE1rSXpB?=
 =?utf-8?B?UTFmaElBVFpJTkpvdms0TG13VWJmdmlKSFZEdWdJdG1WNUo2RDd1WnZXbyta?=
 =?utf-8?B?R00zRG9nTmRwa2dHNHU4UmJ0ejZMV0tiQXA4dXZaVWo3dUpiSFYyK0ttanpY?=
 =?utf-8?B?QUFzUGlZQWcxNVpBVTRsSHFLUmowV2ZUMmhBNzU1YVp0RWdJZmk3OGM2ello?=
 =?utf-8?Q?ZoJdhLmVsQhxZcSXwCI3HmbZiglGX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dVMDFvcStDTnd4NldYNnYvSHFCdloyWXQrN3FQRkd5bVFqc3V4bjFMcnk0?=
 =?utf-8?B?QUhaWkhXNlNtK3d1YU9iWFdEL3ovRG0yTjYvdlk5eFZoTGJ5MFpIQlJ2VkNE?=
 =?utf-8?B?aTNrT0FoWWV2ZmtFbytaOFZieFZFK25BMmVUeHF0M1NsczU3Y2dPQzNPU21u?=
 =?utf-8?B?V2RNS3dFYUxQb2FnRXdoWDhnN0ZROGdIZVFDUjV0L2dacTU5MlZ3ZUxtSDdw?=
 =?utf-8?B?dDJTTFM3azkvNUgxZjlNWUE1Z1J5QVJsRjZpNjR3K1hDUXc5ZTVNUmh6YWdK?=
 =?utf-8?B?TW9rL1lYQWptaDVlVzZsSE4vSXQ1VnJ4MjhnRmplQXhUd0hVV2pxNVN0Z0tH?=
 =?utf-8?B?QU5hbW4vQmVrTE1WeVJiYTF4b3J3YW8ramxlQ0pJd0tmcDFVUTVvQmdDMjdx?=
 =?utf-8?B?YXg1aE1yUHgydURBenBMSEdKZGlieU0raXplWmtpc1ZtczJwSzEyOVA0cE1B?=
 =?utf-8?B?MzVNYUhtQ2p6RXVFWHVVS25vdTNDV1plTlFoeXExSVFFbjl1dVVqZERhOTdB?=
 =?utf-8?B?ZHFLUFJJTDhsVHJmYmZxcXZGS1U4ZktNK2pCa1dYVUYwS1RSeDh6dGVlR2wy?=
 =?utf-8?B?bzlIQWRsT2RaeHR6Zk1ET0pFbndEUXV2TVpHNHlUSkNxNVhWcTZUcG1FVnZ2?=
 =?utf-8?B?SmQ4MGpWRU9aMUYxUEtwYWlReE1rSktuZXV1REFqQ1ZJTDA5UExFZm1lMnlt?=
 =?utf-8?B?RHNzN2dGL01hZk0zZEdrdE0wTktnQ2w4TDhsajNXSkdkQnN2eTdheDVxMVY3?=
 =?utf-8?B?ODIwbHg0UXhlUUUzaFVkMXRTemVVU2N6UVNrQm5TUW1wNXc4RlF5WXRwMkxG?=
 =?utf-8?B?dW9udnVIcXYxWFUwSW5VWnlpZCtFQmJxWU5oMWV6NEQwVVFXRk9FbVNjeVZq?=
 =?utf-8?B?NUF0dGFFK1ZWMHBTUTI4R0p3SFlxcG5hNE9sTUdaTFVwdElGRWVLVklpTXM3?=
 =?utf-8?B?RnJBSUhPTUZsblByT2lKcEtyR3hJdGl0a005dk9BVTBrVzZXZVp5cGZqNHlX?=
 =?utf-8?B?amJmZk1CTUFlRlRpQkZhbEdFSHpzeXE0ajJpRVBtOTIrV2FjTVM4a1BzTG1U?=
 =?utf-8?B?RWVJRlEwUHUxQWxDdWJ4OUxVZGo0RnQ2ZTVwdmltbnZGcEpubkcxUWE3OCtU?=
 =?utf-8?B?R3MrYU9FVDBMdENnbmt5SUFOekF2ZGtIck82cllnVUNobnl2U2J5bXo2UWJm?=
 =?utf-8?B?YmFxZU9FOG9SOEsrRGxPeTQ0ajM3bkQ5KzBUZGZlK20vTlUyZjZMeWE3UzAr?=
 =?utf-8?B?alhnL3QvYTB3SEkra2M5WXFWeTFiYVErVnk4dG05Y2Mzb2hWYnBUU3RZV0My?=
 =?utf-8?B?QnVQREdEemR4YmgzbjNxN29GSDNVbjZ6cE0zMkxyQWhMQ20rSk9lTFNYa1ZZ?=
 =?utf-8?B?STlXZy8vVk5sMzVqZEZPUGgrUmZ4NnFsTHFDM0R0ZlVDSk1DdEtaYXV5RTMv?=
 =?utf-8?B?V2xZRmRCSmFRVnBjT280Q09yYTBBNkNjalpONzFyTlRBMEltOExITS9DRUpo?=
 =?utf-8?B?KzJ6djFJaDJBS2t3dlBHbHJnZ3BsemYranh2S3VZTVovK2xTZ1ZRZ2hjVmZJ?=
 =?utf-8?B?WEl2VStTZkEyc1h6bDhVbWduYTB0RHRMWWh1VFJMNG9oejdJODlPK1dqTi9I?=
 =?utf-8?B?bG53TTlmbG1Pem1HcGczakhyWWVEQW9hMlNDM2d5dVc1RDJaTHpHcS92cXg3?=
 =?utf-8?B?UTNVLzlzLy9jeXZyNnZ2dnVKN2tiNkY0N2t3THA3MWUxY1ZKVFptc25hV05T?=
 =?utf-8?B?cWk3aWd4VzYvUnRaNWxDMDk4WjNtV2VwVU5MSWM4dXpLNDYrN0p1SHY2dWNt?=
 =?utf-8?B?cmJZY2hOZmVsOHlpU3VzbWs0bUZDd2lwSnRKcm50a3hCdFprem14cFNnZUdS?=
 =?utf-8?B?OTVjNmU1S2E0Yi9ZUXE3SnB0QU1IVGx4dEpoSzNNZVlaZzlNL1VNaWpBTVlt?=
 =?utf-8?B?RWZxOEwyaDBhaTdLczB5ZUg1YjFBb3NIRktOUTRSTi9JOFpvd3ArajlJdnlt?=
 =?utf-8?B?cHRvZ3U1VW5WbkZYN2FQSk5UZGg1cUhnelB5cXNyMXozK2NOMy82cFkwT2RH?=
 =?utf-8?B?UjlHSHhocENIcmVSTklGRFBTU1VzZU5hbkFCdXBLLzZXbmxVcWpHVWVrUWVH?=
 =?utf-8?B?MWJNSFY1WFRHVXZIRHVyOWJEM0xzdWJFRzhRRzdVSjZQTjlicHZFbS81K2xQ?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371a2cb8-b06d-4a78-d851-08de18a46a7d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 17:39:17.6236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kP78LN83imu7nkNpDFqNGU00iUJGCgdVOmpHu/3cjW5nI707n0PVfjAnEikmmGk2UAsBKZcJaUYdFFPOHeSMKroyGkZ2GHf3oRE3IczJbms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> In certain scenarios (such as VF migration), VF driver needs to interact
> with PF driver.
> Add a helper to allow VF driver access to PF xe_device.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.h |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index aeae675c912b7..3e7b03c847a42 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
>  #endif
>  };
>  
> +/**
> + * xe_pci_get_pf_xe_device() - Get PF &xe_device.
> + * @pdev: the VF &pci_dev device
> + *
> + * Return: pointer to PF &xe_device, NULL otherwise.
> + */
> +struct xe_device *xe_pci_get_pf_xe_device(struct pci_dev *pdev)
> +{
> +	struct drm_device *drm;
> +
> +	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
> +	if (IS_ERR(drm))
> +		return NULL;
> +
> +	return to_xe_device(drm);
> +}

I would rather expose xe_pci_driver from xe_pci.c (*) and then
make this a static helper as part of the vfio export file

	static struct xe_device *to_xe_pf(struct pci_dev *pdev)

but maybe Lucas or Matt has a different opinion

(*) this will also help us to move our live-kunit generator to a better place 


> +
>  int xe_register_pci_driver(void)
>  {
>  	return pci_register_driver(&xe_pci_driver);
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 611c1209b14cc..2bb2e486756db 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -6,6 +6,9 @@
>  #ifndef _XE_PCI_H_
>  #define _XE_PCI_H_
>  
> +struct pci_dev;
> +
> +struct xe_device *xe_pci_get_pf_xe_device(struct pci_dev *pdev);
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  

