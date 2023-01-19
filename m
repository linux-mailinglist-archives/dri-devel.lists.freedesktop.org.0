Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B02673A1C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E1410E92B;
	Thu, 19 Jan 2023 13:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E85A10E92B;
 Thu, 19 Jan 2023 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674134864; x=1705670864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ASlaC4Vu0SwRBi0MqXvoShXoPU8DYddmtQ13TwkMVk=;
 b=JeYIn44Q3TZ3gGoEbkPreJvufjhDHtQAN3782pGK4AF//6hyP4Oh4RrE
 9wQpq52sA1SrpWThXz8wPdpq04WcIH2hGyfYx6F2QAVF0sNuRWbXeyYVi
 nREoER8WljQxC3mC5iut/cZEnrxwP6UTbEavpWxGEEJql5Caos3gaZB5S
 Q/syjLgxU9A93yjhxAaAjpdrls7kRUNHfk8C6Z3e2533YnLnDYCkt0eC4
 /q1532NS5aPfjs4PI2S/zBgxeMzHEnyUqbeg8+ka+BJCsW/Nh4nv7YktD
 12cJCPw7AUKMAQngT9r1+8/1a60kAD7EtLosigL2yWcMJJBFkMnXEQYNl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327359918"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="327359918"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 05:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728664543"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="728664543"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 05:27:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 05:27:42 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 05:27:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 05:27:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 05:27:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9JMHP1nqEBorULf48ACk1XI72YQCFLGP0HnxetusynLTqXYgVbPXAbcEf8TBQTO4mNMPARtjmgR18DQeaKRBNeaiE1L7R7Slmxn99C7v8Xc6fAdpEzS58lSHC1FhXre44pctP5vzV5XARzah4VZgIadyQWls46p0ERVhik7/xbqGJ1RR4fWCKjlqv9NvJtyzPRBucI4Jktx56J3RPVVyVazoud1To+Cz5cxJiuXxEXGl6QXg6Lr4PjwrN5m6KehGCFnuSZka5SQIBc2uOS1b2WHslAIoABWKuv+r3uIieyqHXCRJv/4yEFi0c0663I2M94cXCvJWUUJwntaS3nngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ASlaC4Vu0SwRBi0MqXvoShXoPU8DYddmtQ13TwkMVk=;
 b=GIXUOdZuBK2UnY/7qpzclokrrMl/DSSUlbc5Duql5pdPYemmobVnZin86Hkeb8ZhLLXPjwH1ZyFw2B/+HTl9runskG/rLslC3OyoOis7abKVODXb62E/rSUL5sfUFR7Ooy5G9TSBPNhZ6MlXGlxsKdgYnqDKtHXv7yWZjIguwrjGizl7RDEm+nIVxC04NFa2REX20lGYt/MX5ngG5MgngcpmiuKBQNxjmVcFxZluitPZO3ECPONkqad4/xZWTMnbuv+WfgOQTBBQ1vWLV3L34c9cnz5eO7UZCaiF/AbdP1RmEcJj4WNXhEnxAqQVJdQOau5aoSwdN1KC3GH4Nobh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 13:27:39 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::755:cc4:8c46:509f%6]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 13:27:39 +0000
