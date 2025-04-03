Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A87A7A88D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278210E2CE;
	Thu,  3 Apr 2025 17:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1eQKZal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2C210E2BE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743701253; x=1775237253;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=7Z1k++wY4IQXRzefVM47lhfXvyE6jSmgNNEFS6CLk2M=;
 b=h1eQKZaluhvXlfkXF8yrpJf2lvWKKoOZLcSKvLHebKf3ofUNGyjXIRje
 XsJDrf8X09IoFAtR17AD15b5q8Ne9fBSR32yNJaV6mVUhIDWumWsh0Ve7
 trjA3Oy6IFP3WMgpXSeclTBtLKhfMvIbWhWh7/HbWsuGKbh+nm8q+jWBo
 JrhZoSAQMCV/rbNfuBJhV3wW6DFLKnH+BRmGEraQC6GM0mqGWh0CYr/FO
 GCUD7+woS7nFR4picThR+xlBROyp/elLV8Ikk20SWVMSrHK2fAO3bbA+c
 9LJ08cvCPPVL/gzslhtWtGoLHs2VNhncUm844G6CyK0g/ty4sbHD2murm Q==;
X-CSE-ConnectionGUID: P2WTKPxoTC6/z4O0P0SnQg==
X-CSE-MsgGUID: K8uIMbnsSMme6LY6dXJgmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45038129"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208,217";a="45038129"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:32 -0700
X-CSE-ConnectionGUID: 03rxJzQNTx+p7bnMRVm1zA==
X-CSE-MsgGUID: ZRW2tsUISmm+ntsG2/X42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
 d="scan'208,217";a="127597420"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 10:27:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 10:27:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 10:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjxLXaPY0Qg2PtB608bynlwMBtn/zs3+x+VwGf2SGnNvQ//bboqQnMch1j/Po0MMg2T+g1GopQWmuCOOS07Bi74DBJ3onDu5+uMi1qzIjx3txcjCLS7Sv+Ip8/WlIGm3dBREsxnm9xiZgFWaTlynueeOUNColypjpoiQqK093rPgFpXyPaQ72wvka5/ZikDiTY74pbX829BoyoDCpFnKW7d2wlN9nfiDSNZBtSFzj1+Q0CzO37KF1BjRHqaOdV534zJgjyu1lz6wBtFqHTvAndXmXccqMOyDmoB+lW3ruKftjWZ6le2ZLBoS8X1WxHYo5q/XpVRdapK+BHHrWBPY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBv6GHFdhoIYirjKE4gjbeCwWODjhBN78KsCrMQxYQM=;
 b=ns5ji1YF3p5rBWsAP1mIjXFauByjbhvLgnc1KSDA+IYhLqPMO3s/EcuLtbE4JlzRI4qzQ/m926g0NAxNjTXlBGF61EVh2/XW58Z6KYuONvWhafM7RU7MvS5Iu4vcmOD9o6ePO9B20xe8G2Fx0zwF5TUXg2KRKClmLKsj7821USQe4Kn8jCYBdsXiIxvy5ERDAW6g9BLASphSV9JHOghDGd69jVOQKCOV0UetIuY+dObpgBvC7UIsjO21/I8O5GeBo4T3pMwDNOZencK3fsVD74josvCc9IskcI9JXIwo1BaEDeNiW9EASVPOFXHzIFk350a1E9U6Od3Q5pDJi7meCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:27:28 +0000
Received: from PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd]) by PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd%6]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 17:27:28 +0000
Content-Type: multipart/alternative;
 boundary="------------RZe0ET7MS7Wq0pZzuF6VQd7Q"
Message-ID: <3d25c68d-3358-43da-a930-a322d764ba34@intel.com>
Date: Thu, 3 Apr 2025 19:27:21 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v6 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-5-tomasz.lis@intel.com>
 <1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com>
