Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291805E9E65
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FCB10E663;
	Mon, 26 Sep 2022 09:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E023310E65D;
 Mon, 26 Sep 2022 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664186051; x=1695722051;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f51gellz54CJFSkuKjlfJZ5HhKKnh2t03mrq7TLdfJM=;
 b=Xsie8h3jWpB1i1YTpfgojP7UYva5hPiwGN4ma6C+T8racUUyjcYKC00w
 y4KeN/RdA2MtewQhSsANjW0OWRRZD7IzIINwFdvxUV5MSr6aoCRzKOqQr
 F7RT4hD0m7f5mJCC/8lVyeanIQezt1mK1z7fQEVBDLNMEbd7NIgQfp+u6
 na6ND3QnTLdgxNiEStPnw+8FhRZbErduQVs1MnRyLQ5e+rQaEU5JfGRMI
 W2X1/V3Im/Hb/y9BHIdovdmEJIsjLaTv/gxItfkvoNbUnwI9Z56d92ls9
 k1glAPgJUcwZCSX8e5+skW/G2BArhUVSptU/QBXX13iDRXj0LS0aHWFVF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="300968818"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="300968818"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 02:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="949788614"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="949788614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2022 02:54:11 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 02:54:10 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 02:54:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 02:54:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 02:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvQgjTkzjiNCeLInYUCih+azCRPsKkuKWmnoFhHMkaujO6LjEVD0XRD5PXadRfWn5zRaC1nNeumx0ayZHBnthVs/WnU14/SY1SHXeQqGj/rCXfL4tTvnI5YLnfZa0Ncty63oWS1WMirLUY8+L/7pdM6tpjUwbp/bI6dc2TJzEIW0ByERGYavV6yjguvnDpl9exeaGv5Baoa3YRZLLqmo3zClSRTiscrvPBgNckJe6bhwrow/tYKJvUKljUQzuGUSWvVPTyWRVTOtlChWMIK3EyOKB/FQtrTVY/5obuxuCC/dHigKmQVtzmMxsQpTiBqIKgXWkCY3nvqHcX0mSILYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UMhb7YUHZmay05n9P+DlvPVmzb+ZKTUOsmPUMFNwAs=;
 b=ggX/GMqG7WvwVa18tRqUPzPHAezB0KMaEiCgFHz58ACQqYUsFqEPxBq9KkuSPLa98Z5eUCAJj3UFA7YPQr51Lii1WTCLtUBXbz/yc6b3V0OvpcNk1GUUozBwe4BkAKbXV0UBL0clSIbSt136PPyJGt+x0I5+Wh7ggKGNP8M3/MF5x6AYiV0G0L7kr89/+vEHTpnpb0G3+aEhQY4Jd143e4Sm3xwJO0dvS3Ho8DFBekVWy5Yo4qvynKfZeKZ0rxLpMD53wCtoBsv5FB+lOpNFSmJJkUIbIJlF7e+l/D7sQH1g89NNREgiYnf6amvNgTeWaANudM7DSZmoImNjx95Wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 09:54:07 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 09:54:07 +0000
