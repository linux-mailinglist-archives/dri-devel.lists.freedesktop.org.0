Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409CD061FC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 21:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417CC10E7C9;
	Thu,  8 Jan 2026 20:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOAR2Zvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D662110E223;
 Thu,  8 Jan 2026 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767904772; x=1799440772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BMcKny+7ninkaXBk52mJVgD1TkOwRpwHRzd5iz/ao8s=;
 b=VOAR2Zvku+oEpywWoiqgFYsK4d12Ug6EEQbrglC179kkVohMQvAJPo2/
 rw4Rcovz3LzSuYDOFFh3XJk85CUzyezTOueUXXahKoWgIglQhqYb8Ljwx
 6MvCCVIpw4kA7KjMZf01Kybaf5uXAvS0ScvDJIJhPW2rlz5sAocsiBeBx
 EnNSiQnUO74RyjGzN+Y+tmQX0tMUPlEuJlJXf497E3IrNtMJkG7MlKNwN
 FlH6EnUGA0WvvCXCaEbHjzb1fZHABsE3PvaFF++2eHqqGoNg8dY+gcJNG
 8yluxJAoDINToIlIZm2IeQD0EMOBh8nFKqR2H+VryL+37VDMBXHjrey0a w==;
X-CSE-ConnectionGUID: UXSRwqOqTPunhAKRp+HnGQ==
X-CSE-MsgGUID: wli0sN/VRzGOxNLlCRekPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73139446"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73139446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:39:32 -0800
X-CSE-ConnectionGUID: Qe/GRhAuRk2+6jYRqSHVZA==
X-CSE-MsgGUID: T3EOA9jsSmS8hXwb91f3yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="207831792"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:39:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:39:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 12:39:31 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:39:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVJdq+cseOH81PGsLBE0lXlJNpwPYrnzl7qkCadyr5aIPHg7Zs1QLpABUvG+6UdypQs3FP0hPSyUXVUeQvHrkOsWutI3HqlCmH7CtzUtoUFdFgY2P/o7PJMrGVs3PgOjrclm9rS7L6mt93CdXmvyx+kH9Jxb0lGXErlysiLUtAIE6QPR5sA9gM3uLBcO85Y/tTEzjtSRg6DYU6TBnxs5uUG+6KKDrDLoyyHKxv8tyj4lbIf+B2nvKdO3wYjHXPCH6G60e8xrAvrBP9YOg4LLY7joFbo1XuELmv7MIIqD8FzQHaUxL4uTtS0FeQ7pPnlX80wsDMcr6kxgVQqBmoDAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq3j8WKZ2eZyb9fsmompZA8rckj1mgXoi0X+KvogJvI=;
 b=d7Sfb5QLHgEgjeqdFqBLB2TTKdbTgGIjIYt+CYAsn4Pc/zd/Uc4mHh46twSxSSI0EXrZcIOlBaFw0rZm8WDIC6FYHdn2ttKm3lUUIZ7sUZnvS5pmIg+INz9ha+dXjDocFesG1wDKp3NdUFCYnh3QpYjUO2wf/lvjmEUQCqt6Z+8xPf4vtfEhd4UybPxGY5FPQ4OReszLHGy9fRxWXaoHrrnF2LvAdMXjQDjJQcD5FQ5E2HmYVgoKEwB8cXFNizTD+viMrZGMhD1ZCv2jyFibDpNbV16gSLly5vsdiQtf3h09rSNflRdo0Roh+iWDcGI86o9Xx2EutEtUcvPsCKUv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:39:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 20:39:23 +0000
