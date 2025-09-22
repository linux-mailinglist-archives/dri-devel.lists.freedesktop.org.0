Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87262B9131B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E9710E46D;
	Mon, 22 Sep 2025 12:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cc4Z6ci4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2302910E1B8;
 Mon, 22 Sep 2025 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758545327; x=1790081327;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VXteay2XZdbfnUsMphUjoNyS50QoTPnCPSjJWjn3hCQ=;
 b=cc4Z6ci4owDQZNLcnZmLCc0mj3El8YTUtxsyjwcnDl/MUhB//QFR7GpO
 tGxxW50XIfQjS3m7S/D5WD+GL8ssKLyy9iW/cFKfrD/4kZcryiLPxOoRq
 MOYbQbwESRkMUybC7tXrW/ncWzke091IrY0IDCggFAmhIMHFt3y87TLVy
 dVFgqo4AlpBg4cT9RHk4gI/+gxZm/mi0+nkUtoHaljwmALKjTS4EcS6ju
 8X2tE/zgaYZpQm3IcpMruz3Jq/oJFNdRww+3Vy/x/WoIFenByO0E4stko
 o920AVwDQoZwzzs9mE4pYaayW2Ntrcj+gwb7QikC75pLXuSw6TvbHIyDe Q==;
X-CSE-ConnectionGUID: WCWIfhSlQ9eHIppbBdXHJg==
X-CSE-MsgGUID: 7+JF4LgVRt6xyXZO0Auh1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72230229"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72230229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:48:46 -0700
X-CSE-ConnectionGUID: jN2e2kAtTE+BY0AxebnAcA==
X-CSE-MsgGUID: 0VRCmSsCS1S/+zwt4sWemw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="175606942"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:48:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 05:48:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 05:48:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 05:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUbcLbuLPEap2ia91XzPqniYRvZ6jsHeU86w6orIckVJI4S4zVKzjQBleCALHr/w9ku+l04wHcx/jMLaoKDyS0G5v9KSJjkLRjy+M8k9hFb4ee6YBjEzOEsoTrdRSdgOsLMqmY+nwO192X+WSQZBBzNmSG6BZGRRgVIeQLAOe5QJn9md59uTAyab1wpLpuuU1ybxfkj6ccYO4odAYzhADkFjUbqOys9QJseupSypptfFjyq2bbunWDyg0xEKXz3gKZQM8W6jEcNdEOVGgrFJwn7dFhM1fyHEbRJHkCi/NltgKRvUe1ofH8ZmgLFfChaTvU0bLC//ngnyw9C9ly81MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pqU4WgybI8ObRajdgXylfrkL+OyI5Yf1/EF0TsJ+9w=;
 b=HdTFed0S6TQOW6O7+uiMKh/uLblQ/7ICaGFwHNtf0XPInlfJInb9ZTXHbWKUlf/l/iI21vb8+6qQu1DCqFT3IZUN8SkbnPr4w1skx8vYGwebhuyBpw78wBttBASQY8u56szh5kIw1u/Nx7U4OKXimNyeHw5rYJQOfQUaXnvGvlwjkOUdx8xLyd3RKZl8513x2gZFVt02RxJ0XW0o2daLCIwKXTJmScunyx7zkjVtB9vbh0iNSvjoEkwDYsgcwnru+s6pbAboZmET3qTD/pUI5BaFOgDUG2Hm02QfelKuzP6Z/nIx+lK4lQcao7GTIYiOB7mLEM12QJzKNd93rvJpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 12:48:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:48:41 +0000
