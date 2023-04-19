Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DF6E7F27
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6F10E052;
	Wed, 19 Apr 2023 16:06:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5740810E052;
 Wed, 19 Apr 2023 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681920403; x=1713456403;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gQCR25OC3e3ysrco3VieQlnTR5OcevCgG75CAeAKcg8=;
 b=jW3jMVoDimMWZiXm4VUUw2Rlc5P8216I2w5yt/hHoQ/Z+oe/zbQhVeUO
 W3O+V365u71BaM4oQH4ed+Vk5VF3nyhq33mXSskHeeYc7i9ot0chvVCfD
 8P7Lh5twgN2PUaB7IxzUGpnAB5OoXKZWxW2VprJR8MJYD7TsSWyMYXkKZ
 CfSCxd/3bQKRx93HdKIp91zbTvKneuKGH4j2vLeloBL3ekap5N5qH69aY
 WbBE8IDZDJzQozOnItF6jpkhVNr5ReFqC3tXGZ1MyXf+pNJxbqpWhctXA
 20L+fNZZGuUauSCRTRSt7JQLcFsB1JbaD2jDcxUziB9JYUKetty52bLGO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347341457"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="347341457"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="641820874"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="641820874"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2023 09:06:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:06:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:06:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:06:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwdmvMdb2yhLhhg1fLsIlWK09J8GDNmlAd/SgQ+B+/00TvZ6L8TmDlhRlwNwxsbTalwf9+mFZc/yANghefACkrzHCNn3Z5uujoTpFB8YP0cNcoRQ9boYtgschUcE9VRNDqflaSBfOLqXx81cVRU7h/MOaqzfNSpKw9gyGVhmcUV70h1DbBnOBLqqALjQ7r5xZq6p5j11z03IBkV3qj8C7hKOalV21Y2khQbEZpt2gPYxgn5tSbc5EjQB6lOTVUy1nunYz5kRGGrBe+NgxyQ1qYe5QaIvQepKMGHvj0HCVO4vzgeFxfDnHxY8di1uc2KQeYFE9PohU/7n+99chBr63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcWnJQmxFGtEEtM66NXpvxWTfDWrE3B2JTw0sxjKqzg=;
 b=LMX+1bupQ/LcjIIrgrX9hh2J6qfsnvEA+x4JcIyfk7KLFjSAUWEErkCZ19bU4L7dgt3pM2qcd19C5HS8h0VRnDOCf7dTeWKaxhZbA2QKnuBLyF4bUT5pnb7jE7ahj6FC3R9/Wprt6fisdt6kMajf6ts8usaI8SEIZh7uK0dH8pS7zb6CbdiY/E7SezK6J8EcYaUDoQMGvjZjhGSmJRXRTtRMzlKnRJ9MOeNls9FDKe6hdUYh0lqngsbNpS1fY5j43JHByglSi/C2MkZKgoY8QsUqDjbAg9KBX+yZuUQ2PKkseds76Jv2yDxdnAbiDgeLxb+uJQg/MkdpOCkz28Kh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BL1PR11MB5463.namprd11.prod.outlook.com (2603:10b6:208:315::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 16:06:39 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 16:06:39 +0000
Message-ID: <fdbe9a14-e1f4-ecfa-32f8-d5bcdfe3c336@intel.com>
Date: Wed, 19 Apr 2023 09:06:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/uc: Track patch level versions
 on reduced version firmware files
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-4-John.C.Harrison@Intel.com>
 <23ca7d75-e96d-5536-25a1-a1c8a0167b48@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <23ca7d75-e96d-5536-25a1-a1c8a0167b48@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|BL1PR11MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2acc97-ed84-4bbb-f7fb-08db40f00ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3NoYvbxBL9Kj4iob9cBMoRApuQFSNA+uErncJ4BMCYSUhCDOWQB5K2aksBOywAYXLjqeNaUWV+tspb8vka0rUPf8xK58Zu4YeDqRKN8ZuPpBIB5DvFtmWSgtBswEfEWt5LPKoBcKcdv1oR8wLZsKu627XdwatTePuPqjaPaN1VTSpSy9T1nH29W2VnjOVQueS7mJXhU08zsWdGPyJYaODVIXyJdwUR7+ujxBubCtt0wCMzLMR09lSqAPzB25oJuBmmnY5EeALCamiYUcN5JgRhZIBTLdmVo/HRFWRVtcOVxmKlTKU/Oc3u/nVq1YnmUuj/i+ITGCFvpZAx3cIRwsNqLAlevClrhJ3Wvkla1pLHPel5zORhoj18MYb9ou/MAi8IQwt1yXgc+eCTZtOFq9PX2z3dbvG3Et9pkJbtSLl7nIYty5W2hJ+cRdTgG7YMs31THFhBaN9Vb+/XZj2cWLRb8vFBfF7y5kC2WICFZm3TqCJTctlGaXTP1yFRf/8GpEryYXT875/SMojqq848UuVZ+aO3NCmM4mhlvHqzuTpZbhOPuPxGnL9uoH2Ig+d2QT137acVqGuX3sFLB38nxs5Ye+HFKHKVojXZhXF6gwn9csshjw7Vf30rDSoF+PrKr7J3jqXDtZr7Ck1VR6StDlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(8936002)(38100700002)(36756003)(8676002)(66899021)(2906002)(86362001)(31696002)(5660300002)(478600001)(6486002)(6666004)(31686004)(186003)(2616005)(6506007)(53546011)(66946007)(66476007)(6512007)(26005)(316002)(450100002)(82960400001)(83380400001)(66556008)(41300700001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJwc1M5b3ZYREtJdmh2SGcwcnRHUzZzSWFObFE1UzZQWUtXYXJwVW5pSG1z?=
 =?utf-8?B?dUJRQUY2b0c2NlZUVlJwY1JiYWlMWDZGVi9DWk5mOTN2RTI1b21aemlTbVU2?=
 =?utf-8?B?NHgvOWl1dWVsZXdtY0YyRHFiODBYSy95ZjIwVUdidVdFblNrcVZHb2ZCakVW?=
 =?utf-8?B?dnZUc2VWNWNmbUFnWEVEc2NqaHdFSSt6ckxZY0dtNGsrWm9SK3ZSSjZhS0xq?=
 =?utf-8?B?eEVRVUxFNWVKNmk2NXFZUEtJT1JXdjhRa3FHL2FFcmVEVTJ3ZEZIejloQ0FE?=
 =?utf-8?B?SzJWb3c2QSt4cVU0eVczZldxUU8ybEYySi9JV2pJWEdDTGdEbjRlcVZhSVBZ?=
 =?utf-8?B?TVlrMmF0VXB5TzZYaEtQRDRJQWpxc1lnYmplK05uQlZXZEZCbTYvZDFFeUY2?=
 =?utf-8?B?WlZaSWRUS0FrclB5enpuUDhvdGF2cFBkem5qZDZaK2xQTW05eHM5R2cvRVdK?=
 =?utf-8?B?alZkNkllaUp0cHN6aEdyaFlGWkRCUHFSUHB4MjJaQnl3R0xJaW4vdnN3QnBT?=
 =?utf-8?B?b2hhK0RtdzlmM1lCb3FzVmJtYWF0L1B3VU9MMXVhM082bCtnbm1EbHNGWDhh?=
 =?utf-8?B?NUJFU0NLQURSVE5GdzRwVk5HMEZDN1RaYk11WnJzdGZ1MkMycm9RVTE4aHha?=
 =?utf-8?B?emdRSEF4Y2UwV1o1MjNXc3hHVkNSblQrTnI3UExRZ0JiMzQ1aWowdzFoOXl3?=
 =?utf-8?B?dEwvSjB6bVh4RWtPUG82a1BlRUw2S1QveDZ3aFRFZ3o0U1VSRUNVNEFHWGFG?=
 =?utf-8?B?UHNzMVhwTlNGa0pBNjN6cjlsKzBMdzdYSkFyRFFWd0d0ckVsVG9VZW81cWh6?=
 =?utf-8?B?UlMxRzE0NlJ5SEdsNnNpVG5QSWV6Vm5IVUttSlRuUG1paFNCNlFzdnpqc0Uv?=
 =?utf-8?B?c3p2RFVxV1FadWNhTzZiQzVjbGVTaUFqalNBUnNHMXBneCtGWnova2I3LzN0?=
 =?utf-8?B?cGRMSWNPY3BtMXVZS2F6SDRxSUZRTFJDMXJpQmxWRVdRTHVEN2NUSFkybC9j?=
 =?utf-8?B?b2ZFVTNtZHFvNlFRMkgzMFFyY3FGOTl5cUpJNzk4YWJpazhQajVnRkpBYWVk?=
 =?utf-8?B?aEo2aWR2Q3hQOXkySlVyUnRFWnRKNVRSbGlCd0lmSWozMDBDMFF4UThsYUk3?=
 =?utf-8?B?MHFWWVdTSHFvRkhXODJLVzE0QVJMZEJSSXVuek9FczRqSmdtN0NqYzlXY0U5?=
 =?utf-8?B?Y0NneUkvVmhpaFc2aHNpem1PZzlTNlF1WVNZUlNXQXltR3pPaHczdXJEbXkz?=
 =?utf-8?B?Q00zeE1vVTdJQjhhKzg0dTJRalQxT0dzS3poTU8rdFRaaDhiMzJVYkpUcm5O?=
 =?utf-8?B?aUNvR3h0VFkwM1JYUXFZZzlRRG5KM2VMMm1STU5mRXduM3d3YWNWbWpvc3FD?=
 =?utf-8?B?QlF1VFkxb0JSRzNOOGkvTmdQZ0MvbXNaeUhWVWhLRStlVlpDazBGRXJ6ckR5?=
 =?utf-8?B?REg1S3ZnVnVIRm1UUS90MjgvTno4akZaMFVMZTFqSE1aYlhJckZtZkMwZThS?=
 =?utf-8?B?WGRSNWhKWmNnYzkvVVdFR1owREFGQ3o3TGZ2ZDZxWnBnWFZGSjlxeHpBekZa?=
 =?utf-8?B?ZTFTVzd4WFJJMml3V2hjSFN5em5wYUEzQVdXeWVRQUxXR3RyV3dEQ0tzOTFE?=
 =?utf-8?B?SEZlMThhYnlUTmJWblh0SnVIc2VJeGdic1lSNEV0NWFmUDhNNzhQc2JZbVRl?=
 =?utf-8?B?VEZJTW9naWdUTThUUmlhSUFvbU50WWg0cVNSMENta0xFZThhQzdxd1UxQUNr?=
 =?utf-8?B?TlN2TFA4all5SWpvbm9nSmRjaDNnYi9iTGtNUm85YTZ5Y1N6Q1k3aTlhRHU1?=
 =?utf-8?B?cHlhZ0JoUm5PWHVMSkNqeERuZDZGSjFoWjJkUkl2ZHNCOTFIelF1Y3RGTVVY?=
 =?utf-8?B?UldpS3JHL2VtSWoweVl5TFVEYUhKWmlLOW5vMzBIMTF2VFJ2RS9QMmxqRW5k?=
 =?utf-8?B?Zmx5Uk5iUzNMYVE2SkVQMGo4dWZ1THJlMExMekFrTGdOSW9KWGxVVVpRN1Ju?=
 =?utf-8?B?TWM4WkliME5kMkZ2bkx0MEVjZVNhZEdhaU05Qjg5R0lZZUllbitWQU9pd1BU?=
 =?utf-8?B?RElhaXVhZ3BJbTR5UzdsQkhBOVgyOFBOSHY0M2JuRzFFR0RHSkRObndSbnBW?=
 =?utf-8?B?SXF3SmdSVDdRYzl1S1grblg2dDVJL01vYndDS3hibUg4QXpBN3RtaVR3Wm5t?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2acc97-ed84-4bbb-f7fb-08db40f00ea8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:06:38.7730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeP8b3jYef3V24NOqu+/L1QrbtBsnYgdAaG7fHxldrnPo6Z9Zuujh2l4tUsttQMPK8cNF0FokTqgb0dil1n9yMRuqMmq3Lkfc14UutUxPYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5463
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/2023 15:46, Ceraolo Spurio, Daniele wrote:
> On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When reduced version firmware files were added (matching major
>> component being the only strict requirement), the minor version was
>> still tracked and a notification reported if it was older. However,
>> the patch version should really be tracked as well for the same
>> reasons. The KMD can work without the change but if the effort has
>> been taken to release a new firmware with the change then there must
>> be a valid reason for doing so - important bug fix, security fix, etc.
>> And in that case it would be good to alert the user if they are
>> missing out on that new fix.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 41 +++++++++++++++++-------
>>   1 file changed, 30 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index a82a53dbbc86d..6bb45d6b8da5f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -80,14 +80,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>    */
>>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>>       fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
>> -    fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
>> -    fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
>> +    fw_def(DG2,          0, guc_maj(dg2,  70, 5, 4)) \
>> +    fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 4)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
>> -    fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
>> +    fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 4)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
>> -    fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
>> +    fw_def(DG1,          0, guc_maj(dg1,  70, 5, 4)) \
>>       fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
>
> AFAICS in linux-firmware we don't have any 70.5.4 binaries, the newest 
> ones are 70.5.1.
You would be correct. Hence the CI results all say:
<5> [27.947440] i915 0000:00:02.0: [drm] GT0: GuC firmware 
i915/adlp_guc_70.bin (70.5.4) is recommended, but only 
i915/adlp_guc_70.bin (70.5.1) was found

