Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2439D2A5B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF08E10E67B;
	Tue, 19 Nov 2024 16:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmvocAv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DF110E672;
 Tue, 19 Nov 2024 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732032046; x=1763568046;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4FlZrL9Z3WMbjUoFgM/T6XTW8VCyskbP+R5dm6uiV3s=;
 b=fmvocAv0LmWWuAsYqsTTXzks2Q4iQ9KbUtnM3ammoFPmsUSuEgnl8laq
 fieNcrr1qX1BnnxLjyVQ/w8XqvsuvpxYx7rFYkdVGMLkbVBDLjshn0gZf
 3ODbnRetWZ0OxPNKv9I2Txn1xSsDvUOu5Yms+IkYiCvo18s6U2fsujn5f
 DZ+VCvJQ7HBcytFm1i6Kj93trww25YUqb1BiM1YdFZYnB0/TyWDY6nmLO
 0ccY+XWVzhU/HlbZU0rZuhZ1O33ZAGJ/gIM/tWAD43Neb1024L9CdTB8N
 uBUBYNKCX2MpTBeu4am54+/eQPLh6Ur0oRvRSn5KEoFk132hNT7PlSMjm A==;
X-CSE-ConnectionGUID: tSc3iBbLR9OpshWOchYpoA==
X-CSE-MsgGUID: TX18V/yrSOWEB72RnIH0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42554705"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="42554705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:00:40 -0800
X-CSE-ConnectionGUID: 6G9S0pQTTnGGdl5PJ2b9rQ==
X-CSE-MsgGUID: 301gAb1FSzGH23iAJ1H61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94057903"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 08:00:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 08:00:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 08:00:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 08:00:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8DsLHOJzUkbHuIAlsWE2eGI5noGuTvSrvkVTMLvVW6FE6S7jL56xdlQuxD1co25LypCdbTrnsMo4RLFd1EyPoxtQw3VoCtG3q0lzmH8DF2o5avoIhPbnOJBPgaGJawO/MSrZNj+R9N7y3oOQzc2R3gt2azgbaPzeXDCNpl3s4sK6ucw0i0X7Ye52jSXU33S1US4M8jGlcki+yVH3jEabv6vgFbujYi0lfXRx0iWIVSJDVlzdzAuiST/ZPd3LDpHlGRht1hH8demehy8ze07MTUobpG4aZk/7eB23z5NXWYIKygYlYQo17yefx9B/wssKPKvAtQhsurAIA/LGKUK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vFFEYO8PsGQcptocWdCAq8B3WKF+MU/ViutazWyhxU=;
 b=ebgYOHT5Z8e1sTodNLewGnFBX1/o2uRsoc7MFKaM2qlN6A5mnqo6lqAPV1nwUVgJBHMGib9PZ7HycHMl01gzPcLoZnu41/iwr/4e9/6rEHJ6ofkzNpKS5QSeKDuPy10SLK59qtRWCQelaD1VucgWNJbliC6GO0MnFOMWOmNw9R7YfyDYtprWIqcH/qLF9QkbBAFjpjh9WiuRAnckW8o2jQEPMF8sUwayOFNUJny239BsNfKwLtV3j23lPHt8XLckgrdWJwpfaZmDN/H/fv3bMfEEDG0Vw9pbY1ePJhYDr9LeHKvBXC9KPdYn4bYAX7CYGglcPuRjTJr7gRZrfgmhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7432.namprd11.prod.outlook.com (2603:10b6:510:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 16:00:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 16:00:35 +0000
Date: Tue, 19 Nov 2024 08:01:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 06/29] drm/xe/uapi: Add
 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
