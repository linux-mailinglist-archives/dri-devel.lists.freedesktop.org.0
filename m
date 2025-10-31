Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D0C268A5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BAA10EC11;
	Fri, 31 Oct 2025 18:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqN41Rku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6A210EC11;
 Fri, 31 Oct 2025 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934566; x=1793470566;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aak7+18NcD0FuXBWXRZB5wjaMe5YxVgOB2Tppk9oxN0=;
 b=gqN41Rku8hxW+M3BUA2AERlUQN1oGvAwDkcXuJwZyyhPi+97w0S3IDuJ
 /eSPUkEOFHP87jREuI0mwq6Ua/1fM4GOsUilp9saZtKrj0E1fDYSIP9fF
 ORPBvbYN+KETMC1lUIZ9PW6ZvKzQBCiQPq8LSboRL20pCOT4fWA2TeOPB
 9C0SM7SE1nRhZTmaK55uZDRmfeqcDPKn2X2He1W1esQ0A1TrAgnBL6+MQ
 tqs1ZUM/vSsuLfiBCdNplKn2V+AerSzKXPp7sulvedS1o86pig0FbqtxO
 mUkeCIYAfDVHR1I2DKbVR65Homdqg/knSSlMzfhl4+lcvtVqm47nYncCv Q==;
X-CSE-ConnectionGUID: BUrmADmbTNC17o+rT9Zccg==
X-CSE-MsgGUID: vFfGQvDtSuyZG9rxPS3bwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64029453"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64029453"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:15:28 -0700
X-CSE-ConnectionGUID: pAvoszTMRPy9JwKY0VtOUQ==
X-CSE-MsgGUID: 9ArZWcP2TlCz5SPxmqQ8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185516360"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:15:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:15:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 11:15:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1kuYm+X0uIYoq8CwDPB3OTdJP/kEWbfAohIOZ1f1C9edUbneW+EIBsrwB3ISkiBoFKqQdabb8pF+uFEdQM/b4GghhLz/LYX7Us+jaouDIEa0XUuti9wPk0SFG+Op9+B1EiDp47EKYNlAT/Fw0A2ENVjmgcG5PFw81oB/SxLJe243iuvsvKUSF/l0suOgaMuLm0jngj/t2ybCPaUJ8IdpqoOrz4xiqa5zK7xYxUsg7HMBGVqZ43bmvx8oIiiU5haaijRPDTcGWzHzRuUQ6B5HFJVIaCT8UwlkgzsRt4HAaAUQCbKE10XmQytUEE5vA8jow/OLFMp+IyAjXtHRJW4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd3Io/T7j1ns+tXSJmb1ihDCzVxyEPh6Y2UWkeHE87o=;
 b=VKxn0MQpaQTdP3KrMqSp/GVrVizhylZ2G2C5K1//dAYp5ggGCKqrDfPZt4fsAurilyOHLxTFknyUJv76c7LK6+Q30BQ9KAapFTU16KXUAx5nsSurHFHHWQ7KPjxRa6bMLSn+Rk/A8p3v0LF15F81nYbp46Rr0vJnSBoGcHoSjiut664lMfYhVVgUAVbq/9N/jDbwScuz77LnEiduAXYbd6Y5axsKUvLlaj5EhQqutT+wHcmxLaloL5AUEY5EXKs5mibkZJGu460d7+T769DMtXFJbvCx8XfhbmuLeGb+pQoSJk9SYruN0TNI3HKZ+6t3p49trLgjOu/EH0URirmqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:15:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:15:26 +0000
