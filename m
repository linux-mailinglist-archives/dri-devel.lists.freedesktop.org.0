Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B846C3A955
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 12:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C91910E8A6;
	Thu,  6 Nov 2025 11:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLhvYaGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7E710E722;
 Thu,  6 Nov 2025 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762428720; x=1793964720;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lO9CeFNh0AoKTpNLCVb6s1fE7w6QTeK4FCD+nL2rOHI=;
 b=VLhvYaGtHpHGp2cwY6vp+1jeysXUUrGZC+Nbb05TPVpKAmvzy8Bt6OIU
 95R5ueGMTi0aqskyn9fQv/oQCzDm6fS+LCegtbPA1Lm2nuFIKfyxahrlL
 8btUKmN7r7jx/eXW1StDscpZYhnxOP/SXhgCD+KcnNok3sILsyoxlA/59
 43Qr4dQOcrHxqFMGOYn/SLK1LJVWJRTg3vHw7nIMaZPLtCjHf84TbWk5W
 gcSRgx6yAX5so3RRZwHmGoKjSMjY6TroHbe6Fa83UvNkyWuPLdUFtB/6s
 drzrzzwGvEa4pUK/vX1yMlcArBUBqX9tnKxjbOTyVpqaWe8WqR+a8vmgr Q==;
X-CSE-ConnectionGUID: XX9OLUrpTUOBwq849viQUA==
X-CSE-MsgGUID: nV8EVuibTpeJq9/niK45Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64469071"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64469071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:32:00 -0800
X-CSE-ConnectionGUID: YhyqM2fQQDKplw5A28XUWw==
X-CSE-MsgGUID: GnTetCkkTeOqQufAhrp2yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187023535"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:31:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:31:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 03:31:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:31:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xANbolwmhIq/+WEh/uWZObbYsiiDs/P+zkC6UtYKjH+/KSEaM2ZNajbILlPidH4fJdyKmdxvs7YWfITqyyRa6Hj3XHUNzNmN678KCaps06wa6w2TLacsGFf+CRzDXSLLjrpayujTetjAmDlUEMtlYymSneeghfLwGBVkRmyFqvOwxUK3I08c15+4KizT82W5vchfuK+SWdFJ3C4NM1707VkCYDny1GKUbYtbapa78SguH8h/sKXkK2I1AFNzeoMofMacWmn6y8ymviXEsaNtZVvkU3cgs/LhnC/ImoBoJjyHUc+9ORLDdD5JSSspHMNYD6bpTz/W0M3H7j+PBKDMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlfWwleACoFWoeHWHc3hhmU1B4m+/pTshxn1OdmlqSY=;
 b=wnubY3wwoMn/oVwKW0XTNWCnf7Vmfk6RnCPO7CKwOcA451qddKjx27qPt1jb6PbaqWXVdioqA9z0HiBqig56qXBsQL0tA9kAFXgEaeRVUA503tEaCa8OQqQTCaYPqMmhEn7hiQjzGrChO47qRthDfN3Na5NOKh/5RANqQfxrRSgLzYpFcRicPMaut1mWHPsB+GA7rMBKVq7urfkj67mMSThLI4JQRm4nTqYBLlenO0Nvl6FuJnnMzXCb8xEbqNHWuFTxD4UQgY/CZ40hrJT0YipnqkIuUp9FMdfJkzRD9eE/3YQDla+9UcgN4hW8bESoKtle6kP9feaG3h4TI0Qm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 11:31:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 11:31:55 +0000
Date: Thu, 6 Nov 2025 12:31:52 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v4 17/28] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
Message-ID: <bb7buf73okuyux7vz7i5yymw5s3an3t5zhomevyevhbw5px6do@atv3se34mure>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-18-michal.winiarski@intel.com>
 <23e04171-5b1a-4d56-9a6f-7bde65691e9d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23e04171-5b1a-4d56-9a6f-7bde65691e9d@intel.com>
