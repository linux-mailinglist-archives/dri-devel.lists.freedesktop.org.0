Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E214D7917
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 02:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D9B10E36C;
	Mon, 14 Mar 2022 01:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89C110E36C;
 Mon, 14 Mar 2022 01:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647221527; x=1678757527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DzPe5pgwpsa2cOGn/x+94NgU1EGfqDd2Cenl1y0gP1o=;
 b=g+nd+U/H+XywovymgKZcO3YaiqdnuFKcQhFFVXRPj3W3ArityUVoHD9R
 pyvjj2fnY5RD8NNJqgSFeA2gvb8zICKpUCaCPWQod/whmiv8pnXMyaOPQ
 Ah2Q7CFr0GWsD//LElh5yeJoW0arI1iS3mizZHMV0wCUC5xh3KNOH9Cyz
 2VIPjD4sXMjClgrUvfzgGnl4jZGvYNKxng5slyqwUOLCThokEbuhvn6TF
 +sl+TOn/mKStakIz6g1CHE5aSjpZizRF3HhVt/LepcgzJt6+Sn06zcF/+
 eROWzHg09VUQ2Hu86NtDAmwdx9PpOI/S1hQ/w1zZAKoksWU1XH3M3ZEV3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="236517654"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="236517654"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 18:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="634021494"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2022 18:32:07 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 18:32:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 18:32:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 18:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xgy3x6IIonoj1O/qGFNcAAoLi57wGknkUDdKUL8Drff9DJD2qpmQtNOjhxoopls5XQPKbegZP27uC3Boguclx4CzsjJeQFZj+e3qlFs1QUZ5sZ5NR8B7589kxupvWgwjhivkisLy5OP369M7ccZzfwTVlz0zcDH5v4AJ2/I20pFnq1g3hFiRwzmpmZGwwJyru7413wSljlhjJmIWhB7kxh9Iw4XGJzBKM/YDiTa2yrUCqh8d0VQUeKYEMGq0upts7IqflzHwC2C3wFtg5N+mhV3piJgzpr1bQuHWszEYOuf2y3cCVTTaHZXdRA/BwnkOO8PJrL/EVBInqh2QXqFOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SuWnFncqHwtWkZXyBN/yvVwuElCIfV8Nncozr8opPA=;
 b=WHx4Hv/KGYfE15xntlD1B6yGA7RFU6hNmJ2/FQ/qiSGGfoQPgKBWiCSGRoGnMYU2RP3QYwzXzMvCSUrWNDrUS6DXyxr/Bkz5rWqo6+/2qQvAQxVI8388XWLBKBNOb+0SFxcvkphat8BHJAPSdYRC9C9z5v0jpDRCx40xCUB7vdqTj9J9aqwA7j46bFu9hZnJO8ds9Dqb2509JIqBeeeAgbRW9898ckT9grbj0NYHsR2P3d9t9/DJimzZFw4zsPGzDbutrarbPrMwy8g/vFqHu5xgcnSeRpXYBvErUS1T9FtPBmpS5c2bglzK0Hoa2wRIzwDIkCLe0uztB5kyJ4FjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MWHPR1101MB2254.namprd11.prod.outlook.com (2603:10b6:301:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 01:32:04 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::7de1:f70:bc59:97ff]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::7de1:f70:bc59:97ff%4]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 01:32:04 +0000