Message-ID: <af732344-8b37-4e32-970d-5ec10df7c328@intel.com>
Date: Fri, 31 Oct 2025 19:15:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/28] drm/xe/pf: Handle GuC migration data as part of
 PF control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-17-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-17-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 633d2616-7708-4ba4-b4c1-08de18a976f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzRQamM2RXNnYjBCNDZoZ0ZKOHNZVGRXOWN0dXE2YkFjR3BZcGdYK1RyVWto?=
 =?utf-8?B?cXRPZGhKbGNLamxRTGt4V0Jock1scmNFMWFvTWFVQ1ZjQ1ljbU81Z29OekZQ?=
 =?utf-8?B?QnJSNktkcUJHZnFnVHoyc1YxNGgxSnJFQ0l6cjB3a2VqazRXc2lZSThNV2hV?=
 =?utf-8?B?RmFGVTZYbjczMTlzSUZZRmpGODJ0VFNuK295cUxFcmhTUmxkOVhGTkp2Yzlu?=
 =?utf-8?B?dXJCSFdyMGxQbUFxWnZZODFEekM1LzR6RCs2TStNVmdLakRITHBjaUpKQWZh?=
 =?utf-8?B?bENKaCtLUTBMeXdJNWNpbW52OU8rbG9SYklGOEoxSlVSeDdCa0p4cXVJeXpJ?=
 =?utf-8?B?djFzWE1qZkNXRGxmSkI4ekRXMXAxempJeWltanh3UHlTNThjTHdzcEVweWdC?=
 =?utf-8?B?cWRmd1JOVXE5Vy9DZjNESGhXM21ESXpSMUFwbDZtZytTdUtXQzQ0YUowdWxm?=
 =?utf-8?B?VkNwQ2N5Q0o4RVZmZG1NMmgwZHYwMWN6OXBtclNIeDVHeDVzNmZpdUQwMC9E?=
 =?utf-8?B?eUxhVUJCeG56U1JHZjNrKzJKQ3ZiYkNWNEhNcXhZVm5IMEZyMnhpZjV6Z1JH?=
 =?utf-8?B?cW9raXVTeDdiQ3hXZ1k0c3BXM0ZSWGkycURCNWVNbDh3YUFmTG1UM2pmQjRz?=
 =?utf-8?B?RFM4V3hLdkFWVit1c3ZrZGc3NlQrSEYydHdsVkZnRlRhTloxamlQWDh3Wk91?=
 =?utf-8?B?Y0pDTDZDNDEwZTR3aGJ2OFAyTndmMCtMV3VhT0xZZi9zNithay92NFBpS0pL?=
 =?utf-8?B?cEVOdmdWendXR0R3cU9ZdHFoMGN5NkVra21DV1lLN3ROSk5QTFBsdjlMYVRV?=
 =?utf-8?B?eEZCYnpQYmU3ZlVROTlNMVQ4YUtVdE5pa2VoamxlTjNKeWh1Q1BYaDZzcGRW?=
 =?utf-8?B?WWNSelJON0REWnVLUkI3OFRTRVhRaDdGTUgycDRLZWlybjFnYUcyU1ZUeDAx?=
 =?utf-8?B?UnJqQk9rVGJ0VC9EZFVKVEFOd0poeC90dEpaK0JLc0JUSWRPUERNL1JSeXgr?=
 =?utf-8?B?T1JsbFF0WjViL043dTVKOHdTaGFENWpxVjlwZ1Vnc0F6TzhQZXR5SEIxZDRj?=
 =?utf-8?B?c3BjR254NkxKZmI4ZUxLeUozUjZFRXBxbFVIdzZkSWZib3EzUGZqUlU5VGZV?=
 =?utf-8?B?dS9kT25SN0dKOFN6OFRwak5YbmVpQ3gyTEVnUU9HejQ5Zk9tNDhqY1p1OHNv?=
 =?utf-8?B?S0dkWmlrU0t1RG9scjMxUHFjMjFJSmYyTFRMbnVlbk5ZSDFEMVZRNG5sSTRG?=
 =?utf-8?B?cXQ2Nkd5dmQwR0hWVkVTMTZLM0ZOOUdGcy9BQWZTVTk0NWFPbTVrdEpQcUxH?=
 =?utf-8?B?Z0wwSVQzVmlRV0FGeDBUb2dzYmcwaXNGRjRCZUlURXhQN0tpOWdZRExEMkEz?=
 =?utf-8?B?NFNuZkZZODgzZ2ltSjB1QVp3ODhrMDFaZjQ4djNBV0NWdTNnVlZ6TjZDUDdk?=
 =?utf-8?B?Qnk2RXJpbU0wYjkxQlRwNjhZbmNDQjVLMlBqdzNnUU5wRmwrWFptNlQrV2NH?=
 =?utf-8?B?U1BBc3BxNnoxRjBxYkUwaXI0VlNDNGo1eG5jZnM5THhXYkpwODZUR0dra3R4?=
 =?utf-8?B?c3FnSGIvUCthT1ZXbEYxamhXc3Zzd25zcXU4TEVRNm9NVDFaNEZJaFhHcTBZ?=
 =?utf-8?B?a3FTTVM1NG1wbFVTd2NMOW53VE5VK2RZNjBKNEtIZ3Z3QW05a3RVdFUrM3Zs?=
 =?utf-8?B?OU91emV2TmhFbCt5V05xMmkyTXp4R1JIcndkanFPY3psSHZWWldTZ1hqVnVi?=
 =?utf-8?B?RHJIRGRGNVJVMWlBcC9lTVNFdE5LS1cwZTg3M240bTNXa2R1YzRiWFlsc1gy?=
 =?utf-8?B?L1N1RThVQVBRNlBFdlFVNWRDWnRjbWdwNDhvRm42Mmw5SkxiREc4MUsxRXk4?=
 =?utf-8?B?UmY5VHJXZUc0MHJ0dTNoekh0b0c3TjRqMkFycjBraXJPQzdaVkhHelVadm1V?=
 =?utf-8?B?MnNRWHplM1NRZmRDZ1c2NmpxUVhweGNUMGU0aVNML2oxZkJMeHJEbG5BOUNS?=
 =?utf-8?Q?hYzkvKVhrZjK/WSCeaN5CwloO8F4bY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cExsdk5EeWhPZm1jazFET3JvOERSSnVqUGU5OTJUM0Z4TTJ2blNMcm9mbVlk?=
 =?utf-8?B?eWVKalQxUC96ak9MSEsxVXk5N09QeERHOHB1YU1tV2JRaEtxMjlmTmJucU5G?=
 =?utf-8?B?dWVuMzFEazNNMzB4ejhGbkhnNmtqK0VQMUZnSU1WbSs5aU9KbUVWazRHdDVF?=
 =?utf-8?B?L3FSWFQ2SEQ3REVnRWNxcVd6Y1BVK0FGaWVXdmxFS3hteXI2V29aWEFMTnor?=
 =?utf-8?B?RVBQZ1h5RWRFaUFNWU04YXdZcGUxRkROL0xEcjZrODdaSkhmWVhSOGJ6TkV2?=
 =?utf-8?B?ZVV0b0tmZ1hBQlZPd3NIYnQ1MDU1OWtZeUtCQ1dUanJ1SmdwK1dTbmNXZnR4?=
 =?utf-8?B?UFlvRHhSVDBEQTNzaXgvUUYrZ1V2U1F2N2wyWUkxbTNpeHI2SGl2UkRXdkZP?=
 =?utf-8?B?Qlpqb0QyN21OcURuK0RhTXRsNHFNblMyTE1YN051c2o5L3BjcDc3ZXI5SWov?=
 =?utf-8?B?citDMktmTjBGNXdYWnVJMGc3engyS1U4ZkpqYmI2OWtlVkZrQWRqaERFd0V3?=
 =?utf-8?B?ZGF3c1RtYjB4bWx1c0lOWlFQRkVLc2lTMDlxdmQ4RlV4QzYvV2thWjlUZ1hh?=
 =?utf-8?B?Z05ySlBmUjBCVm9qNnhrRlpsTlZtSVZINll0S0pJM01NR1JXQnU1MUo4bGM5?=
 =?utf-8?B?NllvRTJlTWowVzRFay9oTWxqbjBlTkpJSnhQVTRlSEg3bWE3MnJRUjdsNUNj?=
 =?utf-8?B?bWM2blRsT09md2VwTkp2UUtobnh3aFpnM2hLSEJjUm5oZWF4M3I1UTc5WDJp?=
 =?utf-8?B?RDNIaW9vMmYreDYrbTBoaWtvQ2l6bFlLalNFd252QW1ScE9FVVMxRkVCVFAv?=
 =?utf-8?B?ekNqQ2NwRXdxWjdSUmNrYk9XQkxwajBQVGFEb3RFWGJXUFBTY1V2NnI1RGtQ?=
 =?utf-8?B?R1U4QWlTaWFrNnZKQkJIQ3o4cDZQNUx4T1huM2w2MEFxL001OUdxaFcwbU1T?=
 =?utf-8?B?TFVhRmZ1UWdLbm5rSWUyWmhXdDlQNFVCZHppaVlMeHhLUzc4aXdMbTJWU0tK?=
 =?utf-8?B?L1hhL01SeFJ1WllONU9xWWhiRVlBaDhldjlzNVU1dVlBOTZJNmlJSVZmZ2J2?=
 =?utf-8?B?QkdEVkRPTnkwVnlSTGZodGNldWtGWWswTHE1dW1oZTJES3g1QzRmWlE4aWNN?=
 =?utf-8?B?dHBtSjVxVEVLNCtuNXVzUzJuS1ZoQmpIZ3VMNGpndWNSOHdZZ25mUDY0aGMw?=
 =?utf-8?B?R3FadGlSN2hUQit0c0ZUNHRXZ2VtejNXL0dzbXRvemsxbDhLKzlDWko0dHRo?=
 =?utf-8?B?eDZMRVk3blpsWDRWSWx6REZCY05ka0pybkdHbXZqZWJNV2RtRms5MmhFT25q?=
 =?utf-8?B?elpObk5PcmlCK2ZWRTcyVmI1VG1yY1pCSlRkZ2FOMTdDWC9WY2NDMjZ3cW5R?=
 =?utf-8?B?a1dISkpreHRFbzFwbXVHZklnN2JCYjk0cHB5cXIwN2p4czE0ZUROTFFlNzky?=
 =?utf-8?B?Nkw0QlhKbG9rSytSUmh6MFRpU2d0dFhCQmg0ZmNiK1RlRHlaQW05QkhjakFo?=
 =?utf-8?B?WC9ybTNPdWh5YXJsbVlZbXNHa3VvVGpMNy9IRjFxL1cwdVhGaDNZWjdFTUVG?=
 =?utf-8?B?WkVWcGVQNk9xRSt3TTA0d0RVWWtValBLZ1VMU2Y3ckxWUnBwbWFqaWUwMU9l?=
 =?utf-8?B?RWk0U1hnbmpETlZNSjJNVlBzbWI3TGEwcmNGV09GVHpuUTFhNk0rV05NWFZz?=
 =?utf-8?B?NnZ5czhYL1lpL3pTVnNzZnJBUGxKTU03dHJ4Qm9Dc2N2Q1BuS0tPcWZYWHBD?=
 =?utf-8?B?N2JLQTFEczZkc3NNMGlmTDNDR3RJdUczTDBuaW1VUlN3SUw0QTRJZExJV1Ey?=
 =?utf-8?B?ZnhybEE5OE9iTTd3bTQwbXBOd0tKSjhkRWhSY2gwMjRlenZmMmJRYmxVenJU?=
 =?utf-8?B?MWlZUXc3blJpNjh0VDhaaXljWVFFaUllSVdPbG4vaTBpK2xnS3FXM3BkamhQ?=
 =?utf-8?B?ZG1uanV3NlhVdkVReHBNVFQ5bkRUQVZRTmNscVRVMHhFTjZqZFZmM1doZ0VF?=
 =?utf-8?B?QXJhVHRQMGpjVzR4OEZnbm1tb0czOThITExTb3NlU29MYmtrY3A1d2ViSEM0?=
 =?utf-8?B?M25RWUwrYm9xOFhkWmgyWEpZY3Fhdzhub1J3YmZDc2tqMmpFWEQzMUZTRng4?=
 =?utf-8?B?TkZmcE42QXdrZlF5dStxU0d3bXJrYm9FQkZEWUZLTFRvTnZER2U5UGhEdlFk?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 633d2616-7708-4ba4-b4c1-08de18a976f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:15:26.0080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkyV1GaPHeqKQNhxHZ466K9dvIozE2knVuzdw7qq9amuBAo4LrlTHs3YxZbpAnIYQIgRrSS7FViWQZEfHi7MRRltX4zoOBAjjLzLxmqXBjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of GuC migration data in
> stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 25 ++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 66 +++++++++++++++----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
>  4 files changed, 87 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 203ba1fbeefcd..cb45e97f4c4d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -848,6 +848,18 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
>  
>  static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  {
> +	int ret;
> +
> +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC)) {
> +		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
> +		if (ret)
> +			return ret;
> +
> +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC);
> +
> +		return -EAGAIN;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -887,6 +899,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
>  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
> @@ -1048,14 +1061,22 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
>  static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +	int ret = 0;
>  
>  	xe_gt_assert(gt, data);
>  
> -	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +	switch (data->type) {
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> +		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> +		break;
> +	default:
> +		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +		break;
> +	}
>  
>  	xe_sriov_migration_data_free(data);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 4a716e0a29fe4..fbb451767712a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -174,22 +174,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
>  	return ret;
>  }
>  
> -/**
> - * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
> - * @gt: the &xe_gt
> - * @vfid: the VF identifier
> - *
> - * This function is for PF only.
> - *
> - * Return: size in bytes or a negative error code on failure.
> - */
> -ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
> +static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
>  {
>  	ssize_t size;
>  
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, vfid != PFID);
> -	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
>  
>  	if (!pf_migration_supported(gt))
>  		return -ENOPKG;
> @@ -278,12 +266,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  {
>  	ssize_t total = 0;
> +	ssize_t size;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, vfid != PFID);
>  	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
>  
> -	/* Nothing to query yet - will be updated once per-GT migration data types are added */
> +	size = pf_migration_guc_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	if (size > 0)
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> @@ -330,6 +325,49 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
>  		xe_sriov_migration_data_free(data);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.

