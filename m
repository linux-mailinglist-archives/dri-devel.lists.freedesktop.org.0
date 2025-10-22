Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B987BFAFC1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA2D10E6F6;
	Wed, 22 Oct 2025 08:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqeRM/+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3FC10E6EA;
 Wed, 22 Oct 2025 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761123169; x=1792659169;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FtWp2+6s4NYmx6K9KPoWFGfqZroqhvS9P5tKTaJ3qco=;
 b=SqeRM/+9lOyA37SxBC4BJQQIcs9q88PaNTo9PDmw5CTD9kJslqSUfwlP
 LCvEEva9hkaNMO/EAzxtN4VHLykN3srPEumfmW7SMO2Y2olherZ8KP7P4
 HmRsbJe4KcPz7bKfQcEiIXMkEazdv4Ow/hB6e4JaTiCJ8uRb3All1l3Tm
 rodejjdnMdTk3SyJKnGBVXRxaVUbenN3iS0IJW3ZI/lODNh6Ir7PsVnTp
 bPAg40QTHb5xIgKHgtec6mx/tOMfR1lt9YrKpUR6SmoeVGVN7IhRduX6a
 p8Cpd5tcM4GZODEqZ1b9JdFFOGDjX2d4Rt8s64zSuI2tAuVsu6o9N69OG Q==;
