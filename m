Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521B6E7ED1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B389510EA06;
	Wed, 19 Apr 2023 15:47:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0D610E9F9;
 Wed, 19 Apr 2023 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681919223; x=1713455223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V56w/Zfh/z8yClS5VwjFf/hbAJL620OlZI6bnBEpSiQ=;
 b=XLLUufRQIwpAz34OHbHpv6A+f4Zd+d97IkNbiuIWuXFrRXgTqqkz66om
 m2xssh66gSi8ua58fhmWEMOXYL4wndwHeJHQLuv6R+C36rxP5W2+u4RNz
 xFyyRgXEucZFrIii5sHiIKSNWlyFCFE/h3jKqvCGHzCZXNlidScLoSGiR
 B4/Ox6D+5vCv38/YQZyvy6iKavHrHOlg/MsSxylQxvtPvKDVrK9hD9RpO
 Fr1I2QP7oUquwVBm2mvTLuqnmRaE/3mAzf13K+wwbUT1PVrPuCottfNn6
 Urx43AgSqTMWX4yPaicXtZUqMTisN2W1ApH3wXs0Iynl4UwRntG9IumBJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="342965420"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="342965420"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 08:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780891743"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="780891743"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 08:45:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 08:45:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 08:45:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 08:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrUf6faDwlnA/j8WWH0pTZVz9DBkD7iD+YQtSY4qQOTWCLCzgETshEJJrJar5v+3D5DFMNCLHMEPeA7M/TiXQJv0UgDGyYktK1dJP0Fyr8KWOVXyBrT0wn2G3jFvRm9m9vbgHp1bizZTIen0p8blDLBYmkS1CNeEyMTRv+8l5lW7vd2876MfEQh+/B1hcYsVj6pQdyfRYFQjDXsUcdMuMAD/WlLL6ZJTM3xdTi+mSEEFGtqwJHMjsRLezkYPlYNluzwhe8Prg8KFWO5ON0wTEr0hXC0qss85LX5F9RtT0i9F0nsZkGBoeOXM9vhCZY7nsbB8mYs792AVBxkK0YnrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW62YY1orQ+VdyzqgLedUH6tBCWWgG5uDO5b3Lh4U8A=;
 b=N2n+eKOwOCyJcvdt0KoUJXDWQyqNUyd4FKVcAGt2xl8JqOI/VJBQV7vO4HtJbnZ2kHI1twtydbBsLJPl8wuAs7hIkMvC8qbH+FZKNz/Pv8cbgTWd/mbJPWOjbQUsjOdz3mdgJZpyx6458Tht77n9N0u//ob6OFPpim2SKdZXVp56ylPTMMQSrSE9bo+KDTi1FRrI8Zc4YGzrbEGzq5NFjUC0pRVI/tEHTGjZ3cYAyVkxLBZA1Z5Bw5LDfGeGqZ/y1eVycrudX5gXfCh6/W8fFSl0pLrydzJIWMnwzwuWVPCL2AqDrrTHKcgoQ+3YAzeixkzK79W8B7eGGAvebKQfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 15:45:04 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 15:45:04 +0000