Content-Language: en-US
In-Reply-To: <1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com>
X-ClientProxiedBy: FR4P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::7) To PH8PR11MB6707.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6707:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 960be77b-39f4-45f5-e894-08dd72d4ce01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJEQmllTG9CTXc0dCtydXlpNDA0cEZnN1pSZ21OdUc5cjlmMVBnRnpIbHdN?=
 =?utf-8?B?V1o4QmpFUTMyOGthSWtQN2tXcUlHdGdibUVtVGJTWng3VVoveFlCeFVWNGdI?=
 =?utf-8?B?bUlueUthd1ZiRFlUV3Eyd2ZjTlI2L3RmbjVLUUhQeVpVVkhJNmw0NzYyVThR?=
 =?utf-8?B?eGtPTCs0V2pZanE2Ry9YQVRHay9IR2tma0xyZVljUTRKUUFvQWF2KzBFRGpS?=
 =?utf-8?B?cXA2STVHdzFTQ3lYR2ZhYXpzUU9SLzRaY0dQbEh4ZXkvWURZbFkrV3RGbXRM?=
 =?utf-8?B?ZFZGMTV3T093TlZPN3pISnRYVUNwYy9KK25pSFBKSnBwM0RuVW10V1BMY0Ji?=
 =?utf-8?B?STBwZWVXc2hZWm9oR3lqVnRrYStQWVpQUWVTT0NlU0tHajdTTnpkQ0pMTCtM?=
 =?utf-8?B?QnhYSHV2WCtqdnhGSWYwWWVpSklBOXliY2hKVmhxWHRQRUM2QUNONmRvYWtq?=
 =?utf-8?B?bC9Vam5IZnRjZjkwUjFpYWZuMFFzMW9iK2FUQjEvMzRMOTFsMkJiZUNVeXJ1?=
 =?utf-8?B?ckw4WEs3c1B4T2lpckYvUXlaOEVBRDd6K0hteUhnWVpZZkVQWmNPRUpUOUQr?=
 =?utf-8?B?Rm9SSGp5YWt2dFY4R0J4U1JJU0VUUXNTUWgwcWhrVWF3SGhRdjg5MFZ4em1Q?=
 =?utf-8?B?azlaZ3RJT0FDc05hOUFuR2NNT2NoOTRJU0xSRUFtRFE3YXlrZTJYcUxVWEk3?=
 =?utf-8?B?enhHenNJRzM3WnJYbVRzOHBDUW9kYmQ2YmhML05GSXl2MEpkdUNBR1pYNnhl?=
 =?utf-8?B?elo1RDR3aEZ1OW53RjZwdmRHNFV2V3dxaHUyT09jbVZ4RnJwVGNFSzVHUjFn?=
 =?utf-8?B?S3Bxc3UvMUE3U3gwM0hNc3BSQmxNdW9yV0F6RU14dWRmUHo2eTRHN0NUSk95?=
 =?utf-8?B?dW5kblVINCt2cnUwbTh2NHRnK2g2cit6OHlmTGU4WFlMTEJ1VnoxOUFLa2RX?=
 =?utf-8?B?ZDIyY3lLTVlFZ0JOOExHbm9FNzBTY3NWdkU0ZS8rR0JwaWNWbHBPT09TM0Nv?=
 =?utf-8?B?RU5sTVNnZTdQSjZYdVBlTWNpQmE2bWM2SjJrOWo4VzRyWmdhdVJpdmRkWWRB?=
 =?utf-8?B?VHZJYlZJUjBBTFh5ZFlXdzBkd3J6RXlmRmRSSXovVGl5c1FwUTNWOW9ObWFO?=
 =?utf-8?B?dW02NnVBVHZTdWZuZTNqVWlPODQ4QVNqNlQzazBTb0hrcmRCdEdYVW9lVmFT?=
 =?utf-8?B?UWQ0V3orYmJaZlRJZCtkem5OMWhBR1VOYU9tWVBjcjdYRU5aRytudjhwNlIz?=
 =?utf-8?B?bEFPdzNYREJ4MVJZUUNTbWQvaHByOG1WekcxMGtzcEdGejJuN1VqQ2kyZ2h4?=
 =?utf-8?B?YVdCQjI1OVNlTTZHSGt1SVlScXl1S1BtZEx0UUxTR2xyeDZtZjRDRXJqWDls?=
 =?utf-8?B?Y2NjL1VzdlRRbWcyVFBaOHNaNFZtWTlIVk5VbEtQOVc2U08wYmxJR3M2dzRH?=
 =?utf-8?B?T0d0b0dEYTFodzc0QU5EMWUxZkdWQlEwb2dUQmEyY3Bia09rSzJnenFpTDI4?=
 =?utf-8?B?bkZTSitEQXZoMUlEbnA2bUhwN2pNeVdvalpZNjZBdVJtVjc5Rmltc1RMajJl?=
 =?utf-8?B?UXBHZEgvcndFT1dWRklobjE0c1ZLdVpCYWYvMVRQdERtMHNJcUR2L0pqNCsv?=
 =?utf-8?B?RllxMWtFUlZ5RjAwTno1MFJwL3ZObDJQaGZHS1JjK1hLbTdCek4vQjJPamdn?=
 =?utf-8?B?eE1aZTF4YkdJS0sreUtoOXhkYmg4UGtiNW0wdHp3aFFKRUFZdUQxNE1HTmpH?=
 =?utf-8?B?ckhCcy8zbXlYeEpLWjVMWWczenA0eDNyRmcycWl5K1FwV2U2Q0tlMFZWVDB5?=
 =?utf-8?B?S2JDbDhId3Q5aituTVp2bVh2R2k3bDd0UDE2MVZZeU04NXdqR0owUnJCOUxT?=
 =?utf-8?Q?SIjuQAVRcoypJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmxVeW11Tk14YzN5L1grYUJGVjhVNUhXTUI2aUtNM0d0ckRxWmp4ZHlRUXpm?=
 =?utf-8?B?TEZPWGxrOHRLcTdDbzExU21LYitzeUtWN2xTL1BzUWRZYlhDS2hUZ1B2eWZP?=
 =?utf-8?B?MTRGdlNzd2kzZEgyK1JBa2JwQi9EUmRPdThncWR6akkzY1lHbGxDOXVlTVk3?=
 =?utf-8?B?WjNkWkhXV2dvRmV3M2lHMHJmMTYvV2psN0pGWnZvc1VPNFpCcWg5ckhIQ0pK?=
 =?utf-8?B?U0dGTHZDMzdxQjdWK2Z2Qi9NUkZXYk1rUDQxbk5McnZlOURHN3dhcXJkcjdX?=
 =?utf-8?B?Ym9rdDlUSEFmY1RRTkljcXhDYmtRU1ZOdGg5bTJZSDJSMDkrTUJsdTgxd1ow?=
 =?utf-8?B?bkFxSElOc0p4c1BaQXl1bTBtenBQVE1ES3hQL3h0am1zeTZuNFk5c0EwUURU?=
 =?utf-8?B?Yk5Wa0lwQ2luUzlwTlpHYlJrblEvWVl3cm45OEZtYk81SjhJTVY5S25BQ2FD?=
 =?utf-8?B?RTJJVlY0UTcrcXNUNXdwb05iT24xZU9KTU90aXp6dHE3L0twUklpOFZJQk5O?=
 =?utf-8?B?V211Uk04SEVTeFdBMjdKeDVFSEVjZ0R3NlJWMWVYdjNpWHh2RTVKUSt4YzRw?=
 =?utf-8?B?dktHNmZ6a054UEMxSEoyRXA1TXpGU0cvalA2YmgzcDhlem5EcnI5UFV6ZHVF?=
 =?utf-8?B?QUoyeDZPdlU3LzE4M28xV21oNmZHZUJkOW0ybjhxWTdKcmtWRmtZZEJxY2Vt?=
 =?utf-8?B?ZUtUY3F0ZjhGOUJTM1lnbERWYVN0QysxK3VnZGl2QzZPaEJQdmJ6NmxUbjIr?=
 =?utf-8?B?am4zN0h6QjQ4R0xCWFBGc3RZcHdZZHhTQUZpS1RwdklNT1B2ZC9RWWNPNFhI?=
 =?utf-8?B?U04vQnJONHMwRUdhQ0xxUWowbEJBWWR2ZmJDb1JJM3NSQXRIQmhQMzJUVitS?=
 =?utf-8?B?djZQVTgrcitMRHdkNnJIcldUdGdVcUxOdkN2ZHZUQ2JXTW03VW5WM01YYXlz?=
 =?utf-8?B?cVk5WWRKL21iYzgwVFJIN2orVnllT28zQ0NTTlppMWc5bGxaZ0N5SnFid1Zk?=
 =?utf-8?B?eW5BakM4b2htbGtTYmRrZ1Q2c3Z1Sm5jWFo4OUJrYVYwSTVzVVBtRkthOUdl?=
 =?utf-8?B?U3NFMmFrYXpqN2hpMCtGWkY1S2dad3hoUGtiVzB1ajBYM2RsRlFVZHBkMnNj?=
 =?utf-8?B?d25WeVRIQktVQU5FVC9PRXVhRFpXaUZwZnFZcWRveHNXc1NwbGVkTEtKM0Ji?=
 =?utf-8?B?eVIvU1BqdzVxRnpzRnRUWXZXdmtHQkt6Q3lldlYvYzhMM05aK0dVQis2am5L?=
 =?utf-8?B?N29KOUFMYmpoR0l4S3dvdnZTREg1SmNWcGV6SzhxckR2OVJKMlliYW1ZYjdE?=
 =?utf-8?B?NDRqUnlUNTNNTXE2STBsSFV2TlVyNHhYSVhqMld3KzhIMVR2RFpjRGt2QUlU?=
 =?utf-8?B?aUR4RWJ5TEVoamx1M1MzOXphQTJLMlg1N3FzM2htWnRPa1RnNmVPeDExWWFx?=
 =?utf-8?B?dGVSY2Rrem9EZ0xqL21XMzlYQlpQb2x5YytTZnRHMFZGV0plTnBWL3ZNNE9S?=
 =?utf-8?B?M3JLODcrQVdodWdOU0podlBiVlhhemt1TkpPMmpXbjFYUEpiTzFxVmVTT1F2?=
 =?utf-8?B?U0xGWFg4VUh1dTI2VnJKUUtHWk5Lb3M2L0JmZzViS2c5M0dBTjF6Rit0TDI5?=
 =?utf-8?B?QzlSeUZRcEtXNldFZDArZXNHdUFxcUlSbjQvSmJpV3dudUpjRUVwbnFjQjRr?=
 =?utf-8?B?cGZJYXpjelF0endlcnY3d2E4aWVRSmEvNndkbDloaFpRdlhraXNTaDNHVXRF?=
 =?utf-8?B?OHRNL2VVVWVlWUwvMjNQSHEycmplN2Z4U3ZmUVJDbzZnZTRrdVF2ZmNQYUoz?=
 =?utf-8?B?QWhGQW52YzBvQyt4cWJQVHFZTjBZTlp4QnowVXA3SEZGN0U0VlZTMktCeVhk?=
 =?utf-8?B?WWM1UzlaNm5pRC9xSUlFNWNIcS9BUWdmTW9yVDgxeHRXQWswYXdud0MxbmdX?=
 =?utf-8?B?WXJIVWZES2RGOWtPeS9Pemw3MU9hTGl3TzdTbGcyUVhkMHRqRFY5N00wQUU2?=
 =?utf-8?B?VWtiNDhYR1p0SWIxQ1RtYWhlYSs3WkMrWnpwV2RseEhQMm9HZmFrN0JrUUhW?=
 =?utf-8?B?bllGSTRVRmlwVjkyKy9lWUFXVHE3Q25OdGhTMVY5dHg4R1poWlBXYjlrSmNt?=
 =?utf-8?Q?kAnYjWOP1egS96ns63xp2npEr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 960be77b-39f4-45f5-e894-08dd72d4ce01
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:27:27.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DU5iprEKHTDqcgeJNDME98j0CHjnKt/dvV12+Pab2US2k7gMIBj2zR8Lol8Qd3esSp8gLuGEgIYzYO8FGloIVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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

