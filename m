Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A31A77403
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC36F10E4E8;
	Tue,  1 Apr 2025 05:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBBDGcq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3410E07B;
 Tue,  1 Apr 2025 05:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743485952; x=1775021952;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gtPr5PPurf4R+oxdzgM5f4phMr/1TLsVJLRSaA505qQ=;
 b=EBBDGcq0pHPfO1+GIMY51+u36JzrjsOQyoZ+I/foy+Jp1DNwGfsKrpqs
 /IW9hAWdzw70URXbcUVUqApwfC/zjt8rSsV5JCMCJjTC3AxJS+BOdt9T5
 DKQeCcFSlzYiveymK5xCVm2ZbkoVApVjc2Oy+sgd5B7QCqfcF/TocVKyx
 9EXV7l/ziW/F49EK9/wtoqGyKVVLhHhUU8kybQfMtMCBzXqjlj9g29vUJ
 1a40r9J+rC3y3dDk3S4d4m3PtvlITEjleQPcNOa3G9GzMFC9A0opgftSe
 ZYjJ9eiyeyvajpXPuTr8xeJQa4IbMiqLuFV8RSTbUjLu9iGLqvbX4ZHfi Q==;
X-CSE-ConnectionGUID: 8cEMiSEFTRGCyH1f0PYuAw==
X-CSE-MsgGUID: JVFCSsZ4Qj+aTudOFdcY8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44504918"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44504918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:37:26 -0700
X-CSE-ConnectionGUID: flsXYyhfQD2QpTGMYj9S2Q==
X-CSE-MsgGUID: geRshrd5S16EOjNNMoimbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="149471226"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:37:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 22:37:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 22:37:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmmnKITr1zUPnwiFKBhZy3nRzCs8U8FRqydfh1nNq5V+H9Y/RmlR60nX+4+gfVhLF/InBDcqqxzjKBIYPy67+by/2ge5kS7rXdE0oNyiTowRwceh7bwFxT1ofQG6aoD25Wrfy7IsicttK7ju4i4ZPnSpjvW5T/cq9oGVU/RL5vXchHqsXF5KxZK/cKym9rSW6MKBa0Secn3i7Hpvm9udnPXI9tKECDoc+KRdtW9RGz06NW5zFeGaXOlX8ZcG9p5o2ZYc4Dm29+ATcBTqcf6faQw657ryveZ4bHEpzFvlZt0sKNA9NyTr7ch4da681zm4P63n61tD48d/hSKDPFs2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m15cpiqak6oUCnqmmoWvTdcRW5bRWoBIQzVBmGag6fI=;
 b=vt1VJIfaxCNzXxD0x0IuH3rtgRD/HI5bhF5bkCzwNuuZlT9vwAjkcoYCuT0qtgSkE0dJ/QV42Tha3mYUJ6aJR33gSKB6Wpo5PegP9gZJReG2jHZLR7Hu8ncytOqRm5jkTHWwrO0xfcp4Hf/nyRs4TrILhFkt+iupQvgTNgx96uxbEgAM6L/rp1fU1A2oH+44R4Rj7+j9mJwKH9uf3nxLGCfSp0VRiFpG/7MK9xxviero32uImu+Lftt+mpn7VXKCktQBKEdZHIh7W6VShJPaUv3IbtDaDc51SlhRh4h7cXeV1y27sWnr6bMhocFhOXhcTOQatjdmpBzUkCRqcsHM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:37:22 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:37:22 +0000
