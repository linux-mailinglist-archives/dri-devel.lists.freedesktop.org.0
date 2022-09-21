Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD85BF66B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 08:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7610E850;
	Wed, 21 Sep 2022 06:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0DB10E850;
 Wed, 21 Sep 2022 06:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663741954; x=1695277954;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VSLWY/BlctHBfb6wLcs/AZuO+9ggKrWtbirfGkUgDbQ=;
 b=FXPDAi9ISphAa4YlUe8Oj3FLaj2WKABIxfs476wLrQzWt4jFbuui1NbG
 J6F3lOfzbUrg54+hwQsoizkWUEXfLjgPfE5FNw/f8k8BwC48a9ucHjehG
 R2yn+B4Ia4VxJhRHwxtH8HvIp23+s6AUWc/O3ayVGUlv6XK8qBBJzRBWQ
 mG/8jpt7x2ia/dyMCCbcl9KpmjXbOXxJU9g6H5B3ifyDvr8+by41O6RCc
 T9oIRbDxv4kOHOwKNUs83HeKsvFYxrBDl9prK3ePmjuGo34bZIQp/kzlL
 OEH5Ulaa6Ck011KiQqTJGu5czel3ED6JFrkG9HM+fjXwTRo2QIkOvLZQ0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="300750496"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="300750496"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 23:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="761624550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2022 23:32:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:32:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:32:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 23:32:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 23:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBMXTszQsvAPxHmwqYJXhAoRwe92n3RW9g3W74qA5OaTGlXF0I/ng7C5oQRaaGRURXryLhI8KTM1/FOj1PkXf/nPcUU5A9ioI3H9teEm+nO88EoWLA8PwZii8RCiK4sVyUawy4WEbZm5SSabqYnFs2Fj/m37dGkhdMMCpa15TRzL5sjUkYiQ3UL8yUXRzE91X5gu1dVnrEKRczxCGG/1+LY9H7TNCdisJOMX1KHLkmjuF3/iTxm0QjiZRDRzN00DH/cbwBtyEPqcaUF99zJaZtIwuzoTvSKH5lZxkscSbvcGYxZHbSH3SAhZd3wZ4+2pJue1T6DYZdmeesSIGNVn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yqms1bbcny4R+JHuSie2xyntLAbM0EHi6fzUwrexEk=;
 b=UCEg0s/vkZ8DlfIKuM+V5SAPXL2V0Olo8gzXITx0zFNBHbOF4NtBcY8Ks7dqJJSYgyTl0O/vBCaKbS0uY2lm53lQv4cds0cY8u8tOXIekIHEbKL8oIxXPJJ/vT7p9UghWd3HXacL0TZCVCOuAba3usqqA4K26+ZASF+OWvr8W9Fd933uhMcPDXxQz3iAH2jFksdPVNyKcoBoudUrUFE9L8ZZTgF2paQ9wdefdEZyYH5pObBsnKV6IL5piJeRum03NwM/PZgzvUJ+/wmuvUhIQYjJA6cWB9wBQRpzqpucyDFbZhrwU5eCdDczRkGgFL74gpWb8QzhrKaV0HL3D3L2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 21 Sep
 2022 06:32:29 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 06:32:29 +0000
