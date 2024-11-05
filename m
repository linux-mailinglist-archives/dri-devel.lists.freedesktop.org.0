Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348679BC6FC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 08:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985710E40B;
	Tue,  5 Nov 2024 07:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X27zcYSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71010E28F;
 Tue,  5 Nov 2024 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730791717; x=1762327717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SW6QItFINA4jatfGS3xS9L337ZF9MPUosXMJq+rKCqU=;
 b=X27zcYSn57TLcBJWfoxCPJ+tMqSZbCyaSNYpSM0wq4yuWnMwjGZVDgGH
 xM8UhaMxfF//grMiA9RFmf3n1KNX9Z+sqF964rNb93i8hFza0uRxpsNSH
 /3HN5BJa5iu6egMKg9XJ6eEaeRZ7bRyD2uYp3PytUTh0clC7X3g+bOFsn
 gOK7WCvSxg7SbiBebvrJ+N1ZDmJq5DfueyF7mM3f3FgCxkHi0Wz8ZjUo0
 C47xEkNjD60UfJ3wa41ETgMqjnVqo4dOoUjqW0jTFEl2Tq6HmleCYP89B
 wlSPwsa647z4R7vv5hdij1fMbC2M5m04EieiAPMYGOMzYGHWcSZ9PxmmU Q==;
X-CSE-ConnectionGUID: UvbOocpqSAW3zMXkcl/Qdw==
X-CSE-MsgGUID: usojLaS8TsePWDcTND0oOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30745209"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="30745209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 23:28:37 -0800
X-CSE-ConnectionGUID: Hq0hi+IVRrCeT25RDsZyCw==
X-CSE-MsgGUID: esaPTqruRS6kET77dn4ILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="84242156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 23:28:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 23:28:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 23:28:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 23:28:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym/2A3S95oAE1dfW5w1vJnsMx78PKx4emTsHKclV3/T6FnkUqPBOvIDO2nWhAyX/5DbI3i9D9sIuq5BVfK2AIHKnQPJJ5iKwHfln9jhpyEZxssOYxUpVP2Eux8/JSm4mVCLksGhzHNuChxKL7UDfi/onsKXynwEftyEwsXMotQHa9DQ9rY9H0MeVvCLy3eUKY0TTIVFLQRcJEQyQGJSCfY7KYll4+mqYMHzDoJFf0U/47AAOOCHbsDqURqHxwOgTqrhD7oSLteACzyrL2UbQu5ZNlLWVP8NbeFsNZ/2Nfsh8zDfsKXEH+LwXHCfCskk41E8oHIDG45tE1QcT7VQvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YEz8ggfiQWX43sS83d9hGXJ2TILe0efsyzpIfWnfKQ=;
 b=Gq6DcqpKkAQ04NhTbH0K59BVkfIxNebvAdcXXhpNcHCw/CaPdhqD3oIRbris42Zi6reYW3Diu8O2KtWnOSx+NeAphuJzycUDPfUsGck5QDOHyCURwim8K6vqGlGvbmBB2IJPuwwaoKFporcRWctJvxFjF3HdyPVfvF20l2CRaBMUUWZyNT7ET6bVLcPDxFUfPzoNmi0JKgPA3c/Vwg2tljOKkjy6FBabkMEkr4ELHpLnLUrf0dTmsziR2ACBrpRCCzeubC7EOimnESA5pTQKXX9YNIJyMjsUyybOp5VzZ1vXHrH9uQm4T3fltH1Cp4SUeg04jJNdGfcj+BFqHATQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:28:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:28:34 +0000
Date: Tue, 5 Nov 2024 01:28:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/xe: Fix build error for XE_IOCTL_DBG macro
Message-ID: <p3vspkvcm7nq3gankpblloudrumenpcuflhu5fpdse75kcyyk6@w7adi7togz4j>
References: <20241102022204.155039-1-gye976@gmail.com>
 <hdffht6z6a6dnap7kpbg6w5hyiftgahpiyhidvgga4qjeiw5xz@wu3ca5tvfj3l>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hdffht6z6a6dnap7kpbg6w5hyiftgahpiyhidvgga4qjeiw5xz@wu3ca5tvfj3l>
