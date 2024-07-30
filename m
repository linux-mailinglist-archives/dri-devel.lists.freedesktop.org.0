Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FF9421EA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 22:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766F410E30B;
	Tue, 30 Jul 2024 20:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQVn6QIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587EB10E307;
 Tue, 30 Jul 2024 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722373132; x=1753909132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tL+qPmNqCu2Og6Lh0mpZ+H609Ihr73lSD8mVP9IBHLQ=;
 b=JQVn6QILd/beS4h5+3av2WZRpsLLuBgrHiHBwtjeghZKvcbqKXV+OkAh
 QeoJgYIDNGVLwrkDwhQGOjDiJsWdyEdmVc/yX2mh1cUgvu9UVckyzP8uU
 IDlzcJkqLvHR+XZvddkkQL4m/r6RSp2ZEqTTsWGrfTD4O+MTmazaAs3Va
 aUZJErTYckMJ5WBU/WFyuOuXqUxt+qTBNF2guZbfEcKZs8MfKtD9+z9MD
 ZdHSw7fr9nzh1pwA/iA+y4Fc5KAGBcnr6C34aHk21aGn/9BeZAm/lIeI/
 R7QnrO6HGm99obSkxxdpF7E8GDRr0zifbrueGcr2McyodD26yrHwYm8vT A==;
X-CSE-ConnectionGUID: Ko6pKBl3StK/FenYh+BXdA==
X-CSE-MsgGUID: EDgzczZ3SsOgtsChWp/XQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30886705"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="30886705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 13:58:52 -0700
X-CSE-ConnectionGUID: FqtM9wNVTk2JV7KLRWSkgg==
X-CSE-MsgGUID: n8Gdv9HwTd6qfxbtjynzvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59266447"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 13:58:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 13:58:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 13:58:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 13:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH4tS23uwVt5A9QzCCu/ipJUndrzp7t450tUIRTHHsoYf+4147qTZYpSHPEUxpQE9nnRE3UyL0N8x+hG5kZB9Ff/hB6XPLE1WSwJhhA9blSHG4gHg3KLSZcBVCwj9gBRq7TQY4gtwlf6dIvgf01pyX5WcT/Oz0aDSnLDf4cTa3yR855SEFNv2HjZykEHsNxyFk+Y7Ysipop6M7YnokF2FP+/CdUEird8tuYZM7SfY7dDW6kPL7UrVvg2CENHxNi115jVv4pmRI9rlwsQh5JivIheCCoEwEomeyuBJVnA7fpTTuvcjc3n+7Kx/OBqwQI4Rs+ocBfOBK9LKhhzGVpkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxpK85M5b2Hs+CbS9X0J9k56CqRdEWpZxoldPRloBX4=;
 b=q8Pm54LLC46tnHeNj0AERCp7YBYG0rKhDY4VRWvOEhAxs0fsDgjp7jYzs8fITSomd31kGUeNLTbISQjD8+oiDmX90iA7EpOvQYBcbKTTLjbM8O52YkFLav/BqDBU0bQrnyXZ7fCXSDzLNAoh26L14a7tx4Vba/S70HmzjOF179MyANgjT+3qB2qqdPE2QwCQI3F9wSpNJjSVi54iCB0zLMAEuYbG6LeSOTYCs8/XJG1ADJKAHpzkVU3gHzwaUWDz3ZL13qOaDJBv97baH8Ucu6ItlOaSGXkrPQ16XDDjvROqoY8JuDIOs5i4CxSeRj8WU/4xgPCssKOv9sEWUUb1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 20:58:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 20:58:44 +0000
