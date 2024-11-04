Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C60B9BBFF1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E739110E4CF;
	Mon,  4 Nov 2024 21:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWRgZ5J3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276710E0BB;
 Mon,  4 Nov 2024 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755373; x=1762291373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YjdruoRWgeKOgk6wxl/fTX8r8q/B3qaB8424+UWeNwQ=;
 b=aWRgZ5J3hKgILuzivYZMWzWl30lb7pAUDHSMsUk8hfASXxGPvQ8BQOqg
 ExhOASRdsuiQctBvOO4Fq+OZx09mcAvnY0cT1rwzgc+QGoQafafmtNjbe
 6klNLc9dp9NYwNOwsEnDuzvIFfxtlSjYo/R65WPACmQKli3LTScMQnVmr
 NyDVHebUitv07GkwxWP7T3cwi1tnUAv8t+xQRRcWLPi85uTmo3afhmRha
 SVVD1evTQyKd780ASLMQ0nCHUbhPuGosJMJsyA5OnLr9nuLW4eypLW55D
 c9SjTjjwifAagN38+njbBOMoluj+9Wnf7YiwD48tlzaXvRAXwVNnJtmKs w==;
X-CSE-ConnectionGUID: zDd9FyBNSC+YQwTn1OTXlQ==
X-CSE-MsgGUID: ysN+hL81SyWOe9f2+OJmbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34406595"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="34406595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:22:52 -0800
X-CSE-ConnectionGUID: ERZ6TPEkQVePeJP9uMSFhA==
X-CSE-MsgGUID: 2VonrTrWR4uNl9aGAB5HYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83894316"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:22:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:22:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:22:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:22:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmOBZ20IKJJIMgBC1P+KqPTt7YSYNMWdj4qXP+dWHE42ZXInYXhZxX5EMXZoCkCoW5mktM2KYFz6tYA6KfmO3yy0flw7SHJ1+ag8E7aJ17sbNKu1R4x/CxMq7U0MCCcbu/r7VQptElnuS+8YVgLML/MmInGz38Lx+QQXkqotJgSWgNhiMOWKV8pza5HNrIRB3B7iFX9xmAG8fTn8dy7K1b7kRkceg9G3W8Wi1a8blYC0ABMkLHgBdHWR0Cwzx9E600N2qklrJrwsLwC3crw7ZCzEOwvbT3MS0clfPrG0+Ng4ScE47MOAPJgPCs7A3leNBYbXSrL8mLPyBCJyyZ5Ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV0K9hVtmUle9pIMY1bvdYIVVYI7WQDvM/6AD56ngOg=;
 b=XohyaQTmcCK099ul7BIeYUePduKuEZ1yH7Z27pHeCEazP0frGctjfMkFxG1ZzzGWLkTLBYwfP80Q+gEf5RP83C7hbeGIsIdILDBStY+UCf8EbPZf2qk3ZlijeJllWnAPJGU56Wv4HXfT3ewNca9Fxt45iMlgf71D98XQqcIOP+HBrwXB3nnWMQRKFKxREiSq1jO5BnrXQifeWsrx7XmJ6inVpvWGIHRk0R8M+kCuokG3ybMOX/snq5yIgWUtwycAkoS/alnoAoDT+bl4l+k9wcmGjt0wnTxgMxuxtwjgkXIiVOeszIbi5Za9pOeQz054zjv2bIuOerAlumDClUDKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:22:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 21:22:45 +0000
Date: Mon, 4 Nov 2024 16:22:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Tomas
 Winkler" <tomasw@gmail.com>
Subject: Re: [PATCH 01/10] mtd: add driver for intel graphics non-volatile
 memory device
