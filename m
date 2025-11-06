Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CB8C398E2
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2496210E834;
	Thu,  6 Nov 2025 08:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dld1feZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F4B10E831;
 Thu,  6 Nov 2025 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762417247; x=1793953247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E0fECV83B1zd3hnYOSHPpDRTXcYjCXCQPrdH9bAFEpg=;
 b=dld1feZD/UucyEduB/bY8lMYBgoivs2gEuWS6oPQW+/1Mz0PqTETWljb
 NZea/xYjSBFFqTEG+sTCrkEZf+86PQw9R2tY9w3F05DeIe+HoGb+K019S
 t86Mn8DZpfoOQLrDxgs/jH5ELLxYAmtgpr1Nsct7o7ZtfwGB9k5e9Uk+t
 co5Quee4aWO0NiQ37RGe4cdz55hduOpNEpYIzJtmC5x6y7XbD5HbIMiGy
 IPbbIgsTAWTMNg0i1LdbzqwSt77/wUG+e9KTuROORDWG5K0r0C8SlPPlR
 8IVY/TOdVNK9T7BaMHgQFk+XXDiYGEd8voFY633cF1UVQomjXfV2dpnch Q==;
X-CSE-ConnectionGUID: 93KCd9MxR9+03bO+DkJZyA==
X-CSE-MsgGUID: m69b53rPQWSSPV5bKNa3NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64644837"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64644837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 00:20:46 -0800
X-CSE-ConnectionGUID: +0U+6vYkRWyX9mJQxkgtuw==
X-CSE-MsgGUID: os5FrML/RmiyofB8B7nabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="186947753"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 00:20:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 00:20:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 00:20:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 00:20:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbyVI0Y78BKUnzHi8mT6n4KVSGPeUB/uLsKIHmO/ewOnGFrhqwTNNqBCfUFxsTJDpD61PJilax/l/6rDA4hNWvS+jD9MpRGuSRbANtQIs00YgZnkjxq30Oe4NRUvSbT4rttfmt64gwiaDsX6NiNJct2wMsJwclOg9pMUkIUD/dgFMBVWUDxlxQjaqyNfpAh1pZDpF7oLhNDE5I09lVXPXmEkqeOtDshr0bwf0+WkNJqMmO5+o5ab9k93LiNwzpCpGBLL0lphpzNDygUDb2M/+uCMmssoky6x9BIo4aIcDNFj7euS4ipIoUi4gkkQh8lM4319Mm14bv8/7FT5ZGJcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0fECV83B1zd3hnYOSHPpDRTXcYjCXCQPrdH9bAFEpg=;
 b=E1DmHhiE84hdEE5MZHDQreAUbt0WHrIoLF5J2jfENa7Gi1L497IXrL6en2Hgj/PWlddr9ywjGqHAZvFpvMAzxwvpwQiZwBCtR/mhEm2FYCQYAwM/qBk0FGXgjOsxZvSVcTJKeOkhqAzInM0pYCNBmo4JxQfxayrV6MJ5/GOcWeYHd+YxPLipK6Ndso89rwLxYiQPpXwtLiLmoYlGOC6qU1guHqQ3IIMabNqu9U8i8l35BEaDeAcmQP4x2H7Ha0cIhiseoyQfbzem4Ymi750rgb64EQCh8ZJWQWqwSVcQ4JXmKMbwRZD1YRpkNJwmGixHrHW1/9s+P1tlVybHNWI8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 08:20:43 +0000
