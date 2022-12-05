Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594AF6431C1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902310E111;
	Mon,  5 Dec 2022 19:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3D410E111;
 Mon,  5 Dec 2022 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670267849; x=1701803849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJCQ1at0PIeH1EVImJUs8XBVIvl7GsCpEDu6XlNhRXM=;
 b=nC9QB7O0VdxHxOF8lSQfS7aizDIkorRmpG6bpyH5n46z1T7OPEqseI6k
 YWKwdsXbGkMV60a634LYD0Hi40uIx6DGRJdWUVvf+rqo6mmPYmSkoqwoW
 EPptl7AQTaGqtAq8XKq5VxqiSGNrR6cldN7YnxA4B5YwH79wgeSyKVTe2
 jpoXqHhTSSdcIurJdHiOjHkRQu2GFom50Nr+LaRnoi/lr+0nO0u2cFLbG
 Ln/FUYjzc7hMJxFhhyfs29AbzpKAq5fMlVEqTS7SIjG8AVyRRwWVFRfph
 702qjzX5OIXejgGqsYb1zPx8BwPrYd98D4h20FYpYKvv5IFpytCg+rX0k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="314089693"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="314089693"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 11:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="752318901"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="752318901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2022 11:17:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:17:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:17:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 11:17:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 11:17:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ/aMKEVHa3nnS3rSpWQAxdIFD2MuqTk7Ml0Cvhy6cMY8gyEwUhgv6Uw0HFwCXTs+E4mi1imL7MoygYN58tTXWF7o+6aBDLzKwsWy3LZwGNLMZQ3xUsam468t/dfnI3X2zJbKkCan5Q8bshOEKw0e8E0dZHw/22lBOgEf2ETiSTJC2hjEqkmp7chvKo3p/xmPRKJHWzVcnlhuDpYP1329k3/bvYyOEE33Rs6Ieql33c8Cllutm01gwukwNHShKqJ01cWhsmFXFR/8uJgagI/ZDb2bGezeepmaTaCBA5XQaW5+n6zss/t1CcjHTIfnoAepDOO997C6vnPc6kvEbMWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=437SUZRNevPQ5kF0ndCO+Lp6dTfdeAZRGDb2TuXx/Ho=;
 b=GV5HH3DUka04TsMVP7uKJIEPQGraWy+cO13OW7+Vm+KB4WwlHz2L0kIte7XT9Hd7oghmR/BGfs65sPZTlYXgvgquINFFRz1JJCEq3MNXeBuP+V08CIA/ssSHztLT05NpVhgjcYwVzmidTM293dmKldVACs8uANO+fFGMX9242SzHyUEkYjpimfkIeNlcP43N2d9pHBbJopKtW57GZkk9hinBTeFER8d3nSgaDcWLIxZkSeDAP4xP1yv2xdvU0WQgbAUpzhSMmhvu56kkwJ0ALweP0k0qvQwm1riBDfDjTm8kzs0/pTJGJSFHgUcYnVC+rzsZSm8zYZjJBDzvj7knGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Mon, 5 Dec 2022 19:17:25 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 19:17:25 +0000
