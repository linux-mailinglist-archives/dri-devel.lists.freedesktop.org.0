Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46574C87468
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 22:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA1E10E46A;
	Tue, 25 Nov 2025 21:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjKseWWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E88810E46A;
 Tue, 25 Nov 2025 21:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764107659; x=1795643659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BXWmBEtCxWBGIDYV7O2VReph1A9q1ciVAQxSLCMlIFs=;
 b=CjKseWWOo36C2BqQ7uUR1pqsSfiCrZP+HeqyIt0Anzr3aS8sGdFYJ17w
 qLtiRn0OgJTZRzo21KOCbpuGXv8zIHoUrRD+j+4WI4KNbcQwfX0TZ+bmc
 XsASlf6+/0u2zkl68GaD4ql95FnWIzKUGQgXsHoMGALyshWO12GATbzpv
 JsCfwQcwuseuP774mawta3giJ0VwCzfBY36rql3kbdqASOZYj7bmrNFEG
 X86g994KDCcEZ1lLLh2NnIXyKnc7ixdU8jIl/XfkUWmLAnuvL/HCaFpIo
 zexFWKv40atvLVi4k6NPuHhstCpG0RtTVw4rWY6ywO0LYdFQw8N4O/NPj g==;
X-CSE-ConnectionGUID: Jfu4TX06SK2wp8qc5fI+iw==
X-CSE-MsgGUID: H0ZL9TevRlid5NVhavNyIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66083021"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66083021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 13:54:18 -0800
X-CSE-ConnectionGUID: Lv5d0ddLTPmSnfuyRrDszQ==
X-CSE-MsgGUID: 3mNPShaER6i/F86/G1KvNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193573823"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 13:54:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 13:54:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 13:54:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.25)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 13:54:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yn01F5+W3/0BJQgMkYK0P6+B4jLSsp8G6nSOs8VHA9NUG1TI+oTL95q8g/SOK2VA1EkT6A+PK1Hi9pPt/f0ZyQPd6kL327/K9go8KhvY66YZHnnGspiCPYddQDOctJRDo2Vx4gF3pviIvWknXb5qjfveQozk+uHnloeHfjdUeJiNTiIvkm7dVoIaosX0O2IkK+L0DGXM9vG5vku+pvIW7tC9N6diKmzwkxFh+EHHWUVCOI5BBtwXpnuvFUhP9O7v12yeO2fJyvrV0ZtqtiERQ/WTbIboGg5ffGeAjVLh6kBsmNWuxtFDYPngm3Vz+IDxejQxYB4OSfVzpasEkS7D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZWdV/E4Kdafjg5fg0nAeOsHwo9hVc3VYl8csT382Ps=;
 b=sMI4jci3teHUuZuG9Hl1drooOh70PIB86E/jQWCZ1L/Gnf2z1Wrsdi8KvEAwC2/tRgOUvtdsO7m2wA/TwJGzpkTHAljDs23IswD9rfE7zVeb7zPFzeOAlVehT5aJmup2wry78clcAb70flFSxzYV/BwBdXVwKm6D7NZbpq/OU9o6VyD0iwr1wTIjVCCbHzZ/Dw5RbjWXovyR/7UIfXH5Trmu5se4o4NV4NFCLDwv38pgGum5/mvmmhpTge8ORrEyQppW9Z3YuNM/nThC+yK3H5St54FipAQBxH/tyJlGmVCfLLGGgcxD6w8iQPEa9Q0IlTeHf+dWa4Tx2hpiz2BTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 21:54:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 21:54:12 +0000
