Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90F676A90
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 02:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B332410E16B;
	Sun, 22 Jan 2023 01:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7DD10E0E6;
 Sun, 22 Jan 2023 01:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674350898; x=1705886898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cSGkVKhiR3sa71sAjY/zHZc7iL6LWyBfIPDEzeF2yU8=;
 b=dm/NlkK3pFX3ta1Z8xj8jEaefBZMnZDqK+bw21xT5zEAlzoTw4CLpOq2
 KgZ6CgwdUj2QJ+HyzRSyHXnLdPyQycN35ZPyCq1oneTgilATE1uUMSp+l
 THYNDMKMwOhV/7rw1k7YCtgiGxaoN2W1C+mwyS4ViNBL35ZhFYverayZx
 GtIDRVLqmxDErSkaQ3idsyjWoLzGKT1QHC0g1MTIsS4Pe3VoTYgBpvHPZ
 PNJr1C/n8e29CBW2j2cgfz+I2oKJ29NHUKzIy6ZQok+lv3Zzz6bPAxvRU
 8ytAkQTFy+mtjA/FQ0szVokiH2O5Ou6Pexk/1Gx5zu+JLfTy2Po5ygMbU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="353114258"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="353114258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 17:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="691489948"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="691489948"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 21 Jan 2023 17:28:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 17:28:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 17:28:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 21 Jan 2023 17:28:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 21 Jan 2023 17:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH38Khrwwnd3PZfQHj10uci/mEmsZIl9NdwENR9fsc6flw8520HkDeFtnrId7HHLVs7QiVKozubvbqPj4V6T8FKTS6cjGzK8Y+6E1YHL/jRrkgMCKcK9/jhFlOxHIsiHGJL9W1qazkjcsc3rVoNByUHexnBb+N2XWUaS9sGxSe914YEHSYZ4X6gRjss1JM+g/SlXcRlfmpk1jsO/tEPbY7huveDxRdjwDE7EtbC+8tY0CVH8zzNB4eH0L4DD84g/Le6BaQU1/BoY1iQxY4DS0zOBxL8PuNXCI9A44kGzdKWYvh0xg5UxaQwRpji2Cg5AOrmcVFVWo/xAY0pGFThe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmAni28n++9ER6fVbL/F5fTz7JJWEmJvlPfX7pJvyEk=;
 b=WPCB0x+F/RG5RgEZHVDoJNbFPls77Y2zEs17MQmNPUF31NoD+tKU3q+CM/1kF/0259oY1tMuZkwQVLjsEeuMsl6do9bLud14+GBIQRotLWHIKToKwnIMajQxHo2iBH7zyQZ6e7MEdRSkU2KFlAmZHRlvQ41gGZx9AaxR/3jH5qXNioLoVSzyNmoqbUtgjQX/QnoGx4e6fU3TwYMxkTvBvBzTysEJWTcuZxeffirkljdwSgX8poDkL6isBnC4vAeWlPndlahZE/XzGTcu4G/dWZxpvT76CghdsIHmk9WmmRkM0rb+WtOcrSCB+o/NsyYiRbyMHaKYyPto5pzNdOwMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sun, 22 Jan
 2023 01:28:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%6]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 01:28:14 +0000
