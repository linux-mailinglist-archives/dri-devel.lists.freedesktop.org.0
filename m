Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7139A790CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36710E7DF;
	Wed,  2 Apr 2025 14:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDl5BP41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1255F10E7D5;
 Wed,  2 Apr 2025 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603125; x=1775139125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uaLN4nN20No4hlqhR8aptXwXK/u+iL2XHrALmgQZwS0=;
 b=oDl5BP41gbseldogLl/T2h8Mj28RsuORY0cuSSyRKbLMDe3D66JCsQrE
 ERPg6d5TynWc7cDhM/aJLjP2j/pEEBxjEgAuvG6LaqMQYA/z6ayIJLlP3
 V9P/811NRQhrLwbKIBglpBb3JuxuaOD+6WR0QHQxdD4HD8RnI01aCqHZv
 lH10F/XTNDOQXYtfUuaQE7fA8uvHyfWf10y08c3+22qmMAXogbTqElOoo
 5dglSH4uaw5v9tEEZSVxg/DUnS5m3op1repjG/hURdgKps323LdpuqCBT
 1UfAGPg5oihERi+lrwcGxrnehO8dxBp1e71hRtjB1LEF/YRoz7hUChy4/ Q==;
X-CSE-ConnectionGUID: wR9gkG20Tf+BqyEEO9O15A==
X-CSE-MsgGUID: iUEbcnvpQDuzJddPX+ZZ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677119"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:04 -0700
X-CSE-ConnectionGUID: K65Rh4/nTGykMFe544unRg==
X-CSE-MsgGUID: EQYVioqSQNGWD7KUbDm9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620412"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 07:12:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXepFsafiueFt7PGwcuGDFmYoLjQux3ufss4IhlDP4yyRNHfjJAK4dzgFvwg1MnoCk5KUZEXk1xF0oIwXxccvaPIsesGYKPfjrbji3t/Eoxo9jwBaGf0dVf2DIIrknSuG3Q1DXuxe+XtTICnvicWyB3fMcLNC22c+8Kmtd4XGfNHp//osrJsPiqkQoemSfW7hlmHxf6ZBg4LcWD0f38mH77hPyYcUKpbrCL9SkwwAGubNv4aKC22n2brPGiTtVf+HH0DHpqedmVMLEyC2C+SsAGzrIFB5LyQMU8VAdd108UFgtgpWqUVQMsdTgk1kbmjRaR9eDvR5/n37+QgLOG7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsKKFgSfS7ckipDxTfJ2D+IUjygo2mbu6zEOktC19AI=;
 b=ZewczICKeERUubQFqRyyCpssyW1Q+77Dq5HjdiPqxtWApmMleIHQrLllGBs/pUO7ANEw8n2TLnJZRI9nJv7CX8AzWfRjK3ddrCxzMaAwDYR1ixF4sLGTbmTprpoGbf3BWuRJwwreB6ufmxPZFNhWruSwX78QErAeMT/eJyqMYoq8dgq8gTrZUUxBoY7H9VUJfDnNXPP4O++UXl1+Tp1dpFr2yaII7SsoR781mJ1XJmx4gKFrguMO4e+Tngk1e4XbflRqp0UtZCvyOCQ2tes3OWU9YpjPNkBncSaomdgfthPzMtv4lw9+XmuLyHQRDEY20jBEI8ZS0KnDv8VVIXMZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:11:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:11:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Date: Wed, 2 Apr 2025 16:11:17 +0200