Date: Tue, 30 Jul 2024 15:58:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa/uapi: Make bit masks unsigned
Message-ID: <yf6km2ibjmxroipbgos6mhcmmvs6aowhb4e5bcits6ymoks3n3@avfp77afz4gz>
References: <20240729092634.2227611-1-geert+renesas@glider.be>
 <s7tjuildazggjsuza53ixn3ts7t6rw2rwy2et4neijbnkx6ve7@nb4pyxmhhquj>
 <87cymv279p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cymv279p.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:303:b4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3be8ef-39af-4e3c-4ac7-08dcb0da65d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QGeVPgh4R8IbYltJdA109tEH2NC/kQGbt/X6FPHk06rsxDKMtzLx4abxWTgX?=
 =?us-ascii?Q?VUXRoXSqbzZOQEX0Lb//OY6SKZcOg6yq1THDMs7+tZ6XYXNWCsik+UDWOUGx?=
 =?us-ascii?Q?3fbE+/fdoSRkUV1qyH43fyYOXr0gfRKlhXmCHhoqkCmT1ybBjA391dTYcN3e?=
 =?us-ascii?Q?ii+IsaDio76Hz0BnJWWFSIIYFnCtUxGvk4ctTAodPvl/+UwL/KtIwnSWh81v?=
 =?us-ascii?Q?wrg+1bId0JP/VDxt6ForudRPLCNajbueM+BzoXco208BYln92AalPGngBw4E?=
 =?us-ascii?Q?o5My92p9fuJkJrBa/Yup043Z7/KbIJgHtMXvTMkfjraAihnPpIEdGVdtlSBl?=
 =?us-ascii?Q?2qlST+g7YK3esYZxWsoMU+/NK39wBzViH/Er8Fh7tpJSHuAmBhyTKvfRul0N?=
 =?us-ascii?Q?IhOO3pRbOlpUYDDJgPM/ib4kt4htZwrAJ7SHRgteWQUIIIRFaQJKELrPNX12?=
 =?us-ascii?Q?UjFiOjhB5zfbqv1KbUj7SFNhI+iFSzXS9IhjqDyFNRoTja8+Zu06odCDa8GZ?=
 =?us-ascii?Q?/9A5tV421AiWpNK2/cgMJqYgFaqvRTp3K0++7mG/WaTLlkIhdmoKfxeF5gQe?=
 =?us-ascii?Q?zEl8Z6pNZxeKaU4phHKQ4yrs3wEDBl5XSLsZh9E16ILDVh1JrZwlsbc+EQel?=
 =?us-ascii?Q?/nzzoas6uXK7VmsUFlbXuNNqyTtgiAl6Z/SXpuUeQWYuKkNei6VxkZDNetRp?=
 =?us-ascii?Q?k51VvR+4KwquxTPVg8S1mr47Os+1CS7eWXDQIK3T/DfhlM/8JqcVmOAALF2b?=
 =?us-ascii?Q?HFFZ6jOLKgrpAXeNjEaKkgpNDXCSninoeL2NNj0LrncFajaGlfFWrxNpSFx1?=
 =?us-ascii?Q?wEy6wRJNTp0Ex0vnwo0OodtZXgZ1NnH9zyTlDaczTQfkrhKwTyAGJpufOb/E?=
 =?us-ascii?Q?tCKrL9cdtYM7rnAfEg0lVyUkZ5WEEyDo+FGbSypkXq2JBwklvTZcP2Tgha5F?=
 =?us-ascii?Q?7mwH06IVdr0g5twJsk8BJhr77tEahPl7p6wqkhAUa++ndyO95NGHe9wemXLI?=
 =?us-ascii?Q?EE2i33mcQ4WgxezbI161spC8qow3VVXf3IWlic73wbAAHjzPY+oT9Pr5biD2?=
 =?us-ascii?Q?av6JeNcZ5YoMsa2Sf2T2D4I9opcO1Nj/bkJcPo/lFlQCjlLXBLLSy1rk/9K1?=
 =?us-ascii?Q?/w7vJJsdyQBRgauCRl9VyawgylEV7GcFfMLK2v6T2vFsiSSV5YXXsCjYuqPL?=
 =?us-ascii?Q?o5+OsoToaCyFeCvhJpGVit2ZruTiWQq/emTAMcqqYu0pX22lVcWhe/7Imcqp?=
 =?us-ascii?Q?0pqA+GoS8VQJz2qHcbx19UXfbo6Nhj6aCqwDR0FHgZyRAaMuZZwL41ya5WMO?=
 =?us-ascii?Q?tquw1OkTzqCFP74ggjetCm/+765jfg7+cmJwSa9vtdeY1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jy/nWYgKEVkNCmqN+7+80xgE91A80S0GZQvaa9sYS62pCgmoFn8PsetLvRfp?=
 =?us-ascii?Q?h297AUKY4lOCzBeHTkel80n0Drr8Sa5v4RIfbvLXQg+0helCqsgLzUl5MNDO?=
 =?us-ascii?Q?nSrjEYDbBHvxnsFi5WeXqEp3dbHRsYxzzyG807jnVIIUdn2QDFebGp9yq0rO?=
 =?us-ascii?Q?fEnuRk5Db1/lOFD6CaDyclrZKSQPMsWT1CB8kyrEILnVYmqrJ8+NE9hXQi0n?=
 =?us-ascii?Q?u9sCWC/FS95FLpxkdiTjNMHpauLforh4kWtfOCyZAT1MU+qNd5El38SHOGIa?=
 =?us-ascii?Q?BFcz3QB3L5czGkn22y7XeUUTO3MZHxM8E9LvFyvOEa8EQQL1QSnXq3g/wmqC?=
 =?us-ascii?Q?y8pzSxXaNihUKvEY3NDGn0QbVdLxsjSBgtDk5zL6WWKn4KDEKziBnXv6ed0B?=
 =?us-ascii?Q?4PkRIImhgN4yIzwAAzjLvpQXQHtRM651SL/31R+FgREy+tHYQ3PmLI17B0Qv?=
 =?us-ascii?Q?10i6uqjWx/NucO3LkRcSiqTtbZX4LwldkT39oTty/Bf12Mxk2ee74eswPJmq?=
 =?us-ascii?Q?XbstdAbhZM/2CowbRYECpFBXicgu1hUfKPI7yZGW3xNFQ/eHhhUleGjouAcP?=
 =?us-ascii?Q?rvQnnPgwdj3NTxiNk37aVCEYNlDBN/RLitusze248CDSb7eSlFtBKB2izelw?=
 =?us-ascii?Q?wWjx57BL1HnqMZpSCofWWabMQQAy3ZG78FfaJOUHKllMPeqCMIMODxnX8MxX?=
 =?us-ascii?Q?QtbESVXtTqEu78quyuQ7pzqh/tGyxAFOGXAlBll7/j7vvAilUGHbVJ/DAMXz?=
 =?us-ascii?Q?+QDAlNci+jgg+nCl3uAm9i3TTYuNJY5bKJ6/SmgWpgX4Pr9YxDsKMI35TDPV?=
 =?us-ascii?Q?dQ8iopEvInp1sGJOO9e48mhowyizk/XUs39igT6xPk4XLINjDG72YUsYbxaN?=
 =?us-ascii?Q?9az7A2vIh6WLzmJymdpvMXYTn86ymNuAD5+tkVO7rG4vdlA69r4tBxvDTQvv?=
 =?us-ascii?Q?DY7CWaNf+3FJNkrx5muTs/8k7lzEnjIE0Yv+Ul72pDVK0raRPYkYTTcPExSv?=
 =?us-ascii?Q?y8Md7r4xCCDPXcs4taFrZbMajGuKryf2LEfMgEsvb6NRd6XrUrLDds88kquW?=
 =?us-ascii?Q?rz86+1fiOcirXBEQVvSrQKWfIf3a+nrWllKDtpY+Up9+G32r1b6OX8NTW4Qr?=
 =?us-ascii?Q?aQTEX1crOSemVxK+5HPyuf2cZD/Ox/zz4aqBQf2B+nuuXxLAvltnFBKiz9mY?=
 =?us-ascii?Q?WJWtL5z/GlGwVRoaTuwPCtfrmTibPkz+wr86vCHtznlRCN18nHRR40s10Fkj?=
 =?us-ascii?Q?yxb4cGLnyfyXiK4c+4WAOBNI+ve1byipODsyX+yIczXhAnSfZbXo+N4XIT6n?=
 =?us-ascii?Q?wmC+l+KyN0nXqrZqbfDba2LSSLI2hn5wfsc54c+VTgVMhQuEQyhsWB6sXDP5?=
 =?us-ascii?Q?XSlPvDvAGQL5wX4Rtp23aS/nVfLRK6g+ttk6tXywNjesbZiuYqOip4MLwJnr?=
 =?us-ascii?Q?dYqBIk6vOlWIIUDZilECcPlUsIC1ACBOd2reRPNMI+FdGGSPbxMxZCjdquOC?=
 =?us-ascii?Q?3uPV8nkm+2ECEhdywWROmUP5jMPbx0AaFfMb4pYGncdIu7T2Q1UG9vbaMoxT?=
 =?us-ascii?Q?eP1+r25nFPxsht0UvIkoxDxLBSA2sENZO2NWVVE5l07Y940u10IFu3Dfq1/J?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3be8ef-39af-4e3c-4ac7-08dcb0da65d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 20:58:43.9493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2feradg7VdLP7JBGhqqWhvNSNSTg7JnqJ15oTz8ix3qHZFbUfuW5lOCo0WRgHK81yKZ/CvqSQUiWeyKt63ODop/N9FyW/plEaLtv3/4+fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
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

