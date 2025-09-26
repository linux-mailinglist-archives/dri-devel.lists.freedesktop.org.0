Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E528BA481C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D3F10EA90;
	Fri, 26 Sep 2025 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhWooFkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C128C10EA8E;
 Fri, 26 Sep 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758901960; x=1790437960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F3GMFzDU+9qSYrK6L3DipkYsBOWUp0sEmb8kcToDzg0=;
 b=NhWooFkH0c30PNYskM9N1qiqHXeCJqv1gkRwYuYqW83VZ79LnpVU9hK8
 jkhtNdqfLeSI3Sm/Uiva+99DHFqmS+yGBbGyFrFMHo2F9EGCSL5/0Za8P
 Ohe9pJE/jFcoYW6v1sMeefMlU70dc05xLBE8WjCtPl+yDgKvMonQU6QwP
 iSNIpdCCmARZpR7vLoSpHq6F398U4Dz24FF6wuDk74YOPOEDHz1bGQJ7a
 DxGJSICncSznhddAfve3N1pHub2ibLs83SvVasd+uAayJrRY+/Geo3Ykl
 mF5UvdRxTqayhSAUKjo9jSYxLv8n5hCUG5Q3YQuGe17n1GlJ15hv+e7l0 w==;
X-CSE-ConnectionGUID: mNPNO/YhT7+Skp+7RVU21w==
X-CSE-MsgGUID: ikEwXx7CSrG5lT5SquPeIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61348103"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61348103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:52:39 -0700
X-CSE-ConnectionGUID: LvDgNVZaSxOxYh6T2EX0ZQ==
X-CSE-MsgGUID: uX0Va2EqT2OHh7oQhO3WmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177203268"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:52:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:52:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:52:38 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgPoFWOlOJSNjiftWTNrKEoUJQzzOtczIdc70QyOe6Mh4p0ZJFWxc8zvph0W7UeDWsWI1fqBwY7LqT5ppicL22+2rvAN8atUiTCuk9zeyOHzer1No4N+hgyTlfMKSGqTCACye7qg913FvQF9RAwBI3Er2p9o70JWNfkM3S1ZTWZnBwdFdRZHC1R0ng4Zen/GnA4zToU9B5CbtPrcFGJZ0lrGm2tEbNFabXyT5nHmvccUcurHTsLFro0o0GeVrnIMW6MM61Fa2MS3GoetBeidV3mMzMlfX18JBILy4BKSWJQCp/aopKzrDhjcmM31xcOXgmyjQFAVyVlorev1xtt8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dh4+pyyoBdWeMmE5UtMIkNktW2lV1iu0KNuv6MChWyg=;
 b=QOXZD7ywSwX4l9+y45qAUfDPGI+MRJJKvr6eF0Q0n9gI0D7pcbWEiB0gUvOeWk5wEeTmY42SVe+AqJT9IZYm6W4X+0Mkkafl4HmAXRN3ezEamvBZnTqArzZQumLtJaTjscVH0Ft/e8j7dJH12i2hjIhzl2hDK3l/6wwyVbFnOlUhicENZVKjvDQV5WKddYAHn9WxPfbNw95+CFTusWC2IXo+wav7O3pB8a6irrtLCTeXBZVH7YJ6rwOJ3Fmr/iXEtZmof4lUKA0aziDxdWcwFNBYijbA28lvavHu6Jd/en6C5ocK5TNvTTJsP3mGwvb5tbfGIZ2PhQX1VDfm76fgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 15:52:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:52:36 +0000
