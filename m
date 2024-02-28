Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF086B322
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA710E9F6;
	Wed, 28 Feb 2024 15:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ7VOY95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA4A10E9F4;
 Wed, 28 Feb 2024 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709134117; x=1740670117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=haE4SvNZhX9U3JAZiWE3ugR6L7k9VJTo94pROwGWI9E=;
 b=SZ7VOY95GlaJwijp59AHHKJDmbuTEEFSBrMOPTCWBVin8DKmvQI1jhdO
 6sP10yEijszMIdA4XcWSYuJMiqCxYwcPepyIoPp2lr/LT2/dOslyP7qRL
 Q0esAGPGlS69SpV8z81iWo52ZRRl3dzj41/dCF/Yyx6zJhY/acVOcUaH8
 hMQQzWRW60z7Z9ZX5znSoY1TbHDr/C2foD2h9ykh68v4j5W2tVd8vnvTJ
 hjusrH5HjUmTo6lmuuVuGU+M7tzW+zduJXfCir+RqFCbqU0E9pbCsA1MZ
 2OjGbYR/UKVdYTGzhP+otj+e9vFo2yp9lT8BUMMb5iJbjiC6mZQ6GRj/4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7362611"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7362611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12036789"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 07:28:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:28:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:28:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 07:28:35 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 07:28:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaErXErDtIP6VoPsSnMeVtmpKOLdjbYly/ccLbP/wIfvFPDMnlKut9pJmsd8sQI7p6qPSa9GhfRZzWqCq3NAI+MtDwhfMank1MtW4XBVWUvWVULEPXspMYHNkhzd6Be4HMII4tRot4qZa4WdEn8RKVJF0AAMBn0/R5xpJLAnl3ZOAs8JyeUPrnKS1TBNcFCU0r5KTQcJI0hp1rRCmt2ZKtypBPQs5jX1uCYH0V+pXQIAEYgkT7S3GunikRmI8uUGmljUvQZS0ijVa6H637LU1aDNVqUBlz48CAXlEDFKeEWnnIE2UlZqBS9Mn0L1bjS9O/qRXZZgHqJpAbE4nesKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmyFnVn12TZYu4e6llCvTtiLbWZZgIeUMfYpXSmB/l0=;
 b=iguzc7qe096VScJZ1oz0ZYCl3X66Hk1k3tz6qQ8M5Cvfoa8+GIKm2BjBdUYa2UW4QU6WWsvL2HiEceBC2N3VFGTh3UKSJVecgl6c1Js3R4/TbrsT5ooY1Ld5Wd3/x4BT9PLvuM3COFx67PayOYFDx++5F/T39nlogX//Dq7vo5dSLWAftn/VYopAPQt4KzI236cvjQ3m8QoZqBxax4wXcwNIWt5NPXqAJ7Wbl/q3f19lhE2rZhWyvFbRa11cHvBoh1pG4gm/LsCclwNbfTNiE1rmxdAzp64HAjKVyhRd0KFbncKzkuUnwYvDZZ0r7ZNHsYt0j2AC+/MzKkcusQpdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 15:28:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 15:28:31 +0000
Date: Wed, 28 Feb 2024 09:28:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Arnd Bergmann <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] [v2] drm/xe/xe2: fix 64-bit division in
 pte_update_size