X-ClientProxiedBy: MW4PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:303:16d::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd968b2-e7ed-43e6-5bc2-08dcfd6b74c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODVCVmtpYVFIRnlzK3loeDZrUklsNCtZL29WeDB3UENrSDRYOUdnWGJraFUy?=
 =?utf-8?B?dHBGTlZzbk1ubjBDbHB4SGh6ZzRlTFVscTgreGRObldiNUlRK2FDN3NnM1B3?=
 =?utf-8?B?NEdWamQ0UE1UZUordGF5RkpCVXB2ek5pUFA5YXYwREpXRHkwUU5Sb3Nvdm81?=
 =?utf-8?B?ZnpaK1o5NS9rby9vTEJvaGg4RVYvQ2Fkek9WTnBFcC91OGxuVFBWbGorWVlU?=
 =?utf-8?B?blRLVC94NXgwM0lQcXd0TXNYcjVmWHpvcGxjaGhxK0hrdm9sSTVTcWIzZWVE?=
 =?utf-8?B?N2NIRk9oZ3M2QnIzNjlGWllYdzFyUlhvQVUvUWd2dUR3UGpiMlFJTWhPS0pP?=
 =?utf-8?B?emkxeHp4NGxPR2pFVzJPZEVlQUVHbm9wZUxDVGlpSTNKNUJtUUxwQmx1ajNY?=
 =?utf-8?B?Q29WRjdUeTV2SndicjlWUUpRT0lDMXdKb1VZMHQ0R2VxbU5kSUVTbDRHd2Rn?=
 =?utf-8?B?ZUFBWnowSzY5Wi96dFZ1eGFrYlZXQmZHbng5b1B1TmtEZ1ZlWlIxVnc3c0dV?=
 =?utf-8?B?VC8xa3JyaUltQ1hVUUJoNmpQcmVuRVkxakZ2NE1CQUhNSE1iYWtJallvNDk2?=
 =?utf-8?B?ZFhFcDdZaUJGbXI4Nm1NZ1BlWVNUL1k4U0dranZiVkFyRVJZdWRTbUIrSDdh?=
 =?utf-8?B?WWovWlQrRUtiV1FEeDNWRDdNWVc2ZU02T2J5d0Y5cHBLdVFZV0VYb0N4RlFN?=
 =?utf-8?B?aXdTckNZa3VhWmhYTEM3WFZDSFRkM1UwQlUweWRkWUhqNmJYTjBlUHJHN1M0?=
 =?utf-8?B?bXVpNDllRWhkeVZEWFl2MGJYNjZWbHd4TkZPRXdkYXVhSGdETTZQbjdyblYz?=
 =?utf-8?B?VytNYW8yVEdKZmNzZ1c1M1hTcmhieFlheEU2YjBYWFR1N1dHckU1TGFEODYv?=
 =?utf-8?B?OFRFd1JMRUFDUUFwNVFDQVY3VUtKWnJMb0pZdTEwY1Z2anlPTGdnU3MwVFNl?=
 =?utf-8?B?d3VNVUNFcmVuY2NUQU9DMEdDRVhEVjR3TDRLRFVXUjlyT1BtYjBNVXhHS20w?=
 =?utf-8?B?SnhOdWMweVNmeEJzZ2FYVi9JbURmR29GZE1XRUErRTY3NisreTRqekZUVTFC?=
 =?utf-8?B?YjhsRWtiWXBhY0Nhb2NPVXp0Z0F6NXVheDRsMWxvL0cvdHlHbFo1VTVqZlQr?=
 =?utf-8?B?L0NTZHhSZU5HMjZybnpNNTNjdlNyNWhTc3J0LzdEbFdkcGw3TC9aTzFncnox?=
 =?utf-8?B?WldzMHBobXMzK2tOQ2tZamxuUUN1bUFKemszSC81U2owYnAvejFqMGJTaFhU?=
 =?utf-8?B?WE1PMUQ4Zk5LV2xLTE5UVE93dnI3enlMK0dBZXRNTzBnV2l4M2NsOWJYU1ZG?=
 =?utf-8?B?bG9WZzNETW1DTDc5ODEzdzNlYjdBZWNMMjlLNlZxdWhBM1RWSEczZDRFQjh0?=
 =?utf-8?B?a1l5TytnQVZhL2c1a2xCL0Z2a3FmTnIxOGIzQi8xQVFUaEF0ZTBNSEdJWGpB?=
 =?utf-8?B?YkVjZTJlVTFlTi96WHdwUFBpMlk1YjNRaWxQdW1zZ0o2QWcrREg1aDNDcG5r?=
 =?utf-8?B?TDMrYWtKVzh3ZHkrNy9IcVBwY2RqSXZ1dkRvZkY4QWlzL01ObXJkdGdpTmRh?=
 =?utf-8?B?c3lRTzBsN240OTRUOEVyamZPTG1IdVNsNUg0VTFmYVZSanlkbTRRSkVyQ3pX?=
 =?utf-8?B?UTEzeHY1THlIM0ExbmVHL0Q5UmZaT3JCaUNTa0d6VUxwTXhUSUFoMERtbGd1?=
 =?utf-8?B?MWtDdFZ6L3FaUFpCa0E2eGZ2N0xpNUV1R1dmSWJwN1pPLzZTVkEvNUxLT2NL?=
 =?utf-8?Q?a0v4iStesu+FF42KtmVNhEeV2x9hhki4AZxlkI5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG01Y2tlM3lzelFKcVU4U1h6Sk9sYTdwMkg1SDJBOHA5L1AzWHJsYzdPTXFs?=
 =?utf-8?B?UGJMYml1Q2ZHWFNZZVdzRXZKVlFDZXlaZXExNVF4aGp2QUlsS1ZCdTF5Q29Y?=
 =?utf-8?B?SzNyczhFV09Oc2V6UHdJS3BkY3lVQ2FsLzRGQmo1SU9kSEhMNXlpeUQ2R1ZU?=
 =?utf-8?B?akJncDhmYmV3cTBnT0t4R1dlNUZOcURKMW9vVU9CTHJGRnJLLzRlWTBNRzB5?=
 =?utf-8?B?SWFvK2UzakcvcytRSDV3OXFtMjZVNWhxKys1Y1NNK3dSYnE5QnM4ajlBdEdX?=
 =?utf-8?B?OWl6UzZIZTJFWS9YL3I0b0d1ZkQ0b0NwRWlzMGtIT0FhUXZjRCtINkNibm0r?=
 =?utf-8?B?WFc5Mk5TUTM5NkFTY2ZzZzZSby94SjJMVlNzNTQ0QlA0WlFaL3JFOTdGMk1a?=
 =?utf-8?B?YVBqcmpqcVJYOVJPR083VzBFemtkZ3g2RitQNEYyb25YNzBXak9uNnVVa3la?=
 =?utf-8?B?MlBPd09xaVg1V3k4R1FheUNRZU8wOXcra2lTSTdSS0NmQ0pQWnk4MFc2YVpj?=
 =?utf-8?B?eXVmZTVYL0lPSzRmNEN2RlpWWEVhVm1Ua3Q5TDJ4bjRIZ3ROc2JGczcwcytT?=
 =?utf-8?B?SGhjWU82YnNEQzZ4aGZFTWwwN2VoQ1V0eDdJNE5rREFMZHkxWnZMRERTL1VR?=
 =?utf-8?B?bzFVSVVqNHF4cFNTbzZNTWlKb1RramVSQTVLb2Vlc2pqZ01laXRDT0MvbnRw?=
 =?utf-8?B?YU42TnZDS0FXU2ZVdHdZWWNUWWtRUEZISlJBb0Ftc3d6b2lJMXZvM2lQdGJV?=
 =?utf-8?B?NS9XTkRkVlFtbTY3VGdESGVKR0JzWHgrN2E0OUdzUEFSS0grNVZVSE5WL1J1?=
 =?utf-8?B?RE1Dak01aXhiTkZFYTVCM21sS0tHTUxLQXlDSE1iVnBYaXpYdzB0Zzd4TjF4?=
 =?utf-8?B?NllPYmpCU1pVVHBMTm9WU2g2MzFXanZEM3dnNzIzK2VVSU81ZU5ESTFmSEJy?=
 =?utf-8?B?cDhSM3c1dE00eE9WSXlHa2hhQzJWVFFQUHBzWUNhaHo5L3R6N0xaNEY5V1I5?=
 =?utf-8?B?MFdpRkNabC9maENtd255Wk93S1lleEFKZTJVK1N0bWxlWWgxSVBrV25hU0RW?=
 =?utf-8?B?bHppQ1dPRkhJRWlZL0xoT3NFUFN5Z2xDYlRmQzNDVkN3c0RHdmcrYnpZMXZm?=
 =?utf-8?B?ZVJiYjkyRWZUYkh5azNPZElYeEdqbklqdmVlY2Y1eWZkRTNHSWNIYTJPKzlU?=
 =?utf-8?B?S2JYK2hGQkRRcVVKVWJmNy8yTGk1ekp4dkVFalpRWHExR2w5T1ovMC8rVUR6?=
 =?utf-8?B?bThMV1RaOXlaaVdRcjJpSHpyU2MweC82aEU1VDh1SGJ3U29CT1BrTmd5cEV4?=
 =?utf-8?B?WnJNTVJEYVZqT2MwSlYxQXVyVlZnU2pnY2c1V2VGeEtjZ3ZJcHAvWUVvWXZl?=
 =?utf-8?B?NWJ0bk0rbkVjV3lEV2dVUkUxSjJqWXUzd0hhemJQNU90SE0rcGVZOGVkRWRF?=
 =?utf-8?B?enV0ZTMrYjNqREw4VzU3bFZXdW91bkRPb3BtbkVIdGt2VHdCa1lVb2ZScTA4?=
 =?utf-8?B?TG1GejdRMzdlbVBReE9iZDR0RUxENWdtZU1FSHJSODE5OFlUWE1Rb2RGK0ZK?=
 =?utf-8?B?bWdGNXQzSUtBMlgyamtwWXFlSVhyMnI1a0FYcXBaM1J0Vi9rVkxiS3hCbTYw?=
 =?utf-8?B?VnREMURPaEVsS0x2R1MzUEpnTVRkQkNZMmlmUkpJcWNFVnJONFNvZUIrQytE?=
 =?utf-8?B?OEdmWWZYUU5QMExWVVFCYXF3NzVCRHM3MXY3bzE1WU5Oa29KaE4vR2tBLy9x?=
 =?utf-8?B?NHdXM2FVMTFURlZqc2U0UUh0RXNZSlhxb0t5dVVyeGNiK256UDk5U0hiQXNX?=
 =?utf-8?B?ZGp2Y0YzSGNNdkpmMzR3ZWZlTWlNVnltZ08ya2R1UENnUWN1VGRsMDROL0RX?=
 =?utf-8?B?ZVQrYXB1SGVzdlBGb0NOa2thdEJtTXpxZkNWRmdtS0J4ODFYWDhSTEZIQ2pO?=
 =?utf-8?B?S0lFOHI1clJUYXlhbkEyNVI3SkFsbHAyRXEyRW9Wd1RRbE42eFdFUWEvNWtB?=
 =?utf-8?B?WGZSeVd3VGowWXp2R2tjS1kxUW9WaE12ZDBDQ2lBTVZEY0lXbFkraFNLMVhF?=
 =?utf-8?B?UkI4Nys4VWhCVWNIbEltQzdaZ3hjZ0dSdGVKSkp3QTRLVEprVzRndlE2dHkz?=
 =?utf-8?B?QUtoenlBTHlqTWJadlE2eEhJRy85d1cvMzlYb2ZaNUFBYksrQWp3T0cwMlZJ?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd968b2-e7ed-43e6-5bc2-08dcfd6b74c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:28:34.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcveEHywBAQM4DnG/wTsWa/I10xYNp5vSG7K8IVzMTMIHjDyQhLHz6G8/vahlOwmPowfieWnQIz71T42JHQIT88td0jqgCaec30fHB0JEKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