I was just testing that the code worked ;)...

Although it does beg the question that maybe we should bump the print 
from a 'notice' to an 'err' if CONFIG_DEBUG_GEM is defined or something? 
Ensure that CI is actually testing against the correct firmware versions.


>
>> @@ -141,7 +141,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>       __stringify(patch_) ".bin"
>>     /* Minor for internal driver use, not part of file name */
>> -#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
>> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_) \
>>       __MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>>     #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>> @@ -197,9 +197,9 @@ struct __packed uc_fw_blob {
>>       { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>         .legacy = true }
>>   -#define GUC_FW_BLOB(prefix_, major_, minor_) \
>> -    UC_FW_BLOB_NEW(major_, minor_, 0, false, \
>> -               MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
>> +#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
>> +    UC_FW_BLOB_NEW(major_, minor_, patch_, false, \
>> +               MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_, patch_))
>>     #define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>>       UC_FW_BLOB_OLD(major_, minor_, patch_, \
>> @@ -296,6 +296,7 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>           uc_fw->file_wanted.path = blob->path;
>>           uc_fw->file_wanted.ver.major = blob->major;
>>           uc_fw->file_wanted.ver.minor = blob->minor;
>> +        uc_fw->file_wanted.ver.patch = blob->patch;
>>           uc_fw->loaded_via_gsc = blob->loaded_via_gsc;
>>           found = true;
>>           break;
>> @@ -776,6 +777,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && 
>> !guc_check_version_range(uc_fw))
>>           goto fail;
>>   +    gt_info(gt, "%s firmware: wanted = %s / %d.%d.%d, got = %s / 
>> %d.%d.%d\n",
>> +        intel_uc_fw_type_repr(uc_fw->type),
>> +        uc_fw->file_wanted.path,
>> +        uc_fw->file_wanted.ver.major,
>> +        uc_fw->file_wanted.ver.minor,
>> +        uc_fw->file_wanted.ver.patch,
>> +        uc_fw->file_selected.path,
>> +        uc_fw->file_selected.ver.major,
>> +        uc_fw->file_selected.ver.minor,
>> +        uc_fw->file_selected.ver.patch);
>
> Some of the info here is redundant from print_fw_ver(). Can we have a 
> single print with all the info we need?
> Something like:
Hmm. I think this was just my test code that got left in by accident. As 
you say, we print the actual version in use later on when we do the load 
itself. And if the wanted does not match then we print the 'is 
recommended' message below. So this line is basically redundant. I'll 
remove it.