Message-ID: <2ffe7220-d956-e80b-1f8c-86a89a99c3d3@intel.com>
Date: Mon, 26 Sep 2022 12:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v11.5] overflow: Introduce overflows_type() and
 __castable_to_type()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220926003743.409911-1-keescook@chromium.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220926003743.409911-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9416f2-88f2-4b8d-ef44-08da9fa50d69
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 70Me7P+QtkAZ9V/eQYsN3DWgOubhxiAsrmfj0jvUP5q6ilJJfIECbeHTJE0YDYnBz7iML5kSKgkY6dy7cx87JSprlaRucPkHkwzjHd8q35F4JPLyloJusSQGY8PuxfLOE1SWMN8olejLUmefGuaSqFR6yDx0aqD6vNnAggKfIX8qlP/sTVseebL8S62OS7CbgcFemuV/dZZQKBtF3XUvijkvPF4XsLO0TSIqQz3wdGUVrxg5pEjNCRzUsSJAmbNyum+EjEGaKQXdttCdeO7j8IljxiMQpT8ZagsEqdbnfSl2B7fOm4OCN0GnB1JT3ULMdSWhUW1KVTiK4loMjPI+OScQmbqFN5dPYdI89Ph9j57cvSXc/I2qtWiKvXX3YFeNL69GtjNbM/PhupxJTHGM4m21T/digEsFCf6yRgw/cI5NAaJ9ECvbVUwuovjCT+Oqpizgt7vdgN6iZYz3XJqnC0j6qubZWPqhgwOx6Ws9gQYJZmMd546cea4H+Sq5roKuE8qds6m6zoQYJ7ooho4kWiRIzvRpzfDlpBLJRMRI4JSpffVrfF/gf500FqEgCvYOcYoxRDX14pmVUK5f2Y4hkF+31ewLa8pBxP6iRRd/FiXwpZr/ZI/WGmQUxUxZMfbgAw7SPj9Yx1copgxDc0CCmVygWgU6UVhhYNtDn9iaLl045PMMJpkDKuwOA7YDnvsqb3/IpxdtJjsLMdoePnTdBzrAm5KetSxbRUxvEZS+qzzSKMXTX/MlGsR2889i1SDPLk+alyCkExDgGgtc4k5mc+WWzH6Z1+uR7zbX6C31w7C12NA2NrHdnjboN4guc+ck
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(83380400001)(54906003)(38100700002)(6916009)(53546011)(7416002)(36756003)(316002)(2616005)(2906002)(5660300002)(8936002)(6512007)(86362001)(31696002)(26005)(186003)(4326008)(41300700001)(6666004)(6486002)(8676002)(66946007)(66556008)(30864003)(66476007)(6506007)(31686004)(966005)(478600001)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z01lL001NS9uT0JHV2o4Nm9ySVdhNEZGWUNkczJmbXlHQ2NiVEpnMExTc3R6?=
 =?utf-8?B?aFRldlMwazV4TVFrK2NZNER0RVdYVU1uejdJRUgyQzEvNlkyVDN2SDJkM282?=
 =?utf-8?B?Mk9aU2VpRkt0SXY0M1M5eW1OUVc2Y0MvSWtzVlBDTlZxWFlUeG9yQzN6Z2lI?=
 =?utf-8?B?NVpadnZ6cnk5eDVoSC90WnBpY3VEL3VLV2tYazYzZUNrK1ZaalNxRE9YWVcz?=
 =?utf-8?B?c1ltQmNkZkRTajY5a3hwVFNReWZHQzR5dU1VY3F2WnRXQUgwY1ExZUlZRjR1?=
 =?utf-8?B?NVRyYkp1UHY5SXUrMGIvWDFPTDVPZWp2amMrWE14aDVFeTQrNXAwNDk1Tm1x?=
 =?utf-8?B?QWZORTFSRXMxb2ZGYmxKem1FUlpEODRwUVM2Q1dpdllKaTRacHY2aXVqUHk1?=
 =?utf-8?B?UGIxOU9ZOU5oVGJaQzZ3TmVRYUtMdUc2RWFMeFo0TEJzeW5WWnMwYVEzSk1P?=
 =?utf-8?B?NnFlWGIzV29ta3hTY3RPbFBkdEJ0S2hjb3U4RlpheDNXRmQzRnBzbUVLSkFB?=
 =?utf-8?B?dWdwZWMrVVBMTVJHaUJ1TTcxMnM2S3ErYlBCQmRuSFVoTWNsMmxCMW56UG1X?=
 =?utf-8?B?ZkVZRndUbStpdUhJM0RSL25qN2Ixazd1ekNPY2RSTzRtTWF2a2tCd0pkLzQz?=
 =?utf-8?B?eFNXQnpyMVNlUUhhazB1cVNCb2FVaWNOTzNwN3BmalV1M012dURoQUxEUW4y?=
 =?utf-8?B?MC8rUEo5UHczbkpGK1ZMaVYxZFhWZjh0QStjL1ZuRWpvU2FHbitkZ29Fa1N6?=
 =?utf-8?B?WXNkTkIyMFdkamp3VThMTkR2WklOTzJ4ZW00RW8vMkd4NXVTL2lBelI1Rk5U?=
 =?utf-8?B?RlBuSUM4cWh1ZWxkOVZ6eUtEY0hyZ1AzSWdKVXF3eDRzbzBMeHJSZ2UzRHRu?=
 =?utf-8?B?UEcwaGJHUUpDZ3RIczk3WGRMQ1FDOWtNWGNxWnp2MlFOK2EwN0JFWVFWbWxN?=
 =?utf-8?B?OTA0allrNW12L2FZSUx1NmkyeDlqTTB4WlVhTS82d1hCbnBLdVBISUpyL1M4?=
 =?utf-8?B?WHpFZFlsYnp5ZTR0Q09kM3VTNmtQZHZOS2gyM1FuWjVUWDVIZTdZQUdLaWt2?=
 =?utf-8?B?OG05dUs4d1lsYWhIL1R0a0xVQlFpZUEvV0RFTFd4VU5vWHorQ05xOUhxYTVZ?=
 =?utf-8?B?SUM2QnNuUEdEN2d0YmNsanJ3MFZGVVRBZ2pjOXkwbXlvcGV2aGtIQzZBaVRT?=
 =?utf-8?B?WFkvSmZZeUxTdFBLTzk1dEl1bVZXem5kaytzeHUvUi94dy9LbnFVYjV1Zkph?=
 =?utf-8?B?OE92aEZ3YmtSTENvRDZFd1plU1NoOElDbDZtWG1LTzhxUDdFT3ZwZUFydWhY?=
 =?utf-8?B?cGJsSXJBem1TQnh4VGowYVU2T3IyaEpjdXZxRm1CNzVOQWF1ZVVzM1FQY2ZO?=
 =?utf-8?B?MWhvRG9nMk1oUHgrUjB0MGRESjNxeTVnbnQzYzhjM0YwcjFnNGkzK0EvcU5Z?=
 =?utf-8?B?L2NyMmZnVm1FK2o0REJRblhabTN5VzhGbmsvWXgybmdSS1AxcytkV1hobUVv?=
 =?utf-8?B?dnpVMEREdm8xZnJsYWc1cy9GenV6L0V5bFRROE1xUCtwZ051dWdURGE2SWoz?=
 =?utf-8?B?bHhOR3ZjMXMvWnFTYy94Y1A1ckJvOVgzR0VnOEt4VU9OMDhoUUI4YVF5dGMr?=
 =?utf-8?B?Q3Jud091VDUzK1lxRUZDR1VzaGxDcVFXbWVkWEtEVVZ6MDV2VktzVU9ydmtG?=
 =?utf-8?B?bGp5L1ZFQ09ZZHJJUWFwTzNTMVRYcWtuRDlmN1B6L0dOdzBuV3licFVSUWJ1?=
 =?utf-8?B?VjBmbktzOXdVdGpmdUdTQ2h3Q1BUSG5mSXdVbjBjbFpKZUQ4M0RpeGxBNFBy?=
 =?utf-8?B?V2gzVDNYVSsvOVFVMGdWYWM2cmJPcmk0K1UwaDc0ZjBlS0dDQTdabFpBMjFC?=
 =?utf-8?B?bU9veHhMVGhRNFVaRjZKV1d2b1lBSGRiZVFjbWxpc0pWdUYwZDFLSjk5TnMv?=
 =?utf-8?B?eFgzYlhxMCsrakJIYUhyU1dqVHUvZ1phUWVMOVh1WWY1YXFpVzE4VmlCa2xp?=
 =?utf-8?B?Mm41RVBEWWpPbld6N2p1MTFFVG5RbTlpaldXMWNqK1UrVFROalRYcnhhblZh?=
 =?utf-8?B?bCtTRDJkUVRZS2l5V0M3UG1ieEhsQ2FSNTJwVEs4bWhMSDI1aDVySkR5OVh0?=
 =?utf-8?B?TDdTMFdJMWlNTWZkUngySVI4Z3dMRnN1bjlmUkJxUGJYekNkUkpwR1M0ZWNq?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9416f2-88f2-4b8d-ef44-08da9fa50d69
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 09:54:07.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghyPCRZBNSPsJhy46IiLz5riEWHOO7ltLHCG0ab/x15d7aZXRhbufQd0SW0aK1f9Nss9Rzp1htIyOWSXFIAxe74eI5Lx6GPHAVUgWeV6ysM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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
Cc: Tom Rix <trix@redhat.com>, Daniel Latypov <dlatypov@google.com>,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 mchehab@kernel.org, mauro.chehab@linux.intel.com,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,

