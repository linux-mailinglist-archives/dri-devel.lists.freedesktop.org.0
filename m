Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52E860A19
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 06:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4375D10EAFE;
	Fri, 23 Feb 2024 05:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsYLGvsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C0110EAFE;
 Fri, 23 Feb 2024 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708664411; x=1740200411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gh8fMymxW8zAqfjnXoXhzOr2reTUfUHKzgPAUg8RKQg=;
 b=LsYLGvsm639k4XAlXpK3MOa8xpbhxspke2Euz6ZqQReRnHx6BvK1/sHH
 Uoc1FY6ztojFahUcgrQd4lt1pFmDswTDXfVfrs7sWppPpT9n5Mv0TEtHN
 /Fwf7su5UgE/ZdJ04WCStO1KcjiCi7skRl0QAqErkmWfSSUcXFyyjdXJ+
 th9kDTzjFdPUUpyMdwiO/GPvyb1zSMVfpMzwiuwwTp6tqWmG6D/SRnrRa
 HNf0HvhXLV0uh3MDTfeV2/kLDYOtJJbnKyMZDIBz4BC2dKh0TZwxd5tkd
 dFqpjUu870sLDCUEIbrIG9oV2vGJvIl2L475xeBbcSQi5Wx/vZC8+3eEE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14389842"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14389842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 21:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36808374"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 21:00:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 21:00:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 21:00:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 21:00:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 21:00:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agd3VquJXn1fLgm0FiAYdwAZ+kkpgqEd9+FXt2607gtKQxHu6yoLtnJcWk85HeuY7c+mahsVS0pM1g8Vvim6kJSpagn4tPE6nBsx5tHq6JRhBbZ3mwYTwv8MIufXCSPIWLPzUVVBAwyUt2V/lpnmq9xBRobYo62rp9GQovuuk0NkcL/0VkW4N6T2rZj4vJj+5hzIcRgZk8xWWhRb6PNVMEz2YCdu3nhOP4JCViXQ/q0+CrMe12KJOKfo0KrUYEkuwIUZn4EPSpqAaMBkZbcVpeLa8stgjDlAIGvbG8aWVjIXF46KP84PrvUWCY8Rapa0FWSWz5lOgCcaKMNRjCAVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGq6HzXZNqpirI+zzsugW7kJI4TsGnG2e0cxTXBZMWA=;
 b=W8xoIIrY3V2OAyjh7aJfVBDSb1PucHIzC+8ZFb3xyqsrZJrW/EToN5pCj+YZ2uNqZjJgq5KKIAKIDvN0QfytbIC2LQqKY8qLEUkdlKMrojs5Ma7b/DYKv2M8Xd0Oxf4ksxagy0HZpL9o9z+Kka6WGv1Thdus+d5pCjcQ4Ezkcrek4Ve6XgRtjlA/pVyPP54zQ1xn0b7u5fsGLIg+WOE3KfxGC/mNga/CYq67N+MuNBwrq5C/Jzmi6Q+uV55N+nGV9Jsq04W5sIjF1tP7pGD11qtU8P3OYcSVVP7HZn0BBWnn4R5d7tVJ3irwmYYMUCJwJe84PAV3MbEDnLuwEHJWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Fri, 23 Feb
 2024 05:00:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 05:00:06 +0000