Date: Thu, 8 Jan 2026 15:39:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <irenic.rajneesh@gmail.com>,
 <ilpo.jarvinen@linux.intel.com>, <srinivas.pandruvada@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <xi.pardee@linux.intel.comn>, <hansg@kernel.org>,
 <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 2/4] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <aWAV9noO7dH9V6yp@intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-3-david.e.box@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107002153.63830-3-david.e.box@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8e7247-48f4-4b31-c233-08de4ef60180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?azDlgvBsFR4rUSdEyT8Od3o7Gog8H+C9xiH6PCwYW0DCG5SIPZ1wKMaZjfcp?=
 =?us-ascii?Q?7sRADwacSwOkr/xm5gOCNIhdLV/CeUXHWQonFtyBJTFpczetp1Dd6zknc5Io?=
 =?us-ascii?Q?4KK0oDooEyshjO1N3apKsKEawbAPZjNuWLFr3mrTxq7o8seefPvz98AMrwhu?=
 =?us-ascii?Q?fMdkfviNpjcDrCKDmNUa9XWf7q1MX/7F9mj9/2lXDJ2+FHrvr7CxZOpiDQqy?=
 =?us-ascii?Q?JlWCJpjSeXbdrQ/Bx9K4VE2TNKgtlc7y10RrvaX1Dq5DCwRaCAHG2C10s/3I?=
 =?us-ascii?Q?FZ5Sxco6aC2IUurB03UFDkELjh77bUlp1AUxJ1PPRXTYMpOQbzT0McCNmeim?=
 =?us-ascii?Q?bat569bEQoGxP+WaHFfi718REmFAhL09MwkVrKpOHaFWQADiXIucmCZ/lHdJ?=
 =?us-ascii?Q?hBHHKSKr52i+jm0r3zFoc+GNzVzTN33tYVCxkBvQePHKG/L6ZF+GuHua6KBq?=
 =?us-ascii?Q?dnQ7RImm7CFpGUXIVtphv1cijVDUNvSL+Bq87PyBUmVIV8MUqw0doSci9xLQ?=
 =?us-ascii?Q?X28zK20oK+XeAhqrkt8RJDJWiFn87E2xAkYc4mUcFMcYw3Y1SyTuAIqWBzfj?=
 =?us-ascii?Q?JWj1bhopKMeNwLICGYMC58IwTYEvYdu+dRO/wv5vqAyWl1khwwlDgoTcOBBu?=
 =?us-ascii?Q?oK/XDYSDe19EklpBLASh2V9YpGHdTadRe+8Z6/0TEMivj96pFmWiQu4vIwK0?=
 =?us-ascii?Q?cTSpyFgjPK+vcT+IIOc520r8xeJzkTHnFfrMLrcVMq/+Gn1n9HUQcpGZIoIs?=
 =?us-ascii?Q?HjeO7dJUMQa/DO3Qag2V34docFf0qhsNy0G3s3aGdybI70rCCioku2Uh+Vhn?=
 =?us-ascii?Q?mEX53eDQRlT+wTn42/K1EHUZJl35fxXVUIgrrj9gWv/K2ANOuaEyDj50Gfbj?=
 =?us-ascii?Q?nkM4MolE8sPgUooM+/ftC2H3ipDhomOkvjG6dqaiJlEJzunvgAkEx+ziUaN6?=
 =?us-ascii?Q?i9TLyrQHwznC0QMioMsWWXa3nanKwFhdO7yfDcDEqPH2+fV4vz69wzhRBKSE?=
 =?us-ascii?Q?9zDWxh064FRAf4ZNCTzru72HxR191JCDWiCuZ0GkhgjGpkl1fIEhDJgxvY+0?=
 =?us-ascii?Q?LlSHQ6+XAC5gxjzoqigOhB69NhJWoD8JBeuz7jEaeWixc8i6ah52PEfCOWhW?=
 =?us-ascii?Q?cQAxErIP9TsJl5pTlfCK0rdLd5FXKOqh6VV5o6MVRf+f092SJ9BZfy3fezwd?=
 =?us-ascii?Q?8LJRE/ISnMyR4EKb6iwDNDXWhB0NTKQ8+wI4DkKonJTwOB0YiPHDdzrx7i3w?=
 =?us-ascii?Q?HRd7vbeM0vPbN7LE3Ry9ZtClOubxcr56r739BEMEHvZNQDIddvdxY0exoVwY?=
 =?us-ascii?Q?gJqRsqxO392xK44UI1G8ZSZOEzVYE4K4BEy1eF7f3VsmXmlhLK2Dlo1eyl7d?=
 =?us-ascii?Q?oRjd4lQSy2i2DPUe3deO8HOMMIcz1hf4wB1or0KuMH/8yQdNqNZ01yzBmKhe?=
 =?us-ascii?Q?uId31AqdA2p+NsrrAu7LKPy6o5F7JoM2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uE4/JyTH/+CXSbn7Z5RcNRYgd6fBp9CP65GdbMGgHDKrEowdEa6NDT/+D/ys?=
 =?us-ascii?Q?shvvb/Jq4daeycP/+Qok+fo0Xygw0V0GcRerH5paxliYuZt5fBdyWsALuQHX?=
 =?us-ascii?Q?aGwd6YyqD4UIB1vLSAR/uZIX0WDLV170Jbz6KPxQvVxbSdcnA3l8ECOES8ID?=
 =?us-ascii?Q?/boZyGz1uJ2RcR6lS3qnA76coeRJZGmDrtyN+RrkSmGMxsVaIK2wL5uQzrJW?=
 =?us-ascii?Q?4SZEOd08vutc0biTrEL24UDHQ/nEP9FKUUhxCci7XZpC0WrNHdURKZo9blBN?=
 =?us-ascii?Q?AmAtWUzVPN5R94Ml4U/VErSG8LakcF4C/Qch2aaOI4adtXQXNeWxgeX906MA?=
 =?us-ascii?Q?KwMiUrcEDY0XWyy5nyZnkYyEkZGJJ63XCXG+PWeryjuVZzo87vVHUqgqADdW?=
 =?us-ascii?Q?2RHQSb1S9ZJ7+P/KkJJ1RAf01A/jj6IemHzdr9VRFlGKIu5b8/v4hyDIbuB3?=
 =?us-ascii?Q?CiMBisgF5sbUFW2pAaomH4AX0r5K/iM8ru12tVea09esx6xVtBlVWX3akOmb?=
 =?us-ascii?Q?0Xh+JeX8fq0UVU8Nd4VUj18n13pITOixSlJUIHzkODFN4so6+WnzHT6bagd+?=
 =?us-ascii?Q?CurxSz82lFXrODlQM6vjEaNMoXEK7MqtmLFIezpxtViiYrptSUyK48xsLIRU?=
 =?us-ascii?Q?hAK+9LbH8HaDWe6+BfQveQfwenXzxjpNMFA8m2C6qbomtnK3FLBlmEYbb6yh?=
 =?us-ascii?Q?JB9HfxGPreRhEMESu1X+0Zq9LcjrSymEYMTwEzuXDWQQxP1xIrc+37eVMCVq?=
 =?us-ascii?Q?7WdaBeVz7L9J0twEwrRdqxpHTo1fszgZ8IW58L34sNShVniEJxM8g0Yv4/wt?=
 =?us-ascii?Q?E7KJOeZoDWklktWQ2HeqUs0Yh9iEGGeIBFJsql+n5fjQPS3WjN9yh2+eiwFm?=
 =?us-ascii?Q?qqNELnMUcP3e8oofRfhXdxnD8QcFgDd/qSqT3xD+bRN+34YYJcFzpWeHNYe4?=
 =?us-ascii?Q?qP+loHO7iPvwNezKp0tdS58/zjFoq+6bzv2XNtHPmK7LswwQoeKVVWzlQgmS?=
 =?us-ascii?Q?XAnTlA7AiglhOyz2vckX6WyuFUAWeicPY4s86fvz6+4VV4Uvy+c0SsSV90Ce?=
 =?us-ascii?Q?l2vo+GdjEPhT/FPDwTata6IpIhrKDO7YvlNph2IhKU48wn7aeVTLmn8iQuLJ?=
 =?us-ascii?Q?NJwPTBCw/rXvd8iYcPoetJoGDncm/C+GtvWp0kEZcs51QbE/ymYaLSBBIEY7?=
 =?us-ascii?Q?aQ8MO0pIsB0EYye4F3KbUR9kqdWCRlEBb61HjSFSYExFjpXoOXnGdEOKTmM1?=
 =?us-ascii?Q?AqyObnJ/EmJ7KBbN4yEDBk4SY3DY+jGiVAgg/gCFwPQRafTwzgqiZg6tg54h?=
 =?us-ascii?Q?hoeR1rUx+dtTfsS/I/vBi/qkLNXelBhHZfshAbikJKUjrvJeCHiUJNDCJzGn?=
 =?us-ascii?Q?z5mnz+aeBT1Q4CU1jmUGoErT3ILIaP6iHrkLCid5N8H0+3IfWaIFmj4/hSrl?=
 =?us-ascii?Q?BqCXhJHMccPLo0WvZ7S9vK27gcr4mDXpr9XMfAIwKpXPN+AlvRCsIhwM4e67?=
 =?us-ascii?Q?DuWAaiwHkJv3cB+dVhAvHkvNjKO4pteuvp8Ioszt0g2VsfstUrccR1R1b/ad?=
 =?us-ascii?Q?97OHXA4m0JNQMMgrlVadsGnX0bFBBrOBiXszjeh/aQVaksLtWdKnL+UzEKVc?=
 =?us-ascii?Q?igiE8LoNMiO4cXy6WYCA3IJdVmuqwsK7mh9yNQ4T1f58JmCkA4Iq/j8BLppU?=
 =?us-ascii?Q?Nfb2cwmu0oxzIY4QLUu7Y8/Kr531+QxY/b1mQk7hVGvq+mf271OUbIrCk7lb?=
 =?us-ascii?Q?CnmjCn6VBA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8e7247-48f4-4b31-c233-08de4ef60180
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:39:23.0945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9Bw6d5OwgSXoQkGRsIcI85MncxZWCeimX/n9O8QpKzDDJaoXDHA4esDns54GOYDCt3fMfhaKWoih4jDESW34A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
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

