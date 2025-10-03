Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0647BB821D
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330D10E97B;
	Fri,  3 Oct 2025 20:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkKd54Ej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918810E97B;
 Fri,  3 Oct 2025 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759524462; x=1791060462;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=FImHgjkHWox0QgefpNvmr+LMstgnebbcAWE6zbrkS0c=;
 b=fkKd54EjeZfSeUf8s1fKDvDrgkAptu5cb9RB8FxZvkOOSkJl+jdRzG2m
 C3DX+9xSWvkcPAYGrhxZcDdI+WMc3+D8Fas1XQ2tzpSD1OrtLp6qkubye
 +WKZ4YrFuijN0Trwnr8Yh9ZRVcRWN7EMsXsG5SLRRRsuF362T0aV+V53Y
 3kJ9zN7qOzH0wDb73EZr6F3+18/xvcIMLJ5OS6nrDTsfAnwY0cbrFvZGM
 PfzPTPt5Xsg16G/1988cAh3w3NQoX3YzysJtThYMoG8eRixC5oFcNSIj9
 j6Md+8sU/nX8b+qHHBNXpS5XZiZYizWNUfY3F8tFhPh0ER2oTyL1dpgbf w==;
X-CSE-ConnectionGUID: UWbOFwzfQcS6t4v3yNaq/Q==
X-CSE-MsgGUID: iePj0WIiRuKIToRPSp5orQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61910537"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="61910537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:47:41 -0700
X-CSE-ConnectionGUID: Szldy5+BTlekz3AyTv1DqQ==
X-CSE-MsgGUID: oONXrM6bSyyRW2m3K7oJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="179169825"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:47:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:47:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 13:47:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw49ZxlOs1Fe9BLR9hIejOJb/cJqOJNbPyt8L/TL0DdavY7DwIprb5Hdo6b21JVjfYhhfZDqDcK3Z1mSYKppjf4qCYNVhNSXX4oq7fNFyWmVV1UOmgzN6xiFeFd7ncAZNYHzpfBkmxvyoiWOe51fo/rxaJ8NZ1SGvecCZ9XbnsDtiARqI9881AWS7ew9KvBT3cMil4yn6lsxeyiQZe1Yz37XTawxm5I8azC9P8mMS7yyTRjajP8fD6Dgho6RdNyc6k5DQnZyLkEFg5bCFYgMmt7a1Er4ATzNsy8gjPbmU7mrILQXkNqSR5F0f4Ye/prLNJDs/MDi7Un4H7Npu21d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcp0dlCAYHlWylCxiGOH5i8mzhMf6ROorZDPaYbSKmQ=;
 b=nUtqdwDlpD/fC3vrXguw9KEfsN5YNIkV+x3MZW6tbrksS//uKxshdEJRxFL0OrLXUq7eioQAbhtmQ7eCcKQNGH8sE/l0Um1dacLiGTsnR91TpYZ6MHGp5V6PYeAphx2j8fS1Y2buURxmiKGuGLglISJ12N7RaRXgOOcuuO5zzULCCRogpvKhh7rCAo0nGuRttTV4t/fCabE+by03YdwTj0/OYkJ0x5YomHTxt8DT54CcERGPmomjTODMouUh9J8BgPPTomNbh6sbwucq8i6t81sFP6JoX41C7LGjtuIPEXCspfmiDGWkw+3OGigsrcCK55ySowl/ZZ+3xOHQGwUIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Fri, 3 Oct
 2025 20:47:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 20:47:34 +0000
