Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5863B9A8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 07:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F91D10E364;
	Tue, 29 Nov 2022 06:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8B8825B;
 Tue, 29 Nov 2022 06:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669701831; x=1701237831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i2dJjqzNjZ7a0SqgmahWEbAxtXxFtguH+2JofTFadmo=;
 b=J6JPf6n8kvhLCqUlJyN47kKi9qxgg6IDLvA/4oPlZAjsttPjRLaJHs9s
 8GFxMT0B0gSIhZSd3avxyyTJJ3lFW+51IGjz2VpTuGEih5k8Lb0cRICLv
 vmQtoF2GYQNOgD5EUsEcJI3GOeVVItm1B0kSweyIufQhYGJgCipU3eOss
 DhG67IiIcW6HxQ0WZ6lXiGpNbVNMNU06nq+YXFF/iJIQQ+OoZJ5T+VgtN
 3Em58VbVzpD2iMaTfET5x55qoLOyLE1ns9qdZSJyPX/T5UWv9qNdQpNx3
 VbpiMTEJ0xUEbxbKbRN/7TEPa0FbuL+++BjYR9SLuB4VNe/BwSUIyzYLb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="298381215"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="298381215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 22:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="768314256"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="768314256"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2022 22:03:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 22:03:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 22:03:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 22:03:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caIMJamWwenFfQGrxT/i35QRxpdUrMx/wnWcRZpDzKA47H4qKRCt9vgUP1CSCE3fnx6Hg12aI6qn6WDdJaTBY9wnbipbt4DAQxVaPMTKgi4iBpmn43SLfwYv2i9cAzGonPzc8IwyAZ4ihgXW33KfVa9O9m11TQbM+04Gsr7C0wVjvWTM47Q8Y0qEfpczomw5onj/bh+pkmCCLPcDXep8bn86buqC70xlZhQrYRbJWTz/PnGHZWeB1wByCwVeOCnh4NpaOGSzydhjL0O7S1Yl+vueP3jxX1QW7SvKTZ7cmhoEnAotydCGiacQXE2l9IPZX7fnzdJyofpuux9Yb0LgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRadgW3xayBTkgnyFem4lTRRpMaHq3GvR5zIBB9jI2c=;
 b=ftZTqYAHTIoI+ld2hYZoi34sTMhX2G2lf8YkY3Q6WlEFZ3PvE31HxxOsqMI2LKwLepGx8SdbZ2xq3rICy0eWavapHNaOjacDUHT/RZLwokjFjkagjhRb97ld31r2VHBZEFQQR5TN5xl122UJtsMyK9YEboGCLqSBnNRsjXOD1cohBCmelmKhIRmiXM+TPdeQnP9arY3ai5YZMqxIKtC210lVDKYiePG8hdsGTPHcFxVjTxMHyLNXmXQz6B0zrA0HaPXGbPFO05uAU6FwTJh6czQyaCyPRXTFDwYmt6ToLMHyaxfRwFio1kk4ooqbeAHfucnjvF8Yd4Uqo1vlG5FmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 06:03:25 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd%8]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 06:03:25 +0000
