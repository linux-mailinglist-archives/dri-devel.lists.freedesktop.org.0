Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4380ADB425
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62B210E343;
	Mon, 16 Jun 2025 14:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+EdaSvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7938D10E341;
 Mon, 16 Jun 2025 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084951; x=1781620951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TzDhb4slBOpvX6dOdbg7W+7mguRa9mwNdAiXEk/ACzI=;
 b=l+EdaSvpCrKTtf8aZFknhLZpeByvAGdMOgNiGRz7awjcB1ef8llyleCP
 I4IzRTLVd+of6rvCdRxJa8GInZ+SlyRoQ5VEjl9ql3al2nVx0A/FloGo/
 ksGzL5VFzGtBSidYyDFsAsEbIBwWCyWfTK0EUFI7ahBDC6h5Fmab0NZdI
 SeCrHSE2Fxs9lXf87rbEdtdeYGEET//XP5ytQdQEG8c+YbCuiP4lA/pCY
 ChuQyZVneh+Ef1/cem/C6Ze7yEB7pTyjugsuD5zQ8tFpNLeMA9jdIFL3+
 Nsi4d3x4Tp63NBxIXreBkVvAqwg6D26utgZOhtLJC/nq34iLZr4yQJa8y w==;
X-CSE-ConnectionGUID: mKL633/pT5C0iUqL9dJAfA==
X-CSE-MsgGUID: DStpGGogRMqGnleOtZkwTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74766549"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="74766549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:42:31 -0700
X-CSE-ConnectionGUID: mzavqTzdSxCWAbmDQdTPnA==
X-CSE-MsgGUID: iKxLJgHuQnaCApoI4wGcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153246921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:42:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:42:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:42:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6A/qowJioLP/d+TiepAh1bC+kJUIeBCl7KpfNmgOTsdCn32Z8D60exYov6/6e+Ljns7/i0uokekEO4Oe52gcMpphxdGKl9hMlzQ7TaQ6Rw2QPe8i6R3TxNaTtRXqSVg1geBJ2QUP4nqvcOPqS1VhcertU027se9o7JsGRlZHnBjswPFhhPMRrkzM8QRm2zAMCP0GskShssziLOCCR0cVCo9fhkkaucFEOL1vL/wiJF69ksrlTAJdpvg2SdspXSqDEPZJYvez/wLFxNUttSaRSbw6cgsvuNj80y4fWilyodyRtBwsQzOjDCH1+pFP1IR+PrCUuCXj7PgG5Kb/zPsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Naf0X8OWwPivG8N1ZC3LGsutJDd734bpinEo8vjFVes=;
 b=a/+QT6mKuOWAzfvP5YWoE9/N9aoCQFnOH0K3K3hxFmiQzInuCbATAhDXdK11kiDlqsEfeccGaDpb3H/wsidfJrPajA3xFm4wZoLGhdfevxJ/9FTpPuOeJFywYnaT6Z5CoG6BlpMet6DHK9/c7PXMIEfuwdp04gRpl4W4XjrOJ36iDPwcJxBXdB0Ys9lSwHfmKfSGWcVYQrNE9RHHWHYHrrpFGUA0MNqaB8aoLDoPMPfEIrI28O8ONB3ZRPLbbgRmbrKbChPc2LbCsNygyQ78rzlM4Q/GVlMzEy7f1OKAzpNWB4NPI5kCRuYftmwv7e/4pcivEwymu9yIH5+kvWt2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 14:42:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:42:13 +0000
