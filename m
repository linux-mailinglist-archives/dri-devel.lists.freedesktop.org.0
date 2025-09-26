Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B441BA4642
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3C310EA91;
	Fri, 26 Sep 2025 15:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUnC/HAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1C510EA8C;
 Fri, 26 Sep 2025 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758900160; x=1790436160;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sRK+Barllo/zQZr2v7oqWPItAEckkkvPEBOEkGTRxao=;
 b=OUnC/HARIZQdloNyqPiDlHCIbS/PAgRyVEesQ3W/SVqKrQHRM4ZMtsMe
 oDY8w5Rk9EycgzaXf2bKfkEzjcEDZXBxW/WlSU5hkLI5rfRpjile1DTno
 oREOSy75bBNcmAS8jXjP0CzpspWQzspcv0O0/+VjjXa4LMJJ79j1BevED
 0Wuu49NlUGcmoYLfrOYeyVJpkktkqI9k1K+Dui5w9k7mPNStkQ3wqc63z
 VINLS3/BPSYJ6HjYrtuEWiBT9NlWoJoW3i3E5+peJ/av2d7h/dx6DHztw
 Q+A0P8vKYNSViPHQEDXv7IKnE5673nT2VVY0BR1S/R5ABfckOhElP6/Pn g==;
X-CSE-ConnectionGUID: ysMPXX6sR0a0q/k8iEMTug==
X-CSE-MsgGUID: 1LSURx9tQWqHfNqUGy4dAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61153997"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61153997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:22:40 -0700
X-CSE-ConnectionGUID: j0sogjcTSam+IxLfjBhxwQ==
X-CSE-MsgGUID: tAlNT8SKT1+tRLrwm7p4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177689967"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:22:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:22:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:22:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi7/CUxDFhHa4GzlqKGAQrt60McmrcSlU3V3fPvV5nCLIy4wdGwhic+WB9iCM8Iog6Dkyb7xu+QwbJ93bNDRqdAJ2MKxnv/QJ3xox+mTQIYSpypf4Wb/mAXn6gBWX+SDUaI42GXZay0s2vN5SMC592FOFC29WHmuCk/YmWhQC4Xspamg43hv7IfDVF72uneAwqXWG7SRlD67URCvZYZcSegPpKwCN2lNeaPSZfKnJf5HgrpWRPc/tLH/9zdZ+MPtu6RCIT+bVRFdP0xr+XNUMVDyvIw3JthmJI25p1MBOJXO5n778dXTKW/zfe6MPvoYedXT29N52MjF6hWtdbnibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3wlW3iR+bkt+1+72uSHBU9Jk1GGs1CGISai0UZjjM0=;
 b=BH85NUhmwlnp3n3xPZiodFLx54ue1D5llnvx2MjH1Zi142nHHbzj8T2QFNHNDz2h80LxnefXSaFlCjxLNsRXKWI2laK+Z2J6ZvJvq3K7hnBbmgHTLzpCSMy+TU6SK8I88IDCJTxkqKw6J29BqyqnyazfjC8souYm7h8ELlQtAO0mZo2V8j4QDKylNKecZx+BauNumpvRrtRrMaokxwz2Y+KkUub7alOs1aR1XUwxCTku2h0WcQD2krxRbIt3US74oFw9VMx1a4piMl8izGsVBRgStxK97DRbkVZMwKYj9/xGow2m46nb/mfhvAk4q10OE76tZmr1B3ZNB5oyvIVpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 15:22:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:22:36 +0000
Date: Fri, 26 Sep 2025 10:22:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/{i915,xe}: driver agnostic drm to display pointer
 chase
Message-ID: <hc7bxiipjuejnl4rvppynwybqht2exgbtjrm6howstq3sbailj@6kjknuwggn7v>
References: <20250926111032.1188876-1-jani.nikula@intel.com>
 <vxxrpnasd5qfoof4coi3rw4pu3pbnau42u3lywc5dd52nma5sx@r5coda25idn4>
 <20562bfd487f43278df768822cc44317f0ca6f79@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20562bfd487f43278df768822cc44317f0ca6f79@intel.com>