On Mon, Nov 04, 2024 at 12:04:30PM -0600, Lucas De Marchi wrote:
>On Sat, Nov 02, 2024 at 11:22:03AM +0900, Gyeyoung Baek wrote:
>>if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
>>'drm_dbg' function is replaced with '__dynamic_func_call_cls',
>>which is replaced with a do while statement.
>>so in the previous code, there are the following build errors.
>>
>>include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
>> 221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
>>     |                                                          ^~
>>include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
>> 248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>>     |         ^~~~~~~~~~~~~~~~~~~~~~~
>>include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
>> 425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
>>     |         ^~~~~~~~~~~~~~~~~~~~~~
>>include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
>> 504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>>     |         ^~~~~~~~~~~
>>include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
>> 522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>>     |                                 ^~~~~~~~~~~~~~
>>drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
>>  14 |         ((cond) && (drm_dbg(&(xe)->drm, \
>>     |                     ^~~~~~~
>>drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
>>2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))
>>
>>the problem is that,
>>XE_IOCTL_DBG uses this function for conditional expr.
>>
>>so I fix the expr to be compatible with the do while statement,
>>by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
>>
>>v2: I modified this to print when only cond is true.
>>v3: Modify to evaluate cond only once.
>>v4: There was a mistake in v3, send this again.
>>
>>Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I will apply this to drm-xe-next once we have CI back.

there were some checkpatch issues about mixing tabs and spaces. Next
time please double check the checkpatch output. I also reworded the
commit message a little bit to follow an imperative mood as outlined at
https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#describe-your-changes

Applied to drm-xe-next. Thanks.

Lucas De Marchi

>
>thanks
>Lucas De Marchi