Date: Mon, 16 Jun 2025 10:42:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH v2 09/10] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <aFAtQT4aHom3PVoi@intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606175707.1403384-10-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: d52f70f9-f2ad-4d9b-f332-08ddace3fb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hlSYFLoVDFyUyU68sggF/UglkD3R1TZDArpLKwFoHQ4NHEsFdkFWP8m+a4?=
 =?iso-8859-1?Q?NPm5E5ZA2+5TVJkv9s2bJJaT+bw3KOeDQiCgj/QoE21jS57oQAcS5ezA1O?=
 =?iso-8859-1?Q?M2+bUQ8Y+Z4Y3/MIumb+4lSCABLM+JPDa1d71bx6/EC2Ymxb+BKmR1Z6Rf?=
 =?iso-8859-1?Q?W10sJ/szKmSrsC8eaGRCqacfD38P6onnSgOO7JqMxmpkkl2l2MJIUxVTtl?=
 =?iso-8859-1?Q?Xd78xV6L1Ug7+DIIq7cFkjxMXPqRrE/J3X82U8TMrD7PEebDhERn259thq?=
 =?iso-8859-1?Q?35j6GtKHlcG9uiEcuy27OnYF1KHEOr5FHEqpyRy76P+eGMCpd+NeipZ0gm?=
 =?iso-8859-1?Q?REwcevh1ceaKALZ9rnnA8uOrSqGM7lrZTNQI6Rf2MqRmyJbFmMZN1QYl2t?=
 =?iso-8859-1?Q?k5JsUC8oTfYdnxOIw4v3h5JVm0ehS8/1XmyPcb/vWABAC9fqYInM2EGA/W?=
 =?iso-8859-1?Q?iiiqQLUD0Rbs4txd+dBvvbVOu8T4KEWG8q4OEKF8NsteO9cftsKEEATHg7?=
 =?iso-8859-1?Q?KYpWHqPDKqniDhyPLajSnVrAhTkt5JtyV757bUs5WkEmAM8VE6zCyaMQKw?=
 =?iso-8859-1?Q?Axq4ffbAPZ6q8c/jHDmgaQrZjuZaRRHZZ4A1x6QfJC+8yefIEzLsTUYCLi?=
 =?iso-8859-1?Q?x+CVdsJxW1QlTdzlQvkpA+GZnC9sTNY/Kbsp8gt4ZA1+V8STlH3nytWNDT?=
 =?iso-8859-1?Q?iXN93nNub4yVbnmogrC7uSr24aq4HhvRHIkIyYS4E5MCgKDZCdJLuoD+F/?=
 =?iso-8859-1?Q?wAdGXMKt3SEe+SNADpV21yLRmqi/uyo0srRwsSUr6+Cf0/zSNUnpP/lnIq?=
 =?iso-8859-1?Q?+a7PEZSw5bW8zDvGn9HmSPiX8MIUBsJmx1mSU+fqCftgwuH1WPESF+8m+V?=
 =?iso-8859-1?Q?syUYQnmCCkH9gWP9cDRhJOxYOEdYlHzDrqRKMLI4xJT4WQKAcf/bclR60n?=
 =?iso-8859-1?Q?zNcXnyDceaJYlBe8vPHA1kFtoOsvuimRXlcYdmd00/IXhwL/PrhSn5fbnb?=
 =?iso-8859-1?Q?MJrmAJSQ+mRcvSd9XLp6OC310g5s1flYliYWBXgCydP8vMB0edMJeWGNzm?=
 =?iso-8859-1?Q?XA4rCT4KbtHrPijpiR+WrM/tUfR3Htz87OuJVD9BJzHiPTBg+lDk0SH5pq?=
 =?iso-8859-1?Q?YdTyBWqKiRFYpDymik16DJhrz1aBn1+vfjd+j455Kyrj1fdZgQ+D2872Aj?=
 =?iso-8859-1?Q?vu9oi+4Yxk2gv/+Z8Al9vTGQp+5iOfrzAGoepWjN0RJyz/AI4BEDUA7yVn?=
 =?iso-8859-1?Q?bxkgg/14gy+jmO49IX3erdAcX/XngkReXo9XGN2wz7O3V0++NDEMBM1zzr?=
 =?iso-8859-1?Q?DhP7j4O/TTxFm/hN9OyU4FiRTCGjm6V0Ykx7hoVsmciTRWiseW7Uw003eQ?=
 =?iso-8859-1?Q?RXM8NSlmuMvnjrDnsHYSLZboCm7r8pl9b5QlodEwkPYzjPxwjS++WLVU+C?=
 =?iso-8859-1?Q?dDx1bIJVkh3yLgwG9chzDDnMJhJ88o3DDKB+ZNcn+0kdpMmn8wY2GKBr5l?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7z6xVl8r7JpQDDmtQTjA4L2c/NrYTu5W/CKhE9DQ4eVPTMkbaCnm2HLb9V?=
 =?iso-8859-1?Q?ry7XxxpelRz/dIPhU64z2JX8/+h04Eafdkd4C0yMpVFB/b0XFe36sbUF36?=
 =?iso-8859-1?Q?ceDTpssa0kNITSOF4YqTUnOM0LA14Z3tPEhjEEUNNPqgwIbpFdY76GE8e+?=
 =?iso-8859-1?Q?s6dvnXl9jTMutvY5W9nAyA701ip7oOXD2V041JpoJn7Dwu2eFPz66VD2m7?=
 =?iso-8859-1?Q?Z8dzv53+IQ+6f11Dm1s4cfAp41ujIUl8p4TQvageFn37h+Fp/Jhpts62Oz?=
 =?iso-8859-1?Q?Q/mLOx4/RXBvxOjCc2w3hdwlaekC6Vx5S0+Wop0NAvGIaXhO42jsBQcJCE?=
 =?iso-8859-1?Q?F2L9eiATGJUq+zXfGnmBOq4rHhi6QbB6QbZOHjIk7VWi9TEGrxW+vSscCT?=
 =?iso-8859-1?Q?rqtuelqUtm8B+NCA6B7rI4FwN1csiC/CLjM2QEeFxU6+9A7F6+zZmoJ+wb?=
 =?iso-8859-1?Q?YBG/qs+VCQ5qcDX/WXA7eTNWzu0V2j7fva/cYh71F7jboOY9pcxU12khVo?=
 =?iso-8859-1?Q?QiLdfddB7mfMxB3bgEV3bN8rSsuddCkYwXE9gIdEP6PDb/9YKyfTcXr1Di?=
 =?iso-8859-1?Q?75pRhiak8CrrvJjnKb9T83XD5rW1h2xjYBFDC/2cIOYWYd4O+E3PYXTSY8?=
 =?iso-8859-1?Q?hLMWylwsGM9yysEz1+fT5DiNnXjV0vvFFz9Yi9/SSvkpOWMfEfnDcdOHhD?=
 =?iso-8859-1?Q?KHcJwzCtwLwznH41E0yzlRbEGswJZtRO2paqD0CxFikHp/UyBbw2+KDWES?=
 =?iso-8859-1?Q?NlT2lALRyZKoq84LqTq9YKW3wcH5Affder1e07l6359qR77mUDT9ihK/Bs?=
 =?iso-8859-1?Q?cTIH9FXb5XwabqBOyawlxxI6nm7A+FvtWQ3HBTltclBlR3uQFWQ8cQqUDM?=
 =?iso-8859-1?Q?3NXSWAz+ZWlOAECVzJt8WAljaW3pm7bg7q5vt48RpLRPSD0kLMDXPQCpGf?=
 =?iso-8859-1?Q?Tzj8dGum4j38jFz/JiwVHhy2T2me800egZNonCZk20I4lXspOpGyB1/uPT?=
 =?iso-8859-1?Q?RLq4UbLI7JCgKgb5IC3qT2fMQM1/U2BozSi6la62DDvs2AFgIMuhFBz0eU?=
 =?iso-8859-1?Q?A9Cp5/hjuC6N6s1K2V+SI6dNfatFZww+V+r2VT2ozn2xu+d9IyJPS3bOuz?=
 =?iso-8859-1?Q?ni7LLhlw1xHdFbUoLUwUwUSo8OqrDk/TAPYr7/W9drplD9l4yPQRqSIPR0?=
 =?iso-8859-1?Q?TP6Iae3Z291a5cF5hvUHQmTWsx6cv0MDU7PRBCkfLT0RkJhZoC668uxYR+?=
 =?iso-8859-1?Q?348FRjJWDGx+585Lq7lL4Gb9GXyckpfKMQ/2jxoptnUMV00JZDqBKVW5kj?=
 =?iso-8859-1?Q?1yQhxG7MIEPyk3XxMQz7P7lurha8i+1YrQe7+KvXP8VDF6aTqRB9A0zAnz?=
 =?iso-8859-1?Q?FMPjMVJbW1LIiH16RTHbZuDTmlv53zr9MshQqQ8Cxks1Z0PFQYvbTN+LuR?=
 =?iso-8859-1?Q?CR8xZo7kehA0+t2NI07RukTDtzFR+auPNGXyW40pHv+1AqxLjO6KPbZmOY?=
 =?iso-8859-1?Q?MEQknb6K/1+rTLV1stGEY/tCyTD9OjtDlYnvuUcUsh7Q5hu6PyunquL6ao?=
 =?iso-8859-1?Q?9mkmQg7ZHC+Hi3KYIQbiHpUHK/kj3ccN5BbrW0U/R7HzuOCAYs8uV2NMsA?=
 =?iso-8859-1?Q?sNOLKW1xmepwjyrwnaFoWbVdKbBGffVPxb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52f70f9-f2ad-4d9b-f332-08ddace3fb94
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:42:13.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAiKnQLuuJUxsIlIARvoFMNdfuuGzCkOmMxtmFKyiFexJhNMZ/yQbSJ8TdHpMG/77HL3RN7qb6N+hvscP1BdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Fri, Jun 06, 2025 at 11:27:06PM +0530, Badal Nilawar wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited
> access from user space (as admin) to some very specific PCODE
> Mailboxes only related to hardware configuration.
> 
> PCODE is a Firmware in Intel GPUs which is the main responsible
> component for power and thermal aspects of the Intel GPUs.
> 
> Each different Intel GPU came with different PCODE versions with
> different mailboxes and different needs. In the lack of an unified
> interface, the per platform sysfs entries at the device level is
> trending to grow, to allow admins to control different aspects of
> the Hardware.
> 
> In this first experiment, xe_pcode_fwctl only adds support for the
> Battlemage late-binding firmware information.
> 
> Late-binding is the name given to 2 other new auxiliary firmware
> blobs that for now lives in the Flash like PCODE, but that soon
> it is coming to linux-firmware.git: Fan-controller and
> Voltage-regulator. Then, PCODE provides some mailboxes where the
> status of both late-binding firmware can be queried as specified
> in the documentation that is added along with the new uAPI here.
> 
> RFC IMPORTANT NOTE:
> 
> ===================
> Admins will need to query this information. This code here aims
> to be used by Level0-Sysman and/or Intel XPU Manager directly
> from user space. But following the drm upstream rules, the
> userspace code will need to be ready before we can consider
> getting this patch merged!
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>   - Resolve review comments (Jason Gunthorpe)