Message-ID: <293909a8-26f8-4513-abd4-97cf6f1052fe@intel.com>
Date: Mon, 22 Sep 2025 18:18:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
To: Jani Nikula <jani.nikula@linux.intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250919143418.3102605-1-nemesa.garg@intel.com>
 <20250919143418.3102605-3-nemesa.garg@intel.com>
 <fb4e8118c7e7cc0f566ed1e8ee09b4d58d801c73@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <fb4e8118c7e7cc0f566ed1e8ee09b4d58d801c73@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df4854e-44d6-4091-8b66-08ddf9d65b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWJTb2hYdzNRMFlsSTFnekgwTTZ6MHhvWEk3ajVQU216ZUdpcDB2VGZ1YlBt?=
 =?utf-8?B?L3RETDZ4cDZjWnEySk5zSGRUUEFMLzMwZnlRYmZJZW5KRXE2cFIwMklPSTll?=
 =?utf-8?B?Y1JBdkFvSFFhTmJkWmZveXJQZno0Q0ZGdnNlMVBXMzBIcVRKc2RHb3FESStn?=
 =?utf-8?B?RXJlQnZwanRoMjQ4Vmhram80Qm05dGdZbmVaUnlnYmREMU9DcDlaY2htMWk3?=
 =?utf-8?B?WUlMSXJQNVhnSDJORlJMN05UZ3ZJMklMbE9KVEVrMGRqR0ZNdmZMVXIzSFBO?=
 =?utf-8?B?Z2UxVnNOUERkMWNGdW1RWmFQaHZUUUZ6UHdLTmxGeHk5bysrc1BpUjErUWND?=
 =?utf-8?B?S1NyNGFYUzZwOUsyTnYyczFtOUpSZVVUWlhVOVJmMmZ2QUUzK0h3MFJMRUNL?=
 =?utf-8?B?UjB3YmdiWHEzM3huK1ZXc1B6Vk5lR2w0L2wrMGtyV2FxcVJuNkdKY0ZTWmtx?=
 =?utf-8?B?eUJSZmZoRW95RXd0NGx1ME51ZGQ4c1liZTY0Y3RWUktDT1E2QWc2dGYyZW5D?=
 =?utf-8?B?cTllbkF4TEs5NlkxUW1HYklwaUlFK25xVFVyaTFRWFZ6WDNMU1JxQ0tub1NN?=
 =?utf-8?B?NCtPUERIWnJ0YzFIVVY4OG1JMmtycW5CMHh4VVVyRnhvMk1MQTJ0MXJCSTZj?=
 =?utf-8?B?WE1meEZKWDVRYnN2ZG1YWlEzWFkxcXVqVGgyTG9LWlJwZGVqN3VpQW9rWnlW?=
 =?utf-8?B?MklNTnhpTTF1V1Q1NmQyY09saXRkdFdiWW5ZS3A3V3BDTlQ1eXk2RVdZQjV4?=
 =?utf-8?B?NmxOTi8rQzlBQ0xXVmZPS1FNTWdGdnhtSmR5RzBEcU5VczREdXFCZE1XaEgy?=
 =?utf-8?B?SUFhcVkzNVA3T0tseGpQN2N0NGovUHRDUXlFN1NTeEEvUk5yaEJFVjg4TEZv?=
 =?utf-8?B?QVEvM3JWUXJiMVRPcXZWU3Q1VitvMmJ1dTg1QW5jS2xDdXdIYVB1Qk5WQm1K?=
 =?utf-8?B?VWNrYm5XRk0wZWxvd2hLcDJzMlNOejFkQkFsd0dHNG5mcFJ2SFdaV3c0cXlW?=
 =?utf-8?B?RFdndFlYZjFYbTZhMjd0eFpNekZXZjdwSis4T1ZyNFdibExURFRrUTZGaHlk?=
 =?utf-8?B?Z0xKWEtPZFdPdEtzcW9FWkQ2eklDWnhkZ0tST2J5cXlxczRQbXlHY2g1WDNM?=
 =?utf-8?B?UDVhNTBMRlBJUkdsOFJtKzhQOVlkOGdKZTZVM1hjd1QzZGMvbmM3YkJubnR1?=
 =?utf-8?B?YVJoQ3NsbkpGRXFJblhwcE5wN3BjWWhvYlVwZkZrS0JhM0hMejROSk9XaHo5?=
 =?utf-8?B?VlRvUzErbTBVTlZLeWRlc3hONUpFMzQrZ3ZtcXZhMm5WYW5ZV1puYlNBVHgv?=
 =?utf-8?B?QmZQRnRIVGU3bzYrd1VwTldPL2xOdHFoYmgxcGVJMGVPOFlRSGdKUlVQNmE4?=
 =?utf-8?B?MFpPYjRaS2gxWG1YUkNDV1owTTUvWjZHKzgwVTZQWEw5RTI2c2dyN3djVW5N?=
 =?utf-8?B?N3pEOURMSktqQTgrQmZwTHlVbXhNTHhOUzZNSUNFOXZkaVR6blhIbWY2amFH?=
 =?utf-8?B?SzhjK3NYTkpTbWp1bHYyTDFSVE4xNGttTEIySTZzdzA4QU0vQ3RNV1Q0K29n?=
 =?utf-8?B?b2pwcnpZR1ZXWGlRVmVkM3VtVFVZdUlHaWRjdmsyb1RUUHZka3FvYXhOVm4z?=
 =?utf-8?B?K3hFZk1ZMlJoN3hDWlVEY0hFOC83Z3RoZDNFeE1BbVY1SUM4Z1czcXRXOWFs?=
 =?utf-8?B?TlZXZHV3dnA0bU5wY3NSZ1l4TnU3bVI3WGRQblpvRHNOTXpFREZwWklua2Nx?=
 =?utf-8?B?REkwbnd2eS8rcFUvVXBKYUs4LzN2dWRmV08xeHY4K2N1QlVUQUpibUVPdFVi?=
 =?utf-8?B?SVFubkVwQldGL3FTbjM4bUVoLzZMSW9EeTBmd0h2bm5RTkw4b1lIUTk2UUtK?=
 =?utf-8?Q?SN+b7cG89OwRK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVFHTTYzTTEyVVE3Y2FzUFJsSXB3dFd3WTVqdURReTU5WHFIZ2RMd3JTWWph?=
 =?utf-8?B?amo1b1ordUJsUnZ6Q1NxYkFlZVZCVWZwNE1zU0x1VTNXU1R6VU8yL2xBaXRF?=
 =?utf-8?B?WDlsekNTZ0phaEFNN1A4QTZBSTVxU2xaTlFieHAyV2MxakZpWmFhUlkzaUFB?=
 =?utf-8?B?cjhTbnp0dndNYXF1WHQrUTVoeGlacElaOXVGY0d1ODB5MGNwdlRyanFQM1lq?=
 =?utf-8?B?b0RIMjBrOS9CS3FiNkJQd3k4L2JHVk5FbVRvNGJLOVdwcUpmQWhncXVQK1hE?=
 =?utf-8?B?dmdnL3lZZzJsWGErVFVqV3lwOG1uTnNBUnFGRHViZ21TT0FIRkROUDkvZXBi?=
 =?utf-8?B?Szh1K2ZvdWtOSU5kYk05aXEzT1E0VS9rbEpabXZDcktEa29zR1NaTFNEWVBC?=
 =?utf-8?B?Y09aaWJFcjVLMmI3WlF4RXBvRVljbmI0UzVZcWVPRDcybnUzbFd5M0krK2Nv?=
 =?utf-8?B?NE9yMGlyNDV4NWpBQmRaVHU4OUhRUjMzbk5Eem5LaExlSkdLbE1ibTE5UnYx?=
 =?utf-8?B?TWJyL0d6VUxOdk9jR1pORGZOUVlQZG5IaXkvZ2xIUm5TUWVOaElKMjN3WVl5?=
 =?utf-8?B?Z2hrT3hhcUwzN2NXRjg4VDYrM1QyNGVZaUVab0pJa3AvWDE5V1VTNUhHc3RT?=
 =?utf-8?B?WUc5dnpCVElobmpDL0MxdVdWMXJEajFtLy9iRGdodkpXVEtSckQzRTNzV0p2?=
 =?utf-8?B?bjFEQ1BVOWxScGJoWDBLL0NVZTZjTlVYd3U0RFpqTkJrMWFiRnh6eUtmOFFF?=
 =?utf-8?B?V1BZdFpIRldQWVg1UFZra0NKLzlQUUVrMXFkOE9EZlNtQ0hnQzVxek84UHl5?=
 =?utf-8?B?M1dmZTM5THR3NUhhcS9lOVJhN1ozSVk5M3BKeXltRmxzV0QrNGxvRUlhOFdw?=
 =?utf-8?B?eC94QkpqRGdqdnRMVllLb1dLQktzWWVQUDh3SnVzZ1Z2TEpKK0lMczNsTEht?=
 =?utf-8?B?cGNiNTVQU2IxZDNsR3FzbXFrWTZzWVMzNGwxQUFuYklzNDVDWGU4clJ2Y0pK?=
 =?utf-8?B?TFBOQ1V3MzVlMUxKWXdzOTR2aC83akZaS0t2U0ZWUjBiam0zK283M0d2ZTVQ?=
 =?utf-8?B?VTdsWXhsbDdUYzlHcmhDYjVBQVJTNlVZN2ZnckluNldGS0ovTTVnRzF6RndG?=
 =?utf-8?B?dTkzOStrOTFCN3VKdlBBLzdZZ2tHV3cyWUp0dkgvdTNDT2lwbGlOMW1yQ1Zt?=
 =?utf-8?B?YzYyQ3FQSnlRSWZVMlRQVUdicGhKUlRtZ2F4QkV3Y1ZyOXZFNkEzMFdzYnFp?=
 =?utf-8?B?NHFkZ256cWdsUXVFOGVKc0UyRmZOeURjcDN6M3dFMnN6dWI1Q2ZnQVRlbVF1?=
 =?utf-8?B?ZzFYVHlLNEcwSEdoUStEdEpxZXVBeW1ZSGU4VGFvNzNJd3lGNUdRQ3YwcU1I?=
 =?utf-8?B?dGpOU1labVVlU2FHMVlNMmMwWlhacnZJOFJEeWh2YWFzRU5UZFE3MURhb3da?=
 =?utf-8?B?TmFldmdFRjBpUjV0Q3dvNXNjOXR6Ym1Ydmtsa3FyczA3Z2pQbjUvVXNUYzZQ?=
 =?utf-8?B?Q1BKbmxtTnNCL3dPTzRPR1c5dE9FNzRhMnJuUk41MzcvWFlHdGVXQUVEdVNG?=
 =?utf-8?B?OVptWXBRUTUzMzJvS3AwRmdIYXlDRU0vMGxCblVvTmVIcGtGS3lEcnN3d3J0?=
 =?utf-8?B?N3JuU3pJRHhXUU95bFhBQXRwWVozV3lxWHU5QnV5U3hRUm1ZRGpJVkJBNThY?=
 =?utf-8?B?K1JxSVE3UTBXekozSXFEMW1GbzcweDRDYlNGZkRnRWUzY1FHZFh0TVhBcC9R?=
 =?utf-8?B?QkR4RmlnVlI0T0o3Ly92Z2VpTkF3d3RsL0NBenFob0JmTXVBUnNCQnVXTDVU?=
 =?utf-8?B?dDZwWXBHVzZWVTI3T1diN0MzZXF3Wk02ZHl5d1JNbGtadW0rTHRMUFlEOWRo?=
 =?utf-8?B?NmJNTThVS3I1MUhyejZkWW1LaTY1c2dVaUd4SUN4dnd2RDZzeHgzTG0ybE5H?=
 =?utf-8?B?bGhQR2ljcUxUcjFtVW1GNG5WdGFGdHJTM01ibHlLM0JFNFd4V0dVbmZvLzhv?=
 =?utf-8?B?MEJzZ1c4MWFiLzN2bmtuM1RCVFBkQkFmVGpKbXY4TXZuSWt3WXo3MFF3a29t?=
 =?utf-8?B?b3Z1cEJibERkaWF1TWF1NVUyUzFXaEhzc0FkN2llckYxRTZ1bjZiNFp6UDA4?=
 =?utf-8?B?WWdFa3JDQ3JOTll4cVRPT1ZIWVF1Q0RaUnA0Mi9YWDhnYVJycjcrbXB2dGJP?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df4854e-44d6-4091-8b66-08ddf9d65b65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:48:41.7551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+zvzd6cPpiHE3cTK0kRfM262hgq9CNtTWtRs0rtFR0ZkHTQBE9D6Z01oHnR8zW6lE8VTaeZnXXjBguzMjeAoMsm6S/DXF3ranYRqCha0nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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