Thank you so much for taking the time to refine and update the code and 
checking out where the side effects that I missed may occur.

On 9/26/22 3:37 AM, Kees Cook wrote:
> Add overflows_type() to test if a variable or constant value would
> overflow another variable or type. This can be used as a constant
> expression for static_assert() (which requires a constant
> expression[1][2]) when used on constant values. This must be constructed
> manually, since __builtin_add_overflow() does not produce a constant
> expression[3].
> 
> Additionally adds __castable_to_type(), similar to __same_type(), for
> checking if a constant value will fit in a given type (i.e. it could
> be cast to the type without overflow).
> 
> Add unit tests for overflows_type(), __same_type(), and
> __castable_to_type() to the existing KUnit "overflow" test.
> 
> [1] https://en.cppreference.com/w/c/language/_Static_assert
> [2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
> [3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
>      6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
>      Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
>                                                      type3 *res)
> 
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Vitor Massaru Iha <vitor@massaru.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/compiler.h |   1 +
>   include/linux/overflow.h |  48 +++++
>   lib/overflow_kunit.c     | 393 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 441 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 7713d7bcdaea..c631107e93b1 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
>    * bool and also pointer types.
>    */
>   #define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_unsigned_type(type) (!is_signed_type(type))
>   
>   /*
>    * This is needed in functions which generate the stack canary, see
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index 19dfdd74835e..c8cbeae5f4f8 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -127,6 +127,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>   	(*_d >> _to_shift) != _a);					\
>   }))
>   
> +#define __overflows_type_constexpr(x, T) (			\
> +	is_unsigned_type(typeof(x)) ?				\
> +		(x) > type_max(typeof(T)) ? 1 : 0		\
> +	: is_unsigned_type(typeof(T)) ?				\
> +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> +		: (x) < type_min(typeof(T)) ||			\
> +		  (x) > type_max(typeof(T)) ? 1 : 0 )
> +
> +#define __overflows_type(x, T)		({	\
> +	typeof(T) v = 0;			\
> +	check_add_overflow((x), v, &v);		\
> +})
> +
> +/**
> + * overflows_type - helper for checking the overflows between value, variables,
> + *		    or data type
> + *
> + * @n: source constant value or variable to be checked
> + * @T: destination variable or data type proposed to store @x
> + *
> + * Compares the @x expression for whether or not it can safely fit in
> + * the storage of the type in @T. @x and @T can have different types.
> + * If @x is a conxtant expression, this will also resolve to a constant
conxtant -> constant
> + * expression.
> + *
> + * Returns: true if overflow can occur, false otherwise.
> + */
> +#define overflows_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),		\
> +			      __overflows_type_constexpr(n, T),	\
> +			      __overflows_type(n, T))
> +
Did you do it because __overflows_type_constexpr() always requires 
__is_constexpr() to avoid side effects?

