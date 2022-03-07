Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89064D0844
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B0F10E158;
	Mon,  7 Mar 2022 20:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690E510E158;
 Mon,  7 Mar 2022 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646684725; x=1678220725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e+X0uqLHz7gNzJ+uMO/4eexGInpRhAqCV90ZpycKC9c=;
 b=O2qwsMDWVW2Xwif6OibfkMyXxn3wLtJ4ZfcK+76MF8t0s1xi6llZt7Zc
 C+q7gg647bhl06ptN9NK4ys9JMsf2OcO21jAwZAVda+SDEtX39IV9gRcg
 tR8QdgJysQMpZBd3p0D9Fw1YPqFYuFy98OmIqveMYkiI3BHW3nfOCnjKy
 DqsLw/jww+DIkcCXBZ7Di42IEAUQ3iLMUgjQg5N6n8Z5cBLqhEkwi3d4U
 0CcUYURy3P2Nv96nDeeWVrNv0Kbxqr1TAmug+LwGeqrk2tQZSlvXlywHu
 lJCJpS/Jq7UMKljbalMG3cfeluCje7BeqHQtyjd0cz111y6o4kNwZWtjS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315210912"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="315210912"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="537263312"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2022 12:25:24 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 12:25:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 12:25:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 12:25:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 12:25:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoL2mf2ft4SSwqAk4kH6dznhSOvbVG2Z1uPfVShuXsvkhCo3KXKk2zkrEeOS1gKOu6sB1vDwVLjg40OXC/z8QMBZTbksG22+Cb/kk1NzV83zWIDCSnNIzfGZzDTUQKRWhQFADx+vswYKzN5qxDcV5FJwXRY2pF7HQMX2/yjKUBYKFdMwTtaXiwuq4yDa4O3VQj5KLG9DAQIkcV4BDwBX1Fv/aWDQh8XVJXMa3gbEv96YI2wmncERopR7+5a79pu4HVJTxzTHltOdwExiMpFyAKsMJyex1ra7/d6MAs6RTxLioFFvDCT/kXVwd8l7hZxRfD6bZ6CvakpY+yHXEk/HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1q1z18OSyMPqCNpZWpjIPIOK2htev8zaGytwGvWxkE=;
 b=i8vSDiTKe8UjKaV+K6Z9lblXHSO9UThFoGdEjfjftnzruE7D8euACr2Qv0w89vKTy/Cnsq/fNARFMGEdHEkFZ3R/zVwfhmUymnVrUW/DETcAqbKu2a2wiJEIxaVu2MAk6et+/dlFbUHU6SLjel+BGuqitvKEfLI/x7qjmgJS9D/HvKwyvjbBDM8yXAVxoQPBIrC7S/0iAywNbT6Lv/dW+xZv42bs3x76M+uYGR2f5P0dyBV6hIt47NT3E8HZ6TYRAA/4kNU49TxHAugh3121op7GxlgdPS+twzS2YrATMJni8a+CQuZXtMCG9RVA7wRDsxCDJBwMJbaoxVYuarWr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BYAPR11MB3062.namprd11.prod.outlook.com (2603:10b6:a03:92::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Mon, 7 Mar 2022 20:25:20 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 20:25:20 +0000
Message-ID: <70f07f08-36d8-0af8-adce-a3a4c780527c@intel.com>
Date: Mon, 7 Mar 2022 21:25:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-5-andi.shyti@linux.intel.com>
 <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
 <YiU9+uRCzJAZlcRh@intel.intel>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <YiU9+uRCzJAZlcRh@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0093.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::34) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d1de25b-4a24-413b-fdca-08da0078998b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3062:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3062A615F5F082DE85FA14D2EB089@BYAPR11MB3062.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IR1JjPwAJbdw3yi6vM23qMDXVGVoa4HzfMpVcA03vfPnrAQwDW9+fQU6qTCv8rIFwiRanPssNM+vP4iVruXm/nvnTaJu0eTbHtfMoKDjAXXZlTMILMnWoSYhnhGiU7rucR3XH1EyStd1ivdThWWwA+bhjeIqPYktyUigXGU8sSkiyd3NdXvd/ZHpFCQfdGY22fZmgBtEy6cb1Ug+DdTgqNw4+cc1YEpXhRbrFnn3ZuDKKBCjrqye9yfDSMAzTpeV8VG6cT9JsDSpR1g9Io5aYgaf2cRlugnJoDoLORXRFY9vGJLTKB68FsW/IniYj0YqqnKnHuL07HnzbuPoJ6jMqfKCwZl9mLUrrNejG7AMU3ie0xdyXABKYukE6l2xdGeDkq+yFw0HDnG4GFbk8jabr5gmnqPUZYeGPRrlq3pA43hp/L9SQ1jC/o5IrwTH/0kFfU6XrhP+aWnKUqhQoDiF+1dFS6MbaEyg8elVNLY2eiiiMkznu6qPVVCBivwXseElPTzXfoTZEYbPUqJs189KPJQnttQVaXBdOtfT8YlcSdqL+6PoWqrUnlVsydxuog7ahSwb77tqHzivfttSdfMZU+PCnvb2TV+D80W5h8auAaepo8NnX5WHju4lN3wcP5wYyLBhFpos8FBNb90X1GQwIgHMzqr8LKW298DvUaUNcmJr7O01871yFkmD+FDO0mCfV5ubox73/ticm5uZ4p2BQ7XFLWws+z5IvRSzRSCesBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(4326008)(8676002)(66946007)(66556008)(66476007)(6506007)(38100700002)(8936002)(5660300002)(6916009)(54906003)(316002)(44832011)(2906002)(36756003)(36916002)(186003)(53546011)(6512007)(86362001)(6486002)(31696002)(26005)(6666004)(508600001)(83380400001)(82960400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS80YiszMmlRbzI4TkdRSjU0UVUyWWhsWktzSGZBakhWRjA5b1lWSWdIeUQr?=
 =?utf-8?B?ME5sOTI3SFpGcFNyNGQ0d1NGQmh5NHRCNXN4T0kxMmU4b3djREFGN1ArQnlh?=
 =?utf-8?B?U081QVV5M0hmVVhLOXgzQ0VyejNVdXZtTWVhUXl4WWtOekVERnlvMVJNQndE?=
 =?utf-8?B?MHErbDlNY1FXTDNGUFM0Z1VMMzVma0U5bFczNEhGWE9EbVpDVldnTHlveGhq?=
 =?utf-8?B?Q1c4SFNYZ1h5eGRjdENLeUNjdWgvN2pXM2hGWXNPK0lKRzF4OU92NzdCQlpK?=
 =?utf-8?B?a2x2QzZ0aHZzc1ovQTJrVWpJQXdNaHEzVGZlbCtUakhEZWRmMVN6TmJ4VDZV?=
 =?utf-8?B?UTg0SmVQZis3bUVWRjBKc0I5WjNQZFRCRXBJQVo5dGs3bDhPTDAzdXcycnBO?=
 =?utf-8?B?WE95aFQxQS9VM0RUbzBiVkl1bmRxL3BHMHFTRkJ6RWtZYWlLNVhXU1dkNU9q?=
 =?utf-8?B?b2FhNlA4MFRyRG5Wd3h1Y09HUS9rWHhnc3hlTVMyQnNmcmJ2WEMyb00yU0dB?=
 =?utf-8?B?SDZwT1d4THEyQVo1YmZEVlZlMkZBMDk4ZS9BY2NFY0lYOTlKcngzSDRjY0x0?=
 =?utf-8?B?Rm1XTFUyeEJvMFZkVHZHV1RRK0IwblhPS3lnUkNQNGNka0xESWFyRGUvUEsx?=
 =?utf-8?B?SFJabDZWanFqeVVpd21td2lKVW5LTldyMU42UTk0dkN0bkkxbkRmNjVYWFBL?=
 =?utf-8?B?bmZMaWdsWnREWDYyRXNjRFFDbjFpNE43ZWdsNFZXQ3Y4M0djR3p6ZW5zLzlX?=
 =?utf-8?B?TGlVbDNIeWl0eVMvYk9iV2svT29DYUFLSEpSYVlEWHV4bHhmVzBnZWlDcHl5?=
 =?utf-8?B?U2oyNHJwODhCa2ppaWphMktwNitkbzFibHVGRW5FdTVRK2dMK2JXRU1ieGx4?=
 =?utf-8?B?Qkx2TDh5cWh0eDkwbWFrejYvd3pxS1NKMTBoWGQvakZyR3ZnR093dWlweGpJ?=
 =?utf-8?B?T2lLQjRjUUU5Q3ZxTFh4M3E0WEFuby9EWXpGVTlWUXNHdWpsQUp6bjRuekRo?=
 =?utf-8?B?UzVoeGZwOU9VVklWZzkxUTNCb0hnOXpncWlFMFY4NWw3dVpjMzdaZGVuQ0xE?=
 =?utf-8?B?eCtlSDhXekd4T2dQdldSYkI4R3ZlR1NYYm0wMTI5NVBiVG1CVXR2V1ozeEtI?=
 =?utf-8?B?dWc1Mm16RGo1b0N5YW8rSk5nRnlyVzIwdWQ2eW41YmdEVmYvSEkyemRnSUVD?=
 =?utf-8?B?VkFVeWNINXJ3Y1FQTXN0MStXajRvbXFjekQ4cHZQU04raE5KcHpVNUpMa0Fw?=
 =?utf-8?B?SklzakQ2SUUvOFZ1STZOai82WGc4WFJOdExVYUtKU0RHUTVwRXB4L3pWbmNM?=
 =?utf-8?B?eU04azI5QXhQVmF6c1N5eFlEOXpWZURrSWV2SmhXVjFaeDF2YU0vWXYwZnRN?=
 =?utf-8?B?L3pzcmpibXNhQkU5TklBbnlQemtlMTJUYUFnRVJNVzZhTHVkWTh6ZjBmK2Fi?=
 =?utf-8?B?KzVMMTNBT3pXc0FDY0tETUx2WEMySHlrUGxhSmdnRXdQMWhxSXoxL01NdVh5?=
 =?utf-8?B?bDhySlpYRXdxSjNUVXlWRmtuK2pSRnc2aTcvYnQ5MVB6eWhucFBnM3JQQTI5?=
 =?utf-8?B?MTQ2WEliUlNEU2VSaHI0NmRaL2VCMHZOL09DTW9ycjNmRXdrSXkwSFo2M0Q4?=
 =?utf-8?B?ajNlNC9rNFE3RVBPZnZkYlJsSFZ0blRYU1YrUEdpcUpQZjQ0U3Y4MXZNTzFo?=
 =?utf-8?B?Y29NQlJRVHdhZTVjTWwyS2xIc2MwUDdtRHNIQU1yRlZuazdMaTlLend3YW9j?=
 =?utf-8?B?YWpyQWdhLzlpRkZMV2hzNnlZVXorajZTNkQ0MWpOVzlMSDB5NHNWWFlnVjhJ?=
 =?utf-8?B?RkZUVW9HTU9pVE4zNy8yckZ3djFZdUpJWU1CYUtmc3ZzTCtCbE9Wa2NPSnZi?=
 =?utf-8?B?bEJ1RWlxL1Z5NVU2cnJhUDg5OUI5VGhOQlVWRnFWQXNkNm9wKzJxQTE0UGM0?=
 =?utf-8?B?Q01oNnk0Z0FvNGd6a0I0Q0VVLzJvMjdDUld4NHBkTGhlTlUxcVh0aS8vdTBh?=
 =?utf-8?B?ZmFrUVFIVmtWOEhkc1NTb2xiT1B4MExuYzFkVnNoV21BNnpoenZCejVPMEZ6?=
 =?utf-8?B?RlppeWR0UWFHbFRlRzk5QUNzSGpEOHVKRW9WRllZQ1RKZU5HOXlRMkpxTXJl?=
 =?utf-8?B?ZXVTM2RHVS9VSC9rdDk3dE5zK21YOVZjWTJBRmRlWDc3NjJDNGxKalVXSTVY?=
 =?utf-8?Q?tzovyFQyxU4SVTCXCYb95xE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1de25b-4a24-413b-fdca-08da0078998b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 20:25:20.1322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xt1qKanuE1GZ/5EoEqm22iyr9nbI2c2kn1M2+vuasq5tst0/ZrqXlT12mEvzrzIlT7m+pJexw/ke0Jk39YCFOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3062
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07.03.2022 00:04, Andi Shyti wrote:
> Hi Andrzej,
>
> [...]
>
>>> +bool is_object_gt(struct kobject *kobj)
>>> +{
>>> +	return !strncmp(kobj->name, "gt", 2);
>>> +}
>> It looks quite fragile, at the moment I do not have better idea:) maybe
>> after reviewing the rest of the patches.
> yeah... it's not pretty, I agree, but I couldn't come up with a
> better way of doing it.
>
>>> +static struct intel_gt *kobj_to_gt(struct kobject *kobj)
>>> +{
>>> +	return container_of(kobj, struct kobj_gt, base)->gt;
>>> +}
>>> +
>>> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
>>> +					    const char *name)
>>> +{
>>> +	struct kobject *kobj = &dev->kobj;
>>> +
>>> +	/*
>>> +	 * We are interested at knowing from where the interface
>>> +	 * has been called, whether it's called from gt/ or from
>>> +	 * the parent directory.
>>> +	 * From the interface position it depends also the value of
>>> +	 * the private data.
>>> +	 * If the interface is called from gt/ then private data is
>>> +	 * of the "struct intel_gt *" type, otherwise it's * a
>>> +	 * "struct drm_i915_private *" type.
>>> +	 */
>>> +	if (!is_object_gt(kobj)) {
>>> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
>>> +
>>> +		pr_devel_ratelimited(DEPRECATED
>>> +			"%s (pid %d) is accessing deprecated %s "
>>> +			"sysfs control, please use gt/gt<n>/%s instead\n",
>>> +			current->comm, task_pid_nr(current), name, name);
>>> +		return to_gt(i915);
>>> +	}
>>> +
>>> +	return kobj_to_gt(kobj);
>> It took some time for me to understand what is going on here.
>> We have dev argument which sometimes can point to "struct device", sometimes
>> to "struct kobj_gt", but it's type suggests differently, quite ugly.
>> I wonder if wouldn't be better to use __ATTR instead of DEVICE_ATTR* as in
>> case of intel_engines_add_sysfs. This way abstractions would look better,
>> hopefully.
> How would it help?
>
> The difference is that I'm adding twice different interfaces with
> the same name and different location (i.e. different object). The
> legacy intrefaces inherit the object from drm and I'm preserving
> that reference.
>
> While the new objects would derive from the previous and they are
> pretty much like intel_engines_add_sysfs().

I was not clear on the issue. Here in case of 'id' attribute it is 
defined as device_attribute, but in kobj_type.sysfs_ops you assign 
formally incompatible &kobj_sysfs_ops.
kobj_sysfs_ops expects kobj_attribute! Fortunately kobj_attribute is 
'binary compatible' with device_attribute and kobj is at beginning of 
struct device as well, so it does not blow up, but I wouldn't say it is 
clean solution :)
If you look at intel_engines_add_sysfs you can see that all attributes 
are defined as kobj_attribute.