X-ClientProxiedBy: BEXP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::26)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f58ac57-076f-4297-2725-08de1d2816d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VE9EODE2aTNYRWVBWGtidTgwU3cvckViWEJEUENpVHhLK3ZRWXJPMjE4YVB1?=
 =?utf-8?B?V0JlWkNPdmlxNml4blFIeUhjUEZ3TU5IajBSbEZ4d2pRTjhoS1EvTmx3enBI?=
 =?utf-8?B?YUcrWmV5Nk5Fa1NPWm56WXEzYWlvSnA4QTBQRS8waXd0aFVkL0xuSGE5b1o5?=
 =?utf-8?B?Z3lpZXJCci9hOENJc25EUmpPdHZHMVY4dElIK0I1U2w4QnUzcG1IaExhUWhP?=
 =?utf-8?B?SzBSUU1aVkhDUGR1ZEp1SWVpdGJYRGtSQ0x3dlZpVlMxVDVYZEQ4RVNhTTIy?=
 =?utf-8?B?WDQvRTBONFpVRzBFcnFpdWFua2lsRVZ5Rm5JZUVCcFpqVElXeUd4SEJ3Tkds?=
 =?utf-8?B?WDM4VzJ5ZjFIa1R1dkhiSkVMalhLTTM2VGpjVlh6Yk1odjhGUkRqNmhVOE1k?=
 =?utf-8?B?N1ZHdnk5SDhUN0d4MjFVMEtnNTZ1WFVBaWRTa21ENncvSG5EVTJuVlpGZ0dv?=
 =?utf-8?B?N2FPWFpjUHpjRkpkaGplQlkrNWVmNkNsV1hZSVYrenU3aC9Mbkw3ZmlRQnJu?=
 =?utf-8?B?Q0h1U2ZhN2pHYTdTMU5OWVc4NjlzQkZFajM2VCs4eHMzRkpBOTRiY3h0emQw?=
 =?utf-8?B?VUY1U3F1d2t1bk1xT201WmJPYTlOSTcyOUpLUEVIdmZ0YXBKZHBlMGt6eG5N?=
 =?utf-8?B?bFV6d1d6bXNlUis5OWh2MGxrM0dMaCs4NUpWQXJ2bXRrYmVFazBXNVZla2da?=
 =?utf-8?B?QklMR0lUWGhLamsxSktiVVNjanQwclVsZnZJOWRObTZHZmV1N1M0TVdaT2t1?=
 =?utf-8?B?QXNwSkZtaWhvMU52eENOd2ZqRXVEdGNJY2ROMUtjUXZUSDl0M0VncmVNcHBo?=
 =?utf-8?B?TVIwSmx1R3UyT0ttbkF2K2ZGaE5LRG9UdVJId3pMaklVVmxQMFdUSmkzMEJT?=
 =?utf-8?B?WTlCRm53bXBaWkdzendQdkRJYW9nU2psbGYzK0xySWpYUk9NTW5wd25wd0VZ?=
 =?utf-8?B?TDZ2OGlRbTNaZGo4RlBINlBmcUFLL1ZmcllsU3hBRDg4WnNtSDdYc2d3dmxY?=
 =?utf-8?B?RWUvbGV0YUg3TzNlRWh1Vk53TWxQMmhzNHZKMk5qWDdUblRmcTkyN0FVL25O?=
 =?utf-8?B?d0dTSFo3azBVellKU29ESC9CYkdoR000VlJmd3ZuMm45VkRYN09TN0wrVkkr?=
 =?utf-8?B?Y1htVWI5ZEZLVmx3dGxVZmVyWm5ENGhBYmtqTUNISVZWajhQSUtTSE1jQVA0?=
 =?utf-8?B?ZDJ3cWFCa0xBcjY0ZU4vS3dyMEFMWXlvSUVJMUc4MFh6QzRjdGErVzlQN0hK?=
 =?utf-8?B?YTF0cmNoNGMrMGRZNk9iNXlKS2hsUVl2SWYvWTBxQ2QxeENiWFdFNkdVdk42?=
 =?utf-8?B?a2FkZ1BKOGlFNGJiZk9uSzVFNHlQSDVaekdUaWFTeCtrbmdEQTJraElFRnQ5?=
 =?utf-8?B?K1cxMExveFRsSDhGd2JyVzF5QzJjRzM3VlFya01SL0NzYWlDeURCeVorVFc2?=
 =?utf-8?B?RzZ0YVVrditiVmZpVk16S2E5MVFtWXUvbWpLejY0Z3dlN2dmZmZ2Um9WL05Y?=
 =?utf-8?B?UUkyaHNOVTVKZnVMbEhlMGpZYXR0NEZXUTFkRUEwd0Y4YU0ySndTaW0xb0hV?=
 =?utf-8?B?TUR5SzA4dGNXTWhDN1VZeWFEa3c2SnhwTGg0UlYzbndZUG43bU1vUUV1RWdN?=
 =?utf-8?B?WUR5SXJTbzNtZEJWT21IZ1BDY1ZDOGdUYUxEczdZbHdiZFVxbk81cUliNERR?=
 =?utf-8?B?SXZidWk4dVZYN3lHdGF1MS9HTUJ2bFJZNXdaeC8yN0lBekEyUEZOVmdUT2hj?=
 =?utf-8?B?a3hBb3FMa2UrZktmNVZReGxVZnN2VnlFVXdBNklDdWVmelRWMkdHRG5qOUtW?=
 =?utf-8?B?b2xLOUZLN2xMNFhSekFrNG5KMWtUUjRtdjlVR0E1SnJ5SlZwTlhuUVg2K0Jk?=
 =?utf-8?B?WW1HcmM3VmRYVlRwNlRqOHA3Yzl6VzAyY3FDQWswRXhPOEZjMHBjQ2lMdFR4?=
 =?utf-8?Q?Lz5AAIKFBfKmjYUlLQ618J05CWtYYNa0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWJxSGl1UTc4VTRBRlBZdERralJHRklLTmhtVmRtd0ZOd09OVmhNSlJPL0Fk?=
 =?utf-8?B?aHpFWkRVNHQzeFZrODZZMTAwMWE2NUlnY2VTUG9vblJTOFlHOFhMUUtaVTFl?=
 =?utf-8?B?enNZV3ZGa3hRQ0pBbzJTUjRhL3FFK1ZPcnByNUtVMHYrMVJyRnFTaWdPdHlU?=
 =?utf-8?B?d2ZjNS8rM3U3R3kxMzc0NnByZFB0ZlZ6MHlYRlBGY2lqR3pvQSs1V00xbWpS?=
 =?utf-8?B?MFU2VTN5c2EvTHBsSEllbG5kZkhxVEFINTM3VUwxQUhyTzVCbUphTWh5OFBE?=
 =?utf-8?B?cTB4ZHpOL0w2N2lkOXNLMjNlRXg4WjNpNE1jdmxIVUcyMCt1RTVHMHNRRjlM?=
 =?utf-8?B?V0NaV2NlbGtWOWNsNDREK3AzNEs2eEZ2SWFXcDQ0cFVLOG9JMit1WDVMc1Jq?=
 =?utf-8?B?ekF1ODhDbGh6cnVBQW9RcmluOUJyenlYcFEyLzN5bm5aYW9XdXhmZU91cG1J?=
 =?utf-8?B?bU9oUHhycTA1QnF3NG1MM25DSjNNU242eHloWW1QQ21XbzFXWllmempqTU15?=
 =?utf-8?B?SXRRanJmdy8zeWFNVitySUdvd2MvRVY5ZVdPT2doRTVPYnB4Snh1anBkOFZX?=
 =?utf-8?B?VkRNUWZ3SXhTMi9sZS9KTCs5dGJZemx1K3pvY1JnSXN4Q2RVS3l6RVM0bmhn?=
 =?utf-8?B?SFRJcU81Y0RPemJUWkIzeHB3elZ5L3pFQWdIRXFoQThwWW9DQ0RiSnpxU2Rl?=
 =?utf-8?B?RVBmdjBBbHdwZTlsclhNeGhxOTcyOWh0ZlMzQzY4eklqeitETWZlVDlQQTJT?=
 =?utf-8?B?Y0hKb2FFRG5DZGFnNDZoZTU1UHUycmlTb1B5MnNoY0JCdEdxVnl6YWwvNU1w?=
 =?utf-8?B?TGFnUTJoNUoraHBXcWFkUUkza2xqdDVQWVhBZjFkQWM2M1Q0eGRITnBOdVBs?=
 =?utf-8?B?a2Y4UUlySWE2WElkNjhCREZiVGhrVFVWTVcwUkdGU2pUMTNPY2J3aGRkZTNI?=
 =?utf-8?B?dG9mKy9HR1NuSEg5bnExc2pJSkY2c3JnNml5SlNLYjIrTDdVNnF4VjdDSGFP?=
 =?utf-8?B?WCtjamViN20vWFhqSGlKYnZWNVpBM3pFa1FWY3BGSE1laUJhWTFhYjlrU09X?=
 =?utf-8?B?cVlKMU9pVjdDQ1BBN3d1ZzhMUkF4WDR2OGRqSEN0cnd0RnFmU1ZDTDFVK1BK?=
 =?utf-8?B?TWV4K25wS2ZuaUJVcXdGeXhSWUhEYkU5ZDBOdWlSQlNhMHNCcUZqbTF4endu?=
 =?utf-8?B?b1VXUGZQNENXWFlZaFQ3S2plWXJHNWVBQWtuZk4rZy96OHZBNW1BVi9xM2ds?=
 =?utf-8?B?U1duZFhkTDZCTnhVNU9QelFhTFkwMXJOcUxMSDdqUlFLUTBIUE5EcmpSN3Zk?=
 =?utf-8?B?NzJYYVZNVmpLdGhmTUlGY01aSjVNK1RRUTNpVjBhblArdzEvaU84S0RKZm9W?=
 =?utf-8?B?Skp2S0hCNHdZUXpBVlIxVENlSnRjemtFdXdGbTREU3hMalRrTmNOam95S3FR?=
 =?utf-8?B?VnBSc1RiNjVqK2EwbTZrYU51UWYyaVdaajNhbndMK2I5YjFSYlI2TDJwL3g0?=
 =?utf-8?B?QkhmOEY4ZENtWDBLSmd0NzhsclFwREdOUlYySlo4N1RkL2Q3TkpiU1hZRGs0?=
 =?utf-8?B?L21NenhQdnJzSnhDOFRUb09vcTBCZzRxSElYSUhPcnRTOHlHNjRucFZMREFQ?=
 =?utf-8?B?M1NldHRsVUlqbjRpSDd1TUZxQlN0SkFlb3YrVStqajFtWktoeXlTVnYwcW1T?=
 =?utf-8?B?Zmd4WExQRzUvcDhYS0ZYWmtDTG9jNHRodWZLRVJEMk9aLzZ3d25CUEhmd1Vx?=
 =?utf-8?B?VDJxRmxacS9WclZBaXcyaVBwb0pqdElDTUs2UFZ2QlZNZU8vakNSamVRdEd1?=
 =?utf-8?B?ck90ZkN2MEtJWVNrVyt2cExjcGJhY2lNWm81SVRKeTE0ckp2aGFhVjdZZVpT?=
 =?utf-8?B?dUgyQ2tBOWNCaHpybkx0aXJIYURIemRBKzFLYmt6TmVNVTJLaGo3K2loV0RM?=
 =?utf-8?B?OWVMQUtxa0k4U3dxOWMyYk9zRitMUW5uMWtCd21EN3N3ZjN4eDBlUEZFSnAr?=
 =?utf-8?B?NUdvc2NPTmJ6aEs2TkNjaGRIdkIybVBjZ2NySXRYaXc2cE1aUG5PR3ZVRE8y?=
 =?utf-8?B?RGlLL3lKSlJBc1FxRGlTV0RhU29ubVQrMFJwUmVvOUVNZXBLUlA5MDllNktQ?=
 =?utf-8?B?Yllkc1JEREhKbTZHL3dPcUZXSzBHM1pKbm9rSXBkeGp0ZDZNSG9ZRzJhTUh6?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f58ac57-076f-4297-2725-08de1d2816d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:31:55.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7m7+u+lP957GEAdXmUqHfj0AjCm/Aw5ANhxabL973PiZ+EmL/cGZIm0CEVKMpcKk/k9iKeJlwkuD9O2JQMhUHCJWaIdqb+UdHIQTvJbWBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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

