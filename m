Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC97B49528
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45C510E56D;
	Mon,  8 Sep 2025 16:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR37Nomz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C91710E164;
 Mon,  8 Sep 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757348761; x=1788884761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YaYKZXMY3fsZh30mLUsV0tvv7PiqaFk471lQimWJA+c=;
 b=nR37Nomz1Q6G/9Ka5ww2sH06xYBOaeVvJQr/kEm3nwwh+EhCJVcNA9A1
 o0z17VUXEl2CFWHGtOvtLq6+0EuMfwCV8+oSy7I0bvCxkCem8aQXsC4AP
 RQN+jqosEF7F2SzJ+BG+vzrhOxGL2P2301k+Jq/or94aCgl5Fpjh3GaIc
 f8gX2NO1NqAsG+6vqz9B8rSQ8TbJCV0i98UA+i7TcSbXt/wLRa2uFvjFg
 YrDEIXU+AH/jlWYY0i4G5E2/T9UxKKz+HNOodQ85y88aZ5k9AZIvKccBw
 wmmYDKJG9/v07UGwLlmG/KzUjCPxlBJ+jOuTrCJRR5C37uDZCeISOJ/5J w==;
X-CSE-ConnectionGUID: +Mpiyl3cQo6LIXTohjTU/A==
X-CSE-MsgGUID: STc3oGhdQRqks8CfEKJWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58653844"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="58653844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:26:01 -0700
X-CSE-ConnectionGUID: /B4Qjev4ROOeevikydpwoA==
X-CSE-MsgGUID: GHUkGcaNRES/ReioKdQROg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172760368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:26:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 09:26:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 09:26:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 09:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXCID0gK0RzmVBlBGZMF2buYGVaty+EInf/+dOvyqqxqjuuijLKhGgfEtTZZk1CQm0QXQP6EJGgBfBVHmwNjbhCAg9A4TDzG/fwvhDdsThE7I0EJ3WUnwwltUsEz03lERulSuPuXQDRBeGlnJgPgF+/V5j1z+C4YsYUQSy96UEMDezSKW37aHgtJ5f5l6HEmXhBljc67Cbaa0MpquuRo9VLdFPAMM1EJp33Ex7sQB4V0LoMlIYKb18dwGT4vVu0IfEa+JTcK2aE5ZrB1IDdSptNNfSUkmGLj6akfTJA5c60RhrxLY0q95LJCW4PLheSRK+I29ZYWJaxrnnkElEgPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAxeF2FJSF80eB+1cPuEHt1lqq5K8unnNz66+t2ORBI=;
 b=b69jWlTCzoOAQ8brZWvXB7CaXu70rkGQub5CAIW9AcKIpDyil70pgoyIrUtRXzAV4UJlAMu/smQHrUEAH1pKUct1x82fqOmmoFUY8z+5BRHxsGlXsaXqiNH31gPdallBKGeUcFXDw4Au59joRA7RhsXhzFFdf1Vctqg1br+TSmPixBmQz50MdDu90jiqN28AjvEFJ3WHFH6KoEWyYgbOJeg7XY5UAt0bfbI2RRffEJ5k9OVKmyvJeKOlUyCOEyVh1LYqFyDffEFiGkzDLbLN/2aM7UtDEmRxmEO4r+riOW82FhybzB4OQy7c0IPM9g3pL0WSgwZ5bDYNwZ/XeXXveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 16:25:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 16:25:56 +0000