Date: Thu, 22 Feb 2024 23:00:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: Erick Archer <erick.archer@gmx.com>, Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: Re: [PATCH] drm/xe: Prefer struct_size over open coded arithmetic
Message-ID: <qoh3tnyvphqjilg7sz75fbjxzvjn6ey46hcvk3rhiaay3bcfmo@rzbvamf67qvu>
References: <20240210141913.6611-1-erick.archer@gmx.com>
 <30715dc4-3285-4f4a-a041-a718a8509721@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <30715dc4-3285-4f4a-a041-a718a8509721@embeddedor.com>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0d8df2-16bc-4bd2-04fc-08dc342c4d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qi6r2H4vyLqvFib486o8Ua+FkwnAIg2/rh6OKGYUE/LInqEbtWfOpxn+f0kYzEutcApspSXShms2/54xjZAKXKQjHRwxqiZu5qt6hWAmMtV8jqTOvdC+QtH5tg3q6HEbigM1pRmy/D9j0sonmu8FYvnd/K8ld+x+gTUxv+XmJCnweuS8iGw8ahi4a0/iU23gf8RdXmug+CP+ECe92UGjZ3x3Nk297+ioYSmwnzrk/HC+Vh9Xm/co9ARiR2qTI19gVAgAoD6SKvPH900ArZZNrmuKhtjdalEfWtWC2ixyRnf5j7etyDftvJocRR6Tqw/DkRUIaySR+XsuV4dRVUN6WRFOo+s2LqJGWk8EsCs4b7BqAtLdPDpE7Y7J7gRnvKvIaVwFXBoRt0CcN/oueDXhMfOkNEbu4Dmux8Oj2pdTx795sm1wYPtfvD5mDI5HDOdmi0NmUaLBIO3J/WZL00VdMQtPpCjza25jF1sePRMFpmS8Zx6j9e6VR/XZtwCael1QohAsqc/gEb3rMFKQTBOjqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z/hDHoExQ4Sd4HqUzD0q56F1bK1iR4rWjHCvqEUuRVWUFrx6Jfpq06CZLU4Z?=
 =?us-ascii?Q?tcBAyF3zFszs0XXC2kgy0BbBlO83sMi1WztGcLAwkrp5wXC1lc6RXjUgOwaT?=
 =?us-ascii?Q?l9gNLnb7cmW9WhOpo3UuiL7iBKlw3m1CgW3yHxa0W2mJuwP4n6ebeogTLb85?=
 =?us-ascii?Q?ayt87VR4TcOKk03VqXI4uitARba2uZ5trXYK7fbzMSLMa8UJgpJp9AkNv4Nb?=
 =?us-ascii?Q?eIMhHIV308j8oMiF0K0/IGdTl3L0Txdsx7o+evtOL1VRK/j1vzdu6ihtj33d?=
 =?us-ascii?Q?TrYq/oL8AYqCY5NKra753EsROlSMJNlfWm5kboFUCXTEWUwNR9QR5mVrDVf9?=
 =?us-ascii?Q?YtmCaE1aIQZn/gpW9DYEY9a2A2qUvVoPZ34ZOXRkyJBUzZysUJRyMdHHnMjY?=
 =?us-ascii?Q?907Z4Ckd6bklhMRDS6JqymWFL+oT6Eq2YW57Dnba8iQuhBG+EzPNYlGBWi8m?=
 =?us-ascii?Q?CpJVF4z2dde7EX8Jgo2y9MF4KG/26d7NbQAAikVDLd/+PwaxvKjcmAI018VR?=
 =?us-ascii?Q?wYXIO3yPJvORCmQe28sH8ZJ+lNXv083bDBw5tbGJWRqKWr4H1yFEd13N3/qe?=
 =?us-ascii?Q?LA9pMa9nYIg23JfoWujsTz3X9llmYrF1EIfspX68hdu9Xv2AyOs5RIqDmv6b?=
 =?us-ascii?Q?ckfzkeBMqrEh4XjuasmDu4dtuph3PxITmLeplG+8/2rDiWe/aWXDZ4VI0qxW?=
 =?us-ascii?Q?oytjdB789LeXzgz1KLHCmXXdVcIH4sr/MLyFmkZV3mKFWaZutD9YjZrMx38S?=
 =?us-ascii?Q?Nt/hlDs9ngki1Xky+RP9U4XFZkQvs4b94BONHP1eGSKyKKJhc9/VdCOTkW2X?=
 =?us-ascii?Q?jore9IP9SirKMFjPa521Oh9h9edvLb6E7x/SZITI8ZP3OotGatipK3/cvNWx?=
 =?us-ascii?Q?xv+R46OYEW7SUT2DKNXKD1X6HMQ0ajgYPjVu+6KGbhg0T95RItn5CDzExIkd?=
 =?us-ascii?Q?aQwEORruJeZ6ptTpH3xSPonue0w/6p5SuXzq8cJVSItg3zBcmtTRagMIXIcy?=
 =?us-ascii?Q?amR5z6rqHM5UySOBz04LrmmaPAKBcZoLjbUmTrq4nlSFvvHpHWNdte4/wmHm?=
 =?us-ascii?Q?weaIPzIg3zx1UHmoWsN3KG3ykNXijl2gwQj5SOpBEpH7sL5SFVensxZPEsoB?=
 =?us-ascii?Q?nui5lkHG5qZfKSlR345fZq0VNyC61GDWqpCj6nYtV3g+ACtSGDfWG0UFbopW?=
 =?us-ascii?Q?0b7O4APSQ17tNy8j4OzrtKdJ5fJiBXk2lyuFD1VdwizDwd0fpHgjXy9RBpeE?=
 =?us-ascii?Q?NaeDvisIo6FH/pr9WRhNVRDFrjBq95IMQNPRiIL3RwQGowsZIhISTcyNgbdR?=
 =?us-ascii?Q?+ReZ29l9kjZdMO26jsaFvmwBVPSzHy1DTR1LZyItxtkuhW6Hi5ZtLnsA6gBJ?=
 =?us-ascii?Q?uooulKP4sLpoKHkZEOIkkSyPpzQCJR4KSereF6L7ow2VNfgFsmVogYrqizy4?=
 =?us-ascii?Q?XUu9PNMuKykfL3JV6SebniwZ/WvFS5o5bo7wMDJd9ScUAvpvWe1898EqGaSP?=
 =?us-ascii?Q?l//ELoHOq0lbkopymf8iGp9n2DY/jdw8S6ApdtLCMVq2XqB+BJfI2rXdH2u4?=
 =?us-ascii?Q?/lTA5MzVDY1VQ4z045HziS50dr8hiNuTP0AuPgqj2cAFd5Br4ofIl+Y7Vetn?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0d8df2-16bc-4bd2-04fc-08dc342c4d6d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 05:00:06.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JScZqZo5FJh0qumdNUhUQDxfUwLkFdg4jb7QAHhCK4jkMLqcddijUmQUyGBtQNgts8schxvHTpXw5Hq37TQrQaBm71E8K5AON9iBCLomJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5776
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

On Sat, Feb 10, 2024 at 10:49:57AM -0600, Gustavo A. R. Silva wrote:
>
>
>On 2/10/24 08:19, Erick Archer wrote:
>>This is an effort to get rid of all multiplications from allocation
>>functions in order to prevent integer overflows [1].
>>
>>As the "q" variable is a pointer to "struct xe_exec_queue" and this
>>structure ends in a flexible array:
>>
>>struct xe_exec_queue {
>>	[...]
>>	struct xe_lrc lrc[];
>>};
>>
>>the preferred way in the kernel is to use the struct_size() helper to
>>do the arithmetic instead of the argument "size + size * count" in the
>>kzalloc() function.
>>
>>This way, the code is more readable and more safer.
>>
>>Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
>>Link: https://github.com/KSPP/linux/issues/160 [2]
>>Signed-off-by: Erick Archer <erick.archer@gmx.com>
>
>LGTM:
>
>Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

applied to drm-xe-next. Thanks for the patch and review.

Lucas De Marchi
