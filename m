Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A7A25C79
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 15:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FF410E511;
	Mon,  3 Feb 2025 14:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoOh24Xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7417410E50A;
 Mon,  3 Feb 2025 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738592959; x=1770128959;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DkXIGycc9cU7OPd/FgQkt+3q1kcvf2e+tm7BsdN54xY=;
 b=UoOh24XburOXhvhBllxrnYAo+GaQ1gigx7DUwF62of9y0AblW5hdCIvX
 /ZI8pe0UV1J2YyQnz16w6LFApjbsYUB0ELmLMKWcx6u6bDIcn77gNqijI
 ODefm0oAeedj0A6HqLjGEgz0TXu2lofnyklPT7fnIerJM7LrvB+Se1Pha
 8JgMPucwi4hkoWGvLslIehXXmEgvjL2fROhSV1Hdb3pus+6CCP20a3tEa
 maU5pyav+eMsmWU6zOR/SR7iGgoHeePNtp5JIz8bFMHqiMXm4VKB2EhIs
 QM9ivEWX3yylbuRAUGYfFLj9+ZhP5tLfGGiXtdBzjKNaCohEy/Y9Go7X1 A==;
X-CSE-ConnectionGUID: 1r9YLN1kTX6Vn5iY/vnzCQ==
X-CSE-MsgGUID: nf70UugwRsW0vPBdbcFn7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61556324"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="61556324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:29:19 -0800
X-CSE-ConnectionGUID: u+cV31B1QTuahUA+ODVAeA==
X-CSE-MsgGUID: dw/+B8KzQQCxeD9rZTa3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="110251732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:29:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:29:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:29:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxmTmL7wAzIj8G1/R8WfJDL1w4uOEb/vFsdijbIjIq8+YL/6MUhdNpl9pL4rsnDdjlWEVOLIhohsoax7WnH9c6f+GTdQlwmM/9MlhbJjw4U0nC2+3RehtIdw2U2AXjjdfM4OegysT1sNiDY4gfv6ncJZq7j8IEZLec2h4rXmNAN8ksF4WXOxB88f2fYfzqfhvQ5CfHp/epTl+ISMJy+ZHs3EjTFC3VUFpQJj+WbGKyo/gE0xaBPCeraoJtkCjd1pLNK2KwfeCyTE9GSMofJrugUHL/MufBWKUnK6Tr8tiOlAww8cQCgZvxKdfvmwDkTeWH8WI+pUib72tWandgLZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRP55TIIm8TcsJogeDTSp1yMhcjS9L5cCaOVhj+uJP4=;
 b=ujUiPjO7XRBTCzD26AgNu6sNNsKwg/LaGmjINIm9rG6OE3yvXKfxh+74aVej3qwKnBxCU096IMdTWlBluh7aDPvLqhulrlu7ePaN9GjNkw8CKnl6I9Y4ceokGdVVvIPAHxPmVysvmQh8ffl2TD8h6bRou0vlQ2KCB7Htoem6GyZQGxfSLe7uUhvlnfZG+Dnei8OHugL8xJdnH4tzXZMAwGdpttov+OZM3Hih5rxGHeM2KNBQQ9G7IA+yN2WdpspDnQEyQKfGeFh/Cv+l0zpS7FkFhEUaGzfjBF4/d1a/98VjeaI/iLIrMR6vnqa7d/AGLzQBtpUR43ggskmvyVeANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 14:29:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 14:29:14 +0000