Message-ID: <2d020b00-cd4e-4802-965b-191ba9d64eaa@intel.com>
Date: Tue, 1 Apr 2025 11:07:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/i915/display: Set a scaler mode
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-10-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-10-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 699381a8-834f-47c5-6105-08dd70df46b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUd2RXBVVGN4RkplRk41a0JqRmN6dGVOalhGOFlxYjZZTjY1WjV4c1BVYzMr?=
 =?utf-8?B?MHhBa2RoVytrRUo0ak01S04vVTRWVW45UTNXSmticW9JdWhvS3dYMkFiOEFB?=
 =?utf-8?B?dzlkYUhQVjRQU29aT1ZZaGNxZHA3N3JSN0FTZkd5MlEySEx4cUtUL2Z3TXpI?=
 =?utf-8?B?dXpDekhNUTBJc05qM2xIbnJyNmRqWGhFQ1ZJVUJMNlhwRVROd0trMTFBNHk2?=
 =?utf-8?B?TmhaVWJaUTJLNlFWNkxvZGVRZEhIc0t1ak9CTEtWZDBnT1JNZnNwOGlUQmRT?=
 =?utf-8?B?ajJsNXpGdVNVNENZTUFLL1JQR3gzOG5ybVgzRXJKUUhOTCs5SCt3T0NGMjdD?=
 =?utf-8?B?UTJaeEZtNkpNT3I0dUhQeUowMHI5b1dHKzdhT0F5ZG1Vdm9obDltcUNqZGg2?=
 =?utf-8?B?VGZPUlFDL2tVeEhLNEdRWitSZDhnS3BqVWtSUkcxUU1aQ1Jld0Yrc2xDOVlJ?=
 =?utf-8?B?ZDUvdEVkNjB0N1M5YVp4MzFDcUNpUW82Z0Q3QUgrSkpUYUZDZGJucURHbVIz?=
 =?utf-8?B?OVg0OE5EbmVJdkhRQkIzK1dCZFc1RXlSdjNaVWNhZ2tqRDFKa29QUFZKalNo?=
 =?utf-8?B?SlpEUTFvekQ4ZEpRYTNSU055UDNhOXRwdGMxWmhrZ25FMWRSdTVJUnp4c2ll?=
 =?utf-8?B?VUlDTHFNckNUZjhPQkM5QWNZUDBvVGtHYTZndTZPeXMyTUJmNHluNE8xcGVN?=
 =?utf-8?B?c3A4eUJFS1JEdjBNS3d5S1VqeFZ6SDMwak9NMFYwVlNwWW04TGRJOTB0ZHJp?=
 =?utf-8?B?ay9NQ3J6ZDN4c3BIVEFKMmRhbEE1WGpyNytjaVFPYW5sR2VUVVNwSHlmcGIx?=
 =?utf-8?B?V3FSNGlwa0RJekh1UGNFZEFCK2l5eitlL05hS3BWcnVMUXY1SnNFZktQcDJ1?=
 =?utf-8?B?cDJ5MlVoQzdwM09DZ2g0RnQ3YlJ0aGVuaHRETWJTeE5QOWl1L3d2MlcweUFh?=
 =?utf-8?B?K0gwdnNTcmZLRWxubjFaemlYMkJzSURiK3V0VEtxZ2FYcTZTRFE5di8xLzU5?=
 =?utf-8?B?Sng0M2xPdjIvb3ZzWnh1aWFIa3FxVnpVQ3h5STBRNk05SDVWelV6K2lkUkNi?=
 =?utf-8?B?bWFlQlVhdW5ZeEhFKzMrc21WSFQyM3J4bGUyd2pmS1Q3OTQxK1h3bTIwejJ2?=
 =?utf-8?B?UTdjQm5HaVF1Q1NrdW1Ia1BLdFg3aWtGYzFsMXZnSmNTZW1VWlBra2wrRllB?=
 =?utf-8?B?SWpUVFZFeUdiaHVockVDZnpjZHVQOVNmSTVERjlWT3JERnhSSzEwVDVPeEE4?=
 =?utf-8?B?bXkwZGN2aHBndmJwRTBqV3JPeThuZ3JjaXRjcWNrMXNyYXkxWktoL0c3Nm95?=
 =?utf-8?B?Qy82c1IwVTdsNFFkbmdGMW9ieVhyU1pEd09jc0dRMFNZTE1sUTNYZkY4Y2Vk?=
 =?utf-8?B?U2V6bFFSZ1R0d0xrT1dROCtSUVl5Ri81MGNlRmRaVVUvYk1HdmJ1Wjc4YkJm?=
 =?utf-8?B?bFBtNEVOSXVDZzY4TU82MElJYUc5OE9lRlZIcGhjekQ5MXphdjcyczBwT0R1?=
 =?utf-8?B?cTVFU20vWHpYSWdncktyRk4wU0RTRHNwRTlKbWJNSHNKSTBQRGY0U3h5dnlS?=
 =?utf-8?B?WHdXaWxKNHBaTDhjU1hrOTZrMTlTSDdBeXJ0ZlJwOWpwUjBJemNsaGF1UHpG?=
 =?utf-8?B?OVkvMEFkUUoxSFkxYm9DekZxS29zSjM1aGo5Y3dXbkdDR2sycEQwUXZsRDFx?=
 =?utf-8?B?T2srUGl4MkNpbGRtYnlMenkwY2xpT2EzclNHL0Y5VU5kdmdBdWZlMnpSMkRF?=
 =?utf-8?B?SnIrS0ZTT3lobjk0NmREell5eG5aZ3l3MWpjWVNVR1liNmwwb21SSEgweDZi?=
 =?utf-8?B?bGg2SUw1U2paR2tzSWd0eml3VlNYZU1reHpIeDViQjZPampEWitVaFVQLys3?=
 =?utf-8?Q?S1fXgB4Ywuji7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzFhSi94WFEwYUYyYXJ1VmFydTFtTVAzSW5xTFhjYU5zSjcxWHlTbHVCMnZU?=
 =?utf-8?B?TmxBUTZqTXZBc053a3NsWk9BbUFRNTQwb2VmR1M4dlVYL1d3alJoK0lqdUhE?=
 =?utf-8?B?TVZONE9lQVdpMXVqclFaOVJMSmZrN1BMSFczSmV4NmNYS0JkaW5GSFYyU2x1?=
 =?utf-8?B?UVE5QmNpc3dqSVNMek5NNk1Ud1VPSWRsQk9zOU14bTU3cTR2VDA1Qld3ZWVa?=
 =?utf-8?B?cTBIdTdlZUU1TVM2ays4MTNQc2dBZHpkSW1FQnpWRlV2ZVMzQ0xmbkpmeDY4?=
 =?utf-8?B?UGMwVThzZnpReXJPZzVJakFPQW9USFZzNVBVNVE3cHB2RzNKOWhFSG1BdU5Q?=
 =?utf-8?B?aUk3T3NrYVZzWDVId0ZZbndCUVIzMFdOamVyMUswVTNaTnY3MkV0TmRJOFBT?=
 =?utf-8?B?M3hwbjJ1K0M1SGNKTzlRL3o4YjIwbkhMZjFXdXJITU1WMjFtMFcrc0xDVjl4?=
 =?utf-8?B?dTA3b3Mrd1BNWkdUTTkwNzdkaWpiTTRkVWJqbVZZTEFzZzQ0UkUrNzJManNX?=
 =?utf-8?B?VCttcXdZeWk1T3BBOSt6azRJQ0d4L3FRS2x1bXM2QXEvaWhKRGJLNGh4VXV1?=
 =?utf-8?B?eXlMVU5qUnZOVmFSbmFqSCtNYmVUNlBEb2UrZFd3c00rbmJncE5ZM2Vxa05u?=
 =?utf-8?B?cDRFdUVXRjNid2dYeWRFUGpQQ0c2RXRhdDBmdjZnUWcwSE9FaExhK0RwL0VB?=
 =?utf-8?B?RHBQQnNkVnJkamxhdFB3MUVOd0RXYjZSbVFFQTJMSjliL2RpWmJUbUZtcjFj?=
 =?utf-8?B?MWxXNVdMWUo2SmVoaEhKdHdEV0xqWGxaTXliS3FhM0JUSTNEbHhDTEFqdU1F?=
 =?utf-8?B?T0hRQ2ZUV096Ly9nOG5vS2hMVTNURlpCZkYrTFl5d2ZiYTBrdEZhcHJualgx?=
 =?utf-8?B?bGJ4OVpGRnFkMXJROHpoWXpJRFBVTW1DUHZTYVZPeHRUbEYwOFhuQlQvSmg1?=
 =?utf-8?B?cHg1QU1hMXlWUVFSd2NvOWZrcGNYVjVUT0NuU3VPZzdLYnNaZ053S1NQOXNv?=
 =?utf-8?B?bWRSUTRzZEVjUC9mTWw1RHpkQk9QQVpFR1hwK2x3VG1YRnZ4YXRnZll1VGd3?=
 =?utf-8?B?N3hER2k5dHlPS0Y1Lzd5U2hFcDFLUVEwb09qd0ZwVExvTlowbENrOTcydW1Y?=
 =?utf-8?B?YlBqQW8rS2xUakpSamdQMlpUOWo2eUN2WVBuZlRSODdEY3BmNkI3WHpxNXYr?=
 =?utf-8?B?VjFoRVdmb1RDUkpwcWo0bjkxTXExdlNWbUJFRjBEWHBBckN0cG9BSkFJUnlm?=
 =?utf-8?B?OXRvQUxmZ0N1Vi91dkhsQTBjd3pGQUdvY2N1MVROZXdRekMyc2czenFkMExP?=
 =?utf-8?B?bjlzRm5qWUZxUkVTdjQ3OVM0SEwvamdKYVJPSGYxTFdPODBHY0tqVUVPZTJZ?=
 =?utf-8?B?MXVtNEx5dVo4Tlp4WUtaajVJRm13NXFQVmxHLzh5cm95TkVzQ1BEbEZOK0kr?=
 =?utf-8?B?ZUpvbUhESm9ZeVlOOEYwZ2Z2NG0rRXJ4cHA3M0M4eVhsNjdKVnBHVGFKdThk?=
 =?utf-8?B?YTI4RXBJS2hGSUVEcFRqb3RFN2U1TndzcWlhUU9sZ2doZkQ1Wm9HY0VaMmNn?=
 =?utf-8?B?K1hxS3YxMUROVzd5S010NzYyRFdHMjBNbUpJdlUyZnhJWEJmVENNRUh2UVFJ?=
 =?utf-8?B?b1dDdjkwbjQ2OWI2ZTBWL0c5UjZ6ZjBxcTZDeFlGZnYrNjFNTkZEY1lJRFlr?=
 =?utf-8?B?dktSR2UxMVVVNklRdkowcnJHSjBnejhOOTdtc3RGNjROSVlFaUJkSHlOeGcz?=
 =?utf-8?B?R0k3aUQrT3NIeFo1dFJkVUdML0ErY2pya1pRa2dMOWtQRGdvTS8yOFZUOVRv?=
 =?utf-8?B?dzAwaXJMQncrdmNDOHJ3eEo5dEZiWDNyMTlRdmVISVVCVm9JZEE0Nllhb3Qv?=
 =?utf-8?B?ZVBUUGxKN3IyTk9jQnVLcGVuSC9OaUFzdEo4V0wxOXN6TkR2dmJUcFAxc0VC?=
 =?utf-8?B?SnBuNmpqbmVVSENoaUpXWDNqSWk5K3pScmJoelFnOVBtMkNyckNPbks4RVpC?=
 =?utf-8?B?NDVUM3ZDam0ydUkrWlJpekFZa1BQTXBJbmpFbFhlejFVNjd2VHA3eWxib0pw?=
 =?utf-8?B?RE1UUFBPWUFoZW9zbnQwTmNBdnp5bExLc0RBdzVSMENLYzZ3YzF4KzJDZzdY?=
 =?utf-8?B?Q0lrM09TOERvYmM5YWlQdGhuREFOWHZMck8rdUxWLzYrMkl5SG5ycVladnEr?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 699381a8-834f-47c5-6105-08dd70df46b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:37:22.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yfh33LAPdwcToZjtVAmlKNZky9pPr7oLUumN50sn3MPqj+b02wXKy+L0jRL9o9UZjuUf9Yo9RW/bnDRY8Uy6qY/0OaGkNb/KZr7Mf5UCQ5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> Set the mode of scaler to HQ for casf.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/skl_scaler.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index d816dae9cec4..93a847c05535 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -392,6 +392,9 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   		     "Cannot find scaler for %s:%d\n", name, idx))
>   		return -EINVAL;
>   
> +	if (casf_scaler)
> +		mode = SKL_PS_SCALER_MODE_HQ;

I am not very sure, if we need this. Couldn't find any where in the 
Spec. Can you check if this is really required.

If this is indeed required then would be better to document the reasoning.

Regards,

Ankit

> +
>   	/* set scaler mode */
>   	if (plane_state && plane_state->hw.fb &&
>   	    plane_state->hw.fb->format->is_yuv &&
