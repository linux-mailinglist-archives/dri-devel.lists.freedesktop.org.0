Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C385E67C0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436F10EC46;
	Thu, 22 Sep 2022 15:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E1910EC45;
 Thu, 22 Sep 2022 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663862200; x=1695398200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zxEssQoI5oigJ2gVSbMMYU+tbwPPO79MYZBpvQAIMe0=;
 b=d6rZsDdlViXOJ5WQ56wx1sUEdNvZsvg/iyURcNqUoCzxqFsX7w/Auh7X
 ndXWl32/ljms3PwgIeiPiZVSZ8MdJOfGid7+NbNfyb51ptkTQd7WdpakK
 VtiYEWDe0yYS55Qy50crdpWRc+ZNFYy1UFo+OBcQ4U2n4/fmaVgp89oXU
 64u4p1VcLCsRSpdAYUGVu14EXSqV48bD7fR0b25tA9it+PM3h/yFW19Nr
 yUk19/5pstKXYrNHTQXjNXLrF8YwFUGT+6tLWgSyl1tcV3Dfvh5j+R9rv
 EUMSqadTgEmUCc6I3JW8EXr5NK96w3zPQeFWyCeS+YzsIMWxkC4qDCdjA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="287422269"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="287422269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 08:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="795141846"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 08:56:39 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 08:56:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 08:56:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 08:56:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 08:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDQyy12MJQL44l4nOOkARizNBWaXp3Ow7abzKj/ROtABNwcMCqgsVy++UfoWSU0WbaIkyIVWM6Vj3HRmSm7xVG0DBz7sEtKBlKnfT+BkK0py0A7rcBUm/lkHJZcXydm40V2RCS0C12mKvxGU3kSeZxkdVMXSXJxP4Yavs6AZgyxvThSOixFyE/JAK3MCmEdFQTSzolQn+G98RQtQyW4JIlSrVTBkDxsrDWWlY4qkipxeXHsUOB85RLROHwkmzdmOQcRNB9zl5ZxWJV4+JgszU0++vd0GCizxfOS1i9F3n4QA3MeU+tV2pY3ECOKn/nkxOQ9VMzqNJmYw5Igv7Nqa1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu5DNA06CybEIQiFzcYjMJc4K+o9riE/cg69J9Rd1Qo=;
 b=Pay0XYJIGTbsAo6gOLHCYIBoKBP4MbaCCJFkFhmL5NiO6q1b2R3dANZng3y5VEKtxMNMTJwJPVLSIxFT1v9lNY1XjIogKjnXuDHyzzVUjZLrIGFK9ysMKIqCUxDio5zF2eMZIuhM47e7dxux+MCoawjXxcv6SKVeunKEBtBLnRS2XxO92cVpUlDuvP17GV0B/WdxwQ95PDeIpNPP1V0seQhYFnS09B9kpOaD+lBoWFdXFam6uZdJQ1fDsn7MXQZr/IuOAXPMdH/x+X/dYRyFP3k9gvvYlaQMwAEceB7d8ZheF//YB2zeDZ/iaqeqMxV2g7MzpqmXIR2ojPtRD3vtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Thu, 22 Sep
 2022 15:56:35 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 15:56:35 +0000
