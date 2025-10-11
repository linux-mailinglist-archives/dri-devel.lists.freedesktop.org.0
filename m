Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F1BCFBD8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382E010E35C;
	Sat, 11 Oct 2025 19:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drbW2m31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E010E354;
 Sat, 11 Oct 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211723; x=1791747723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vI/Oghsjrp+8iUV0Bies0HGif0PjtnDi1al4264r6A0=;
 b=drbW2m31TOcs8bw1kdKmpfmNhuJrqpEX99LLHvfkRNopGTUh1onsxEpl
 vsWI+/lkaiEI8tKtVVcBks+dNBvu1V7JpHtMFyVbpSTWLrMzEaJXRyG/d
 K/xi5sb62cLR/fOb95F0ldf6nNz0T9HNVcnM+lrF9TJmwZFR2Y7Eno7By
 e1LUtvfKMQMtgxuYZB3x/XpyjK6xqmmCQGwpZe2F8VG71uqybE6ZhWYmY
 MePo4i7O19aMtW9F+2J4Bh0RX2b3B83cn7CG6PdKy5AlumZ23ZK6+NoSJ
 7waVu2H9FfwFoYWop4qbBmAPemSdMObNIfCoNzoZswygyhzrNhRNTpPia A==;
X-CSE-ConnectionGUID: kopNgwcXTBKzL8OFFTB94A==
X-CSE-MsgGUID: XV7oE61LTBe/6EcUARSEgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62294820"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62294820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:02 -0700
X-CSE-ConnectionGUID: Ofj61rmRT3+GziyeKG98LQ==
X-CSE-MsgGUID: +n2o6za1QVOmjqu5s5jF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181252980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:42:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeGF0mn6k5bc/0+h+RDZYA2Nyu5fS6G4CFNwjPJOCObVfmfqUOn/smu3asRAGxj41fcJB+uYRUzvFvHPlQVROdPWRGG0UsWynicNNHmpFe8cFih4mi+wQnhpPuckBX8WBPWBWC1KaLmyFU75wg6ZC3X+SemN4sRmZHu15r2J/YqhHLQn9sbYe4LRVkXJji72qvSq29+aVN+AMeWzuHzk+ncSpcNAsAXcTROkwrjZ386nkTFCco3HIkpudXBGugru8ZELY43Sd/VxNeBc9WbYULG7QvXw0OntaXWFyVoncqXOgtmktkhedWlYNL4SttZPuo7tP/78z5/FONKhfj2Sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEsyNzd60X9rtJj3s4Fgj0kmxcalJotXML4Xm6vrLqQ=;
 b=C6HfOqiT8vnoSvMrilllNXIKQDJyAdwy119z8bAkG8Uo/Ho7QjDyS6VKSY39G7E52AKv07AnuYW1vN3KUVZTQNsO6F0seT/9hMEELqBgirngQskJEXlFj5cha4QWx393xScQV7bNL2zjPwmxxRLgIJ/TSl1KDgBeKeO0I4AYBTZaOtiOuUBO3ZmMlKlIgAmQZZqRFWKWRAU7lubzFE7cP+k/nmT6wA7hhP6ea0lAu+cDph1McwFdwt7WxhiVEUXREIY7Ui6rWSsFZwDstBdivBhAGt83SmnpMsrQmJEe337ZhpEbX6ARh/TJr9M+V3cXZm4IF+0e8p9ldZysffBJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:54 +0000
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
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH 22/26] drm/xe/migrate: Add function for raw copy of VRAM and
 CCS