Date: Fri, 3 Oct 2025 15:47:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <q6yeyb7n2eqo5megxjqayooajirx5hhsntfo65m3y4myscz7oz@25qbabbbr4hj>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: d8613759-c561-4ffd-557f-08de02be1468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?E6OlJBv2o/gPMooEbREYgKmSnK41H1ecNnSOAuAtGTlA2ngjAzlXqtF5n/?=
 =?iso-8859-1?Q?cdrleKELNKpLxkZ/3wMYWZ8tKRObCDrydzBxtPQ3yyWU65qOrY6Y9s4F5D?=
 =?iso-8859-1?Q?XsaRViROFS19a34Sz4z/9HlxvojhKuCm8FFFDjX7bQq8lx6ecgLIcyhLC+?=
 =?iso-8859-1?Q?1ax2sLUplNsRx3bqBORxzV2zxWPaNSYc+5+mlU4/a6c4AxkGTYQ08khWLX?=
 =?iso-8859-1?Q?JKGRiMWGd6BF5SOwtW8/V8E34dsqt+wsJX7mzl4ZaeCamn3wGm+wgbr7MU?=
 =?iso-8859-1?Q?itq2D8L/NL7NviWAUluaIzQqxjFEprD7E0hOZXI4jFtnPZK6Pu//yfY4Jr?=
 =?iso-8859-1?Q?evGrwPx4gVJhtK5xrn2TS/wrEvQ/Z+9wLhm++BT682XY5FfSGIxb4unfxe?=
 =?iso-8859-1?Q?ER+Z+hkfp8TvJ5VUBH1WyTH5FgviwuXabdqiC0tdwR4oqzUILUZCsaBekW?=
 =?iso-8859-1?Q?iXwIruynjbmgCly8rIXxo1Q+JuvUwmzypm8WzLTXpj2ry9Qc3hxBp8nDFj?=
 =?iso-8859-1?Q?1FiWV4irHJy/ZIbhVDlHQFav1rdxU1qmQBnw4NAg4qouKSsCyHWl0Bl4jO?=
 =?iso-8859-1?Q?K3QKg8CZb8jfh0OONQuP0UDmORW/9FYZYwIXAqSYk+XSE2aeeYb+XPKXan?=
 =?iso-8859-1?Q?bZhmezwWW3T0kBfc8eQ3HLOc+FSbwvxQhUOCN+VxW1X1jQ4uoI36V7moir?=
 =?iso-8859-1?Q?ekKl9NKbU4MxXBJRESPCgGaIxQ2OtZm8iAgtCVcAo19Y2hMkwto6O33XMy?=
 =?iso-8859-1?Q?qaaxEWjla8xMG188AaNLVShkClNi1lxqmOcKO3tMKCU9UQG2R7yxD96iUs?=
 =?iso-8859-1?Q?EXO0Q7mUh5fA1AP9iJTc8rzOTGZ2Ra68nMZL7woKdCCE+a6g1f/z7urlpM?=
 =?iso-8859-1?Q?MPk0MErkIPerEEf/pviqJpSrFXAsuUA+tmCShGmXFbi1dpEfssSY/Fx+56?=
 =?iso-8859-1?Q?FWCgalCqJDfVkXi5lrYTJmIjXlVGjqJAcEyAioOqzuUWDowZD3TGFZKLJN?=
 =?iso-8859-1?Q?3r0wlvdYP4mKLnHQkfPU/Q4I/FLiEJw0WZPKJXcEa84q0P4OdTJS+AV6c+?=
 =?iso-8859-1?Q?tMlakdlozz4t9+vV+HQqvS0dxeTONHNUDSt7S/fy1jCBB7cjgDQZnrBbJK?=
 =?iso-8859-1?Q?CJ/0eWz/yQYvQu+sz+8WLb4x6ybufW4WafT5SVQpBmAKjnyrjul28iaPqh?=
 =?iso-8859-1?Q?3cvBcbVqPtmo5kSqfSHLlEXxLr2+OG38IU5EkK5wJjGKCf32HWeMbD8aN5?=
 =?iso-8859-1?Q?woTPzqPgSwSbAKd9Y645/MXE97/3SxGaNTiiOOrJ6H8DUZxQPJJxDO+QTq?=
 =?iso-8859-1?Q?liELC5CHwh8rf191tYs23t3iS16mRYQzRgeC/HnTwPiB+y/Uq7JKBW6Umg?=
 =?iso-8859-1?Q?joggsa1GYpluIbnxP33w4s3NoudqMzdLQtmZHjNxyEkUEFhJMmsFDlJgCZ?=
 =?iso-8859-1?Q?17mZwg1xVWsfHw+2HGYFYSO3A20IeEOaw6mO3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OdqoXalV2Xn5KelL+PTi0JXE9xasx120LZDPiv2rmg30n1e0Hyy+Jw6TWk?=
 =?iso-8859-1?Q?S2a/38Lp2Qm2Mqc63lO9c5IN6UJqKch0fyKuSHByGHKVs9F8x9wcS78lv8?=
 =?iso-8859-1?Q?n22wXh2x+Ugjwr9mJstXj6LwvoScm2YXOU17990UInCAcp9zX+VgJgZWFk?=
 =?iso-8859-1?Q?FDwjvb+uQBj1GyDYYsEAQWKkgEV6AgasAkkg08wcAUj6VQu67tY6uJ942a?=
 =?iso-8859-1?Q?jfntcuwwo1uXxNuZpBHDWmm11O/XSYx2GP7U/8sf5n0lHalzd+oXDh3549?=
 =?iso-8859-1?Q?YLgUOPQNw1A2kDecUr4G4N4KN8seMd6Jq7AJnXcz6pzDDka7Iu9Oq4JfKh?=
 =?iso-8859-1?Q?yNli4YcleAOjJ8kVk5Lv0kKJJNCg+wMippYCh2aDSnBc1qwIw9X3y3QQfI?=
 =?iso-8859-1?Q?l6LqUIzBGodaLDtKOy7bju7YCRLHWQwysOD+R5nRgCoBuPMKBNtUvFqiHz?=
 =?iso-8859-1?Q?f1ZazjkBlV4uAeg2ny44P3ermT7RUtSjRQn78yuhQlD0W1p1xh/hT//ZiM?=
 =?iso-8859-1?Q?vp6H6wOf380/QGkyicPWebxh6RQNmxHXJoVx4aRY0FZvHzby55E0kw9T37?=
 =?iso-8859-1?Q?wVr473rfKawpZWxkscgyQcwwsQAAmIR6HWzMAGefesvIhj2xIf47qWKKch?=
 =?iso-8859-1?Q?6PlqaAFdDHxaEQQBFN/ifedrPvh5SbQIsarwZ0UZ2Qi8IRGOqRFTbZZ5B4?=
 =?iso-8859-1?Q?k/f817u4Sk9XpXF0ZWkYZAAgSiG6t+2MjDUYYhd56v1arGk6VFVRwbgp+W?=
 =?iso-8859-1?Q?SGr4+d9QhSaa9Xkv7jk8c+KdnPFM1mWyl2diEJ52wkLv5mGYBfIuU8TMhM?=
 =?iso-8859-1?Q?C2VKjOJzfwSOrRYq2u+Qx+lbTYj80SftQtQ/z8iHu2gU2XyCxe5facseUF?=
 =?iso-8859-1?Q?HzptFXSKRgqSKqc+DQ9RinF7UPRbOqjFOe4p+wYuWntsIn1fqxzFGxdTFV?=
 =?iso-8859-1?Q?oPAv93rLyo13pjOBA9L4BnHs8LVLugXlEYkkRTGTnBqzBE9QL/VP74HpSh?=
 =?iso-8859-1?Q?yvbwF0IT5vYy9x/QUTqpFlO/8TJnl9OxSQHfsFz8gy56JHBlGIVIAYvEBv?=
 =?iso-8859-1?Q?PyhdTkjT1haJ1Hg1r1dOZrcaLiCC/ImmQMmi/cwX1mkfAo/nCzfbF1uBfH?=
 =?iso-8859-1?Q?3NcTDcL4aUEffsnhSMdSFyr2vFhM2KbULl4DgeLWGnc1b5h9yC8iTFQrgZ?=
 =?iso-8859-1?Q?v3mi4S3xH3M/8u8yy8GuZPaSos8Ew1PbFw/NYtrsS2Nid5Sq99Z2tJSBf/?=
 =?iso-8859-1?Q?1ObgxIY2wyG1OEg3Jw9eI8Q+mQBF4zMbMXxj6VrLxjqEebhPehmoykczrj?=
 =?iso-8859-1?Q?8TyBpMcw9COqrx5+2MQz0bO7fu2cyBClh+8bAAiMNwZRJb8Fs/NiSXJ9s+?=
 =?iso-8859-1?Q?GhCUg/JUEcvfrp+WMHbpTELH2nin+Av6MOmtCz4COqlrBozQqVuXPBD9oU?=
 =?iso-8859-1?Q?pUnmYU7XQP4QVk09sUoeLtjTHGSlCfYfAMCqBO/QO9HgKQp0MRolgk7TtN?=
 =?iso-8859-1?Q?+v6Za0enUFPTc6Nm13INkdHrdxE3b0j0MMnxnqP777vcJvRaq9WkzI5ziE?=
 =?iso-8859-1?Q?daqleDDIG6IeZfq6d5IWs6hFYDoZHGXm/hIq9Z/YeINK38DVpyweErXUTh?=
 =?iso-8859-1?Q?vFp8i0KcmfmJcRtJES9UVewaNgoP2pkcJNYMgEwdptQRiOoNiUaCGTsw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8613759-c561-4ffd-557f-08de02be1468
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 20:47:34.4151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LHxif96UaR6ChLmqbhSpKiGrFZysw6nIbylXf+D9jiLptu3E+BLXd1gRd2TTpBpj7zbeEP8MVhyOqWdkSydVCi9m2pMfMmVJ161fIQ6XZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