X-ClientProxiedBy: BY5PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 66977858-8985-4abb-a90b-08ddfd1085f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ymhMRJfMjQ3DdNMJixhCgZRx5CZEnSZhnd2Rf9SG3ZV1+ub4x9OrDReBCL?=
 =?iso-8859-1?Q?yO3yv1odwJuME0J5ZbqdEpW+ev7q614+nlZ6Z9nWzLfJi5hg2/IDbndhDG?=
 =?iso-8859-1?Q?0TIxuhJzVPwUGhz4ZdG3K9/aa0rmGY1PBxPSxcET8Q1VLf9Z0UTFpPVIGn?=
 =?iso-8859-1?Q?532XuMzT3DvEkfqxAqTRWxG5VxtCMwO/yYJFuurqmfOavH6EutzrxHt/OA?=
 =?iso-8859-1?Q?qcw065MoNYa/JNj9Se9wj6zbndXVCNQYyEIWFBqsnjYAv1xjiBgOlvgHLP?=
 =?iso-8859-1?Q?rhWPSpxgX2k1y79yl7s2Aj3n5n2edbYs5RVT/h3lwNPRNQ4pPIfQsahgth?=
 =?iso-8859-1?Q?Hc0xbbvx13bGyVhzg8bY5JnU8gFfVJAronV1aeSbjKRiaG0T5MU04mpxsF?=
 =?iso-8859-1?Q?5CNju29DwfM3JVp5Y0gPr0sRWp+J6XqC194qQOcUqfuL24XRNdXf76ZJMV?=
 =?iso-8859-1?Q?p/VS3T6LLHiRk4hm26wqtXQrMWSQPPzB6TtFoHM40z6/k84ucRaHNKXyOK?=
 =?iso-8859-1?Q?zJ3QzNz92gAqSK79o6bdL5p/9JSaHa9Jm/I+UNF5cCORI/aUXMyt5Gehls?=
 =?iso-8859-1?Q?zDLrrULt0tB1YYjctZWANZNSegSTRb5+rp/e7EOdkdwqvfE9NtycAyxwcT?=
 =?iso-8859-1?Q?dMYWkOkz6omndViiUbIDRgBiZXl0Anm4c2hUjYvq1XlwwEYO3n6QMkPbgA?=
 =?iso-8859-1?Q?Bph268keTVXOk7+z9TkB5OGUbrpEGHaAjcvHQ5oP1UTrG7YmkLe+kNTZGG?=
 =?iso-8859-1?Q?wBAF16MGPPWwaO/aUCh0W6e9XSbQjjp8kMInYqhUS6BSasqZgpAwBXzm5r?=
 =?iso-8859-1?Q?MPqILWvSVwbjem8qSfiv+52ajzcUMEGxks9Oq8/CF9INkeNrMxkb8tf7mL?=
 =?iso-8859-1?Q?vD1DiO9ugn+DwtG0CLCk2CFTOJbmo+iPonivG908zFP1XUDeAZwQKoTxiu?=
 =?iso-8859-1?Q?LihdJoLTr0WR3mdFMzuKIbFd9qTyKrk63lUlzJRliyieKH6cSnQkuDQ+0a?=
 =?iso-8859-1?Q?Piob3qrpAMbLutHjzZiLg0GDPOEpMG+Ku5l4TyP0AXsICt68Y0vvPXddZF?=
 =?iso-8859-1?Q?8DtMYztPsm8BS33xwXzy9A085Tf4JPJCYFMcNvvCBwgI8fOP7w41eTT8pR?=
 =?iso-8859-1?Q?rw02OnKbK0mFQXfWtoRfPga/ceVWlsD1mmuHorUgQ0LuWiBMktMZCEYVrR?=
 =?iso-8859-1?Q?/qgKcNuWofQ18n4GNbCwaysHryPeNu8U5o0FGCX6zlABxgB53LNFc0rWwS?=
 =?iso-8859-1?Q?Sqnr5Bb9dOHcYwWNPfWpnZKUfRzUkcTBBLP4xyPAYKKPH9DevMsULsAyVM?=
 =?iso-8859-1?Q?/C296zmO4e9sjeJvoI1plHlPBBEHluC/e78NaPv6rynnM684boWPZmPcqw?=
 =?iso-8859-1?Q?VrUGvGNt1RRbLRnoB9aewXrDX7laP1SOzdf64rfAwHLBpmNibToLJX1+xF?=
 =?iso-8859-1?Q?9T5XoOruqXVJPNl1liCMLwf1izkxAWxYkX/ZUzv0t+DNuTa4JtIxhqCBKb?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tTbN5EOL7hmAVVvZi9pO8jj1UnzTON1SxsgkhmwptHFwEBhmI5GxGKUc/x?=
 =?iso-8859-1?Q?SMRjt3PeJDxchw8RmFucL23uzXxe/FG953eX8FRDI3raTMP4PI5zyZODr/?=
 =?iso-8859-1?Q?th/qK5TkyOqAM6y253//qOLKT7ZAi2J013C7YyO2Au52I2ryYhqN2iFoNV?=
 =?iso-8859-1?Q?NWZjlknKrsIY27Kicy4KN2YYAD+aWugIwENr3ZtBSaGzAToRrdzk0+5LS0?=
 =?iso-8859-1?Q?pflXU8WiCf5L8GtNcqjMJY/8/+GERGP/SnED6RK6oewhOang/6OExLaDqv?=
 =?iso-8859-1?Q?uDXnXu8lHqUnhg4nVW6ulusRN0+zutgJb35G62YPG/DWOQY4a+oSushLJw?=
 =?iso-8859-1?Q?0iG4hSqGpazHGtmnCXKzEgZqKaY+oRznnqXFCRAvsFe0B5C0j3eDFH026g?=
 =?iso-8859-1?Q?kAQ0d331YyCbnNAka2YL8aO263DDSbqFAMdw1EEzieXiR3C73QoL3qeJsY?=
 =?iso-8859-1?Q?KlSJeQSZD8bZW8POsiEJhRQU9yvyZdgoqL+Sq74//zZes8eIAE936KovQr?=
 =?iso-8859-1?Q?GmaBrjkT1W+mS7khElr9d2u8kHLcqUGjQ6aMNDJhgl9VqFVLGEyMmix+Pi?=
 =?iso-8859-1?Q?tt9DNFRMDib7S1C0D3xPo/2JMHPOG+8Rq2LH6/Pp01AyD6T51dcT5glHWV?=
 =?iso-8859-1?Q?JbhJSD0BfL73OiuaS+GsGSXSsYuvZHoyV5NM+NigjWUWsIVz8rJOECgIDh?=
 =?iso-8859-1?Q?5GOgu3/aukmvCgzLBXMAEPdc7d8keY718+NnBJq5xGJ8ZvMubSAZxFCLb8?=
 =?iso-8859-1?Q?goAno2KU2K46LzOsEk+9ggv7r4pPbPJoxD4GychpNQkAqfCSWPn/AXYEQi?=
 =?iso-8859-1?Q?36V8NSrDkTE/DKZRjsR79fwTmxOfjK2UXLY4MeeOCfZs+Lz6D5KZfkE4Ew?=
 =?iso-8859-1?Q?2NorrG76P1cEHMSBHdCIgYHNseeU1HVYuyZz3g+iv6BfSDnKdMNcYVLLNI?=
 =?iso-8859-1?Q?EMTw+pq1CpSImjDNgaYP2L3CeMzvqdz6wfHu1XeHjVHdk7kpTtE4onLM6y?=
 =?iso-8859-1?Q?ZWFwRu+z5rrY0SNr01zk7NDhx79I8abD/ibwgz3woY3OTuNtHXiXSjz7iQ?=
 =?iso-8859-1?Q?d5buHOI4JZ04iOMbhBt063XDcXsatdT5+MuPWmWbWzp+wt+a/ad6pe9cnP?=
 =?iso-8859-1?Q?2s/J8t/mFPM/YebRZHkr5PUFIOPfy1/fOKrrEe/fm9+XAJ67qyJpJytKYG?=
 =?iso-8859-1?Q?a7qxPD/FF2A14tiCtmEMCHUb7A5LIUF+R2lzRu1I/BwRNcOQcIvJb9zwtZ?=
 =?iso-8859-1?Q?a1+9f8c/FrA+QKrDeoSFNAGRFLQQblhyKVeLZmlulPEkcAKewV/Qnxg8QH?=
 =?iso-8859-1?Q?Q83cokZsHZRFjNDAO9wkkCmHzQlNnkb1jP8hK2hKpsyk91n8nzNBoyu8Ay?=
 =?iso-8859-1?Q?5rTD+G2KWeHZWWkk4Jkn7rggtgBxm88A46x9zWzdMMNWKFHz1Rj7DMWU91?=
 =?iso-8859-1?Q?Q+Wr3xqh/uUMpPcbbjt0OaM/5tn0q946jWtJe1BIFXKjOXtSG1d9W65cii?=
 =?iso-8859-1?Q?U10/lSFenit5xWjvbSG4653FGsU9giBvPX02/Dd5K3tzcCt+XD8Ain5aCs?=
 =?iso-8859-1?Q?Yh2qPr42WHc9LH72SrEtdAE3AChN13A43DxPkUEmETzGAicCWP5LhkOhLt?=
 =?iso-8859-1?Q?UKr3jP92MJMICLy41Tt1HCAcmIwNgK2xaqLI/F4BHFIGSijFFR73DLJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66977858-8985-4abb-a90b-08ddfd1085f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:22:36.6917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+TyoiReFNc3kujMDNfZRPYD/MGDVM/cWEO8jgJQsWqMzFZEt5tH6Zho51pRryMZbL3Grc4RJ2nymZ0sGdm6PMK37RuPlp3Wap11erRmdAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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