Message-ID: <Zyk7IDetpm5elTT7@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-2-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241022104119.3149051-2-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb1b82d-f646-4beb-82eb-08dcfd16d33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cIecZzq9zJYgCZlIC8tWwa8QUoowlzQtqnzNAm/U80kJ/WmKEZzm2LQb3l+3?=
 =?us-ascii?Q?r6MLeUZb6ZYPmA52Hd3x5sA3vQ+sVmVnrQezFW5V0HnpxDH7yD2f1/mRLHLz?=
 =?us-ascii?Q?Gh16eGBvXcoHWVzYolXmx35DyVMmBIQDlPpm4U2bdk+DkrosuDubUseCWCyb?=
 =?us-ascii?Q?3iDX/JBMPrhXpS/CLNCzzHSmAhcOustjAP+4dVUkAhbl7PmUBbZDsIutEmzS?=
 =?us-ascii?Q?sYw5qMwf43ZjxP38SCyZFveLz200Z2b1/I2tR51zShAvCmhz8v4/GAHktUl+?=
 =?us-ascii?Q?PdmjHTQRcM3LCB0/rs/kd9yeBa3xjcwp0GkidaBmTv2NLMVgHt0ATryY79e8?=
 =?us-ascii?Q?iha1vCq7RopWo4FWygvAmoG1CbFrQ8YYwtBVJ/gO8kSWdS1ITUVpSXCfV1K7?=
 =?us-ascii?Q?eQHHOGX/hd6XneTb0sM6RdMsyNFt6xYGDG9D0L1AGIhg7uJpi1kVO7VBUn8T?=
 =?us-ascii?Q?/v9aOwvpxrLkCxEwPGVJXo/PqlcRm+JkWUVMRuNTEU48MIQWRUcUCB9iAuXI?=
 =?us-ascii?Q?+zdJ2Wb/Ir4s1OhghDka6RMabJlRz/++w0PrlKsQXB/+5LM08xkKolPxRY49?=
 =?us-ascii?Q?kkFNXw65lL8o1ITnCe+KEqHV1VRpHWrBFY4Dw35brYYlJS594asfogpaoFo0?=
 =?us-ascii?Q?Mzd9wXY+Jagx+UtrVdwshYTKhX8Ww+jmLi8XW2wnjNe5UTGu7nP2+lE8vViG?=
 =?us-ascii?Q?HYI+/jGp71Q098G1C+0PK3bAwHSfY9XouQQXCuObFGBPNpp5Cf8yzqgEczhn?=
 =?us-ascii?Q?a2FTczKPI3lL9y22qM456+/M6KFPCf/4Cdjf6GqHUgQNmqDJpDYoh9qOzsIH?=
 =?us-ascii?Q?WrK22qPDRmzfbW9hfQ/5YyNMkgVeT3iPFVS8kQHvZz2Zj6vLdObU32naY9Wg?=
 =?us-ascii?Q?+D5mppqdB5kbvD0p8HdW1+/BfFy/LTEpFZ5qhDuVclPGaqe5USOk7kOCZejq?=
 =?us-ascii?Q?oLMASr+ZsBsLD5Mxx9QnZeZDNcv2/+8WLsfdh99uglt38SXoT31GeoWNPC8W?=
 =?us-ascii?Q?Ei3ll0bK4Cwi4eVEOd7P8NUcAfiF2grYOk+KUCcVH7hk2UvDi8vOdy8G6jqU?=
 =?us-ascii?Q?FYkoGO6V4Dqa2Rtw+wlikvC5g9OJ4ZiXHsafn70D39KcRIACV0gITsQ/k9Od?=
 =?us-ascii?Q?6MpL9zfwAF5AG/6xIYHmAdUiWKOs7h5YzNqWWgvkeFDWMMyq/7VcEY5JBsqc?=
 =?us-ascii?Q?VKyz1LIlk3CV8XtSwWjnGxSRPOp+QAZyUEHVQuUu01Uj7ZD1S7wEmdKh5vho?=
 =?us-ascii?Q?hG+8c0sOZo1Co62y7b5OQTO71/lG6Kma1LJ3n0lT3sK0L5bdOWtK1xv9ZlKS?=
 =?us-ascii?Q?c1NldiK4Ythu6kcV+aeDljhg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CUBQ6hyt+53jADrBl4cmDrdUlte6RFyfXxOTr6FjD/Xite8ds1XePggqu5Ly?=
 =?us-ascii?Q?lDFMfuSO4Kef3v1PsWHbd7fzhDfNPHyKS2yxfDQdjfkQXDOGKVcdyrA00FG6?=
 =?us-ascii?Q?qB8OgBl0rJqQ/IYFFkYp/3XhFBXu+PyFWBL/eLTs/9LdDHx8i/wT/AvGmSwD?=
 =?us-ascii?Q?i1o1wE+CSGgCOrGo/ac3qLN7QfCWhIRJ3n1U6fb10Y+hyB5QDBz9DLQhsbWF?=
 =?us-ascii?Q?kDiCvnDPN8aqlhcafLBAfFc7lIYSlPFaxO1EPHFCTWPWxKzR8MDek8rlFGs2?=
 =?us-ascii?Q?PzCjuolW4oD8wA+4NHupgfECxp6S0jUf6i6mW8U5M+niPdbLJ5tS8PzZt337?=
 =?us-ascii?Q?aWl+qezy0z/dE43fryakSgLygTDjNN96XCv9pqCDFPfy7o5E8Aiios1vPJos?=
 =?us-ascii?Q?e41VNbiz02tKiFRQNNtgHjowLjvSwzZQN6eacHBD5AHnUOcpvB+l17QPpaJT?=
 =?us-ascii?Q?KxiwbdYvYdEZLceS6ClcEKbjoKlxXgX9i+gwfLWugRn78pJXrxL1B0aeYeYK?=
 =?us-ascii?Q?NiIb8RbChNZbdV1u79OzoIe2QMoE8DVTzdMC8twb0fnc/WGAkj0LiJyLEr3W?=
 =?us-ascii?Q?+5Q8gv2QbF/qE83QMYpPoPbQudY5cqMQLRzv1uFYwTXddhEGNaJnle8Hphaq?=
 =?us-ascii?Q?nHwD24EgEsbkrpZb5vU4Kjqe6dSD7+uJVajY74ufaU4665M2O2EYv9VXthe9?=
 =?us-ascii?Q?cFvhdfepWd5wlx+UOxLzTQPHkJ/aaxSzxLlLGTNurcQK1U480bp79w1BsFKj?=
 =?us-ascii?Q?A5z7XRKFnWLOxt8D7xKK5zqyvoTEO04tKYPMktpRKU+3PJuoPQ6J3gotO56B?=
 =?us-ascii?Q?Aemj3ckd8oVmKcTxhDtMauzjq0BQ59vA1yPDCc40Pu1DAFNdgWRZDOP6Qvvp?=
 =?us-ascii?Q?+RzK8csJvv9i1aP7wXt9GzdWjCKkEMgdd/7o/8W8uYuZTnAh3FikDQo/+qwK?=
 =?us-ascii?Q?l5u9RieW4zbsyEGBAX1xwNpQj3mNS3x3g5/M6ZXLdh1+7nSW1EW7InUm64ks?=
 =?us-ascii?Q?xik42yC+c5/ETDCadbUPth0ds5mMOAS8dLGmxK4ZZz+pY2Z8tmQDxf8yKOPc?=
 =?us-ascii?Q?1KBp9WeHd03Zw3rHac042dBTNu+o9Yqn5kxn71zOtmW/s2JQXlE9CIdNxgGA?=
 =?us-ascii?Q?L4QY5rj2IMQkbuDfOXDE1jZi0O5ermfjzQ2w0MXSvhLJRH+9bj0uxdgQvnR6?=
 =?us-ascii?Q?o6MoTOb6V6fWG64xA6AEvAkdT00vt9O+qtGbJKL7vSeksoruGwzFpn//IdEA?=
 =?us-ascii?Q?HccM06e35F5e0MyB27+laVkhVQmoCiMtv4SloRL+AnsZ3m/t1UurUEqMGiTo?=
 =?us-ascii?Q?Z5Cl4mtZTnHdpNEt+DVR0boc6gzYuaH1VNlWozCU4EouJInA0JnMNid5XT0b?=
 =?us-ascii?Q?jAsyGXWrYeO9AljZcuphdudnXIs1xjeG+yfeE9b0Zc3uklnQzCC15rpC7Ow4?=
 =?us-ascii?Q?3I4toXdvZxex0iLHeLQYvBszYo0WIt0D+1ALoHYxQJktDjq2Zj1Qp9rQgiBb?=
 =?us-ascii?Q?SetsdzePyHKBAf1a4H99slUiwr+m7leez232Y275kWLp6eD5qOleuawTLb9e?=
 =?us-ascii?Q?K6YgMCe33qxyZXp8VVZt9KBGEhXr7v8tKfHjXFl9g4sbOQ/YeHjCH99d7rM4?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb1b82d-f646-4beb-82eb-08dcfd16d33b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:22:45.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEaWY74AaksJhy8vZkNxKJbZRJURBvO4IL7mhcFnFNaD+K2b7sc30lW7NCdpjulDLrWRg3qkKbJ5Nro5mGWAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