And is the purpose of this macro to return a const-expression when a 
constant value is used as an argument and return a bool value when the 
argument is not a constant value?

One more, to fix the build problem, the overflows_type() part added from 
this link 
(https://patchwork.freedesktop.org/patch/504377/?series=108945&rev=2) 
should be removed from this patch.

And in other parts of this series, places that use macros added in a 
previous patch should also be updated. I'll fix those codes and send it 
as a new version.

Many thanks,
G.G.
> +/**
> + * __castable_to_type - like __same_type(), but also allows for casted literals
> + *
> + * @n: variable or constant value
> + * @T: data type or variable
> + *
> + * Unlike the __same_type() macro, this allows a constant value as the
> + * first argument. If this value would not overflow into an assignment
> + * of the second argument's type, it returns true. Otherwise, this falls
> + * back to __same_type().
> + */
> +#define __castable_to_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),			\
> +			      !__overflows_type_constexpr(n, T),	\
> +			      __same_type(n, T))
> +
>   /**
>    * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
>    *
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index f385ca652b74..9331d6ce914e 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,9 @@
>   #include <linux/types.h>
>   #include <linux/vmalloc.h>
>   
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +
>   #define DEFINE_TEST_ARRAY_TYPED(t1, t2, t)			\
>   	static const struct test_ ## t1 ## _ ## t2 ## __ ## t {	\
>   		t1 a;						\
> @@ -246,7 +249,7 @@ DEFINE_TEST_ARRAY(s64) = {
>   
>   #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
>   static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
> -{							   		\
> +{									\
>   	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
> @@ -708,6 +711,391 @@ static void overflow_size_helpers_test(struct kunit *test)
>   #undef check_one_size_helper
>   }
>   
> +static void overflows_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	unsigned int var;
> +
> +#define __TEST_OVERFLOWS_TYPE(func, arg1, arg2, of)	do {		\
> +	bool __of = func(arg1, arg2);					\
> +	KUNIT_EXPECT_EQ_MSG(test, __of, of,				\
> +		"expected " #func "(" #arg1 ", " #arg2 " to%s overflow\n",\
> +		of ? "" : " not");					\
> +	count++;							\
> +} while (0)
> +
> +/* Args are: first type, second type, value, overflow expected */
> +#define TEST_OVERFLOWS_TYPE(__t1, __t2, v, of) do {			\
> +	__t1 t1 = (v);							\
> +	__t2 t2;							\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, __t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);	\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
> +} while (0)
> +
> +	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
> +
> +	kunit_info(test, "%d overflows_type() tests finished\n", count);
> +#undef TEST_OVERFLOWS_TYPE
> +#undef __TEST_OVERFLOWS_TYPE
> +}
> +
> +static void same_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	int var;
> +
> +#define TEST_SAME_TYPE(t1, t2, same)			do {	\
> +	typeof(t1) __t1h = type_max(t1);			\
> +	typeof(t1) __t1l = type_min(t1);			\
> +	typeof(t2) __t2h = type_max(t2);			\
> +	typeof(t2) __t2l = type_min(t2);			\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1h, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1l, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2h, t2));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1h, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2h, t1));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2l, t1));	\
> +} while (0)
> +
> +#if BITS_PER_LONG == 64
> +# define TEST_SAME_TYPE64(base, t, m)	TEST_SAME_TYPE(base, t, m)
> +#else
> +# define TEST_SAME_TYPE64(base, t, m)	do { } while (0)
> +#endif
> +
> +#define TEST_TYPE_SETS(base, mu8, mu16, mu32, ms8, ms16, ms32, mu64, ms64) \
> +do {									\
> +	TEST_SAME_TYPE(base,  u8,  mu8);				\
> +	TEST_SAME_TYPE(base, u16, mu16);				\
> +	TEST_SAME_TYPE(base, u32, mu32);				\
> +	TEST_SAME_TYPE(base,  s8,  ms8);				\
> +	TEST_SAME_TYPE(base, s16, ms16);				\
> +	TEST_SAME_TYPE(base, s32, ms32);				\
> +	TEST_SAME_TYPE64(base, u64, mu64);				\
> +	TEST_SAME_TYPE64(base, s64, ms64);				\
> +} while (0)
> +
> +	TEST_TYPE_SETS(u8,   true, false, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u16, false,  true, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u32, false, false,  true, false, false, false, false, false);
> +	TEST_TYPE_SETS(s8,  false, false, false,  true, false, false, false, false);
> +	TEST_TYPE_SETS(s16, false, false, false, false,  true, false, false, false);
> +	TEST_TYPE_SETS(s32, false, false, false, false, false,  true, false, false);
> +#if BITS_PER_LONG == 64
> +	TEST_TYPE_SETS(u64, false, false, false, false, false, false,  true, false);
> +	TEST_TYPE_SETS(s64, false, false, false, false, false, false, false,  true);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = 4;
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, int));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(int, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +
> +	kunit_info(test, "%d __same_type() tests finished\n", count);
> +
> +#undef TEST_TYPE_SETS
> +#undef TEST_SAME_TYPE64
> +#undef TEST_SAME_TYPE
> +}
> +
> +static void castable_to_type_test(struct kunit *test)
> +{
> +#if BITS_PER_LONG == 64
> +	u64 big;
> +	s64 small;
> +#else
> +	u32 big;
> +	s32 small;
> +#endif
> +	int count = 0;
> +
> +#define TEST_CASTABLE_TO_TYPE(arg1, arg2, pass)	do {	\
> +	bool __pass = __castable_to_type(arg1, arg2);		\
> +	KUNIT_EXPECT_EQ_MSG(test, __pass, pass,			\
> +		"expected __castable_to_type(" #arg1 ", " #arg2 ") to%s pass\n",\
> +		pass ? "" : " not");				\
> +	count++;						\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE(16, u8, true);
> +	TEST_CASTABLE_TO_TYPE(16, u16, true);
> +	TEST_CASTABLE_TO_TYPE(16, u32, true);
> +	TEST_CASTABLE_TO_TYPE(16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(16, s32, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s32, true);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE(16, u64, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s64, true);
> +#endif
> +
> +#define TEST_CASTABLE_TO_TYPE_VAR(width)	do {				\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expressions that fit types. */				\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), s ## width ## var, true);	\
> +	/* Constant expressions that do not fit types. */			\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width ## var, false);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width ## var, false);	\
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(s ## width ## var, u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(u ## width ## var, s ## width, false);		\
> +} while (0)
> +
> +#define TEST_CASTABLE_TO_TYPE_RANGE(width)	do {				\
> +	unsigned long big = U ## width ## _MAX;					\
> +	signed long small = S ## width ## _MIN;					\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expression in range. */					\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width ## var, true);	\
> +	/* Constant expression out of range. */					\
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width ## var, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width ## var, false); \
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width, false);				\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width ## var, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width ## var, false);			\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE_VAR(8);
> +	TEST_CASTABLE_TO_TYPE_VAR(16);
> +	TEST_CASTABLE_TO_TYPE_VAR(32);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_VAR(64);
> +#endif
> +
> +	TEST_CASTABLE_TO_TYPE_RANGE(8);
> +	TEST_CASTABLE_TO_TYPE_RANGE(16);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_RANGE(32);
> +#endif
> +	kunit_info(test, "%d __castable_to_type() tests finished\n", count);
> +
> +#undef TEST_CASTABLE_TO_TYPE_RANGE
> +#undef TEST_CASTABLE_TO_TYPE_VAR
> +#undef TEST_CASTABLE_TO_TYPE
> +}
> +
>   static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(u8_u8__u8_overflow_test),
>   	KUNIT_CASE(s8_s8__s8_overflow_test),
> @@ -730,6 +1118,9 @@ static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(shift_nonsense_test),
>   	KUNIT_CASE(overflow_allocation_test),
>   	KUNIT_CASE(overflow_size_helpers_test),
> +	KUNIT_CASE(overflows_type_test),
> +	KUNIT_CASE(same_type_test),
> +	KUNIT_CASE(castable_to_type_test),
>   	{}
>   };
>   