Message-ID: <zft2yp3y4gtqrypbvs6qhuqfpkctitxyg2bbmnb7omk4nwv6nb@wkusd6zjwx4t>
References: <20240226124736.1272949-1-arnd@kernel.org>
 <20240226124736.1272949-3-arnd@kernel.org>
 <kq3cpbz4ctqvfhtlh7f7wxd7ub3izdjovhv2jqkjasre7u6y2k@exaw42ber3f6>
 <0c6127da-53d8-4c37-8337-e64e3e91bbaf@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <0c6127da-53d8-4c37-8337-e64e3e91bbaf@app.fastmail.com>
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: c38970bf-620f-4b73-3ea6-08dc3871eba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eybQJGdHJa98Dzfd0ratxy/hPNRow5AQ2URB5LObjqPStFk2XC0NwF74PiD+BarQgN68ZtUWRtJ4O3fvunmA2qftRnclKVTcVYy8x0i4HZNc5myiqiMMu5+k4oxk6dVL3PBzYEaFOVBc/RBV0IrggAqHyfeTtyvcbLu5/LZybgW3QdBCefBeVnkEhDoNRta0M/weUQLax/g585JcK/1be0pNOet7J2FhQLCi/ogMDDQQZJMdUEjg9dZVqfxyMXZOxp0ToruWHtac7gpMrkUdAJvf6/w9eBx643gkY/Ow+yL0uFPX8qkiA7XqWQzFw8WPZ3a7+1YIwjibiud6SFYJ+LL17x/dIjd6OWFQTgOtM5PztcBGFhTi9EexZMbcHLDi3WKMTPRIFAFy0sz+wnvjmP2sy3b0ake7KBxvPQbl1/hOdKAtBixr176vektJCir4zc9twYFno1v0ClM1gwtG3khWJQ3Sdf61T5ae7MS/B7/BbDp+T8/HmUjY4xK1/NZvKEULbna3y/VX9ILf4Y2zkokV486aId8S6p7HTTh84HO3O9cHrNXNeIWsnRr7Q7ZU6jPNJGJiA8g7w4szyYH9OB93C5ICUpBwixSwGHGLxewypNK8Jb3myi7L6EMBC0dEf8fQkAiHNrw6J2JouTnPuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmzF7+lZ3QCjcOhUdnnqJdXON+IGJGLCpuKuTXn5Wq0pPXgdMv7L0oJ9MfKO?=
 =?us-ascii?Q?h7B4O5ZZSLRqZQ8F8GG3ydPCcS5y9qrLzV1cOMFacGg4ymxFHdhP6JhdA28u?=
 =?us-ascii?Q?Q4DgC6bHHMyewUbc11meAgisYaemhVhmT5axfBVf74yqYRC6afb5Ao/hP/n/?=
 =?us-ascii?Q?7kOE0iDX+OHe4jm1lRag1cClfzQJgGSaVcRoHFTh8oabQUOAxvxG+rM532Hl?=
 =?us-ascii?Q?x/q8Gp1tBR0uGot/yTPHfiXXYZL/xi4cMU5TKEheSoDHuvJcKy5Fp/9NiN5F?=
 =?us-ascii?Q?5rKIDaZvIbPbUUuU6C/zTeoZEczUO3OnhomBh+JH+ig9/J2YmkyZccjDkvMB?=
 =?us-ascii?Q?qtPsW3v3AfGuAL3bmFZCKbZZNfeBmnZxLhAWzXXCw+JXbE3e9CwqgI4ghmtR?=
 =?us-ascii?Q?8HOWZItfJeHN6UJnVs7nsM03W37VtdVTB3tSY8DSDv3S7dV8/yXmUHS/nf2k?=
 =?us-ascii?Q?c0i3mdGgNnpGuDTFl+pUmt8vWLoO2HUAlWW4jEnmkPIzRvyqz1Dum943xbtT?=
 =?us-ascii?Q?rfmrhbjp1PBLCthLdbup2/dSdPnFqoyzhq5XPpDSnpHmdY1xl8hGsuNpGKjJ?=
 =?us-ascii?Q?vHSjBlCQ8sO/2RHOc+FiJqIc4VCcj6KqWdr3w+oIJVHj+u6M8jj9Q2d2lXyk?=
 =?us-ascii?Q?kJKOwiIHHqjA1oajLviU9egytUoDtgZKAmLeDDFzBkrfg8eXL9030VyiRbKC?=
 =?us-ascii?Q?Q5s8i7wbsgbTiPLRueu1BLRf4TtvyOZeK5guWS3HQHC2Dh7jBggLK4m1Ce6v?=
 =?us-ascii?Q?EKSsmg4WegsSmpcscCyyz2UU6aBRk6mbasdai8QnRgqnm1HFAJTq4V1rcWAw?=
 =?us-ascii?Q?v24vcou86hD9CpPnnrUfNdiTJORrP7V3iIt6JCO0j3cshNb0E0Eq53sHOO4t?=
 =?us-ascii?Q?hiILpGDqAbZlzE0CjUmJKudyFOekZjV9guJdkHdcCxZ3RumHul27fYj9PFNp?=
 =?us-ascii?Q?NsZ34kvPDoGnZjIqZ1udUFvGgVVNIJvwo2LudSKpluJvQoN8oEjRcNgm4jAy?=
 =?us-ascii?Q?tsnNkbbGX/BoUKmbNRrqUL1gIbHumtjY2T0Lm8abQSclfsvzFLk7m/3DuzmQ?=
 =?us-ascii?Q?WucNTkQoSDET9vJ9UxNsB23emB1DmIyXHqU8XIXJ3yJtLYpx+IUgSoHW+N+q?=
 =?us-ascii?Q?7Anzk3j6niZ0pSdQk5oMnVTqQGKeT+rps2UMaJqrnUT3bTwb7Hr8f2OA9VqC?=
 =?us-ascii?Q?S42BAI2dnBKhHapUe6eIxmvYNBgaIJG2TZ+QIhntKEhe3l1v4wqVTGxKdZ0n?=
 =?us-ascii?Q?rjVgLfwkjJkMkvN0tLYOu9jzd/D4VOPS3gvVJ25achYEOT/WaTw5tgTviqSB?=
 =?us-ascii?Q?nrz3PB1G747XnVsBj69naYa4NjpFf6WTd685R/79Z36QBDrfhBPtkDFYrP88?=
 =?us-ascii?Q?u66U5r37J7b76ubhxACXkjULddObifi39wt7OwgHQfpIKDS8TjvtD7rWyvO0?=
 =?us-ascii?Q?RmRErg+H/qK7PES0BWuo3qCMKBDA8NbO/ghjUmzhIPNfp7Y2LH18fv4pQ8jP?=
 =?us-ascii?Q?Mg9TMWHfv6z7BkdztnQA8H7t7Rby1x94/leQitG77atr7wzccx6IUuGXz1oc?=
 =?us-ascii?Q?PITpjGHqBa40fhxAYTj3zwTr7r/a93iLw3/gOFlJdKRc0gatavc5YvYg9dZY?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c38970bf-620f-4b73-3ea6-08dc3871eba1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:28:31.7194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucpV6zu9VfGwvxBRLJbASEi9e2fFoDepJs9XjA/rILvvJ+wu75pk5AhyVdvh5PR8g8zbn5NpIlRjR8qL/L6uSnQYikoItBTnUAGWUXqDa7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