--------------RZe0ET7MS7Wq0pZzuF6VQd7Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01.04.2025 19:25, Michal Wajdeczko wrote:
> On 31.03.2025 15:21, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
> can you add some FIXME to the code to at least mark places with this
> missing locking schema?

This patch doesn't have much to do with the locking.

Are you suggesting a wider change of introducing FIXMEs to the code for 
each part of every new functionality accepted by architecture?

Treating ggtt locking differently than anything else seem questionable.

Also, what do you mean by "at least" here?

>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 142 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  25 ++++++
>>   3 files changed, 169 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 686fe664c20d..6c80106e5e8b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1622,6 +1624,146 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static u32 xe_map_rd_u32(struct xe_device *xe, struct iosys_map *cmds,
>> +			     u32 head, u32 pos)
>> +{
>> +	return xe_map_rd(xe, cmds, (head + pos) * sizeof(u32), u32);
>> +}
> this helper as-is is little confusing as it mimics the xe_map_rd() but
> changes the meaning of the offset to index, so maybe we need:
>
> #define xe_map_rd_array(xe, map, index, type) \
> 	xe_map_rd((xe), (map), (index) * sizeof(type), (type))
>
> and
>
> #define xe_map_rd_array_u32(xe, map, index) \
> 	xe_map_rd_array((xe), (map), (index), u32)
>
> both defined in xe_map.h and then use:
>
> 	foo = xe_map_rd_array_u32(xe, cmds, head + pos);
will do.
>> +
>> +static void xe_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
>> +			       u32 head, u32 pos, s64 shift)
> hmm, this can't be "xe_map" generic function, see below
>
>> +{
>> +	u32 msg[2];
>> +	u64 offset;
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
>> +			   2 * sizeof(u32));
> in general *) CTB messages could be wrapped at the buffer edge so you
> shouldn't assume that both dwords will be always together, and in other
> places you seem to take care of this case, so maybe do this as:
>
> 	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
> 	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
> 	...
> 	offset = make_u64(hi, lo) + shift;
> 	lo = lower_32_bits(offset);
> 	hi = upper_32_bits(offset);
> 	...
> 	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
> 	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
>
>
> *) currently xe is filling CTB with undocumented NOP messages, but that
> could/should be changed any time, since it is sub-optimal in case of
> sending larger VFPF CTB messages