Date: Sat, 11 Oct 2025 21:38:43 +0200
Message-ID: <20251011193847.1836454-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0032.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::45) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e30fe3-bc50-44d4-27ce-08de08fe3b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rj0LflLRl2MUSoOE/AYl2fi0RZNdSp1WylHAvmqgPOiUH7DbmR0vy/1V1HHH?=
 =?us-ascii?Q?2bfN8ugK8Y1J734aUM96uUPj0EgkeSgmvqe4agaE1mtNQk2kO0GidU5IhePc?=
 =?us-ascii?Q?hjCctMfdNHjkLVwb5l4Zy5gBUntJY8jdlToqwyOCJNWvTJUZguhDsb0ZPtI9?=
 =?us-ascii?Q?gkgwJhmdMhvZ2lokELv37X+vaPB3j0VGHWaSoDFjEx0fowRUa0YJL6L8s4JH?=
 =?us-ascii?Q?9Qq3Mpb3HNwTOXqA0/kXBongyIv+u+MQzLfBzzT95vD48heQZoeWcwH8QZl+?=
 =?us-ascii?Q?ZbH2WGAXdkb2xjCCVZnpzz5/FDE9RQP24xa7sKW+TaXa+JtVQiqU7bq0nXPq?=
 =?us-ascii?Q?qyN+VakQL3G69KuraurGZFUZvV2Fo/AyHgT+BlPEA5mBkWEtKAcK50HLa5xq?=
 =?us-ascii?Q?Ox5w5qiw3CgUCnFXK0rjSrKY5yxKN0Pv6bwdQU9kSP8DgxSB/vA7AXnt8Ld3?=
 =?us-ascii?Q?5R3DdEojKoszZr9rFL09X51QDYZu7saLb2PDjSujsyjBGStWH+211Xnrnqn0?=
 =?us-ascii?Q?dawxcqLBQY4cjNzZT5Ngmg6fnQF3d1I56Qi1OoCAbxLyd7um32KwWI6MdD3O?=
 =?us-ascii?Q?JScjsYTK8qyBysGOnTVAfHOt1Fl8v9up+0BCED2x9iCXlZjqF+BE+S9GguOD?=
 =?us-ascii?Q?UTPO/pAy4rQCuo47cr/75wqOdPSuHsNRoMj7pUs82ghaR9SSNBcQ6PSPtn6C?=
 =?us-ascii?Q?pQJzndzO5V8vuRDtSuNp7W70Tz6q6eu/UTk9RqBDAO2A5kua7oib858Somkf?=
 =?us-ascii?Q?RIS3J8xMhjHt+zZeXsYU00unT6ZA4mUP/s1gz8frUeSwOj954L9A0q/e0tWy?=
 =?us-ascii?Q?YqkgF7dgXYCV/edYk+/4SkAjqBgLEnQuqramdXeHBb+QmoSz0vYu9KKYUyL0?=
 =?us-ascii?Q?z8D/4uzuK991O7Dti1ylSwawe05OwhDxNXl3G1fDy4H0OCwX74o/WZ+zwN9h?=
 =?us-ascii?Q?brtXzxWhmizO/gfmrXBl5Il2hUouVd8jeAdpDrrtoFMFsmlLyPYY96RgBsXk?=
 =?us-ascii?Q?xzjx1rwMd2LaeZSz/YEfzIgg/bUuDiqsfC/q0NhpsD+kulX5vJ1ALcMpsgLv?=
 =?us-ascii?Q?hmUeoDlFyx/XG7wxTK2sIyNCmEz6x8Q8tQR8oieByPdNRLLs4B2rGFWaMgeW?=
 =?us-ascii?Q?P8Sh/RKpcsTyRfKgmZuiytYWoOjnG/UEIGTjhaRJkrKjul+3XlG4NhmI+6EM?=
 =?us-ascii?Q?uKs3iiEAkFhzyvB9NW6rDIWUkne1awEe8YZhbJkeVHFVIS1Dz+ZDLjGAtl46?=
 =?us-ascii?Q?aW7DwH4VdqN72DACMpt9CvDSqzShspHTo7aAa4U8ISZJBEcWuz+n3j+HlnnC?=
 =?us-ascii?Q?NlZp2xJx0Hu41Y7BeAJUOO7Lpu6HM3bixsYIqqQ8RPX2PQBP3BYEf3/8N33T?=
 =?us-ascii?Q?js0d8aJ3BpGUwp2qq/pp+UBaYi6Z55GS783zR3TGTXCCVKVVHB32ZIPA9Z//?=
 =?us-ascii?Q?9JSWzUDWP4Umf6xplCshM987weljqPQNsqZ915IXRRxbUz4z7tRwzD8d8Xsz?=
 =?us-ascii?Q?YJAsyKUWnzQ65Dg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w1wQkWDksMtQGCFplB1cbL/t25ZNvVmssFZyDlque8MGV/Z+yt3P1/SBr9QP?=
 =?us-ascii?Q?SyJddEnp83w5JXaFsRQ9KIH/B/LCXQ0NXE2vnpai2AsxixV60jdKd945S0T+?=
 =?us-ascii?Q?XKgoYAUhBqV8n0DjCSmHyWX5/LubSHfeR2by2RkOjxFeDnKajIR2I8X/A+qt?=
 =?us-ascii?Q?lX7owyinTTn/VcL1Gjl4wxuyT5tmqLm/cemD+7F13q4hgjhgS5OQAdkYIzVn?=
 =?us-ascii?Q?mWpDAS+VY4vRChboLXIHEU+qK2FechpHQmoWjP82l03/U6rjrjewQPnfdqhe?=
 =?us-ascii?Q?jHW3pYUwT0lEZDjdrvwO6Z3LnARjFKewCAu7NFUx/aWgahYchk8ONdhg0uNh?=
 =?us-ascii?Q?Hl76cgvosMFotndFOQ+OciFwq5gfHFXE56kepV0iZ6jgfICsUdzFSfNb9LPs?=
 =?us-ascii?Q?VnqMSbr56WetNpp8sKfKS55O3BMp40ItsoVJfIjz9MDzI8rI1UJiyBuewZdr?=
 =?us-ascii?Q?IpBikaL6YHVwTCYRLxzg/TXfbTRQOk/Pzh0mZFYeTFQ37OLDFppWhmb/PCW2?=
 =?us-ascii?Q?OJOj0X4tqJ5VNiAob6l+URS25BTw8rc1aJ78cdy9rPizBPMhYx//wMDbFkB3?=
 =?us-ascii?Q?2dm2eWGyH/SnCgDtr1Im2hCj5GHwLF4bg9QyckBbBZ+HdTT5AnyB7c8DsSkq?=
 =?us-ascii?Q?mgBUDYbEevs6OZnxPU0UHqdVrJrYBTYz4jOt+ryHRe0E/ILGS9sjKlwBgIY+?=
 =?us-ascii?Q?i4B+9HYOJQM79xyfnNM+dGPUsAGZoqqTW2iKRtjESo3CumjcoOZdnMBu54F+?=
 =?us-ascii?Q?zAUh0bOQgJ5BfVHof6Pheh+wVCDh6fcnh9F6G2ibQj6rRnRH+2uWhjUpNJI7?=
 =?us-ascii?Q?wX1KA3OHC7qaNdQnXjyxug+NndWPbdYOOGiv5T/Qgs6SItuyxVZDjDybC8JL?=
 =?us-ascii?Q?uuurOGhgJ/lEf4jImtM/fcZ1NjjpdCpz/1/27zosravXAW/6CuoqtO1JZsuk?=
 =?us-ascii?Q?8dGu1gJAF/T8GsBBi79Txbsd5CB9SQEeSC8phtG/13OTvLHhtItNlwyCT2pw?=
 =?us-ascii?Q?4bg5d5IP+f+6CtXkRIpnxwj1FyvmOQhS2Gyx1U1AUsZRnMUP+WpoBaCzXSHp?=
 =?us-ascii?Q?tjbRg4t5Jxul3d56W40ubB/QuJb2xFS2zVwg0HkXNQUi6ZoOFAUkuhU6TwIz?=
 =?us-ascii?Q?VeOMvLqPPfF+uvbrHyZIA6vcpJgwiS63UVGuZU+8qv8eq05udZaKLKU0/HCM?=
 =?us-ascii?Q?u8T9X6/K9bRKpZYFZu8J+eIiDNENi02mH7Q4QFLP1wzEXi4TWCjvnZK8z3jg?=
 =?us-ascii?Q?aAqVFBMVAVn+GgsApMaHuYPITd7945C0xL33DmiSsU11BEK2KMBSjND/Zhwx?=
 =?us-ascii?Q?Q0UbLCo1+/4h8lvFAM+5ji3MwGZwmsRsufo41TbLbcH2A+KCSaIX0a8hsBny?=
 =?us-ascii?Q?JH7TicW0gQf3vTCwDWbOIfrFu+CPC7nlcqhW54yvRggvbiJOU+iDUBJoCSNo?=
 =?us-ascii?Q?Q1rgRx9CGSmfTZ/SdSBgQkhaNpXbmkkarxVmRKvvx/jmCYG7zfeTMT+vjquB?=
 =?us-ascii?Q?xwEherGUUQ+DRWwQIslV5Ct7K7jzud4zNRzpm+EckuAFF5osj5tp3wBL4XdM?=
 =?us-ascii?Q?aUfXHoDHRy1h03923M9aYlZZfmvCThjZBuJTthyzmxJQh8MxC9xCJscaNwKz?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e30fe3-bc50-44d4-27ce-08de08fe3b0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:54.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fg9FdIsVUiS97yh2/rtR9AgwGv/cI66xPiuSlt7hqiRwWu8QdvRk/2LIqcCi4Gfjsu+HMa1gARdb7oKFmfO+LBewEeXvw7WpYCLQ3Bf+7nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Introduce a new function to copy data between VRAM and sysmem objects.
