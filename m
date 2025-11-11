Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5361C4A376
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8610E4A4;
	Tue, 11 Nov 2025 01:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPE8efgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B2510E4DB;
 Tue, 11 Nov 2025 01:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823222; x=1794359222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/LsDogIh/fIIpzuhpbV6lVZldSc8H9rcNkRK+TQOpT4=;
 b=iPE8efgB5wOpQTpMK36syVNNGyamzZkpmNXbupi3z1LAougWjK4pDLvK
 dFVfaNfQQ1OPx7GD+F4aa9Oh0peVn40gVUbfoC76IGjdeBzfsTQP7Xkrz
 Ap7nCcvp6d+u/RbK2SJcBuFIsO8B1ovV21w3amOIQusjRdIgBTwuWVH0U
 Ew2K1jpZByk4hws6x4D3neeo0N4DUWqZXrDW/VY6kNy5PA8ziZRvPSH+s
 11TonJjkSWkVM/xRIuBqVaxAhAXw3ipiEAGUODQZX6o5/Hi6rzAbW8+dp
 SXdjanueG+SgqyxSigiueraZReJH9yyO8PmWrMl3Psr+4rOIxmbN7NW+U w==;
X-CSE-ConnectionGUID: ip4BKNcmRmaYeBbhT1R5yw==
X-CSE-MsgGUID: t1H6zvsFTAOqdhUEUAY3zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68739889"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="68739889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:07:01 -0800
X-CSE-ConnectionGUID: irmtw1IPRbu0Qu8j6GNYlQ==
X-CSE-MsgGUID: XiALX3ieS7+WdcVnTN3k3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188657354"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:07:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:07:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:07:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:07:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBrda5EbOx9N+pk2fHUHvcp/xhEyCd/NIP6i8j4s56eZioGg9GapH7+h74P0h9/ujQdXsODhEkPEqLv8AwghqI9tSlftP8VBW9D/UikrzdtOZgHANGvIY+yddR2ZBnSqCj70un07a6Cl2PEz6Tpd/sG0ns5+89UTz/CzWXldk243zpWBxFWGnPGH3cE4f9qfY+AQJM8b7n6iLeiPaGezUF0+Asu4bqe+FyWSllbXyJmkjlc8Apb9Q7SAbWM+B9amUmkXqT7+/hGNG9kXViWSfac+nMAZSIRkgpnig3yLhyXQBdqETzRVZepDv5YpcP00vs34bw/xTDHAHpU/CU9YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMQmn7VegruCdovVcQlbC23p09kpu33Eqba+ifgVVQM=;
 b=iyaHiimCqFLzrILSmHXmMKtqCFlQwc/V2yagX0onXK96M6cdJ8jDYR3S2bg3IwznneeQFBdAWJ5fDZ2u5i/BX9LtLXiVRsJ6jGb1iKm8k47PCbLa5bp1Vjt4GukcaF+kpw6QlFajvxR4agw+Zlc5/wR3ej7d2LwBj+hxvs+b9CrhNi+3oIfM5BblZ/DnAOn1PP9WtCxRmNlguZfocFDE9tksLGGni4i9O1Ftq7W0BWELvEdb8s3v5L7fGaZaoni/8FkoklN2A0sOOGMR8upIfO9nczjKPC7M0NMdhwBuWg38qCxG1F91QsuzmzsyobRQp/ofrO4HjEAdRYFysXJ5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:59 +0000
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
Subject: [PATCH v5 27/28] drm/intel/bmg: Allow device ID usage with
 single-argument macros