Hi Dave and Sima,

This contains a set of fixes for 6.18-rc1. I ended up delaying this and
hence collected more patches. Fixes are mostly spread around the driver
for the new features, particularly on error paths.

Thanks
Lucas De Marchi

drm-xe-next-fixes-2025-10-03:
Cross-subsystem Changes:
  - Fix userptr to not allow device private pages with SVM (Thomas
    Hellström)

Driver Changes:
  - Fix build with clang 16 (Michal Wajdeczko)
  - Fix handling of invalid configfs syntax usage and spell out the
    expected syntax in the documentation (Lucas De Marchi)
  - Do not try late bind firmware when running as VF since it
    shouldn't handle firmware loading (Michal Wajdeczko)
  - Fix idle assertion for local BOs (Thomas Hellström)
  - Fix uninitialized variable for late binding (Colin Ian King,
    Mallesh Koujalagi)
  - Do not require perfmon_capable to expose free memory at page
    granularity. Handle it like other drm drivers do (Matthew Auld)
  - Fix lock handling on suspend error path (Shuicheng Lin)
  - Fix I2C controller resume after S3 (Raag Jadav)
The following changes since commit b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde:

   Merge tag 'amd-drm-next-6.18-2025-09-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-30 09:26:31 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-10-03

for you to fetch changes up to 1af59cd5cc2b65d7fc95165f056695ce3f171133:

   drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path (2025-10-03 14:17:08 -0500)