On 9/22/2025 4:40 PM, Jani Nikula wrote:
> On Fri, 19 Sep 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
>> Add HAS_CASF macro to check whether platform supports
>> the content adaptive sharpness capability or not.
>>
>> v2: Update commit message[Ankit]
>> v3: Remove \n from middle[Jani]
>>
>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
>>   drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
>> index 0c7f91046996..bc6a041cec13 100644
>> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
>> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
>> @@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>>   
>>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>>   
>> +	if (HAS_CASF(display)) {
>> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
>> +			   pipe_config->hw.casf_params.strength,
>> +			   pipe_config->hw.casf_params.win_size,
>> +			   pipe_config->hw.casf_params.casf_enable);
>> +	}
> This breaks bisect, because it's referring to things that aren't there yet:
>
> ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c: In function ‘intel_crtc_state_dump’:
> ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:378:43: error: ‘const struct <anonymous>’ has no member named ‘casf_params’
>    378 |                            pipe_config->hw.casf_params.strength,
>        |                                           ^
> ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:379:43: error: ‘const struct <anonymous>’ has no member named ‘casf_params’
>    379 |                            pipe_config->hw.casf_params.win_size,
>        |                                           ^
> ../drivers/gpu/drm/i915/display/intel_crtc_state_dump.c:380:43: error: ‘const struct <anonymous>’ has no member named ‘casf_params’
>    380 |                            pipe_config->hw.casf_params.casf_enable);
>        |                                           ^
>
This is strange, the patch where this was RB'd was not having this piece 
of code [1].

Seems like things were moved after the patches were RB'd, without 
mention in history :(.

This indeed needs to be re-looked.

[1] https://patchwork.freedesktop.org/patch/644360/?series=138754&rev=11


Regards,

Ankit

> I thought about simply reordering the patches in the series, but the
> patch that adds casf_params depends on HAS_CASF() introduced here, and
> there are other similar issues all over the place. I can't merge this,
> sorry.
>
> Every commit must compile, no exceptions.
>
> Checking this is as simple as:
>
> $ git rebase -i drm-tip/drm-tip -x make
>
> with whatever remote and build command you use.
>
> And yes, I obviously do this before merging anything, also no
> exceptions.
>
> I'm more than a little annoyed that there have been umpteen versions of
> this series, I've been incessantly pestered about gathering acks and
> getting this merged, and there are still basic things like this that
> nobody looked at or cared about when I'm on the verge of merging.
>
>
> BR,
> Jani.
>
>
>
>> +
>>   dump_planes:
>>   	if (!state)
>>   		return;
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
>> index 1f091fbcd0ec..157aa0b8f36e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
>> @@ -144,6 +144,7 @@ struct intel_display_platforms {
>>   #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>>   #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
>> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>>   #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
>>   #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
>>   #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