On Wed, Nov 05, 2025 at 10:45:47PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/5/2025 4:10 PM, Michał Winiarski wrote:
> > In an upcoming change, the VF GGTT migration data will be handled as
> > part of VF control state machine. Add the necessary helpers to allow the
> > migration data transfer to/from the HW GGTT resource.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
> >  drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  52 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
> >  5 files changed, 167 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 20d226d90c50f..2c4f752d76996 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> >  	ggtt_update_access_counter(ggtt);
> >  }
> >  
> > +static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> > +{
> > +	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > +	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> > +
> > +	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> > +}
> > +
> >  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> >  {
> >  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> > @@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
> >  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
> >  	.pte_encode_flags = xelp_ggtt_pte_flags,
> >  	.ggtt_set_pte = xe_ggtt_set_pte,
> > +	.ggtt_get_pte = xe_ggtt_get_pte,
> >  };
> >  
> >  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
> >  	.pte_encode_flags = xelpg_ggtt_pte_flags,
> >  	.ggtt_set_pte = xe_ggtt_set_pte,
> > +	.ggtt_get_pte = xe_ggtt_get_pte,
> >  };
> >  
> >  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >  	.pte_encode_flags = xelpg_ggtt_pte_flags,
> >  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> > +	.ggtt_get_pte = xe_ggtt_get_pte,
> >  };
> >  
> >  static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> > @@ -889,6 +900,20 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> >  	return max_hole;
> >  }
> >  
> > +/**
> > + * xe_ggtt_node_pt_size() - Convert GGTT node size to its page table entries size.
> > + * @node: the &xe_ggtt_node
> > + *
> > + * Return: GGTT node page table entries size in bytes.
> > + */
> > +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
> > +{
> > +	if (!node)
> > +		return 0;
> > +
> > +	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
> > +}
> > +
> >  #ifdef CONFIG_PCI_IOV
> >  static u64 xe_encode_vfid_pte(u16 vfid)
> >  {
> > @@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
> >  	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
> >  	mutex_unlock(&node->ggtt->lock);
> >  }
> > +
> > +/**
> > + * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
> > + * @node: the &xe_ggtt_node to be saved
> > + * @dst: destination buffer
> > + * @size: destination buffer size in bytes
> > + * @vfid: VF identifier
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
> > +{
> > +	struct xe_ggtt *ggtt;
> > +	u64 start, end;
> > +	u64 *buf = dst;
> > +	u64 pte;
> > +
> > +	if (!node)
> > +		return -ENOENT;
> > +
> > +	guard(mutex)(&node->ggtt->lock);
> > +
> > +	if (xe_ggtt_node_pt_size(node) != size)
> > +		return -EINVAL;
> > +
> > +	ggtt = node->ggtt;
> > +	start = node->base.start;
> > +	end = start + node->base.size - 1;
> > +
> > +	while (start < end) {
> > +		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
> > +		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
> > +			return -EPERM;
> > +
> > +		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
> > +		start += XE_PAGE_SIZE;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
> > + * @node: the &xe_ggtt_node to be loaded
> > + * @src: source buffer
> > + * @size: source buffer size in bytes
> > + * @vfid: VF identifier
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
> > +{
> > +	u64 vfid_pte = xe_encode_vfid_pte(vfid);
> > +	const u64 *buf = src;
> > +	struct xe_ggtt *ggtt;
> > +	u64 start, end;
> > +
> > +	if (!node)
> > +		return -ENOENT;
> > +
> > +	guard(mutex)(&node->ggtt->lock);
> > +
> > +	if (xe_ggtt_node_pt_size(node) != size)
> > +		return -EINVAL;
> > +
> > +	ggtt = node->ggtt;
> > +	start = node->base.start;
> > +	end = start + node->base.size - 1;
> > +
> > +	while (start < end) {
> > +		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
> > +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
> > +		start += XE_PAGE_SIZE;
> > +	}
> > +	xe_ggtt_invalidate(ggtt);
> > +
> > +	return 0;
> > +}
> > +
> >  #endif
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index 75fc7a1efea76..1edf27608d39a 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -41,8 +41,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> >  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> >  
> > +size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
> 
> nit: maybe it should be placed near other "node" related functions

Ok.

>  > +
> >  #ifdef CONFIG_PCI_IOV
> >  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> > +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
> > +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
> >  #endif
> >  
> >  #ifndef CONFIG_LOCKDEP
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > index c5e999d58ff2a..dacd796f81844 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > @@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
> >  	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
> >  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
> >  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> > +	/** @ggtt_get_pte: Directly read from GGTT's PTE */
> > +	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index d90261a7ab7ca..2786f516a9440 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -726,6 +726,58 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
> >  	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
> > + * @gt: the &xe_gt
> > + * @vfid: VF identifier (can't be 0)
> > + * @buf: the GGTT data destination buffer (or NULL to query the buf size)
> > + * @size: the size of the buffer (or 0 to query the buf size)
> > + *
> > + * This function can only be called on PF.
> > + *
> > + * Return: size of the buffer needed to save GGTT data if querying,
> > + *         0 on successful save or a negative error code on failure.
> > + */
> > +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> > +					void *buf, size_t size)
> > +{
> > +	struct xe_ggtt_node *node;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid);
> > +	xe_gt_assert(gt, !(!buf ^ !size));
> > +
> > +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> 
> new line here wouldn't hurt

Ok.

> 
> > +	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
> > +
> > +	if (!buf)
> > +		return xe_ggtt_node_pt_size(node);
> > +
> > +	return xe_ggtt_node_save(node, buf, size, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
> > + * @gt: the &xe_gt
> > + * @vfid: VF identifier (can't be 0)
> > + * @buf: the GGTT data source buffer
> > + * @size: the size of the buffer
> > + *
> > + * This function can only be called on PF.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> > +				       const void *buf, size_t size)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid);
> > +
> > +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> > +
> > +	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);
> 
> nit: not very clear, better to have node* var

Ok.

> 
> > +}
> > +
> >  static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
> >  {
> >  	/* XXX: preliminary */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > index 14d036790695d..66223c0e948db 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > @@ -71,6 +71,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
> >  int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
> >  				  const void *buf, size_t size);
> >  
> > +ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> > +					void *buf, size_t size);
> > +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> > +				       const void *buf, size_t size);
> > +
> >  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
> >  
> >  int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
> 
> few nits, but LGTM
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