On Fri, Sep 26, 2025 at 06:11:41PM +0300, Jani Nikula wrote:
>On Fri, 26 Sep 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Sep 26, 2025 at 02:10:32PM +0300, Jani Nikula wrote:
>>>diff --git a/drivers/gpu/drm/i915/display/intel_display_conversion.c b/drivers/gpu/drm/i915/display/intel_display_conversion.c
>>>index d56065f22655..9a47aa38cf82 100644
>>>--- a/drivers/gpu/drm/i915/display/intel_display_conversion.c
>>>+++ b/drivers/gpu/drm/i915/display/intel_display_conversion.c
>>>@@ -1,15 +1,21 @@
>>> // SPDX-License-Identifier: MIT
>>> /* Copyright © 2024 Intel Corporation */
>>>
>>>-#include "i915_drv.h"
>>>-#include "intel_display_conversion.h"
>>>+#include <drm/intel/display_member.h>
>>>
>>>-static struct intel_display *__i915_to_display(struct drm_i915_private *i915)
>>>-{
>>>-	return i915->display;
>>>-}
>>>+#include "intel_display_conversion.h"
>>>
>>> struct intel_display *__drm_to_display(struct drm_device *drm)
>>
>> it seems like this could be inline in drm/intel/display_member.h
>>
>> Although it doesn't seem we have many calls to convert from drm to
>> intel_display, so lgtm as is.
>
>We actually do, lots and lots, via to_intel_display().
>
>I thought about inlining, but decided to leave that for follow-up.

