Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74975ADF89E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDA310E549;
	Wed, 18 Jun 2025 21:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXHhTlsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12110E549;
 Wed, 18 Jun 2025 21:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750281616; x=1781817616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=30g5iy1S/SYl9RoXVLtSnlLZgZmbej3KoeLxQ66SG1c=;
 b=FXHhTlsa8NFz+WN8B+1Aa0Cx3wwjC+wry4mT1FKRwkCj1QiNoHj9WbeM
 TWv6jgPt5f2ColHKLyYeYUqzbjdGZdFJt0RmlAls1JvZW+wz2aUHMT0GW
 OFt7hmPH0NwC2E8TXWK1Ba8F8WFHPM22chqe1tVeCEJlgJaK8SPyDhfxJ
 KQGLje8FSzFVJ5iKfb/Qu9uFBD292+Cq5wodGU7zKbdIty4oq58Vb+964
 KXFyQQS88kLx35GD+p9D1gSv3QqOplfh23EEYXNyKfoymt5GOWnvjvi93
 YK48pn7klCud4xj20qOaUz6B9ZSFFdWgqWtlypiWa66x8Bql9gLJlhVmN A==;
X-CSE-ConnectionGUID: keWA1+ewS3KOnRHUT8GjFA==
X-CSE-MsgGUID: zl/lbT88SDOErDtjbWTkQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52604664"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52604664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:20:15 -0700
X-CSE-ConnectionGUID: eeyFIup9Sse9JLWLrLya4g==
X-CSE-MsgGUID: OnBOtb7yRLKwWUTMj891eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150859202"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 14:20:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:20:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 14:20:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 14:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtSK3wQyBmrVePxYMfVhjbmP1Bf8RTPeY0qFj0mijfrMDpUTEMVw/S0GtOK8nEm46658Zh3n7Ra3IDT/sWQXQytc20AL5n5SSjWfcr7yqTCpf8+fNhoczKFOLmHEv1rmcNd98oOUAh3tFIx+dDqISEvC9S8Y7RwbGK8n83hGNzNjNX5TMIOhalr4doUFkhHNSOaQZE+Q41F+lXOF2A+j1SrxWLLGCG+A0KPluxzC0LN5ufW0fycNJjrhfhKZWDyL/+E8n4buIrD4KGCuOLDObUtWhaAYlzov6JW5nrlirFY+jLzlTvRQy9OMm8vSXBYJEcL4fKxZNaCND9OveRHHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCV7MAYZ3cQf6auy1v7hduPS44yX+Zg7oEoD8v1B0sw=;
 b=hJrCT9k/szwiG8IVFI0Vq2MwFUCdwcfu+VPiQ1pw8nIc6uijXMOpnJHUQJoKW7kYXVpdK0v7GFLcYu6MzQz2UB0BrUj/p2J0eYrMGbSt2NvO2Cn54ShOxemme9TtWfAE+rNcgw7ZncPJbKKs4XBgf3b6cP+YF0+RmlLaZSmTGmtMlNlMS0RXosHosVXuY9sq/M08xF/juKnNEY4wH4EwTYGU6k0UUrwYWhOUEAmMdwIAI3k/NX7kehhJ2FCig8/41rE8aeP+kcZOMj/7a6/St9eY0Jy57p0D7sJokM48OeuNQp0VKuMP/9wftvphRZpIztriK/7S3jfRwxPPZt7a+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 18 Jun
 2025 21:19:57 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 21:19:57 +0000