Message-ID: <3567e9d3-4fea-98f4-67df-8d19d161f4bf@intel.com>
Date: Wed, 21 Sep 2022 12:02:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <87mtauo5vh.fsf@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87mtauo5vh.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: c29cb006-6ef0-4ab4-ed0f-08da9b9b0e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6qyvmiPcImPrUBJBL9mcya2sk/7fwokjf+mq/oSRYHWI8T7JEM0plSwKaCcXKUROBiiAdvMyI4sFqVht+FbluTDqm1V+is93z7ybQ2+4ok+5fOeESkOAGbAu+8yix43T+28wH+7GV00xCYtedhz/QXMaON3DAaxs7la1WUdGXkbpEGFV+zqzP1FN1xmCXxpxB+ow9paDbNXGZExRrEpsNw40S2KCqyckHdCa/7NBhZWYoEEJVkx/bt0ZPUEvV82Ot9Be70+2UR2xIlFNxT/GVL0O7cKjd3D3ibgbeGN559eq3pyrUy3c3AP4rDq3zqLVKmRNgQdParSPIDWayXi4tv2nlugi3r04zKNJKSR5u5XyxijiQnhfw8oSR57v3HA7pddilMQam2R5b8k7miSKc4O5SF7/LucfiVY3y6LsSKdtzYPG0KJazvEJMRkqQ7gfV90X1VCzq/tGyIz82CUTdr9Lryy6fSM/AGe/vgoyilhvWUVNovT/xWFKanqrO/fNEFFpIbijLl6oWN2tEbcSNjd8/tyWHCsiO+9nWJ4IWfc83AF9koH58S7m33aNv8WS8U9FTEv0LZb9xeBLj2U1zXDWQ9BwnqVfYUoTGC80dOilUD3R8+dplBoWYX9pTBHREclqTIMyJb5h6ezKLaIzkYt/DS59KH3QQygE4c6kDGgvHGZVtHDeIFQ2Wl765iaBM1RW28RP6V6pYZftVZ4eI7iDMvgxuNdVcCZMVM23fiPbrVLVa7hQAF1EtxH1IAmWVeURSVakee+7zUqqG3YCaTItvZc27U/AaVmAKy1LjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(26005)(478600001)(86362001)(66476007)(82960400001)(6506007)(31696002)(36756003)(66556008)(38100700002)(5660300002)(316002)(41300700001)(6666004)(53546011)(186003)(8936002)(6486002)(31686004)(6512007)(83380400001)(4326008)(2906002)(8676002)(66946007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTJiZjI0Y1NlQXJKRFJNRit2Vk9lT2R5dDlIMWQ5M041K0paQU96Y1hpNmlt?=
 =?utf-8?B?c1puRVJYdGx2dGFIMmpIc3VJZ2FyRzY4NHVEcHdhYmMvNXkya3FsNlhjUmRr?=
 =?utf-8?B?dm9IbU1SWTd1blFCakd5ZkIvV2F4TXFvdHRTOEJITTR6RkdLN2VQV05HS0V3?=
 =?utf-8?B?ZWlOQmd6ZU11T2J2bXBGei9BNWI3R2hOMWpNUGJRa1g1b3dSL3YwQ1hTUkNB?=
 =?utf-8?B?UCticC9iQWVmQVZTU3dESWhCL1dRYkdLcmhVNWtDTlk1T1lvd1lOb0xzREV6?=
 =?utf-8?B?bzExM3FTeW5aQzZkV2xabHc4S1pUSEFFSUpieWRTMnVDdHN2R1o4MW5GK2JG?=
 =?utf-8?B?VTlqVEk2cnN3M3dBNVVlYzh5SCtUMTRrMWdZVDVQNmg4RWtHL0RTQzlRdFFR?=
 =?utf-8?B?ZlVNeXg0ZmwvajA4RVJRSWMyVHM2TjV0QVZzVWFEM0VtRERxai9Qcm9LUU5N?=
 =?utf-8?B?N0ZzYWFDREVNR1p1R2ZEQ1FaS0NvMlc0U3VLVDBVL2JUc2JyZStreUdHR25x?=
 =?utf-8?B?eFpmTFQ5WUJGMy96SU9wdHV1SHBIcThHSElOL054c2ZFbHVnTXlGYm4ycDl1?=
 =?utf-8?B?VDBaUVg1cDRYMkJ4VDU2dzBHWFhQVEtBTTJBaFZ4aHdQNUtMZWNYMGNNMG9F?=
 =?utf-8?B?bzhZNjFLWk5BaWg3eFg0MTh5bzB1MHVScmg0dUQ4eVZHQk1kNENCcTBUbzhC?=
 =?utf-8?B?SG43MCtlSk93NGJPUkFva3ZlNGE3bkR5cFZXdTRpd0MvWkNvQ1l3Q2hCbVcy?=
 =?utf-8?B?S2VJa2tKeEEzVmxIYzNPc3drVjJWbldsYTFlQzNRdDM2Q2g2WmJHVkFzOGJl?=
 =?utf-8?B?amthcHF1RXJkL29OTHNoWVdweVJrT3FwYzFNeEJCeHBFamJXRzU4RmZhNFZI?=
 =?utf-8?B?Qlc5d3FmNmRWb04xSklaL29VZllWeGFHcW96VW5tbHBkSDRWZ1cxaWg2VGhS?=
 =?utf-8?B?dHZHRjJ1SEFuNk4xSFRBRklITDF5WDBrdUxxcXZvcU00SGtoaFIvbE5sZWd6?=
 =?utf-8?B?OEVMOXNmQXh6MncrTEI0dVFqUW1Xa04wVWQzMXpHM1BlRzlYam1WZ2sxM3JB?=
 =?utf-8?B?Nlo2VUc5S1A2TjRKZ1Jrc2JScXdvdlpVd0tZNHdpazE0a1N4cmlLemNabDE0?=
 =?utf-8?B?emJsWGdzV3BaRndSSWNJTFlPaW1FRjZPTU1CbnB0Rk5pNFh6TVRHd0ZNR1RF?=
 =?utf-8?B?bmVIeGJMeSszTTN4UVlYV0FEZnEyWkNodkx4V29Xd0QzWEhhbHoya3p4UXpV?=
 =?utf-8?B?d3M1dzVTOEhCMXVOT2lJTXJhL3BBNFZWMnp6d1piS1k4MU9nVkF1UWNoa3h2?=
 =?utf-8?B?QlBxSzRiZTF5TlZCSUgwY0V0M0s4REU1RndoUXlSZzdicWdWUTd2UkdYaGc4?=
 =?utf-8?B?ZU82NU10c1VRS2ZCVnlTemFqOXZMbzlzd3VqNmhVakUxeWk2UW5VVS9sZGg3?=
 =?utf-8?B?d0FtNzlPaFJvelowZk5rdkhyK1JwYWtZSUg0UlpKaHFQUHhRdEtIK1dIbFhU?=
 =?utf-8?B?bk83b0c3NGRiOXJtaldwQXBVbG50citValgrZFJ6VmFYYzlGSXlLVm5VMnJr?=
 =?utf-8?B?eC9YSjNWY2sxRUdqU0V6Q0JVc3lublYreDIxc2JMVnIzNkdIYU9oNmMzNkth?=
 =?utf-8?B?SGFuc0ZYUjNhSVl1NGp5N0dCYzhxUmlqNnVRMVlERDAybzZwdjFmbUFFdWVi?=
 =?utf-8?B?QUMvWktMdVVRZkw5WjNobVJ5VzBVWXdGWUhGT0JvN2tnWWpqRHlKd29jbytY?=
 =?utf-8?B?MzhlN2ZuZ3I4d3JyL2dLMTBhQVhkdzEwZEhxOTBnaFV1MlhvbUQzZmU4d0lo?=
 =?utf-8?B?em9WWFgvSHQxcUNKMXdKTlYrbGFoVUs5aDcyYWlqMEN5S3ZJL0dZNEJROVpX?=
 =?utf-8?B?K01scEwyenJENTVETThjTzhTeTgrVEtnNGlpeVJXY2lNYnZ6Znk3QlhRNzd0?=
 =?utf-8?B?OU1vWGtPS2RqblBQNlg5MkVRM2NlRkRVbmxsNVBjb3JYTzU0ZDBkYU14a1B4?=
 =?utf-8?B?TERNQ0oxN2NNZGtWRm5pVkFRRldIVmlGQU9qS015aTlaM2VaZ3RHOWR1TmhK?=
 =?utf-8?B?QVJmQTZ3RVVpcGxJT09aV0RQZi9UMWw0MGFjVUhEWDZIR0d1RDB2UU9odDFX?=
 =?utf-8?B?SWc4Q29pUmo2RGRzNUVLd0xHRWhNbGl2NXBDaWRXaFNpaU5iVS9HbG1PSGR1?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29cb006-6ef0-4ab4-ed0f-08da9b9b0e3e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 06:32:29.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db7YdNxbMGXDIX7eUcZJh7rbKaKH+vwxV5VusxvAoIupzo9ab8PrIvsupp8AYZ7vZ0LnUcIq3qdyTUbAp8zddo/jTaGFE7vHc1VlBlY+oRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20-09-2022 13:05, Jani Nikula wrote:
> On Tue, 20 Sep 2022, Aravind Iddamsetty <aravind.iddamsetty@intel.com> wrote:
>> As an integrated GPU, MTL does not have local memory and
>> HAS_LMEM() returns false.  However the platform's stolen memory
>> is presented via BAR2 (i.e., the BAR we traditionally consider
>> to be the LMEM BAR) and should be managed by the driver the same
>> way that local memory is on dgpu platforms (which includes
>> setting the "lmem" bit on page table entries).  We use the term
>> "local stolen memory" to refer to this model.
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Original-author: CQ Tang
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
>>  drivers/gpu/drm/i915/i915_drv.h            |   3 +
>>  3 files changed, 100 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index acc561c0f0aa..bad5250fb764 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>>  	mutex_unlock(&i915->mm.stolen_lock);
>>  }
>>  
>> +static bool is_dsm_invalid(struct drm_i915_private *i915, struct resource *dsm)
> 
> Abstracting this as a separate function looks like a separate patch.
> 
> I generally recommend using positive naming, "is dsm valid", to avoid
> any double negatives that might pop up, now or in the
> future. !is_dsm_invalid() gets slower for human brains to parse.
sure will change it.