Date: Fri, 26 Sep 2025 10:52:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: drm/xe: Linker errors on configfs symbols
Message-ID: <t5lgk6bswoaetcl4cr46z23cy3tzewkwiqbsz7xrzrvdkloaar@lsulxa7ti4bg>
References: <fa25d9b0-1ec5-48fb-9249-78754eef6bd2@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <fa25d9b0-1ec5-48fb-9249-78754eef6bd2@intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: c06ef207-fc7b-47c0-d45a-08ddfd14b681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gqsWte09Ds8yxJXx+0WVNlmd1isqGfSvUkSoa6bCz/gK5Z9BZY+rDQEL4mVv?=
 =?us-ascii?Q?XgKq1Nhb0+ou0vTWvNdeuihWQF/QY5SXhk6zqI9MovI+MJpuNpd1zzk21IAG?=
 =?us-ascii?Q?sOuJzuKDSYBlU+XP/0Jsg9jTvXXAsRCMPCiTpGu6QTgvLrP9NCtXE0vUOHH6?=
 =?us-ascii?Q?r0tbrNXYkzuXGwT1FnOFP2nk7xV1YVYXWfhjcRo4s9DXv6w2zHN+aa7Izy5J?=
 =?us-ascii?Q?ePmhQCrAk4/JD9maLtl8xs5hE80shO1wy9xLQXFXKYZ/O+HfMIckHgM75xqV?=
 =?us-ascii?Q?FjXZ3JPuFv9MUmI/ndjvoRVGN+4XRzkqvZfEgmDoP8+pFfEJpq4hSY/Ln/m9?=
 =?us-ascii?Q?QhlEo6GKOc/IaGeBm8nxvIGUL6jdqOsH5ymcOnXii0BkdcwMsGhYi4P4Soc2?=
 =?us-ascii?Q?YOGTS7c/n8jRvSkCo/Pi0hl/pzday/YXy4UU4GpSRi6NR6P/m7W4qPjN5dPd?=
 =?us-ascii?Q?N9gF7zkUss4ZEL3zoV9LKzll7lq7DF5wByfVt6w1DnQpesrMP3bm483exnjN?=
 =?us-ascii?Q?/kULj9wFBYrmuXfStkx79oyJrQFQNIXcv/y1+Z121S+/Fc29vWgBCEiT48i1?=
 =?us-ascii?Q?gXkMocZm2M3b9b89X+IANcGUUJu8YRC2czrttuQWQIyghETEK6fxaTEhDx43?=
 =?us-ascii?Q?1veZ88/sjDc/y22QQtV/p6O2z9xak18p0syCswR5QLK/Mb1qPQkCpFp8o+Sp?=
 =?us-ascii?Q?iCQ81jL1ls1WQ1lvGiz3fdgTDoG4vVgJJr8VrOUxbav5UsouGknHEAkPGrIt?=
 =?us-ascii?Q?RHWal7u0h3AL/UeFBuuaiMMfEmw3XXTFtpn+u8UjQpNy85U0Z43OIXlSHM8i?=
 =?us-ascii?Q?oMM9wnWilukrrvNjhh+cpir1CKt5+Yt62pwDQWe0Er5/3D6u2UVm2b5arY2K?=
 =?us-ascii?Q?sadO2Ed2XCkG0t4FlM4ECxd0QIxgbLAUEWx7D7ydY1jxTE/9rCTLjVZIBlTr?=
 =?us-ascii?Q?KRbwVor7c4/7ILOBoSthUgJlQMeS7USHtDitrvKqDZxiUWfXb82iR1unKEn1?=
 =?us-ascii?Q?CsIaq1KZt9AeGBiZfCeHlXf2QmLPwChyIwz2bgzKvdxnVzRX8YE0Uuk4HrpW?=
 =?us-ascii?Q?qiv3lFv6GjxRgh7Bi2gaTklIAG2wTdZNLYhWcEmw1I8PjYXUkVZXWxmpVVUs?=
 =?us-ascii?Q?gJ3cFofr0crbJ3yEblZFSZgZgJG7LAlkFvbRjZ5DSBkbhjpy0XZVcpZa7kmQ?=
 =?us-ascii?Q?NFGJJGUet0O4VAnpSRe6gi8Mjfwzv9ccuqBRFAJzaVNUB6wkXjKtgIl4TvrS?=
 =?us-ascii?Q?MgFSk9XabE1GxDOXOC9aJnAjwMaQkWP1euJik/xZMhlMsx++8j0pKhGhVxrw?=
 =?us-ascii?Q?qxW3TTaowQIDmxZ+prtabTF9NjDbBJUfZY0EKyC2WYcAH2DtjWiY50SX7wQ3?=
 =?us-ascii?Q?6506QsofI68HjGAu6LLh1sGzooAD17BqqgXsxUPaeLl/UyeocA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8gjrH32vsOCwWF/xHcYEXIjnDFUdSCVnpgZgAB1Ux83FneSMF930JrnXuI+?=
 =?us-ascii?Q?inGwEvFEFQXDWZ/u6Y2eEP/qvNggZecVtMlKuspa6o9cf4vKd1Fv7rv83j07?=
 =?us-ascii?Q?lO7Plnm3kXj60khAwmCcQIhd9fc3t7JZa4PMm4VLrmqoVuCdrturDMqq9A8q?=
 =?us-ascii?Q?dlRkpHTyw352n50dgKtHpGYXU/PR7Pp9NTEnsbPA3ccEfx+cYtRWC6aDhbDd?=
 =?us-ascii?Q?46o5WgOEV8c8c88gkwipV5GN6rfDFVUCnuRPT9OPj5HK9iJCyc1NTHMObP3L?=
 =?us-ascii?Q?UUXPabN70T68Uc4ZjpzTLOmz9FBB34z+BdUPecl/gMstn/ixmbUx52ipEYGm?=
 =?us-ascii?Q?YrzeSTSW3sjhuqzJ/cQ2t5uc/wgawrhiSis0uFfVmJnv6ERu55NFrLs90qgB?=
 =?us-ascii?Q?e5vpIGhUaze6bdJ8bVGOS2tdRDPy0HlzTq3IzXbg0jIUltK3JtsCkwAbaGKk?=
 =?us-ascii?Q?jbEY68Zt4j4sdhLU00nzI58CLOWy9uaqq38UJaFXLZlFTZOCFlVsErog+2JI?=
 =?us-ascii?Q?8Tw2LmK6CJePtadWOsWCCrGeMGcu1sSeARkiuR7v2vzRlfE5IjYGaxoRpcnZ?=
 =?us-ascii?Q?WTo6n3s6m+KM0UT3AO1vmvKcYrKIGvWVbAoyyQOVZiCMdgQ0PB6FpBgumpLg?=
 =?us-ascii?Q?P2DeQnn5cXm9E36hMIhvdw5J7HnMrLNaY1vMJLJaUa6jLPdniBpD2kfM21/m?=
 =?us-ascii?Q?dDAmAFtilUKUMfuVhL0Y5DopcueM0E0dvjcz3IjDQ5lhz5/93Dhw3FQEYmAO?=
 =?us-ascii?Q?tnMlub8cL/sL4qarXCO7Q80ejw7X4U6WlIQj0cmtQdfDe7TPccc66R4TPVHE?=
 =?us-ascii?Q?N3OV4ztCiEoGh6q4/yokuSRVSgXykufq71a/ztWLtpNCcSLopEiLTWV2EnQd?=
 =?us-ascii?Q?Ws61eNpx6A2gHGVE1pd/lVlEM306p8djOj6byuQKCtys35eZfzyrORMzg5Hn?=
 =?us-ascii?Q?W8v8yZDjPD/ET7sE0q55VhbOVMq6VASzaOhT4dY78BKW7WCpKdzwpw9xhUZl?=
 =?us-ascii?Q?euBb60l6Qv5lDkx9c27U9TiCSYS1tk0OafzT7koT+NNbk2I1oP/sVj4vqQwD?=
 =?us-ascii?Q?GOTfDXGou3G8DsukfeLsBaL0zT4cbzYriTcvPY4jsMz12rSQG/5PZqcLjVVc?=
 =?us-ascii?Q?hiovbJFfhdvHYpL8zVS0ny7s8ul5imEp/wLmIaS4GQN34A6AE7c2bJcufLAh?=
 =?us-ascii?Q?NQiVi3fqLzFqwtV/EfGTBAH7+vufve7W5ehkKBGp3aEVKnAJq5O4HM8QgzaV?=
 =?us-ascii?Q?KIHoO+XJ2LHEbpNXPjbDyJWVShkR83jRaAsn28DVC/OP1ZsSAPjVVcA6e+10?=
 =?us-ascii?Q?vv/zlLLI3V6iAHQBnO1WxXb56Uc9qBtVTmYBuoEXelGVzBmhtRDRyVPjxams?=
 =?us-ascii?Q?K38RcsGf2QpytYrlFvDXWb4MWvJOsV5BS++neAUxjdxMIY8qr/8P/Z3jWiJ+?=
 =?us-ascii?Q?St/0o+XqghJjj/VA8WkotCp15nJYavDjO8RXE2kI7rhXWSdM4vSHjKTkYySH?=
 =?us-ascii?Q?RqovF0FAiQ4MlKS5UW3BJA6e9k+KXNooRfajSdITrtGQJyJR/BDIwgZLQ7Gz?=
 =?us-ascii?Q?N4c/+85UOblCSqwbIvuYt9jp9wBIuhD3kHzrh35gUaItaWAur0YIN5h11P5G?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06ef207-fc7b-47c0-d45a-08ddfd14b681
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:52:36.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Pj3vrnq0fq3/Y8vzo81BqRxIk/UxGuZcboKvfXtnUJEhYKSxDY0sOYbW1G2K7mMjnAjY8tI+TWZGl9tipXn0V/2D2ICDgNVkQhmKQKac0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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