On Mon, Jul 29, 2024 at 02:54:58PM GMT, Ashutosh Dixit wrote:
>On Mon, 29 Jul 2024 06:21:20 -0700, Lucas De Marchi wrote:
>>
>
>Hi Lucas,
>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> That fixes the build, but question to Ashutosh: it's odd to tie the
>> format to a bspec. What happens on next platform if the HW changes?
>> Hopefully it doesn't change in an incompatible way, but looking at this
>> code it seems we could still keep the uapi by untying the HW from the
>> uapi in the documentation.
>
>IMO, in this case, it is not possible to decouple the formats from Bspec
>because that is where they are specified (in Bspec 52198/60942).
>
>In i915 the OA formats were specified by an enum (enum drm_i915_oa_format),
>but I would argue that enum is meaningful only when we refer back to Bspec.
>Also the i915 enum had to constantly updated when HW added new formats.
>
>For Xe, we changed the way the formats are specified in a way which we
>believe will make the uapi more robust and uapi header update much less
>frequent (hopefully we will never have to update the header and if at all
>we have to, we should be able to do it in a backwards compatible way since
>we have sufficient number of free bits). HW has followed this scheme for
>specifying the formats for years and only recently for Xe2 has added a
>couple of bits and introduced new PEC formats which I think it is not going
>to change now for some time.
>
>But as I said the formats have to refer back to Bspec since that is where
>there are specified and there are too many of them. Any description or enum
>is ambiguous unless it refers back to Bspec. So I don't see how not to
>refer to Bspec in the documentation. If anyone has any ideas about not
>referring to Bspec I am willing to consider it but I think the best way
>forward is to leave the documentation as is:
>
>	/*
>	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
>	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
>	 * b. Counter select c. Counter size and d. BC report. Also refer to the
>	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
>	 */
>#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)

I was under impression that these shifts were something coming from the
HW definition and we were exposing that raw to userspace, rather than
e.g.

struct drm_xe_oa_format {
	__u8 fmt_type;
	__u8 counter_sel;
	__u8 counter_size;
	__u8 bc_report;
	__u32 rsvd;
};

now I see the shifts are not tied to HW and it was only the chosen
format rather than declaring a struct.

Applied this patch to drm-xe-next.

Thanks
Lucas De Marchi

>
>Thanks.
>--
>Ashutosh