Message-ID: <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
Date: Wed, 18 Jun 2025 14:19:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-9-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250618190007.2932322-9-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: a86404fa-02cb-4af0-8cea-08ddaeade090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDVBQ3NzZmxLcktUL01DN0NQcEt2TDh0VkUySmhjNURFVlpEZFhTR003K2V1?=
 =?utf-8?B?bk52aHBmUUJaSlpRMlBXanlBRmdrejlVcEo0RFIwenpSb3JQYjlLYkVSNDJ3?=
 =?utf-8?B?U1BXSHFUUm5FMGo5WXA4alFSQUUzU1loemduNGZKVm83N1lueGtnK3ZSWWlh?=
 =?utf-8?B?SS9zV3J4RktHN0pWT2d5K3lCbmk5Ny9zUlVXQVprT01vMXl5UEx2Z1lIQmRW?=
 =?utf-8?B?RGUrQlZHdWZyMitIUWw5YmFmUUMwNjNhTThDVFZvWHVwM2c5WEs4TE02MzN6?=
 =?utf-8?B?YjVNZE9DWTZsazk3eEdlenNFWVQvWnJYWXdyYjlnMS9GUHdRNmwxYm1ZOWth?=
 =?utf-8?B?WEU5NXJoSmdxR1VlSEF2d3c3TUZKVXdxclpjN05oTzJzYW96TVBsY2JjOE9H?=
 =?utf-8?B?eHZLTE1kUnhib3E2bEJTMUVkd3AwRnRpeVMrYWMrTFBYd1kvdVRXaC9PRFZJ?=
 =?utf-8?B?c0syWFBWaGhQVVp1elc0bVdxUUlxTGJQdFc0RU5yRWpaMmhHVEVHSXlKNXF5?=
 =?utf-8?B?a2JWSEFtdC9CeDNZNktudFFUdlZmR2wzZ1p6L2xmYk9wNE03Q21tb05GSnVU?=
 =?utf-8?B?KzJpTUV0UTZDZU44S3Z3SUt5eklGeHBURWV1Tmk3KzROYm9KN3Myb3BSQ3V6?=
 =?utf-8?B?WU5FVXZSMWI0OXR2VG5oNkU0b1o2OTJxdFFwUHZiejc1M2xIMzB2L3NJaEVx?=
 =?utf-8?B?N3BKa3JNNWxINys4Q0liSW5iSUpoTllxMlJEblQ3VUJ2a2NuNWxNOVVjaXZo?=
 =?utf-8?B?UVFLbUtrYm5ZcURYQU03Ym0zMFUvR2JBaE9ab1BOR0orYmpBTmh5TWRsZjZM?=
 =?utf-8?B?TDI4Y2F2T2Fib1F2WDhtcE96ZXJzbENrVWg2cnFSMmsxWWxvaTArajVuOGx5?=
 =?utf-8?B?S2h6ZlZSZU5peVFDajVyRVExYjNRN0I1cDJvVHU5aWliS1RTVVQ4VnBHUkZs?=
 =?utf-8?B?T0kyRzBiUTR0VUg0b1NUTlpMYW54RE0wODduYW9ZNjdmNnZJWXdBVGl6bzMz?=
 =?utf-8?B?TCtMcGNMSnZTdUZaY05BWnl0TVo4ckp6c0Y0T0ZQcWdoTm9Ub0RJMW5BN2Ra?=
 =?utf-8?B?SkJwR0FUdmwyVUdESVg2Sys4blZzYVNlK1dDTThuTTRiZVJ5UUYwbUxTQU52?=
 =?utf-8?B?TG40dCtwcnhQbWNJaFZvbER6QlRpN3FhSjJydGc0V0FXaG9kaWwvL0JBL28y?=
 =?utf-8?B?NGVMMWpNdVljSmFuT1VzWjlTZkIycXdpZnE5S2FxQTd4eGhMelBReVVuNlZX?=
 =?utf-8?B?eUU1WDJCcWJJSGgwenowRWJpeWc5WXVONitGcUpVUW5ia3JhSU1EdVp2cms0?=
 =?utf-8?B?bzFVZmtDckpRL2k5KytNeTFKeDdCOUE2N3ZSWE9FeVJqdkVzQWpoWjNOMUhn?=
 =?utf-8?B?MDBjQ1RSNzIrbkw4MEhHdUdySk9pTGVvRGRvWGFlU0U0Z2JDWFhmWlNOUkJP?=
 =?utf-8?B?eld6NVhBdUJwZWs3WExzSExjZ1c2MHBSbHptUHA1NkxseVZXNnRCVjNUSzhK?=
 =?utf-8?B?OWtaTHJZV2RyQzFmRGVFdFN1bWRsMHJGNlBZeWQxQTJvd2RhdmdhNC9iWkZw?=
 =?utf-8?B?WWJldDJXNm5uTGZJZDRtdDMyV0tLbFUwZzVrWitwWHVEUU5PN3RZSnJLTjMr?=
 =?utf-8?B?U09mTlU4U2V1dWJzdU1oNjZ4N3RiaC9pOUQxRzY2b29yaVgxWlJRVXJMbGVR?=
 =?utf-8?B?cTd5YURydW11bzVHSGFnM1RjOVBSVTJadHlJcXpwcU81VVArdUQvTnBmZmJD?=
 =?utf-8?B?bkpJMEVZSFk3SDNaRWJ3WnlEbWdhTTFBME9Vbm8xb1BsbDA3bG9xT0FpcGhQ?=
 =?utf-8?B?N1VSUlkvaVFxeUp3Z213aExYTW5LMDdNb2hIdER3WlVnZGJHK0hHQk5ITDFt?=
 =?utf-8?B?QVlVNzgrc0Y1Ykx3aXZibmdmMXJtRWhwZi9sVzlibmVWVFY3aFFWSUh2Mjln?=
 =?utf-8?Q?8KQqVDmri/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amFUL2Jsa09LSk5VYXE1MHZJNk12bTZEdUtmS3J6TTlYdVo2dlFVNEVSSWtr?=
 =?utf-8?B?c3p0Q2FOQ1l5c1BtK2VNWHJ3Tm1RaHpPQUdZOCs4bHdXYkZ0NElDYUpvdjhp?=
 =?utf-8?B?OEE2S1RQS0tYQXVwL0hWT0UyNksySFlLUkdUOUFaU1VDSXVGQmRBS3pUM1k1?=
 =?utf-8?B?Z3FGWGc1UElUdlZBTTRLWkNHU0p3T1owSEhyZnZYNVl3ektheUgwNnhocGFs?=
 =?utf-8?B?QjIwaXpjU25XblozaEVSMU9hMDlsZXBRaXI3ZTJpeEdvbHR4YzY3RG5BaHha?=
 =?utf-8?B?RHo2MGJvUTRGVlY1elIwVVgyd0dRcnVKcWRzazArNXpIQnlvNWwyRXp1TFFP?=
 =?utf-8?B?bFhiSXVtdTVBVE5SQ1d2Qm8rV0hBaUxOTHNXSCt2L2ZUcmlJVHI5by9LU1dY?=
 =?utf-8?B?cTlRWHFKTk9hdGZobFVVVTNNUUlhd3hLM1dKNi9oOUtsVEpaS1FLdDN6N1V0?=
 =?utf-8?B?VURTR3FaQ0lvNmtXUjk4OHliSVRRNVUrRTFTQldlYXExM3l6eDFYdnVWcnhl?=
 =?utf-8?B?SGZHSmtoY091dVRkY1EvM1FlQ2EvMkpDTmlHWnlxNzJWS3QzS1d0aXZBK3Rq?=
 =?utf-8?B?aDg3SDUrUEszcFo1RUJselZja0Jxa1pXaXRyZ1EyQU9Wa3dpRlpITGxXcWFI?=
 =?utf-8?B?d3o5Y05VcE5zeDdKd3RBR1RKZ21zWWkzc25YNFZ2QzA5RXVuVXhkMDhGcmww?=
 =?utf-8?B?TkxSRWtSZ21ubnhJMDVLQ2pqU0x0SUpiTXQ2VjZsRk9jVFUwc2FnSFNYb0ty?=
 =?utf-8?B?LzBZVC85UFN5MnVaMVlkVWdCOG0zdkJONFRrd01CNktxdUJiTUpQNWcrWVV2?=
 =?utf-8?B?K0k4RHdEMWlrcjdJak4vZGdwd3BhZS8xbVpjTHN1Q0FIWElYZHJ0ZnZoQUNY?=
 =?utf-8?B?SHJBeFFpNHNkSFhXMmpuejYwb1NncWtmT01FU0s2OHA4azVJZkdlMGs2THBX?=
 =?utf-8?B?ZkNkTDlBTERNRVVpajNjbERSUUY0WEpURGFLa0xPT3NpclpOeUhrRm85WEFD?=
 =?utf-8?B?UVRmbjFrYWpGckQwQ1NyWEZ1SVQxNUNYLzBwbjZlSnVlZk5veDQrMkVDTmZK?=
 =?utf-8?B?N3BhR3lVcWRVaHRWU1RIa2ZTYXo2SzJUQ0E2YXVEb3dpMVd3V1d1QmNqQVBK?=
 =?utf-8?B?eXRxN0FRQUJteVRHSkZJVWtjUm56VnlaaXFvT1RzekpQRTgreFdGUjA0bnF4?=
 =?utf-8?B?WXk0dDE4U2UvYTN3T0Mrem5LWEpxZ0pMRUJTZWQzM0NTVW5sQzQ0MW9FRGE0?=
 =?utf-8?B?SGlZcjNpZ3lacnVvZVV5eStXL25hWEtKSXJxOWcxMlBkb0J4YXZJT2VRTWt2?=
 =?utf-8?B?dkFpSWN2alpSL0VlYnAvbDBSOG8xUTN2V2VEMHg1V0VCSkFidGYvN1ppaHV0?=
 =?utf-8?B?Zk1VeWowaTNtT3hWcmhjL0lvaXlsdUErUGFjakpWY1FvRGxQTHZhWnhWTmds?=
 =?utf-8?B?WVpIRDE1dHA4UkNxUGVNK0NZVXhPdGJMbXBqYzVhNXR1R2tLbGJYdWJDaXV3?=
 =?utf-8?B?ZmhEeVdEeER2U1FpbzVJSXRZZEJnbU5FdVZ2bWlzNG96SXJ3WkNSalY5ZmhF?=
 =?utf-8?B?L3gzc1REeGdsL0piUUdtTUJsUjYxSldUci9pQXdtenVCZG82VzNJRjUydDh3?=
 =?utf-8?B?U2Y3YzA0eG1rVnJNL0Y1ZTY4TmIrM2pZOCtxeXVwVE8zNkx4UUNENnRZMGxX?=
 =?utf-8?B?blFWZWdtRUluaUtyVEhZNDQzbWNIaktmN0tYOHRrK3ZnUksxRHA5Qi8zQUNo?=
 =?utf-8?B?L1JXUEhvaUw2TGFkeVRaV0FTTTlJWkszMUlEdzQwRjBGUHIvZDZWd0ZXc0Fr?=
 =?utf-8?B?K1ZVWHdLRTgwZHFTb3EwSkhKOWVjZXJOYStyRDhHemVJRiszcTNoUVBxQk9u?=
 =?utf-8?B?cWRRS1o5dGhBZ0RRMVNCTW9EeGE3MGRJb1VGeGdlT1dxTytNSExtRW9aSkRX?=
 =?utf-8?B?SkUzT2cvUmFLQU1jV1d0OFRSeHhSZGdmNUZjcG9ONjRHd1FiQkxuczFPVVNw?=
 =?utf-8?B?Z3RNYloySnQ2MCt3N1dITnFlUWNONjQ1RDNpMFhGZ1A0MkthcjNPZ0VhRG4v?=
 =?utf-8?B?Z01FaEtHNlBqTnJlYXJzY2FDMy9FblUrcU80Qy95RWc4QjlLWEhFdTg2bVkv?=
 =?utf-8?B?cFRrZ2prS1FnREc4ZWxMQjVvT3BtVTlWVlcyL3M3Yk80dFpUcmNtT2tYUDhE?=
 =?utf-8?Q?VwhG0ubLyQAHa8oKqXlfpuc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a86404fa-02cb-4af0-8cea-08ddaeade090
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:19:57.7923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft3bV6DWbfHmLzK6q2VzH6XYu2EV9I51ku91e2pp9QVisU0uUaAyQTTsXuMuVDKRgR1YrTgLLIww15o/PFeIfdNkxE2RTBmhaxZriEINPg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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