Date: Mon, 8 Sep 2025 11:25:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <mika.westerberg@linux.intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Message-ID: <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250905154953.3974335-3-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: a7907810-282e-4492-c235-08ddeef46355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xiO9oaTC0VVWdp9j3pFn4Oxj2G6Cp0S4CmYdzpN2+SW1GLE+E8un8jNHTsd9?=
 =?us-ascii?Q?5KkXlHFjjpCzpD+YXjJtNnb+j82KGz7qcTWjRNMwui1JSblYxeWV/sBm4XVi?=
 =?us-ascii?Q?GT65ZbPpQDSmad72QCq/EoaR6xdLa0TapYYDv1V7Z8PJ4a15qPhZH5nqHpAt?=
 =?us-ascii?Q?vywenvgRax3hl6krt1epgrKPJBCXiaEBbiBYITWhFPe/ydFDd4xQQERigAvL?=
 =?us-ascii?Q?onR+tPssYwC61Np596DG4z1p65CUxqhTh4ovgrMVfQ/nvbBxUzrnv4B0CJs2?=
 =?us-ascii?Q?GWHKI4dcY2y7AaVi69Kj2fqANYekSgeLvvKKATvGxxoAuaHjuXxH3SKF8lZt?=
 =?us-ascii?Q?0v++pu6jwyaLBxEsVvg0eSbgo6wxex6AJ+5+fyjI11xm1CfBDPdjFIrTYc6a?=
 =?us-ascii?Q?iKXeG+xSzr5CiB/zgD3ErJ4UFzEMY1aUMTNNefYx7LwW1uGhuWMixDW45glz?=
 =?us-ascii?Q?K93XRCBqNeeoUVvBKBv6efRpQ6rYSwxPXZMuSuSeFFVmR/uPdS0Hh/w23has?=
 =?us-ascii?Q?hI1MiodHw5oMtqVnREu8VVJLe2b0wFw7/jEspyVjT8IuiHa0rDkRICQBx6il?=
 =?us-ascii?Q?mVtFS+6QHaQfrdCCo2gKHHdOxts35V+x7E7t/Wm/YaZfvGbKV2ES8rxSNZIm?=
 =?us-ascii?Q?kEC/xTH6yfME64weXYS+7x+r6zXUzYRv77y174Nki3d2kT7YKhvwX1btmI2X?=
 =?us-ascii?Q?ZCQBjCHHp0Fg8Gyrpu2Yj6BdAewTYxoGoTXoiKy7sFHjBBXMwuVoKlzbD849?=
 =?us-ascii?Q?GJMNkCnexjh14kARj5N4GpN2kdfUdHoWRSLRU/jrlGTbePSkept0dfed3PEp?=
 =?us-ascii?Q?JKT7VqXjTuP8DFuGcZ4TMM5zcAWjcTf3bih1qdIoe1XRnwZ8b5fVsyh+zAeD?=
 =?us-ascii?Q?HiQpVFJvJi6iC/Mfd1j7zn75HagojjhHB5aU0RFDgjQx+B0xW4+9dbUo3Yug?=
 =?us-ascii?Q?rFtEjzZ1T0hlTCuJlzdeZC7V/G1P1PClHl6q2WGzWd9GSNMlT2toBIef1fpb?=
 =?us-ascii?Q?lz6/lzodc8VFdmZEtrsRkyU76yZPYZiKgPxCOQC74lFe/b7yRXCJcyEOuGnu?=
 =?us-ascii?Q?SHFMlMJFYwxtIMeKRZ74PqnpbAJ8MQbY4Xfqt7657TMdL3qHXZKMBounrOve?=
 =?us-ascii?Q?Scvx9v7lzps/9udIqPDO/8HM63wnKnV5n48WKyqlXfu7rZtE9jVhplguLkpv?=
 =?us-ascii?Q?/WFCdibnIP2wLFGTZXUOUojS0XFBBoimP2D+jlAEt375n6nWHqxmg3FGkjM9?=
 =?us-ascii?Q?WJXpFng9nMZINXYzDDo/DEdhLtYBi+ME4jSfiATfgf8y6qGzxjimiAf5hrHj?=
 =?us-ascii?Q?ll6vMA8yZ92iK5vSVTHb9OveqMpJLaSdUdjInTyvFkQrC9JzKqs8NHS7Yn3n?=
 =?us-ascii?Q?mYMy2qoMIYmtEvl9bVUCT8h61JAHjFtxONT77UyLY3tr8usjMN4u+jawt2YD?=
 =?us-ascii?Q?SL74bt/G/XE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WV8Mm6fkC7ruE/YiuRscheVVErwEkW5xay4GsdJcn3sQJ3wGzv2Fo/vCVosU?=
 =?us-ascii?Q?2i+veSMdE9OzZk8ZZ0+SFCsLYWohwIpiW65XkQfL3pUmnm7Fez1WMfN5vYcS?=
 =?us-ascii?Q?FOGU3DjivAPXps5UtNfROM947nYlurzhjpkBsmKN+66MLhNb1TKTuyWeCbbW?=
 =?us-ascii?Q?wPlJZZJiF9J3M3pMWk7r9FG+U2O9CvnvQKUF9OxhEoNtoSdNgMfx1BNjCClV?=
 =?us-ascii?Q?sVHpqnMLuEQ+CVZFNcgqZ34r/QG9y12fMgCwVHWOWU+osy9nXvTRvwBGRzPY?=
 =?us-ascii?Q?POccqOXkXqPpsXfEoLXQPFc7nNRo9y/jVlnd6ED5ILwf6IDiGmQePuxawq+C?=
 =?us-ascii?Q?4256Sn6CPq1D/HlBrsPKDnLPF19biB4lm24lZNa5GNZj4r6arAZLIrltHEY+?=
 =?us-ascii?Q?kwD5TsKopvW8JQlp004tBvRvaha4gHeO+aMgBirGNhFjIgBH8SzUGSdl9elQ?=
 =?us-ascii?Q?Ug09kD6n2tMr9ck6AwMDgzmUsNQdD67JZb9MLGG+SGBsJmKvC5QSEnokpIHT?=
 =?us-ascii?Q?LZ9Q9SO7l3LILiyFX/xsJuLTjh76rfLcRa0M0AA+lQT/L8QBuTTrAMnCheIl?=
 =?us-ascii?Q?fRSa8NxgTBxY2y7XeX+7MSt9Z2/x+/vonIZHAf/U1a7mMnicHcUL1Mm9PrqA?=
 =?us-ascii?Q?+nf3BGLUH3rNSTp2VHaei8EUeFtuzYsL0aWFWjwYwOZUTlvRqHPEv2IjaMsK?=
 =?us-ascii?Q?f1kcvD8ab+sjkp1GK7eP7bDWpFU0OjH7o4fdavLcpkLW+DjLVs6ug56YR9i8?=
 =?us-ascii?Q?Ofvtkxu/hYQQpEEHVNPx8ckosuGTG20oMXfVwzd2vINEfo0OzmMSN7dCVHKo?=
 =?us-ascii?Q?xrZKvMo7cLIw1ugcSwUu6i1Fq/XdVwbHLEW0mFQ7yWzdzQF4Te2i3W+LJ2+x?=
 =?us-ascii?Q?/7tMMd26CD6v7R0kC5MUVKgVhobe4tjDWShALXMNH5vKtTGYgwk1peSqao2K?=
 =?us-ascii?Q?hpzmEde+3CK+6/FWFG9vnCLK035uUxBh1/zMFzIo/2oTIZoADPKoiv+apbF7?=
 =?us-ascii?Q?nXQ7KaEHZc6iRYCYDKA8RZp3fdGssyHXNBsxwrRINaau1gBG8eVRMjVbMmc9?=
 =?us-ascii?Q?ilWsPPtGOV6F2ciJJ9Tnxe7igI0soaw0M+VhO/6jrIkQJ/GxCHtX31fbwtJI?=
 =?us-ascii?Q?tr5s2CUEvQZGZmLilvCFz0p6nBpnj2zH7Bqy5ydOMSW1g8gC1exhQLlVylRl?=
 =?us-ascii?Q?YzrJQDI/p6EfRHLFJsOBcd518FAvUL9JfjcPsbHB8TNOv92e5F/dKfbJsbEy?=
 =?us-ascii?Q?CZZ6MbkPG4EeGVj0dIqKDJjjbmT6i2wGnORSzd6JQbvRcCp/1zi1QTZBgMLZ?=
 =?us-ascii?Q?b1FuZmW9Y158mbMZddi5NoM23/3lWQLn6QWVQMdxmS3UvNoG7KSndw8Z2Zml?=
 =?us-ascii?Q?rIM/9Iwj+maSW0+W553Z03JHv5/INNiwXoceWGbAKgnY4ug6WvQAXcsKO4AG?=
 =?us-ascii?Q?l1gUjvyQtIlg55K7IQi8YVnxreqayKDaG3fheKbrWYtOJhfVAgtXhiHE+8iU?=
 =?us-ascii?Q?13b9ZOUUsx9/EFZRUha770Z3xoIlXW//eqaAfkmRk7WoEXIv+ZV17tUfciaK?=
 =?us-ascii?Q?jinN0O5QSlFsZrxPn+pNdCO7qQWQP2L6NbeL0kjt7g8IdyntIXhVYVb2lEi7?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7907810-282e-4492-c235-08ddeef46355
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:25:56.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X29dTfASFb1y0bJNvONmYdq8AlTyjhmnHKAWspFTbi3bD8e7fgBNTNLw88LaVjJ6m71TlMH9pySIvjewgVWnVAsrkCAc6gvbsofM1vHvbP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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