Thanks,
Aravind.
> 
> BR,
> Jani.
> 
> 
>> +{
>> +	if (!HAS_BAR2_SMEM_STOLEN(i915)) {
>> +		if (dsm->start == 0)
>> +			return true;
>> +	}
>> +
>> +	if (dsm->end <= dsm->start)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>  static int i915_adjust_stolen(struct drm_i915_private *i915,
>>  			      struct resource *dsm)
>>  {
>> @@ -84,7 +97,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>  	struct resource *r;
>>  
>> -	if (dsm->start == 0 || dsm->end <= dsm->start)
>> +	if (is_dsm_invalid(i915, dsm))
>>  		return -EINVAL;
>>  
>>  	/*
>> @@ -136,7 +149,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>>  	 * overlaps with the non-stolen system memory range, since lmem is local
>>  	 * to the gpu.
>>  	 */
>> -	if (HAS_LMEM(i915))
>> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>>  		return 0;
>>  
>>  	/*
>> @@ -371,8 +384,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>  
>>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>>  
>> -	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>> -
>>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>>  	case GEN8_STOLEN_RESERVED_1M:
>>  		*size = 1024 * 1024;
>> @@ -390,6 +401,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>  		*size = 8 * 1024 * 1024;
>>  		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>>  	}
>> +
>> +	if ((GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) && !IS_DGFX(i915))
>> +		/* the base is initialized to stolen top so subtract size to get base */
>> +		*base -= *size;
>> +	else
>> +		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>  }
>>  
>>  static int i915_gem_init_stolen(struct intel_memory_region *mem)
>> @@ -423,8 +440,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>  	if (i915_adjust_stolen(i915, &i915->dsm))
>>  		return 0;
>>  
>> -	GEM_BUG_ON(i915->dsm.start == 0);
>> -	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>> +	GEM_BUG_ON(is_dsm_invalid(i915, &i915->dsm));
>>  
>>  	stolen_top = i915->dsm.end + 1;
>>  	reserved_base = stolen_top;
>> @@ -796,6 +812,46 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>>  	.init_object = _i915_gem_object_stolen_init,
>>  };
>>  
>> +static int get_mtl_gms_size(struct intel_uncore *uncore)
>> +{
>> +	u16 ggc, gms;
>> +
>> +	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
>> +
>> +	/* check GGMS, should be fixed 0x3 (8MB) */
>> +	if ((ggc & 0xc0) != 0xc0)
>> +		return -EIO;
>> +
>> +	/* return valid GMS value, -EIO if invalid */
>> +	gms = ggc >> 8;
>> +	switch (gms) {
>> +	case 0x0 ... 0x10:
>> +		return gms * 32;
>> +	case 0x20:
>> +		return 1024;
>> +	case 0x30:
>> +		return 1536;
>> +	case 0x40:
>> +		return 2048;
>> +	case 0xf0 ... 0xfe:
>> +		return (gms - 0xf0 + 1) * 4;
>> +	default:
>> +		return -EIO;
>> +	}
>> +}
>> +
>> +static inline bool lmembar_is_igpu_stolen(struct drm_i915_private *i915)
>> +{
>> +	u32 regions = RUNTIME_INFO(i915)->memory_regions;
>> +
>> +	if (regions & REGION_LMEM)
>> +		return false;
>> +
>> +	drm_WARN_ON(&i915->drm, (regions & REGION_STOLEN_LMEM) == 0);
>> +
>> +	return true;
>> +}
>> +
>>  struct intel_memory_region *
>>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  			   u16 instance)
>> @@ -806,19 +862,16 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  	struct intel_memory_region *mem;
>>  	resource_size_t io_start, io_size;
>>  	resource_size_t min_page_size;
>> +	int ret;
>>  
>>  	if (WARN_ON_ONCE(instance))
>>  		return ERR_PTR(-ENODEV);
>>  
>> -	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>> +	if (!i915_pci_resource_valid(pdev, GFXMEM_BAR))
>>  		return ERR_PTR(-ENXIO);
>>  
>> -	/* Use DSM base address instead for stolen memory */
>> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>> -	if (IS_DG1(uncore->i915)) {
>> -		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>> -		if (WARN_ON(lmem_size < dsm_base))
>> -			return ERR_PTR(-ENODEV);
>> +	if (lmembar_is_igpu_stolen(i915) || IS_DG1(i915)) {
>> +		lmem_size = pci_resource_len(pdev, GFXMEM_BAR);
>>  	} else {
>>  		resource_size_t lmem_range;
>>  
>> @@ -827,13 +880,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>  		lmem_size *= SZ_1G;
>>  	}
>>  
>> -	dsm_size = lmem_size - dsm_base;
>> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
>> +		/*
>> +		 * MTL dsm size is in GGC register, not the bar size.
>> +		 * also MTL uses offset to DSMBASE in ptes, so i915
>> +		 * uses dsm_base = 0 to setup stolen region.
>> +		 */
>> +		ret = get_mtl_gms_size(uncore);
>> +		if (ret < 0) {
>> +			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
>> +			return ERR_PTR(ret);
>> +		}
>> +
>> +		dsm_base = 0;
>> +		dsm_size = (resource_size_t)(ret * SZ_1M);
>> +
>> +		GEM_BUG_ON(pci_resource_len(pdev, GFXMEM_BAR) != 256 * SZ_1M);
>> +		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
>> +	} else {
>> +		/* Use DSM base address instead for stolen memory */
>> +		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>> +		if (WARN_ON(lmem_size < dsm_base))
>> +			return ERR_PTR(-ENODEV);
>> +		dsm_size = lmem_size - dsm_base;
>> +	}
>> +
>> +	io_size = dsm_size;
>> +	if (pci_resource_len(pdev, GFXMEM_BAR) < dsm_size) {
>>  		io_start = 0;
>>  		io_size = 0;
>> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
>> +		io_start = pci_resource_start(pdev, GFXMEM_BAR) + 8 * SZ_1M;
>>  	} else {
>> -		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>> -		io_size = dsm_size;
>> +		io_start = pci_resource_start(pdev, GFXMEM_BAR) + dsm_base;
>>  	}
>>  
>>  	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 30cf5c3369d9..b31fe0fb013f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>  	unsigned int size;
>>  	u16 snb_gmch_ctl;
>>  
>> -	if (!HAS_LMEM(i915)) {
>> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>>  			return -ENXIO;
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 134fc1621821..ef3120322077 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -973,6 +973,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  
>>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>>  
>> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>> +				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>> +
>>  /* intel_device_info.c */
>>  static inline struct intel_device_info *
>>  mkwrite_device_info(struct drm_i915_private *dev_priv)
> 