Date: Tue, 25 Nov 2025 15:54:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: ZhangZhiJie <zhangzhijie@bosc.ac.cn>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <jeff@jeffgeerling.com>,
 <wangran@bosc.ac.cn>, <zhangjian@bosc.ac.cn>, <daniel@ffwll.ch>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <guoyaxing@bosc.ac.cn>
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
Message-ID: <743pqjv2sefs3bhsyyoezv2nzf6tcbc6fo5nshczsc3s36j3qy@2xla3yxhbhpd>
References: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
 <bac7a05b799309fe2c269232e70e82f86a8e2811@intel.com>
 <1657dccb-3d03-420a-9ffa-5601ae212fd9@bosc.ac.cn>
 <58728a8ae8f0a3e92be203a9296d120fd12da8d5@intel.com>
 <14954d6d-67bc-49f4-b394-3da4e1f80af1@bosc.ac.cn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <14954d6d-67bc-49f4-b394-3da4e1f80af1@bosc.ac.cn>
X-ClientProxiedBy: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad5d841-0b75-4a0e-7ac5-08de2c6d2b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L+6YFrGiolpADmFif2docFeuKMzxAkJA0BPCh1DIHpIbpnzQIMvp3r+wTDE/?=
 =?us-ascii?Q?LzkjquxQeBNJyNeGM5FtkwBB73p/o03FBrOppqTvmRSBMjslKdJc6p9diC8d?=
 =?us-ascii?Q?wxMqUN00Y5xwErae4gsWljEuoHunOHhqGGd832SnkVYE2jBibetM3EIAvAcf?=
 =?us-ascii?Q?PuCLBLknPDJKua8j0dgFra4B3i/ozIu4i6OSQfauxT2PoOc2qtJssbDMcy/R?=
 =?us-ascii?Q?yYdFolJ9pNB66usAaVYDEYrydWDttslUzmSHUJ2PaZXTifrM/xPyK5zC69iw?=
 =?us-ascii?Q?jgVzvBgHg4Brqw6mBVIUHQSiRbCmn0a2J9HAQSnJVPwTRQyUORVwLycSKpsz?=
 =?us-ascii?Q?NK3qPyrcKdDEwhrkobuyHfQUpT4SYz4Ux89Yx5mxwHYKzh/w/OtaiwFyO00L?=
 =?us-ascii?Q?ZxzTxtN3EBOiHGqMqrxE06quTENFfVQHc5hkSPjWFD30zzOJu5J+u+51DMzl?=
 =?us-ascii?Q?FkvPyFOqVkRfsBcsy+E3+kSE/CJ9wf6ScPk+AviualfRhEnsKucdMDz6UgsR?=
 =?us-ascii?Q?J/BG6WK3gUN2VhExZgA268xiw90dnSNEKB26K/fnf1mI3+M9OMJHS2u1POkU?=
 =?us-ascii?Q?piXwcT3gk3vU6tAw6FfyOjdRbsuU9muWvb6umvE01Jm8pBG0sLzT4L/ek+HI?=
 =?us-ascii?Q?Kz0v6kGO0Nb+EetZ7Hi2BTWEMF6AbsQOPnC2i6YM15GajJAk5lvj06GTmGFK?=
 =?us-ascii?Q?3IIEZmJ3SoBqw7kQr+6H4xyo6XIe2JOzQqZXrBB6QZHr8fJmr+HQnthYENB9?=
 =?us-ascii?Q?ixxCmFd2V6fO12JHqvOPxNCzyzYjmA2xhlv2x1r8T26Z+gqe8Ub3rwcC2jc6?=
 =?us-ascii?Q?p8a3wZ49mTsh4C0ubwGoKdWxZ3ve9E1rNZlak8sHbopKhZDlOP1ujlWhaMyY?=
 =?us-ascii?Q?7bXDee3Cmf23Dd5FJBYATvLBiUNY7Qf1LVasi4DmtJ/d7d/jJrWy9pCqkR2J?=
 =?us-ascii?Q?+1dmWMOinQKICMQxo3yz6K18a3eEpOzBDxhJNCIr+YrwZafD+77rhVy5FCrw?=
 =?us-ascii?Q?B8IK84DD9DRy1lT2wCCsD8dpMqSbAY2QgMDna0potv1mlsjTlj/SPngD15U+?=
 =?us-ascii?Q?/aifsz4lBergUSXn8WdXFl9VPllD2yshPsn01CapCRbJBROJYQOjqAVvhNFn?=
 =?us-ascii?Q?To3TYoAFhwozi+Je2XwIo9ukb7lIZRH0dmw41aJMfBjykSEQzNAkc3mvW+Tt?=
 =?us-ascii?Q?TfZvqlXnT17AvbzA0LZiFbONolyl/ERwx1N3t6WoppAQLfqS+bnUNyMdUUle?=
 =?us-ascii?Q?Oiaz8bdGxHn7Ftc+vB6iJE3qWqr/aZNKi2tBNprv3OuUscjWFYBDrLmfvH0o?=
 =?us-ascii?Q?3cB+9IuG+aGwgcAJbCYR6ckFiCkn0JeH/BXCufXjmxHL8zVA8JKrhGDXIevM?=
 =?us-ascii?Q?g+2laAhhCLSD9izGDI14hoIo/xV+fhxeaSC06klhTcHHGXCgcMes0i7TXFAJ?=
 =?us-ascii?Q?+CXxJHOveSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJ9CdsQ12Ti28JFCYkegXG7iqkmq/Q+MadQBtiLzB6OUwei5Vdi+Y+05HuDD?=
 =?us-ascii?Q?eUN602Tk/Rk5KWhGipKR9ozUlQp3slugqqlN/6QsLu3cvsbVM2cQHjymEtac?=
 =?us-ascii?Q?uJY1B+zuQMCpchzPoYo4EOF+vejm4SeuSs83EAMLDfmHNun52dUSKFLEtzXY?=
 =?us-ascii?Q?A0JUr8cetXWraqWqDvBggfgl1a+84wMgYwrvWt3P4+2XYU0Lg5HIjWhRy2OT?=
 =?us-ascii?Q?MUMkcpRwzgkJdN2kKRgU4MMfiXe7xUG2+m+YrYB8366Rc3pK0UVl/WJ+7dp/?=
 =?us-ascii?Q?+fY6JAKjGnMXdkadWGTCEoXbfJfhTQfDDVUecqyEv3kzOTTIAIGV9pD6K/Fh?=
 =?us-ascii?Q?e+k6FOXzkR3ShwYLRaXy+J63VS5lz7JZ5xbK/MN4xntWjty1opAKtrrrXVL6?=
 =?us-ascii?Q?m7gE7Ag+qM4pik6AviMe6QAysUdu7Hotykhj/o9b0WYha7kvznnG+Zl8vinA?=
 =?us-ascii?Q?s1SlZoYjQmsboMdsUM6180lwwp18y5hjH7QEYc14cuVAisVCYQeQMUf9AtT/?=
 =?us-ascii?Q?bK9oF65k7T8HCLCNHNYD4eE6Lyh1eQLpFmXPd3OKaYqsnlWLk1X+yS2rfdGH?=
 =?us-ascii?Q?YmnGXSUcIQ6A6n6GJiKWUxv79nOeafZn/E3iVVazgbN/+3TMdi108hV+C05F?=
 =?us-ascii?Q?jglf8S3WK4ObPXhPS/acJgT6OaiQvBcKYLeGwX4QB4vOSW6KTJ4RqarSpnTt?=
 =?us-ascii?Q?uV38cgvNt6tLxcbpp1npWopMoRdn7ufUn+Bwe9UiG+lV605ZLLrGDrxYvGvu?=
 =?us-ascii?Q?3b2Mejbzf4seu4fUQzv351QHVTEgs/3Vr3Y3OCNXD+FrMLsmP5zz9YPsEDd3?=
 =?us-ascii?Q?RXIedsAKSeXq3LN8sXSwEroam6cNIuR2f4OUOxIY13jlYvmzV2wxmOerHeZi?=
 =?us-ascii?Q?Y//tvJrbOJCETvpYOcqwrCHq5oSjsAUzv2uDUBhQav9wrPBCHReq3+W5+5kU?=
 =?us-ascii?Q?6GOqXb9JDd8mt+3Yy5p8GyrYsJby2rCr/GZE3mtxfQvx9OzXHyjPuUMnPVba?=
 =?us-ascii?Q?motGbK3jloIWreZi7rCrrhrYRGjg4oDLM1INvD1s6infSc6i0iLsj5x61Lp2?=
 =?us-ascii?Q?n1wv3G6XdQmP8EmVqlfG2bSHPCEyScRKsNrE1uRUHsyDrdMyW3Y+ggnAa4dg?=
 =?us-ascii?Q?zzou1sha0leAy2URkc10UKChZ7WDorY+7usx20lZ85yrENvYWk0EMOoFRjMl?=
 =?us-ascii?Q?BNb8y3TeIUCVGznMIUC4KDi7evzCAS031UrzWxFMgDd8Y6HqiT53cHWC88Ka?=
 =?us-ascii?Q?mpCIhL5GrWHHaZq2Uwqhz73xYYB0ceZhtnDGKGyDxpTkiO+yZlfjVEBfANrI?=
 =?us-ascii?Q?yGa+eUuIwzTNR6c2/kd69TSRBtIwE3eKuLfloZjafkqJjKKJGS6A+lb80TZQ?=
 =?us-ascii?Q?3QXBa5gQ8mRufLcwJi8r7BbWKnFV8rEvvxBzm0lrMVt4Le1HbXTSvxnQoapk?=
 =?us-ascii?Q?81TFnBxrCR/PIBgIiLc2bMIRzX3uSgxPYx0mgbIoz0utoAs1PX/3BDcwiyxj?=
 =?us-ascii?Q?c1qmdFCvO3wi2580/iAl2Ucz7XRyaC2WZ9Cz8BaMmC+iiVCC8cyJpuJB3CM6?=
 =?us-ascii?Q?aun70MikOXBmqx9RkuHQdX32BFk7KKpl25uedx/Vzmv9701G9r+Wo0W9RDyG?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad5d841-0b75-4a0e-7ac5-08de2c6d2b30
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 21:54:12.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOT1EQEyqs7GWNfeDw9SaUp0sgc7bsDavW+zCWlcd8N97CxgQARqRWMkvOCWKjpw4OUwQChHFB/MyIFd/rYZEysIf7p1jj0jWIZ1fImpvVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