Message-ID: <20250402141122.2818478-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0154.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::38) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cab7dc-89ae-4bbe-84ff-08dd71f047e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFkQmR0dG9ZK3F3Yk9SN3NleUpydUttbkdHWW5TWHhBOVpWdHFSV1c2YTR3?=
 =?utf-8?B?Zi9vV3A2U1F3a09JNWhmNHZ5MDRBeHI4TDZIY2UwNXcybUFkbi83ZEhvUDd0?=
 =?utf-8?B?NWtJdTNaYVlYZWM5OVBFWUVGcEJnRGtsc3NXN0t0ZzJ1Ty9zNU1WQ1hEV2dP?=
 =?utf-8?B?SmRSTm81M0tlVVkzbzNLYWQvRHZGY2NFOGpZUlUzQnhDUWVENldaaFFZRUFM?=
 =?utf-8?B?eG0xbU1IMlRneThaUzVEb3g1ZG9HZDJ1T2FuV0xGOFYzbTNTeG1NZG10amlx?=
 =?utf-8?B?ZHJnU09tZDVuTm1mWm9oMlh0V0EwNUV2dU9OZHFTZHRjZGwrZWdYeWFXS3NX?=
 =?utf-8?B?ZHlzZVAxSS9TRlZ5NXNmUEFFS3Buek5VUk9saSsrUUptS09FRHgrV0Uvcnp2?=
 =?utf-8?B?T3pES1dIVFcxbHFDYk1RZVcrZmJEL1hOZUt5QzZ3TTNFbXlVZlJXSXRYR0w0?=
 =?utf-8?B?bTZBUkwzUUJqUXRyeVY0WWFleGNiREVDeWR3WWplWHFuU3kwNFlXRnFoU3hh?=
 =?utf-8?B?ZHJaR3FYbUh2eTBPZXBDWFg1S0NDQzZraUNncC9LcEVqZVNiZnlmRFIvcEQ2?=
 =?utf-8?B?VFU2YUgvbDB3M2NhRm1uZnNoNnFpeWxwZmNLcWVsb2doNUNXTm16MXBkajJP?=
 =?utf-8?B?N0psZFRZT0lxZWgyZzhyR1ZSSHdtZThsOVFQSVpOUjlCbHJBUzFUcVg0V2Iz?=
 =?utf-8?B?VUUxUDVHUlFKcGhodkF0dlFkZG9ZdjQrWkQvOUI1UlBOaFovTXZJZ0JnMExG?=
 =?utf-8?B?SW13WDg2TGZyL0hwb204RWM2MDlWbzdkcVJwcE5RZmlseStxUWwvU3dLUXNl?=
 =?utf-8?B?dDVyVTExR1oyaXA0Zk0zcVFrQWpCSzlRUVE1OXpLRHIzQ2FHYUJWdy90VERj?=
 =?utf-8?B?Y0pibmN2MzVtand5TzJYNTBtS25yVjh3V3Rxazlic2FaY2NKM2xNNzA5dnpC?=
 =?utf-8?B?WldnQlJZcStuZ1NubnRQNzNsVTMzM24wQlpDTzA0YTNhRkJpMnRSRUxuVVp5?=
 =?utf-8?B?UUhqdlM5YytEMWhSMWJUa0NDbTJ0RFNUS1VNbHpoRkhsQWtXdHhyWDlaNDli?=
 =?utf-8?B?Mmt6MzZzRStDT25QNkYwalljdkt3MG1relhPNXNsL1ZXUFNGZXhQbk1Qc3VW?=
 =?utf-8?B?QXlKSENrNjQwaXBNbFpjdVJwNWJ2Rk54UnpDZUVDRmZZTnR3WFdJaVJzVHNi?=
 =?utf-8?B?d216TkJHVUZ5WS9RRGlCam5OSDJqUTV5a2JMMlF2eHFEUnVDdm10eCtYUTlz?=
 =?utf-8?B?cGxCY2wvZVpGd1lzVnAzbkJaSDRxYVU0cE54M09jWE9oK1NaSithSWZNYWdm?=
 =?utf-8?B?aG1VYm96L3VJVFVrOTlSZ3ZvMkpjcTZuSGV6Mkh4dFBUOU43TWlpRDVDYVVp?=
 =?utf-8?B?Tnh1aXBVak0xN1R0bm5wN0VkREZEUGFESDhzV2tDcUd3c0tRbWpFaGZwMk1z?=
 =?utf-8?B?THAxNlZsWU50VTFkVHdZaHo0ZTZ3REk3OFF2UnJ5Y0NLbFBKRWtuL0JVT25C?=
 =?utf-8?B?aXdyRFBacXUvUU1zb1pIZDhma3NONlNza2RnSWlEUTM1aXBiODJuZWdpWHZ3?=
 =?utf-8?B?YUhZVVFiYk5DOXZTbDZHblhuZlgyQWVqUWF2U2VSaTFuMXI1MVRuZ1BKUzkw?=
 =?utf-8?B?NlNzMldiZ2VPKzVKdGJoNXdYQnpKUlBlZE9QeElNT1ZZeHU0dUNzUjdNNHN0?=
 =?utf-8?B?T0d5Z3JuMVBIVG9SVkNYbVNQUnc5WWZGTjN2UnJsN1RKQUlHNnNVaUluOGtJ?=
 =?utf-8?B?dndmd21pWEtnQlE3anJtS2RYaWY4aWNKQjZsQlFoL0JCd2JiV2d3Y2srVmlI?=
 =?utf-8?B?VWdtcEUwWEkzR20xSWlOL0pYOEgxbGhEK3NjUndkRW9icjFuS1R5UHc1K2xY?=
 =?utf-8?Q?8zdO79m5JKFAP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aktmMk5uZXdUZkN0dHFSRXloS3V5d1JZMFk5NXBpTnJocmJQQWoyM25ueWg0?=
 =?utf-8?B?d2YzWHhyb0x3K2tFL1JndGlzbW5XRUVONmJGZVdJcHJadHZkVCtGSFNiUlZT?=
 =?utf-8?B?MnlJM1IxUkJmWmRleElHUmF2NmJIcHdsTVhSc05QaGltdHFrS2E5d2dXNERh?=
 =?utf-8?B?MUJHVEFFUFVGSll3Ymw1bmg3ZTVIYXcwY3BoTW5OdXgrUldwaHIrcGZyeE0r?=
 =?utf-8?B?ek5yaFRCNkxjY2lXWHhKd3l4b1RDcTJZYWZ5cnNuU0htZTBnNUlSRkozeE1V?=
 =?utf-8?B?R2pScjA1aGpyVzhCb1dzTGtoNnhqdEwxbUxWT1NWNkFOa1JWRW1QNTRvVHRo?=
 =?utf-8?B?V3d4aTBNb0RKUlozVE9LbDdPcnlONndPSnNmMTVFQlBJS3ZFSlRza25qRDJI?=
 =?utf-8?B?TmFBbXp2TnhReTI3TGlPWG9xTmQvbzdVOGtKSkJZY0F0bmNlUDFJbmJrVWlU?=
 =?utf-8?B?dTZud1ZpY0sycnVjRFRFZ0ZlbGJOWTJna08vS29LWFRNaDJzY3JVeFV6Zi9t?=
 =?utf-8?B?T3ZMeDZBY0o4c3BVaHBYbjN6SDZXWXhaY29YUm13VWFFQURJdkNzMS9WRDBO?=
 =?utf-8?B?d1FGZ2dLV3pkYnVvem9JdGJwekR5dnMyVXZvR3ErN2MyZnVRSkN1YVlzTEND?=
 =?utf-8?B?MkhKS2R2dVkrSk9YZnpoZnBOUS8zOFdjUkRkMzgvNCs4dEpLMEZpUTNhaW1Y?=
 =?utf-8?B?eXl5dERrcHVZQ2ZGdzJLYWZDanovcGM2VjVJZGlVQW1yVnEvVUFPb0YvZWJj?=
 =?utf-8?B?MFNlL0pkK2ZSYmxBcGZVaU1Xc2d5a3BwSHlWOTI3cWpFckQyVTVtbUZ0cGFV?=
 =?utf-8?B?UmZmWjJpWUdlRUk0OW4vWm92aVJjb3BaSXBZSWV2ZEZqRzhnbDlQdmR0VThh?=
 =?utf-8?B?b3dTN3ZyQmt4UTUrK0VHMG9GRGcvU2F1MVVLUkdMWjg3TUR3bG1Zb3ZvdTVa?=
 =?utf-8?B?bkZRakNqOFBHUjhYS0ZGYXRBVkZWRUZkVjNFWCs5THhCRExEdFFaY3M0WWk2?=
 =?utf-8?B?Sy9FSStKbmlpclU2T0Ztc2FHdlpJQ1VKWlBITDB4S0FoaUl3L2VjaGgzYzBr?=
 =?utf-8?B?Qm0yYmZidUFIUEcyL1o5WXIycmJBcTRaS0FIb0tXMG8yQlV1NjQxMWlWbm5J?=
 =?utf-8?B?Sk5jY3RqM0NyN1F6US82QW1qVStvV3ZqNXpaVmNBbWRTbUJMY3ZPWHozZlpj?=
 =?utf-8?B?dmo2SnJVaWVVQWt1RWY5S0JNa0Y5cWlWK2RXRm5DSnZtUzF3KzJoREwrL0pk?=
 =?utf-8?B?cjlSZThDV25qK3cvWTN3akxDOFJaNDc0b2NoMVI3cXZ1SllURHk4VTc3YUZP?=
 =?utf-8?B?UXBpTkF2S005U2EwMEcxU0hGT3pGRnZjdkVkNHk1TjlJWmNxaW5uY2Z2aXQ5?=
 =?utf-8?B?VFNmTkNuSkRMNHUzMHNaN2xCdkdGZTJCM0xZTDFEbGdrT2FuSnNvSFFlVm92?=
 =?utf-8?B?YnFUN2FUSW03OGVETVZmODB3aFBvMTkxek9kTFJkb1F3M1dwN00wOHI0OGFK?=
 =?utf-8?B?bzBBZVIzcFdUdEZrRlM1VGxrWTNGNVpuZHVJQmRDeGVsdlVwOGNoaW9JVXl4?=
 =?utf-8?B?RWhqak81MWxFZEdrVVJMMG1vOFBsaHJnSDlSQ2lHbnQrQWtyRkVWTUVXTElQ?=
 =?utf-8?B?c1dSekZNN3lQNTJkT1pNV2dxKzc5ckhmVWdvaEwybnQyWUEzR1hlQlhNTnU3?=
 =?utf-8?B?RUVQQ0d6ZVk1aXk1UGJGSEJma2xHZlNHRmdBcGkyK1FLUWdXa3BTMzh3TUEv?=
 =?utf-8?B?ZGltL2VDOU9qbjRmZmF2dmcwQkUxbFZIdTZOaXpZdkFBZVNEcUxsMGRBWXF0?=
 =?utf-8?B?N2FqMEVMN1dNRWRNWmVLOWhhRCtVcWpqa04vMDQ4Q3BGellEVTMvTFdldGpL?=
 =?utf-8?B?aG03U0MxMk5EZ2huZ2FHc3h3UHovbEIxTkozS2prVjRYM2V2dGtLWWF1d2Jy?=
 =?utf-8?B?aUJ2RHY1SUVlM3VlMjBjRWFoR05GZTlCMVdyeWxWdU42OTVvRTVGSjlqN3dy?=
 =?utf-8?B?azBjWmNuRlRKeTlYR01uKzdMZzRSTGlXYlg2N01rTzRZZjRISGg5V2pLUDRy?=
 =?utf-8?B?RCtXMWVZWjFwb0FVMnBMZmMxbWNEVHRxR0tLK3FwRmkxQzV5a2tXZzljTWph?=
 =?utf-8?B?VVNGM2VmSkZwdkI1WUV6dUVCeGh6TkRsNFU0QnhLK0xPMzJkckhjMU5NcXgy?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cab7dc-89ae-4bbe-84ff-08dd71f047e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:11:37.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcSmQ8YV3/6TVd6dcMzqkD4luMXq7PoGpEbhdfbzGkzSwHpwapIlNHt+esER5drVwGeJ7QaioNpZaStjEbhaN3SbOnUzFAcZcw8sfAdntOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR.