Message-ID: <Zzy2RrHVoaRBqfk7@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-7-matthew.brost@intel.com>
 <f4798ea4f804bd94138d2662944be7d9c392cc7c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4798ea4f804bd94138d2662944be7d9c392cc7c.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0299.namprd04.prod.outlook.com
 (2603:10b6:303:89::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0a2b4a-ba10-44ec-ea2d-08dd08b34d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eYvgZfFEu5WpTUkk9KcSv+ey2e/vThgiZ/ccg85z+sjbCtoBMvQwiAr8CR?=
 =?iso-8859-1?Q?P3BVjH76xJHLvQZbH1cOEzQZ/jcykPTNEqZ4zalVoT0AAmg2mX0nY9G/yI?=
 =?iso-8859-1?Q?C5sDq0M3z9BOHeVxp669u4ic4xczuc5cjea9fpjCOHReTaeMyjizcsuH1m?=
 =?iso-8859-1?Q?5qlf1VoE/FOJm4FX1GcEi2QPhDDLcHqTjvjZhhHigZIFv98PAoeLdg8jYf?=
 =?iso-8859-1?Q?VKZndpP6Ee/6bKU0Y864jPYLtb1aXeEEmSVNOAne4TAHyhwbDS8WIzeA4V?=
 =?iso-8859-1?Q?DGwYK1XC8i/brHAbCedy6sotfOLs5G5RT2CxSzEdqqim5tlp4Hh+yPXYBP?=
 =?iso-8859-1?Q?zqKLuyLZ2dcjF30tiUCArhKSVOVcXf8RCebGVtmsPOZEUgMRekz1jojb6B?=
 =?iso-8859-1?Q?1CDQmR5GvDxHxNMprAEGgjxFWZCkpi+76Qu7Zf5pWE5FJMFOF3gZ/1yXoJ?=
 =?iso-8859-1?Q?UO0vWX5tH1jskXnM0YqZ4jQpuTY6/bVjZGCvyWi99SRw2ZpMmrdY+Y6Hmw?=
 =?iso-8859-1?Q?G/C+KYukjc+MswYf3fSWs6X+Rjn/YEJee50+SNPf/F/Pv3K+l3l9manIZ3?=
 =?iso-8859-1?Q?igwMkLzJ655GFvGirQzsluGVxc8181Q/97Z+c3HbddX9/EC3/yT3Z2Vycw?=
 =?iso-8859-1?Q?DNGZwH6LgXaW22dGfRzpAxIswt6g0q4BQtW2W9TNBTNMZPRt9UCXghxzfa?=
 =?iso-8859-1?Q?SdP7jX6wpe2IPOc7Hx607kMyEumxbG30W2GaxSZ5+nICsbI3OPOINDlYij?=
 =?iso-8859-1?Q?BMFIUJMEjaWfwfuyx0DUQ+uQd4E8d7HudlKnLsSfYm1V0RfYxBPVoeXNCP?=
 =?iso-8859-1?Q?gyoip2KB7n5Rt4DbECOIXRRQsmBguDIsS3/g1eVwe/4ztQJiuwFiTUgoub?=
 =?iso-8859-1?Q?AYrb/e8nSTDDtnGEq9QIy8NUyT010WIQVD/+3p23NfyAMdQ4WR9K/s6QX7?=
 =?iso-8859-1?Q?jnYYeD3skxH7fm89avz4xfH9FsqE/CWQMzw0o56gaeJsALanG5cHAt4VMR?=
 =?iso-8859-1?Q?LlG+EUbQKcpmcpoG9nAUIeaIQYot0a5OEXDKrMbs8TWNBQfhnm/L8lxfDU?=
 =?iso-8859-1?Q?7psvIFMibJxi5qT5jLtVUoDdIFugIFaPXnX+3iKuMgtpZhUuGgv3OtPALz?=
 =?iso-8859-1?Q?MT/4kR362D7U2RQaEgnAK71xOyiaaqOa91VoMtGDn08OHfo9zJu7vJYKBk?=
 =?iso-8859-1?Q?Rnsll/vSGahxj0Yc/9bXS9Wnp5xI2YJDeI5aKD5QBZdLRTZItoqSQVBFki?=
 =?iso-8859-1?Q?p6ysCjegpVkUCvMaeu5hQow8bh14LkAEYtPhMK0kolLiusmWaqyzxugcbf?=
 =?iso-8859-1?Q?wy7PVy9iT7/SItWuOonDGJiUjL2stZLd9IswDkhgVntqi/camzGXp2a/o0?=
 =?iso-8859-1?Q?r+FmRhaD+d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kWr405niv8V5acb3zzDAfSu0BtEhnTW4oH+EUtnNxkVAtXfCV7TX6mPhTo?=
 =?iso-8859-1?Q?tYKYTVFwslE/eg3G7kJnLLmWhZk6SPpn+/UhT/u66C1uELa2AdUeE2EBxB?=
 =?iso-8859-1?Q?ZDakZVf/liXkTfisHfEvfEeVJ5wLzbEgg4FXv81msrXn3lpbFk+Wn7jAFc?=
 =?iso-8859-1?Q?YVsIhhpesUYzlgcA0m5jbOeaG08T1kAxzwyGi5ddN4K/KlYEtsiR79aZrW?=
 =?iso-8859-1?Q?sTyAV6aD7/38wwxG3oRjQLkcKVN+Q2Y3z1MPUiJHw88lQtNduAVlAsMHeZ?=
 =?iso-8859-1?Q?+IDHagFlddAF+o4jQATnMFQHtr1eMKnHu3vJewcM0Tj0sRP4BuSyQtAlGB?=
 =?iso-8859-1?Q?gZboPjEvtEhCvsrwS+B64+cdj0QAS6FJHkQYXrov4lOysrp8U5LEsOvPTP?=
 =?iso-8859-1?Q?d815glRkpXHQKV7KFBSUuhriQSEchZgS4ECv9W2Dkv8/khOxXSvX5Eg63V?=
 =?iso-8859-1?Q?fmb40yTFpI1OpQkV8IiqYVs6HJpaa9i/mLBB8pPBRkGOyO+v0VxE6iaTcr?=
 =?iso-8859-1?Q?nYpGBi3krAllhZPiCh6PfvjDbTgUXPr633hzC6lx+FtbBVoZmYbZaYS2J4?=
 =?iso-8859-1?Q?70oK6ELgOhoClqhsoO4U/Dus0Onx9r69tTaJC1G9eRsPrWajMvGz5LVbX/?=
 =?iso-8859-1?Q?7MFPN91fOTADbaDxAxNYjHTvAHuFGKyP1KSGoJcmSDNM53HUBfKayMGrxj?=
 =?iso-8859-1?Q?D1HX1QklZ0ubjRp8iiAG4nKpzfS6eiyjSjyQ8DUx09HXdZz0tik8wStIat?=
 =?iso-8859-1?Q?D7qv25qSuS3kFiort4TaKylsaVRl1JPfd9aGAW43dpA/aMemT//zHHRP4/?=
 =?iso-8859-1?Q?5/aslqoERoEgVu8o58Iv/w3MhPBtK8Hu8iGArhxub7TIyXTVEsYL5FrMeD?=
 =?iso-8859-1?Q?B1lm2OcMdBBTh5H14kY36zoPGpYCaD0geZqtzU5Iirmv/OBcICPYIowdXx?=
 =?iso-8859-1?Q?UpNesKjEFWuyFmueaBC+maWWM9c9edcijZwBD5WDxeknAULAvIqEz2t1QY?=
 =?iso-8859-1?Q?I37KFhpoBiCQGziaWe5qFnq9xTdfvu4ptT/sQTWCP4ufzPNY9QS1S/+mH9?=
 =?iso-8859-1?Q?u31+gtymEq9s1cMF7UNq4fldJ7PAVQLGfvi3I/2+WXeAELj5VOVX9dh/eW?=
 =?iso-8859-1?Q?GM05LFwaSVKFBen22aYRuWrTduheEeVYXea2Iwtxs4fVbSFmthmmaB0wrO?=
 =?iso-8859-1?Q?smBMcytSGI11qVzhqgHBPYH7PZFwnUk4zU9lopJCxo9TVdTQB9fgK4mmSM?=
 =?iso-8859-1?Q?kBxoQCju9cn0slyF0s/1S6Ainqol6vL6Pm7vCGE3sgUoxG+BkrdoQCAW2r?=
 =?iso-8859-1?Q?HyNK29Akkq7UdcIL6mO6d8h2ayaQmL9uc8cBFJJyrs6IIcSYAESXU806eg?=
 =?iso-8859-1?Q?T6WyR1bo+W766v4ar7CWCuFauqf9UcJERmkmXpcGbGVKa7P46Mfv/FbVXa?=
 =?iso-8859-1?Q?g66deLNUvc0MKohqme/uhluhdFSoGjg3y9ODDchu9Uvs+u+Nkcynsj9gTI?=
 =?iso-8859-1?Q?uSU3gNZDrROD14RiyHUJv0O4hljtksr6iP/q6U9NrEtPIpw3nAOvJ4wBeC?=
 =?iso-8859-1?Q?lJmObko0IeHcB9+KPeYRvYaSWqH+qjmpOBji0NVlhTfKI1xEwkAlIz29J7?=
 =?iso-8859-1?Q?zi6VaVvW6qcT+/d342vJ4+LCP3f5PZ3GYKABnywN1w1jYEsWAk4Num9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0a2b4a-ba10-44ec-ea2d-08dd08b34d8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 16:00:35.2087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEe2BEyrTe/qHs1SKaqim+OchnBNm8lZd4Sn7+1SUQcfiPb7SfcClAzNog+jwACCEGb7utnh/VrKyPJIUFKvGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7432
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

On Mon, Nov 18, 2024 at 02:44:58PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > Add the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag, which is used to
> > create unpopulated virtual memory areas (VMAs) without memory backing
> > or
> > GPU page tables. These VMAs are referred to as system allocator VMAs.
> > The idea is that upon a page fault or prefetch, the memory backing
> > and
> > GPU page tables will be populated.
> 
> It would be good if the commit message could describe the state of the
> code after this patch. It seems we do a lot more than just adding a
> flag, but no real implementation. Perhaps just adjust the current code
> to avoid code-paths that are not taken when the flag is set?
> 

Sure can add a description of what the patch does which aligns with your
assessment - it updates the bind code to create VMA without creating
page tables when this flag is set.

> > 
> > System allocator VMAs only update GPUVM state; they do not have an
> > internal page table (PT) state, nor do they have GPU mappings.
> > 
> > It is expected that system allocator VMAs will be mixed with buffer
> > object (BO) VMAs within a single VM. In other words, system
> > allocations
> > and runtime allocations can be mixed within a single user-mode driver
> > (UMD) program.
> 
> This sounds like compute API-level terminology describing where the app
> gets its buffer objects: System allocator - malloc, Runtime allocator -
> the compute runtime (allocating buffer objects under the hood). 
> 
> Not sure what would be the best terminology, though, but something
> along DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR? (And when setteled change
> inside code as well).
>

DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR seems reasonible. Then also
s/xe_vma_is_system_allocator/s/xe_vma_is_cpu_addr_mirror too?
 
> Otherwise it gets weird if someone asks why is it called "System
> Allocator", and the reply is "a compute runtime would typically use
> this functionality when an app has allocated the memory using malloc()
> which can be called a system allocator".
> 
> IOW we name the functionality based on what KMD does and not how the
> app uses it through UMD.
> 
> > 
> > Expected usage:
> > 
> > - Bind the entire virtual address (VA) space upon program load using
> > the
> >   DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.
> > - If a buffer object (BO) requires GPU mapping, allocate an address
> >   using malloc, and bind the BO to the malloc'd address using
> > existing
> >   bind IOCTLs (runtime allocation).
> 
> allocate a cpu address using mmap(PROT_NONE), bind the BO to the
> malloced address using existing bind IOCTLS. If a cpu map of the bo is
> needed, mmap it again to the same cpu address using mmap(MAP_FIXED)
>

Will adjust.
 
> > - If a BO no longer requires GPU mapping, bind the mapping address
> > with
> >   the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.
> 
> unmap it from cpu space  and then...

Yes. Will add.

> 
> > - Any malloc'd address accessed by the GPU will be faulted in via the
> >   SVM implementation (system allocation).
> > - Upon freeing any malloc'd data, the SVM implementation will remove
> > GPU
> >   mappings.
> > 
> > Only supporting 1 to 1 mapping between user address space and GPU
> > address space at the moment as that is the expected use case. uAPI
> > defines interface for non 1 to 1 but enforces 1 to 1, this
> > restriction
> > can be lifted if use cases arrise for non 1 to 1 mappings.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       |  76 +++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_vm.c       | 107 ++++++++++++++++++++---------
> > --
> >  drivers/gpu/drm/xe/xe_vm.h       |   8 ++-
> >  drivers/gpu/drm/xe/xe_vm_types.h |   3 +
> >  include/uapi/drm/xe_drm.h        |  19 +++++-
> >  5 files changed, 157 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f27f579f4d85..39357e829b6d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1068,6 +1068,11 @@ static int op_add_deps(struct xe_vm *vm,
> > struct xe_vma_op *op,
> >  {
> >  	int err = 0;
> >  
> > +	/*
> > +	 * No need to check for is_system_allocator here as
> > vma_add_deps is a
> > +	 * NOP if VMA is_system_allocator
> > +	 */
> > +
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> >  		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > @@ -1646,6 +1651,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > >ops[current_op];
> >  	int err;
> >  
> > +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> >  
> >  	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > @@ -1713,6 +1719,7 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  	if (!((vma->tile_present | vma->tile_staged) & BIT(tile-
> > >id)))
> >  		return 0;
> >  
> > +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> >  
> >  	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > @@ -1759,15 +1766,21 @@ static int op_prepare(struct xe_vm *vm,
> >  
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> > ||
> > +		    op->map.is_system_allocator)
> >  			break;
> >  
> >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > >map.vma);
> >  		pt_update_ops->wait_vm_kernel = true;
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> > -		err = unbind_op_prepare(tile, pt_update_ops,
> > -					gpuva_to_vma(op-
> > >base.remap.unmap->va));
> > +	{
> > +		struct xe_vma *old = gpuva_to_vma(op-
> > >base.remap.unmap->va);
> > +
> > +		if (xe_vma_is_system_allocator(old))
> > +			break;
> > +
> > +		err = unbind_op_prepare(tile, pt_update_ops, old);
> >  
> >  		if (!err && op->remap.prev) {
> >  			err = bind_op_prepare(vm, tile,
> > pt_update_ops,
> > @@ -1780,15 +1793,28 @@ static int op_prepare(struct xe_vm *vm,
> >  			pt_update_ops->wait_vm_bookkeep = true;
> >  		}
> >  		break;
> > +	}
> >  	case DRM_GPUVA_OP_UNMAP:
> > -		err = unbind_op_prepare(tile, pt_update_ops,
> > -					gpuva_to_vma(op-
> > >base.unmap.va));
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op-
> > >base.unmap.va);
> > +
> > +		if (xe_vma_is_system_allocator(vma))
> > +			break;
> > +
> > +		err = unbind_op_prepare(tile, pt_update_ops, vma);
> >  		break;
> > +	}
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		err = bind_op_prepare(vm, tile, pt_update_ops,
> > -				      gpuva_to_vma(op-
> > >base.prefetch.va));
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op-
> > >base.prefetch.va);
> > +
> > +		if (xe_vma_is_system_allocator(vma))
> > +			break;
> > +
> > +		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
> >  		pt_update_ops->wait_vm_kernel = true;
> >  		break;
> > +	}
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > @@ -1857,6 +1883,8 @@ static void bind_op_commit(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  			   struct xe_vma *vma, struct dma_fence
> > *fence,
> >  			   struct dma_fence *fence2)
> >  {
> > +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> > +
> >  	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> >  		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> > fence,
> >  				   pt_update_ops->wait_vm_bookkeep ?
> > @@ -1890,6 +1918,8 @@ static void unbind_op_commit(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  			     struct xe_vma *vma, struct dma_fence
> > *fence,
> >  			     struct dma_fence *fence2)
> >  {
> > +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> > +
> >  	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> >  		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> > fence,
> >  				   pt_update_ops->wait_vm_bookkeep ?
> > @@ -1924,16 +1954,21 @@ static void op_commit(struct xe_vm *vm,
> >  
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> > ||
> > +		    op->map.is_system_allocator)
> >  			break;
> >  
> >  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma,
> > fence,
> >  			       fence2);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> > -		unbind_op_commit(vm, tile, pt_update_ops,
> > -				 gpuva_to_vma(op->base.remap.unmap-
> > >va), fence,
> > -				 fence2);
> > +	{
> > +		struct xe_vma *old = gpuva_to_vma(op-
> > >base.remap.unmap->va);
> > +
> > +		if (xe_vma_is_system_allocator(old))
> > +			break;
> > +
> > +		unbind_op_commit(vm, tile, pt_update_ops, old,
> > fence, fence2);
> >  
> >  		if (op->remap.prev)
> >  			bind_op_commit(vm, tile, pt_update_ops, op-
> > >remap.prev,
> > @@ -1942,14 +1977,25 @@ static void op_commit(struct xe_vm *vm,
> >  			bind_op_commit(vm, tile, pt_update_ops, op-
> > >remap.next,
> >  				       fence, fence2);
> >  		break;
> > +	}
> >  	case DRM_GPUVA_OP_UNMAP:
> > -		unbind_op_commit(vm, tile, pt_update_ops,
> > -				 gpuva_to_vma(op->base.unmap.va),
> > fence, fence2);
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op-
> > >base.unmap.va);
> > +
> > +		if (!xe_vma_is_system_allocator(vma))
> > +			unbind_op_commit(vm, tile, pt_update_ops,
> > vma, fence,
> > +					 fence2);
> >  		break;
> > +	}
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		bind_op_commit(vm, tile, pt_update_ops,
> > -			       gpuva_to_vma(op->base.prefetch.va),
> > fence, fence2);
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op-
> > >base.prefetch.va);
> > +
> > +		if (!xe_vma_is_system_allocator(vma))
> > +			bind_op_commit(vm, tile, pt_update_ops, vma,
> > fence,
> > +				       fence2);
> 
> Wouldn't we want to support prefetch? Or perhaps the implementation is
> deferred? 
>