Message-ID: <f79a8618-6905-a9f4-5b85-59fe3f705f09@intel.com>
Date: Wed, 19 Apr 2023 08:45:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] drm/i915/uc: Split firmware table validation to a
 separate function
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-5-John.C.Harrison@Intel.com>
 <3bcf3848-8e58-00d2-b170-0800668c724e@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3bcf3848-8e58-00d2-b170-0800668c724e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e0b78c-76f9-4cf0-c31d-08db40ed0a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7TuJ6VeP2nRs1LTXPIyBF29HM7HtJpXCnIz3yi+lkwMGFbNkSRdzAhQq1ueYucpAKwxfgcBRq2oQ9Ffniz5ZkCaFXoqkl0d7/2lvPbgwW3BJjwdtPj239yxpbQJAAh8ujCsn7MPe/7pxnfpxWzSgFA8Cgto3jUxO75tIG/TDfP86Z5+W6OHCW3uR5wR2BiVrLguLV5syRqYq4hCygbiCU6hd5YA5kdYLTus9LNomQmpGOWJiyAIIpHC/abXO18tHneHS6LuUh5b1GY8S3fXT7eqZ29prdAh/H++Wi3y4ouOtYpQenenmzboIPzfJ5mELDZmvp6jQzJ9sA9D8qcvAIkMG8XGtUwIBgmtELY6c5ugSl9IT678bLQZj6SJPZj0KlpxEHr00IypTsIah8Y+szAKfidrH0p13eLmTMZN5jzxBZ/GRJKvdCjaqg9YgBoytC/68JLkpOiStWoS2bLbRU2j3YOTL6f1NSca6iOSmTnPHveNX0jaqvTx3N66/TFJ0OT7wwur9w/+mYrAB6LATs8beE/kVIrda6F8x3SaJgUQdKUXY95603BLMPBLRRtnv4BI+xRrhmgqMVe+AvBKFrdXA2tgQqHFMy6fVPFGVJDCF89eur2+b9MxrWx+mlLpt6J21xdF5CYaUEsSZTHnG/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(2616005)(478600001)(6666004)(86362001)(31696002)(26005)(53546011)(6512007)(6506007)(6486002)(36756003)(186003)(82960400001)(41300700001)(38100700002)(8676002)(8936002)(31686004)(4326008)(66556008)(66476007)(450100002)(83380400001)(66946007)(316002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xzcnZPSlZSQk9VaGVDZEpJcXQyOTRMUElFNlJMZzNRSXBSdEtvNjZURHJv?=
 =?utf-8?B?cEcwQ1FpM2hnTldtYkFxYkVBTDFvRFZ3eDNzekNGTTFCNk5rdVZYRjc1M2Rt?=
 =?utf-8?B?UGdRZFFGaE1wR3YxY24xa1ZiNW1haGxBRnUyUmcvcUFWbjhySVRQTmJsT05R?=
 =?utf-8?B?WVhVVnJEV0FuRXJLWVNmZk5pWjBxU08ycWUwanhVcENjOEg2SExwZC9NcFhy?=
 =?utf-8?B?aWJMTnNlQ3IwNEM0Sk5CR2pYVmZJeTI4US93Z0NNOFJzbzJ2T1MvdXlOYmhz?=
 =?utf-8?B?NDZkUmxwM3Y0QkcvMkE5bVArcFBHd001MWpWSVZwdWpDRVRHY1Q0ZUJVSytJ?=
 =?utf-8?B?ZWt4cXJzOUZZMEJSWUY4bkpmTjBhdWpBdW9XMUFjaTJEekh4UHo5Y2lmbkgz?=
 =?utf-8?B?azB6T0xRaU5CSU5NeXd4enVyd29Yc2oyQVhiSGdxTlNwb3VvK1NPQ2l3ZWpq?=
 =?utf-8?B?L2d0aFNsdHNsM1hRMjJOWkY5WDBVOWMrdEdxSUxCVUxFakxKbWpUejc4bTM2?=
 =?utf-8?B?aVBDS0VTcjJlNmJQbjVRTlFMaUlTSUpvZWorcm4vY05YZW1vSzJscTRYemdF?=
 =?utf-8?B?dURGLzhLcVdwRDI0RXRyVGIvRjM0YWVPUVhSNmJ3UkVPVVBBOExmU1BmcUx3?=
 =?utf-8?B?ZVZBNVdmNEpvRDhzd3R6ZWRmQ2o3VUZCWmtweDFKZXBNckhsdjRaZEYvV3I5?=
 =?utf-8?B?RDVxT245dU9OWHdSckZQZkFjdVEvQW8wSmttK3MwQlQzeVFmUGxac05tVHNQ?=
 =?utf-8?B?RkNCek1rZWZ4Q25LNE1PeEY0aS9OOEJBaDVDSTNnWFIzd2Z6a1NKbU1jL3Fh?=
 =?utf-8?B?SkV4MlhrMzJ2dWJaczVUeWVEcTI3N1F0NFZtK3lDZUxrMmVNeFZ1blVZRTVB?=
 =?utf-8?B?Q2hYUzhEQ3VtQU9KUitlZHJPYUNBenZQZUlYOUtIa1kxNm9CWWYydEcxRzJw?=
 =?utf-8?B?dlhUNFkvR25zWVJ0dXRhTDNKNTFhOU5QVi8zRGE3MHoxcUxkeGN6V3RhNGht?=
 =?utf-8?B?STl5VHZPc3NPd2h6b3VQRi9CZDVYZjlSci9Kd2lzVzZML2w5dDBJMHNwNUlU?=
 =?utf-8?B?TTlZelZDM3ZUNHl0ZForN3hmODlNWlZIWmp0eEdpM1l3TGk0YTFIek5nSG1q?=
 =?utf-8?B?RFlLWVhpTGxjYnZySWFuRkZzNGZ3WWlTRE54YXc3emMrZ0hqM0ZLa0ZVZ0FP?=
 =?utf-8?B?VzEyZ1hLVExmUlVTbW95d0pSdm5XOE9uVlBUbXdyekJoSUJyWEsyWG9EdTky?=
 =?utf-8?B?TlZjb213cmtCeTVuU21UUlA3c2JpT3JQQytWZHZ4U29OVVZWT3RKVG43TnV1?=
 =?utf-8?B?ODBscXRUWFBnQk1uT2hmSThXVXVEcEJMY3E3YUlXeDVpRGN6YTR1ZXhEZXUz?=
 =?utf-8?B?NlZWSnhnQ3dYenF3eVFTVEw0SnlxUVhuZmgxMlJFbG9ybjh5QVk3azA3ZjRF?=
 =?utf-8?B?QVQ5TTlQQkdhdjAxT0JUY3dEWUJBekx6dmRySHNPbSthcUFlMGRJWnQza29M?=
 =?utf-8?B?RTg2NHcrVThieHFaMXhWNEZrNmpZUVNkc0VkNjJUMkQ1WUw3bXVqSVFNbGtu?=
 =?utf-8?B?ekpaelMxMW1oMWZMR3gvckpyTlNOMmJKTEx4TUM3NkxVK2lLRzBsUUh0WUNT?=
 =?utf-8?B?UWExOHRYTjZHWUtmTHAvZmZJbXY0M3R3dm5LRjdSWGREV2U1Smg2NjJHc29M?=
 =?utf-8?B?UmlzTkVNUVZiS2ZJMTFDVGpJT2R1bU5oQ3Q3b1dZbFcvSy9vd2E4ODVJMTcr?=
 =?utf-8?B?SXRtSnYrZWNzQzN4OVFtamQ3a3lELzBva3FIQWNDWmtXY1EzVmlJODY4TzVJ?=
 =?utf-8?B?M1Bpb0ZRNGtMYkJPb3o0Qi85aTNYYk10U3ZER3dGWlpaQ2E1TUI0N0J0VWk2?=
 =?utf-8?B?RkhtV0ZOU1k2c2trbVNRcHVJU0lEQTZtQ2tVUkEyMThXbzArWHFYMUJoUTNH?=
 =?utf-8?B?KzJPSnYxdm15OXhjQ045V0hKK3lZR0F4MEo0NzBzdXN0MmlPZEw2NWZ6R1p1?=
 =?utf-8?B?YjZKbU1POHdkWEZtVXU2NllGNEhieVRUNGZmY0V1REFUN3c2b1YyaThzZ2xJ?=
 =?utf-8?B?TllmRGFjM05DSUJJTEJuZHYyWC9OL0E1Q3gybVoyd1ZQUkJqR1Q1eFMrTklO?=
 =?utf-8?B?SmN6eEMrTitaS3JraW5xQ0NaUGsyYjgwdzEybkJBZEtMZHppaHhvRTM5aFpX?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e0b78c-76f9-4cf0-c31d-08db40ed0a53
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:45:02.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OE9ZfoTwAE42lvl4FfQTr5XCXlHkpjBhcHIxNbCtDg9byjlrRSjEEnEGS23vaekJuBHjKe3rlE9L7aSWThkhSS30uQodUGqy+tXazQKWMds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

On 4/18/2023 16:14, Ceraolo Spurio, Daniele wrote:
> On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The validation of the firmware table was being done inside the code
>> for scanning the table for the next available firmware blob. Which is
>> unnecessary. Potentially, it should be a selftest. But either way, the
>> first step is pulling it out into a separate function that can be
>> called just once rather than once per blob attempt per blob type.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 164 ++++++++++++++---------
>>   1 file changed, 99 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 6bb45d6b8da5f..c589782467265 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>       u32 count;
>>   };
>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
>> +};
>> +
>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>> +};
>> +
>> +static const struct fw_blobs_by_type 
>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>> +};
>> +
>>   static void
>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>> intel_uc_fw *uc_fw)
>>   {
>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>> GUC_FW_BLOB_MMP)
>> -    };
>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>> -    };
>> -    static const struct fw_blobs_by_type 
>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>> -    };
>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>       const struct uc_fw_platform_requirement *fw_blobs;
>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>       u32 fw_count;
>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>               continue;
>>             if (uc_fw->file_selected.path) {
>> +            /*
>> +             * Continuing an earlier search after a found blob 
>> failed to load.
>> +             * Once the previously chosen path has been found, clear 
>> it out
>> +             * and let the search continue from there.
>> +             */
>>               if (uc_fw->file_selected.path == blob->path)
>>                   uc_fw->file_selected.path = NULL;
>>   @@ -306,78 +313,103 @@ __uc_fw_auto_select(struct drm_i915_private 
>> *i915, struct intel_uc_fw *uc_fw)
>>           /* Failed to find a match for the last attempt?! */
>>           uc_fw->file_selected.path = NULL;
>>       }
>> +}
>>   -    /* make sure the list is ordered as expected */
>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>> !verified[uc_fw->type]) {
>> -        verified[uc_fw->type] = true;
>> +static void validate_fw_table_type(struct drm_i915_private *i915, 
>> enum intel_uc_fw_type type)
>> +{
>> +    const struct uc_fw_platform_requirement *fw_blobs;
>> +    u32 fw_count;
>> +    int i;
>>   -        for (i = 1; i < fw_count; i++) {
>> -            /* Next platform is good: */
>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>> -                continue;
>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>> intel_uc_fw_type_repr(type));
>> +        return;
>> +    }
>>   -            /* Next platform revision is good: */
>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>> -                continue;
>> +    fw_blobs = blobs_all[type].blobs;
>> +    fw_count = blobs_all[type].count;
>>   -            /* Platform/revision must be in order: */
>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>> -                goto bad;
>> +    if (!fw_count)
>> +        return;
>>   -            /* Next major version is good: */
>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>> -                continue;
>> +    /* make sure the list is ordered as expected */
>> +    for (i = 1; i < fw_count; i++) {
>> +        /* Next platform is good: */
>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>> +            continue;
>>   -            /* New must be before legacy: */
>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>> 1].blob.legacy)
>> -                goto bad;
>> +        /* Next platform revision is good: */
>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>> +            continue;
>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or X.0 
>> to X.Y (GuC) */
>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>> 1].blob.legacy) {
>> -                if (!fw_blobs[i - 1].blob.major)
>> -                    continue;
>> +        /* Platform/revision must be in order: */
>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>> +            goto bad;
>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>> 1].blob.major)
>> -                    continue;
>> -            }
>> +        /* Next major version is good: */
>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>> +            continue;
>>   -            /* Major versions must be in order: */
>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>> -                goto bad;
>> +        /* New must be before legacy: */
>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
>> +            goto bad;
>>   -            /* Next minor version is good: */
>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y 
>> (GuC) */
>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
>> +            if (!fw_blobs[i - 1].blob.major)
>>                   continue;
>>   -            /* Minor versions must be in order: */
>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>> -                goto bad;
>> -
>> -            /* Patch versions must be in order: */
>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>>                   continue;
>> +        }
>> +
>> +        /* Major versions must be in order: */
>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>> +            goto bad;
>> +
>> +        /* Next minor version is good: */
>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>> +            continue;
>> +
>> +        /* Minor versions must be in order: */
>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>> +            goto bad;
>> +
>> +        /* Patch versions must be in order: */
>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>> +            continue;
>>     bad:
>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>> -                intel_uc_fw_type_repr(uc_fw->type),
>> -                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>> 1].rev,
>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>> -                fw_blobs[i - 1].blob.major,
>> -                fw_blobs[i - 1].blob.minor,
>> -                fw_blobs[i - 1].blob.patch,
>> -                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>> -                fw_blobs[i].blob.major,
>> -                fw_blobs[i].blob.minor,
>> -                fw_blobs[i].blob.patch);
>> -
>> -            uc_fw->file_selected.path = NULL;
>> -        }
>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>> +            intel_uc_fw_type_repr(type),
>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>> 1].rev,
>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>> +            fw_blobs[i - 1].blob.major,
>> +            fw_blobs[i - 1].blob.minor,
>> +            fw_blobs[i - 1].blob.patch,
>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>> +            fw_blobs[i].blob.major,
>> +            fw_blobs[i].blob.minor,
>> +            fw_blobs[i].blob.patch);
>
> Confirming that this big diff was just an indent change was painful :/
Yeah, not a lot one can do about that. If you pull the patches to a 
local tree then you can run 'git show -b'. Can't really post that to 
patchwork though.