On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> Introduce a debug filesystem node to disable late binding fw reload
> during the system or runtime resume. This is intended for situations
> where the late binding fw needs to be loaded from user mode.

You haven't replied to my question on the previous rev in regards to the 
expected use-case here.
Is this for testing only, or something an actual user might want to do? 
If we only need this for testing, please specify so.

Also, what happens if we suspend with a user-loaded binary? userspace 
doesn't have visibility to know that they have to re-load their binary.

Daniele

>
> v2:
>    -s/(uval == 1) ? true : false/!!uval/ (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
>   3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..d1f6f556efa2 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -226,6 +226,44 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	char buf[32];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	u32 uval;
> +	ssize_t ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> +	if (ret)
> +		return ret;
> +
> +	if (uval > 1)
> +		return -EINVAL;
> +
> +	late_bind->disable = !!uval;
> +	return size;
> +}
> +
> +static const struct file_operations disable_late_binding_fops = {
> +	.owner = THIS_MODULE,
> +	.read = disable_late_binding_show,
> +	.write = disable_late_binding_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("disable_late_binding", 0600, root, xe,
> +			    &disable_late_binding_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index c0be9611c73b..001e526e569a 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>   	if (!late_bind->component_added)
>   		return -EINVAL;
>   
> +	if (late_bind->disable)
> +		return 0;
> +
>   	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>   		lbfw = &late_bind->late_bind_fw[fw_id];
>   		if (lbfw->valid)
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index d256f53d59e6..f79f0c0b2c4a 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -71,6 +71,9 @@ struct xe_late_bind {
>   	struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>   	/** @late_bind.wq: workqueue to submit request to download late bind blob */
>   	struct workqueue_struct *wq;
> +
> +	/** @late_bind.disable to block late binding reload during pm resume flow*/
> +	bool disable;
>   };
>   
>   #endif