----------------------------------------------------------------
Cross-subsystem Changes:
  - Fix userptr to not allow device private pages with SVM (Thomas
    Hellström)

Driver Changes:
  - Fix build with clang 16 (Michal Wajdeczko)
  - Fix handling of invalid configfs syntax usage and spell out the
    expected syntax in the documentation (Lucas De Marchi)
  - Do not try late bind firmware when running as VF since it
    shouldn't handle firmware loading (Michal Wajdeczko)
  - Fix idle assertion for local BOs (Thomas Hellström)
  - Fix uninitialized variable for late binding (Colin Ian King,
    Mallesh Koujalagi)
  - Do not require perfmon_capable to expose free memory at page
    granularity. Handle it like other drm drivers do (Matthew Auld)
  - Fix lock handling on suspend error path (Shuicheng Lin)
  - Fix I2C controller resume after S3 (Raag Jadav)

----------------------------------------------------------------
Colin Ian King (1):
       drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset

Lucas De Marchi (2):
       drm/xe/configfs: Fix engine class parsing
       drm/xe/configfs: Improve doc for ctx_restore* attributes

Mallesh Koujalagi (1):
       drm/xe/xe_late_bind_fw: Initialize uval variable in xe_late_bind_fw_num_fans()

Matthew Auld (1):
       drm/xe/uapi: loosen used tracking restriction

Michal Wajdeczko (3):
       drm/xe/tests: Fix build break on clang 16.0.6
       drm/xe/vf: Rename sriov_update_device_info
       drm/xe/vf: Don't claim support for firmware late-bind if VF

Raag Jadav (1):
       drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path

Shuicheng Lin (1):
       drm/xe/hw_engine_group: Fix double write lock release in error path

Thomas Hellström (2):
       drm/xe/bo: Fix an idle assertion for local bos
       drm/gpusvm, drm/xe: Fix userptr to not allow device private pages

  drivers/gpu/drm/drm_gpusvm.c            | 24 ++++++++++++-----------
  drivers/gpu/drm/xe/tests/xe_pci.c       | 12 ++++++------
  drivers/gpu/drm/xe/xe_bo.c              | 34 ++++++++++++++++++++++-----------
  drivers/gpu/drm/xe/xe_configfs.c        | 23 +++++++++++++++++-----
  drivers/gpu/drm/xe/xe_device.c          | 19 +++++++++---------
  drivers/gpu/drm/xe/xe_hw_engine_group.c |  6 +-----
  drivers/gpu/drm/xe/xe_late_bind_fw.c    | 20 +++++++++----------
  drivers/gpu/drm/xe/xe_pm.c              |  2 +-
  drivers/gpu/drm/xe/xe_query.c           | 15 ++++++---------
  drivers/gpu/drm/xe/xe_svm.c             | 11 +++--------
  drivers/gpu/drm/xe/xe_svm.h             | 14 ++++++++++++++
  drivers/gpu/drm/xe/xe_userptr.c         |  1 +
  drivers/gpu/drm/xe/xe_vm.c              |  1 +
  include/drm/drm_gpusvm.h                |  7 ++++---
  14 files changed, 111 insertions(+), 78 deletions(-)