>
>>       }
>>   }
>>   +static void validate_fw_table(struct drm_i915_private *i915)
>> +{
>> +    enum intel_uc_fw_type type;
>> +    static bool done;
>> +
>> +    if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST) || done)
>> +        return;
>> +    done = true;
>> +
>> +    for (type = 0; type < INTEL_UC_FW_NUM_TYPES; type++)
>> +        validate_fw_table_type(i915, type);
>> +}
>> +
>>   static const char *__override_guc_firmware_path(struct 
>> drm_i915_private *i915)
>>   {
>>       if (i915->params.enable_guc & ENABLE_GUC_MASK)
>> @@ -432,6 +464,8 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>> *uc_fw,
>>   {
>>       struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, 
>> type)->i915;
>>   +    validate_fw_table(i915);
>
> Personal preference: IMO since we're calling intel_uc_fw_init_early 
> per FW type it would've been cleaner to restrict validate_fw_table() 
> to a single blob type. This would have the negative side effect of 
> having to track the "done" status per FW type, so I can see it's not a 
> clean improvement. Not a blocker.
That's step 2 - move the validate call out of the per blob type init 
sequence completely. Either just pushing it further up the call stack or 
moving it sideways to a selftest. First step was just to separate the 
code itself out as cleanly as possible.

John.

>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> +
>>       /*
>>        * we use FIRMWARE_UNINITIALIZED to detect checks against 
>> uc_fw->status
>>        * before we're looked at the HW caps to see if we have uc support
>