It's specifically designed for raw data copies, whereas the existing
xe_migrate_copy() is tailored for eviction and restore operations,
which involves additional logic. For instance, xe_migrate_copy() skips
CCS metadata copies on Xe2 dGPUs, as it's unnecessary in eviction
scenario. However, in cases like VF migration, CCS metadata has to be
saved and restored in its raw form.

Additionally, xe_migrate_raw_vram_copy() allows copying not only entire
objects, but also chunks of data, as well as copying corresponding CCS
metadata to or from a dedicated buffer object, which are essential in
case of VF migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 214 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.h |   4 +
 2 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169a..3f8804a2f4ee2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -501,7 +501,7 @@ int xe_migrate_init(struct xe_migrate *m)
 
 static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 {
-	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
+	if ((!IS_DGFX(xe) || IS_SRIOV_PF(xe)) && xe_device_has_flat_ccs(xe))
 		return MAX_CCS_LIMITED_TRANSFER;
 
 	return MAX_PREEMPTDISABLE_TRANSFER;
@@ -1142,6 +1142,218 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_migrate_raw_vram_copy() - Raw copy of VRAM object and corresponding CCS.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object. If copying only CCS metadata set this
+ * to NULL.
+ * @sysmem_offset: The sysmem offset.
+ * @ccs_bo: The CCS buffer object located in sysmem. If copying of CCS metadata
+ * is not needed set this to NULL.
+ * @ccs_offset: The CCS offset.
+ * @size: The size of VRAM chunk to copy.
+ * @to_sysmem: True to copy from VRAM to sysmem, false for opposite direction.
+ *
+ * Copies the content of buffer object from or to VRAM. If supported and
+ * needed, it also copies corresponding CCS metadata.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
+					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					   struct xe_bo *ccs_bo, u64 ccs_offset,
+					   u64 size, bool to_sysmem)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource, *sysmem, *ccs;
+	struct xe_res_cursor vram_it, sysmem_it, ccs_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool copy_content = sysmem_bo ? true : false;
+	bool copy_ccs = ccs_bo ? true : false;
+	bool use_comp_pat = copy_content && to_sysmem &&
+		xe_device_has_flat_ccs(xe) && GRAPHICS_VER(xe) >= 20;
+	int pass = 0;
+	int err;
+
+	if (!copy_content && !copy_ccs)
+		return ERR_PTR(-EINVAL);
+
+	if (!IS_ALIGNED(vram_offset | sysmem_offset | ccs_offset | size, PAGE_SIZE))
+		return ERR_PTR(-EINVAL);
+
+	if (!xe_bo_is_vram(vram_bo))
+		return ERR_PTR(-EINVAL);
+
+	if (range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size))
+		return ERR_PTR(-EOVERFLOW);
+
+	if (copy_content) {
+		if (xe_bo_is_vram(sysmem_bo))
+			return ERR_PTR(-EINVAL);
+		if (range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size))
+			return ERR_PTR(-EOVERFLOW);
+	}
+
+	if (copy_ccs) {
+		if (xe_bo_is_vram(ccs_bo))
+			return ERR_PTR(-EINVAL);
+		if (!xe_device_has_flat_ccs(xe))
+			return ERR_PTR(-EOPNOTSUPP);
+		if (ccs_bo->ttm.base.size < xe_device_ccs_bytes(xe, size))
+			return ERR_PTR(-EINVAL);
+		if (range_overflows(ccs_offset, (u64)xe_device_ccs_bytes(xe, size),
+				    (u64)ccs_bo->ttm.base.size))
+			return ERR_PTR(-EOVERFLOW);
+	}
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+
+	if (copy_content) {
+		sysmem = sysmem_bo->ttm.resource;
+		xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+	}
+
+	if (copy_ccs) {
+		ccs = ccs_bo->ttm.resource;
+		xe_res_first_sg(xe_bo_sg(ccs_bo), ccs_offset, xe_device_ccs_bytes(xe, size),
+				&ccs_it);
+	}
+
+	while (size) {
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 flush_flags = 0;
+		u32 update_idx;
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		vram_L0 = xe_migrate_res_sizes(m, &vram_it);
+
+		if (copy_content) {
+			sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+			vram_L0 = min(vram_L0, sysmem_L0);
+		}
+
+		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+		if (copy_content) {
+			batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0,
+						      &sysmem_L0_ofs, &sysmem_L0_pt, 0, avail_pts,
+						      avail_pts);
+		}
+
+		if (copy_ccs) {
+			ccs_size = xe_device_ccs_bytes(xe, vram_L0);
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
+						      &ccs_pt, 0, copy_content ? 2 * avail_pts :
+						      avail_pts, avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		}
+
+		batch_size += copy_content ? EMIT_COPY_DW : 0;
+		batch_size += copy_ccs ? EMIT_COPY_CCS_DW : 0;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_sync;
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
+
+		if (copy_content)
+			emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		if (copy_ccs)
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, ccs);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (copy_content)
+			emit_copy(gt, bb, to_sysmem ? vram_L0_ofs : sysmem_L0_ofs, to_sysmem ?
+				  sysmem_L0_ofs : vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		if (copy_ccs) {
+			emit_copy_ccs(gt, bb, to_sysmem ? ccs_ofs : vram_L0_ofs, !to_sysmem,
+				      to_sysmem ? vram_L0_ofs : ccs_ofs, to_sysmem, vram_L0);
+			flush_flags = to_sysmem ? 0 : MI_FLUSH_DW_CCS;
+		}
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
+		if (!fence) {
+			err = xe_sched_job_add_deps(job, vram_bo->ttm.base.resv,
+						    DMA_RESV_USAGE_BOOKKEEP);
+			if (!err && copy_content)
+				err = xe_sched_job_add_deps(job, sysmem_bo->ttm.base.resv,
+							    DMA_RESV_USAGE_BOOKKEEP);
+			if (!err && copy_ccs)
+				err = xe_sched_job_add_deps(job, ccs_bo->ttm.base.resv,
+							    DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				goto err_job;
+		}
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+
+		dma_fence_put(m->fence);
+		m->fence = dma_fence_get(fence);
+
+		mutex_unlock(&m->job_mutex);
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+		continue;
+
+err_job:
+		xe_sched_job_put(job);
+err:
+		xe_bb_free(bb, NULL);
+
+err_sync:
+		/* Sync partial copy if any. FIXME: under job_mutex? */
+		if (fence) {
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		}
+
+		return ERR_PTR(err);
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b62535..0d8944b1cee61 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -131,6 +131,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
+					   struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					   struct xe_bo *ccs_bo, u64 ccs_offset,
+					   u64 size, bool to_sysmem);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
-- 
2.50.1

