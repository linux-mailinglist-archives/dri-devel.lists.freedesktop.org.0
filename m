Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB26A34B85
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629CE10EB4C;
	Thu, 13 Feb 2025 17:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp+EO5n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF31D10EB49;
 Thu, 13 Feb 2025 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739467060; x=1771003060;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8WHJ9BlF6BN7UFT7hrCSTTE9DjfqobEDEE6GNcT+Uzs=;
 b=lp+EO5n0qfQxZwVd233ZI3OpuMFx3uYiz5Y6co+I52EKk3ikatQAjHs6
 LkxjpF3oXoGnBQSfgeekuOgYxDMBVHwMhB5EnOdr10i+2t2AkxBfcB97C
 dK2gTgTu/H5yAWgqit1wZXzYo0utHXfDn3IOjKiiT6pG/RbUyHPat7h2v
 OTGE7UbHLuO9OQlnEcXcjCha+WfNcWFdwl4NaDzvzPbWednE/rLtFW3Wr
 /XDU72Fywcnj953hgWTUCJGu2Y21Llv0paZfuf/F9WhCY0IDxYl0yDxRk
 iPUpAbQ9uhcw5GPG3JpcgYaUWi6tXG5vcupIfuRYfLsZNAUYBkb1rWNfB A==;
X-CSE-ConnectionGUID: XqjpNSVaRJuYF2nAFyyceA==
X-CSE-MsgGUID: b6P+o+HySUSIJ9wFv2K9Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43840204"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="43840204"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:16:49 -0800
X-CSE-ConnectionGUID: AUwmj1wgQl6lu3R59ppiag==
X-CSE-MsgGUID: ler4llSITbacMgRo+xTEdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="144072048"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 09:16:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 09:16:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 09:16:48 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 09:16:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0+ez9jLkF9Kh598S6fuCPoLAl/2Enuf9MRGqIq7r5SFWfrKOnlbSCCUkGoFJdfDwkVWwESf3Dq9T0jl+jU79RM3VDizW7HuZFxyot/h4kV5f+USjlc5ZkqUan3GksTBSeoyc4yDmdB7psiAlHtaA+uLN188FXuVqeVJvUSpnCO7iiHs+HhZ+DkINjQGjffZ/sCIlpfS6F8f4wQpkzrRtN9KRg15Ozig30sAzo6d2HqvzlR9yKzwpQfkUxO0lUN4SOoG5cMm+N6LlH3Xx42NnqJqtGVrDEnYz5HwgPWDnsbDFEmJDebZ/3yUKO7mNT9mZgKvxpi/yy02AiMeDE/wPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8mm4RS3PafkGv2EUq5ZaybJvYEGltuhNGfoVZJBFqo=;
 b=IiDX+qZ41i2grWDbZ086JGkHoN9po5H6frbFDUZcYCmYAjicwqjZ3Zt8iFMHDHN3B23TbutKEvmwN+U8Ur7mRJ3d/NISfNouq7RNHCqoLJ2f8KvFPzNA3xXna0HTTZeS5AfhaLt3yhzQD+/ikHXh9BSo/vV5zQi2F59GdsZ4gOR90egHaheUHjwPn3MUOfFEEJH+yaEaUZiTPqjI6NbL88QrqFl2TsDW1DIC8UC7tnOoiSSxidqd6q+ZyY5+MLOkyuK0QnwsS8C5uSR6UgckbCa4NnvjEzGokpUH/tMJjS1Gz5XcwyULP3Pnv39dXzhviJXCWbcHm0J44CGzWFeG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Thu, 13 Feb 2025 17:16:40 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 17:16:40 +0000
Date: Thu, 13 Feb 2025 12:16:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>
CC: <simona@ffwll.ch>, <lucas.demarchi@intel.com>,
 <jani.nikula@linux.intel.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <andriy.shevchenko@linux.intel.com>, <lina@asahilina.net>,
 <michal.wajdeczko@intel.com>, <andrealmeid@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <xaver.hugl@kde.org>, <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH v12 0/5] Introduce DRM device wedged event
