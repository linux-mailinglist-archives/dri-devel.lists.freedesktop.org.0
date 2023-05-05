Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4C6F886F
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E484B10E654;
	Fri,  5 May 2023 18:10:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DE810E653;
 Fri,  5 May 2023 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683310219; x=1714846219;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZKuccpPJsIYzKX9E1fuj6FK5QN/b5UUYVAVQsWFC7yc=;
 b=d1UHjo5jgngeoFk5GaUSB2QxHkBJ316dGi0JT3Fba3itNJRWsHSBJ7i+
 zMSsz4+rUNuo88MvgSKkm1UsRvkYT14//ayMGeMgNyyiAYZjFkCGBQcqO
 mTKzvHplM6OoKpVdSUvTqvYllDF1sqarOhcHRuWInSZ9wL2GrMUtdy1RF
 mJGoo1F3vkPnZnaXB7bPwta63PTM4pcXRj5bmQ+aAkd26htTAINHUrv/6
 5fKgVRYnHemkye8X/FP2JR+l1t/1oHy0XBlV98tTkLJJRfE7VzdoKM+tg
 CELGodoBS4t0pQfiqAwZD0n61Lp8NvsZ6pQIfEoZ1WPdhUlWSZqdehASH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352318182"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="352318182"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 11:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787241381"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="787241381"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 05 May 2023 11:10:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 11:10:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 11:10:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 11:10:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 11:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9feq05xHje/ebVgyWc3qfbWpLjyOSaT0q0JQZWLfeuJTikOHt3vL9mPO87mo09CU1YshkcNHUWT6eYVa4HczqQbV+9lPOnqRxkCjY0DUwTlzU7B3t/SjLAx2Pi7Rjqhnr8g+2TqsAXsQj6ERMNxBycabR+tCwyWP5IFjbKFOtLXEP60h+rqL43S5Igjp9dfnnQvkykp696hlMbMSYTm5UcKLDm309yt7Xic0nJ9XMm8OufDW0F4R+YusbLnHkKV/235u6FK/i5UKBK72X8kQ4ilfghqmYzc4dtKoraDAqmN6ar1xo83q5I+xWnvgd93/pzFlY5iEyt4wcxNBJYQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cyC1jXpFjGutaQoMqm9O4S42do1a6/3VrXnRmhRBXk=;
 b=bGtqQasI8dYs7QsNobus0t1Vz8dQvvNgZSn1baJfbUX808KzsZgFL+xzpf2qst6Hdx4dn7bO05Hd0njiYTlj43gcsahWlpT/fvQ+1EKRJYON+RfAMhuNCfXkRYwbIDW+PfwQ3BL8R7w+iDLbzF5sBlFCNi/Kxb2lJzi9UhwZSnAJmbROp5zPNYW9ygLQsBArmu4ahpYABActkuhKjCwZ8EHDRtaSd6vRqSyatYD0muTFhVghMfzB1qJrc0J3acJpmjg61gtFNj5F37uhFaFokQwbWxBCL5KgfCqU6xt5kL2PebbuESe3LquG9sqAU1JS8raHAqMeB4b2hU/YsyVvqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5486.namprd11.prod.outlook.com (2603:10b6:5:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 18:10:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 18:10:15 +0000
Date: Fri, 5 May 2023 11:10:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/mtl: Update GuC firmware
 version for MTL to 70.6.6
Message-ID: <zrtslyn6h5edjmcaa5umq4fafbnuxqmgdzl2q7sfw75o3zgids@ycuq5tnje6xs>
X-Patchwork-Hint: comment
References: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
 <20230504202252.1104212-3-John.C.Harrison@Intel.com>
 <jo3pp2ew2qsckcrn4lvrkmhfilve6gjr6vb2iiof465dhj3uus@fppfx7jwt3q3>
 <0ef47947-d52e-18aa-5642-874ee2ca14c8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ef47947-d52e-18aa-5642-874ee2ca14c8@intel.com>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: c7965961-d8ec-474f-b3e0-08db4d93f9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNfFAyJCtpfqc0egVU0G9IzlqsYJW9QlbsTilrX5KO5HqWHf4pHrQjDAabOazdNLIJZz7F0GUe8lyHvQucmmEvO9SbgHpbmtpvWNaWhn/n6XkASJ1r6mBjjj9qiEcjwnFfIKK9xcThFWQUbhdyfyLquaABdGvv4q9moUdvSMH/bSz2jm0WN4cvZLAEuBYP75lWjrJQ0yVP95hZJTJ1RCTWg/9FyRdl7Dh+r4GZZ1T3R6/KZi2kTVJfNgaJHIHvY4WmZrdh+WZcqwxSFifNAwnQKgB26kq/8RFPq054H4mYd+XopQbYXUJw5gY5oJ44gjoX6ufmSMYKQefr1k6F2X2IHTHNz78WtEsgTsoI7WGFobjNpQA/B/UZes+7g4R6qYQgfjomp6aV91uyb8OMlV3Odk0BRA4EY2Nbt/4TFn4GkmdIFPe+bfuQBDd/WCxNshDG++ta/Wq4XIhDyoDFZCT5JH26QqSPjl2y882Lhic4zgG+HDFItqmzLEtk1hetih
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(86362001)(33716001)(38100700002)(83380400001)(8676002)(41300700001)(66476007)(6862004)(66556008)(8936002)(6506007)(66946007)(2906002)(15650500001)(5660300002)(6666004)(316002)(478600001)(6636002)(4326008)(6486002)(966005)(9686003)(6512007)(26005)(54906003)(186003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CIgYZO2xFPIJscEUS1eqtjDc0KHDiXbcXfMR3ORl9LYWa/S5ges/gBzToo?=
 =?iso-8859-1?Q?RAYrjFYMfmF3kd2cgSaQpAIL8Z49ab/mbAWBC8ypJlz8pRfrekOXiazLiG?=
 =?iso-8859-1?Q?lGvy2fPwmvHKXLAdS5xgdHDEzOBFiCL57dPtPMTSX9TwoxZT9J0zIqltzs?=
 =?iso-8859-1?Q?dKPg1PZ2tZrNwTAPhOucyVagqpSVSuyScJ/HaJU/udPyfYMpy82XQCK1Zy?=
 =?iso-8859-1?Q?PfMtl6BevCu7QQkLPQxsywqsmTXZBPxM8I+iXVsUY0bllEOghkVSbZu8yP?=
 =?iso-8859-1?Q?SIhx06QSMB8m0BBpUzIl67LA40k4ewV4OUt4xHXlaWQIlu6NuwJpwMMRcf?=
 =?iso-8859-1?Q?d+wCSHw2eqS2F/0pi/TNJ6Vs0Ppb1hCq1DYiuXsUPAh4Lt6coc4OS93UAw?=
 =?iso-8859-1?Q?Sx6Wej3Xu5Fz8zXPKLCKrzpf0u7ei2TGk2bxlmqeoZFJi06d0/5Km8zxCJ?=
 =?iso-8859-1?Q?qNbJDENh2xTAEZhH+wJe1U1nNpw1Ep2PipbDKGnsn3gu7cRKaMGa6aAhLT?=
 =?iso-8859-1?Q?BC1iu+kF/JNm9uquB7EYw/G/g5n39Ks7Fnux+LLT97AYXfx95Zi5p1Olx7?=
 =?iso-8859-1?Q?JO8e7Bj9A1yUMYg2p5nj5S0ZKWrZ8GXjAEm5j+C47tw0Rlc5dFPtLHfdTe?=
 =?iso-8859-1?Q?57vl57Fk4mV3uoLV8vzpMf1RofI2cC88x5yc+WZTnqQ1DbmyvgZeegy45z?=
 =?iso-8859-1?Q?cnDn97WUDmBuiz3C+9sURnTWJcSoUqzrZ7bbjViBYeWuuDjyf8YPSKrk9A?=
 =?iso-8859-1?Q?mAg9sp08e/sn7CF0kXuMXvEatWxNYN99rnReqttZMr6fULNOYbcfnIBFZ+?=
 =?iso-8859-1?Q?7Eukq2kc5J6bWK/REsJIwQIs/gpwQL7Gli/UQb+h4lSluFnROd67tRYN/Q?=
 =?iso-8859-1?Q?Q+JfvnQztvCxEjKjIF51pKk0HNjRoVqNerUsDE4RJ7IA5OgBephSjXdmbV?=
 =?iso-8859-1?Q?3t0cyXrwUan9mHZ+xB2a2TFuBSUoBxWRXnM1i4Wt8xN3sVKkbXI//w2Mf0?=
 =?iso-8859-1?Q?4Y5SlZLVi5J+E9m3bM4Aq74n6DGDW8MQhAT2H2N9EouW3/QHMXsZzIblch?=
 =?iso-8859-1?Q?o5Blcx2UAtt+Vjdj964ByKcAaW2kJrkFGrVgLpWn4kTktfBC1mzcF1tCu4?=
 =?iso-8859-1?Q?ZPlPW/tLy4Pa9zM4JckSvosnGylO/so2F8pgCqMeNsW/1c1AIylTMQfAj7?=
 =?iso-8859-1?Q?8rGAeIx+vCCHKuJWh8Wy0fkipzCf3iZrK8+70vV2DNZ+140xqUmvH7Eghs?=
 =?iso-8859-1?Q?a+J+4tDRKqpC+IhQYKNUd/47ljHVd4h5aCGNERWYItRRrQSUd/c1Nu4Lgo?=
 =?iso-8859-1?Q?WHKfD5nckkm2PvOjI3MFycO+mvALjkooPCZ9zetBa+jJO9xw79OtSnCdXA?=
 =?iso-8859-1?Q?Nf+oPmYEv9R3uvLPf3ydDOHVhlTI9XrzSKR7Ln+HnovnRKvF7PyI59VRLk?=
 =?iso-8859-1?Q?wfn2DKI4I7ORuwP1p23897K5qS4Xul/C0gpfv0r7IWyxVIG4c/5mxJLFbL?=
 =?iso-8859-1?Q?cukdt01VHUyd6EszZXy8Qpg7orA21YspfF4FNf3pYrdUR258DKQ294NGJs?=
 =?iso-8859-1?Q?q1P/lRbM7sBO8NG1++2XGX7w62dDE0q+xx5CY+xv4t5io/SlAZa5Uf0++b?=
 =?iso-8859-1?Q?8w7drIEvQaNQBmG+GfooeYEKiyGMB8mHNZq1pLImFERbe4JDjizoVF0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7965961-d8ec-474f-b3e0-08db4d93f9f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 18:10:15.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JO0L7dADrd2l02jfGG2bLguPMKieTDM79B7sEfJG0v4hNfd3LykCnKJ6BttAyVlaO074DpgLkclIp8Wlk5IraezQVqHZxNBFJZjbhzahnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5486
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 01:45:24PM -0700, John Harrison wrote:
>On 5/4/2023 13:29, Lucas De Marchi wrote:
>>On Thu, May 04, 2023 at 01:22:52PM -0700, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>Also switch to using reduced version file naming as it is no longer
>>>such a work-in-progress and likely to change.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>>commit message here will be bogus as it will be the first time MTL will
>>actually have the define.
>Oh. Because the current line is coming from the for-CI branch and is 
>not actually upstream already. Yeah, forgot that!
>
>>
>>Better to do it like this:
>>
>>    git revert 5c71b8b8ac87
>>    then this patch, with a better commit message
>>
>>or I can change the commit message of this commit while applying to:
>>
>>    drm/i915/mtl: Define GuC firmware version for MTL
>>
>>    First release of GuC for Meteorlake.
>>
>>    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Lucas De Marchi
>That works for me :).

applied both commits to drm-intel-gt-next branch and removed the other
one from topic/core-for-CI.

Closing https://gitlab.freedesktop.org/drm/intel/-/issues/8343

Thanks
Lucas De Marchi

>
>>
>>>---
>>>drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>index 55e50bd08d7ff..10e48cbcf494a 100644
>>>--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>@@ -79,7 +79,7 @@ void intel_uc_fw_change_status(struct 
>>>intel_uc_fw *uc_fw,
>>> * security fixes, etc. to be enabled.
>>> */
>>>#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>>>-    fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
>>>+    fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 6, 6)) \
>>>    fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
>>>    fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
>>>    fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>>>-- 
>>>2.39.1
>>>
>