Message-ID: <ec3bf1e3-d912-16f9-7975-e93304c3cc3c@intel.com>
Date: Mon, 5 Dec 2022 11:17:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
References: <20221202232821.4144884-1-alan.previn.teres.alexis@intel.com>
 <Y44xCSCGgSLkYpHc@intel.com>
 <9eeaf51cd9e32d5456611e2d7308722029176b31.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <9eeaf51cd9e32d5456611e2d7308722029176b31.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1b3e97-cda0-43e0-ac56-08dad6f5577c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAwMazlLGD0o7AI0fpEh3QuPZM80EOO21yyu9ZLjiJw2CVdlzb1cITctuhVCuHtqnnILefbFM8NT+K+hDty26dLmldqUSQZ/w9dQNyxHM74HW0hQamjS8DNbvPhbp8/8VY0XcqN7TYeZSFpYZ43ngHTSbBiKmV0YElQkmZBCL20fJAFUG0GWc5avpA8+5JsXiYDwNgl2l5P17e+cBDLYsxXc6QLZgEKPsnlhbNGoJ0mhDcS4C2kDuHvaVNsI6LZA4J518CleDsiWjsfwOMAMKO8eDjtF5t+TW+XvaDD7J9izVH9abWxZF4acIqCmklQE4irKV7trzsaXCVYGJG/OPpRqiYvxSFTzNn7n9cozD9ZU0BTVC61VLI/ywJwSxjvMYvr3qfmo1WW7jr1/zJiRvOQM8tlO19n30SZRhmFhAlURg4Lu7RYnDhk+mWtmDSm+YkDxkw9hkJIbcWw1QSxJamzJCLOM8UchEeCpeDBOUFaeS2jyeUUHWl631t/1tHkNnFKl1FuXc5fwZMgLAWbybvQUx1zSKwtGOv6Sz611UTngS2hWIodNwxciuBpQ0wXolH70f2D9VGTkEpT/dBvPZ4/Tnc2XYiuEnOZ6AHFdAZX7vu9aIrdmlJemO8207M1Frn1jjq/Zz/De1Eoz3aaQzK5m0iULTnT7jpDyMuWEGsLO4rXvlNlhbQY0YDVNbVUHZxwG8HuR2D8OzjvLd5ErqWcZQP+fm32QeA/8S+d/e18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(36756003)(31696002)(86362001)(6486002)(53546011)(6506007)(478600001)(6512007)(26005)(6666004)(4326008)(5660300002)(8676002)(41300700001)(8936002)(6636002)(316002)(110136005)(2906002)(54906003)(66476007)(66946007)(66556008)(82960400001)(38100700002)(2616005)(186003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tnUGxFamVHR09KOUhPcGZEZGJsKzNiYldOZkNEbTlIZjdPcXpBMW9TeXR0?=
 =?utf-8?B?ZHJzNDJ3N0UxS0JCQldUZlFTL0xxNWpNNzBETi81V3ZaNFAxSFBtamRrZkNj?=
 =?utf-8?B?NjRKRnhGMzBsQU5uNGo3RzJkUU5wNDFZL0NVQ0twSlFKdWtYWUFIeFo3c0xX?=
 =?utf-8?B?ZkhKVzlINGVVdy9DbFJUeEY4NXA5aW5lUkl6WCtDMEM1QXVWRCsvczZLSU96?=
 =?utf-8?B?K2dRUVlBc05rQVc0bmtaU3UvL0t4Y0hPUFEra3FmZDY1UmZ4aUZuK1pYMkNV?=
 =?utf-8?B?R3RZZWVDV1R0UEpQSVNBeThoMU9ORUVxSkEwMmZieFRySjFGblI5NGMyd0Rw?=
 =?utf-8?B?OURyazF5MldxMzlkSFlCOXNyUDg1YW53SHJLTk9nYWxRdDZLb1pYK3pFMVl0?=
 =?utf-8?B?bG1jSnFsanQvUFpCVGZ1WjZxdFBGWDBMc0R2cXpjYzJPQWhTZk94a0lSM1JR?=
 =?utf-8?B?eExnNjVnS3N4WmNyQUxOSGZFclBHUW5tRDkxYlN3RVM5cVNBMnZDRzZqdERR?=
 =?utf-8?B?MHMzTWs4WHRlZU00Y0MwMWRXWW5uYkIzSURmcmZkY1NrZENyMkF2cEI0TVV2?=
 =?utf-8?B?Yk5yMFhUVFlsWEhMWDRQQmt4MHprUVhucHBNTVp4RUh4R0ZPY0kvZU1qMTRU?=
 =?utf-8?B?TGlneG81NUR4ME9neEhKMkwvdzZUNzJZa3IwSzRudFI0ZGY2QnFLY0JFY01B?=
 =?utf-8?B?MVFrUkNBZElTZ281MjJLRUpMMHl1TDR2M3ZxV0VoT1NVdUlweWttK1FNWHJJ?=
 =?utf-8?B?WnpNRER4UkxUakVBQzk0UVI5N015SjdZZk9IRExreFQ1RGJFZ3JzVXBrV3ZV?=
 =?utf-8?B?dE1FZ1V4VmhWWnp1Ry93aEtuTDlxMWJHMjRSWVlxb08zZ2NZV292TW1YMExH?=
 =?utf-8?B?TGM4RHZTcEY0T09Gd0NHKzBUeXQ1bXp2Rkk2bTVIcWVMMnhIMWlGS2RNSEdx?=
 =?utf-8?B?VG9QMUlVVWovUkZ1dEtOL2xzYnBxTHhBTElwVkR0TWtGTVNBM3RIYmk4QWFm?=
 =?utf-8?B?T3BicFlKNzBQeVc3aElxZVEvdzEvbE5WWTR3NXRIQUMwMTdqL0c0NDBtcGds?=
 =?utf-8?B?S2RmR1lZUTRXZ3J3M0d2bjE0YXZvbmlrRnhRcWVUMWZiWUJQM0ZEZ3R3OGpy?=
 =?utf-8?B?Znp6bUNJOW5wUVk5ajhveFBuVml5ejFjUkRYVGd1UUlnalptdURDcUYwTjg2?=
 =?utf-8?B?ZDBPeG9heENOU05KRG5qQzJ3STJPbHloQzB2d2gzeEFPSjNDdStIRGc1Tk1q?=
 =?utf-8?B?b1hhQlEza0l3VnU2Z0RDMWM1KzhvVzlkTVBJRUdhNnZwQ2c2aUNhV1FTUlhu?=
 =?utf-8?B?Ym9icVRLNWZXRXg2dnhqVGsxYWxXRWliYUJKZFlYd2JJRmhHU21jb2h2YWJC?=
 =?utf-8?B?enhCdDE4VE9nQ05XZmE1UFFpZWowOFAxRWtlbnRrSGNPN3d1UnlUeUFwOVVX?=
 =?utf-8?B?cGk4VmxiL0daRS9BUVdUdzVxUU1CYUppaENZZmlhUWpiazI1bnprNlhDN0sw?=
 =?utf-8?B?ams4QVNNWFU5c2tqZyt1ZWFSTUIwUWphak92TXdMb05taWRXTDFCaExmbFBi?=
 =?utf-8?B?ODBrbk92QjI5eWJ1MVRYdlNKWnhmVFozVnZNTHdlLzRXTWFIcmkwTUhQWGpy?=
 =?utf-8?B?SkxUMEhYMlN0Q2Y0N09yN1JCQ3ZLNUYzbUE5ck9UZm5YNk1LNVY4dk9MVHRu?=
 =?utf-8?B?WnZ4dDlrelpSN0dZbXEvc1VQQVNWMnF2THdxeXhFNi9sZCtHWjA4YlZUR3Jy?=
 =?utf-8?B?cGJvVVFHT09rZ3FaUGlNUHI3UmFKcXV4bU5hYXdMZkJGdTJNSlNZQm5PMUs2?=
 =?utf-8?B?QkJFWDBsV2YxYlJ2Ykl6b1BsdEFhMzVYOVhZMng2K3ByVkhFUjBYN3lhWDFW?=
 =?utf-8?B?bkVRVng1RGo5a21jaWV0cmdjNU5KbEJHWWhZWXN0OElOQ096REYxc2hJQWtS?=
 =?utf-8?B?OEF2Tkx4Ti9XK3hxV29jVHZZaUdnaFNIYzFFRHVhZjRuY0x4RVBCeHJZVHhS?=
 =?utf-8?B?VitSd1NaWnJtbjhkTklhRWRua1B0SzBWZk0wRGljdUdMY254OEhhdmZRaG1q?=
 =?utf-8?B?alhnb3VlS3g2QXNsSnpITVdiempJV0lXT05zclBjdDdQWE41eGFqeGR0YURD?=
 =?utf-8?B?SVY2dVVub2JGQ0lTUDA3WmRTL0NTMjN5eEp2MG8xZUwrRWdjanlPNjBOYWZx?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1b3e97-cda0-43e0-ac56-08dad6f5577c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 19:17:25.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqZJ9WwYjs3MVaRmc0U23op2iOkyerBzYOB6lLcRIsg4rHsubluX3aeorljuJM+ClD9YbnK4vjCQ0UlVrYPhOdIwfQWNaBrJS4qwHC7Hwhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/5/2022 11:04 AM, Teres Alexis, Alan Previn wrote:
>
> On Mon, 2022-12-05 at 12:57 -0500, Vivi, Rodrigo wrote:
>> On Fri, Dec 02, 2022 at 03:28:21PM -0800, Alan Previn wrote:
>>>
>>>
> Alan: [snip]
>
>>> @@ -1168,6 +1176,8 @@ static int i915_drm_prepare(struct drm_device *dev)
>>>   {
>>>   	struct drm_i915_private *i915 = to_i915(dev);
>>>   
>>> +	intel_pxp_suspend_prepare(i915->pxp);
>>> +
>>>   	/*
>>>   	 * NB intel_display_suspend() may issue new requests after we've
>>>   	 * ostensibly marked the GPU as ready-to-sleep here. We need to
>>> @@ -1248,6 +1258,8 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
>>>   
>>>   	disable_rpm_wakeref_asserts(rpm);
>>>   
>>> +	intel_pxp_suspend(dev_priv->pxp);
>>> +
>> Before this patch the pxp_suspend was done right after uc_suspend.
>> Right now, the uc_suspend will happen couple lines below.
>>
>>
>>
> Okay - I see this 2nd level flow change but this has no functional change. I have gone through the codes and whether
> intel_pxp_suspend came in after i915_gem_suspend_late or the middle of gt_suspend_late (after us_suspend), it does not
> make any difference. intel_pxp_suspend only disables display-control-events on KCR register and disables CRYPTO-IRQ
> registers. GuC or HuC is only ever doing any PXP related work if it receives workloads via exec-buf (kernel side PXP
> workload subsmission is limited to arb-session creation today OR, in future, teardown-flows at suspend_prepare - this is
> upcoming change in flight). That said, since the GT is already quiesced in suspend_prepare, therefore HuC or GuC should
> be not doing anything inside of i915_suspend_late whether its before i915_gem_suspend_late or before uc_suspend.
>
>
>> If this is okay, why can't we move already the pxp_suspend to the
>> suspend function and need to keep this in the suspend late?
>>
> We can - but i dont see any difference in doing so functionally speaking - i do however prefer minimizing the code flow
> changes to
>
>> Or we don't change the flow at all, or we already fix the unbalanced
>> thing.
>> I believe the first option is better and changing the flow in a
>> separated patch is better.
>>
> Actually, I rather fix the symmetry at the this level: As part of this feature to promote PXP - Gt becomes a dependency
> of PXP. So at init, we ensure GT is init first and then we init PXP. Therefore we should do the opposite for fini -
> ensure PXP fini is done first and the cleanup the GT. That why the move above. But as the global i915 level we are
> keeping it within suspend_late - after everything was quiesced in suspend_prepare.
>
>> Specially because I don't understand if huc has any dependency on
>> the pxp. Maybe that was the original reason why that function end up there
>> at first place.
>>
>> I believe Daniele is the right one to let us know that.
>>
> I spoke to Daniele and he confirmed what i explained above.

Yup, can confirm. Might be worth adding a note to the commit message 
that GT is now considered a soft-dependency of PXP and that the 
suspend_late function calls have been re-ordered accordingly, but that 
this re-order doesn't have any impact apart from code flow because at 
that point in time there can't be any PXP events, so it doesn't really 
matter when we disable the PXP HW (global irqs are off anyway, so even 
if there was a bug that generated spurious event we wouldn't see it and 
we would just clean it up on resume).

I also agree that moving calls between different suspend stages should 
be left to a separate patch.

Daniele

>>>   	i915_gem_suspend_late(dev_priv);
>>>   
>>>
>