Right, I messed it up when moving from normal memory access to those 
`xe_map` wrappers.

Will change.

>> +	offset = make_u64(msg[1], msg[0]);
>> +	offset += shift;
>> +	msg[0] = lower_32_bits(offset);
>> +	msg[1] = upper_32_bits(offset);
>> +	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
> we don't need to pass this, as it is always has to be ct->h2g.cmds, no?

That's true, we don't. Same as with ggtt_shift which you insisted on 
passing to `xe_gt_sriov_vf_fixup_ggtt_nodes`.

But for the similar reason, we are passing it, now in both these cases.

>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
> same here
as before, this is single message level and this parameter is required 
for logical consistency in layering of functions.
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
>> +					   struct iosys_map *cmds, u32 head,
>> +					   u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[1];
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>> +			   1 * sizeof(u32));
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		xe_map_fixup_u64(xe, cmds, head,
>> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
>> +		xe_map_fixup_u64(xe, cmds, head,
>> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
>> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
> hmm, that looks ugly, maybe do this part in MRLC case and then fall into
> common case like:
>
> 	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
> 		n = ct_read_h2g(ct, head + N_CHILDREN);
> 		for (i = 0; i < n; i++)
> 			ct_fixup_u64(xe, head + HWLRCA + 2 * i, shift);
> 		fallthrough;
> 	case XE_GUC_ACTION_REGISTER_CONTEXT:
> 		ct_fixup_u64(xe, head + WQ_DESC, shift);
> 		ct_fixup_u64(xe, head + WQ_BASE, shift);
> 		break;
>
and then `if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC)` would 
be still required because it has `else`, everything would be just more 
convoluted.

I'd prefer not.

>> +			n = xe_map_rd_u32(xe, cmds, head,
>> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
> beware of the wrap!

I don't understand.

The wrap is needed because of these cartoonishly long enum members which 
I never voted for.

>> +			for (i = 0; i < n; i++)
>> +				xe_map_fixup_u64(xe, cmds, head,
>> +					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA
>> +					    + 2 * i, shift);
>> +		} else {
>> +			xe_map_fixup_u64(xe, cmds, head, 10, shift);
> magic "10"

I assume you're asking for creation of another set of those 
`XE_GUC_REGISTER_CONTEXT_` defines.

I disagree these are making the code clearer. But will comply.

>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
>> +					 struct guc_ctb *h2g,
>> +					 s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 head = *mhead;
>> +	u32 size = h2g->info.size;
>> +	u32 msg[1];
>> +	u32 len;
>> +
>> +	/* Read header */
>> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>> +			   sizeof(u32));
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + 1) % size;
>> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
>> +	*mhead = (head + len - 1) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
>> + * GGTT offsets in their payloads.
> nit: "by ..." part is more appropriate for the 'longer description'
> section of the function kernel-doc
right, will update.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		 head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 2eb6b8d8a217..9a1b578fdd03 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,27 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> this function shall be defined in xe_gt_sriov_vf.h|c

ack

-Tomasz

>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +
>> +	return config->ggtt_shift;
>> +}
>> +
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -219,6 +241,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
--------------RZe0ET7MS7Wq0pZzuF6VQd7Q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01.04.2025 19:25, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <pre wrap="" class="moz-quote-pre">On 31.03.2025 15:21, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct-&gt;lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">can you add some FIXME to the code to at least mark places with this
missing locking schema?</pre>
    </blockquote>
    <p>This patch doesn't have much to do with the locking.</p>
    <p>Are you suggesting a wider change of introducing FIXMEs to the
      code for each part of every new functionality accepted by
      architecture?</p>
    <p>Treating ggtt locking differently than anything else seem
      questionable.</p>
    <p>Also, what do you mean by &quot;at least&quot; here?<br>
    </p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: removed inline keywords, enums for offsets in CTB messages,
  less error messages, if return unused then made functs void (Michal)