On Wed, Sep 24, 2025 at 03:19:22PM -0700, Dave Hansen wrote:
>With a stock 6.17-rc7 and this config:
>
>	https://hansen.beer/~dave/intel/config.xe.20250924
>
>I'm seeing:
>
>ld: vmlinux.o: in function `check_sw_disable':
>.../linux.runme/drivers/gpu/drm/xe/xe_hw_engine.c:812: undefined reference to `xe_configfs_get_engines_allowed'
>ld: vmlinux.o: in function `xe_survivability_mode_is_requested':
>.../linux.runme/drivers/gpu/drm/xe/xe_survivability_mode.c:228: undefined reference to `xe_configfs_get_survivability_mode'
>ld: .../linux.runme/drivers/gpu/drm/xe/xe_survivability_mode.c:233: undefined reference to `xe_configfs_clear_survivability_mode'
>ld: vmlinux.o: in function `BSWAP_SHUFB_CTL':
>sha1-avx2-asm.o:(.rodata+0x57def0): undefined reference to `xe_configfs_init'
>ld: sha1-avx2-asm.o:(.rodata+0x57def8): undefined reference to `xe_configfs_exit'
>vmlinux.o:(.debug_info+0x3176eb6): relocation truncated to fit: R_X86_64_32 against `.debug_loclists'
>
>I'm compiling the 'xe' driver in to the kernel and I've got configfs compiled in as a module, which is (I suspect) the reason this slipped through the cracks until now.

yep, usually we have xe as a module, in which case we just rely on the
stub configfs functions.

>
>In any case, I don't see any Kconfig dependencies for configfs in the xe code. The attached patch at least hacks around the issue for me.
>
>Is there a better way of fixing this?

>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 714d5702dfd7..d04547fc5311 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -47,6 +47,7 @@ config DRM_XE
> 	select AUXILIARY_BUS
> 	select HMM_MIRROR
> 	select REGMAP if I2C
>+	select CONFIGFS_FS

Maybe it'd be better to have it like this so it's still possible to
remove it?

config DRM_XE_CONFIGFS
	depends on DRM_XE
	depends on CONFIGFS_FS

Lucas De Marchi

> 	help
> 	  Driver for Intel Xe2 series GPUs and later. Experimental support
> 	  for Xe series is also available.