Date: Tue, 11 Nov 2025 02:04:38 +0100
Message-ID: <20251111010439.347045-28-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: df2cb4b5-24ae-4399-c76b-08de20be9d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUZqQ0xUMGRFWnJ1YzRyd2NWU2pRZmdtWmwwNzgwYkxJUk43dkhCZTVyM1Uz?=
 =?utf-8?B?dVJXcWR5N1pZTEpaUHM0NE5nSVM1WkFmcFRRcGJvdVM2ZDlBOGFvY2h3VlhE?=
 =?utf-8?B?WjFZdERWbzNJd0tWMlRQSHl0ZHRPaS9UbnB2c1hPSENhNzU5R0M0RDNjZzRz?=
 =?utf-8?B?aXdtTWhuYzVpOTY3MFJYU3BPRjlta0l5c3V6MS9Xa2ZrK1U1Z1hoTS92VC8x?=
 =?utf-8?B?ZWc4NFlZeHBYcENVUHk0S0FxRzdRbkJzZGxhZ1hqY1k3R3ZCNVZyNVZaY3B1?=
 =?utf-8?B?aEphQTNpcFA1OTlVcVFtcE5RWEI4aTk2S1JFM3o5OGRwdURueEhzMHNlL1lv?=
 =?utf-8?B?VFJXLzBKQmpqY2FjM1kwenRqNmgySFdGSXptcFk1b2phbE0ycmViVXF6REdH?=
 =?utf-8?B?cFlEa2loMllzYVpjVUN1citBWGZNNkR2Y0Q0K1ZvSERWWVl5WlZqQ0ZzbzZw?=
 =?utf-8?B?RUpDM0M4SHY3NmdyMjFrMjc2d0QvYUF5OUdGUlgwcEdZS000SFFPa3J0TmNh?=
 =?utf-8?B?ZWpob2phZUljU1BLMkhlQmZNMTZzSVd6REpPYXI4MHUxYkpSRG9reE5xdHdH?=
 =?utf-8?B?Q3FMazFqSExYdkpUUDk3VldaN2dFL3BEanYrUndiYmtPakdvMS84aWcyVGF4?=
 =?utf-8?B?V0E0RlNxU0ovbDFyVkwrbis1TzBSdGswVjU1MmQ3L0pkZTJpNzJ2TDlSajRi?=
 =?utf-8?B?K2lQZndxR3llUFU4UlF5b0JyQWQ1eldpSFVwR1ZxK3NvODNBbW1icVFHOUw4?=
 =?utf-8?B?V0tacnBoMHlveGFXWXh4bjFIYm1iKy8wcGhRdnZHajFVZytKOHh5YTFnR1lQ?=
 =?utf-8?B?NU9ZY0lHblNpQ29Udmhmd2xlSUsvYnFveHZsaktRSVovSHJUQWhBNDFjclR3?=
 =?utf-8?B?b2gvT3JLSXlORGhMZDdLMGFYM2htcHpKbitPcExlVG1od0JLYXczaExLejVC?=
 =?utf-8?B?SUtpdW1RclZ5cTlhQjZHbGQ0bEFycng3M0tidmhvTThIaEtpTmltRWdZLy9C?=
 =?utf-8?B?c0IwMmRQejBpS1hRLzNSRjN1ajBQaEI4SnY3YmtRZS81VlJqb3oyT2U4SW1p?=
 =?utf-8?B?OXUxZ096VnkzMnRMK0JuL0FtaVlVeUZCU01oaHBELy95K0R3d2kydUFCbENa?=
 =?utf-8?B?dlJNUkdnWVBHdXRueHh2Ti9nakZOQkJXWFhNZTBDY0pTMENWZmYvdVRwelJ4?=
 =?utf-8?B?S2lBMmJvSlFhMndjNzBEd2dSZG03Y1I0a2t2Zjd1eEcxVEhQU1ZqTWhMbk5J?=
 =?utf-8?B?RVZpQ1Z2NHRPT3gwNGR4NEZ6REJYNU4wY0ZZN0Z5Ni9TN2NIZ1QrWWpXL0ls?=
 =?utf-8?B?QjVqS2IyOXlFSFJVMVdpMzJublB0RXh6djhRYmlWRFo1ZytFaDBRS2VaWlI2?=
 =?utf-8?B?Z2o4ZyszdW4vNU05Z08zelNNbXlZbG95eHhOQ3FLT3E4UkNKQkVjaDk0VU1s?=
 =?utf-8?B?a0crc3FRcld2TU1EaUJ4T0hNRzNzbEF0bEZoNi9aRzh5aFNnVUZzR3duKzh5?=
 =?utf-8?B?bVdNYlZGSG83VDVHbTZLV2IyWWhLZzZtTEdEeHdHc3hpendXQXRmM2JIc3Vw?=
 =?utf-8?B?dlhpY3dQOHFiYmNkVktXdHZLakFJVmtrWUZaNHRkNDVjbnJGSXdzbkRLQzhw?=
 =?utf-8?B?ZThqR2hQN0h2RElqa2hTTm9MOVVkZkRCM3J2MWpiUUpOcFhod1ZwVkpLdUtH?=
 =?utf-8?B?RmRXYytjSkEvRWNjVmdDZGNsTkp1bGtUdXpZbGZpNHZvTFdISVhvNTk4bHJV?=
 =?utf-8?B?V3pYRFBGdnZ5MWFtOFpoL1NXNFpUM3o5Zk01THk2L3NiUEJTWWhEcE1yaVV0?=
 =?utf-8?B?eTNzb295Mm5TNy8wZ0pUMmRoN0dGbzU4RHJ4U3RKeXpPSjEyVGxlUmdLamdp?=
 =?utf-8?B?K01QRjhZaE82R2NJQUkyUGV0UnBVaXRwcVRYQVJLWk03RjY2T3RpbHZiQkh6?=
 =?utf-8?B?cGlBalZDLzJJTmlSazh5SXRBdlVDQkJUbngxWTNFVllMUXJoSVhyRVkxQnJF?=
 =?utf-8?Q?MtOf7HR+WeEis9Tc+nfpsnhty/2Dak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXByNzA2OUFwOWd4VDNnSGs0YkYrZDhmeUxrU2RvMHdKTCt5V1NBZHlQMnBH?=
 =?utf-8?B?Vk9hTUFPL2Zvd3EvN1VLNDlqNW9ROVNwdllwUnRPVElFVXJwdHZpR1dOZk90?=
 =?utf-8?B?dEdSY3FZaEpOcWpncnNNdEhwV1RvRng2d3NkTE5Bc2l6R2ZJeHhmZjNhd09h?=
 =?utf-8?B?Rnl3bTdsRjdOd0M3eDd5T3FtSmFSUFloNGNOU2xnNDIwTHVPWEk0eGVycURV?=
 =?utf-8?B?MWN2TTROSUQ3R2JWR1Brb1FaREdFQ0VkSzBsT0k4bVJqSktnMGczVDNoNEVN?=
 =?utf-8?B?QWpYdzEwVDBzaFBSdmtGTEhSaldjL3BRMXhQZkltaXp5dnVVWUlCdkg1VjM5?=
 =?utf-8?B?cmJyK0RoYURnSWVETWphUFFpdFg3S1pqOFdNcFdRZEM3MXRseGs0dmVsdmxE?=
 =?utf-8?B?clcvVFR3ai9naHQ4Wno3YzNYRzAwVDhRS0V5dHBBWm5zS25lVi9BcU5PWk1B?=
 =?utf-8?B?aFFKWmN3YnNRNXkzMHFWZzNHWW9XMzlpV3JPU3cwVlNYUWF3MWQyT1ltYWlS?=
 =?utf-8?B?WUlPNUpycG1udzdTZnRIdUhXMkZVenBiWWhPZEN6b2ZIRi9CNnJYdHM2KzUr?=
 =?utf-8?B?UjhjZjR6em9nZWRCcUJBbHg5SXdlOXdnS3Qrc3RwY0p4QTR4OVNsZFFmYitR?=
 =?utf-8?B?RGpVNnRwOHlwODlvaE5LSjZBcTJlMjlLeW81UUVFZDUvREEyOWlFYTFxQ0p2?=
 =?utf-8?B?YWl5QVdnS2dheGJSUzdvUlJKejZiMXAwQlNoSkgrK3VYcitxK01ITnQ0ZG1r?=
 =?utf-8?B?ZFlJWjNsUXkxTXZ4RWUxaDk0aHVJeGM0dENjOFhlRGdDU2NTcU02MGRZNGNV?=
 =?utf-8?B?bVkzdDIxb3R0ajN5M0ZIVXMyUHViTUJZK251Sk1lbWJ1aTVramVwVUVKbmpl?=
 =?utf-8?B?N3Vxd1h0N3pFQW5ya2tiVlBXalF3Nkl6MUxnellpTHR6Zk1rR0dvR0w5bHBW?=
 =?utf-8?B?VmxVMCtRd25CZnUwUTBBWFJxZEFJUmVoMkl2NTlyU2RaMDZnODdxUWEycVIv?=
 =?utf-8?B?MFExUmJjdGp6ZzIrN0RHOWhPeXZwZU10dk03ZGtyUjhaZDlpVzhnYStBdENB?=
 =?utf-8?B?SEtvWUZrdVlNclRXZzBFRk1Gc3R5YWh1WXhSczFjZHpRejFjWGNmTUJHd09C?=
 =?utf-8?B?amU0TlNtYzUrN0g2b2pTSDJOdUtDVXJUaGtNSll0Nld1dDUvd1JIRmYvazE1?=
 =?utf-8?B?MEQ0T0lSd1h1TXZqaXA1eWdmQXFYejRUV2dNYTVZb295MnczT2dYTk04UlFZ?=
 =?utf-8?B?YlNCVklLL0QvQVMwTGpheFFValBBNkZpa2dtMmJQS09hcC9NdFRYQnEzbVhX?=
 =?utf-8?B?Qkkxb2U5M1hNWlFMdC9rWXpOdHdEMkJDcGY2YytFZVZLY2FGL3JqcDg5V2hK?=
 =?utf-8?B?dVM5eVk2OGtnZnJHM3lUOFNud3ROb1FxVVh3VzVCQXM2bW9VZmRWVDIyR1Fh?=
 =?utf-8?B?QUFmNGdSOWNlLzFzMFEyaXVlL2NJVjdwZzNBcW1heTlkSjc3cUtyTWp2aGNn?=
 =?utf-8?B?R2NwSEwyZG5kcHFFbjIrTkxEWkZtUGlhMHJKb2pUc0NQQzZ4UVcwN1MwZVRL?=
 =?utf-8?B?N1lGTENkc0MyaTFoUFJQeXZOcHc3Z3ZWdlMyWEVzSGdXa1RkbUxpMmN5RGY0?=
 =?utf-8?B?NlM1MnRvOXliM3B0NGdZVUFPaXIwdzBueCtCWXJUeEtKTnZ3cHF5OXBBZWFh?=
 =?utf-8?B?WHRQYzFUdmNaS1RtVTE3NVhYYmtWTEpNRllHcXFjZHZtL2JpdWpLelNPU2NU?=
 =?utf-8?B?ZnhoeGdtaVFOQUlUZGJhdGt4ZlI5eTFjTUdlbG41cmd0WXRiRmMyeEU1ei9n?=
 =?utf-8?B?MlZ5Z1dEUmJHRjZINHF6bVM5TWhRaVRqSE1tOC9jZ3pxem15aXM0S2xIeGpB?=
 =?utf-8?B?a0VvMnhVQm9JcTd4bkVzZ29EOU9xaTFaV0svWlRXaFYyckpKSFkwOEhEa1VH?=
 =?utf-8?B?TjlYd3JsaTdKcTAvemlKZjhUYTM3bnR4UHR0VGYxZ2Y0SzRqemNOUjBUK2d2?=
 =?utf-8?B?TjRwSEhRRy9pOW1icGF3bTBITGNiRjNlMSs1d3VrSFd4M2pCOEhhcWtVVyts?=
 =?utf-8?B?WnRmaUZKYVVRNFNFR1cvWTFYakh1K0VkTkd5dEw5Ylk1dFlldnpPUGdEdllW?=
 =?utf-8?B?Y0xMRHNvdDFhZ3RaL0lRWlBLajJDbmIrSWNjT2svZG03Z0kvTml1NVM4Ni95?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df2cb4b5-24ae-4399-c76b-08de20be9d6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:59.1122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoKNdsObT7abHbUPuuqCMbTLhh6epE2csjQQR9MJmKrdPVccY0iIyrnjU8RFacRI9nD7H/TEnCKwH8PFb0cz0sbTqBB24MdynYpS6NKCsXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

When INTEL_BMG_G21_IDS were added as a subplatform, token concatenation
operator usage was omitted, making INTEL_BMG_IDS not usable with
single-argument macros.
Fix that by adding the missing operator.

Fixes: 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/intel/pciids.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index b258e79b437ac..52520e684ab19 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -861,7 +861,7 @@
 	MACRO__(0xE216, ## __VA_ARGS__)
 
 #define INTEL_BMG_IDS(MACRO__, ...) \
-	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
+	INTEL_BMG_G21_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
-- 
2.51.2

