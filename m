Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2A4A58C3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CBD10EBE4;
	Tue,  1 Feb 2022 08:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3901B10EBE4;
 Tue,  1 Feb 2022 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643705297; x=1675241297;
 h=subject:to:cc:references:from:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2tvmSFq0oK1dOOzW97qJKG/ZO8tOOzHjMIsoQfRaPSg=;
 b=JrTcCa1ASfwrgNaLCIuJsAfB/uKq0BxrlIBg4Jrt4SNhAzPO4DyRaElH
 IpeqUbOMQmT7kMKgm4aqYaJmsh1hcUTXFl0Rc/SY+Ff536Lq4fNyAyZMs
 ZLEEz302dYCbjuhz1bqsNbm/1a5wSa1hCAIRD4L0NzEmdKyFZpOwBlElw
 ACrd8OM0iPSrso9cHGUmAfDR89ylrT+do4kSuACUa0HIHAA6Egwzn/v9L
 Q/iIpTRVM6xT1Jy7pYqM9TolNnK9yWAUCDK/AIB7hDyUavwWOoGsUw52U
 kSx0D/d6ZFtYXzEn/17gVj26D5gBMKF66gN45gDKYitUL0fWb8qO9ynAq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="235039592"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="235039592"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 00:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="534460083"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 01 Feb 2022 00:48:16 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 00:48:14 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 00:48:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 1 Feb 2022 00:48:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Feb 2022 00:48:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1i2sPArGGRhzVaM9hKGeo9tWjfO956KTv2NmvNEc/jr35wJbJ3g8dKcGdEg+mrzxLlS4R/njTyMiy7dv9/m+q4rNz/tVBoRma38Z+RjvF0R+vkjKTw0/vfu5TtYXiWNEaQkYRQXEAeVL1tFUy7+b9sSf68F7K4UZFz1MtSF3sxQBlyCfQ+FtqWMsjfANBJvH164xA+yokqpokzx9pfER+qiyPZxDQiARkVZv7J9oi1cp5frGbwc5Dc6RXMqbbI1Tb9cFzV5vYuAzHrWetg8x06HbHMINVrneGw4KokLWUvkuVtAvGwrt1q3Q7PPiJVndH4u5ppCBVH5VD4C/8SWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ZIVp0p6Yvs64xZyFv+BdnMFmYwCBjqatDrZBSAIvI=;
 b=ivDZ6QGroyny/t1YXbZI1lI8NEJekaUf/cBPY8BRXgsR/Q+RpPjtS2ljVwJ+lAETjJ/xHrRFUdKETMYbnLCwzCC7XsnxVsWpVNabKUfXlpJwETfefTnbqPWr7AnGsaS/cnm7tM5IrYJCtPudYYcmvhmLSGNFUgJ3rnDHJQP60hjImviKFZ9CYVYUt3CT8pOVAdiwaXNRgRqeTcfw9H261bMZXrL5JDykBLyLem0KS6+pHaE0gyjqfykYdcBDmCy/IrxeguRJaNk0nqurEvg8FdEt/KcAR35ZE7eT9Tn1KW0y8hv1Ayw1L9VxVB00zis2cwlm/1Qv+8XvY/89WMioMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19)
 by BN9PR11MB5418.namprd11.prod.outlook.com (2603:10b6:408:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 08:48:12 +0000
Received: from DM4PR11MB5231.namprd11.prod.outlook.com
 ([fe80::419c:5e6:fb95:8733]) by DM4PR11MB5231.namprd11.prod.outlook.com
 ([fe80::419c:5e6:fb95:8733%2]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 08:48:11 +0000
Subject: Re: [PATCH v3 2/3] drm/i915: Fix header test for !CONFIG_X86
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-3-lucas.demarchi@intel.com>
From: Siva Mullati <siva.mullati@intel.com>
Message-ID: <0dc5e3e2-c389-17ee-1cef-56168bd924fe@intel.com>
Date: Tue, 1 Feb 2022 14:18:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220131165926.3230642-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To DM4PR11MB5231.namprd11.prod.outlook.com
 (2603:10b6:5:38a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d0c524-1180-42eb-97ff-08d9e55f93da
X-MS-TrafficTypeDiagnostic: BN9PR11MB5418:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR11MB5418912764E8A3482ADF558988269@BN9PR11MB5418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kz8pSXcWldiH6JyV76sLApnoshH7F1ft3oOKCnQ/CNeIKF22NT0+6sQjIrnRG3skF3W7oQNtivEP+c/e9j04lKfAvEgkbFTan7PX8FalOLFlbQGEOw+hb0JJoeof88vJc5+Ibr/ZvLAgtQ4s28MpgNxoziP9rBSpfZ68NY7Boov8McIrG5/zd4iMnKvxtC0ug57vh5nrjV9JT9oOBO/M5/138loJ6eLbIvC5pJ1xvIUgqBA0/I4GwLVGupm86+weP4kewLqcm6NiCaB09iMZjgVdQqXeaQavHSEE+22ZJeqCoIr0/XQWY6BXIShJ4iZt/GrNjcIDEx4jmmWU9n3oxmOxPxXnmA6u95ZyIFypNJL7EBAD1ZPDLnrdTES3/QYc8drRNjQArEDJriA73rV6NErWbsRbgSbeYAAFjp0j29EOr4STtFpFbrJCLHrjiKZAaEchn1z1EY7XfaqaEMpqAaTjTyrHtzI3dn+k4u1Hmz4SyfBCNbUUS1ayIHMpiXq+XIZbIVxsCKR8T9KVR3incG0qp+fEscBBPQuaNIAkM0u7TChqEN+zfHFbYiy/uemEwq+Eq6EkN9flaMaW45d9Ze69xqEshw+F+cR54dKVNp12VkaEEUTzEyIhLmFhxUVLQYFl+Y/uzH47d2zUKbl8BrUPrDn3qWCwH4zz4qn76G8WajRWpJTbh1K/BrooCZpEEGg1SGGhPRDzsslpH8CVCVaGcFJEeBEXiN3D7curJek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5231.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(31696002)(44832011)(186003)(316002)(86362001)(508600001)(5660300002)(2906002)(8676002)(8936002)(4326008)(6512007)(2616005)(66476007)(66556008)(450100002)(66946007)(6666004)(82960400001)(36756003)(31686004)(38100700002)(53546011)(6506007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9VOEFrK3JhN0p3dDlseDRIdk9aeGFTSVovMVg5bWZvclRkYktMYXBQT2Zw?=
 =?utf-8?B?Nm1SbnhibklscFhIUFVxUWt0eU8xYUJoaVhVdmFxSEw5N0d0K0lXVzF5YjdF?=
 =?utf-8?B?S0FkODdUR3pIUjZRMVFqVWp5UU5paVQyOGVVdDRNV3djczRXTUJIdGJUQXB1?=
 =?utf-8?B?T2NNNi9UY2hsbTBmY2l0SkJLQURuNStLOUhKekFQTEdNb2tCRHJ5enM0eHl4?=
 =?utf-8?B?ZlhNZDFjT3czVjVOeXpZb1NDNXpQd3BkTWdTVEZqaEFFeWJtbzY4eThHTGNB?=
 =?utf-8?B?WUVJUkQ0bVVEMWVsYTc5cG1TYUxma09zWnVYTzJJS1hGTGdFWmhvOVZVV3Fs?=
 =?utf-8?B?UkdDVThFa0ZmTnQvWW5JY2d3bk5JY1EySlBPalA0cVBUdjQzZ2cvaWI5enl2?=
 =?utf-8?B?NFE2allCbkZGb1RtSUVLUVRVZFJvcnNOY0hhZEt2QWxkQTFSYVYrVzIwbGI4?=
 =?utf-8?B?ei82WWZkTVZmYkdwVnJyNEZNdS94YjhRa1c0Uko4bzVmWUo3R2daZjJyL2x2?=
 =?utf-8?B?S1dQOXBxQ3BEV0JsNVZ5ZDMwTWtHU0VZRCtDc09ZV0k5VHMwazhPQnAzTWFk?=
 =?utf-8?B?ci9NZS9OTXVLNGNWT0xWVUo1Z1JIZ1AwTitBNHN2VmYwZ1U2RXVsald5TmFL?=
 =?utf-8?B?MTZQUzdhdXRuWmtoUUxMK3hxNWFCNW52ZnRXRkQ2QUVwK3c3NFNwNytMVU83?=
 =?utf-8?B?RTNzRUlXNjNONXh5MWp6emQ2dTZiYjlpdUxsQ3RFZ3JNeXJiRTVoMFUxQW5p?=
 =?utf-8?B?WGI4amY2ejZqc0wyckJsTjZwdUovQVdNMmgycUZoOGVmS0RyRmhXWTY3V2Jx?=
 =?utf-8?B?cU9VSTNlQXVsbE1pcUtjMHMxZno3UFRUODBLQU9wQlhFU0s4NGRmRjVSOTZw?=
 =?utf-8?B?T3VXQUllUXVCaEpnOWlFNkg1NnYrUU5HWmJtTWt5RGlHQXpUVGlnMzZ6MUV6?=
 =?utf-8?B?ZDg4c1JHa2NuY1daWDlXMVMvcGlKSjcxV0Y5RitiZ2NXd3FzK0tDdHZqTjNF?=
 =?utf-8?B?Mk1uN1loTE1ZQWJSbnVGV0tSNWRpZElsakJnMWtuR2ROcjZEc2RUcWFNckJH?=
 =?utf-8?B?bWxvOVhtekNjY3ZFdlRsbEJCa3lyTXJnUVk5LzJFZ05VM25uY004Y3c4S3JS?=
 =?utf-8?B?OFRRSldJNlRKRmFJTTdCeXBndFczdWo1K3ZTMmVyd09Kcnp5Q3Vpb0NaRDNq?=
 =?utf-8?B?OUJhcm8yWjZLOUNjL2ZxTVpYOUs1VkxpaENSditsNCtLQ0ozQUFZMC91aUZz?=
 =?utf-8?B?RXF2b1l3Wm9oZ1BPZnp0OVVxeUJuSy9pMCtqOTdzZEZpYXMwTk9mME9BcnU0?=
 =?utf-8?B?c283eWUrd0duZldYZEV0M1o5YkN0S3BJYUlTdDJLcExuTytlMU9DNXc4VVEw?=
 =?utf-8?B?VnFpZ0lIeEJaVGVuNk5QVkxZUVIrdG13WUJUM2EyZkZKSzdxQ3RLSThZcUZz?=
 =?utf-8?B?eEE5QjB3Mzg2aXhPb2VlQVk2T1ZOUVJCTmZweEVRQXFic3FyaUtvU1NXTUU5?=
 =?utf-8?B?T3k3MDlkZzZIZE5kNFNYQzF0ZXdBczU0cnRSQ2FEMmptR0Z0UW9YYVRJNE5O?=
 =?utf-8?B?QW0zSHphYWxZQWNuZ0VjOFFqQkw0UEZNU1NQRnQva1g1VG1iTGx0czl6cUE0?=
 =?utf-8?B?NHp2VVRUMWd2T1hobEExd2JYZnhyWndpcE4xSm53VGFFbDYycTl3ZWkyaUFT?=
 =?utf-8?B?RG5kb2RmMmZhMTFQMXRodFNoaS9FV2RiVVE4cnNoYlN2UmpjekpXSGRGdSth?=
 =?utf-8?B?TXFKdzJrcXYweHd2QUVXZEVsR2NIUFhVYTZxKzJIL0dOVVgyZmJaVFo1ejBL?=
 =?utf-8?B?ZFIrZmZHSThSQVk1WWNkUnBnUmdRQXVzNDNIRFNpU3BYZC9FOXF6dmRVMWxm?=
 =?utf-8?B?Z1hUVk5zZTl1MnFBSy9Gb0M4UEhSMURCZ3A0RHdoTjdJanUzNkJUMmhtQUpy?=
 =?utf-8?B?cjFXVURSRWFIR0NWdmhadXg5WUM2eDhaUlpLSVdjMHpQSlFuTGhLVjdlUDgw?=
 =?utf-8?B?ZlBQZDZHUGV2L0hMK3BwOVZXc1dxSHBkbGhEdEFUZTljTFdyQm1DK3pkSktC?=
 =?utf-8?B?anNYMmd3TlhGd3ZTK2hjTHhvRnI5c2pzbEZ1L2tCWTFhd2J0NWZDYkRDU2RF?=
 =?utf-8?B?RDlYUmhRZm9PcW5UcHQrcmtXYitrU3JBN082RXkzVVdyRU1oMXRQWGtoMmpo?=
 =?utf-8?B?N2ZMSVFUcGN0MHE4TTZzakE5RjEreDlGTU5nWGx1V1Jrc2FwZmhKWS9PbUUv?=
 =?utf-8?Q?nyfv7UQSou5DuNP4n41qqmCLBxN4OiLjA5Bz1haXcE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d0c524-1180-42eb-97ff-08d9e55f93da
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 08:48:11.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXIAxRAQgc3vEJ4e37aEP2vZUAjgJ7oE7fsC7gGJVYhOmmFaGDOMVgC6IDP/NZXPRUwklGky8Ddx7leNOggw2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5418
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Siva Mullati <siva.mullati@intel.com>

On 31/01/22 10:29 pm, Lucas De Marchi wrote:
> Architectures others than x86 have a stub implementation calling
> WARN_ON_ONCE(). The appropriate headers need to be included, otherwise
> the header-test target will fail with:
>
>   HDRTEST drivers/gpu/drm/i915/i915_mm.h
> In file included from <command-line>:
> ./drivers/gpu/drm/i915/i915_mm.h: In function ‘remap_io_mapping’:
> ./drivers/gpu/drm/i915/i915_mm.h:26:2: error: implicit declaration of function ‘WARN_ON_ONCE’ [-Werror=implicit-function-declaration]
>    26 |  WARN_ON_ONCE(1);
>       |  ^~~~~~~~~~~~
>
> v2: Do not include <linux/printk.h> since call to pr_err() has been
> removed
>
> Fixes: 67c430bbaae1 ("drm/i915: Skip remap_io_mapping() for non-x86 platforms")
> Cc: Siva Mullati <siva.mullati@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>
> v3: No changes from previous version, just submitting to the right
> mailing list
>
>  drivers/gpu/drm/i915/i915_mm.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
> index 76f1d53bdf34..3ad22bbe80eb 100644
> --- a/drivers/gpu/drm/i915/i915_mm.h
> +++ b/drivers/gpu/drm/i915/i915_mm.h
> @@ -6,6 +6,7 @@
>  #ifndef __I915_MM_H__
>  #define __I915_MM_H__
>  
> +#include <linux/bug.h>
>  #include <linux/types.h>
>  
>  struct vm_area_struct;