Date: Mon, 3 Feb 2025 08:29:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/3] Fixed-type GENMASK/BIT
Message-ID: <7n656v4tdwfd4n4m7ycrcmxarwpwbqgz6cogtzu44edaqwxnnf@nwts4kf2gsd2>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <38f88be1-1d28-4dbf-b123-d9956f3b49df@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38f88be1-1d28-4dbf-b123-d9956f3b49df@wanadoo.fr>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c28834-2ee3-4e8c-76ff-08dd445f2238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dK8n4Yj8g+u2dJ5PkG0Nt2it8OP/VnjHUJOG4m7RJwNay78xrOlQCF5Zlv?=
 =?iso-8859-1?Q?TYWQSkNZhvUDzS6uIPJ3WEmW48J3S8d79xiuTM9mH+3I/rhD6Im9gDsY66?=
 =?iso-8859-1?Q?J3vSSHZe4kMbd36ANS5Zox9MRhCUk5ty61d7UbghVBFuAJh5ZsES4H7/qV?=
 =?iso-8859-1?Q?WSU7V09t+mRm9V2CR3XAGEyd0kj5lVpW3NlIvhyRJSc4BYXRqPZPtntFst?=
 =?iso-8859-1?Q?dOAOtDXfJbUD2IMhCcqpsn4i0Ud5kcZZ4gIVcJSr01yWzMsHY0tJ5D/5sv?=
 =?iso-8859-1?Q?JADDwcIwikEW6Z8jX53sB9tqAdSy81xwV3A0CVTNnw1jQzvUw2DkezIlkn?=
 =?iso-8859-1?Q?GGQymJDgCi7lcNc00xqOPdLfuXd9oyKgtWmKnpxH8GCgFFN/oV1smMA3FR?=
 =?iso-8859-1?Q?PA1cZKhNOagJBBQj70CN8PttcNV7zUjEZ6benQIJLxCmU0wzy9Te+nR9lB?=
 =?iso-8859-1?Q?RpRoiJGVJPLSRuUbtmoThTh2TO8S8wd3XddqkcSsaNbIO7SwOi2y30whnt?=
 =?iso-8859-1?Q?GdLyr3dZ7txrNSceo0UjP9sTNIST0ggDqUBXqB2Eoz+nEFkTG4h1UBjDYp?=
 =?iso-8859-1?Q?0NHD9UDICn0qBo0IIPPTl0TpGDDrm/PktJ4k4QS3jG8WJBu0IQ6GEMkdQ6?=
 =?iso-8859-1?Q?pW2ULDIZkSGeOyjO9j8tIRgZpMTway3KtvQRgvQmm73BlSUBsgqYm1+doD?=
 =?iso-8859-1?Q?q/frfiIXgM1T8zg5OlUGZyZs7PCl7ohlgTxxE50Mlb8mYoU7lG7Cv3RK/E?=
 =?iso-8859-1?Q?4XhuxRic01859N8yMQE4ZXB07j/GKKHD/O7Sk76JMImrOQJHpbk+nsIRNB?=
 =?iso-8859-1?Q?2kvfCML6DzwRop0HVqPqlCQGG/7rvUKGXlYM+izcJN/Kd6Elqs0KVd5Y7h?=
 =?iso-8859-1?Q?FUS/glKC5nz8A/2ZB55SjPbUQX0Nb598ZydwmJb33atw5j12PLxgwqaImp?=
 =?iso-8859-1?Q?KQTGsBqa562zzc54rFr1pRbVNUX2LEXcmSlkqHcDooH2lxNXGPSBQ532Ie?=
 =?iso-8859-1?Q?I4Jdmzq02GPZLJraRsb1e/YucZhQQF0EOPEP0xZcR2xsIQKAEAl93YFxtE?=
 =?iso-8859-1?Q?bIV9W9OWC2PjDnJ3T0+XKNtH9x3O8QB2CKxd28fZstT1YWezBNR4BSjFqg?=
 =?iso-8859-1?Q?dBKY5xID13v2+5NUFC6WIIEFfe4FJckgPAN8bYZjTEw701BNg1A3HQXHgI?=
 =?iso-8859-1?Q?zCaK7/WfwwBp3HJkdlBcgUv2Svk5KHyz79Hg867wErO90pUB0NoJWL9eCI?=
 =?iso-8859-1?Q?gaKBSnWOicTIrI8ZQsQENxVxrPr8Fn15pzZp64zFF/9VO63FVAomn8mIMN?=
 =?iso-8859-1?Q?i653mNbA6cRgzoKkop70n/UlWednBCiPAX+OpSMMPIyGs+BLYz/Ga43s4k?=
 =?iso-8859-1?Q?yPUWxgcW5O/CBvRTO4WJVTMVyd+hcKPZWzdnPJkebCdgjd7Ouk2OwpOwHh?=
 =?iso-8859-1?Q?gNW+CU/7a0nBpIeN6aKt1n+DsDSQT7EW9cIiSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GkI3ntIVqmzf+RffVrVXk7fOqpRwXZVdhl9jGFqYwn291PTGUp3lZiRipm?=
 =?iso-8859-1?Q?umlcVoNyLfpG0t9ugb6O0e13b0IH7Z22tqFy1Q/95iMR3mliYbJtIngQcH?=
 =?iso-8859-1?Q?g/T/7J9beW+D+rbbTha+bwZuTRI3bkZDtCNFD1ybWfDU2o9sDMz9MEGHgr?=
 =?iso-8859-1?Q?fYB1w7kTHvK46To5xsdZILe84cYbP801pNztv+ii17Dmtvnzs7IwXhXGsN?=
 =?iso-8859-1?Q?L19jSEuY1Cq0mI3qH2LjtYMMLg3g8a1kaaSiq+TPGLR9RfiAN7UiPscXMt?=
 =?iso-8859-1?Q?+UCihpbQ7Dm3FIHrnCp8q0saZIFIeknC4l6MsmVQnJZo8S5pIB2qKomB/7?=
 =?iso-8859-1?Q?LXWTOEn7iTpi0MGCGGXSTqXAl07oUNdKGidrcQVZNrKRAcrSVcMyVJ0vqc?=
 =?iso-8859-1?Q?oZOL0LWkjbNWP0eI7m/DiNx+UgxIkxaCQnsZ4rmmy3ygH7WSpjennlaVXp?=
 =?iso-8859-1?Q?oYOfvAGRMSj+JIBHhoIZL/YpJY3X2gIH1GxDblI+rl6S3KJENMx9izl03y?=
 =?iso-8859-1?Q?KukP8CBWHDxAIVsuFCIxuPncU/aJdcMyje3R0u46/dvH3YONZ5mkrNYQ+L?=
 =?iso-8859-1?Q?U222WwqTdaum7/inT0MeXYYCUCkfXglf4Lyvsk8S5FHpYq5rBjFpowGKjY?=
 =?iso-8859-1?Q?3ScuoL2Bpq7QI86TPU1daNg1GDWn0K+aZbdgO/4qSWeW4aJLsfxwBJd4tj?=
 =?iso-8859-1?Q?v+terk1VXe6yw2KyXYqOartdcmNXeGTQKQjrRer9/lUGrcj9fBX2VPOcr6?=
 =?iso-8859-1?Q?sayQGmZCcUegSVboaXBKSWLkP+bcEt9ng52M3kFHCM0YKQSBReOqF6a6C6?=
 =?iso-8859-1?Q?HhQkZ2p/NwZVJAB3GN3juxo0Zn4goPEINei1+XV0nopEQoC1Ye8Xlz1kVc?=
 =?iso-8859-1?Q?sZiKYm5zGNVDEZbm7Lf748V54ZhKEeSMr0BYafZAKtlsN8DcSottqzsNB6?=
 =?iso-8859-1?Q?ACcaXurvYAcT3kPsc+oX5OMrErhonUpWZvXWFBLU4H12+2gHmWXg3Zl8j1?=
 =?iso-8859-1?Q?nmHf566kM236hxrzOt+2n88jcjct/zNHGA7FKbOYqy1Pq+6Ia1ttd+uMOp?=
 =?iso-8859-1?Q?x8kidHFbkIDWsEnYpX8tDvppBgkmEaXmR3J/0xfqYmCGybNGWj2PHlcdgT?=
 =?iso-8859-1?Q?F182u+QgrB7r1ubL4YHktOm1Fd0frimTFuuwZI7YL/EOYwO9Deu5ZpMmLL?=
 =?iso-8859-1?Q?uKhAdr5j9m5KtD9T9FbhR2eaeqQRspoXMNzqZh9hAQPxYBquvM6ctOWn+8?=
 =?iso-8859-1?Q?QYWwErLMcrkGZCPhuwAERpbfpGeKISIhRjnW8ubiKW75JOSQRRtty5dtIi?=
 =?iso-8859-1?Q?0CxbHMyNw3k++GzLjl+kmglreqelBWkWGhB59h97UVHJhjx52n3C67aeXx?=
 =?iso-8859-1?Q?X4VGTf6by7FOoyvzuIH2bTPLHcDdyJMwg0xG5n1PNYRzDbkb6nIcmBtU4B?=
 =?iso-8859-1?Q?5xpk8sm5tvYdKSb8B1bgGs+DTBjgLbi5os5Ly9PPVgNtI12ORDIGwSLyT/?=
 =?iso-8859-1?Q?pVH239s9YKZ+zMzuUuesOFoRJxjw6yWglbPblmiDcZB3fQGIz+O4jAsBF5?=
 =?iso-8859-1?Q?ohRkYWgPkwlv7FeGASw164GHZhsaLlstCeioYzesp4PB7tdUk1XUhDYepQ?=
 =?iso-8859-1?Q?x9YYSwUxDZ5Ps8WKdTSacYfiify65OBS8sqn+5aAUhCOk0hn3IVb0T2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c28834-2ee3-4e8c-76ff-08dd445f2238
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:29:14.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVc4+fcvytgUnjEoFfbBSDjVTJipbf5eHoJr8h/AssQZWlGzDXGQu/REBNP8vSphBbaAhLspAXMB9/x+YCFpB4i+bgV5x20Rm8d83dFZQT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
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

On Sun, Feb 02, 2025 at 07:40:35PM +0900, Vincent Mailhol wrote:
>Hi Lucas and Yury,
>
>On 08/02/2024 at 16:45, Lucas De Marchi wrote:
>> ove the implementation of REG_GENMASK/REG_BIT to a more appropriate
>> place to be shared by i915, xe and possibly other parts of the kernel.
>>
>> For now this re-defines the old macros. In future we may start using the
>> new macros directly, but that's a more intrusive search-and-replace.
>>
>> Changes from v2:
>>
>> 	- Document both in commit message and code about the strict type
>> 	  checking and give examples how it´d break with invalid params.
>>
>> v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com/
>> v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com
>
>What is the status on this series? I read it and I think this is great.
>So I am a bit sad to see it stalled for nearly one year.

yeah, it fell through the cracks after some regressions showed up in
linux-next. I'll take a look and re-submit later this week.

thanks
Lucas De Marchi

>
>With the -next development windows opening very soon, wouldn't it be a
>good idea to revive this topic?
>
>
>Yours sincerely,
>Vincent Mailhol
>