Message-ID: <ebb5b596-6e87-9782-8127-2eaf517c0359@intel.com>
Date: Tue, 29 Nov 2022 11:33:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/mtl: Media GT and Render GT share
 common GGTT
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
 <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
 <a6f3f20a-3d03-acce-965a-604a43639d0d@intel.com>
 <20221129055428.r3we3kkjettlwyc6@ldmartin-desk2.lan>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20221129055428.r3we3kkjettlwyc6@ldmartin-desk2.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM8PR11MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9418c13f-210c-4e99-cbfa-08dad1cf6cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyvWpDFbkkl8wp7qK7V2Rj789LHzXVfd/97FqSNHG88RRvge4ELPKFCH/tx8gL4aIrbDpWPpesAqRXzXkoAqUL4873qqaiqSe+ElFjWQftlck+tTf8d722g5wS26cOzXD1rnXOC90N2v0jj46M51JVhiEtDhXhmB5tw3GGmJq3doa3hKm60WG8YUgXyoP0OZMwIZkfdNhMiS44BbfDPd3oRHmAHRhdvEOdceszwVEmEvWVqTxq8pd7lj8nQPjr7oJ1EAIa1UmGUK7dk1WY+W6RdnvTuFOxESytLT13J5Pb0aR+yyj6Alv2eU1lINfTRR26eqpVLuTaGjb/p4aVR2dRvsdFRAwhUKjboBiFIrwyk3vj7CdRhESSyN1bciZOsdbfN8kDFlY71FyNC40qTeC5pLjOtZtT6nWmnbe75WfkAu3+ZIF9LcO3js/+hSjp8riWVu8Bu0ApquDPBsWtCcOiniG+4NQZye7hULq+aZktuHEtzCRHlfYN/7DKvetcSYefPAqR6GF944bqjCexMEORWWiTE2e9/XZjt6QKy9SQj3/ITJlPjAQ3XzeOhLiI0Pyv1tFix8Ma0ACqFzgE+XRDm3T60Hzgx73Vlp+4XvtNwYpg+HGtslfeG5Hm1BG6Xg/6rRUegszs/mctw6hgxyHNUUblAVIXnuaU427wT2rUY8ifNHZK65spdEgbED0I/0m1ns3LH0mS6m8JOboa2GaP/K8d7hcbMGZgFcE2FdEBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(31696002)(6506007)(86362001)(53546011)(31686004)(26005)(8676002)(450100002)(66476007)(6512007)(6862004)(8936002)(41300700001)(66556008)(2616005)(6486002)(478600001)(6666004)(66946007)(37006003)(316002)(5660300002)(82960400001)(30864003)(38100700002)(4326008)(2906002)(83380400001)(186003)(6636002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNhUDRUU2NMa2RRdzNobC9NUnRrRWZTRkxQRm05STBQejdEL2czS2tKanlR?=
 =?utf-8?B?WloxTXJIcFFqMUdGQVNsNUJzcFhMNWUxVysreVF3NElkY2kycHJZQ0c2T0h4?=
 =?utf-8?B?bGJKNy80KzY4bURIVWRnZnZvUEx0SWxOcitIS3N2T21oZkpFUkZ1cTEwR2Rm?=
 =?utf-8?B?Zk5jNjVCYnNRRkUxZ3JaVlZOeXVETFZNbExFbkFyYlZVYytSUDJKbXNoT1VE?=
 =?utf-8?B?TGJlYkdadWVoZU43RjZHNVVWOXFuSWVjQk9VUGV6d25sSmhraGhGcmY0UnA3?=
 =?utf-8?B?a1gyZCs3ZlpWbEZkRHk3T1drMzFBd1NuVzlUOVF5azY5eW5oOHQ5TmhyTVk3?=
 =?utf-8?B?K01oU00rQ09JYU9YcWJxS00vUDIrRlFCUkEyd1F0cjVqMzFxMFpKSzR5VmMw?=
 =?utf-8?B?L1VSeG80cUtFOHIzdDZPclhEVWRVRzZ4Y1poSW9ZdXVzNHdmWVJCbVhBcjVt?=
 =?utf-8?B?bkY0NDV0ZkxpeHc0ZW9YSnNuaDl3dVhWRTExTnhFejhrVXpSbHFzRmFicHN6?=
 =?utf-8?B?Q2VoR0Z5YmtmenZ4RXNnK1B0WkEvbEdOVzc5MDkxbzJvK2RHRkUxZnRkRnhx?=
 =?utf-8?B?Nyt6NHNZWGp0VkR1VlFWSlBoeEZYNVVCSHNCUE4yc0FCZzVtSCtkMW9TOGRT?=
 =?utf-8?B?UjhRcW1TWHIxMDlibHo2cUJSdEovdlJDV2RNbHhBN2xsZWptbEt5N3hud0dN?=
 =?utf-8?B?aTRGMGR2OTdldGNBVFlTTWRFcEVvcHdqOWpTWHJtNDVVOHpTVmRreFdLSkFw?=
 =?utf-8?B?REIvNW12eGM0TGRSdHlOWitpKy9UeHJWSFBZOE1wRFJxeUFDRzhUNVQ0U29r?=
 =?utf-8?B?em5iR29LTG95UlVPVzBqY0orWEZOUmVPZHdwQlF1bXExYnIzcjRPYnVmNjNh?=
 =?utf-8?B?dmlDOVJYZ2RrWVRZN3VpbzZDU0RydE44NG85SVRjOWh3RWRkbVlnZExrWjVu?=
 =?utf-8?B?cmVHL3NFcmVoMlM4WGFuMUNSeDFRSzgwU0lPV3FzQ0kxTi9DTFJSS2ZMdEE0?=
 =?utf-8?B?MG9RUWNvUm4ybTJNeUdvN3g2UFZLdkV5REZHRjdLbDlHdzU5UWI2WVNEQ2d6?=
 =?utf-8?B?RDliS0JaaWFPNkQ1Z1MzVWlzdGNLaWNGcE1NR0xWUkNHVDREa2xWbFQ1QWlD?=
 =?utf-8?B?ZEUvaXBWSG9Dd3gzcHBmODJ6UGJ6eW1UOFFrUzF3aXRHWkQyUm0xeW9uYlhL?=
 =?utf-8?B?NzE1cmQ1NVpFd1BoZURhTER4My9qL0thZHFWNXpGalFlL2g4MTNtRnZxeHhr?=
 =?utf-8?B?S0VBV2ZHUm9QMm1XM0lyMnBCMDlMaElodXhFWGxzQm4zWG1oT2lPN2V1d2cw?=
 =?utf-8?B?WEhOYWVaTmxHcHhWNzd4U2laVHdmbGxBVkpobE1tM0FYMndTTUFDQjFqN1VE?=
 =?utf-8?B?OXVDYk9xRnhwNmN6cmpxZVJxK29jcUI2aEVHR09hcW9ONjdGcmlBaktOTC8w?=
 =?utf-8?B?WTlRM1BKbUdRVW1QZDdqRERXYXY0VW5tVnlqTnNLUFZMYnNzenh0VnVweks0?=
 =?utf-8?B?TDZGNWJOT2l4eEFkMlJhUEJuTktUTXFyUDd0MFNQMm5pb1BlK210d2J3Q3Vz?=
 =?utf-8?B?MlN6Wkh2Q1FFS0dldnczdnQyb1htWkZSZkYwQTJ6ejlQRkY1NU9uQWhvaWEx?=
 =?utf-8?B?VkdRNUREaTJrUWRPejkwakVoVWhhM0dEaVNKdlE2ejdmU0kzSWdkK2F0YVc4?=
 =?utf-8?B?YjZVVUNTQmxpUlFYVHRVN1pwTlVBZlNac0dleWo0S1liTUJzbVZZRCtDVjM3?=
 =?utf-8?B?Ui83Y05zYnVBdTRxL2E4bEo4TDdsNmdXd0NuU3dxVndaVWFaYTVVWCszK21h?=
 =?utf-8?B?NEFBamFGcmJuSWkzZ1hBVzFobG1PODZGM1pNL0o2bkgvSU9PcUJqYXliSGVK?=
 =?utf-8?B?OGFMWXFsaEFuV0ZkZnkzYTE1azAxNm82NW11ZE8zdnBjMmlPS1Y0b1ZzeEhy?=
 =?utf-8?B?cmwwejlMbW1lZ0c5bENPR0U3eGErcEJiVlJDNktzR2lMZUxXLzF3Wi9sK1Fw?=
 =?utf-8?B?eElOQ1k2eWNTN3ZXZDlCRy9vS3lxUno3THN4MEszTDBqT2pteFVHekI2eVEw?=
 =?utf-8?B?UFBhYy9wbXdSWDFNVGwvY2svK0V6cGhUOExCaFovbWFDbHdSandzMjhUeThi?=
 =?utf-8?B?dzgvYjRNZmVhSERKYjMrN3FNZnNSQmRyWnpwWjBtbnFJSlppU3ViNXdLTlBG?=
 =?utf-8?Q?+dai0lMH5z1Z5SAufZJ2NiU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9418c13f-210c-4e99-cbfa-08dad1cf6cfa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 06:03:25.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8Jm4z5I5cB6oZIO1IGpCVncFNBoZDy02nq/sCQC9odCWyICTbFZX5LUac/1/EPeYon3rYj6ei3Sr2bCrEW3KqTgn1k7BN8nE9Jb1anMaTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
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



On 29-11-2022 11:24, Lucas De Marchi wrote:
> On Wed, Nov 23, 2022 at 09:47:03AM +0530, Iddamsetty, Aravind wrote:
>>
>>
>> On 23-11-2022 05:29, Matt Roper wrote:
>>> On Tue, Nov 22, 2022 at 12:31:26PM +0530, Aravind Iddamsetty wrote:
>>>> On XE_LPM+ platforms the media engines are carved out into a separate
>>>> GT but have a common GGTMMADR address range which essentially makes
>>>> the GGTT address space to be shared between media and render GT. As a
>>>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>>>> similarly any operation on GGTT requiring an action on a GT will
>>>> have to
>>>> involve all GTs sharing it. setup_private_pat was being done on a per
>>>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>>>> based.
>>>>
>>>> BSPEC: 63834
>>>>
>>>> v2:
>>>> 1. Add details to commit msg
>>>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>>>> by Lucas
>>>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>>>> it.
>>>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>>>
>>>> v3:
>>>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>>>
>>>> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
>>>> (Matt Roper)
>>>>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>
>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> Thanks Matt, could you also help with merging the change.
>>
>> Regards,
>> Aravind.
>>>
>>>> ---
>>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>>>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>>>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>>>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>>>  9 files changed, 111 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> index 8145851ad23d..7644738b9cdb 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>>> @@ -8,6 +8,7 @@
>>>>  #include <linux/types.h>
>>>>  #include <linux/stop_machine.h>
>>>>
>>>> +#include <drm/drm_managed.h>
>>>>  #include <drm/i915_drm.h>
>>>>  #include <drm/intel-gtt.h>
>>>>
>>>> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct
>>>> i915_address_space *vm)
>>>>
>>>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>>>  {
>>>> +    struct intel_gt *gt;
>>>> +
>>>>      i915_ggtt_suspend_vm(&ggtt->vm);
>>>>      ggtt->invalidate(ggtt);
>>>>
>>>> -    intel_gt_check_and_clear_faults(ggtt->vm.gt);
>>>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +        intel_gt_check_and_clear_faults(gt);
>>>>  }
>>>>
>>>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct
>>>> i915_ggtt *ggtt)
>>>>
>>>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>>>  {
>>>> -    struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>>      struct drm_i915_private *i915 = ggtt->vm.i915;
>>>>
>>>>      gen8_ggtt_invalidate(ggtt);
>>>>
>>>> -    if (GRAPHICS_VER(i915) >= 12)
>>>> -        intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>>>> -                      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>>> -    else
>>>> -        intel_uncore_write_fw(uncore, GEN8_GTCR,
>>>> GEN8_GTCR_INVALIDATE);
>>>> +    if (GRAPHICS_VER(i915) >= 12) {
>>>> +        struct intel_gt *gt;
>>>> +
>>>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +            intel_uncore_write_fw(gt->uncore,
>>>> +                          GEN12_GUC_TLB_INV_CR,
>>>> +                          GEN12_GUC_TLB_INV_CR_INVALIDATE);
>>>> +    } else {
>>>> +        intel_uncore_write_fw(ggtt->vm.gt->uncore,
>>>> +                      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>>>> +    }
>>>>  }
>>>>
>>>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>>>
>>>>      ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>>>
>>>> -    setup_private_pat(ggtt->vm.gt);
>>>> -
>>>>      return ggtt_probe_common(ggtt, size);
>>>>  }
>>>>
>>>> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt
>>>> *ggtt, struct intel_gt *gt)
>>>>   */
>>>>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>>>  {
>>>> -    int ret;
>>>> +    struct intel_gt *gt;
>>>> +    int ret, i;
>>>> +
>>>> +    for_each_gt(gt, i915, i) {
>>>> +        ret = intel_gt_assign_ggtt(gt);
> 
> in v3 the intel_gt_assign_ggtt() call is not in i915_driver.c anymore but
> rather moved here. We could make i915_ggtt_create() static, doing the
> allocation here and intel_gt_assign_ggtt() would be in charge of just
> assigning the ggtt. Not very important though and can be done later.

well we call intel_gt_assign_ggtt in i915_gem_gtt_mock_selftests but not
i915_ggtt_probe_hw.

> 
> pushed, thanks

Thanks a lot for the help.

Regards,
Aravind.
> 
> Lucas De Marchi
> 
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>>
>>>>      ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>>>>      if (ret)
>>>> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct
>>>> drm_i915_private *i915)
>>>>      return 0;
>>>>  }
>>>>
>>>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
>>>> +{
>>>> +    struct i915_ggtt *ggtt;
>>>> +
>>>> +    ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
>>>> +    if (!ggtt)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    INIT_LIST_HEAD(&ggtt->gt_list);
>>>> +
>>>> +    return ggtt;
>>>> +}
>>>> +
>>>>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>>>>  {
>>>>      if (GRAPHICS_VER(i915) < 6)
>>>> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct
>>>> i915_address_space *vm)
>>>>
>>>>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>>>  {
>>>> +    struct intel_gt *gt;
>>>>      bool flush;
>>>>
>>>> -    intel_gt_check_and_clear_faults(ggtt->vm.gt);
>>>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +        intel_gt_check_and_clear_faults(gt);
>>>>
>>>>      flush = i915_ggtt_resume_vm(&ggtt->vm);
>>>>
>>>> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>>>      if (flush)
>>>>          wbinvd_on_all_cpus();
>>>>
>>>> -    if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>>>> -        setup_private_pat(ggtt->vm.gt);
>>>> -
>>>>      intel_ggtt_restore_fences(ggtt);
>>>>  }
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> index b5ad9caa5537..b03788d7674e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt
>>>> *gt)
>>>>
>>>>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>>>>  {
>>>> -    gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt),
>>>> GFP_KERNEL);
>>>> +    /* Media GT shares primary GT's GGTT */
>>>> +    if (gt->type == GT_MEDIA) {
>>>> +        gt->ggtt = to_gt(gt->i915)->ggtt;
>>>> +    } else {
>>>> +        gt->ggtt = i915_ggtt_create(gt->i915);
>>>> +        if (IS_ERR(gt->ggtt))
>>>> +            return PTR_ERR(gt->ggtt);
>>>> +    }
>>>>
>>>> -    return gt->ggtt ? 0 : -ENOMEM;
>>>> +    list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>>>> +
>>>> +    return 0;
>>>>  }
>>>>
>>>>  int intel_gt_init_mmio(struct intel_gt *gt)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> index c1d9cd255e06..8d915640914b 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>>> @@ -277,6 +277,9 @@ struct intel_gt {
>>>>      struct kobject *sysfs_defaults;
>>>>
>>>>      struct i915_perf_gt perf;
>>>> +
>>>> +    /** link: &ggtt.gt_list */
>>>> +    struct list_head ggtt_link;
>>>>  };
>>>>
>>>>  struct intel_gt_definition {
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> index 4d75ba4bb41d..d1900fec6cd1 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>>>      struct mutex error_mutex;
>>>>      struct drm_mm_node error_capture;
>>>>      struct drm_mm_node uc_fw;
>>>> +
>>>> +    /** List of GTs mapping this GGTT */
>>>> +    struct list_head gt_list;
>>>>  };
>>>>
>>>>  struct i915_ppgtt {
>>>> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>>>>  int i915_init_ggtt(struct drm_i915_private *i915);
>>>>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>>>>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>>>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>>>>
>>>>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt
>>>> *ggtt)
>>>>  {
>>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c
>>>> b/drivers/gpu/drm/i915/i915_driver.c
>>>> index 69103ae37779..4e1bb3c23c63 100644
>>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>>> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct
>>>> drm_i915_private *dev_priv)
>>>>
>>>>      i915_perf_init(dev_priv);
>>>>
>>>> -    ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>>>> -    if (ret)
>>>> -        goto err_perf;
>>>> -
>>>>      ret = i915_ggtt_probe_hw(dev_priv);
>>>>      if (ret)
>>>>          goto err_perf;
>>>> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct
>>>> drm_i915_private *i915,
>>>>  static int i915_drm_resume(struct drm_device *dev)
>>>>  {
>>>>      struct drm_i915_private *dev_priv = to_i915(dev);
>>>> -    int ret;
>>>> +    struct intel_gt *gt;
>>>> +    int ret, i;
>>>>
>>>>      disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>>>
>>>> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device
>>>> *dev)
>>>>          drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>>>
>>>>      i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>>>> +
>>>> +    for_each_gt(gt, dev_priv, i)
>>>> +        if (GRAPHICS_VER(gt->i915) >= 8)
>>>> +            setup_private_pat(gt);
>>>> +
>>>>      /* Must be called after GGTT is resumed. */
>>>>      intel_dpt_resume(dev_priv);
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c
>>>> b/drivers/gpu/drm/i915/i915_gem.c
>>>> index 8468ca9885fd..086c4702e1bf 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>>> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private
>>>> *dev_priv)
>>>>      for_each_gt(gt, dev_priv, i) {
>>>>          intel_uc_fetch_firmwares(&gt->uc);
>>>>          intel_wopcm_init(&gt->wopcm);
>>>> +        if (GRAPHICS_VER(dev_priv) >= 8)
>>>> +            setup_private_pat(gt);
>>>>      }
>>>>
>>>>      ret = i915_init_ggtt(dev_priv);
>>>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c
>>>> b/drivers/gpu/drm/i915/i915_gem_evict.c
>>>> index f025ee4fa526..4cfe36b0366b 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>>>> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>>>>      return !kref_read(&vma->obj->base.refcount);
>>>>  }
>>>>
>>>> -static int ggtt_flush(struct intel_gt *gt)
>>>> +static int ggtt_flush(struct i915_address_space *vm)
>>>>  {
>>>> -    /*
>>>> -     * Not everything in the GGTT is tracked via vma (otherwise we
>>>> -     * could evict as required with minimal stalling) so we are forced
>>>> -     * to idle the GPU and explicitly retire outstanding requests in
>>>> -     * the hopes that we can then remove contexts and the like only
>>>> -     * bound by their active reference.
>>>> -     */
>>>> -    return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>> +    struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>>> +    struct intel_gt *gt;
>>>> +    int ret = 0;
>>>> +
>>>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>>>> +        /*
>>>> +         * Not everything in the GGTT is tracked via vma (otherwise we
>>>> +         * could evict as required with minimal stalling) so we are
>>>> forced
>>>> +         * to idle the GPU and explicitly retire outstanding
>>>> requests in
>>>> +         * the hopes that we can then remove contexts and the like
>>>> only
>>>> +         * bound by their active reference.
>>>> +         */
>>>> +        ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +    return ret;
>>>>  }
>>>>
>>>>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>>>> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct
>>>> i915_address_space *vm,
>>>>      struct drm_mm_node *node;
>>>>      enum drm_mm_insert_mode mode;
>>>>      struct i915_vma *active;
>>>> +    struct intel_gt *gt;
>>>>      int ret;
>>>>
>>>>      lockdep_assert_held(&vm->mutex);
>>>> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct
>>>> i915_address_space *vm,
>>>>                      min_size, alignment, color,
>>>>                      start, end, mode);
>>>>
>>>> -    intel_gt_retire_requests(vm->gt);
>>>> +    if (i915_is_ggtt(vm)) {
>>>> +        struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>>> +
>>>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +            intel_gt_retire_requests(gt);
>>>> +    } else {
>>>> +        intel_gt_retire_requests(vm->gt);
>>>> +    }
>>>>
>>>>  search_again:
>>>>      active = NULL;
>>>> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct
>>>> i915_address_space *vm,
>>>>      if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>>>          return -EBUSY;
>>>>
>>>> -    ret = ggtt_flush(vm->gt);
>>>> +    ret = ggtt_flush(vm);
>>>>      if (ret)
>>>>          return ret;
>>>>
>>>> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct
>>>> i915_address_space *vm,
>>>>       * a stray pin (preventing eviction) that can only be resolved by
>>>>       * retiring.
>>>>       */
>>>> -    intel_gt_retire_requests(vm->gt);
>>>> +    if (i915_is_ggtt(vm)) {
>>>> +        struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>>> +        struct intel_gt *gt;
>>>> +
>>>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +            intel_gt_retire_requests(gt);
>>>> +    } else {
>>>> +        intel_gt_retire_requests(vm->gt);
>>>> +    }
>>>>
>>>>      if (i915_vm_has_cache_coloring(vm)) {
>>>>          /* Expand search to cover neighbouring guard pages (or
>>>> lack!) */
>>>> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space
>>>> *vm, struct i915_gem_ww_ctx *ww)
>>>>       * switch otherwise is ineffective.
>>>>       */
>>>>      if (i915_is_ggtt(vm)) {
>>>> -        ret = ggtt_flush(vm->gt);
>>>> +        ret = ggtt_flush(vm);
>>>>          if (ret)
>>>>              return ret;
>>>>      }
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c
>>>> b/drivers/gpu/drm/i915/i915_vma.c
>>>> index 703fee6b5f75..726705b10637 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma
>>>> *vma, struct i915_gem_ww_ctx *ww,
>>>>                 u32 align, unsigned int flags)
>>>>  {
>>>>      struct i915_address_space *vm = vma->vm;
>>>> +    struct intel_gt *gt;
>>>> +    struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>>>      int err;
>>>>
>>>>      do {
>>>> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma
>>>> *vma, struct i915_gem_ww_ctx *ww,
>>>>          }
>>>>
>>>>          /* Unlike i915_vma_pin, we don't take no for an answer! */
>>>> -        flush_idle_contexts(vm->gt);
>>>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>>>> +            flush_idle_contexts(gt);
>>>>          if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>>>              /*
>>>>               * We pass NULL ww here, as we don't want to unbind
>>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c
>>>> b/drivers/gpu/drm/i915/selftests/i915_gem.c
>>>> index e5dd82e7e480..2535b9684bd1 100644
>>>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>>>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>>>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct
>>>> drm_i915_private *i915)
>>>>       */
>>>>      with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>>          i915_ggtt_resume(to_gt(i915)->ggtt);
>>>> +        if (GRAPHICS_VER(i915) >= 8)
>>>> +            setup_private_pat(to_gt(i915));
>>>>          i915_gem_resume(i915);
>>>>      }
>>>>  }
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