Received: from IA1PR11MB8152.namprd11.prod.outlook.com
 ([fe80::c08b:cd53:5bd7:7784]) by IA1PR11MB8152.namprd11.prod.outlook.com
 ([fe80::c08b:cd53:5bd7:7784%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 08:20:43 +0000
From: "Chang, Junxiao" <junxiao.chang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "clrkwllms@kernel.org"
 <clrkwllms@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
 <linux-rt-devel@lists.linux.dev>, "Zhang, Baoli" <baoli.zhang@intel.com>
Subject: RE: [PATCH] drm/me/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Topic: [PATCH] drm/me/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Index: AQHcTs57bxLLwuhnwEqHy8JFOJ6HF7TlPNqAgAARqCA=
Date: Thu, 6 Nov 2025 08:20:42 +0000
Message-ID: <IA1PR11MB81521FA5B25907289F41DBCAECC2A@IA1PR11MB8152.namprd11.prod.outlook.com>
References: <20251107033152.834960-1-junxiao.chang@intel.com>
 <20251106071613.xi1ETeFG@linutronix.de>
In-Reply-To: <20251106071613.xi1ETeFG@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8152:EE_|CH2PR11MB8866:EE_
x-ms-office365-filtering-correlation-id: 3d2d9ac7-0e48-41b1-29a5-08de1d0d60e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Mm5KY2FzU1V2WHluVU1Wb0RNd0pERkw2dXhic2JzaGtWL2JMVEtCT2gzRG84?=
 =?utf-8?B?TFJrM3Y0cnZsZk5VbHVHalBJWjd3M21JQzZLY3kxVFAvcGtRMVBHMW5Ma21i?=
 =?utf-8?B?L2pMUGpYbFlrQU1mL1pIWEs3NXBoYW5iYXVtRitydUszRWN4L1laMFVBOGRH?=
 =?utf-8?B?bkx0L0dYMFh6ckt3K3pHWnpNMDh0RjlZakdVWm1oc0tkRzQ3UVdhRDJ0WnNG?=
 =?utf-8?B?SFcwNzVZZ2FzWDlIcEcrL0ZxdjJKUlhFNGo4TUtuN09RSTRmc2RnVi9VMmdr?=
 =?utf-8?B?d1ozUXc2NnBYbndDUGZDOG5QYk9Nc2dPanZMOU5PZjZ0Y1lyYjR0cVdXUnhV?=
 =?utf-8?B?Y2NNbTVTNERUWjBxRFVQeFV5c25zenJxdDFlUjhKLy8xQVNWdEhoa21nZVl2?=
 =?utf-8?B?bkhKT1NRMnZTOTBJeUx2TmwwNWM2T1QySUxLNkFNYkQyR09RNmNRZ0s5M01P?=
 =?utf-8?B?UnQzbFg1U2ZoalVaUUZxUElYWUJZMUpiWTRtVUg2TmEyYlNqZ0M1WUJKcjZV?=
 =?utf-8?B?ZGpMeHlRcDNpNjFGNzlxNFp2STRaOGdjNWNNQ1kwYjB3cmRQMXdJaDkrRklt?=
 =?utf-8?B?NUh5Q3pDR1BXbldwUDEwb1ZvMGMvcklqUUxLVlRFZXFMUkRTQmJlL0k1Rk9F?=
 =?utf-8?B?WHpjdkpjQnBYQXZqY3JVTDlPVHdGcTFZWjhxWHpleW5JTDhxdk1Pb3BhT1hq?=
 =?utf-8?B?Sm1wbmdGSFB3VElETG9LZEM3S3dha2tqZTZNZkxhQzhiMFlFS2J3aUtPT251?=
 =?utf-8?B?bko5bVRPbnNlUE9wTVJJRDVwMmpMVmQrNW5acTRkV0pUZEhnajRkT1FXcHFI?=
 =?utf-8?B?S2JER1BRazJoWWt1b1U5NTRtY1IvcWhMMkF2QWUrNjRoUmxCL1VOSmZIRWJo?=
 =?utf-8?B?ME9NYzUrbjdicmhZRS9GbXpkek85OEduN0xPc0crb1lzYmtVb2o3dDhYMFl1?=
 =?utf-8?B?ZUpxRmZzdE5WcUgwS2RGYXFmeEZpQWx0d0JBaHBmTTFjdXZZWVZQNC83Q01B?=
 =?utf-8?B?T2RIdGV0cVZ0NWQxYmhsZmpaZ0NRQlQwYlJuSW43WG04ZkdONDh0c0xxYTZZ?=
 =?utf-8?B?OEtqejY1bVRXMjlWOGxYaUMwQXJOSVVGVGdBd0lrckhRR2drUHBVREk2VEpv?=
 =?utf-8?B?RWV2WWZWR3JuK2tYaThYTXE1dHBxNzV4RDR5RHk5U3BabHhnWEpJckpNL2kr?=
 =?utf-8?B?ZlVxZGJBbTNXbHJyUVFjWWRSTmZseVk1VHpITGpkTXdHTy95Smp4OFM0T0cy?=
 =?utf-8?B?akdBWGMzekdBMmduZm5DeHAwamppc245UjBiay9OYy9uVktDRGhYdDFYaTFV?=
 =?utf-8?B?d3VGSGtVaXNVM0YzUEgxVGRqM2ErZFAzdDNWeXV4Sm1XR1lyb1g2c1J1UFNp?=
 =?utf-8?B?NVBldThOYzloUGQ4d2IxODVqMDZ1OGlpaUpuaXRDN1Z3RS83ZVcwcmY2VTUz?=
 =?utf-8?B?U0FaeDc0SDdPcnoxSWdFbmlPNjN2NG1VT1dzMjdoclNmRU5WZXNEWjNEcmlO?=
 =?utf-8?B?enJLNjFrMEM0UllMVjc2Z3hmcFc2b0ZhUVNVN0svTlozdlZzR3dhWGhsZW1s?=
 =?utf-8?B?eGhiSlQ2SktLbkVWK2xTV1RSVE5FSTRHQ2IwZ1ZBTGZYdUt6WjJMY0pWMEJq?=
 =?utf-8?B?S2pNbUMydm1jTGtybEdmQWRMeXlPcU1QcTBDM0JhMzdCN3ZiL0cxS3dpVjE4?=
 =?utf-8?B?VEo0UmdRQU5MQjRHT3pyenNJT2JsV1NMNDMvV2p2ZXJnbE94YVN3a1hLaVRJ?=
 =?utf-8?B?UjFOcS9XYzRFcWhpMXBPUkU1cCtEdEVNYytjOGpROFgyZm5xamtvMm9KZmpm?=
 =?utf-8?B?ck01aHhhK2ZxRjhocVAwZWxMTjFIK1RoWm51R3dOU3BEUTlrU0hmL1pmd2FP?=
 =?utf-8?B?NWhVcWRYenVrbktJQkdDVTBqNEdmWVVJU056dDFqcWVwWFZPV083b0VSNEdX?=
 =?utf-8?B?Vjk5NnRqNStVUWNDbUd0ZTk2dWlCd21vWFJYb3hKNzUvWUY1RUV5a1VyUlRj?=
 =?utf-8?B?cHBXWjRRbUI0TGxVUTFwL2FDS3RxU2g1SkJjZVl1VmFqVnVLT002WGRnVFYv?=
 =?utf-8?Q?o9XOup?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8152.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmgyaWhBQW5Cd3ZKNXg0d2Nqa2k5RC81ZVVjM3Y5YmVya1l1anBzZDB2MExD?=
 =?utf-8?B?eklPUGFsclV4eHZYWDdoVTJaRGJGRlpPTlBWdGxrQXFjVS80T3ZYckMrVmFJ?=
 =?utf-8?B?VUp3MmZaNGZrbVZSM3RuTE5RN3RmSUJabE9pTUtTVFBUWGN4Q0habjhEYk96?=
 =?utf-8?B?YURCdVhXK0U0UG40MFhEdHA4SnBlV09MSms3MGFLUlpnMHdhMWQxbjlZOE85?=
 =?utf-8?B?Y3U1V1FpbkVMRnJVOXF5V0REclpBbG5qK0RSdGhxS2c1NHMyKzFEYVlRQWhy?=
 =?utf-8?B?cXk2SEx1RVdjY0diQ2N6NmIyZTNBVFdSZjJXb0xITUpEbDlMRnRrVk9wa0N0?=
 =?utf-8?B?L1gydGthcnBQK0MyRWFaSjBMdG81RFRrWnhBWDJHcW0yY24vbWtKaSs2ZXQy?=
 =?utf-8?B?cWNWMDBuRSt3c2JhOVFLRzdiUFlaN0QwNEl2cEVSRG9ZWTlwZWxzSEtMMUFl?=
 =?utf-8?B?UkllOE1YWVk4WFhCeWNXaDFRVEJjR1NoaXRlMksrSVRDNFFKRjVwanV3bVlP?=
 =?utf-8?B?aVpZR3MyUUd3TGtDdktnTVp0Zng3RFhQZXZQdEpaQXB2N2M4eEZGTjRheGhv?=
 =?utf-8?B?bjRkSTVlMm9CMGxUdEJVREtqMkJHZ2ZOTk5BV0ZGU0JSM05MT0JCK3d3VTlM?=
 =?utf-8?B?T3JOdmdpVGRveEQzMDBoa2h0aTR3UVBnYnNka2YyNE5lK29xd1FVcGFzYXVM?=
 =?utf-8?B?NDdRclZFMUJvb2J4d2NzVjJ5V2JtM3hvRlRvczlWSGNQQW1yYWM0SWh3RTJq?=
 =?utf-8?B?OEtmRkVpR1BscTdaSEVMeHE0eXRiVngrUVJxNUwrSlFNbDE4TlJiMklENEtD?=
 =?utf-8?B?TEw0Y04zTVdIUTI4NjdjRHEybG5vTHJHL0lvaXNUQ2FOektaTTgxd1kxcXJM?=
 =?utf-8?B?WW1VSjBLNHh5dVNhWUlLUDE1TDQ3VG5uMExxeEtxbU9ROVc2K043T3A0V05C?=
 =?utf-8?B?bG1SdzR1QnlqV0JjUGtqcThwYm5ZSndTaGpEOXlGQTdWQ25tV214VlJ5WGRH?=
 =?utf-8?B?UVVxRk5RYWI1N0RVMysySlAxTFR4SU8vRnYzZUlkVXhBc1pvbS8vZkR5UHgv?=
 =?utf-8?B?MTlQdE9EK2JIWnJsWXk3QmVYeVR4QXBBLzg3aHd4dEFneXdxSmQ3T0RsWWZW?=
 =?utf-8?B?VUdtcFJvL21BSDhhRFp1ZGhrNmFNajVSNDhGa0FGUVc5OGhWTWliZHpKWXFN?=
 =?utf-8?B?eEFiK1Z4N3duUlJZdnpaWG1RSjNzdDd1T0VkMklkNXk1MUxnN3BoWWZDSkM5?=
 =?utf-8?B?eWVxa3FJbUhrZGxLUjloNHphVi9maVdmOGtqbVp6VkQ0ZEU1aXBNU2NlaVdp?=
 =?utf-8?B?K0pkczA3aG0wNmZQNXZIY2VPY2VXN3Ercll2WmdHTWJNK0VMZWk5dWNtUkJP?=
 =?utf-8?B?M1RhZnZubzJWdFFLT05uNTFCREh2VVFpS0hIdWxBUndRUm9DakxCZFJNSnFF?=
 =?utf-8?B?S24vM3lkblBERjA5c0UwVVhXK3VxbUF5eEJnamdWTEV3c2xoK1ZYaVFmUnly?=
 =?utf-8?B?TVA4anVoK2pSQW1ydGVhZVRVWXJydjVXekFEaXFLaUJzcVYyZWR6bDNyK3Nm?=
 =?utf-8?B?SXJLaDZnZFlkRFRUN3gvQlhyUHRPMEhsWGpJK3R6MDJNaWFVdXFFdXlDRUpN?=
 =?utf-8?B?dlpkU2hROER6dUxJbkJPYzNaNkFsUVpSMDAvUXhtNlU5MlZpbWZ5bDNQSUhu?=
 =?utf-8?B?b3M4ajBXSmdXS2JidkNkeGNWUDJHNm9zbXlMSUV2b0hJYk5zYkhJNlFlSGxF?=
 =?utf-8?B?alJ5Qk1NZGM1MjVTZlExdHluZEQ2Sk5DNEdvWi9hOTM1OHV6Snd1M0I2SWpV?=
 =?utf-8?B?dmUveFZwZGlQeVdhL25sRGdIWHhXNWpXNU9peHVaaDU1K3VNMml5N3IvSjN5?=
 =?utf-8?B?UVltVlllYkMvYUVCTlh3SEdoYlNiS2NsZFo0NEh6Y1V4M3l2K0lnNU9LSkoy?=
 =?utf-8?B?TWF1QjZCRGNhTStZNGVGd0xIbnQwRU0vd1NsdE11MjI5V2lTaDViTmlKZ0Nj?=
 =?utf-8?B?RFFMWHo2bzV5NnhzRHZYNmJ6YTRDTVUwdWNTdTNBUkV2SkpwUGxqT0VqcmRo?=
 =?utf-8?B?WWNaK2U5bFI3WmJYSmhURXRldTJpd2VWakRkK3lBekJRVXplVjI1Nk5BYVcz?=
 =?utf-8?Q?KfEdq+x4qMezcg2lQPaRvZscH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2d9ac7-0e48-41b1-29a5-08de1d0d60e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 08:20:43.0297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZqHYVSUdPyxHCgJ869m3V1N4QHaIzPvuaCnw6Y/nS6kb8iYkWlZgx8F7GFA5db9uQO7+F7GCTAFyF92YLpzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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

PkZyb206IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4N
Cj5TZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNiwgMjAyNSAzOjE2IFBNDQo+V2hhdCBhYm91dCBp
bnRlbF9scGVfYXVkaW9faXJxX2hhbmRsZXIoKSA/DQoNCg0KR29vZCBmaW5kaW5nLiBJIHdpbGwg
dHJ5IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2hpY2ggbG9va3MgbGlrZSBoZG1pIGF1ZGlvIHJl
bGF0ZWQuIElmIGl0IGNvdWxkIGJlIHJlcHJvZHVjZWQsIGEgc2VwYXJhdGUgcGF0Y2ggd2lsbCBi
ZSBzdWJtaXR0ZWQgdG8gZml4IGl0LiBUaGFuayB5b3UhDQo=
