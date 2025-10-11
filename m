Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E606BCFBA5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716510E34F;
	Sat, 11 Oct 2025 19:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7eXg2mA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A7C10E34C;
 Sat, 11 Oct 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211668; x=1791747668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Rny7mtq4i8Xd2pniWKTEM+NvnVjQtyyVesmJa/K6aM0=;
 b=G7eXg2mAT/5kO/Hng5swskSD9DtjZjdjqGvQEA3dE/raocg5NJLT4ZYy
 3CZ+WeML6J6D/WSuF9TG/npFri7NfZuW54LSlBeCKhxtHuMSPkqlplDZN
 qCR5byau+eNxg/GQJrEcaHsrYgaQ6pwDqdCDnwiVsWn+55KPAbpLICdKN
 TClrYkJ2SoNwYpjV8cMVKMn340espsNR+R5/aoZNitXeLXyILQ0E6+ksm
 v9noCkjA7pJvfb/rvzArubKa4sC/FiIFcVsG+wCsLPDhgEsuCJw3q8KII
 +s+8qcunsPWgSgZfG0w9nqcKlRO+6QPcTJ9/U6EVRKKu4ekWTS4keYrH3 w==;
X-CSE-ConnectionGUID: zKtlpHyoTTex1LBasalGDw==
X-CSE-MsgGUID: 5a3Xt8bkRQ2DjpyodR9EgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62294768"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62294768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:08 -0700
X-CSE-ConnectionGUID: 73TPhb+2TUGCtooP5Lj/Pw==
X-CSE-MsgGUID: Si/QoGy8S0WyaniIlCjAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181252895"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWIndN7nqWcZZa3C0s0WKK7Lk62yxL45nsmpEFZ7zji04x/pYk4o640YnwmJ5tV0msa2z3lUZUlbSp46/AY5semWlziXQ9kpdol0hsfKnR6QAX/Y7F4mq0zSshDkDX9mP3X861SY1gGo0s+ZWbec2Te/3bszciVwvV7HtbbrZszxLnJ1R2rvQeFN+vjfIkACreslopAJArQhLOBtF57K4AaBD7Kd6ttUpudOpOhw6oEH/z+3GPxmh6i49jxemXBWQnZWWAm0PEH4biiriU9lLZzsG89ErjvYMGtREhCtnf40zDj2mbhIJKzwZ9oypXJoFQgF9K5mAqNugqU91Y63yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LnNKosEkiQ9JzmwJ3Y7scFHzWl5sAsvcg3MkSVvP00=;
 b=s9G3mYudoGkQlyHr/OznDdskh3+imSaZupeq97r/c47JZk3L4i4f6bX6GEcvFyax16znv53X8tU2ybebCf0pQrYbpn/Lb96oep/82d463hxIR7JFGPZfl9uZ6mOXMcTpzDY+V7mYywGziDZCSmxjAQlNNLllWyRssxFBrxAlL9C+Ub8fnM+U7uOPtczuhmFX/We/3vueDkJhpPNypQr1swYQC74DZXsc/FRxHaWsIJlCI1okJfoVftmVClTUhLL1V2A4Ilff5eiLg7rUp+fD838KYMQzTR89cZLhkTNW8Y88q7i1Uci6WXL2DrWWwBvP/gdeq53W0GhqEFEy2eBDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:41:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 11/26] drm/xe: Allow the caller to pass guc_buf_cache size