On Tue, Jan 06, 2026 at 04:21:49PM -0800, David E. Box wrote:
> Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
> PMT/VSEC interfaces and structs carried struct pci_dev * even though
> callers only need a generic struct device. Move those to struct device * so
> the same APIs work for PCI and ACPI parents.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
>  drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_vsec.c                  |  7 +-
>  drivers/gpu/drm/xe/xe_vsec.h                  |  2 +-


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

feel free to take these xe changes through any branch

>  drivers/platform/x86/intel/pmc/core.c         |  4 +-
>  .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
>  drivers/platform/x86/intel/pmt/class.c        |  8 +-
>  drivers/platform/x86/intel/pmt/class.h        |  4 +-
>  drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
>  drivers/platform/x86/intel/pmt/telemetry.c    | 13 ++--
>  drivers/platform/x86/intel/pmt/telemetry.h    | 11 ++-
>  drivers/platform/x86/intel/sdsi.c             |  5 +-
>  drivers/platform/x86/intel/vsec.c             | 74 +++++++++++--------
>  drivers/platform/x86/intel/vsec_tpmi.c        |  6 +-
>  include/linux/intel_vsec.h                    | 18 ++---
>  15 files changed, 86 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e91da9589c5f..d07b2aad300f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -45,7 +45,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>  	u64 residency = 0;
>  	int ret;
>  
> -	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +	ret = xe_pmt_telem_read(xe->drm.dev,
>  				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>  				&residency, offset, sizeof(residency));
>  	if (ret != sizeof(residency)) {
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 97879daeefc1..556072a0ac10 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -464,7 +464,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>  		u64 pmt_val;
>  
> -		ret = xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
> +		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
>  					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>  					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>  		if (ret != sizeof(pmt_val)) {
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8f23a27871b6..997fe0c8858e 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -141,10 +141,10 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> -int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
> +int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_device *xe = kdev_to_xe_device(dev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>  	u32 mem_region;
>  	u32 offset;
> @@ -197,7 +197,6 @@ void xe_vsec_init(struct xe_device *xe)
>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev = xe->drm.dev;
> -	struct pci_dev *pdev = to_pci_dev(dev);
>  	enum xe_vsec platform;
>  
>  	platform = get_platform_info(xe);
> @@ -220,6 +219,6 @@ void xe_vsec_init(struct xe_device *xe)
>  	 * Register a VSEC. Cleanup is handled using device managed
>  	 * resources.
>  	 */
> -	intel_vsec_register(pdev, info);
> +	intel_vsec_register(dev, info);
>  }
>  MODULE_IMPORT_NS("INTEL_VSEC");
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index dabfb4e02d70..74ac575cd68c 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -10,6 +10,6 @@ struct pci_dev;
>  struct xe_device;
>  
>  void xe_vsec_init(struct xe_device *xe);
> -int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count);
> +int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>  
>  #endif
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 7d7ae8a40b0e..4abe5e1f574d 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1288,7 +1288,7 @@ static struct telem_endpoint *pmc_core_register_endpoint(struct pci_dev *pcidev,
>  	unsigned int i;
>  
>  	for (i = 0; guids[i]; i++) {
> -		ep = pmt_telem_find_and_register_endpoint(pcidev, guids[i], 0);
> +		ep = pmt_telem_find_and_register_endpoint(&pcidev->dev, guids[i], 0);
>  		if (!IS_ERR(ep))
>  			return ep;
>  	}
> @@ -1573,7 +1573,7 @@ static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, struct pmc_dev_info *
>  		if (!pmc->map->lpm_req_guid)
>  			return -ENXIO;
>  
> -		ep = pmt_telem_find_and_register_endpoint(pcidev, pmc->map->lpm_req_guid, 0);
> +		ep = pmt_telem_find_and_register_endpoint(&pcidev->dev, pmc->map->lpm_req_guid, 0);
>  		if (IS_ERR(ep)) {
>  			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
>  			return -EPROBE_DEFER;
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index 03fad9331fc0..6f6e83e70fc5 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -60,7 +60,7 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem
>  	info.base_addr = ssram_base;
>  	info.parent = &pcidev->dev;
>  
> -	return intel_vsec_register(pcidev, &info);
> +	return intel_vsec_register(&pcidev->dev, &info);
>  }
>  
>  static inline u64 get_base(void __iomem *addr, u32 offset)
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 7c3023d5d91d..8077274726b5 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -60,11 +60,11 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
>  	return count;
>  }
>  
> -int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> +int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
>  			void __iomem *addr, loff_t off, u32 count)
>  {
>  	if (cb && cb->read_telem)
> -		return cb->read_telem(pdev, guid, buf, off, count);
> +		return cb->read_telem(dev, guid, buf, off, count);
>  
>  	addr += off;
>  
> @@ -99,7 +99,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	count = pmt_telem_read_mmio(entry->pcidev, entry->cb, entry->header.guid, buf,
> +	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
>  				    entry->base, off, count);
>  
>  	return count;
> @@ -208,7 +208,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  				    struct intel_vsec_device *ivdev,
>  				    struct resource *disc_res)
>  {
> -	struct pci_dev *pci_dev = ivdev->pcidev;
> +	struct pci_dev *pci_dev = to_pci_dev(ivdev->dev);
>  	struct device *dev = &ivdev->auxdev.dev;
>  	struct intel_pmt_header *header = &entry->header;
>  	u8 bir;
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 3c5ad5f52bca..3eb8ab97dd87 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -23,7 +23,7 @@ struct pci_dev;
>  extern struct class intel_pmt_class;
>  
>  struct telem_endpoint {
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct telem_header	header;
>  	struct pmt_callbacks	*cb;
>  	void __iomem		*base;
> @@ -65,7 +65,7 @@ struct intel_pmt_namespace {
>  				struct intel_pmt_entry *entry);
>  };
>  
> -int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> +int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
>  			void __iomem *addr, loff_t off, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index 32713a194a55..66f1ae931e05 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -540,7 +540,7 @@ static int pmt_features_probe(struct auxiliary_device *auxdev, const struct auxi
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->parent = &ivdev->pcidev->dev;
> +	priv->parent = ivdev->dev;
>  	auxiliary_set_drvdata(auxdev, priv);
>  
>  	priv->dev = device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), priv,
> @@ -607,7 +607,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
>  
>  	mutex_lock(&feature_list_lock);
>  	list_for_each_entry(feature, &pmt_feature_list, list) {
> -		if (feature->priv->parent != &entry->ep->pcidev->dev)
> +		if (feature->priv->parent != entry->ep->dev)
>  			continue;
>  
>  		pmt_get_features(entry, feature);
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index a4dfca6cac19..e11f7bde41b2 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -112,7 +112,7 @@ static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
>  		return -ENOMEM;
>  
>  	ep = entry->ep;
> -	ep->pcidev = ivdev->pcidev;
> +	ep->dev = ivdev->dev;
>  	ep->header.access_type = entry->header.access_type;
>  	ep->header.guid = entry->header.guid;
>  	ep->header.base_offset = entry->header.base_offset;
> @@ -204,7 +204,7 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
>  		goto unlock;
>  	}
>  
> -	info->pdev = entry->ep->pcidev;
> +	info->dev = entry->ep->dev;
>  	info->header = entry->ep->header;
>  
>  unlock:
> @@ -218,9 +218,10 @@ static int pmt_copy_region(struct telemetry_region *region,
>  			   struct intel_pmt_entry *entry)
>  {
>  
> +	struct pci_dev *pdev = to_pci_dev(entry->ep->dev);
>  	struct oobmsm_plat_info *plat_info;
>  
> -	plat_info = intel_vsec_get_mapping(entry->ep->pcidev);
> +	plat_info = intel_vsec_get_mapping(pdev);
>  	if (IS_ERR(plat_info))
>  		return PTR_ERR(plat_info);
>  
> @@ -308,7 +309,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
>  	if (offset + NUM_BYTES_QWORD(count) > size)
>  		return -EINVAL;
>  
> -	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, offset,
> +	pmt_telem_read_mmio(ep->dev, ep->cb, ep->header.guid, data, ep->base, offset,
>  			    NUM_BYTES_QWORD(count));
>  
>  	return ep->present ? 0 : -EPIPE;
> @@ -335,7 +336,7 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
>  EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
>  
>  struct telem_endpoint *
> -pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
> +pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos)
>  {
>  	int devid = 0;
>  	int inst = 0;
> @@ -348,7 +349,7 @@ pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
>  		if (err)
>  			return ERR_PTR(err);
>  
> -		if (ep_info.header.guid == guid && ep_info.pdev == pcidev) {
> +		if (ep_info.header.guid == guid && ep_info.dev == dev) {
>  			if (inst == pos)
>  				return pmt_telem_register_endpoint(devid);
>  			++inst;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.h b/drivers/platform/x86/intel/pmt/telemetry.h
> index d45af5512b4e..a4fa2178adef 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.h
> +++ b/drivers/platform/x86/intel/pmt/telemetry.h
> @@ -7,7 +7,6 @@
>  #define PMT_TELEM_CRASHLOG	1
>  
>  struct telem_endpoint;
> -struct pci_dev;
>  
>  struct telem_header {
>  	u8	access_type;
> @@ -17,7 +16,7 @@ struct telem_header {
>  };
>  
>  struct telem_endpoint_info {
> -	struct pci_dev		*pdev;
> +	struct device		*dev;
>  	struct telem_header	header;
>  };
>  
> @@ -71,8 +70,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
>  
>  /**
>   * pmt_telem_find_and_register_endpoint() - Get a telemetry endpoint from
> - * pci_dev device, guid and pos
> - * @pdev:   PCI device inside the Intel vsec
> + * device, guid and pos
> + * @dev:    device inside the Intel vsec
>   * @guid:   GUID of the telemetry space
>   * @pos:    Instance of the guid
>   *
> @@ -80,8 +79,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
>   * * endpoint    - On success returns pointer to the telemetry endpoint
>   * * -ENXIO      - telemetry endpoint not found
>   */
> -struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev,
> -				u32 guid, u16 pos);
> +struct telem_endpoint *
> +pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos);
>  
>  /**
>   * pmt_telem_read() - Read qwords from counter sram using sample id
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index da75f53d0bcc..d7e37d4ace23 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -599,13 +599,14 @@ static int sdsi_get_layout(struct sdsi_priv *priv, struct disc_table *table)
>  	return 0;
>  }
>  
> -static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct pci_dev *parent,
> +static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct device *dev,
>  				   struct disc_table *disc_table, struct resource *disc_res)
>  {
>  	u32 access_type = FIELD_GET(DT_ACCESS_TYPE, disc_table->access_info);
>  	u32 size = FIELD_GET(DT_SIZE, disc_table->access_info);
>  	u32 tbir = FIELD_GET(DT_TBIR, disc_table->offset);
>  	u32 offset = DT_OFFSET(disc_table->offset);
> +	struct pci_dev *parent = to_pci_dev(dev);
>  	struct resource res = {};
>  
>  	/* Starting location of SDSi MMIO region based on access type */
> @@ -681,7 +682,7 @@ static int sdsi_probe(struct auxiliary_device *auxdev, const struct auxiliary_de
>  		return ret;
>  
>  	/* Map the SDSi mailbox registers */
> -	ret = sdsi_map_mbox_registers(priv, intel_cap_dev->pcidev, &disc_table, disc_res);
> +	ret = sdsi_map_mbox_registers(priv, intel_cap_dev->dev, &disc_table, disc_res);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 130577061a51..b84bb92624ef 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -274,7 +274,7 @@ int intel_vsec_add_aux(struct device *parent,
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
>  
> -static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
> +static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *header,
>  			      struct intel_vsec_platform_info *info,
>  			      unsigned long cap_id)
>  {
> @@ -283,24 +283,24 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	struct resource *tmp;
>  	struct device *parent;
>  	unsigned long quirks = info->quirks;
> -	u64 base_addr;
> +	u64 base_addr = info->base_addr;
>  	int i;
>  
>  	if (info->parent)
>  		parent = info->parent;
>  	else
> -		parent = &pdev->dev;
> +		parent = dev;
>  
>  	if (!intel_vsec_supported(header->id, info->caps))
>  		return -EINVAL;
>  
>  	if (!header->num_entries) {
> -		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->id);
> +		dev_dbg(dev, "Invalid 0 entry count for header id %d\n", header->id);
>  		return -EINVAL;
>  	}
>  
>  	if (!header->entry_size) {
> -		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->id);
> +		dev_dbg(dev, "Invalid 0 entry size for header id %d\n", header->id);
>  		return -EINVAL;
>  	}
>  
> @@ -315,11 +315,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
>  		header->offset >>= TABLE_OFFSET_SHIFT;
>  
> -	if (info->base_addr)
> -		base_addr = info->base_addr;
> -	else
> -		base_addr = pdev->resource[header->tbir].start;
> -
>  	/*
>  	 * The DVSEC/VSEC contains the starting offset and count for a block of
>  	 * discovery tables. Create a resource array of these tables to the
> @@ -337,7 +332,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  		release_mem_region(tmp->start, resource_size(tmp));
>  	}
>  
> -	intel_vsec_dev->pcidev = pdev;
> +	intel_vsec_dev->dev = dev;
>  	intel_vsec_dev->resource = no_free_ptr(res);
>  	intel_vsec_dev->num_resources = header->num_entries;
>  	intel_vsec_dev->quirks = info->quirks;
> @@ -415,12 +410,13 @@ static int get_cap_id(u32 header_id, unsigned long *cap_id)
>  	return 0;
>  }
>  
> -static int intel_vsec_register_device(struct pci_dev *pdev,
> +static int intel_vsec_register_device(struct device *dev,
>  				      struct intel_vsec_header *header,
>  				      struct intel_vsec_platform_info *info)
>  {
>  	const struct vsec_feature_dependency *consumer_deps;
>  	struct vsec_priv *priv;
> +	struct pci_dev *pdev;
>  	unsigned long cap_id;
>  	int ret;
>  
> @@ -432,8 +428,12 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  	 * Only track dependencies for devices probed by the VSEC driver.
>  	 * For others using the exported APIs, add the device directly.
>  	 */
> +	if (!dev_is_pci(dev))
> +		return intel_vsec_add_dev(dev, header, info, cap_id);
> +
> +	pdev = to_pci_dev(dev);
>  	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> -		return intel_vsec_add_dev(pdev, header, info, cap_id);
> +		return intel_vsec_add_dev(dev, header, info, cap_id);
>  
>  	priv = pci_get_drvdata(pdev);
>  	if (priv->state[cap_id] == STATE_REGISTERED ||
> @@ -449,7 +449,7 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  
>  	consumer_deps = get_consumer_dependencies(priv, cap_id);
>  	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
> -		ret = intel_vsec_add_dev(pdev, header, info, cap_id);
> +		ret = intel_vsec_add_dev(dev, header, info, cap_id);
>  		if (ret)
>  			priv->state[cap_id] = STATE_SKIP;
>  		else
> @@ -461,7 +461,7 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  	return -EAGAIN;
>  }
>  
> -static bool intel_vsec_walk_header(struct pci_dev *pdev,
> +static bool intel_vsec_walk_header(struct device *dev,
>  				   struct intel_vsec_platform_info *info)
>  {
>  	struct intel_vsec_header **header = info->headers;
> @@ -469,7 +469,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
>  	int ret;
>  
>  	for ( ; *header; header++) {
> -		ret = intel_vsec_register_device(pdev, *header, info);
> +		ret = intel_vsec_register_device(dev, *header, info);
>  		if (!ret)
>  			have_devices = true;
>  	}
> @@ -517,7 +517,9 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
>  		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
>  		header.id = PCI_DVSEC_HEADER2_ID(hdr);
>  
> -		ret = intel_vsec_register_device(pdev, &header, info);
> +		info->base_addr = pdev->resource[header.tbir].start;
> +
> +		ret = intel_vsec_register_device(&pdev->dev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -562,7 +564,9 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
>  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
>  
> -		ret = intel_vsec_register_device(pdev, &header, info);
> +		info->base_addr = pdev->resource[header.tbir].start;
> +
> +		ret = intel_vsec_register_device(&pdev->dev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -572,13 +576,13 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  	return have_devices;
>  }
>  
> -int intel_vsec_register(struct pci_dev *pdev,
> -			 struct intel_vsec_platform_info *info)
> +int intel_vsec_register(struct device *dev,
> +			struct intel_vsec_platform_info *info)
>  {
> -	if (!pdev || !info || !info->headers)
> +	if (!dev || !info || !info->headers)
>  		return -EINVAL;
>  
> -	if (!intel_vsec_walk_header(pdev, info))
> +	if (!intel_vsec_walk_header(dev, info))
>  		return -ENODEV;
>  	else
>  		return 0;
> @@ -604,7 +608,7 @@ static bool intel_vsec_get_features(struct pci_dev *pdev,
>  		found = true;
>  
>  	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> -	    intel_vsec_walk_header(pdev, info))
> +	    intel_vsec_walk_header(&pdev->dev, info))
>  		found = true;
>  
>  	return found;
> @@ -630,7 +634,7 @@ static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
>  
>  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
> -	struct intel_vsec_platform_info *info;
> +	struct intel_vsec_platform_info info, *info_temp;
>  	struct vsec_priv *priv;
>  	int num_caps, ret;
>  	int run_once = 0;
> @@ -641,22 +645,25 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  		return ret;
>  
>  	pci_save_state(pdev);
> -	info = (struct intel_vsec_platform_info *)id->driver_data;
> -	if (!info)
> +	info_temp = (struct intel_vsec_platform_info *)id->driver_data;
> +	if (!info_temp)
>  		return -EINVAL;
>  
> +	/* XXX: Needs better fix */
> +	info = *info_temp;
> +
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->info = info;
> +	priv->info = &info;
>  	pci_set_drvdata(pdev, priv);
>  
> -	num_caps = hweight_long(info->caps);
> +	num_caps = hweight_long(info.caps);
>  	while (num_caps--) {
> -		found_any |= intel_vsec_get_features(pdev, info);
> +		found_any |= intel_vsec_get_features(pdev, &info);
>  
> -		if (priv->found_caps == info->caps)
> +		if (priv->found_caps == info.caps)
>  			break;
>  
>  		if (!run_once) {
> @@ -676,7 +683,10 @@ int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
>  {
>  	struct vsec_priv *priv;
>  
> -	priv = pci_get_drvdata(vsec_dev->pcidev);
> +	if (!dev_is_pci(vsec_dev->dev))
> +		return -ENODEV;
> +
> +	priv = pci_get_drvdata(to_pci_dev(vsec_dev->dev));
>  	if (!priv)
>  		return -EINVAL;
>  
> @@ -822,7 +832,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
>  
>  	xa_for_each(&auxdev_array, index, intel_vsec_dev) {
>  		/* check if pdev doesn't match */
> -		if (pdev != intel_vsec_dev->pcidev)
> +		if (&pdev->dev != intel_vsec_dev->dev)
>  			continue;
>  		devm_release_action(&pdev->dev, intel_vsec_remove_aux,
>  				    &intel_vsec_dev->auxdev);
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
> index 2ccde86c529f..254273392639 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -530,7 +530,7 @@ static const struct file_operations mem_write_ops = {
>  	.release        = single_release,
>  };
>  
> -#define tpmi_to_dev(info)	(&info->vsec_dev->pcidev->dev)
> +#define tpmi_to_dev(info)	((info)->vsec_dev->dev)
>  
>  static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
>  {
> @@ -642,7 +642,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  		tmp->flags = IORESOURCE_MEM;
>  	}
>  
> -	feature_vsec_dev->pcidev = vsec_dev->pcidev;
> +	feature_vsec_dev->dev = vsec_dev->dev;
>  	feature_vsec_dev->resource = res;
>  	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
>  	feature_vsec_dev->priv_data = &tpmi_info->plat_info;
> @@ -742,7 +742,7 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_feature *pfs, u64 start, i
>  static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
>  {
>  	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
> -	struct pci_dev *pci_dev = vsec_dev->pcidev;
> +	struct pci_dev *pci_dev = to_pci_dev(vsec_dev->dev);
>  	struct intel_tpmi_info *tpmi_info;
>  	u64 pfs_start = 0;
>  	int ret, i;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 28c2f5855a11..931ff42361a9 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -29,8 +29,8 @@
>  #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
>  #define TABLE_OFFSET_SHIFT		3
>  
> -struct pci_dev;
>  struct resource;
> +struct pci_dev;
>  
>  enum intel_vsec_id {
>  	VSEC_ID_TELEMETRY	= 2,
> @@ -82,14 +82,14 @@ enum intel_vsec_quirks {
>   * struct pmt_callbacks - Callback infrastructure for PMT devices
>   * ->read_telem() when specified, called by client driver to access PMT data (instead
>   * of direct copy).
> - * @pdev:  PCI device reference for the callback's use
> + * @dev:   device reference for the callback's use
>   * @guid:  ID of data to acccss
>   * @data:  buffer for the data to be copied
>   * @off:   offset into the requested buffer
>   * @count: size of buffer
>   */
>  struct pmt_callbacks {
> -	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
>  };
>  
>  struct vsec_feature_dependency {
> @@ -122,7 +122,7 @@ struct intel_vsec_platform_info {
>  /**
>   * struct intel_sec_device - Auxbus specific device information
>   * @auxdev:        auxbus device struct for auxbus access
> - * @pcidev:        pci device associated with the device
> + * @dev:           struct device associated with the device
>   * @resource:      any resources shared by the parent
>   * @ida:           id reference
>   * @num_resources: number of resources
> @@ -134,7 +134,7 @@ struct intel_vsec_platform_info {
>   */
>  struct intel_vsec_device {
>  	struct auxiliary_device auxdev;
> -	struct pci_dev *pcidev;
> +	struct device *dev;
>  	struct resource *resource;
>  	struct ida *ida;
>  	int num_resources;
> @@ -198,14 +198,14 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
>  }
>  
>  #if IS_ENABLED(CONFIG_INTEL_VSEC)
> -int intel_vsec_register(struct pci_dev *pdev,
> -			 struct intel_vsec_platform_info *info);
> +int intel_vsec_register(struct device *dev,
> +			struct intel_vsec_platform_info *info);
>  int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
>  			   struct intel_vsec_device *vsec_dev);
>  struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
>  #else
> -static inline int intel_vsec_register(struct pci_dev *pdev,
> -				       struct intel_vsec_platform_info *info)
> +static inline int intel_vsec_register(struct device *dev,
> +				      struct intel_vsec_platform_info *info)
>  {
>  	return -ENODEV;
>  }
> -- 
> 2.43.0
> 