I'm afraid it didn't resolve all of the comments as this code is still under drm
and not moved under fwctl.

Sima, Dave, what's your take on this? Should we move this to under fwctl
or should we step back for fwctl for now and only go with a couple extra sysfs
for this case?

Thanks,
Rodrigo.

>   - Use explicit padding in structure fwctl_rpc_xe_pcode (Jason Gunthorpe)
>   - Add xe_pcode_fwctl.rst
> ---
>  Documentation/userspace-api/fwctl/index.rst   |   1 +
>  .../userspace-api/fwctl/xe_pcode_fwctl.rst    |  17 ++
>  drivers/gpu/drm/xe/Kconfig                    |   1 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_pci.c                   |   5 +
>  drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 212 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 ++
>  include/uapi/fwctl/fwctl.h                    |   1 +
>  include/uapi/fwctl/xe_pcode.h                 |  82 +++++++
>  9 files changed, 333 insertions(+)
>  create mode 100644 Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
>  create mode 100644 include/uapi/fwctl/xe_pcode.h
> 
> diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
> index 316ac456ad3b..186f8cf17583 100644
> --- a/Documentation/userspace-api/fwctl/index.rst
> +++ b/Documentation/userspace-api/fwctl/index.rst
> @@ -12,3 +12,4 @@ to securely construct and execute RPCs inside device firmware.
>     fwctl
>     fwctl-cxl
>     pds_fwctl
> +   xe_pcode_fwctl
> diff --git a/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
> new file mode 100644
> index 000000000000..c16d0675a485
> --- /dev/null
> +++ b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==================
> +fwctl drm/xe pcode
> +==================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_pcode_fwctl.c
> +   :doc: XE PCODE FWCTL
> +
> +uAPI
> +====
> +
> +.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
> +   :internal:
> +
> +.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
> +   :doc: Late Binding Commands
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 98b46c534278..27a06d7359c7 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -45,6 +45,7 @@ config DRM_XE
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
> +	select FWCTL
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 134eee21c75e..eecf5b1680a6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -86,6 +86,7 @@ xe-y += xe_bb.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> +	xe_pcode_fwctl.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
>  	xe_pt.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ac4beaed58ff..d0c428adb4c2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -27,6 +27,7 @@
>  #include "xe_module.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
> +#include "xe_pcode_fwctl.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> @@ -875,6 +876,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		goto err_driver_cleanup;
>  
> +	err = xe_pcode_fwctl_init(xe);
> +	if (err)
> +		goto err_driver_cleanup;
> +
>  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>  		str_yes_no(xe->d3cold.capable));
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> new file mode 100644
> index 000000000000..849bf3fa4d30
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_pcode_fwctl.h"
> +
> +#include <linux/fwctl.h>
> +#include <uapi/fwctl/xe_pcode.h>
> +
> +#include "xe_device.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: XE PCODE FWCTL
> + *
> + * Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited access
> + * from user space (as admin) to some very specific PCODE Mailboxes.
> + *
> + * User space first needs to issue the ```FWCTL_INFO``` ioctl and check for the
> + * capability flag, which will indicate which group of Mailboxes commands are
> + * supported on that current running firmware.
> + *
> + * After verifying the availability of the desired Mailbox command,
> + * ```FWCTL_RPC``` needs to be issued with in and out parameter both using
> + * pointers to a ```struct fwctl_rpc_xe_pcode``` allocated by userspace.
> + * In and out length needs to be sizeof(struct fwctl_rpc_xe_pcode).
> + *
> + * Any command that is not listed in the include/uapi/fwctl/xe_pcode.h or not
> + * supported by the running firmware, will return ERR_PTR(-EBADMSG).
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + *  struct fwctl_info_xe_pcode xe_pcode_info;
> + *
> + *  struct fwctl_info info = {
> + *           .size = sizeof(struct fwctl_info),
> + *           .flags = 0,
> + *           .out_device_type = 0,
> + *           .device_data_len = sizeof(struct fwctl_info_xe_pcode),
> + *           .out_device_data = (__aligned_u64) &xe_pcode_info,
> + *   };
> + *
> + *   fd = open("/dev/fwctl/fwctl0", O_RDWR);
> + *   if (fd < 0) {
> + *       perror("Failed to open /dev/fwctl/fwctl0");
> + *       return -1;
> + *   }
> + *
> + *   if (ioctl(fd, FWCTL_INFO, &info)) {
> + *           perror("ioctl(FWCTL_INFO) failed");
> + *           close(fd);
> + *           return -1;
> + *   }
> + *
> + *   if (xe_pcode_info.uctx_caps & FWCTL_XE_PCODE_LATEBINDING) {
> + *           struct fwctl_rpc_xe_pcode rpc_in = {
> + *                   .command = PCODE_CMD_LATE_BINDING,
> + *                   .param1 = PARAM1_GET_CAPABILITY_STATUS,
> + *           };
> + *
> + *           struct fwctl_rpc_xe_pcode rpc_out = {0};
> + *
> + *           struct fwctl_rpc rpc = {
> + *                   .size = sizeof(struct fwctl_rpc),
> + *                   .scope = FWCTL_RPC_CONFIGURATION,
> + *                   .in_len = sizeof(struct fwctl_rpc_xe_pcode),
> + *                   .out_len = sizeof(struct fwctl_rpc_xe_pcode),
> + *                   .in = (__aligned_u64) &rpc_in,
> + *                   .out = (__aligned_u64) &rpc_out,
> + *           };
> + *
> + *           if (ioctl(fd, FWCTL_RPC, &rpc)) {
> + *                   perror("ioctl(FWCTL_RPC) failed");
> + *                   close(fd);
> + *                   return -1;
> + *           }
> + *
> + */
> +
> +struct xe_pcode_fwctl_dev {
> +	struct fwctl_device fwctl;
> +	struct xe_device *xe;
> +};
> +
> +DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
> +
> +static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
> +{
> +	return 0;
> +}
> +
> +static void xe_pcode_fwctl_uctx_close(struct fwctl_uctx *uctx)
> +{
> +}
> +
> +static void *xe_pcode_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_device *xe = fwctl_dev->xe;
> +	struct fwctl_info_xe_pcode *info;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		info->uctx_caps = FWCTL_XE_PCODE_LATEBINDING;
> +
> +	*length = sizeof(*info);
> +
> +	return info;
> +}
> +
> +static bool xe_pcode_fwctl_rpc_validate(struct fwctl_rpc_xe_pcode *rpc,
> +					enum fwctl_rpc_scope scope)
> +{
> +	u32 mbox = PCODE_MBOX(rpc->command, rpc->param1, rpc->param2);
> +
> +	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
> +			       PARAM1_GET_CAPABILITY_STATUS, 0))
> +		return scope == FWCTL_RPC_CONFIGURATION;
> +
> +	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
> +			       PARAM1_GET_VERSION_LOW, 0))
> +		return (rpc->data0 == DATA0_TYPE_FAN_CONTROLLER ||
> +			rpc->data0 == DATA0_TYPE_VOLTAGE_REGULATOR) &&
> +			scope == FWCTL_RPC_CONFIGURATION;
> +
> +	return false;
> +}
> +
> +static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
> +				enum fwctl_rpc_scope scope,
> +				void *in, size_t in_len, size_t *out_len)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
> +	struct fwctl_rpc_xe_pcode *rpc = in;
> +	int err;
> +
> +	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
> +	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
> +		return ERR_PTR(-EPERM);
> +
> +	xe_pm_runtime_get(fwctl_dev->xe);
> +
> +	err = xe_pcode_read(root_tile, PCODE_MBOX(rpc->command,
> +						  rpc->param1,
> +						  rpc->param2),
> +			    &rpc->data0,
> +			    &rpc->data1);
> +
> +	xe_pm_runtime_put(fwctl_dev->xe);
> +
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return rpc;
> +}
> +
> +static const struct fwctl_ops xe_pcode_fwctl_ops = {
> +	.device_type = FWCTL_DEVICE_TYPE_XE_PCODE,
> +	.uctx_size = sizeof(struct fwctl_uctx),
> +	.open_uctx = xe_pcode_fwctl_uctx_open,
> +	.close_uctx = xe_pcode_fwctl_uctx_close,
> +	.info = xe_pcode_fwctl_info,
> +	.fw_rpc = xe_pcode_fwctl_rpc,
> +};
> +
> +static void xe_pcode_fwctl_fini(void *dev)
> +{
> +	struct fwctl_device *fwctl = dev;
> +
> +	fwctl_unregister(fwctl);
> +	fwctl_put(fwctl);
> +}
> +
> +int xe_pcode_fwctl_init(struct xe_device *xe)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev __free(xe_pcode_fwctl) =
> +		fwctl_alloc_device(xe->drm.dev, &xe_pcode_fwctl_ops,
> +				   struct xe_pcode_fwctl_dev, fwctl);
> +	int err;
> +
> +	/* For now xe_pcode_fwctl supports only Late-Binding commands on BMG */
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return -ENODEV;
> +
> +	if (!fwctl_dev)
> +		return -ENOMEM;
> +
> +	fwctl_dev->xe = xe;
> +
> +	err = fwctl_register(&fwctl_dev->fwctl);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_pcode_fwctl_fini,
> +					&fwctl_dev->fwctl);
> +}
> +
> +MODULE_IMPORT_NS("FWCTL");
> diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.h b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
> new file mode 100644
> index 000000000000..67386d7bf2ea
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PCODE_FWCTL_H_
> +#define _XE_PCODE_FWCTL_H_
> +
> +struct xe_device;
> +
> +int xe_pcode_fwctl_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
> index 716ac0eee42d..9e7e84aef791 100644
> --- a/include/uapi/fwctl/fwctl.h
> +++ b/include/uapi/fwctl/fwctl.h
> @@ -45,6 +45,7 @@ enum fwctl_device_type {
>  	FWCTL_DEVICE_TYPE_MLX5 = 1,
>  	FWCTL_DEVICE_TYPE_CXL = 2,
>  	FWCTL_DEVICE_TYPE_PDS = 4,
> +	FWCTL_DEVICE_TYPE_XE_PCODE = 5,
>  };
>  
>  /**
> diff --git a/include/uapi/fwctl/xe_pcode.h b/include/uapi/fwctl/xe_pcode.h
> new file mode 100644
> index 000000000000..87544e99faa1
> --- /dev/null
> +++ b/include/uapi/fwctl/xe_pcode.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _UAPI_FWCTL_XE_PCODE_H_
> +#define _UAPI_FWCTL_XE_PCODE_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct fwctl_info_xe_pcode - FWCTL Information struct for Xe PCODE
> + *
> + * @uctx_caps:  bitmap of available capabilities:
> + *  - %FWCTL_XE_PCODE_LATEBINDING - Command to configure Late Bind FW such as
> + * Fan Controller and Voltage Regulator
> + * @rsvd: Reserved for future usage or flags
> + */
> +struct fwctl_info_xe_pcode {
> +	__u32 uctx_caps;
> +	__u32 rsvd[3];
> +};
> +
> +#define FWCTL_XE_PCODE_LATEBINDING	(1 << 0)
> +
> +/**
> + * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
> + */
> +struct fwctl_rpc_xe_pcode {
> +	/** @command: The main Mailbox command */
> +	__u8 command;
> +	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
> +	__u8 pad[3];
> +	/** @param1: A subcommand or a parameter of the main command */
> +	__u16 param1;
> +	/** @param2: A parameter of a subcommand or a subsubcommand */
> +	__u16 param2;
> +	/** @data0: The first 32 bits of data. In general data-in as param */
> +	__u32 data0;
> +	/** @data1: The other 32 bits of data. In general data-out */
> +	__u32 data1;
> +	/** @rsvd: Reserved for future use */
> +	__u32 rsvd[2];
> +};
> +
> +/**
> + * DOC: Late Binding Commands
> + *
> + * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
> + * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
> + *
> + * Command	0x5C - LATE_BINDING
> + * Param1	0x0 - GET_CAPABILITY_STATUS
> + * Param2	0
> + * Data in	None
> + * Data out:
> + *
> + *  - Bit0: Late binding for V1 Fan Tables is supported.
> + *  - Bit3: Late binding for VR parameters.
> + *  - Bit16: Late binding done for V1 Fan tables
> + *  - Bit17: Late binding done for power co-efficients.
> + *  - Bit18: Late binding done for V2 Fan tables
> + *  - Bit19: Late binding done for VR Parameters
> + *
> + * Command	0x5C - LATE_BINDING
> + * Param1	0x1 - GET_VERSION_LOW
> + * Param2	0
> + * Data in - conveys the Type of the Late Binding Configuration:
> + *
> + *  - FAN_CONTROLLER = 1
> + *  - VOLTAGE_REGULATOR = 2
> + *
> + * Data out - Lower 32 bits of Version Number for Late Binding configuration
> + *            that has been applied successfully.
> + */
> +#define PCODE_CMD_LATE_BINDING		0x5C
> +#define  PARAM1_GET_CAPABILITY_STATUS	0x0
> +#define  PARAM1_GET_VERSION_LOW		0x1
> +#define   DATA0_TYPE_FAN_CONTROLLER	1
> +#define   DATA0_TYPE_VOLTAGE_REGULATOR	2
> +
> +#endif /* _UAPI_FWCTL_XE_PCODE_H_ */
> -- 
> 2.34.1
> 