Date: Sat, 11 Oct 2025 21:38:32 +0200
Message-ID: <20251011193847.1836454-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 522c3048-e9c0-4b86-d73d-08de08fe1e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFRTQndZcGlXS2NmU01nbjdCZU0wMyszL1pCdVdFemNiYklCNFdlSWN3QzVL?=
 =?utf-8?B?dVgrdG5hMVhaaEJjdG9oTnRTcjJqNkVGZGRyamliT0xKeWpOeGZ0L0hwQnNM?=
 =?utf-8?B?M0I0NWV5Zk9UN0pxNmM1dGFkZ1d3NXFZcHdCN05zTTMyR3RwSTlYS3VUalli?=
 =?utf-8?B?cnZ0azNGZjZZUHBhcy9ub2xnd3cwNHh4aENNTHpPd3U0MUFwMzZVeTFhczRV?=
 =?utf-8?B?SkJONjZZR3ZBa1ZtYlNMakgra3BTVVAxTk9ONklYV00rcXlPYmpkU3MvYU1K?=
 =?utf-8?B?elZ0MXZmcThqOG5oVkFMUXI0eThXd2RnazJzU2RVTlBWRjY5NlIzOWZpcXJF?=
 =?utf-8?B?K2tia3hKUVRYcGxobWhXVklEWTVNZmRWY3orNGoybEF5VkY5REErL2Z1NVoy?=
 =?utf-8?B?RE43UWdDMStLL2JIOCtIV0NvTG5kY3RTc3RiVlVxTllGVkxnak40T240bnUx?=
 =?utf-8?B?NmJjdU0yY0t6S2NXSDR6aVBTcE96ZXRxTE1Ucnc4N2o1UlRyak1uck01VWlY?=
 =?utf-8?B?VkVDS2VRazZOa3dETTQyRCtZbk5HZEJkODYzanVBbGVXc3VJbC8yWktWakJO?=
 =?utf-8?B?OU9tcmVFYkxaVnJJVEtrZWhVTlM3aHExN0Y2UGNxVFdXaGFNb2tScnZOYUJO?=
 =?utf-8?B?L3dab3lvMmkyN2pOWkRQQ0J3RTZMN3c5RGplLzFpcWQwdzE5ZGJNdzN1ZVJ5?=
 =?utf-8?B?c1VnY0w2WGlETVVaSDBpazlTbXE3UEh5ejBnTzgyNDhSWmVjU2ZweEIzVWdv?=
 =?utf-8?B?MlFKc01FcjdzMzIvRWxNT2xpV2pMdkFoc1hGRlJpUHd6Tzl4T2M0TlN0cGg0?=
 =?utf-8?B?WjhWanYzZDRPdE82dkxTNmZDNUtvbUwvcXhHZXAzZG84Nkp5eFZiVWtkUkxN?=
 =?utf-8?B?SWRLQ0s1TjdxZVNWUWxqa3l0VlRyUWJkUVcxek1DVjc2ZUIzN1I3b0VlWHBS?=
 =?utf-8?B?Tyt1bTloWlNzMFJpS1BRL3RuOU91bUowdExiZmVYUG9pTFJYMEx6MUtROEZp?=
 =?utf-8?B?T2prL0VERSt5SEpYVlNYNm9QWGpFcFRTRDNqWGFxalloTVZvaUN5cDFIcy9O?=
 =?utf-8?B?UDZUMDJid2xkOWtodDFXUGQ4d0gzanNEOUxpSnlSaXh0Qmx4QjVWZE13OUU5?=
 =?utf-8?B?U1FXbWZSQlpBVWFhdFp1dHZQNjdVTFI4bzN5K0RMeWZHOGdoWm1NamhzN1B3?=
 =?utf-8?B?YmxEaHV3YlhyWUR6T05iVzVrOEpZZXgvKy9DOFN3M2NkQlNwSnIvRGwwQ2sr?=
 =?utf-8?B?NkMwSncrdFlueEs2eXh0MFZuMUtNaWg3N3pvQ0VVaUlFcCsycHV0a3FUWWpm?=
 =?utf-8?B?STlQOFpJdStiK3M5OGFDdmFkM3NJNjVqcHE3dVUzMU5wTCtFbjhHcjh5Zmxx?=
 =?utf-8?B?Lzg0Wk5RL1N6T2JnQjAyM2lJZHZLVDA5QXFCWGNIZVM1QXdudjlzWW5UeUVO?=
 =?utf-8?B?M0RCTmVBL3VjM29WaHhiaGxXYTVFaDZzTUErTWNOdXhDcTUrK3BaUFhDcUE5?=
 =?utf-8?B?ZTZycWdzcno0ekRkbkVIc3hSb3ZSNzFvVXdZWkFuUEx3cmdOMVR4NEJrTHBN?=
 =?utf-8?B?Q2NON3JXOU4zUStVZHh0UGw0NGVWOUJYcloxU01YNTZBaFN3WjE0VGdFQ1N4?=
 =?utf-8?B?NFFMeENzZjFLUXBlTkYrQW9XU1BQd09sTTFxRklVYXN1c3Q1dlF0S2RWeWJt?=
 =?utf-8?B?SWJQVFM0ZVVZamRwandHdjhEWVd4ZURrUnZsN0hUb08yK0JDczZyd3pBaGVt?=
 =?utf-8?B?OFZVVkpjQ00yWWJLb2Z4cFdwRG9HcFBhOXBHVzRBVVA1Y2Z6UDNFL0RqaVFm?=
 =?utf-8?B?T1hiM2htUjNnRHBORCt2M2FxUUEvNDJYdHlHVjFwK1FzaklwalZtSTlabGV0?=
 =?utf-8?B?cGtxZmdwVTVWQ1R4aENFMEh0d3llSFBDN1J4QTlNU29Xb3hobjlMeGpYVEVV?=
 =?utf-8?B?V09hTXFqeE1HejBneXVIZlVZaDhkY25oUkM1K1F6aGVCNndhOTBVaHZveVJi?=
 =?utf-8?Q?wvu/RL1lB7W0qZLOxlb56Y9OLqnz/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulo1VmtScmVUcVJnL3EzRWlRR1lFY3BuSUhWZ0tPQ2E5a3drRFVuRlM1eHBI?=
 =?utf-8?B?VzFwQTlrNldFV2JLKzEwZzhFMzJsTld2Nzk4TUVZVms3UGlaTDF5aGx6TzFD?=
 =?utf-8?B?Yms3QnhJUXpQSUp6N28zM05ONytqZmNmVndENUNEdnJxektkUUxoTFVHUllR?=
 =?utf-8?B?V3JwVmJ6bUpvaXFHS2pocWFmN0pnbXhLVHVnMGNQRjlKNUhERWZRMG9WN3Q2?=
 =?utf-8?B?TkxNdmJYbW11TTd6bUx1b2NWSXJSeXhQYVZDS1drYkxWTUJSSDI4NGMvTTkv?=
 =?utf-8?B?YTNadG8rOTVOb2VaMUhtcmxGMzMwZ2ZIZk1iQXU5cEdQUHRQY0lLaXNQVEUv?=
 =?utf-8?B?NkJ1UnZZZ3JKK0FNV09RbXoxYW41WjVqdWU3OTdST0tDRFp0Z1NTUUNxUDdu?=
 =?utf-8?B?eUZQdktyRnN2c1FVaHgvUm9yeTBmUzZ2WWJhZmtWM0xMNmhQbVlMWjI3Wkw3?=
 =?utf-8?B?eDViM1RTOUFYN3NFalkyVC9BMWNCS2ZiVysxaks1aUlNYWlDSjcyZlF0S3Zy?=
 =?utf-8?B?M3h6Qk1kN1RqdFVXa1JpVGg0Qi9jMG5uaDdUaUVNZlF5aHFaeGdqNWk0NFhx?=
 =?utf-8?B?VGFSYlc2bVRISFRlbjB0NGo5MGJSRElVYm03cVZxTUxvTkE5aC84TlV3azhl?=
 =?utf-8?B?TjdJbXV1SzQxL3R4dVI1RGF3UW5Hd0wvYVRZWHR6YUJKY2ZhOGY0SFdhY2RW?=
 =?utf-8?B?cjBGNUx6R2pLK3BQRitLeHJmSFQyV0hqZlM3Mzhndm9TK2hyZGZJVDJoZ0l3?=
 =?utf-8?B?WDN2N3VqV0M2L2lKMHgyM05OM1BhN2pQK2tzTTdXRlZyV3Q2K1k1OE4xTG43?=
 =?utf-8?B?M2d5eE1ONENkeHlrMzVxYXFCL0dEL01TaXpyYkZaazgyN2NRaWFaWGlNY1M3?=
 =?utf-8?B?dzJLTjVIS0NIQ0hkZUY3WVNFTkdTcURoV0JQa0lFNmQxNnhHN25Taitjalky?=
 =?utf-8?B?VFRQdkRKck1ZWEErMGNUV0FlUVdvZE5rT25ia1NzNlJEREdyNFdwY1B2RTIw?=
 =?utf-8?B?Y2lCd2dpWUU4QXFKOEg0TUlBUFZBeEtiTTdpcXdNbWRzL1NQUmh1TmFGZEhw?=
 =?utf-8?B?QXlRK2ZMeW5CNll0cGtZNWtYcCtEbDBXTDJpL1RMREtobitYM3FaTllVS1Mv?=
 =?utf-8?B?ZG14NC9zS0dzQ1pOdGNKVHhIZUpYc2hmQzRpMFlpZFdaV2tsSTlORmNHUTFz?=
 =?utf-8?B?M2FzVkpFMDlCYXhpRG0rS0xkRjB4eER4VC9EaTREc3RyWHZJYnRKS1c5UTVO?=
 =?utf-8?B?SWJuQ3ZLeGo4dHNLWnNlR3hGRGJHRjA0TWlVZXEvcm9YbWhlR28weG1jV3li?=
 =?utf-8?B?QnFIM3dJa1hrUU16b2NDc2NiNWxncHpkNFZqV09LaktNTXUwaEVvbkFUWVFI?=
 =?utf-8?B?WXRRcmE4aHBWK0F3RjVBcERwRkdMS0EwRWUwUXI3SFNsaVlDajhraitvR1Zz?=
 =?utf-8?B?VTJUMGJHRTZIME8rdjBkLzdCMjY1VVVEYmFieVNRUWRGNXU1M09NMlNpeDlv?=
 =?utf-8?B?YUhWclF1RzBjcUJTQjlVblE5TkphOGRQSjBoM2pZQXp0MXFLQjhvUFJBR245?=
 =?utf-8?B?dTY4N0dzdXZJczFZWS8ydDh6cFNxSm1MejQ5M29PVnlnM0JrYnVOQm5ocTBP?=
 =?utf-8?B?WUhQbldkL3VBT1lxQWovSWgwUTJBeGQzTWJBZWRvdU9vQTZYUWZNZXBRcVRi?=
 =?utf-8?B?L1dNd2ZhNjRidy8vWGR6dGdJTXF3YnRUMWs3Z0U2Uys0U2pMTko0OTdtTVpE?=
 =?utf-8?B?NEd3MXhscFBLcmhKM0hxRUNIVmQxY3YrRFo1ejR3VTV5aEJkVUp6emNBakNz?=
 =?utf-8?B?VkNjNG1ub2JGVGN5NnNZb01CNXpiL2VscFhTTlFMTVdhb0JDSnZOMS9TZWZn?=
 =?utf-8?B?RmtrRndRVk5tY3lZRzdLWDhOTzRXOWxYWHIvMHdsNjYzSU9jTXJ5YTVuSGpt?=
 =?utf-8?B?VUdaQW5yOVp0bVZ1OVNxczhyNG1TcVVBWFpabmtzaDhBM1VUNWtjWWxLQ0JF?=
 =?utf-8?B?V0p5NTNINXVIM1FMcnZMKzNrTmFDam1nVnNzU2dTLzdmOG9SWTJNRE9TR24r?=
 =?utf-8?B?Q2ttY1ZjSUc4dEd2TjUrSitQNisrbVhLQ1oxdm82d2dnaDEyZ3J5QnI1T3Vn?=
 =?utf-8?B?dEJGb05yb0x0RDhJdjc1Ty8zcjVxcTRqTXBtT05WbDk4UzhMcjJWTXZCYnN1?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 522c3048-e9c0-4b86-d73d-08de08fe1e38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:05.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlkSRs5MXALaZlH9tBvCJsrnxRwMrHT2hCeMz8ihVpwQGX4war1hyVi7I86JkmSY6GCCNE1M9SrntZAew1jyd28JhfiYBfdmljQDHMPip8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

