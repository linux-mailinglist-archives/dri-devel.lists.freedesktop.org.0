Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6EC363FF
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9110E797;
	Wed,  5 Nov 2025 15:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyTEDoYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FDA10E794;
 Wed,  5 Nov 2025 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355542; x=1793891542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iSiy9v7+T5caoFkhfEda8KrsfMi8EDfvt8g7F+3EoOQ=;
 b=EyTEDoYdVY67UZHGpf4D+D80AnFFLtuWLPCWSuK6EIFxAwMjrUBJgQTK
 Gt9DNqpJXY3T26S8hwetFoyU3rHv+fmOYHqIqJdydmaUe9obive8r/VZX
 l9LAMDoBRHsrMCXsh5vfm0DugqE2nmfP0xXlGUfHIaI9WhY4fjotXxh0U
 tf1a8BDTn9VIuqMpOUtkRXeAHd3mWQjUU5hRDhcrXy2A69g5QyATH1QAN
 vjxUKqNjqlYAZbVJL1RlX0BBs/w38QGEVAYm1IOtnfFTfBUW8429nkavz
 t9ml4jnAMwyFQ2LzTEr4wdwmKgX3e11xz9Lu9YxUYxCU0cpGBkp/bYfxt Q==;
X-CSE-ConnectionGUID: s8yXNlQET/WfAHfGEWGzsA==
X-CSE-MsgGUID: WGe7IfzARM2XIHlBOif9qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75587238"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75587238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:22 -0800
X-CSE-ConnectionGUID: npfX0EYAS4y5aV4KQrGeew==
X-CSE-MsgGUID: I9vx1YcWS2CbbQW3Urq7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187426781"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqEn27i6PWfkCxZ+92vXFUeOECNlkhG29mlODQFrkTQa1he8d03sPp0Lnd9X31cp9B0mnlhWlen38JHgGlTSR3CNl7p22sKCgy6msrMLxORPR6zh9h3u9SXLhYGyDhUOF6EvCqXjpIDkTuBl3tDGf13UfKzTsyxLSD2PYSMYpKI/jIoxGGdYg3xJ8ks0lBQKmpJxWuf96ePg1QNuzv/yDFvqqBgDibH5D5laHnVGIEi6ubC9cXFjEzfVTkfewqOQHD2nNA/X/vpEXX21WumFRzgFlafnYXqr2FGmmMD2hnfgivcW7HEe5dtDX6NAqsoerwypZtzlHnBVNy5rKCoHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwpKAEkFMiFosdMErWeX2OOXq3PsWU7CPSd3oB3/UNo=;
 b=jme055PvGSR+ARZeUjhjjFhq2yC/W0weTi+CqpHn0lQcx4GK0/Hx7snG3AThNbAGlOJDpSeqzwi/GGwBn7B0KI8Q8T/t/OjnanzuWHoBnGAIAXSzU2rBVgNF7eJJGxy8ENfLlFK7jVH5tetHrR5hytm3SCogy75xfKPrDT6W+jZrYkMX1dx949lQLmITNA/Iw46Eq4LCuN9hS4wd8d/v+RfB1REzLxHA6KTRb7PHhhQXg8DztKqGzvAAxh2340bBoH1dYBliSCvXMVBCOsneq5B+ca3XulHsiDWJFbUW61LtXKka1Lk7d/xJ4CuLsIZQ0aP8rSlTjqPb4GbZJiCgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:17 +0000
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
Subject: [PATCH v4 18/28] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Wed, 5 Nov 2025 16:10:16 +0100
Message-ID: <20251105151027.540712-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 911fbfb2-cd77-4855-b7d5-08de1c7db54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG0vSm9KNFBGY0IwK1BGOWc5NjNkK0Z3V0JhK0FwWlB0K01pNmx4TE1BS3NT?=
 =?utf-8?B?eEp4RVNxdEZRdlFlbXJHdHdoQWZJWXNuNVVrbUNUeVpJS05HU3dPTnBvN003?=
 =?utf-8?B?MWczYkhKSWJpSVBhdmFzUlFWRkw5VkFqS254L3ZuYmJ4NHFmWFUvUFI3czUz?=
 =?utf-8?B?eXA2VzVDampqcmhXcy9DK3RlWFBuMU5VQ3B6cmcxMWhXMDBJMHY5Y0Ewd0d0?=
 =?utf-8?B?RkROQ2d1bHVBejVaM3JkL3A4aTBaU2V4Y1duWDhKaHV1K2pMUkFtQzFnU212?=
 =?utf-8?B?MDl1QnlqWUdPY3B6NnNCN2U3ZVliVDYveGxacjBqQXlsVTFmeTVydXV5NVl4?=
 =?utf-8?B?VG5tNXlhVHpqeXpnazhMSGpGMFNPT0JHYmg3T2pMV082dnB3SldaZU82R3dQ?=
 =?utf-8?B?TGNsNm1ERjlVZHRIcmMzV2xzUVBmWnprc2h1WmpBZDFpU1pVRWY2RkRIamMv?=
 =?utf-8?B?QzdLdEdsd1dWUFpJRTVmUTk4Z0pIL2w2Ui9PeGViV2ZyQjduOUhmOUord29j?=
 =?utf-8?B?MUQvbHFqbGJBVUNhV2VkdUltcHdVUXNSNU1BWjdXWjFVczhwc1lkYnd3MzVV?=
 =?utf-8?B?OTU1YWNoR2NFMUNYa21jSjM1aElFREtyM2IrWjNZV05XWnFYU3ZSdy9wUXJU?=
 =?utf-8?B?LzhYNjA4bHRLNHJhZ0ZVTWJHWWo4RW1GUTlubEdIa2FyaG1jSWZEY3hvcld1?=
 =?utf-8?B?ZzQzTGtRZE5hV2t4cGFEeG5kN0l6K3YvSncxY0VlUk0zOUw1MG45U1d4Rk9z?=
 =?utf-8?B?RzZWTlhuQ1p6dGphcmlIWSttYy8ycmJzWGM1YmhkcGozVGVTYzJ3d3JwSUMx?=
 =?utf-8?B?WWdma1VOVUdHTkRxVnZMZE5OR0RVUSs4SEtZT00vcno4dnRMU0QrMnpEYno2?=
 =?utf-8?B?dnpoRE1xbjZYSVBTTWFiNThZdWJUeUFjOVd1THcrTWxNOFFwcytPRnp3MkxX?=
 =?utf-8?B?TEo2M3crT0NvUTR1eEhNZlprZkZ0ZndsOGc1T0J1QW9mREdQcG93V0wzcXBv?=
 =?utf-8?B?MDN0ZVNiOUxnS0lhUXZodmFyYXphUElFM3lLdW1mTjhUMmxRWXloVW5qRFVI?=
 =?utf-8?B?Yk4rSlBaSmlZbjE1a1RBdURlUHRiNUc0U2kwR0g5LzhLN3FXNTM4cVM0Uk9j?=
 =?utf-8?B?YkxiaWYyMkExUHh4QXpDZmpYRnBFdjdKKzcvUnZPYlRaWlpCQm1JRWh5K3Jz?=
 =?utf-8?B?OWYwNDJSRXBaL05qMDJTQk9rdVFvUTFMUzgvWmhjbW56YzRyZTlHTHhub1cv?=
 =?utf-8?B?T1pyR21jcHdKVmdvTmFSRVpPcW44Vy84VUZiUTBhdENwSUgrWGh3amIwYktL?=
 =?utf-8?B?QU1kVEVVdXVubjVtaHJ1Yk96RTJWaTNtd3Z6TURFY1lad2phbE1ZSSsxdzJa?=
 =?utf-8?B?eXBlc0ZTWlUxMXo1V3FQb3ZaVnV2NWxjc3Q1dnRwYkVETVVpVldoZnZxK0d5?=
 =?utf-8?B?NDE4dy9xVFRWTlFtREkxV1M3VGxRdjAvLzZsamxubDVMeXRHR0lpdkNBWlRB?=
 =?utf-8?B?ZmNXUXJ2bDFZODZDQ3liNnExeFVUQjdFNS96UjNvajBsZUdTS2h3WURUNVpW?=
 =?utf-8?B?N0VOZU5lUzk3SGxmbE44VWxxZ0tQU3VaYkxjZVorbmhrUUprM1RMaGpGVEZy?=
 =?utf-8?B?Rm1lNjRPRERueGlDRWI2VW9JS1F6WXJuZTljcnBXYnZwUnZTcjA1b01tZVJm?=
 =?utf-8?B?bzFJSGlVdlZma1JXTDF3YUZwZmNjNXlYY3J1RUdRdWNKVUNiNVpkKzcxL2s3?=
 =?utf-8?B?Z1JCd01rSStyK1VQOUNYb0NhcWRnQTVrdTdzRE9MSzdpOUMxU0lscDhNM3dY?=
 =?utf-8?B?SVhteWVRZGxLMjV4dStZVHJCcnJNL0lCRzd4bE1JNXJmczNMT1FqOUluVFg5?=
 =?utf-8?B?ZUNKblI5TFcxWVkrMlY2WGJ6QThTaGl3K1ZCSm9jRG9sM2syS0prWnY4V0lP?=
 =?utf-8?B?LzZsVDJMZmttSlFjanNDSnAzTi9COWRWMDJSTExoWGtjeDRtVGVraEVoV1FC?=
 =?utf-8?Q?rafJkDztGTzQXfBWKTnKLpnjaTaHxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0dGVFMraU5OWlZTOVRJa1M1V2QzUVBXQ0YyaXMyVEZBREpkQS9NQTRJWE9V?=
 =?utf-8?B?MlE1YzdkOXozTk4wTGlXcGJKb2k3WkJJRTlOaTlydTVIRWZmZ25nNTArWU95?=
 =?utf-8?B?NmliTmtwUVFPaEZqb055d3plbHRCNW11ODl2eDE5cERNdHQ3OC9ERVFXRjNG?=
 =?utf-8?B?cTd4bkFXSXlKdkxPVE1sK3g4ODdnSDdwNXNkNjRqVnNCVDVEMm9ldUVtazlq?=
 =?utf-8?B?V0JJd3M3SnpUdEdXUkliT25XRnpUTmU4dFdWZDhSUndaelBpbUVBYXk2UXd3?=
 =?utf-8?B?MDl6SVgvV2Q2MExkZldqZldyalAxTnAyNHNRa2c0M0tzRGU1dmtPVHdvNTN6?=
 =?utf-8?B?SjIvTU1rTUxGaGhnK25waHUxc25acTdpL0RIUHpJUzNSSlY1OGVZUUJCbmtZ?=
 =?utf-8?B?V1pOKzU5MFh5ZXVoMURYUVFKZlhNRVhLTEIreVZYMjM3eXo1SWg5azBWZS94?=
 =?utf-8?B?cXFrYlMrb2Y4eGhZckozYUp4NUdrMDVFa0xqakowUHpCbjMzY2grZ3JmVExa?=
 =?utf-8?B?eEljenZKbG5zbU9uM1hMUUUzQkZERW1pMGpqRnVzdk9aeGc0Qlh1bG9Cb2Z5?=
 =?utf-8?B?eXE3a2RKRzg3V0FIU1RmZGc1YjlaTC9Vd00zUllidjBuNXJ6MWN5LzdidThN?=
 =?utf-8?B?K0swZUlhNzV5ZXViQjJXU2dCdjRSUlRsTmtjKzJmc2t2eHRhRGNlOTFEanM1?=
 =?utf-8?B?QzVqZW82YzluVlJkRkNOcmRVZWVhaDlXOTcwUlFZampPMnRVVWU4YmZoZVdP?=
 =?utf-8?B?Y2ZKYW16MHdTV2lEM2ttMDZ2UCtxa0ExRzd1SUJUZFpQZm9xYm5FUEpUYUd3?=
 =?utf-8?B?WmRmMTVTZm9KNTIwaGFLekR2T29ZR3JmZVZRTlQrbS8zUTRCT21Ra1RMY2NW?=
 =?utf-8?B?TGtJazg5VWxWaTVzRWt6UUcyemQ5MWRWbkJwZDZyYzVWYUxSazhFcG5KWTRO?=
 =?utf-8?B?cmNkUE5VangyQ2hDVFRtZVVyNmJkSWkyK3lhQU1uTURGTzFtV0JYN012ZUh3?=
 =?utf-8?B?Y3ZPR3JhQlY4aGk1SHAvZ3k2aTFpVUF5SXNDRUM0c0F4K241LzBybGpwWnBE?=
 =?utf-8?B?c2s5YXRCSkR1K3BaYkxhS3ZwaVo3Z2JkY1dSY0ZQZG53aHRYR09jck5CaVRO?=
 =?utf-8?B?SDlGWUp3ZTBwMHR2R0FudWVrRTU4Y2JraDZ2d2x4b0xoLzMraVpla1FtdFZQ?=
 =?utf-8?B?blN0Wnd3anpvcEY0WVBjeVA1aEJ6WVVLVUYybGZNeG9vM1U3OUlaZlFJZzhj?=
 =?utf-8?B?Y0FQaHVsQlZUS2p4UFZkK2l1eCs2cnVmcTR1U0pJRFFqT3AyQVQ5Ny9rYkl2?=
 =?utf-8?B?aGVpajZ5WndVSGRrc0p0a08vQ202N2VkN0gvN3FydkVKbTBrd3piY0RwMDJy?=
 =?utf-8?B?T01HWUwwWXUrN1pLWDhKQy9CTmhqSllHeTZGamdiV0JrOWVYcDh5Qlo2VjN2?=
 =?utf-8?B?SDJPaVFsVUVLKzBLc1ZQTE55QlpPdEtCcUcyZzFSTG43ek1vRXNMYmJQdXJu?=
 =?utf-8?B?YlZKL3IvSzVjM2RNZkRTUTFZYWFaYmsxUW83WG0waTBXdHFXR1RlaURMRWNS?=
 =?utf-8?B?OFQxVDgzSHdSTHFncHMwVmxVazdvVHA5dDZqZlJRc0dEekdEQ01MSVkrRVIz?=
 =?utf-8?B?S3VianNnUStKc3lQTXkvb0RlMCtqMlBCb0xralNyaXdwWjg2QVg0amNTaUNu?=
 =?utf-8?B?R09XaUs4Tkh5OGFIcVFkZXNXT1BzRWxaSkRPUUROeWpWMk8xcmJ4UE5ZSkky?=
 =?utf-8?B?SThHcWtJcjh2OGxwZ0V5VUc3T1FZOEpld0pZUWw3OC9zcFpqd1hFNDNwSTNn?=
 =?utf-8?B?cmh5dDQ4U2JhR0NXNTVQa0Q5Yy9SU2xXQ2ZwSVIyemZEb0tOc0o5a2pQNURU?=
 =?utf-8?B?NTBra1VpZDl3SjVYNEJtMHhCRS95WVNRSmZmRGh2R2tCaHVSV2liMUNPYzVl?=
 =?utf-8?B?Y3AvRUluKzk3MTg2OFJyK1JCcElNbFE3OHpRUDdPWExVdWtCODVMaVNhQmtp?=
 =?utf-8?B?Y2VGbTBCY2dKTDM4YjA2alZGcG5ubXBTOTMyK2Y4eEFDaUkwaDlYZ0xPa1Ev?=
 =?utf-8?B?bjRSOXJpRk9oNUhlSm1tbitGOEwwRVFrb29RUXdLVmdlZDNtUnpoQWhNdGtx?=
 =?utf-8?B?NjRvQ0FrbVJ2cTUxTXo2UFZCQURqK3p0azFSRGZ6cTJVdVVpZ0lEYXlGSUtU?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 911fbfb2-cd77-4855-b7d5-08de1c7db54b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:17.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO4CtyvRRSfEDuZRhvXnolrafYxfWfxJL0ksVIROj1/8uONnlXblOOA5FGPse2CDeUphKwIjFrNwFOSXXVlXw1lq6NgTYtnKgvcS9WPZiAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 111 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 198bf0c93a4c8..ee4717f9a8260 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -867,6 +867,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GGTT)) {
+		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GGTT);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1096,6 +1108,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	int ret = 0;
 
 	switch (data->type) {
+	case XE_SRIOV_PACKET_TYPE_GGTT:
+		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 676205e04487b..e7879c0e55615 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,9 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_ggtt.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -41,6 +44,104 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+static ssize_t pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_ggtt_save(gt, vfid, NULL, 0);
+}
+
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_ggtt_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data restore");
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
+				vfid, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -279,6 +380,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -344,6 +452,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+
+	if (pf_migration_ggtt_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1cba651b521fe..2d221b6409b33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -19,6 +19,9 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

