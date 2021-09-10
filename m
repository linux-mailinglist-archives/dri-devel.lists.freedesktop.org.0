Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31C40694F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 11:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6186E9B6;
	Fri, 10 Sep 2021 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662396E9B3;
 Fri, 10 Sep 2021 09:53:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="243362019"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="243362019"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 02:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="505001621"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2021 02:53:00 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 02:52:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 02:52:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 10 Sep 2021 02:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh96ZxG34r2g+O4h7oUdDk/fa1qIiCWzLdw39UtOdXp80uk5UD+Dm7pT3xhNznXBm+dfIHIGTkWFPYwLpbmptUdvyH3H6Un6YCLfISfQBxMufkSLzlC11c/1IiBq4jy1zEaY0xb+MjdUFnH/tputkERXVtroxmimF1PyF/uqAxkCmsl7euuBfJ+7GMa6FsxCLM+8Idbe3o1Yepb1o5vd0lZO4Ov2/UgyIvlxPhrpAP8Ak/eXXG4Hg2fUqoFB+O9bA4r4sw81cLhTwxRvidC5K0fh4YblZreNPIdJcyuJz2YJ3C1sNS6NtHmmSeATKQg+XR4S7JCJwU6ayN5ZUDh/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ybbh6oXPd59uXJuGZdUHBvh2emDi+b+8Y1NKeIKeS0U=;
 b=O+4bRx0a6SwhqthRtcHMxn8uyg13kZfzWkUly1Q2KM2s4b3vWVWBTNgl8Mp2YZpMfMjf1KyNi2/WbXOrTobNzx/csmw6lwsZxjtqHxhypTRcObVqhPnB1UpIRs+9t/DMoTqLj7HzOJg0lEdpJg8iw8ohibhLbxL1fIuJesuXLHCByVewYQFKUL02KKQjioJDWx/KKMatCdEnvZ32rgCknYhTUc76TDs+j04NCH91BL8/uhNewzGNzsepA8cOcPgQ1yKKpcFzb3it/WN4hsdP31a2kZ/K95+cY+ukvise677R+2jLiQfzU5DcvxXOUpV4I5iX4KIddBCoSJQm/+pABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybbh6oXPd59uXJuGZdUHBvh2emDi+b+8Y1NKeIKeS0U=;
 b=qPlDcwLoQoTRxQzQDj5yowJqSoTmx8kkTso3s/a1qF+5tfUl9V0tey7pEDEj3BHYMBWab1l5qVoWS016kfgZZG72qhwGB9vc8WemG7m7gVdEbUF4KAtX/AXON4XjdHmaXttBScc3ihmhwfk86ybXnnnNrOYAJijfPNO7uqdgpV8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1465.namprd11.prod.outlook.com (2603:10b6:4:7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Fri, 10 Sep 2021 09:52:54 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%8]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:52:54 +0000
Subject: Re: [Intel-gfx] [PATCH v8 16/17] drm/i915/pxp: add PXP documentation
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
 <20210909122915.971652-17-daniele.ceraolospurio@intel.com>
 <YTp7xTNtJlDa55AA@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <1175e3d1-5653-2020-66e9-44df78eb6f12@intel.com>
Date: Fri, 10 Sep 2021 02:52:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <YTp7xTNtJlDa55AA@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: DB7PR05CA0054.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.56] (2.236.112.29) by
 DB7PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:10:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b466aeb1-9522-442b-29f5-08d97440c2c1