Message-ID: <0b8b6a12-5cb7-0f11-1a10-a998dde4d2a2@intel.com>
Date: Thu, 22 Sep 2022 21:26:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
 <20220920200512.pjjehlrebcr63uf2@ldmartin-desk2.lan>
 <e5d340f9-848a-4bf8-29a3-2bbdbcf7ed4a@intel.com>
 <20220922135654.a5s3hamrocvqsef7@ldmartin-desk2.lan>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220922135654.a5s3hamrocvqsef7@ldmartin-desk2.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::9) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eda95f1-a333-442e-6569-08da9cb306e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lCdwUxBiViusDpQPCqRE8FHS/3Jrshgvo9DduBRCO1aKErVshFPs31BRTZMsT6sXewYR2s2Aongji1Z2217Zcr3yne6Lm+EdanPVUQx5NCabRqYaKzVdEuI9ktZPC+kciCJrHVWOLpPOIYM5PASzC2vK9pJyJgMQ5CzRAHywDdBH2aAnfTd/F5dEAzGl8/+SgIfK1dmsgI10uuFnfNOcW1srMTuwh28CL0Jqpl0zexpUF9qzx/1u8tGizE+k0ZEkJxgiZojzyChBCIt8xKM22Sco9FhDZz3a2lv2KEl5pvFj6R81jcOp8LKq+/lAkGYK0gvMnl47LAySf0gN6Sjf2pKlsd9HInfDt5syFRaaw+xnvwkYpK/QIN5IQaiLsfm5jLpkMMRwEgEt3Dnd5vx5TLm5isrmuVEgioGF+KOOgmtLZdPGdwBy8fC7uKRS9NxLHJLE8Qt4YJf1fl0MlklVjoymj+vx+kBWxfmJkwexCfcjJ95kd8WWhq82pJdxqECG0z/mwvXP8JUaIvekhUNVuORRNNpZ/zQRuMNfr8V8sc44JFGx/6k4kHHnuAwuLY7dmYxXyuNpLAesAMhHyium5SsMnRrSbT3qPWSxcklEy+QotQ3w2TqIVyMzL21hIdDyWP2uwxTl46p5P5Ra9fVNsTXm4d/QnC/oy8NMEQ+iita+bIS7rdJhbdh5jWou1lO69BIuGHmHE8VbBYDf+tFXeEHeNW3/1sXtFsNogY3TgtIR1+nE/1ulsqM9TO+pMtT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(6512007)(6506007)(2616005)(31686004)(26005)(82960400001)(53546011)(6862004)(31696002)(6486002)(478600001)(38100700002)(450100002)(966005)(2906002)(5660300002)(66476007)(86362001)(186003)(66556008)(41300700001)(6666004)(83380400001)(6636002)(4326008)(66946007)(8936002)(316002)(37006003)(36756003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFzZTFPRTUyanl4UnZVV09sdWo5LzMyN1c4Q0NQTHpoTlh6SUdVRXRhSXNp?=
 =?utf-8?B?SUhrWGVUVjFFd0dYSTZtbVZLNTBzcXdDR2JPUGpMZjVSUXhOT1pDcjByS05t?=
 =?utf-8?B?UmxJTGtDSFQvYWYzY282Qi8vTjV4SlNkU2VaZmdHSjdHaTBPYW56djNGSHF3?=
 =?utf-8?B?WWxRT0trYU50Qk0xY0ZVamh5V29ZSW5oT0lrUVVCYnhVQU9qcXNlSlplWnk2?=
 =?utf-8?B?L200M0lFV1RzTGx5bTNETWZmUEtmZzcrU3d5cTM4VmtUN2V0RSt6L2t0dUFl?=
 =?utf-8?B?WHI2THNBZFBpNm9CRHhuL0VsdVJzK0ljM3I3WCtSLzdVRk9WU3Z1cFJaRGhl?=
 =?utf-8?B?ZktWeWl5OU1ZTTEvWS9lL3h5WldkWkpwTkJJY1cxd1FFMmNmamJQaTZxSHpY?=
 =?utf-8?B?UjcwMzQ5SXkwMERBL2VJdEVZRkdWSldwRTIvVUdnZDNXOUZxdHJvNXJ1TG5D?=
 =?utf-8?B?ZmtTZzBSdjI2dHBUYTBKTUFMR1ZPQUw0cllvV25mbnlXeE4xOVJTQ3M0bGdq?=
 =?utf-8?B?UUxLS290SDQvUFJNbkg0MnZCdmY3K0h4M2FENXlUQTVFeklOYUFtcS9MR1RC?=
 =?utf-8?B?N09vSTFZaXN2ZUVkb2ozOGlGdDNwTDJyT2k2UW01TFJXYVlwcS9IK3pvalpZ?=
 =?utf-8?B?VDJDaUlaYUNGejFHYjZ2emdQZGlXQTFmZUNhUGVvNkx3eTFJb2JPNk05a1Zn?=
 =?utf-8?B?UThBME1xV2dKd0JuM0FaV3RqN2p2NDJIZ0hvMDAzV3NiUjExa3cwSE9vU2dt?=
 =?utf-8?B?YkFOT3lBSEdubW56ZFgvQWxnOHQzM3JLU2w5Q2t5OURyeXg0SVF0YStLeFMz?=
 =?utf-8?B?ckhTcFpLRndaajQxQUtJZEN3YytCcHltaDZyODU1K1hPUklUb3hLZ1R6c2pp?=
 =?utf-8?B?UnNWNWk2YllXYThkb2kxS3ZKWFN1YjVEaFdLSEo2Y01HQXozOG5pSFZmTzVD?=
 =?utf-8?B?Tk9oRVhjbEZZWUhLMkYyYURYMDc5TjU2c0NaeXhJaTlTMnBSNnppV0hLS2RC?=
 =?utf-8?B?V0VXenZCRTFCWTEvZk9TekdrdjA5aDNnUjEzZ3FKU0I0NlNsY3ZnVzJ0NXJD?=
 =?utf-8?B?M3loQWc4ZnhTYk5jNWc0UmwrYk5VaVdZbEdhUG9Na1dCNWVCQ1JpajUzNHNR?=
 =?utf-8?B?RlN2SEZlNVd5WFJLRUdzWTJvSjlRdFIxd09GSEpuS3V5QmNxb0F1NkdtVXpQ?=
 =?utf-8?B?eVVLdGpCcGE1UCtFZnlTc1A3UUY3KzNhM2V2dklvZ0pobkpTL09IQmcvVTVu?=
 =?utf-8?B?d3hsNFJ1ckJUODRSc3l1enRQcUtZV3VmWm5IekJ2b3BkOFFaQ21ibDBDRkRk?=
 =?utf-8?B?ZVpLb0YySk5uWHVDdkhLVjh5Rzh6VGJsWG01OVR3djVtVkZ5NHpEdThVcUVZ?=
 =?utf-8?B?OEcyVWVqRXNLQ1JNN29TL2hHSEU0UDVvK2wyN3cwNDNyK2VaQjNSdzdNS2hn?=
 =?utf-8?B?WmVEVDhPTzFWTHduVHN4M1JEc1BpcDRtek81TU1jWEpxRmpkWHZCZXBDbEcx?=
 =?utf-8?B?TjVNQVVhcVVVWmtvQVJDMzNzZXpOTjNJVWpYQ0t3SzRmQUEycU9MaGFPQmgr?=
 =?utf-8?B?dEdITXZkWDBTNEo2TEdycGR2Q25rZk5FQXdZcTVzSGNGT0lDK0lXMjVoZFhH?=
 =?utf-8?B?bzdKQWpXQlhWOTE0eW5pQ1lTdVA5NG9JdzgrckoyemkvamFCVXUra1hPU2RW?=
 =?utf-8?B?eFh1ZTFiMjZCeXo3eUt4dlhHdkdsM3FvK1lHMW1mYzFPTUN1bG9WNEpUeU1a?=
 =?utf-8?B?NGoxVG9nQ0lLRlhpL0NYUEYyRHAvZzdjM1lOcDJjWkpxWlpVSjFUNUV3MjFz?=
 =?utf-8?B?eVRzdlpvN3FNNFpXSDNGK0VTZnpHb0hYOUgrTk9NbDlYZTcyVi91RmVXREw5?=
 =?utf-8?B?RGFKL2t3THJkRk80UVRiRWJvelk4dnZTalhQS0NEMXJ6OU1sUVZPK3BSL3Vi?=
 =?utf-8?B?V2hkc2NrS2FlZHp6WS94RHZ3eWtxR0UwdVpHWXpxSHd1Z2UzOFhGYll6dTh6?=
 =?utf-8?B?dXdpaGpJUEJuSTE2OWNFQWRTdFlXeXBtUG5qNGlyUzhDb1VYbFd5YlJxSTVy?=
 =?utf-8?B?dzlVeGM3cUhKcHJOZ1dLd3pxWVJJaHIvRWpGYjl4ZVpBeGVMMWd0OE1IZkdM?=
 =?utf-8?B?T2RFSVBZc3NVbHVEMlc0SU1rQU9EdnNwRXVkT3ZNODBFNGx3ai9NRDFJNC9R?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eda95f1-a333-442e-6569-08da9cb306e2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 15:56:35.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YavF11myeUMTVFbXfDuMqD0cs0TeGMcybx84z9D9GbG/1+AJu9PdmlfOgBS4nsSIe46hnx+TgthimyWPyDEKoDuwZqQ9AMjQIxNZKaZHERQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22-09-2022 19:26, Lucas De Marchi wrote:
> On Wed, Sep 21, 2022 at 12:00:38PM +0530, Iddamsetty, Aravind wrote:
>> replying here for earlier comments too.
>>
>> On 21-09-2022 01:35, Lucas De Marchi wrote:
>>> On Tue, Sep 20, 2022 at 01:31:49AM -0700, Lucas De Marchi wrote:
>>>> On Tue, Sep 20, 2022 at 12:49:40PM +0530, Aravind Iddamsetty wrote:
>>>>> As an integrated GPU, MTL does not have local memory and
>>>>> HAS_LMEM() returns false.  However the platform's stolen memory
>>>>> is presented via BAR2 (i.e., the BAR we traditionally consider
>>>>> to be the LMEM BAR) and should be managed by the driver the same
>>>>> way that local memory is on dgpu platforms (which includes
>>>>> setting the "lmem" bit on page table entries).  We use the term
>>>>> "local stolen memory" to refer to this model.
>>>>>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>
>>>>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> Original-author: CQ Tang
>>>>> ---
>>>>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
>>>>> drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
>>>>> drivers/gpu/drm/i915/i915_drv.h            |   3 +
>>>>> 3 files changed, 100 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>>> index acc561c0f0aa..bad5250fb764 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>>>> @@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct
>>>>> drm_i915_private *i915,
>>>>>     mutex_unlock(&i915->mm.stolen_lock);
>>>>> }
>>>>>
>>>>> +static bool is_dsm_invalid(struct drm_i915_private *i915, struct
>>>>> resource *dsm)
>>>>> +{
>>>>> +    if (!HAS_BAR2_SMEM_STOLEN(i915)) {
>>>>
>>>> I called a similar function as is_dsm_valid() in
>>>> https://patchwork.freedesktop.org/series/108620/
>>>>
>>>> sounds weird  with "invalid" and the double negation on return early
>>>> style.
>>
>> sure, will change it hope i can use that from your patch.
> 
> that patch is now pushed, so now you can reuse it.
Thanks for the info and help.

Aravind.
> 
> Lucas De Marchi