v4: update the cached head before starting fixups
v5: removed/updated comments, wrapped lines, converted assert into
  error, enums for offsets to separate patch, reused xe_map_rd

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 142 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c |  25 ++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 686fe664c20d..6c80106e5e8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence-&gt;response_buffer = response_buffer;
@@ -1622,6 +1624,146 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static u32 xe_map_rd_u32(struct xe_device *xe, struct iosys_map *cmds,
+			     u32 head, u32 pos)
+{
+	return xe_map_rd(xe, cmds, (head + pos) * sizeof(u32), u32);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">this helper as-is is little confusing as it mimics the xe_map_rd() but
changes the meaning of the offset to index, so maybe we need:

#define xe_map_rd_array(xe, map, index, type) \
	xe_map_rd((xe), (map), (index) * sizeof(type), (type))

and

#define xe_map_rd_array_u32(xe, map, index) \
	xe_map_rd_array((xe), (map), (index), u32)

both defined in xe_map.h and then use:

	foo = xe_map_rd_array_u32(xe, cmds, head + pos);
</pre>
    </blockquote>
    will do.<br>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+static void xe_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
+			       u32 head, u32 pos, s64 shift)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, this can't be &quot;xe_map&quot; generic function, see below

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	u32 msg[2];
+	u64 offset;
+
+	xe_map_memcpy_from(xe, msg, cmds, (head + pos) * sizeof(u32),
+			   2 * sizeof(u32));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">in general *) CTB messages could be wrapped at the buffer edge so you
shouldn't assume that both dwords will be always together, and in other
places you seem to take care of this case, so maybe do this as:

	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
	...
	offset = make_u64(hi, lo) + shift;
	lo = lower_32_bits(offset);
	hi = upper_32_bits(offset);
	...
	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);