Yes, this will be deferred. Himal is looking at this piece.

Matt

> 
> >  		break;
> > +	}
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index c99380271de6..0d887fb9de59 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -901,9 +901,10 @@ static void xe_vma_free(struct xe_vma *vma)
> >  		kfree(vma);
> >  }
> >  
> > -#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
> > -#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
> > -#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> > +#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> > +#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> > +#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> > +#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
> >  
> >  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  				    struct xe_bo *bo,
> > @@ -917,6 +918,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> > *vm,
> >  	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
> >  	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
> >  	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> > +	bool is_system_allocator =
> > +		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
> >  
> >  	xe_assert(vm->xe, start < end);
> >  	xe_assert(vm->xe, end < vm->size);
> > @@ -925,7 +928,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> > *vm,
> >  	 * Allocate and ensure that the xe_vma_is_userptr() return
> >  	 * matches what was allocated.
> >  	 */
> > -	if (!bo && !is_null) {
> > +	if (!bo && !is_null && !is_system_allocator) {
> >  		struct xe_userptr_vma *uvma = kzalloc(sizeof(*uvma),
> > GFP_KERNEL);
> >  
> >  		if (!uvma)
> > @@ -937,6 +940,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> > *vm,
> >  		if (!vma)
> >  			return ERR_PTR(-ENOMEM);
> >  
> > +		if (is_system_allocator)
> > +			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
> >  		if (is_null)
> >  			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
> >  		if (bo)
> > @@ -979,7 +984,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> > *vm,
> >  		drm_gpuva_link(&vma->gpuva, vm_bo);
> >  		drm_gpuvm_bo_put(vm_bo);
> >  	} else /* userptr or null */ {
> > -		if (!is_null) {
> > +		if (!is_null && !is_system_allocator) {
> >  			struct xe_userptr *userptr =
> > &to_userptr_vma(vma)->userptr;
> >  			u64 size = end - start + 1;
> >  			int err;
> > @@ -1029,7 +1034,7 @@ static void xe_vma_destroy_late(struct xe_vma
> > *vma)
> >  		 */
> >  		mmu_interval_notifier_remove(&userptr->notifier);
> >  		xe_vm_put(vm);
> > -	} else if (xe_vma_is_null(vma)) {
> > +	} else if (xe_vma_is_null(vma) ||
> > xe_vma_is_system_allocator(vma)) {
> >  		xe_vm_put(vm);
> >  	} else {
> >  		xe_bo_put(xe_vma_bo(vma));
> > @@ -1068,7 +1073,7 @@ static void xe_vma_destroy(struct xe_vma *vma,
> > struct dma_fence *fence)
> >  		spin_lock(&vm->userptr.invalidated_lock);
> >  		list_del(&to_userptr_vma(vma)-
> > >userptr.invalidate_link);
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> > -	} else if (!xe_vma_is_null(vma)) {
> > +	} else if (!xe_vma_is_null(vma) &&
> > !xe_vma_is_system_allocator(vma)) {
> >  		xe_bo_assert_held(xe_vma_bo(vma));
> >  
> >  		drm_gpuva_unlink(&vma->gpuva);
> > @@ -1967,6 +1972,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > struct xe_bo *bo,
> >  			op->map.read_only =
> >  				flags &
> > DRM_XE_VM_BIND_FLAG_READONLY;
> >  			op->map.is_null = flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> > +			op->map.is_system_allocator = flags &
> > +				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR
> > ;
> >  			op->map.dumpable = flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> >  			op->map.pat_index = pat_index;
> >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > @@ -2158,6 +2165,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct drm_gpuva_ops *ops,
> >  				VMA_CREATE_FLAG_IS_NULL : 0;
> >  			flags |= op->map.dumpable ?
> >  				VMA_CREATE_FLAG_DUMPABLE : 0;
> > +			flags |= op->map.is_system_allocator ?
> > +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> > : 0;
> >  
> >  			vma = new_vma(vm, &op->base.map, op-
> > >map.pat_index,
> >  				      flags);
> > @@ -2165,7 +2174,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct drm_gpuva_ops *ops,
> >  				return PTR_ERR(vma);
> >  
> >  			op->map.vma = vma;
> > -			if (op->map.immediate ||
> > !xe_vm_in_fault_mode(vm))
> > +			if ((op->map.immediate ||
> > !xe_vm_in_fault_mode(vm)) &&
> > +			    !op->map.is_system_allocator)
> >  				xe_vma_ops_incr_pt_update_ops(vops,
> >  							      op-
> > >tile_mask);
> >  			break;
> > @@ -2174,21 +2184,24 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  		{
> >  			struct xe_vma *old =
> >  				gpuva_to_vma(op->base.remap.unmap-
> > >va);
> > +			bool skip = xe_vma_is_system_allocator(old);
> >  
> >  			op->remap.start = xe_vma_start(old);
> >  			op->remap.range = xe_vma_size(old);
> >  
> > -			if (op->base.remap.prev) {
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					XE_VMA_READ_ONLY ?
> > -					VMA_CREATE_FLAG_READ_ONLY :
> > 0;
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					DRM_GPUVA_SPARSE ?
> > -					VMA_CREATE_FLAG_IS_NULL : 0;
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					XE_VMA_DUMPABLE ?
> > -					VMA_CREATE_FLAG_DUMPABLE :
> > 0;
> > +			flags |= op->base.remap.unmap->va->flags &
> > +				XE_VMA_READ_ONLY ?
> > +				VMA_CREATE_FLAG_READ_ONLY : 0;
> > +			flags |= op->base.remap.unmap->va->flags &
> > +				DRM_GPUVA_SPARSE ?
> > +				VMA_CREATE_FLAG_IS_NULL : 0;
> > +			flags |= op->base.remap.unmap->va->flags &
> > +				XE_VMA_DUMPABLE ?
> > +				VMA_CREATE_FLAG_DUMPABLE : 0;
> > +			flags |= xe_vma_is_system_allocator(old) ?
> > +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> > : 0;
> >  
> > +			if (op->base.remap.prev) {
> >  				vma = new_vma(vm, op-
> > >base.remap.prev,
> >  					      old->pat_index,
> > flags);
> >  				if (IS_ERR(vma))
> > @@ -2200,9 +2213,10 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  				 * Userptr creates a new SG mapping
> > so
> >  				 * we must also rebind.
> >  				 */
> > -				op->remap.skip_prev =
> > !xe_vma_is_userptr(old) &&
> > +				op->remap.skip_prev = skip ||
> > +					(!xe_vma_is_userptr(old) &&
> >  					IS_ALIGNED(xe_vma_end(vma),
> > -						  
> > xe_vma_max_pte_size(old));
> > +						  
> > xe_vma_max_pte_size(old)));
> >  				if (op->remap.skip_prev) {
> >  					xe_vma_set_pte_size(vma,
> > xe_vma_max_pte_size(old));
> >  					op->remap.range -=
> > @@ -2218,16 +2232,6 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  			}
> >  
> >  			if (op->base.remap.next) {
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					XE_VMA_READ_ONLY ?
> > -					VMA_CREATE_FLAG_READ_ONLY :
> > 0;
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					DRM_GPUVA_SPARSE ?
> > -					VMA_CREATE_FLAG_IS_NULL : 0;
> > -				flags |= op->base.remap.unmap->va-
> > >flags &
> > -					XE_VMA_DUMPABLE ?
> > -					VMA_CREATE_FLAG_DUMPABLE :
> > 0;
> > -
> >  				vma = new_vma(vm, op-
> > >base.remap.next,
> >  					      old->pat_index,
> > flags);
> >  				if (IS_ERR(vma))
> > @@ -2239,9 +2243,10 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  				 * Userptr creates a new SG mapping
> > so
> >  				 * we must also rebind.
> >  				 */
> > -				op->remap.skip_next =
> > !xe_vma_is_userptr(old) &&
> > +				op->remap.skip_next = skip ||
> > +					(!xe_vma_is_userptr(old) &&
> >  					IS_ALIGNED(xe_vma_start(vma)
> > ,
> > -						  
> > xe_vma_max_pte_size(old));
> > +						  
> > xe_vma_max_pte_size(old)));
> >  				if (op->remap.skip_next) {
> >  					xe_vma_set_pte_size(vma,
> > xe_vma_max_pte_size(old));
> >  					op->remap.range -=
> > @@ -2254,14 +2259,27 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> >  					xe_vma_ops_incr_pt_update_op
> > s(vops, op->tile_mask);
> >  				}
> >  			}
> > -			xe_vma_ops_incr_pt_update_ops(vops, op-
> > >tile_mask);
> > +			if (!skip)
> > +				xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> >  			break;
> >  		}
> >  		case DRM_GPUVA_OP_UNMAP:
> > +		{
> > +			struct xe_vma *vma = gpuva_to_vma(op-
> > >base.unmap.va);
> > +
> > +			if (!xe_vma_is_system_allocator(vma))
> > +				xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> > +			break;
> > +		}
> >  		case DRM_GPUVA_OP_PREFETCH:
> > +		{
> > +			struct xe_vma *vma = gpuva_to_vma(op-
> > >base.prefetch.va);
> > +
> >  			/* FIXME: Need to skip some prefetch ops */
> > -			xe_vma_ops_incr_pt_update_ops(vops, op-
> > >tile_mask);
> > +			if (!xe_vma_is_system_allocator(vma))
> > +				xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> >  			break;
> > +		}
> >  		default:
> >  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  		}
> > @@ -2702,7 +2720,8 @@ static int vm_bind_ioctl_ops_execute(struct
> > xe_vm *vm,
> >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> >  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> >  	 DRM_XE_VM_BIND_FLAG_NULL | \
> > -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> > +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> > +	 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR)
> >  
> >  #ifdef TEST_VM_OPS_ERROR
> >  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB |
> > FORCE_OP_ERROR)
> > @@ -2757,9 +2776,17 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >  		u64 obj_offset = (*bind_ops)[i].obj_offset;
> >  		u32 prefetch_region =
> > (*bind_ops)[i].prefetch_mem_region_instance;
> >  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> > +		bool is_system_allocator = flags &
> > +			DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
> >  		u16 pat_index = (*bind_ops)[i].pat_index;
> >  		u16 coh_mode;
> >  
> > +		/* FIXME: Disabling system allocator for now */
> > +		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
> > +			err = -EOPNOTSUPP;
> > +			goto free_bind_ops;
> > +		}
> > +
> >  		if (XE_IOCTL_DBG(xe, pat_index >= xe-
> > >pat.n_entries)) {
> >  			err = -EINVAL;
> >  			goto free_bind_ops;
> > @@ -2780,13 +2807,14 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >  
> >  		if (XE_IOCTL_DBG(xe, op >
> > DRM_XE_VM_BIND_OP_PREFETCH) ||
> >  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> > -		    XE_IOCTL_DBG(xe, obj && is_null) ||
> > -		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
> > +		    XE_IOCTL_DBG(xe, obj && (is_null ||
> > is_system_allocator)) ||
> > +		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> > +				 is_system_allocator)) ||
> >  		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> > -				 is_null) ||
> > +				 (is_null || is_system_allocator))
> > ||
> >  		    XE_IOCTL_DBG(xe, !obj &&
> >  				 op == DRM_XE_VM_BIND_OP_MAP &&
> > -				 !is_null) ||
> > +				 !is_null && !is_system_allocator)
> > ||
> >  		    XE_IOCTL_DBG(xe, !obj &&
> >  				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL)
> > ||
> >  		    XE_IOCTL_DBG(xe, addr &&
> > @@ -3170,6 +3198,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	int ret = 0;
> >  
> >  	xe_assert(xe, !xe_vma_is_null(vma));
> > +	xe_assert(xe, !xe_vma_is_system_allocator(vma));
> >  	trace_xe_vma_invalidate(vma);
> >  
> >  	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index c864dba35e1d..1a5aed678214 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -151,6 +151,11 @@ static inline bool xe_vma_is_null(struct xe_vma
> > *vma)
> >  	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
> >  }
> >  
> > +static inline bool xe_vma_is_system_allocator(struct xe_vma *vma)
> > +{
> > +	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
> > +}
> > +
> >  static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> >  {
> >  	return !xe_vma_bo(vma);
> > @@ -158,7 +163,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma
> > *vma)
> >  
> >  static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> >  {
> > -	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> > +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
> > +		!xe_vma_is_system_allocator(vma);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 7f9a303e51d8..1764781c376b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -42,6 +42,7 @@ struct xe_vm_pgtable_update_op;
> >  #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
> >  #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
> >  #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
> > +#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
> >  
> >  /** struct xe_userptr - User pointer */
> >  struct xe_userptr {
> > @@ -294,6 +295,8 @@ struct xe_vma_op_map {
> >  	bool read_only;
> >  	/** @is_null: is NULL binding */
> >  	bool is_null;
> > +	/** @is_system_allocator: is system allocator binding */
> > +	bool is_system_allocator;
> >  	/** @dumpable: whether BO is dumped on GPU hang */
> >  	bool dumpable;
> >  	/** @pat_index: The pat index to use for this operation. */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index c4182e95a619..1e92fd498967 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -906,6 +906,12 @@ struct drm_xe_vm_destroy {
> >   *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the
> > BO
> >   *    handle MBZ, and the BO offset MBZ. This flag is intended to
> >   *    implement VK sparse bindings.
> > + *  - %DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR - When the system
> > allocator flag is
> > + *    set, no mappings are created rather the range is reserved for
> > system
> > + *    allocations which will be populated on GPU page faults. Only
> > valid on VMs
> > + *    with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The system
> > allocator flag are
> > + *    only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO handle
> > MBZ, and
> > + *    the BO offset MBZ.
> >   */
> >  struct drm_xe_vm_bind_op {
> >  	/** @extensions: Pointer to the first extension struct, if
> > any */
> > @@ -958,7 +964,9 @@ struct drm_xe_vm_bind_op {
> >  	 * on the @pat_index. For such mappings there is no actual
> > memory being
> >  	 * mapped (the address in the PTE is invalid), so the
> > various PAT memory
> >  	 * attributes likely do not apply.  Simply leaving as zero
> > is one
> > -	 * option (still a valid pat_index).
> > +	 * option (still a valid pat_index). Same applies to
> > +	 * DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR bindings as for such
> > mapping
> > +	 * there is no actual memory being mapped.
> >  	 */
> >  	__u16 pat_index;
> >  
> > @@ -974,6 +982,14 @@ struct drm_xe_vm_bind_op {
> >  
> >  		/** @userptr: user pointer to bind on */
> >  		__u64 userptr;
> > +
> > +		/**
> > +		 * @system_allocator_offset: Offset from GPU @addr
> > to create
> > +		 * system allocator mappings. MBZ with current level
> > of support
> > +		 * (e.g. 1 to 1 mapping between GPU and CPU mappings
> > only
> > +		 * supported).
> > +		 */
> > +		__s64 system_allocator_offset;
> >  	};
> >  
> >  	/**
> > @@ -996,6 +1012,7 @@ struct drm_xe_vm_bind_op {
> >  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> >  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> >  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> > +#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
> >  	/** @flags: Bind flags */
> >  	__u32 flags;
> >  
> 