I actually went to check that before commenting... with some false
positives:

$ git grep "to_intel_display(.*drm"
drivers/gpu/drm/i915/display/intel_ddi.c:       struct intel_display *display = to_intel_display(aux->drm_dev);
drivers/gpu/drm/i915/display/intel_display.c:   struct intel_display *display = to_intel_display(drm);
drivers/gpu/drm/i915/display/intel_display_debugfs.c:static struct intel_display *node_to_intel_display(struct drm_info_node *node)
drivers/gpu/drm/i915/display/intel_dp_link_training.c:  drm_dbg_kms(to_intel_display(_intel_dp)->drm, \
drivers/gpu/drm/i915/display/intel_dp_link_training.c:          drm_err(to_intel_display(_intel_dp)->drm, \
drivers/gpu/drm/i915/display/vlv_clock.c:       struct intel_display *display = to_intel_display(drm);
drivers/gpu/drm/i915/display/vlv_clock.c:       struct intel_display *display = to_intel_display(drm);
drivers/gpu/drm/i915/display/vlv_sideband.c:    struct intel_display *display = to_intel_display(drm);
drivers/gpu/drm/i915/display/vlv_sideband.c:    struct intel_display *display = to_intel_display(drm);

I missed the fact that all the other type conversions also use 
the drm -> display. So yes, inlining that would be good.

Lucas De Marchi

>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Thanks,
>Jani.
>
>
>
>-- 
>Jani Nikula, Intel