On Fri, Sep 05, 2025 at 09:19:46PM +0530, Badal Nilawar wrote:
>From: Alexander Usyskin <alexander.usyskin@intel.com>
>
>Introduce a new MEI client driver to support Late Binding firmware
>upload/update for Intel discrete graphics platforms.
>
>Late Binding is a runtime firmware upload/update mechanism that allows
>payloads, such as fan control and voltage regulator, to be securely
>delivered and applied without requiring SPI flash updates or
>system reboots. This driver enables the Xe graphics driver and other
>user-space tools to push such firmware blobs to the authentication
>firmware via the MEI interface.
>
>The driver handles authentication, versioning, and communication
>with the authentication firmware, which in turn coordinates with
>the PUnit/PCODE to apply the payload.
>
>This is a foundational component for enabling dynamic, secure,
>and re-entrant configuration updates on platforms like Battlemage.
>
>Cc: Badal Nilawar <badal.nilawar@intel.com>
>Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>---
> drivers/misc/mei/Kconfig                   |  13 +
> drivers/misc/mei/Makefile                  |   1 +
> drivers/misc/mei/mei_lb.c                  | 312 +++++++++++++++++++++
> include/drm/intel/i915_component.h         |   1 +
> include/drm/intel/intel_lb_mei_interface.h |  70 +++++
> 5 files changed, 397 insertions(+)
> create mode 100644 drivers/misc/mei/mei_lb.c
> create mode 100644 include/drm/intel/intel_lb_mei_interface.h
>
>diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
>index 7575fee96cc6..f8b04e49e4ba 100644
>--- a/drivers/misc/mei/Kconfig
>+++ b/drivers/misc/mei/Kconfig
>@@ -81,6 +81,19 @@ config INTEL_MEI_VSC
> 	  This driver can also be built as a module. If so, the module
> 	  will be called mei-vsc.
>
>+config INTEL_MEI_LB
>+	tristate "Intel Late Binding (LB) support on ME Interface"
>+	depends on INTEL_MEI_ME
>+	depends on DRM_XE
>+	help
>+	  Enable support for Intel Late Binding (LB) via the MEI interface.
>+
>+	  Late Binding is a method for applying firmware updates at runtime,
>+	  allowing the Intel Xe driver to load firmware payloads such as
>+	  fan controller or voltage regulator. These firmware updates are
>+	  authenticated and versioned, and do not require firmware flashing
>+	  or system reboot.
>+
> source "drivers/misc/mei/hdcp/Kconfig"
> source "drivers/misc/mei/pxp/Kconfig"
> source "drivers/misc/mei/gsc_proxy/Kconfig"
>diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
>index 6f9fdbf1a495..a203ed766b33 100644
>--- a/drivers/misc/mei/Makefile
>+++ b/drivers/misc/mei/Makefile
>@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
> obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
> obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
> obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
>+obj-$(CONFIG_INTEL_MEI_LB) += mei_lb.o
>
> obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o
> mei-vsc-hw-y := vsc-tp.o
>diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
>new file mode 100644
>index 000000000000..77686b108d3c
>--- /dev/null
>+++ b/drivers/misc/mei/mei_lb.c
>@@ -0,0 +1,312 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (C) 2025 Intel Corporation
>+ */
>+
>+#include <linux/component.h>
>+#include <linux/mei_cl_bus.h>
>+#include <linux/module.h>
>+#include <linux/overflow.h>
>+#include <linux/pci.h>
>+#include <linux/slab.h>
>+#include <linux/uuid.h>
>+
>+#include <drm/intel/i915_component.h>
>+#include <drm/intel/intel_lb_mei_interface.h>
>+
>+#include "mkhi.h"
>+
>+/**
>+ * DOC: Late Binding Firmware Update/Upload
>+ *
>+ * Late Binding is a firmware update/upload mechanism that allows configuration
>+ * payloads to be securely delivered and applied at runtime, rather than
>+ * being embedded in the system firmware image (e.g., IFWI or SPI flash).
>+ *
>+ * This mechanism is used to update device-level configuration such as:
>+ * - Fan controller
>+ * - Voltage regulator (VR)
>+ *
>+ * Key Characteristics:
>+ * ---------------------
>+ * - Runtime Delivery:
>+ *   Firmware blobs are loaded by the host driver (e.g., Xe KMD)
>+ *   after the GPU or SoC has booted.
>+ *
>+ * - Secure and Authenticated:
>+ *   All payloads are signed and verified by the authentication firmware.
>+ *
>+ * - No Firmware Flashing Required:
>+ *   Updates are applied in volatile memory and do not require SPI flash
>+ *   modification or system reboot.
>+ *
>+ * - Re-entrant:
>+ *   Multiple updates of the same or different types can be applied
>+ *   sequentially within a single boot session.
>+ *
>+ * - Version Controlled:
>+ *   Each payload includes version and security version number (SVN)
>+ *   metadata to support anti-rollback enforcement.
>+ *
>+ * Upload Flow:
>+ * ------------
>+ * 1. Host driver (KMD or user-space tool) loads the late binding firmware.
>+ * 2. Firmware is passed to the MEI interface and forwarded to
>+ *    authentication firmware.
>+ * 3. Authentication firmware authenticates the payload and extracts
>+ *    command and data arrays.
>+ * 4. Authentication firmware delivers the configuration to PUnit/PCODE.
>+ * 5. Status is returned back to the host via MEI.
>+ */
>+
>+#define INTEL_LB_CMD	0x12
>+#define INTEL_LB_RSP	(INTEL_LB_CMD | 0x80)
>+
>+#define INTEL_LB_SEND_TIMEOUT_MSEC 3000
>+#define INTEL_LB_RECV_TIMEOUT_MSEC 3000
>+
>+/**
>+ * struct mei_lb_req - Late Binding request structure
>+ * @header: MKHI message header (see struct mkhi_msg_hdr)
>+ * @type: Type of the Late Binding payload
>+ * @flags: Flags to be passed to the authentication firmware (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
>+ * @reserved: Reserved for future use by authentication firmware, must be set to 0
>+ * @payload_size: Size of the payload data in bytes
>+ * @payload: Payload data to be sent to the authentication firmware
>+ */
>+struct mei_lb_req {
>+	struct mkhi_msg_hdr header;
>+	__le32 type;
>+	__le32 flags;
>+	__le32 reserved[2];
>+	__le32 payload_size;
>+	u8 payload[] __counted_by(payload_size);
>+} __packed;
>+
>+/**
>+ * struct mei_lb_rsp - Late Binding response structure
>+ * @header: MKHI message header (see struct mkhi_msg_hdr)
>+ * @type: Type of the Late Binding payload
>+ * @reserved: Reserved for future use by authentication firmware, must be set to 0
>+ * @status: Status returned by authentication firmware (see &enum intel_lb_status)
>+ */
>+struct mei_lb_rsp {
>+	struct mkhi_msg_hdr header;
>+	__le32 type;
>+	__le32 reserved[2];
>+	__le32 status;
>+} __packed;
>+
>+static bool mei_lb_check_response(const struct device *dev, ssize_t bytes,
>+				  struct mei_lb_rsp *rsp)
>+{
>+	/*
>+	 * Received message size may be smaller than the full message size when
>+	 * reply contains only MKHI header with result field set to the error code.
>+	 * Check the header size and content first to output exact error, if needed,
>+	 * and then process to the whole message.
>+	 */
>+	if (bytes < sizeof(rsp->header)) {
>+		dev_err(dev, "Received less than header size from the firmware: %zd < %zu\n",
>+			bytes, sizeof(rsp->header));
>+		return false;
>+	}
>+	if (rsp->header.group_id != MKHI_GROUP_ID_GFX) {
>+		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
>+			rsp->header.group_id, MKHI_GROUP_ID_GFX);
>+		return false;
>+	}
>+	if (rsp->header.command != INTEL_LB_RSP) {
>+		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
>+			rsp->header.command, INTEL_LB_RSP);
>+		return false;
>+	}
>+	if (rsp->header.result) {
>+		dev_err(dev, "Error in result: 0x%x\n", rsp->header.result);
>+		return false;
>+	}
>+	if (bytes < sizeof(*rsp)) {
>+		dev_err(dev, "Received less than message size from the firmware: %zd < %zu\n",
>+			bytes, sizeof(*rsp));
>+		return false;
>+	}
>+
>+	return true;
>+}
>+
>+static int mei_lb_push_payload(struct device *dev,
>+			       enum intel_lb_type type, u32 flags,
>+			       const void *payload, size_t payload_size)
>+{
>+	struct mei_cl_device *cldev;
>+	struct mei_lb_req *req = NULL;
>+	struct mei_lb_rsp rsp;
>+	size_t req_size;
>+	ssize_t bytes;
>+	int ret;
>+
>+	cldev = to_mei_cl_device(dev);
>+
>+	ret = mei_cldev_enable(cldev);
>+	if (ret) {
>+		dev_dbg(dev, "Failed to enable firmware client. %d\n", ret);
>+		return ret;
>+	}
>+
>+	req_size = struct_size(req, payload, payload_size);
>+	if (req_size > mei_cldev_mtu(cldev)) {
>+		dev_err(dev, "Payload is too big: %zu\n", payload_size);
>+		ret = -EMSGSIZE;
>+		goto end;
>+	}
>+
>+	req = kmalloc(req_size, GFP_KERNEL);
>+	if (!req) {
>+		ret = -ENOMEM;
>+		goto end;
>+	}
>+
>+	req->header.group_id = MKHI_GROUP_ID_GFX;
>+	req->header.command = INTEL_LB_CMD;
>+	req->type = cpu_to_le32(type);
>+	req->flags = cpu_to_le32(flags);
>+	req->reserved[0] = 0;
>+	req->reserved[1] = 0;
>+	req->payload_size = cpu_to_le32(payload_size);
>+	memcpy(req->payload, payload, payload_size);
>+
>+	bytes = mei_cldev_send_timeout(cldev, (u8 *)req, req_size,
>+				       INTEL_LB_SEND_TIMEOUT_MSEC);
>+	if (bytes < 0) {
>+		dev_err(dev, "Failed to send late binding request to firmware. %zd\n", bytes);
>+		ret = bytes;
>+		goto end;
>+	}
>+
>+	bytes = mei_cldev_recv_timeout(cldev, (u8 *)&rsp, sizeof(rsp),
>+				       INTEL_LB_RECV_TIMEOUT_MSEC);
>+	if (bytes < 0) {
>+		dev_err(dev, "Failed to receive late binding reply from MEI firmware. %zd\n",
>+			bytes);
>+		ret = bytes;
>+		goto end;
>+	}
>+	if (!mei_lb_check_response(dev, bytes, &rsp)) {
>+		dev_err(dev, "Bad response from the firmware. header: %02x %02x %02x %02x\n",
>+			rsp.header.group_id, rsp.header.command,
>+			rsp.header.reserved, rsp.header.result);
>+		ret = -EPROTO;
>+		goto end;
>+	}
>+
>+	dev_dbg(dev, "status = %u\n", le32_to_cpu(rsp.status));
>+	ret = (int)le32_to_cpu(rsp.status);
>+end:
>+	mei_cldev_disable(cldev);
>+	kfree(req);
>+	return ret;
>+}
>+
>+static const struct intel_lb_component_ops mei_lb_ops = {
>+	.push_payload = mei_lb_push_payload,
>+};
>+
>+static int mei_lb_component_master_bind(struct device *dev)
>+{
>+	return component_bind_all(dev, (void *)&mei_lb_ops);
>+}
>+
>+static void mei_lb_component_master_unbind(struct device *dev)
>+{
>+	component_unbind_all(dev, (void *)&mei_lb_ops);
>+}
>+
>+static const struct component_master_ops mei_lb_component_master_ops = {
>+	.bind = mei_lb_component_master_bind,
>+	.unbind = mei_lb_component_master_unbind,
>+};
>+
>+static int mei_lb_component_match(struct device *dev, int subcomponent,
>+				  void *data)
>+{
>+	/*
>+	 * This function checks if requester is Intel %PCI_CLASS_DISPLAY_VGA or
>+	 * %PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is the
>+	 * grand parent of mei_if i.e. late bind MEI device
>+	 */
>+	struct device *base = data;
>+	struct pci_dev *pdev;
>+
>+	if (!dev)
>+		return 0;
>+
>+	if (!dev_is_pci(dev))
>+		return 0;
>+
>+	pdev = to_pci_dev(dev);
>+
>+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
>+		return 0;
>+
>+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
>+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))