Message-ID: <80953bac-073e-0750-0573-27d886e3c163@intel.com>
Date: Thu, 19 Jan 2023 14:27:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/drm_vma_manager: Add
 drm_vma_node_allow_once()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, <intel-gfx@lists.freedesktop.org>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <167413471736.3247301.2506243938133853546.b4-ty@cerno.tech>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <167413471736.3247301.2506243938133853546.b4-ty@cerno.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 719527ce-44f8-4756-892a-08dafa20efa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEaySwndzN1ibdkPVWS+nbQt9ed8ePTa4yW9rgHvZ6Q6AHR7sSk+ydgaZF2HNLXM6jys80nmhYl1tHLSfXbc6ijf4sCuRPB+7dRetQeW7ZDBhzQZt4BbiABt8XBnMnYeFHD2UbVemQ4aEZbbkRi4TpyE9X4goMebYYt4dLq+EnHfpx35FDl+DUOgWWwXWKiITdfuEWxf73MDjsMsNBCR/prVlcondYwb6gfAPqcF2kBXITjhwcRs6ip20YAI5cxnbF2hFw7GZDLl0XiM9koEzCBtmEQbYkPWjFdasdkGN252mOzQy5HxHMUdgy6UgGK6QbxL296HTl77AU02efPwdEYTffCfipgPQ7e9Wd6ZL9Rv/18ebKgE+8mcHADGnX38tL7fEFocmDxq+ZP9riYdy7mPv9xIVWsYb6TVGBKOlRa4hgCVIEFSFPPV3lh7446SPLGDuaI/C2Z6pfj6L+g8S9nUDT/5rbHh7WvJE0NURTpWtT5IXrNefvMwZSLCCAHTULRNrosIb9wuERQiTXTDNaqMtbm4bXu5P3oR6WxxJl7XU+T/06I3LoNNQb8ZRgYFSslaubRZn8HYtp3vbwK4FQC0ctsVs+gNEMYW23Vyo0S3RcdqPV5uN3IUiC5fRjTymy0hvUhDaRBxFjnXLzbtdNIH8tox/GDqhePjjhI+LznKSj/tzdX244URneL9JUQ7d8L75O9/BXsxxp/TaAFEaAMreNNhEyGjbr7Kqi4ImsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(38100700002)(4326008)(86362001)(2906002)(66476007)(4744005)(5660300002)(8676002)(66556008)(66946007)(8936002)(31696002)(41300700001)(2616005)(82960400001)(6512007)(6486002)(186003)(26005)(53546011)(6506007)(316002)(6666004)(478600001)(54906003)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZ1cllyeUNsbjFoSjJxcU5TRWZab0NhQU52RW5ienQreHpPbHlLQkFxZkkv?=
 =?utf-8?B?ZUxRRThkMXAxVjVjN3lpZ2JqUG9mMVR0ZmRza2lnZWluN0c4NkNvSTl5QmNW?=
 =?utf-8?B?TkltQUxwczd0ME1hY2M2aVdnMjcwazNlTFBPM2ROcTNIQ2lMYUpjQllVRzFP?=
 =?utf-8?B?TTluVjMwdXc1Z1lraVNaM0RZbGpEMHE0cUVvWVdNQWNmYmlhWDlPcVljZC9n?=
 =?utf-8?B?dXNVZjJRUU5RSDhpZlpvcDRNQXQ2Y2txUW1NcjZHTlM4QXkwYnk0RjZ6MTFa?=
 =?utf-8?B?U0FibkhwdTZ6RmNqVUYzOHVxRTZSOXdJaUZUZzg0QVMrQk1rc0dxcmpVVVR4?=
 =?utf-8?B?TFRHajA0Nk93NWRtMDRnTW1uSGgwLzhWeVk3bDVETkZGS2JFR3FXRURBeW9T?=
 =?utf-8?B?WHJWZE1Rc3NLREY4alFoOTg5ZGJkbG1YcFJDODMxY2QvVForU0dTdTJPWmx4?=
 =?utf-8?B?NjFCdzZ4Ris2UzVEU242VkRncDVkMm8rRUhZaDg5T1ZIRFpSY0t0dnVCUXZF?=
 =?utf-8?B?TnVtQ01xTjA1ZFVCdDhJbU5FU2JhMW5pajB3cDN0QTJrdTNCYk5BOXpSUGRE?=
 =?utf-8?B?cnduaGZiZlFsdE9ZaTZxY3dLbUJxRk9TbkE0TW1za1lyRkJUSGZVVzkybENS?=
 =?utf-8?B?aXFBbVVUNjAzOEdobmROUkxiRjZreVlpUFFJVzc1SWxIN0o0cjhMWFN0TmZs?=
 =?utf-8?B?ODNFNUhZejlkaldkMDlONUNRUDBzV1JDZ2xMRnpQT05FcXdEV3ZMTUkraTFU?=
 =?utf-8?B?Y3gzSEc0WlpFZlVKcFZzOFNCWWh1TFBEN1B3ZzE3VzYwZWxYcWRwV0hUelAy?=
 =?utf-8?B?ZTg3bzZseWpybDE0c1VObFAyMjZsZUM4U0hTUWJydTNWUUJ0SmRBWHk0MkRT?=
 =?utf-8?B?WjlPYnl4SVAwRWhvdmJONHlvbkdCTlliRUU5M3NmR0RvblRtYnJ1SDB3Mk5J?=
 =?utf-8?B?MURmd2NqUHE3czdMVDh4eDMxeWY2aGgxbnpIeVBseXBkMXlaTFhUYmYwSUQ1?=
 =?utf-8?B?ZDZ2bXkydmRMYlRNOHN5RnY1eTFRZHloWi9MOTZ2SWNYczV5L29zZ01Rc1VE?=
 =?utf-8?B?aE02Unl1MUVGWmtvRWF5OUo4SDBMeWlCTzdjS2RvVVVBbjl3WGVmcnpCTTBj?=
 =?utf-8?B?UzFMbVNLY1NhNTZPY3h1cTBER2tyTThWRmV4Zmw3OExZRnY0OEdQWmtVNTQv?=
 =?utf-8?B?a2ltYmFWS2U1dHFmdklmSXBNaEtQbGJqSFBaOHNjT05BbjZCOWZCWHVPOE1l?=
 =?utf-8?B?SUxiSWYyelFYems2Z09ReDRUVmdZZzI5UktjRGV1TThPaVhkbk0yaTFONnpC?=
 =?utf-8?B?eUh2ODgzSGI4WmpSTllxZWltM1N5UWMrRGRwZnpDTWk2ZkFObGlTVWlYQklK?=
 =?utf-8?B?OUdLTmFleGtiaVdOdFJ6VmVUTzFqaFBueXJmV0lqT2dMaUJIRkJwYWdpeGND?=
 =?utf-8?B?R25SQnNuVmJZTHlrbitvN3M1ZmFyeDUwcGtBNmlJSCtvUno5Sm1yUUxQd3J2?=
 =?utf-8?B?YWRlRy9lRHd0RDh0T0twVHFrcEdXZ0RsZ2JkVEQxd0dHSnU5MnM0WWlpTUJi?=
 =?utf-8?B?bG1TUlgrUkI3dWxZUndGZFNFcStCNnRTTXlacUZLWjV1czl1ZThCMDluNFhW?=
 =?utf-8?B?bmRPVzRPRGljNUN2WllQYnNJR0V5YXZJaU5vZVRvcWwvK1pTN05SeGU4anVD?=
 =?utf-8?B?R2VVM1Jwd0I3bnVlQUJDVGQzb1hxckpsbzRmMElnRVhFeUpRQm44R1F5b1Bh?=
 =?utf-8?B?OEVwbmVVcWFiRXE5ZmpFMjRBSmo1Z0NBTmxPQVlhbnZlUlZYQXBQVkk4S2F2?=
 =?utf-8?B?UEFOMlpFeVZPczVJV2tGOE84T0Jva3lVNGZWTEJMNlhuQ0FXdDdnVmd4UkRB?=
 =?utf-8?B?Ym8vMjYrSVVZTUFsSTVQTWFwc3F1Z1FUK2IwNDM2bGY5ZUR2Yk4wbjl0YWtV?=
 =?utf-8?B?VmRYSldQSWtSYURqdUw3WTFmUDd4cm9Ya2Y4QWo1QWpUcFZXN1N4OVlVcjU5?=
 =?utf-8?B?US9LMUNiV0U3eXR0VzUyRXZlaGhoRUtNVjhoSm1VTFIrQWRweWVrRDRWeUJh?=
 =?utf-8?B?bFBNQ2t3ZVBoM1prQXdkQXFraFVLZFhWWmJTbWRENG5ndlZXYy9lUFhlcDEx?=
 =?utf-8?Q?laAeio6PUXqJT0PryIZoruew7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 719527ce-44f8-4756-892a-08dafa20efa9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 13:27:39.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwEQSOjvzSb9/vj+S1J6BycjUa+Q/21R0gh+u8+ofZzmxrLNrC98EUrSEXxBBP62jZ+wc2GpZU3FkrscCkm/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/19/2023 2:25 PM, Maxime Ripard wrote:
> On Tue, 17 Jan 2023 18:52:35 +0100, Nirmoy Das wrote:
>> Currently there is no easy way for a drm driver to safely check and allow
>> drm_vma_offset_node for a drm file just once. Allow drm drivers to call
>> non-refcounted version of drm_vma_node_allow() so that a driver doesn't
>> need to keep track of each drm_vma_node_allow() to call subsequent
>> drm_vma_node_revoke() to prevent memory leak.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> [...]
> Applied to drm/drm-misc (drm-misc-fixes).


Thanks Maxime!

>
> Thanks!
> Maxime
