Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ACA790CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A510E7EE;
	Wed,  2 Apr 2025 14:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="du2G0CZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17D810E7E3;
 Wed,  2 Apr 2025 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603132; x=1775139132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=siRTl6GX8QnDF0Mdme3stuVND2y9WogQTrZmNu+39U0=;
 b=du2G0CZpHyQVunlMKJZ+chZZn1rLH1vhOPrnSzU5Vyvkega96+F3jrHf
 3cy+LdzzECMSfSImyIkGGRtn+pNhI1oqdPaAyb4MRSoC7w7Wjo5E8C8Yk
 rAye8su7VIn1Y/KTi81fOGegpeiSl3/Pgxn7sAkfaOyI0Xt6UZhs4Gptm
 CD2C9HHFgX2p6Ui8h9LlBWXro0YIztpArhZbAd8wXiMx+Alq3vQLrcoVX
 kE7bZG5QxTZo3DSxkTI5gOi5R1kxpjSbIJLXZI+iQiseklEeaBNm3jlUa
 DJYFUAuqSAvuYSxqByfjkCJLCXU3fIdO/sONelTdAXv2h4hHdeACOdAzp w==;
X-CSE-ConnectionGUID: F7hTuJnjTr+BstUwZ0CDuQ==
X-CSE-MsgGUID: hnky8aBlT56g6YiwLB+F6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677191"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677191"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:08 -0700
X-CSE-ConnectionGUID: koFjoONqQHqeMkEMr+HnvQ==
X-CSE-MsgGUID: yhvcPjnGSf+pAPZTtGfoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620432"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 07:12:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKl7gb1JBBSSXTa5L0XQzbQZtslVF16iPL+70ms8a2t/pj910xWYlqVmJggSPSFdDjDWQ8y8NLeF5pSGhBUYtII4YId7hwyXf0CpDxQEwMbCoLNoyZgr+XEElL2LLp0SAI2Z4u0pJQORxhA+LV5jSVf8pg3R2n3li+daUZZsqAk7oG7hDBf0nkwma63w8LC8zgn7u/46AnadDJcTADGuiPxIhz0NgOZasxiZpntwVFHLzulV2uPcyWqsuUyPZxpMFPih7QIDMygcPUSeSZekXDI5f6nj546hD5jbnH4LigSfbOfP3Mmn+v7bbVej3iY6YQAuArsAssJy0s5FZyRfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTYB5JU+JVxoGhTV0ErzA5+Ib3Ar06g1IPVIx4B+wks=;
 b=GO33Y6CJWO/Ui/nIoaU6ekFC8Y++Jgsi3GP1MhdzItZtg/pCZSx4vd9WOM18lXfyEQciTQQaabWnC49qmf6kg/n3xWcd6pNHJ4+PjIB+Yp3G2FOonvd8DAQpG7Kckaby0Wogbh/OtZhaEDOxO5DRT/u5RtAPgJWrCgSY9nTZSlRP/s9/6o4FgPZW4NKmTJoZQ5tWYv40CrilDf1THi2YHMOQPld7rAE1f5ofGBtNVwuH3mDaKrsyJ5D4QbYi3pt+oX+CsGpmTl6e1a5cDVzdtqwFV33pF/AL0B2u/DdwhU+6D7mt4rvd4BCAvGk/Kptcl4vxzqqaxlrgQww7RTws1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:12:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:12:00 +0000
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
Subject: [PATCH v7 5/6] PCI: Allow drivers to control VF BAR size
Date: Wed, 2 Apr 2025 16:11:21 +0200
Message-ID: <20250402141122.2818478-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0037.eurprd03.prod.outlook.com
 (2603:10a6:803:118::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8268e3-4db7-4b21-7bb2-08dd71f055e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk1VQ2Y0T3pBUE9rVCt5WlU0dEs2aEY3elpoaTNDM3ZKdFFkRlEzQUJXcXhF?=
 =?utf-8?B?NnVhUFR0QjBQV1RsNEd1UlZSSHk2VnM2Y21YZ0lyd1VsZGxEZVQzZGxLZENq?=
 =?utf-8?B?VkxrMUE0NEMzVS9UQ2ROUTVnM1IwMDdBVWZqbU5FcisvMWY1VGY3bWllMnp2?=
 =?utf-8?B?aWhrVkJCTTZsNVlCdVVjNUdsaVQ2Q3UrTG1FMG1pYXIwS0JCSURaUkxjY2dv?=
 =?utf-8?B?Z3I4ZVlla1FpN1g3eGJEUmV2NFp2Yi9tK3doSUlGdkQyRUxzZXQ4c28zak9H?=
 =?utf-8?B?U0dHcXJER3NSR2tUZ1NreDJXc05CN2pESmI1QTJxa1VtRFFNay9Ea3FBNUN4?=
 =?utf-8?B?cEwrZ21CaDNsM2FIVkpDWW43SGdMZ3VHREhrVWFKa2dwMEV1d0pHRVV4WllR?=
 =?utf-8?B?YUQxVjEyTS9CL2pFSFdVZ2JMYkJFTi95OGsxN1l4UElTVnM1MGVTcTZjQW9D?=
 =?utf-8?B?ZnhaRFBCcWdXdXBnN3haaVFFVjd1aC9qR1JQdVJqT0pMVktQd3lCa1lvNkQr?=
 =?utf-8?B?R1dsQ3VjK1JkQTR5Ris3cXA5U1gzTHNJVjBLRFJDNVRtTk5CWHlKdWtwSW5O?=
 =?utf-8?B?YkdzT2N6Rnk3L0NXaVFGaHByM280blFvckdUdjdtSkRHRmJBelh5Rzg4bitI?=
 =?utf-8?B?aXlrNUtQU0VOMFdWU0dFcDBzZlJvd01DbWpHSThaOW1jMFpWQjJxKzVRTGlD?=
 =?utf-8?B?NGxjT09vbkxxQ3pFYnRuOUp4K1pxZUhWV1pwSmJabzB1QzdOcWxOUmVDSVRx?=
 =?utf-8?B?NHIvMGZ3Nk1PcitqZTkybUY3cklORkpNRjh3ZldPT0V0b1pyZ0NsY3U3QkRJ?=
 =?utf-8?B?ZjhpVDYyQjV3dEM0WUI0Qjg5NVFrWXVhZVgrL0JkcDVKak1GTHFJeXBEMjdU?=
 =?utf-8?B?c0VYaUhLSWdxejhMSWlpMmJJbjNoVDNvUC96YXZLOURUSGtYKzNOVERDYnU3?=
 =?utf-8?B?SDUwRUIvRStvQnp4WWFlQVZiS0NYVDBKbXRKRnc4Y2g0Mk0yUUZGUzl0ejhw?=
 =?utf-8?B?a0lOdlJpUmh4THFJc1UzeDRTdmIzbkEyRDRtOHRLNzgwS25ZUE9wWkE5eHRZ?=
 =?utf-8?B?YkptMnllNUlrcGlXOXJNUUg5RVBqV0R2WXc2TzVqRW1ZY0VoU2xPb2xlbEhB?=
 =?utf-8?B?RFlvSURSbXQxenl4TXNKR3RIMFF0Tk5SOG1NUWRBT25RVHgwd1FEdXRabDRP?=
 =?utf-8?B?K0c4UkR3a0xIeUwxUWVUZzBPRTVoaWxoK2FmMUxpWE9mU2hMVWMxV2RwS0dR?=
 =?utf-8?B?d1lMYjNqQmg2cHlVMEV3SVJJM2xoRDEvblpSeDZvN2FiNy9WcGlHRUtDQVlw?=
 =?utf-8?B?SmxUa3R2U2Zyc3FQMkxXL3FhWGYyM0JBMnhFbTVMbS9EZmRYWFBTL1lGMDhl?=
 =?utf-8?B?VGExSEN1RzFvTkJWS013YndyRTVwMUVzaWd5STc4anpUZjdWS2NZdlpSaHNn?=
 =?utf-8?B?dk8xdnpubjB0V1d1aGN6YzNvcllzbG02VHlHeTk1ZlNMWC9nN25Rck9mSDg5?=
 =?utf-8?B?cUd0c2NybWRydUVTZXJXYnJQYWdUWENhU0JGakJ2dVBpb3ZOenNESlRFcTd2?=
 =?utf-8?B?NEY1MEJtSGw4TVVNK21MQ3NHV2ZCUmF1eU5wMnNBRVNLNU1Oa1V4NEV5R1Yz?=
 =?utf-8?B?YmdyYXVrbTV1aVlUd3NSOTcrOWYwbkVHOWt0Tm1WVHBBSkpKdmNHYWFCczJ6?=
 =?utf-8?B?enBMSFhKTlhyY0JOWUYvaVF1dUFVUjdheE8vc1Nwak5ua1ZKZ1FVdlNEdThF?=
 =?utf-8?B?MjFLWFVFYTU5aDVUK2kwaTU3WVpwMGhNN3BsRDAvVVQxZkVjeUV4anQzQTgw?=
 =?utf-8?B?TXRtWmo5cUd4WVVKNWF4K3dKd1RBMmZBVFhVcjlVSjlqUno5NFl6aUpSQ21E?=
 =?utf-8?Q?EHL7iK/siCR8C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2FmSXVPRmRLeDZMYjBjeEw5UldibVV6a1dKcEJhSkFaNUlLcEp3U0tYNXlY?=
 =?utf-8?B?c3hTTFQ1NWJNNWF3UGdpTEk2cjFJUEhhSmt5dVcyVU9JRTdzaHlyTEliMnVo?=
 =?utf-8?B?WTBSNmF2QVlBTk1SZXE1UjlYY29yMTZIS3FtUXFQaEZwQ2VPTGMyblJRRCtV?=
 =?utf-8?B?Sk5ucWN2N3E5di84ZG1rOWJhd0Ywc2xuT1dQUmI4SFVtdEJ3aExMUEtpOTBu?=
 =?utf-8?B?b040WFZZbHNXcHQ2djdpSFltWkZoM3JMKzlUbWhxbHdEVFBhZndzUmpwQm9x?=
 =?utf-8?B?K1hBUngwV21OaFd5NnN2c0ZvVGdaMmRTQUJ5S1lRZ3ZSU2lmcDVEVythaitu?=
 =?utf-8?B?M2xFQ3c3MXFpaDZXcEZxY2I5aEpTQXJVelE0QlNCWmNoNGp2RW5iRUlJSkR2?=
 =?utf-8?B?c2NlNTQya2hvVllLdE9CSjZHMEJOV1FKYW9WNlN6RXR4OGcvRmNIeEVxSUNn?=
 =?utf-8?B?b1Y4S2pnWGE3czlmNkRHY1NQVEdvK3VVbGMxTkg5UWUrV05EYkpWdGZ4ZTVT?=
 =?utf-8?B?MVhhdGZXNmthckV5UGN5VW1SUENLUHh5SW1QTmV6U0RjSWorREYwVllpOG92?=
 =?utf-8?B?cXMwbTFJaERlZXJ2OVZ3aytvNnYwU2xjM3ZpVUNRQ0JEWG14Ni80ckFBV1Nm?=
 =?utf-8?B?eHlnOWxkSDF3Y1p4WHBGVXFOYVYzY3dzQ2hKT0xrcnQ4N1pQcjl6V2lMRXRv?=
 =?utf-8?B?M1poSUtJcmlSb2hHejU0MDczcEpmSG1nUUllTHc5cVdveEFCdWZBMjYwRTN2?=
 =?utf-8?B?NUVSRFA4RVU0bkdHb2FTUEV3UUQ3ZCs2T1BIMW9JRjJZUFZVLzZUZ0VPMjc5?=
 =?utf-8?B?WlVWaW44eWhSS0VhU1pabVZSeHk4VHhucjlUWmc3T09KR0g5SmJsUWErYVlh?=
 =?utf-8?B?aXQydEcwaXExeFg5bGpFbFdMd2h1bGhiUDNkbjRmU1Z1STBoUmIyRldDMDdo?=
 =?utf-8?B?RTZXRXdYMlJ5YXh1RWJEb2kvdDBDd2srZWRwTzE2NTJVaDhoZHd3azI0RDBI?=
 =?utf-8?B?UDc1UUZyWDVQblJwVUdqUjZTdlVMTTduV0VnaVBabmFOcmZYMlNmeXRZWWdF?=
 =?utf-8?B?bk45RnEvdDhva2dmVnRjbzVQc1BlWUh3Tno2eEFYVnJibVJpUzlqSGplbE4z?=
 =?utf-8?B?MmdHSkJKVjFhN1AwUURKZzk2WGNwZ1FWc0xwcmoxbWdRUTc1RU9Mcm4xUmYv?=
 =?utf-8?B?WmhINWJzU0JHdHoyaXoybkVIQXBVUnJOcDRLK3pQTUh6dUp5RVpuN0duU2Jy?=
 =?utf-8?B?bHRJeGNXRVRZUmZDWEo5TXRTRjFCbXozUERpNjBNd1QyTXpGNmpTeTN6T3hO?=
 =?utf-8?B?elM3SnZhSHJSSlZ5WERscHBXWXZ4MVBaVkpyQzlRcnAzVE9jQnpBYSt2N2hC?=
 =?utf-8?B?SHM5bzRhdUNFN1JqcmZtNW5tUkNBWDB0eDY1N09CK2p3N24zemdNclZoNDhs?=
 =?utf-8?B?VU9jcE1qZm8rWmJndE51VnhLQUJSOUxyNVc5UUxITjRuZjN1cmZNenI2cjdu?=
 =?utf-8?B?MjFrWjZoUXk5UVRXV09HcDYvenhDZW56c1lUWlNhcnRtVEU4Rzh2cEQzQVBw?=
 =?utf-8?B?UnBwdkpwQUxuU0piR05OSDNDb1dRSWFvc0sxQWpSdU80YW9OYTFBOWtxaWFD?=
 =?utf-8?B?R1dEYmVuYnVhem1TcHUvdm5uVDFQdXpNbUNuTklGRE5pc3pkdDg4RjRaMEFE?=
 =?utf-8?B?T0tYZ3pRYzlGYjdMcG1KL1ZGRWFpbXh5bzRWZUJtNTljYXArRHBxMTlXSjIx?=
 =?utf-8?B?Qzh2ZUt2cS82SFh0YTJRMG5VM2RueVZLM2Y1dmNYN3hXSDhXazhVWUsyVUph?=
 =?utf-8?B?MHpadkQrT2doTFVBRUJDT2Q0bnpvaWRtV1graVhLNVRPdVErWHpPZG5vbUt3?=
 =?utf-8?B?QXJGNWNpV2VKR0lpdnB1aUV3V1pRcWNnSWJRZWtyMExzelRJcmxwMVIyVjdH?=
 =?utf-8?B?dVl5YnB4RFB0RC9xSWZPbFhybGZuNnR6MjBGVjBZMkFldHBmendyV0Ftc25x?=
 =?utf-8?B?d3hnbzB5MTg5NXpXKzl4TkFVNk5Rb2xFNGpuU3NGU1dCMW1DNU43V1NJWWY0?=
 =?utf-8?B?a1RzT2ppZ2lsTHVHQzZHRms0NGNpMVpuMmxibm1JdWloSFcvS0dKVFNlV0ha?=
 =?utf-8?B?MjBFK2JkaWVpZVJJcUpzL29UM1I0TFZha1BrcFl0alEvZ0NvYjB6QVE1NlpV?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8268e3-4db7-4b21-7bb2-08dd71f055e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:12:00.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9fo8/jBpcUhcVs+mxdYoELDOZ2mXkCRBWtCCTzRsCeLNKNx7geWzKY4evcxjOgqOA5TAdcRjdRbqpXdM2UaR0BP2u6uODgWf99pLWbAhWU=
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 69 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 2fafbd6a998f0..8a62049b56b41 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1313,3 +1313,72 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Return: 0 on success, or negative on failure.
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	int ret;
+	u32 sizes;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can accommodate @num_vfs within
+ * the currently assigned size of the resource @resno.
+ *
+ * Return: A bitmask of sizes in format defined in the spec (bit 0=1MB,
+ * bit 31=128TB).
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	resource_size_t vf_len = pci_resource_len(dev, resno);
+	u32 sizes;
+
+	if (!num_vfs)
+		return 0;
+
+	do_div(vf_len, num_vfs);
+	sizes = (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);
+
+	return sizes & pci_rebar_get_possible_sizes(dev, resno);
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e967..c8708f3749757 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.49.0