this doesn't seem right, we should allow other PCI classes. AFAICS this
check could just be removed and just leave the INTEL_COMPONENT_LB below
to protect for component match

Lucas De Marchi

>+		return 0;
>+
>+	if (subcomponent != INTEL_COMPONENT_LB)
>+		return 0;
>+
>+	base = base->parent;
>+	if (!base) /* mei device */
>+		return 0;
>+
>+	base = base->parent; /* pci device */
>+
>+	return !!base && dev == base;
>+}
>+
>+static int mei_lb_probe(struct mei_cl_device *cldev,
>+			const struct mei_cl_device_id *id)
>+{
>+	struct component_match *master_match = NULL;
>+	int ret;
>+
>+	component_match_add_typed(&cldev->dev, &master_match,
>+				  mei_lb_component_match, &cldev->dev);
>+	if (IS_ERR_OR_NULL(master_match))
>+		return -ENOMEM;
>+
>+	ret = component_master_add_with_match(&cldev->dev,
>+					      &mei_lb_component_master_ops,
>+					      master_match);
>+	if (ret < 0)
>+		dev_err(&cldev->dev, "Failed to add late binding master component. %d\n", ret);
>+
>+	return ret;
>+}
>+
>+static void mei_lb_remove(struct mei_cl_device *cldev)
>+{
>+	component_master_del(&cldev->dev, &mei_lb_component_master_ops);
>+}
>+
>+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
>+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
>+
>+static const struct mei_cl_device_id mei_lb_tbl[] = {
>+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
>+	{ }
>+};
>+MODULE_DEVICE_TABLE(mei, mei_lb_tbl);
>+
>+static struct mei_cl_driver mei_lb_driver = {
>+	.id_table = mei_lb_tbl,
>+	.name = "mei_lb",
>+	.probe = mei_lb_probe,
>+	.remove	= mei_lb_remove,
>+};
>+
>+module_mei_cl_driver(mei_lb_driver);
>+
>+MODULE_AUTHOR("Intel Corporation");
>+MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("MEI Late Binding Firmware Update/Upload");
>diff --git a/include/drm/intel/i915_component.h b/include/drm/intel/i915_component.h
>index 4ea3b17aa143..8082db222e00 100644
>--- a/include/drm/intel/i915_component.h
>+++ b/include/drm/intel/i915_component.h
>@@ -31,6 +31,7 @@ enum i915_component_type {
> 	I915_COMPONENT_HDCP,
> 	I915_COMPONENT_PXP,
> 	I915_COMPONENT_GSC_PROXY,
>+	INTEL_COMPONENT_LB,
> };
>
> /* MAX_PORT is the number of port
>diff --git a/include/drm/intel/intel_lb_mei_interface.h b/include/drm/intel/intel_lb_mei_interface.h
>new file mode 100644
>index 000000000000..d65be2cba2ab
>--- /dev/null
>+++ b/include/drm/intel/intel_lb_mei_interface.h
>@@ -0,0 +1,70 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright (c) 2025 Intel Corporation
>+ */
>+
>+#ifndef _INTEL_LB_MEI_INTERFACE_H_
>+#define _INTEL_LB_MEI_INTERFACE_H_
>+
>+#include <linux/types.h>
>+
>+struct device;
>+
>+/**
>+ * define INTEL_LB_FLAG_IS_PERSISTENT - Mark the payload as persistent
>+ *
>+ * This flag indicates that the late binding payload should be stored
>+ * persistently in flash across warm resets.
>+ */
>+#define INTEL_LB_FLAG_IS_PERSISTENT	BIT(0)
>+
>+/**
>+ * enum intel_lb_type - enum to determine late binding payload type
>+ * @INTEL_LB_TYPE_FAN_CONTROL: Fan controller configuration
>+ */
>+enum intel_lb_type {
>+	INTEL_LB_TYPE_FAN_CONTROL = 1,
>+};
>+
>+/**
>+ * enum intel_lb_status - Status codes returned on late binding transmissions
>+ * @INTEL_LB_STATUS_SUCCESS: Operation completed successfully
>+ * @INTEL_LB_STATUS_4ID_MISMATCH: Mismatch in the expected 4ID (firmware identity/token)
>+ * @INTEL_LB_STATUS_ARB_FAILURE: Arbitration failure (e.g. conflicting access or state)
>+ * @INTEL_LB_STATUS_GENERAL_ERROR: General firmware error not covered by other codes
>+ * @INTEL_LB_STATUS_INVALID_PARAMS: One or more input parameters are invalid
>+ * @INTEL_LB_STATUS_INVALID_SIGNATURE: Payload has an invalid or untrusted signature
>+ * @INTEL_LB_STATUS_INVALID_PAYLOAD: Payload contents are not accepted by firmware
>+ * @INTEL_LB_STATUS_TIMEOUT: Operation timed out before completion
>+ */
>+enum intel_lb_status {
>+	INTEL_LB_STATUS_SUCCESS           = 0,
>+	INTEL_LB_STATUS_4ID_MISMATCH      = 1,
>+	INTEL_LB_STATUS_ARB_FAILURE       = 2,
>+	INTEL_LB_STATUS_GENERAL_ERROR     = 3,
>+	INTEL_LB_STATUS_INVALID_PARAMS    = 4,
>+	INTEL_LB_STATUS_INVALID_SIGNATURE = 5,
>+	INTEL_LB_STATUS_INVALID_PAYLOAD   = 6,
>+	INTEL_LB_STATUS_TIMEOUT           = 7,
>+};
>+
>+/**
>+ * struct intel_lb_component_ops - Ops for late binding services
>+ */
>+struct intel_lb_component_ops {
>+	/**
>+	 * push_payload - Sends a payload to the authentication firmware
>+	 * @dev: Device struct corresponding to the mei device
>+	 * @type: Payload type (see &enum intel_lb_type)
>+	 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
>+	 * @payload: Pointer to payload buffer
>+	 * @payload_size: Payload buffer size in bytes
>+	 *
>+	 * Return: 0 success, negative errno value on transport failure,
>+	 *         positive status returned by firmware
>+	 */
>+	int (*push_payload)(struct device *dev, u32 type, u32 flags,
>+			    const void *payload, size_t payload_size);
>+};
>+
>+#endif /* _INTEL_LB_MEI_INTERFACE_H_ */
>-- 
>2.34.1
>