On Wed, Feb 28, 2024 at 01:26:29PM +0100, Arnd Bergmann wrote:
>On Mon, Feb 26, 2024, at 17:40, Lucas De Marchi wrote:
>> On Mon, Feb 26, 2024 at 01:46:38PM +0100, Arnd Bergmann wrote:
>>>
>>>Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
>>>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>---
>>>v2: use correct Fixes tag
>>
>> but what about the other comment? How are we supposed to use
>> DIV_ROUND_UP() but then in some places (which?) have to open code it?
>
>The problem is not DIV_ROUND_UP() but the division but the 64-bit
>division itself. There is a DIV_ROUND_UP_ULL() macro that would
>address the build failure as well, but doing the shift is much
>more efficient here since it can be done in a couple of instructions.
>
>> What compiler does this fail on?
>
>I saw it with clang-19 on 32-bit arm, but I assume it happens
>on others as well.

somehow it passed on x86 :-/

>
>>> drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>index a66fdf2d2991..ee1bb938c493 100644
>>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>@@ -462,7 +462,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>>> 	} else {
>>> 		/* Clip L0 to available size */
>>> 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>>>-		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>>+		u32 num_4k_pages = (size + XE_PAGE_SIZE - 1) >> XE_PTE_SHIFT;
>>
>> also the commit message doesn't seem to match the patch as you are only
>> changing one instance.
>
>Not sure what you mean. As I wrote in the changelog, the
>second instance is fixed by using a 32-bit division here,
>which does not cause link failures.

I missed the type conversion to u32 and was thinking there was another
hunk missing for the second change.

all looks good to me now and I will apply later today to drm-xe-next.
Thanks.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>      Arnd