John.

>
> GuC firmware i915/mtl_guc_70.bin (v70.6.5, expected v70.6.4 or newer)
>
> Otherwise, I'd suggest demoting this to gt_dbg to avoid printing the 
> same thing twice at info verbosity
>
> Daniele
>
>> +
>>       if (uc_fw->file_wanted.ver.major && 
>> uc_fw->file_selected.ver.major) {
>>           /* Check the file's major version was as it claimed */
>>           if (uc_fw->file_selected.ver.major != 
>> uc_fw->file_wanted.ver.major) {
>> @@ -790,6 +802,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>           } else {
>>               if (uc_fw->file_selected.ver.minor < 
>> uc_fw->file_wanted.ver.minor)
>>                   old_ver = true;
>> +            else if ((uc_fw->file_selected.ver.minor == 
>> uc_fw->file_wanted.ver.minor) &&
>> +                 (uc_fw->file_selected.ver.patch < 
>> uc_fw->file_wanted.ver.patch))
>> +                old_ver = true;
>>           }
>>       }
>>   @@ -797,12 +812,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>           /* Preserve the version that was really wanted */
>>           memcpy(&uc_fw->file_wanted, &file_ideal, 
>> sizeof(uc_fw->file_wanted));
>>   -        gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but 
>> only %s (%d.%d) was found\n",
>> +        gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but 
>> only %s (%d.%d.%d) was found\n",
>>                 intel_uc_fw_type_repr(uc_fw->type),
>>                 uc_fw->file_wanted.path,
>> -              uc_fw->file_wanted.ver.major, 
>> uc_fw->file_wanted.ver.minor,
>> +              uc_fw->file_wanted.ver.major,
>> +              uc_fw->file_wanted.ver.minor,
>> +              uc_fw->file_wanted.ver.patch,
>>                 uc_fw->file_selected.path,
>> -              uc_fw->file_selected.ver.major, 
>> uc_fw->file_selected.ver.minor);
>> +              uc_fw->file_selected.ver.major,
>> +              uc_fw->file_selected.ver.minor,
>> +              uc_fw->file_selected.ver.patch);
>>           gt_info(gt, "Consider updating your linux-firmware pkg or 
>> downloading from %s\n",
>>               INTEL_UC_FIRMWARE_URL);
>>       }
>