Regards
Andrzej

>
> [...]
>
>>> +struct kobject *
>>> +intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const char *name)
>>> +{
>>> +	struct kobj_gt *kg;
>>> +
>>> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
>>> +	if (!kg)
>>> +		return NULL;
>>> +
>>> +	kobject_init(&kg->base, &kobj_gt_type);
>>> +	kg->gt = gt;
>>> +
>>> +	/* xfer ownership to sysfs tree */
>>> +	if (kobject_add(&kg->base, dir, "%s", name)) {
>>> +		kobject_put(&kg->base);
>>> +		return NULL;
>>> +	}
>>> +
>>> +	return &kg->base; /* borrowed ref */
>>> +}
>>> +
>>> +void intel_gt_sysfs_register(struct intel_gt *gt)
>>> +{
>>> +	struct kobject *dir;
>>> +	char name[80];
>>> +
>>> +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
>>> +
>>> +	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
>>> +	if (!dir) {
>>> +		drm_warn(&gt->i915->drm,
>>> +			 "failed to initialize %s sysfs root\n", name);
>>> +		return;
>>> +	}
>>> +}
>> Squashing intel_gt_create_kobj into intel_gt_sysfs_register would simplify
>> code and allows drop snprintf to local array.
> right!
>
>>> +static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
>>> +{
>>> +	return kobject_create_and_add("gt", parent);
>>> +}
>>> +
>>>    void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>>>    {
>>>    	struct device *kdev = dev_priv->drm.primary->kdev;
>>> @@ -538,6 +543,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>>>    	if (ret)
>>>    		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
>>> +	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
>> Why not directly kobject_create_and_add("gt", parent) ? up to you.
> of course!
>
> [...]
>
> Thanks a lot for the review,
> Andi