On Tue, Nov 25, 2025 at 06:20:00PM +0800, ZhangZhiJie wrote:
>
>
>On 2025/11/25 18:13, Jani Nikula wrote:
>>On Tue, 25 Nov 2025, ZhangZhiJie <zhangzhijie@bosc.ac.cn> wrote:
>>>On 2025/11/24 20:24, Jani Nikula wrote:
>>>>On Mon, 24 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>>>>>inb/outb speccial wire not support on other ARCH.
>>>>>Should detect whether arch platform support or not.
>>>>
>>>>Seems to me it inb/outb depend on CONFIG_HAS_IOPORT. Which arch are you
>>>>talking about specifically?
>>>
>>>riscv , has CONFIG_HAS_IOPORT.  is using for serial, GPIO., etc.
>>
>>What is the actual failure mode you see?
>>
>>Does it build?
>>
>>BR,
>>Jani.
>>
>Yes, i compiled Xe driver, and it's occured load access fault when not 
>disable  VGA_SEQ_*.
>
>can found this link https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/510#issuecomment-3383284831

and this is what I tested with rpi:
https://lore.kernel.org/intel-xe/20251119-ioport-v1-1-ec43f1e12c49@intel.com/

not sure why you are changing the intel_vga_disable() function: out of
reset that bit is disabled and the function does nothing:

	tmp = intel_de_read(display, vga_reg);
	if (tmp & VGA_DISP_DISABLE)
		return;

If there's no VGA, no bios, then there isn't anything enabling that and
we don't need to disable it.

I have a patch that moves the vga access to a separate function,
intel_vga_set_screen_off(), but that's mostly for clarity, not to fix
anything. If later we want to add an ifdef then we'd probably have to
implement the alternative.

Also note that not having CONFIG_HAS_IOPORT doesn't mean inb()/outb()
are not implemented. See arch/{arm,powerpc,sparc}/include/asm/io.h
for a few variants.

Lucas De Marchi