Add the capability ID and restore it as a part of IOV state.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
 drivers/pci/pci.h             |  1 +
 include/uapi/linux/pci_regs.h |  9 +++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10693b5d7eb66..8bdc0829f847b 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -850,6 +851,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
 		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
+	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
 
 	if (pdev)
 		iov->dev = pci_dev_get(pdev);
@@ -888,6 +890,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = dev->sriov->vf_rebar_cap;
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_VF_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_VF_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_VF_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_VF_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_VF_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1047,8 +1073,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62a..adc54bb2c8b34 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -482,6 +482,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index ba326710f9c8b..b2d5f3ac79ae9 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -745,6 +745,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
@@ -1140,6 +1141,14 @@
 #define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
 #define  PCI_DVSEC_HEADER2_ID(x)		((x) & 0xffff)
 
+/* VF Resizable BARs, same layout as PCI_REBAR */
+#define PCI_VF_REBAR_CAP	PCI_REBAR_CAP
+#define  PCI_VF_REBAR_CAP_SIZES		PCI_REBAR_CAP_SIZES
+#define PCI_VF_REBAR_CTRL	PCI_REBAR_CTRL
+#define  PCI_VF_REBAR_CTRL_BAR_IDX	PCI_REBAR_CTRL_BAR_IDX
+#define  PCI_VF_REBAR_CTRL_NBAR_MASK	PCI_REBAR_CTRL_NBAR_MASK
+#define  PCI_VF_REBAR_CTRL_BAR_SIZE	PCI_REBAR_CTRL_BAR_SIZE
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
-- 
2.49.0