On Tue, Oct 22, 2024 at 01:41:10PM +0300, Alexander Usyskin wrote:
> Add auxiliary driver for intel discrete graphics
> non-volatile memory device.
> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  MAINTAINERS                        |   7 ++
>  drivers/mtd/devices/Kconfig        |  11 +++
>  drivers/mtd/devices/Makefile       |   1 +
>  drivers/mtd/devices/mtd-intel-dg.c | 139 +++++++++++++++++++++++++++++
>  include/linux/intel_dg_nvm_aux.h   |  27 ++++++
>  5 files changed, 185 insertions(+)
>  create mode 100644 drivers/mtd/devices/mtd-intel-dg.c
>  create mode 100644 include/linux/intel_dg_nvm_aux.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c27f3190737f..a09c035849ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11360,6 +11360,13 @@ L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  F:	arch/x86/include/asm/intel-family.h
>  
> +INTEL DISCRETE GRAPHIC NVM MTD DRIVER
> +M:	Alexander Usyskin <alexander.usyskin@intel.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Supported
> +F:	drivers/mtd/devices/mtd-intel-dg.c
> +F:	include/linux/intel_dg_nvm_aux.h
> +
>  INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
>  M:	Jani Nikula <jani.nikula@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index ff2f9e55ef28..d93edf45c0bb 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -183,6 +183,17 @@ config MTD_POWERNV_FLASH
>  	  platforms from Linux. This device abstracts away the
>  	  firmware interface for flash access.
>  
> +config MTD_INTEL_DG
> +	tristate "Intel Discrete Graphic non-volatile memory driver"
> +	depends on AUXILIARY_BUS
> +	depends on MTD
> +	help
> +	  This provides MTD device to access Intel Discrete Graphic
> +	  non-volatile memory.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called mtd-intel-dg.
> +
>  comment "Disk-On-Chip Device Drivers"
>  
>  config MTD_DOCG3
> diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
> index d11eb2b8b6f8..77c05d269034 100644
> --- a/drivers/mtd/devices/Makefile
> +++ b/drivers/mtd/devices/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
>  obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
>  obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
>  obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
> +obj-$(CONFIG_MTD_INTEL_DG)	+= mtd-intel-dg.o
>  
>  
>  CFLAGS_docg3.o			+= -I$(src)
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> new file mode 100644
> index 000000000000..746c963ea540
> --- /dev/null
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/intel_dg_nvm_aux.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +struct intel_dg_nvm {
> +	struct kref refcnt;
> +	void __iomem *base;
> +	size_t size;
> +	unsigned int nregions;
> +	struct {
> +		const char *name;
> +		u8 id;
> +		u64 offset;
> +		u64 size;
> +	} regions[];
> +};
> +
> +static void intel_dg_nvm_release(struct kref *kref)
> +{
> +	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
> +	int i;
> +
> +	pr_debug("freeing intel_dg nvm\n");
> +	for (i = 0; i < nvm->nregions; i++)
> +		kfree(nvm->regions[i].name);
> +	kfree(nvm);
> +}
> +
> +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> +			      const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> +	struct device *device;
> +	struct intel_dg_nvm *nvm;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	size_t size;
> +	char *name;
> +	int ret;
> +
> +	device = &aux_dev->dev;
> +
> +	/* count available regions */
> +	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (invm->regions[i].name)
> +			nregions++;
> +	}
> +
> +	if (!nregions) {
> +		dev_err(device, "no regions defined\n");
> +		return -ENODEV;
> +	}
> +
> +	size = sizeof(*nvm) + sizeof(nvm->regions[0]) * nregions;
> +	nvm = kzalloc(size, GFP_KERNEL);
> +	if (!nvm)
> +		return -ENOMEM;
> +
> +	kref_init(&nvm->refcnt);
> +
> +	nvm->nregions = nregions;
> +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> +		if (!invm->regions[i].name)
> +			continue;
> +
> +		name = kasprintf(GFP_KERNEL, "%s.%s",
> +				 dev_name(&aux_dev->dev), invm->regions[i].name);
> +		if (!name)
> +			continue;
> +		nvm->regions[n].name = name;
> +		nvm->regions[n].id = i;
> +		n++;
> +	}
> +
> +	nvm->base = devm_ioremap_resource(device, &invm->bar);
> +	if (IS_ERR(nvm->base)) {
> +		dev_err(device, "mmio not mapped\n");
> +		ret = PTR_ERR(nvm->base);
> +		goto err;
> +	}
> +
> +	dev_set_drvdata(&aux_dev->dev, nvm);
> +
> +	return 0;
> +
> +err:
> +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> +	return ret;
> +}
> +
> +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> +{
> +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> +
> +	if (!nvm)
> +		return;
> +
> +	dev_set_drvdata(&aux_dev->dev, NULL);
> +
> +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> +}
> +
> +static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
> +	{
> +		.name = "i915.nvm",
> +	},
> +	{
> +		.name = "xe.nvm",
> +	},
> +	{
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
> +
> +static struct auxiliary_driver intel_dg_mtd_driver = {
> +	.probe  = intel_dg_mtd_probe,
> +	.remove = intel_dg_mtd_remove,
> +	.driver = {
> +		/* auxiliary_driver_register() sets .name to be the modname */
> +	},
> +	.id_table = intel_dg_mtd_id_table
> +};
> +
> +module_auxiliary_driver(intel_dg_mtd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Intel DGFX MTD driver");
> diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
> new file mode 100644
> index 000000000000..2cc4179fbde2
> --- /dev/null
> +++ b/include/linux/intel_dg_nvm_aux.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_DG_NVM_AUX_H__
> +#define __INTEL_DG_NVM_AUX_H__
> +
> +#include <linux/auxiliary_bus.h>
> +
> +#define INTEL_DG_NVM_REGIONS 13
> +
> +struct intel_dg_nvm_region {
> +	const char *name;
> +};
> +
> +struct intel_dg_nvm_dev {
> +	struct auxiliary_device aux_dev;
> +	bool writeable_override;
> +	struct resource bar;
> +	const struct intel_dg_nvm_region *regions;
> +};
> +
> +#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
> +
> +#endif /* __INTEL_DG_NVM_AUX_H__ */
> -- 
> 2.43.0
> 