*) currently xe is filling CTB with undocumented NOP messages, but that
could/should be changed any time, since it is sub-optimal in case of
sending larger VFPF CTB messages</pre>
    </blockquote>
    <p> Right, I messed it up when moving from normal memory access to
      those `<span style="white-space: pre-wrap">xe_map</span>`
      wrappers.</p>
    <p>Will change.<br>
    </p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	offset = make_u64(msg[1], msg[0]);
+	offset += shift;
+	msg[0] = lower_32_bits(offset);
+	msg[1] = upper_32_bits(offset);
+	xe_map_memcpy_to(xe, cmds, (head + pos) * sizeof(u32), msg, 2 * sizeof(u32));
+}
+
+/*
+ * Shift any GGTT addresses within a single message left within CTB from
+ * before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">we don't need to pass this, as it is always has to be ct-&gt;h2g.cmds, no?</pre>
    </blockquote>
    <p>That's true, we don't. Same as with ggtt_shift which you insisted
      on passing to `xe_gt_sriov_vf_fixup_ggtt_nodes`.</p>
    <p>But for the similar reason, we are passing it, now in both these
      cases.<br>
    </p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">same here</pre>
    </blockquote>
    as before, this is single message level and this parameter is
    required for logical consistency in layering of functions.<br>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[1];
+
+	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+			   1 * sizeof(u32));
+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		xe_map_fixup_u64(xe, cmds, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC, shift);
+		xe_map_fixup_u64(xe, cmds, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE, shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, that looks ugly, maybe do this part in MRLC case and then fall into
common case like:

	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
		n = ct_read_h2g(ct, head + N_CHILDREN);
		for (i = 0; i &lt; n; i++)
			ct_fixup_u64(xe, head + HWLRCA + 2 * i, shift);
		fallthrough;
	case XE_GUC_ACTION_REGISTER_CONTEXT:
		ct_fixup_u64(xe, head + WQ_DESC, shift);
		ct_fixup_u64(xe, head + WQ_BASE, shift);
		break;

</pre>
    </blockquote>
    <p>and then `<span style="white-space: pre-wrap">if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC)` would be still required because it has `else`, everything would be just more convoluted.</span></p>
    <p><span style="white-space: pre-wrap">I'd prefer not.
</span></p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			n = xe_map_rd_u32(xe, cmds, head,
+				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">beware of the wrap!</pre>
    </blockquote>
    <p> I don't understand.</p>
    <p>The wrap is needed because of these cartoonishly long enum
      members which I never voted for.<br>
    </p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			for (i = 0; i &lt; n; i++)
+				xe_map_fixup_u64(xe, cmds, head,
+					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA
+					    + 2 * i, shift);
+		} else {
+			xe_map_fixup_u64(xe, cmds, head, 10, shift);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">magic &quot;10&quot;</pre>
    </blockquote>
    <p>I assume you're asking for creation of another set of those `<span style="white-space: pre-wrap">XE_GUC_REGISTER_CONTEXT_` defines.</span></p>
    <p><span style="white-space: pre-wrap">I disagree these are making the code clearer. But will comply.
</span></p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
+					 struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 head = *mhead;
+	u32 size = h2g-&gt;info.size;
+	u32 msg[1];
+	u32 len;
+
+	/* Read header */
+	xe_map_memcpy_from(xe, msg, &amp;h2g-&gt;cmds, sizeof(u32) * head,
+			   sizeof(u32));
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len &gt; (u32)avail)) {
+		xe_gt_err(ct_to_gt(ct), &quot;H2G channel broken on read, avail=%d, len=%d, fixups skipped\n&quot;,
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + 1) % size;
+	ct_update_addresses_in_message(ct, &amp;h2g-&gt;cmds, head, len - 1, size, shift);
+	*mhead = (head + len - 1) % size;
+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages by updating
+ * GGTT offsets in their payloads.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">nit: &quot;by ...&quot; part is more appropriate for the 'longer description'
section of the function kernel-doc</pre>
    </blockquote>
    right, will update.<br>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &amp;ct-&gt;ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
+
+	if (unlikely(h2g-&gt;info.broken))
+		return;
+
+	h2g-&gt;info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g-&gt;info.head;
+	tail = READ_ONCE(h2g-&gt;info.tail);
+	size = h2g-&gt;info.size;
+
+	if (unlikely(head &gt; size))
+		goto corrupted;
+
+	if (unlikely(tail &gt;= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail &lt; 0))
+		avail += size;
+	xe_gt_dbg(gt, &quot;available %d (%u:%u:%u)\n&quot;, avail, head, tail, size);
+	xe_gt_assert(gt, avail &gt;= 0);
+
+	while (avail &gt; 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &amp;head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, &quot;Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n&quot;,
+		 head, tail, size);
+	h2g-&gt;info.broken = true;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct-&gt;state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2eb6b8d8a217..9a1b578fdd03 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
@@ -158,6 +159,27 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">this function shall be defined in xe_gt_sriov_vf.h|c</pre>
    </blockquote>
    <p> ack</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:1c70ffbe-f5f7-469d-b03c-cee277f42391@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+
+	return config-&gt;ggtt_shift;
+}
+
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
+
+		xe_guc_ct_fixup_messages_with_ggtt(&amp;gt-&gt;uc.guc.ct, shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &amp;xe_device struct instance
@@ -219,6 +241,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (need_fixups)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------RZe0ET7MS7Wq0pZzuF6VQd7Q--