Message-ID: <ae25fae3-100d-2dc7-512a-c18f479b432c@intel.com>
Date: Sun, 13 Mar 2022 18:32:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
 <28e2363a-38aa-9d68-ac59-b78c9168a814@intel.com>
 <Yi6ObL00OJ8gB+V8@intel.intel>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <Yi6ObL00OJ8gB+V8@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aeb19da-5acd-44ee-e135-08da055a71c9
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2254:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR1101MB2254FB309AD6AB8E422FADAA8C0F9@MWHPR1101MB2254.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDUausV7nLMNBoqbPnmk5YiWPJEqNDWCPMJs/S5kbDxHoU1969Q/HeKPhDxockBYn4V6Hvb3Z7vXty+xC/0o5aYV1pRHIi4dA8+ghL3PcE3lqWwhX1X4K0mbeSnpYSLBNOGS9XX0H4ScByacwa1BcACunIOjwBUbMlFX+lzVQ5eceE5hkY8WIXcQMbp28qJsZo9yQueUj/aXn3BHn2yJE0Izqaf7uBh2f4kuSgUEh6lyjbLy5ncRfc2dRr8gQvnUXWhMzcbnKUEx24a94rIwRNZT26h6+lWh/+AtVvW20yRwCvC/wxogcnxxO7wZWG/pW1YYmcjClGGo5DKYvNCZP9nnJHu9YYELkJh49l1nBkugnUpZ6G9oN+EFlvQjtWCPuf0EYsi/Rh2u41fvHzKlXD7SYfAY1eIZHAJ+ngYXwKQdbo4v/V8SIViwzNr4crYulZAqghSX1seN7Zv64cHcwe7PADdHWwgsM0xDlJzEhBfi1+fBprdl7ldU6j3DXq8BD3FhLQkjEWNEAZ+OUH5rdAAFJwMTNuJtxBubYV/UduZL2/rm0EZugEXq5v6WVQ8kMrT1N3gwzzuvLuV+FTsV+LBxUrBNUOhUFelji+8DXSzCz6gKaU3zmkZi3ofqkf72DFjHURtiqGN3/k/ySLvSQkICKWkL4V2RFBk0k20v705WVX3Agsc4hXHnG++3VKLp85gDaNXBmS3BYS7/OtCAet1cd3oTWG0/ogvozJhXTVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6636002)(6666004)(110136005)(6506007)(54906003)(316002)(6512007)(53546011)(38100700002)(8676002)(6486002)(31696002)(66476007)(4326008)(66946007)(66556008)(86362001)(508600001)(31686004)(5660300002)(8936002)(36756003)(83380400001)(82960400001)(26005)(2616005)(2906002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnloRWFDNFRlUXlWLzd6UURJU25XcEdTUDFqSTNzWDNCTVQxL0NtSG5OR3Vz?=
 =?utf-8?B?N1pWVkdTWlUvdTRGdGY1am55czZtR24rTGpZMTVZSDU1b2tIbkJlWFIybzhZ?=
 =?utf-8?B?THhQb2J0ZU1XQ1VhNHBsd3FQN3dwK2p1bEtaVkkvOUwya25pNHZJaFMrYW5w?=
 =?utf-8?B?RDc5dFV2d3FzendvaWd6eFVsTmUvbXpDV3BNeHdVY05IOElUQXROeGYrWC9L?=
 =?utf-8?B?UjhtMC9uL0tmU2MvVEpjREdxU3lRYWJLSHVESFNHTHNjSTZTTzlJcWFoVmNU?=
 =?utf-8?B?aWtyb3QvQTlWS3MzZTMyaitDRHh3U3NMZjVjaWJqQU9Uc2lnKzZodE5BbnFx?=
 =?utf-8?B?UTlLS1paaWN2V0pJUWZxbkloZC9veng0NkxCTVl2SUVzRUlXbzkrWGJZeWhw?=
 =?utf-8?B?OVcxbGhXRjdnYmhaRGJmdFQ2L09BMm5sLyttL0JyV2dUWUtieE5oLzh3QVlI?=
 =?utf-8?B?MENlWnZzRlhTeTQwMERpR2dheHhxNFBYRTJ0SFhpQ0FOdmlqWDFnM0M4RVc2?=
 =?utf-8?B?aTVnblZyUUFQTEx5WjRxdTA5QTQvVWUrUVhXNDMrSUh1VGdxRmN5YTZ4c3NO?=
 =?utf-8?B?SWdwNUVCd3BpS0N4MWJwdy9DTjlZbW1sVlJZTXBWQmNvNHpkOFR5VVcvSWR3?=
 =?utf-8?B?Z29uT2lPbmFNWjlQSys4TWc2TUdaY1VLNW1TZHR5K1JxTDhBOW5XdlpYcVV6?=
 =?utf-8?B?K3Nwa2hBWnMxVzMzR3hXeGRQeHlBdzkxUFJNdTYzU2N2Q2Q1Ky9rY21aRXZN?=
 =?utf-8?B?cWw2TE93eEQwUzNFK3J6Q0MxdXk1bU5iREJNWU5peXBGVVF4dDd5eXJSelRR?=
 =?utf-8?B?VU5LamFxdTZhZmN6TG9mcVhvZmhmRkNaZElQNmIzYjNmSndLc2RBNHc2dU4w?=
 =?utf-8?B?bmswVzZEcGtrcGcrZzVOK1YyU3JkMW80V3BMck5pMHBaLzIzbXNucm5kVHBD?=
 =?utf-8?B?SC9tZGtneHpmMTdYSVp1Y0JkSXBzblRRRlFQdFgzQndhR1QwV1hkSTZDaTF4?=
 =?utf-8?B?dWpnRGdtbDdWQVpta1I2OEJWQ29JOW1sbzZzbS9ZUVU4Vk9tZVZtR1ZvVnZC?=
 =?utf-8?B?WHBNcDhhN1JJVm1oQ29BOWRYTzhNZmx1Wnd4b3d6N3lJR2JDMDd4dUZLK1Y3?=
 =?utf-8?B?VG0zc21tZ2ErNklYa3F3VnpTNUx0MDdpclNEYmRlNXFwNzdudDRJMlVtamhr?=
 =?utf-8?B?NFFzK29Tb1ZRb3dTWUptR1F5cUhqS21zNGFRQnQxMWVDZWhFVFoydWFHRlFo?=
 =?utf-8?B?TC9qSmJ5aGhkMTZvSmxNdFRQZkN4cXBmU1I1bWxoaUtuMXVpeEc1UE9mS1dP?=
 =?utf-8?B?MmhqZDlkcE14eC9hcVd6djdUaFBkV3MxZnlSNWZEUExVQ0ExdXFwQjQ3YmZ0?=
 =?utf-8?B?T0M5UldhTU9OMDhVVFU2MFJtSWkvUWpyd2grSzBzRFFRVFFkUTZmbHZnaXRZ?=
 =?utf-8?B?RkViMnptU1NoVGF6ZjF5TGY2Yk01TWdTNDJYQkxkRDJmNXVoQ0RFOWhJQmVB?=
 =?utf-8?B?ek1KaFlreVdMaXg1STA0cFdDNUErRzVKQ2dyVG1zOGZJZXFPKzE5Z2V0cDd1?=
 =?utf-8?B?THduZ0xOTWQ4bVlpYzdvcThuYlBzZmYwWUVnWk5UMGI2VlJBdGhsVTBwMkRX?=
 =?utf-8?B?dUZKYWxQdk1aRUJXSFU3TURJbFB3dUVnWkNrcklmQWdNSW5GeUhmcGRNQldm?=
 =?utf-8?B?YXI0ZllqdGRTWld3dTN0WXdqYXU1UGpvdUlLcHM1YkJ2YUtUc1YvMkNrSlZ5?=
 =?utf-8?B?WXFraWdyZDBZeG9WazV4TkFCb1BOaDZLTEdIaWpaRHRIM0VMVE1pQ2M1dnkx?=
 =?utf-8?B?ZnhIZktva2NLSXByYlRCN01TV0RDaXRsYWQvYWdkc2oyd3FPZnhJcDNJN29s?=
 =?utf-8?B?SzhtaFlpUk83TmpaWjRQY3dwREQrbVJxeGdadlZOcDVWcG1iS2xOL2g5VEtW?=
 =?utf-8?B?dlpycE5LSkJPY0w5WjZkWWFvam5XdE1SYlJhYWZtcXF2UnpjemY2R1ZiREtq?=
 =?utf-8?Q?Q9H2lgs+kGtwk6mfCu3XuOGnPCqo9E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aeb19da-5acd-44ee-e135-08da055a71c9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 01:32:04.2929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m7Ulwk3XNEp+aEbGDPAor2FHf/97LJ/YXSRvU3m0eR5zivi1h7h1MhHmU19uDPnVtc5IXCA15x9IJXZ9wSkttht2e9zNJoZ+FVI1kuwWjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2254
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
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/13/2022 5:38 PM, Andi Shyti wrote:
> Hi Michal,
>
> [...]
>
>>> +static ssize_t punit_req_freq_mhz_show(struct device *dev,
>>> +				       struct device_attribute *attr,
>>> +				       char *buff)
>>> +{
>>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
>>> +	struct intel_rps *rps = &gt->rps;
>>> +	u32 preq = intel_rps_read_punit_req_frequency(rps);
>>> +
>>> +	return scnprintf(buff, PAGE_SIZE, "%d\n", preq);
>> %u since preq is u32
>>
>> and use sysfs_emit (also in below show functions)
> sure! I'll change them.
>
> [...]
>
>>>   static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
>>>   				const struct attribute * const *attrs)
>>>   {
>>> @@ -493,4 +628,11 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>>>   	if (ret)
>>>   		drm_warn(&gt->i915->drm,
>>>   			 "failed to create gt%u RPS sysfs files", gt->info.id);
>>> +
>>> +	ret = sysfs_create_files(kobj, freq_attrs);
>>> +	if (ret)
>>> +		drm_warn(&gt->i915->drm,
>>> +			 "failed to create gt%u throttle sysfs files",
>>> +			 gt->info.id);
>> nit: would be nice to see %pe why it failed
> [...]
>
> I will add it to the other cases as well.
>
>>> +static u32 __rps_read_mmio(struct intel_gt *gt, i915_reg_t reg32)
>> this doesn't look like "rps" helper, rather like "gt" so it should have
>> different prefix and maybe even be exported by the gt or uncore ?
>>
>> unless you wanted:
>>
>> static u32 __rps_read_mmio(struct intel_rps *rps, i915_reg_t reg32)
>> {
>> 	struct intel_gt *gt = rps_to_gt(rps);
>>
>>> +{
>>> +	intel_wakeref_t wakeref;
>>> +	u32 val;
>>> +
>>> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>> +		val = intel_uncore_read(gt->uncore, reg32);
>>> +
>>> +	return val;
>>> +}
> Yes, you are right!
>
> @Sujaritha: shall I move "__rps_read_mmio()" in intel_gt.c and
> call it intel_gt_read_mmio()?
>
> [...]
Sure since it is kind of a gt helper, makes sense to have gt prefix.
>
>>> +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps)
>>> +{
>>> +	struct intel_gt *gt = rps_to_gt(rps);
>>> +	u32 thermalert = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_THERMALERT_MASK;
>>> +
>>> +	return thermalert;
>>> +}
>> shouldn't we return bool by all of these functions as used/expected in
>> show() counterparts ?
> Suja?
>
> [...]
Yes we can make this bool as well.
>
>>> +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
>>> +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3
>> this mask is different that other (FIELD_PREP/GET wont work) so maybe we
>> should name it in special way ?
> As far as I understood this is still a mask and used as such.
> This mask is actually telling that there is some throttling going
> on.
>
> It looks weird because there are some unwanted bits in between
> the interesting bits.
>
>>> +#define   PROCHOT_MASK			BIT(1)
>>> +#define   THERMAL_LIMIT_MASK		BIT(2)
>>> +#define   RATL_MASK			BIT(6)
>>> +#define   VR_THERMALERT_MASK		BIT(7)
>>> +#define   VR_TDC_MASK			BIT(8)
>>> +#define   POWER_LIMIT_4_MASK		BIT(9)
>>> +#define   POWER_LIMIT_1_MASK		BIT(11)
>>> +#define   POWER_LIMIT_2_MASK		BIT(12)
>> REG_BIT ?
> yes!
>
> Thanks, Michal!
> Andi