Message-ID: <Z64o8hhQZSZ9jL3B@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <Z6xGRhC7qrtk7y9t@black.fi.intel.com> <Z6zngStoVbBSO7yz@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6zngStoVbBSO7yz@intel.com>
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb932d0-9418-43b8-f4d4-08dd4c522e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U8dhqn7JIwihQSXj1vRZuHJQaiiei0tXxJH4a0nToLV9Fl0tKbdyudRt5r?=
 =?iso-8859-1?Q?zdb/5lV5HBT6iSuijNktpMgLvmH6/SYGT6nMSuRUrtpBOsxTGuwkvz5iSM?=
 =?iso-8859-1?Q?2Vy/Iugp2l1TjPKlQO4S5ABGKFeOPS3DWhJ9WUltVTperGBIFdpxeNr6fQ?=
 =?iso-8859-1?Q?rl2Pc4C8ZJMsV8CYTDUL3XInRZu0sngE2dFymdCv1p8wD3OhssjaItMkQx?=
 =?iso-8859-1?Q?BC9xqMs67Rqu0ROFAhSsWp9gUC6cvkD3tnGrHhEjekUiq+bO3DZlKOJQ9+?=
 =?iso-8859-1?Q?e5WUwOGbUOQFcbLuitT3OZ6vCn3YCzxORl/XJBdCVXzLRzxijMkRx8AveR?=
 =?iso-8859-1?Q?w+uyyaMxAphq/I8O1ZAOGopgeztSqeYX+zGuaq8OA+FohXpXoAsUFHf2Vc?=
 =?iso-8859-1?Q?jHMDhC8nQnGmwG4xTd5jDDBAoQvUjnhLyutsKWzwn6rtJPLcaAJ5R1Cw25?=
 =?iso-8859-1?Q?iKBdMbytvvoPGP6GwR5QolRse/y2BGStgOKxr2ZMsVYbq/47oFcy7WOq6L?=
 =?iso-8859-1?Q?QNIscWLlRCL3QUgb0u+lm6mMFy6rbq7UlFpajcJWpxjw7f/4NfysOhOZ2u?=
 =?iso-8859-1?Q?BUICKE9ACvMk0+dm8BqPhkITixyYsW87t4oouZbm5df/RiO/LJEAkfkZZC?=
 =?iso-8859-1?Q?7GNsdyL5DsVGSb/ZE1HZO7Rnmt4nzMiMUVekoD86bZcyYXYSWt7u0NxVU+?=
 =?iso-8859-1?Q?OkTSBBxK9C+lwmc2DUsaS6fVqc6e+l7dNO0BhJd2RKM9u8S99URKfoSx/A?=
 =?iso-8859-1?Q?X2f8xhyUfARvqMhrz66sQwdv+ZHzC9uqqhwq8gekAn+Oz44kfIG0BpzPux?=
 =?iso-8859-1?Q?mGIqP64+ch45zxcKeg6miwcqCQaAMTDg8SoVQNlyclk4UWAFD61999MpLO?=
 =?iso-8859-1?Q?woF9zJQTEDfc1N0t+6NSvLszdUHiWJVpbYymSf/3NrTDFtKerh2Gd3SfL+?=
 =?iso-8859-1?Q?cc3FBFwC83fFaUKVKvDz3GFZ3t9TnO80zfK8x+k6wR9rlKpkbzPFxH0bHX?=
 =?iso-8859-1?Q?hXecT1wKaXlKD8CPssuVadyQuwMt7TCzaP79lOYAF7fKjed2w4kH6Ulmrp?=
 =?iso-8859-1?Q?cXyE/CZSKtp4D3y/9I34DpObT/o2b4qxXz6VNqkeq20u34SJ/O06BEdHik?=
 =?iso-8859-1?Q?aB1MLEkO4OsRlVaN1UZT5Kgfwaz4RNwDmlP47N1HtdaGUwve6N2H4QltF4?=
 =?iso-8859-1?Q?xbi5iozymkkfnE3Do4kzm7o88j5ji2erDI98Des6spaZHf51HDk3ezzxUh?=
 =?iso-8859-1?Q?ZX+G0hSQHidUHBQ9fn5OpWn/pChIIt4nxJlsfRw5k4kgIyjsOPgBMgywsN?=
 =?iso-8859-1?Q?tUwePf++Wn2tSgyHxTTG12sIRqUQ/B2+fhXWH8zZPFFwot2Htva5rJq0+c?=
 =?iso-8859-1?Q?KKnC/h5kdWRVBzrfJEsCRi5A23pmWBYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AhB4e0yq1yy6vL8D1CbC7F8L6/VSRRm3//nYPW9iWaFIk+/FXVS0xjHAMO?=
 =?iso-8859-1?Q?mT1n0nh41hvLxKo/7FtcDiKVPB03WPfHLYI4j2MzS6hkrgYtIGT6I5OsCz?=
 =?iso-8859-1?Q?w5VBr/OUt5McdJOhB74K/UFSrYyDoasQLvDzEN3ANf6pubAzhNKbj1hfFM?=
 =?iso-8859-1?Q?Bjgc7ujCKmrz4nLu3jrDqhOCscosKLhV8/Wx9cFP6PVXsoVmNLctUNHmx8?=
 =?iso-8859-1?Q?xleLGM6puS5wjqWcZCA4TRhGX+wTI33tmpfNv7QRuMA+we/ftmXo5QDWTp?=
 =?iso-8859-1?Q?CBRafQ4gJxWknCjN7IckjhMiFVRVqP3NDK1FvzrD/1nOfZJ+svLlscCdAA?=
 =?iso-8859-1?Q?yeeLjySuSraKAK97Q8lXWvbl6gflSyNjyRsu07qzPjLU64KYg4Whqo5ce1?=
 =?iso-8859-1?Q?zQ6+se1RCi6dsS9c7V1HLzjsKCIV88qD3UmjXT4fnWGGWi6HwE/57+7CtD?=
 =?iso-8859-1?Q?yJbd/CFMGk+nm0hwFX+cLFJecEE1SouLyvcQqmMf2FP8D0vPu2x6bdzGxs?=
 =?iso-8859-1?Q?ZTC9SUaxGS35SC57deXXSoAuLWSbYU62k22ZuBPgawaxZjYnUELisbo8gL?=
 =?iso-8859-1?Q?mpscdrFttj/Uxz57vg0TyoP0eVT3vuCjyiu/ZA3yfn68elq4ZOeTu7kQfZ?=
 =?iso-8859-1?Q?bGB3JUXAOy76Cso9k9zgnRdvp0o+a006XUlNCgkmyJRt/v/+aGTSSrY4Bg?=
 =?iso-8859-1?Q?xW7pmDQdBSy32ZxjDn3e/6dGHUAhxlQwKA8m1sYzwiFX5J2G5Gnpum9elz?=
 =?iso-8859-1?Q?YGaikXGBys9DGhhiTrR6vWACTtP1osSSSPdDFfPskP/VQy9slgbMqYCANj?=
 =?iso-8859-1?Q?QHluvygOWF72MO2H8WeA33JzFhTC4V71uXcDUee9V+GmwtajynpsqXiInv?=
 =?iso-8859-1?Q?maI6WXu3drAp883wyLoIO2/HHdUlPE5wSayB/CWnf00lsrVz7MoZJloRKT?=
 =?iso-8859-1?Q?WKDkFVKXHDwt2AK4crXLHPVxoNE84oAXbnJ9bmGH1vs+g9na3WHoIcXdZG?=
 =?iso-8859-1?Q?sMFNy0GoULYvhsl+yltNqxuSpmQlWGkCBkAKwqDfEKqn7UKOh9AEmjVOHt?=
 =?iso-8859-1?Q?3VplHmpjy9++JNVgDNhDJFPBYFVkVTrlBpBrXhO53T5PExnNF0nX0waG+x?=
 =?iso-8859-1?Q?tqu7FX7CEG5wyqxzxk6INrsmh7QGmZNshu6mHU2NiPLXxNxB+kc67WlaRG?=
 =?iso-8859-1?Q?L/HcTzPs5CRK2k5rsifUlVPIBk1iEpuXSN5W8T4ih2wD+C40E5UO0eAsmd?=
 =?iso-8859-1?Q?c9G8A6MuN8QgLQW44a8Y5eTQsYtWrIN073HcwwrE3XKbpBz9vZcAJjz3YC?=
 =?iso-8859-1?Q?0O1X2PXDI7oKJEIm06QEh+sjFEeWMjs+FpW7/cG197syfZP8ryI3f8XkOy?=
 =?iso-8859-1?Q?oYCVlWbcu55BUs2wD0g7eXpDrUe20M1BPkxD0yiLryUu/cntPk3GzYpy4S?=
 =?iso-8859-1?Q?mGzjUWJjRwioaoG7ntdWgzt+2bpvWup1YRdzfbQ+JnfrzgXfQtwmmpoGwT?=
 =?iso-8859-1?Q?9EgNoNZjYSVCKSb8pmFg0sf0MG3lhQs1Fr/p5UvK+weok/YqQQrJjHJTbW?=
 =?iso-8859-1?Q?f2mfzl4vroxUfbAZzRf7FR1Mfom3gCrxvxJDIbocKPvsRTzNJ4HdYv3zLT?=
 =?iso-8859-1?Q?76I7KSbQNW5wBtJu6z5/rHOhLPTDTzn/RQm4yiCGby1qya7jv6T+gEXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb932d0-9418-43b8-f4d4-08dd4c522e15
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:16:40.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Utz6W8xZdVt+j3N7i7S6d34qqPEQ9NRynkJA0uZBcz/fcOhJU0dc99VZ5CJg4Qap7iZl8nxnhKxIu3FzH7wouA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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