X-CSE-ConnectionGUID: iGtjrps6QX+yYSFhDc0IJg==
X-CSE-MsgGUID: JivbJKkfQ7arxPt2G04UNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50837916"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50837916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 01:52:49 -0700
X-CSE-ConnectionGUID: PKoWQikyRQqjEJoMOBEwCg==
X-CSE-MsgGUID: DMBJdXMzQKmtglw4gnuurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188226376"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 01:52:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:52:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 01:52:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFVRzAJR1RXptnYYXU6vuMMYfxkwHXgJ8TZ29Fn0E9KgWfdE2V0dvsO/dAkVJQxy5x+I90cn8obtV/QotgB74COQuEWQBLNlsQoRzKlmjyxN3N0jefHXD0KdefyJS1CfQAdvMiFpXiwNJhKj0wlWFlCte7GY/yMFmlo2dBpe8qxH28820qjozQvBK1H7u0UsqTJBKuPvJDoKaA/FGKNrPbq6bpqXkRV4ICOn1k/tBFamRY+KAQS2wDwyJlpRKpeUdizSo32rPWDMwsNNOjNnl6If5eaf3kn6tRnOOdbYFzSkU0rH3ZZCfF+g1RTzifj7TOeH0auneBelf9dHcH1CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+TjE/2lk/q0MQ78Xu8x72nn52ULwbBiDJTL5N+Y1Tk=;
 b=QYnG1Wm82rOxJUR02mJlJxlJtk9NLaGsbEKgjrtt+1pvKyV3pMPgIntWuOGkBnamxAZpmclqUZOaiLyknjJ0a6cNXgAkEhLZ5FB6K6FDNMrmNjVoq9bPNgsB4TRHHLaQUIuFzxf3jVogXe1jbTQxO3A68rEHMUr40jhVFTJlIqBiQ82qeKVjcQ0uNNQZg63h3bvVVJR/CuzFtH3GqSqQoE1tRL3JumBxFM8fvRF7UxZwIpVGsj7WlYoHMzgFYAEzl3FAdfFlmWh9UcCpoKhH+mSmnuwb+O3OmkgTwMNvaeblSNM1kzUY8U/417ASIEHRjiGt74/koTL1D0Bnu8EnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8121.namprd11.prod.outlook.com (2603:10b6:510:234::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 08:52:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:52:38 +0000
Date: Wed, 22 Oct 2025 10:52:34 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Christoph Hellwig <hch@infradead.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Message-ID: <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
 <aPiDwUn-D2_oyx2T@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPiDwUn-D2_oyx2T@infradead.org>
X-ClientProxiedBy: BE1P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af79e57-6dd4-44d7-8de5-08de114859eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXcwa1Zwa2pOREgwOEUwUzUvSlFHRlZYdE44UU1aVzU2aDVXeTY5a3pZYXk0?=
 =?utf-8?B?a3pzSkJyVVBiQlQxRVFRSGl5UDd3UVJwbXRiN0tXb2N5QmsxM1FrdUJXVjRM?=
 =?utf-8?B?U2xLM2V2SDZaU1NIUE5CbnZQRGJNbEc5YklRd1lkNERTVGJuUWN6NDBYemln?=
 =?utf-8?B?WmZPR2dVdmhTWXBNWVV2SHp2K0lCb2F6L2tBRGU3bUpqZDlkeWRnM2NCV3l5?=
 =?utf-8?B?VG9ORWtrcGRBaWdlVGRjc05PbVFYVnJwNEtrdFVtY01ZazVJcjQ5QUYwV1Ix?=
 =?utf-8?B?eWp1OFVVTkhFTVAxelhvZXVhUVJmMW9DSFBwbzltNVdPMVYxbzlIQXhFall0?=
 =?utf-8?B?YUozeGhGRVZGVGw4OTBhTUdESFIxZHRsSmMxdENhTzA2TWtBdFJEUlNaTkZ4?=
 =?utf-8?B?V0hmUGpHcEVDaWM0KytSMm1uNGpIK3NLaGlsNko2OEE4RFBJQ1I3UGtFbExV?=
 =?utf-8?B?MFhIK3NNenpqK2x5cjh0K08xR281aE50QklwdE1QaFBkSzUrMm9uclAxSWVF?=
 =?utf-8?B?N20yUXNRdmZBb2lndm4wdWpmU2EwaGVVeEJQNFVMZkM3WUJwMVdZSnhWMTha?=
 =?utf-8?B?N3htT09yeWhvS2FWcVhKTE13MG9YbFMzMURTVkhrWCttakE3RzZBdkM3eGd4?=
 =?utf-8?B?MWhhZmdEeC8wT0plZ1ZhREEyWXhzc2p6VFBSNitJU0FJQ0NqRGhpamhrR0Vi?=
 =?utf-8?B?TVRlM3Uwd0VjeEdDSFgzTnhzcjV4VmppZDMrVEtIUGNidy9EcldQT3hSWXQz?=
 =?utf-8?B?anB1UjNHQzg3ZGNrazc2bG0yNHdDcm5ZbkRJRURNZVZsenQrYnFuR2x0aitx?=
 =?utf-8?B?Qit1U1MzVmFWTFZocFBBTjRJSzJHbFF2Q3ZxRG5zT1RxM3FYbk5uelMzN0FI?=
 =?utf-8?B?OXBQT1pTU29zZm1CMUxlSWVWSDFheFVpZWhmSFRlRkxCZit2Snc1RWZRYUVz?=
 =?utf-8?B?TkZZTmpuRTVKUmtNNVlodzhEMUZ3bUhzTGhwcWZWdWlobFdoS3NuSzA5Qkgr?=
 =?utf-8?B?ZFIyMWM0TlBzamc5a3Y5K2IxR3N1cmxaQktjMXAzV2VZM3V6WXJtcm1ZZTBq?=
 =?utf-8?B?SzdxdTVCL0pOVzFHeTc2N0FIdEpuSTJwMkE3NG5TZThtaUtaaUdlQ0cvbHVw?=
 =?utf-8?B?YkRVQVh6Mk1hUTJUTGxldDgrcmp1K3p4SVkrakw1eUNxTGsvZ1k0UmtDMXJE?=
 =?utf-8?B?Y1U0K0g1WnZ5dVc5MVhlZTNoOXdLSlpGZ0pYL3pDRGdMV0NTSnJveWwwOExi?=
 =?utf-8?B?cldoYTFGekg4cHlqTk5sWmQyN3hFYm12RUM0NFp2ay9Fa0gzSjFDd0VvZ1U3?=
 =?utf-8?B?bDF2TEFEeW45bE5NdHR2dXRKOE1OTEowWGdzNUNpTU5oM05KSE1peUNTMUpK?=
 =?utf-8?B?L1AzQ0RTOGtrQzlLYnhnaW96Mks0Znd4UXNSekJURUxtMWIybjd0NVNOZHJq?=
 =?utf-8?B?dktSak9IYTRteXVTdHYrNmpRMHNJTEFOaTRmRW4vMWVPZzV6VE9TeTBWRzJu?=
 =?utf-8?B?VnJaaDcwdDFhYkFQZDEwT05KenBOZ0toUjRZalpxVkEzeGZUeHYybW9jRGhX?=
 =?utf-8?B?ZGRhdHlEbmkzYWx1T0RXeUNWOVBpZytIbkxaRW9mamFtS1VJbHY0RUtNZFhL?=
 =?utf-8?B?cVlhZnJ6UVFvck5EUkZCdXdxVVZGRjQwZlBQUkluc1J6YkRTWlhlanpOUFZ4?=
 =?utf-8?B?L0ExYVNHaWRKRlo1VmFEcTdTL0JoM0p2MSt2NVp4Z2VBeGVtVjJJeE5rQzFa?=
 =?utf-8?B?SVZiZEtRS3AzZTVVMmFWYUNjSWN4RlgyVDVKS2dlYUY2SmRDWVZJbTlHVmNi?=
 =?utf-8?B?LytWUlNCc1VOcG1GbWJQWC9HMU9jdm8vWWh6VGtGL3dwL2Z0MjIrazkvS3JH?=
 =?utf-8?B?VmMwUnJhYldwdW10YzB1aXA1S3ZYNlcvcVczN3NuYTAvL2E2NnBBbVpHb0F6?=
 =?utf-8?B?WjZZRlpOaVMxQjBRd3RNQ3NzMTQ1dkcwYzNFS1c0NVl6b3k5MFMvSCtUZU1B?=
 =?utf-8?B?TjZuNHdsUWwzVTIwdUFXSlBHSzZubVJGTkZ2RldjOUlQaVAxcG9XVkFrMWJY?=
 =?utf-8?Q?99Oq3w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9hRmhIQjJUVTFadW9IWFlzUWt4VXFNSmdIYWpEY3JmZW9RZDdZMi82dU55?=
 =?utf-8?B?VElvTklnYm53TCtZcStsVDVDdTRNeUpNZ3ZkMU4xZ2V3MC9DaEFZZFZzdW0x?=
 =?utf-8?B?S2lpMGRGY2JyTWwzSW5BZmVUSjFJejU5YTFvUEo0cTdvS2pJcW5HYWNJdCtx?=
 =?utf-8?B?UTM5QmRFZmlnbkRISm10MUY0cVZRbGJRWTA2aWViOWxlY0VKQU54SXJrTXpM?=
 =?utf-8?B?amljb2NOR1hRUVpnQkc0WEFsejNNSlBMdFlPNW5vRFlPS0ZQRGltbnJZSDZx?=
 =?utf-8?B?b1dkTUQ3RzFRd3BYVEl1cEVOVEZZenhldm1WTXlOaFduM1pUMWFtRjJSSXdx?=
 =?utf-8?B?Zlczb2QzRzQvYzJlUUhSRmFld3pVNzBxaGpZVTR3NVYxNmQvR090MW5NcDFx?=
 =?utf-8?B?YjVYbTZuL21OVUZXZTF2Zkt1ZjJWcFppVThRV2pEVUI1SllBdnpJMWF2cEh6?=
 =?utf-8?B?RTc2U1c2N3piTzZaZ0dHN0hOMlZ3S1JwaUZxT3JOTGVySlhnd1NzVVRPNXUw?=
 =?utf-8?B?NmVuSTU5MWpYdVM1OWdmaUV6UWQwSll1Z0I0TnVodDUwS2pTYTVqcGV0UlpF?=
 =?utf-8?B?eGRKTUsyYTJZWW5CamI0aXpNMEU1WHl6VitUNlpXZVFYRXIxaFdyR04wbEo4?=
 =?utf-8?B?NnB4MzhLb3hqc0tOM2lkdFBKU0JEWDhRdGdDYnBoTjJuaWFJREFoR0NKYTNa?=
 =?utf-8?B?NVhJemcwb0txb2VvWEdZRXl2MFNTNERtVXRzNXpRUWJCQy9UQzdWSGxGd3E4?=
 =?utf-8?B?dnFweEx5TWhYTFNGR1gvQUZtaURVTDhaRm5vU0dDaW90Y2xsV2h5bkp4L1dh?=
 =?utf-8?B?UE16ak9XcFJvQzdaYmZ3YjNpT2pGZk53V1N3R2dNRHNMRFcxaS9ZUnN3NXha?=
 =?utf-8?B?OExmc0o3b1FUS1hNMXo4QldQZ1JkUmFVWDFTWkRCdlYwaWNpeXRBcyt1a1Vq?=
 =?utf-8?B?NmdqZ3Z2S3BuRXJZTEIrOTJibWs5bXd4ZFpobXVNZ0NFQnZVeDBrOS9ZV01U?=
 =?utf-8?B?dVlKUVZRQldXUS9NeFlOR1kzWGZjMnlyc2N0WEVBT0QrbktvS1lFU2poQmF1?=
 =?utf-8?B?YUZob3Rnc2lFMnVwL3dZR1YrK0V5OVl5TURNRExTYU9kNzhJNnhnSDlzcFR4?=
 =?utf-8?B?UmxtTk5EdkN6V2tKc2tJYUxWNHlaK0loVU9nL2Jna3BYSFJTYTdZVkdBbm1P?=
 =?utf-8?B?bWtUTXpNZVdSbDlEMXk3Nk13NmxhYmlQbWhiWlJJY3VBTGxpTWwyU1loc01u?=
 =?utf-8?B?RXk1Ri9xSXJoSUluSHo3MmRMUWFpZWp4UTByUzh2R0xHRERiNHp0R3RNM0ZU?=
 =?utf-8?B?d3BYOVVzOTVpMnMwQUlRZ1hldU0zZCthV3NwcFJ1NkV1M0F2WTgremc4YmM4?=
 =?utf-8?B?dUhINkl0d1N2ZmtXclprR3BUNmpubTNiVVhnS0dZQUJ4aFM0Q0plbWtTeXAx?=
 =?utf-8?B?WHA2T3R5a0ZncEhZNUZ1a3l5Z3pZMVJBWklvaXRqa1FOdm1nQjlIL1ZuZ1U5?=
 =?utf-8?B?MUcvUGt5ZVdLRmdLU3pUL1NSYllXSHpFd2p1K2duaENndm5oRzUxaEd6VkdZ?=
 =?utf-8?B?QnltSXhOcUVYVVpNdXo4TXVFSmM3cmV2ZzFQMmJia1lLZ1V1K3NrL3Z2SDJl?=
 =?utf-8?B?MmNQeEpPOCsvYzBSckZuV0RuYll0WHFxZDgxTXdERm43dG90bnNldDBkYm1h?=
 =?utf-8?B?TnZkYVNpR2xzQlBuNkQyb2V5cHVXbnF4bGtRekJiQmxqdXMzTGJycW5ENFBQ?=
 =?utf-8?B?R3dSSnpWa2lid09aTWxSMHpQeWtXWm9KY1g3UEhDVFFZcDhVN2tRc3Npckxw?=
 =?utf-8?B?bnV1eHk3am9MZDc4c0FzMFVtbjdPcEY3REVFaU82TmMxaERUd1ZNOXhtOFRH?=
 =?utf-8?B?WkszR2Q1bU5SQTVYNy9OZnRzaEJxeGI4SitpTE9xcFZ1MmZhanczamhQelRN?=
 =?utf-8?B?dEFrT1R0SDRFR1Z5ZWVRODBneDYyQ3c3a0lnWVN6ZkpNMDR2RDNrTnZjYTY3?=
 =?utf-8?B?RGQ2NHNPWmtEWnZLTmxiK2FXb3BwS3U3dGJNM0ZJTjN5QUZZWTh6dHdDTFVQ?=
 =?utf-8?B?bHBEZjZjdlZwWCtlN1VTSytMQjEveUZ5blJkcGkyWEx6OXdqeS9tWUREbkRz?=
 =?utf-8?B?Y3ErWmlPNXY0S2czcndQc1RWRHRnMnN5MVBSRlR0M2ErSGZrZ0NKNkplWVJC?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af79e57-6dd4-44d7-8de5-08de114859eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:52:37.9381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fd7bbED0PC5LV8G4YhRhnrGWpZ/cKASRfDRgFnY9ikUR/ctLYu6AiB6Md5wCMhpmFYuzcLDkKH9nuYIC8fsg6HPInEBH8pliEBP8btCQ5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8121
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

On Wed, Oct 22, 2025 at 12:12:01AM -0700, Christoph Hellwig wrote:
> There is absolutely nothing vendor-specific here, it is a device variant
> driver.  In fact in Linux basically nothing is ever vendor specific,
> because vendor is not a concept that does matter in any practical sense
> except for tiny details like the vendor ID as one of the IDs to match
> on in device probing.
> 
> I have no idea why people keep trying to inject this term again and
> again.

Hi,

The reasoning was that in this case we're matching vendor ID + class
combination to match all Intel GPUs, and not just selected device ID,
but I get your point.

Let me replace it "device specific" to follow the VFIO documentation.

Thanks,
-Michał