X-MS-TrafficTypeDiagnostic: DM5PR11MB1465:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB14658EF6BDC4A4EAFB8B460AF4D69@DM5PR11MB1465.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cucdkZ5w5Zk+AqZ4sZ/HNHYZmXD6YpuQf+LDrAef+PZjLJ/icifcEljxV548fD2RECxSPltjqUf7aLrRDkMkTV6Wf826f8mJBD3ZFyQ/lUxq6iwst23f/AbQouNrwHDma63ubtO9mP0x7sSu8MwWTRykBZKRTesSkm1iyIMqjjGlVlkLp5NLG+NvOhtWR7I51FFS5POAExjMzBMgw4AZTxkWy2Fv1rHLFDSz+vhlp9clUG2qRxS/Jnxgq1GTOCtTTs4+hf9A/KrNxF9Ull3Fc+aPLjwyYn3V42r9dPdC9ouSpXbfHNgsDd+ETuf2qHlAjdPXGflkQ5oiyAB1vM6nBvmCVLP1xnTeiGCkh7py2r4yeMEyjjcL0TYPo5yw10LKb5xFZiC6oCyfbF2YN6eMvBVrTMwhDQtNRN8IuqJMuKTNWVde09nvmpjGQy++Bn/Y7Kw5qFjvtlx2dNR+GEnARx+iZdOmsg45ox5kxLeJcICIUJIa2HvhoVjKiu/bnK2UfNd4hQc6JGvzm0iQsTXduzw3WmIiCOwHLahOnYzOHGWlwJAvIjQ2qlCID/z/N39rn+fsZCbfu5FWj/u/Cff36HXegaCATYfr2OiirMtF3lpe+gtCGhmrN/MQrH9LnjjL+Ctcd2N/onJUPC7sMt8sMW14qezEdMvgUZMPuoAFvFgsPX+2k0AHOIBh/Z6tSlEU7tqUTSEUVstaecdPatCBWQLMlmQBTNPx9HQMAG0S84Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(26005)(450100002)(4326008)(53546011)(8936002)(2906002)(31686004)(38100700002)(37006003)(66476007)(6862004)(66946007)(186003)(5660300002)(66556008)(6486002)(478600001)(83380400001)(107886003)(16576012)(956004)(36756003)(31696002)(2616005)(86362001)(6666004)(6636002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZDdUYxOWF6Vldvc1lIcStJbHZES1k2OWorN3J1MkJYMnBRdHJ1ck9JdUVP?=
 =?utf-8?B?NjBWeXVZZUVxcDZoYXJyUkFkdEk4TmxEejRRQ1g2TXRSR3QzL2N6SkdoNDlO?=
 =?utf-8?B?S1NhU1JTSEZXNDl2RHd2RGxyOG10TWZKRG9XVFV4dmQ0TkV2SWZpeUJIMVly?=
 =?utf-8?B?ZFlWdXNnbmVibUVHNS9jNUNMZ3p4TWE4NmdWaE1qbktNc0t6YVd4U0JHWXRU?=
 =?utf-8?B?c2hWWEZGS2lBZWoyb1NXVSt4RG1xYnM4cE1lSWZYUW1nZDljNWYwb214ZjBq?=
 =?utf-8?B?UjA0QXRwQUpDMHl6K3YzTjc3WmpmMnp5enNjWUdzamZBK09Gd0ZpSFlyMHFv?=
 =?utf-8?B?UXJzby9NTUZIdm52TnhkeGFCVUprcys5ZzZyODhkNHd0WWZPZU5Yd2M2Mndr?=
 =?utf-8?B?eEtFOG5kOTNMcUVUOVBvTEZRUGZVdlg2SEJGMmxEKzA5cDNmREx1Y2ZlUGlk?=
 =?utf-8?B?aTJvUFRpZVFPdlcxOVdkajl2MmQvMkEvZDNPK3hOWEJBeExhc0FUeVExdVNs?=
 =?utf-8?B?aWsrRHBoM01QVjI2TksyRUswdFpSZ1M4M3ptd3pZTjdUdDRibTlyR2tadTNp?=
 =?utf-8?B?dEVUK1RvVzdVSmdBS21KdmxQR0h1dWJNTDdYaHVUcmpvK2hKVGQ5Sy9rY3Vv?=
 =?utf-8?B?MnJLaFR6cWVxTjdhRlEvcjlmSWR1WkxZVDU5ZHF1VXduMlFUM0JKcFdFNW96?=
 =?utf-8?B?QmxQUDVzTmxWRVBYTjZCS3VlVFQxMFpMYlhOZkIyS1lxdEgxV3N1cWtUSVcr?=
 =?utf-8?B?WU9nT1I5ZE95UHhXVkR3NGk5YUdXMGFQaUhrTksrbjRoeG1pN2xuNENxUlRv?=
 =?utf-8?B?SHBEYVJsbG1XYmFLb0E2a3lCOCszRi83TGp5VW1pUWlUTVZ2ZVBNL1FNY2RN?=
 =?utf-8?B?cmcwc2tRN0liU0tpejByazRrT2Q1aWNrRkJJMmtCWW5PNytFeEIxVzhLdyt5?=
 =?utf-8?B?bXpWQS9wNU1LTlp2MHZqVzRJdE5VUFMweDlOclMrV3RFVU1WZnVlWVdqLzln?=
 =?utf-8?B?MGU5ekRtMU9Yb3dJQzIzR3pPbzRISjNaTEE2OGMzMGpKYjVhUXRjd2J1bDFT?=
 =?utf-8?B?L28wQWdSY2hBRmo4R1VVcU5ZUGM5UHpvbWJGZCtPM3ZueG14UFJMWk1iOC9C?=
 =?utf-8?B?S0hxYVhhTVMzeFV1WjZldkhQR0puLzFIaklPbFg1VHlNM2hFcVFZRUpwUDh1?=
 =?utf-8?B?U2tSUHVGemhJR1VuTFJQVTdKWW10ZGhjbnY2RGIzQWxldU8yRWZ4SnRQOEI1?=
 =?utf-8?B?d1lxRnpnem9DU05iUkJlQkxZSjhWcVFGTW1WL3JrNzJYTjkySUJ4eUdSMC95?=
 =?utf-8?B?eENjSmhZRWlsdy9WVDZKYW41ZTRmZ1pYcVQ2WElDbTlHbzZqeDVjcURETHBh?=
 =?utf-8?B?bmtpL0pCN211ckZPT1prSWcycitzRDk0VGNPaHE1MkxkcXBwWElmR1BPaHdZ?=
 =?utf-8?B?ZERUb0N5MFhuM0h4cUxXTDJZU3hlWHR1THE4ZEZLTTJQQVg1L2pTOC9XUFNq?=
 =?utf-8?B?U2hUSXUyeVVMcW9YRGJUaEpiTExBckoweFRoUGQ0ZUFyNE8ySk03QnZuQlE1?=
 =?utf-8?B?TjNWaFlNMmxYYnlWbDFOeDhBUWRScThNZlVoYlZIRXd2dzkwcThuNGF1NkU2?=
 =?utf-8?B?dmxRbjc2eUh1YTRCbXMzRWZCckZiNnVXRERWZGl3ZXJxbmRmVXNxazY1NDh1?=
 =?utf-8?B?MmVlZHNZVERscU9PYUhzVDJhOHhRUmhvYWdmTWZ3ZXFISkV3WDdLZnM1NGJT?=
 =?utf-8?Q?9QZCBnXFRB82gDOq8yLWDBwu6fhomkMPW7tC0bP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b466aeb1-9522-442b-29f5-08d97440c2c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:52:54.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUTBfzqZN2UCIAQeG4kttR5Askwjql/0D5T/Aao/UJiALr/bf+BB9QEMlZ7ij31mWf9kjMAEEkSUQc0E/UM41D6xLEmlvnRQ8LfGOywKCfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1465
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



On 9/9/2021 2:25 PM, Rodrigo Vivi wrote:
> On Thu, Sep 09, 2021 at 05:29:14AM -0700, Daniele Ceraolo Spurio wrote:
>> Now that all the pieces are in place we can add a description of how the
>> feature works. Also modify the comments in struct intel_pxp into
>> kerneldoc.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/i915.rst                 |  8 ++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 28 +++++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h | 47 ++++++++++++++++------
>>   3 files changed, 71 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index 101dde3eb1ea..78ecb9d5ec20 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -471,6 +471,14 @@ Object Tiling IOCTLs
>>   .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>>      :doc: buffer object tiling
>>   
>> +Protected Objects
>> +-----------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp.c
>> +   :doc: PXP
>> +
>> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> +
>>   Microcontrollers
>>   ================
>>   
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> index d8815e91e091..4e095a9a9f07 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>> @@ -11,6 +11,34 @@
>>   #include "gt/intel_context.h"
>>   #include "i915_drv.h"
>>   
>> +/**
>> + * DOC: PXP
>> + *
>> + * PXP (Protected Xe Path) is a Gen12+ feature that allows execution and
> We should start avoiding the + naming to identify this-and-newer. This will
> soon conflict with some other Xe naming.
>
> what about something like:
>
> PXP (Protected Xe Path) is a feature available in Gen12 and newer platforms. It
> allows...

ok

>
>> + * flip to display of protected (i.e. encrypted) objects. The SW support is
>> + * enabled via the CONFIG_DRM_I915_PXP kconfig.
>> + *
>> + * Some of the PXP setup operations are performed by the Management Engine,
>> + * which is handled by the mei driver; communication between i915 and mei is
>> + * performed via the mei_pxp component module.
> I believe this is kind of secondary so it should go below the context buffer
> and flag information. Is there any MEI mandatory command or something we should
> also make sure we document here?

no commands the user cares about, I only mentioned the module dependency 
because mei_pxp has to be compiled in for stuff to work.

>> + *
>> + * Objects can opt-in to PXP encryption at creation time via the
>> + * I915_GEM_CREATE_EXT_PROTECTED_CONTENT create_ext flag. For objects to be
>> + * correctly protected they must be used in conjunction with a context created
>> + * with the I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. See the documentation
>> + * of those two uapi flags for details and restrictions.
> Instead of pointing to see their documentation, could we add some concrete
> example of usage in this section? Our goal is to have documentation that exemplifies
> how the UMD could really use them, without having to go to IGT or Mesa codes to
> check for examples.

All the other usage examples are in the uapi file, so I'm going to add 
the pxp ones there as well for consistency. The user needs to check that 
documentation anyway for the struct definitions etc.

Daniele

>
>> + *
>> + * Protected objects are tied to a pxp session; currently we only support one
>> + * session, which i915 manages and whose index is available in the uapi
>> + * (I915_PROTECTED_CONTENT_DEFAULT_SESSION) for use in instructions targeting
>> + * protected objects.
>> + * The session is invalidated by the HW when certain events occur (e.g.
>> + * suspend/resume). When this happens, all the objects that were used with the
>> + * session are marked as invalid and all contexts marked as using protected
>> + * content are banned. Any further attempt at using them in an execbuf call is
>> + * rejected, while flips are converted to black frames.
>> + */
>> +
>>   /* KCR register definitions */
>>   #define KCR_INIT _MMIO(0x320f0)
>>   
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> index ae24064bb57e..73ef7d1754e1 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> @@ -16,42 +16,65 @@
>>   struct intel_context;
>>   struct i915_pxp_component;
>>   
>> +/**
>> + * struct intel_pxp - pxp state
>> + */
>>   struct intel_pxp {
>> +	/**
>> +	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
>> +	 * module. Only set and cleared inside component bind/unbind functions,
>> +	 * which are protected by &tee_mutex.
>> +	 */
>>   	struct i915_pxp_component *pxp_component;
>> +	/**
>> +	 * @pxp_component_added: track if the pxp component has been added.
>> +	 * Set and cleared in tee init and fini functions respectively.
>> +	 */
>>   	bool pxp_component_added;
>>   
>> +	/** @ce: kernel-owned context used for PXP operations */
>>   	struct intel_context *ce;
>>   
>> -	/*
>> +	/** @arb_mutex: protects arb session start */
>> +	struct mutex arb_mutex;
>> +	/**
>> +	 * @arb_is_valid: tracks arb session status.
>>   	 * After a teardown, the arb session can still be in play on the HW
>>   	 * even if the keys are gone, so we can't rely on the HW state of the
>>   	 * session to know if it's valid and need to track the status in SW.
>>   	 */
>> -	struct mutex arb_mutex; /* protects arb session start */
>>   	bool arb_is_valid;
>>   
>> -	/*
>> -	 * Keep track of which key instance we're on, so we can use it to
>> -	 * determine if an object was created using the current key or a
>> +	/**
>> +	 * @key_instance: tracks which key instance we're on, so we can use it
>> +	 * to determine if an object was created using the current key or a
>>   	 * previous one.
>>   	 */
>>   	u32 key_instance;
>>   
>> -	struct mutex tee_mutex; /* protects the tee channel binding */
>> +	/** @tee_mutex: protects the tee channel binding and messaging. */
>> +	struct mutex tee_mutex;
>>   
>> -	/*
>> -	 * If the HW perceives an attack on the integrity of the encryption it
>> -	 * will invalidate the keys and expect SW to re-initialize the session.
>> -	 * We keep track of this state to make sure we only re-start the arb
>> -	 * session when required.
>> +	/**
>> +	 * @hw_state_invalidated: if the HW perceives an attack on the integrity
>> +	 * of the encryption it will invalidate the keys and expect SW to
>> +	 * re-initialize the session. We keep track of this state to make sure
>> +	 * we only re-start the arb session when required.
>>   	 */
>>   	bool hw_state_invalidated;
>>   
>> +	/** @irq_enabled: tracks the status of the kcr irqs */
>>   	bool irq_enabled;
>> +	/**
>> +	 * @termination: tracks the status of a pending termination. Only
>> +	 * re-initialized under gt->irq_lock and completed in &session_work.
>> +	 */
>>   	struct completion termination;
>>   
>> +	/** @session_work: worker that manages session events. */
>>   	struct work_struct session_work;
>> -	u32 session_events; /* protected with gt->irq_lock */
>> +	/** @session_events: pending session events, protected with gt->irq_lock. */
>> +	u32 session_events;
> I know, nowadays our doc is too centric on documenting the internals... I mean, it is
> good that we have this documentation, but we should in general focus more on documenting
> how the UMD uses our APIs and less on the internals. The developers really interested
> on the internals would read this comment in the code anyway.
>
> But it is just a general comment. Since you already converted that to doc let's keep it ;)
>
>>   #define PXP_TERMINATION_REQUEST  BIT(0)
>>   #define PXP_TERMINATION_COMPLETE BIT(1)
>>   #define PXP_INVAL_REQUIRED       BIT(2)
>> -- 
>> 2.25.1
>>