but it's void

> + */
> +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +
> +	migration->save.data_remaining = 0;
> +
> +	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
> +	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_test() - Test if migration data type needs to be saved.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + * @type: the &xe_sriov_migration_data_type of data to be saved

.. to check

> + *
> + * Return: true if the data needs saving, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_sriov_migration_data_type type)
> +{
> +	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_clear() - Clear migration data type from saving.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + * @type: the &xe_sriov_migration_data_type of data to be cleared

.. to mark as done/saved

> + */
> +void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
> +					 enum xe_sriov_migration_data_type type)
> +{
> +	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index b3c18e369df79..66a45d6234245 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -10,12 +10,12 @@
>  
>  struct xe_gt;
>  struct xe_sriov_migration_data;
> +enum xe_sriov_migration_data_type;
>  
>  /* TODO: get this information by querying GuC in the future */
>  #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> -ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  					 struct xe_sriov_migration_data *data);
> @@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
>  
> +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
> +					enum xe_sriov_migration_data_type type);
> +void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
> +					 enum xe_sriov_migration_data_type type);

nit: "clear" is little confusing, maybe

	xe_gt_sriov_pf_migration_save_data_done(gt, vfid, type);	// instead of save_clear
	xe_gt_sriov_pf_migration_save_data_pending(gt, vfid, type);	// instead of save_test
and 
	pf_migration_save_data_todo(gt, vfid, type);	// instead of set_bit


> +
>  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_migration_data *data);
>  struct xe_sriov_migration_data *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 75d8b94cbbefb..9f24878690d9c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -16,6 +16,11 @@
>  struct xe_gt_sriov_migration_data {
>  	/** @ring: queue containing VF save / restore migration data */
>  	struct ptr_ring ring;
> +	/** @save: structure for currently processed save migration data */
> +	struct {
> +		/** @save.data_remaining: bitmap of migration types that need to be saved */
> +		unsigned long data_remaining;
> +	} save;
>  };
>  
>  #endif

otherwise LGTM, so with kernel-doc fixed, and (hopefully) with better names,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