Date: Sat, 21 Jan 2023 17:28:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Message-ID: <20230122012811.zd7ujwbsuwpt7wjw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b98aeb-3cf8-4a3f-2868-08dafc17edd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdnKpfk0L/uShFxLZOCrrpDQCe24F+KBQKL5C6lL32URWw7imaKBx2JnXXn2xnTPcbPzw1a5mHuampZUD1bci95UfN7uSmGN5VwHGtjR1QBlDWxCzEUV7JRwILZGcZYR5DWihGzXrDNE932lyu5o3tiwikWosm6eIokiWdCaMKcdI6drgk+vImHnbeT+K342+1Emg3OX43sdcA8tZ0LbESM2ZQb/HZsM8gIEf0wqWEgzyvXEK+n4iLvwMymU+pxFrld0Et6EJuxDr3HVuh+o0lcCx0HwCSkAp2oQ4i0i4zyM/ZDMY0uB9dhjKL5HFYi/zO+PfEJHZvMJQwviUJGvc/Q2x/7u9lXeWMqkcyihXgF2twY6q52nYEvw0MtGM0y3EcsYZuD9E0KQ4Xxk4/um1vS/mMCwEOLDb3iJxl1peLMqPWW3p7WlYCQfcyvgKUIVk80lCqguNzdRusZdCHhSf5YOiol99gGy6BarzzlPNTJlB3ryLHjS4UA26aCmmWDvIt9A7Uj0aRMPgYdLrgC5EToto5z6btGzhgS5nBL9dYIzc3AUnYKyLe8mVaB6W2ZtlDOak7bw7xO9mGZHx7jCzR3i7WDtCb8XWek+vlBxE2LJYOHd0swlJhr/75yVWEzeOEs3p2Tir/y1gEgXYvlsyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(38100700002)(82960400001)(86362001)(5660300002)(8936002)(6862004)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(450100002)(41300700001)(1076003)(53546011)(6506007)(9686003)(6512007)(26005)(83380400001)(186003)(54906003)(6636002)(316002)(6666004)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g6tac2tXSUD7WU1H5s1bRANXnYqgnNNqhEF2F0T+BvqiLADp6oD6A3119BKt?=
 =?us-ascii?Q?JsPgIMl6649lBO0pS+JrFNpN/tDO+SgO804RUVITgsgPxccXEzL2ETqpOIKy?=
 =?us-ascii?Q?G/cwvKoPpn+yZWWjx+b80OIZN1TZcP7DSkUI3PFisC6l5+/TVFtbS19joZLk?=
 =?us-ascii?Q?SzTYcHZLmrM6L+gS5VQ6ngZkGvncQU6z7QmpZEhkrGGyKUDGfANc/KWQTlTN?=
 =?us-ascii?Q?iAEVmQQ3NbIYwmdDqZ+40TPlFZQ7pgtgV7mfiTRIgNvfJ6lPpGv68lPzr21l?=
 =?us-ascii?Q?y4P0gKS+ElkdsX71q0f4qtCSqtouUD8rKotY56qN5y+FAttTBR8oLS5ILsVd?=
 =?us-ascii?Q?D6/rlkYLgXt2gEtl11UAxelxC4xwUkHx/k8O5v+wHkpa3IAwuAEyzVylW77y?=
 =?us-ascii?Q?dUzviI68a9HajwkONdPy/kpf2DOYYAzadzfpyWyYYEVLkyzqA3OrV4RZbYqe?=
 =?us-ascii?Q?O1Nbt2Te1rP4rkBToQqTqBexB1HfHXe/aWoW2VFzBRnE8JGsqlN4/pGoXDRg?=
 =?us-ascii?Q?waDYgemtPRewhM/Cs2XXmZGjsyW959T1vs7loCbk3IZZ1nbSMdBfyQE+1cWP?=
 =?us-ascii?Q?kC3ekjfHuljq7vmydb2QWFkFad7Pv9fitwHon2Xip9nMp1TOl5pYlk7bdF+x?=
 =?us-ascii?Q?oxyzBepqx5OdZDGr2VW0BwO6OfGWOL9ozIhCd6h95XxxSLLccnnnA0dsypvR?=
 =?us-ascii?Q?098azj8gd6UyIfUNaycNcH29sTwujtu9cW+kqhHeyxB+hZaQdaRV7z/iPBmv?=
 =?us-ascii?Q?yGXqmsIcgC63Fn0uuA4UVpSc7ZbVV6cMtpK97th3O0Yh1msd2RmqSyTcNyFb?=
 =?us-ascii?Q?4qVXunMzsTgEzsmtWxw5MzRrVxz9svhsm4ZC7aY1KKwHGdZhrK+m9lXelCaQ?=
 =?us-ascii?Q?FYZ/jpFl6Bgz2MZc3OzL39UEzaFec/hBsn+xBoblKmoc2iEa+hF9dLADpGB/?=
 =?us-ascii?Q?maXmlEvfKhlpY9SfPujMAVrdv+lUtsL4tiMfot7TMLwcKEQpExNaKR0y6svG?=
 =?us-ascii?Q?VoDY3Y1T6r4cEThaaJ+p/30dDFMdSnTRhNM8PMKsxDLepbNd+Nm+PTPSBHAP?=
 =?us-ascii?Q?mkDHnrnv1BvEPAM1quHZih6o8kROJ7nmlgfMhMweBBtmRvHFN3tnUdroHLzs?=
 =?us-ascii?Q?gxCvScG/hed3lwVeSDLM07E/cPgo6c1y9I2Tbk9o+8uIVIa4V08ORvS+jIBt?=
 =?us-ascii?Q?mdxzTAjsNVY+54QaYQOyjl9B1L5kN2h4IP/TgZEQGU+W+7EaP+sraRYCoyux?=
 =?us-ascii?Q?C4BHGCnqoGbFMyZ6WzZmTijs9lXrHTpLLy2i6TzZlRvIp3nRrjAE6PDPlIc+?=
 =?us-ascii?Q?0A23yV7RrPM7nzIaOZ7S5Q8lobYL2W2eyREPU7cjhs3tznN95Uql+0e6Sx7E?=
 =?us-ascii?Q?+bKhAOOV97YAx98nYUJPwjpYRY6xVPHK+pYBZBIqvS6fTddzcoOTuqWQOT3D?=
 =?us-ascii?Q?5mrJumpb0TL8vJCSGb1FYlG/PPSCORZXb7HSXeQLM4UXQs8TLY3ilDnhUjua?=
 =?us-ascii?Q?nE8S/N9PW0TVpVVJe0UsaIcYOF6CRaWjY+Ul3UCE2lxxE30Yb+QHc6gegN2Q?=
 =?us-ascii?Q?5K/SqXMl5KlsuQoBBaUFEzfbwAe2vquu1urabtIY1IqYek7tY6YMzHLEfVIo?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b98aeb-3cf8-4a3f-2868-08dafc17edd8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 01:28:13.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGJM7ArJ49es2lHX7s0Znl1grTjG29ttTL3tiXCwAOa40BMtPj/cxHWCQHP3rgeC7weHCnJADtLbK/WFkfU2eWlHeyQxxBnjMOq89EQj4Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 10:14:19PM -0800, Anusha Srivatsa wrote:
>
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Lucas
>> De Marchi
>> Sent: Friday, January 20, 2023 11:35 AM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
>> devel@lists.freedesktop.org
>> Subject: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
>>
>> It's a constant pattern in the driver to need to use 2 ranges of MMIOs based on
>> port, phy, pll, etc. When that happens, instead of using _PICK_EVEN(), _PICK()
>> needs to be used.  Using _PICK() is discouraged due to some reasons like:
>>
>> 1) It increases the code size since the array is declared
>>    in each call site
>> 2) Developers need to be careful not to incur an
>>    out-of-bounds array access
>> 3) Developers need to be careful that the indexes match the
>>    table. For that it may be that the table needs to contain
>>    holes, making (1) even worse.
>>
>> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which one
>> to use depending on the index value.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
>> b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index be43580a6979..b7ec87464d69 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -119,6 +119,34 @@
>>   */
>>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>>
>> +/*
>> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
>> + * The first range is used for indexes below @__c_index, and the second
>> + * range is used for anything above it. Example::
>> + *
>> + * #define _FOO_A			0xf000
>> + * #define _FOO_B			0xf004
>> + * #define _FOO_C			0xf008
>> + * #define _SUPER_FOO_A			0xa000
>> + * #define _SUPER_FOO_B			0xa100
>> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,
>> 		\
>> + *					      _FOO_A, _FOO_B,
>> 	\
>> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
>> + *
>> + * This expands to:
>> + *	0: 0xf000,
>> + *	1: 0xf004,
>> + *	2: 0xf008,
>> + *	3: 0xa100,
>You mean 3:0xa000

doesn't really matter. This is an example of register addresses. They
don't need to start from 0, it's whatever the hw gives us.

Lucas De Marchi

>
>> + *	4: 0xa200,
>4:0xa100
>
>> + *	5: 0xa300,
>5:0xa200
>
>Anusha
>> + *	...
>> + */
>> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)
>> 	\
>> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +
>> 	\
>> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :
>> 	\
>> +				   _PICK_EVEN((__index) - (__c_index), __c,
>> __d)))
>> +
>>  /*
>>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
>>   *
>> --
>> 2.39.0
>