An upcoming change will use GuC buffer cache as a place where GuC
migration data will be stored, and the memory requirement for that is
larger than indirect data.
Allow the caller to pass the size based on the intended usecase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 4 ++--
 drivers/gpu/drm/xe/xe_guc_buf.c             | 6 +++---
 drivers/gpu/drm/xe/xe_guc_buf.h             | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e0..c273ce8087f56 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -72,7 +72,7 @@ static int guc_buf_test_init(struct kunit *test)
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf), SZ_8K);
 
 	test->priv = &guc->buf;
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc0..ccc7c60ae9b77 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -809,7 +809,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (err)
 		return err;
 
-	err = xe_guc_buf_cache_init(&guc->buf);
+	err = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
 	if (err)
 		return err;
 
@@ -857,7 +857,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init(&guc->buf);
+	ret = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 1be26145f0b98..418ada00b99e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -28,16 +28,16 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
  * @cache: the &xe_guc_buf_cache to initialize
  *
  * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
- * indirect H2G data to GuC without a need to create a ad-hoc allocation.
+ * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 {
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index fe6b5ffe0d6eb..fe5cf3b183497 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -11,7 +11,7 @@
 
 #include "xe_guc_buf_types.h"
 
-int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size);
 u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
 struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
 struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
-- 
2.50.1