On Wed, Feb 12, 2025 at 01:25:05PM -0500, Rodrigo Vivi wrote:
> On Wed, Feb 12, 2025 at 08:57:10AM +0200, Raag Jadav wrote:
> > On Tue, Feb 04, 2025 at 12:35:23PM +0530, Raag Jadav wrote:
> > > This series introduces device wedged event in DRM subsystem and uses it
> > > in xe, i915 and amdgpu drivers. Detailed description in commit message.
> > > 
> > > This was earlier attempted as xe specific uevent in v1 and v2 on [1].
> > > Similar work by André Almeida on [2].
> > > Wedged event support for amdgpu by André Almeida on [3].
> > > Consumer implementation by Xaver Hugl on [4].
> > > 
> > >  [1] https://patchwork.freedesktop.org/series/136909/
> > >  [2] https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
> > >  [3] https://lore.kernel.org/dri-devel/20241216162104.58241-1-andrealmeid@igalia.com/
> > >  [4] https://invent.kde.org/plasma/kwin/-/merge_requests/7027
> > 
> > Bump. Anything I can do to move this forward?
> 
> Well, it would be great if we could get that merge request to remove
> the draft and move forward with this approach. But, based on our last
> discussion on #dri-devel, I don't see that as a blocker in any way.
> 
> And we also have all the reviews and acks needed to move forward with
> this on drm-misc.
> 
> So, if no other objection I'm planing to push this to drm-misc-next
> tomorrow.

done. pushed to drm-misc-next

> 
> > 
> > Raag
