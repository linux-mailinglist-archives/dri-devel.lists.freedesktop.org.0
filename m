Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC6634A58
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 23:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFF289C55;
	Tue, 22 Nov 2022 22:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB65310E487;
 Tue, 22 Nov 2022 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669157923; x=1700693923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LhwUaEspYrqlhaiehoFoEaemN02EXJ+41RKxcioQ3TE=;
 b=W31k7xX1fAK/naH2U+VGppibl/VmtGGh9jquci8nJQECEQisXe0/4Eto
 pGfwyqgME7YhvgqxTShiUqpbnAVCSCmSqB1VznTfx8cXsu7oBxy+gfbwh
 RRskYZpQ1u0CKkLcZq+555073jIdTXGO43gXhq8PhP5FC/RiIPT31j+Ll
 rG+/A5zTLi+JfhWwGmLPT5F006fU0idDFd+IsboMtcdQWrdO7gtH582ih
 sY6J9xkVtktuAamFVGVapfPOnQUjsYvDzFDzZ0Vnr1q6PhoL0KOtbKg3J
 UvNTuVpH9STE4rFm6E05+5EA6RRIsfsWGuGjDN2M3HcCWfjTZOLD+VwYG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315084977"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="315084977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 14:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="784007235"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="784007235"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2022 14:58:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 14:58:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 14:58:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 14:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXj7j7mEaQ6bPSdJj2/JzmX8yNsRRmC694fHQ7YjmwoIbPkcMtyZntxiL3iy5GfDE1z63U2RZqDvQv/bY7/YTtm0gul93MukhZ6PeeUDRtGEJY62m7ng6aO/5b5oj5L4tL55Do8bqIykqDG1NZHcQExr79IlSDl0KUJcG6wSBB0Bs1lMCwkrM0v/4kzlH5GmyF1jAXjbBc8vbDSOowY0gYtq+YuNK5d3kx6ZbKWD7aIoxtO/xwhT+YhOR0K1awaaDKm9iqET5BI7P2gqiWaV/QHRri8zsHNgvYioynkbebizEQ6kLXP53KojTW1KfcCzEP5kzQpkYAiINW0XvvoSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ext6aWteJlLL5Lc+Uh3Mk5JhIa/jOsxEiyfl6xDZ1YA=;
 b=Ct8NSWyM0XKFE+WejJzmJA3tWiGEvIVbiwFtoSgvTBPdWuX3IqJStAzO6wxXsDEg9uNcQRiIa8cDxXTUIhDdESdvOPQ+iXiSbyliXfosjo7BGKtTpqhQi4vcH+0xCbywuTgYBO6j9kNybZwa1X6AMUatzPyfSNyVwzRYuUPUwFEshKu4Ay2ZHEl22b8/Tt9Cz07mn97XWEB2umzz8BY2nbatdAue1oyE+58FvfURvoXklZDz6LiE7tDVVWOegQvEDEgBW1ClnWTWqxrVP04/NfxRLPsVN6lMg0tCh8LGwzyQX7EVMhPJpH1cwgJ55Aa0Rs6uQKuNMZv2h2hiKm+v0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 22:58:40 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 22:58:40 +0000
Message-ID: <d5902614-d056-2ccc-67c2-18233dcecb95@intel.com>
Date: Tue, 22 Nov 2022 14:58:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915/gsc: Disable GSC engine and
 power well if FW is not selected
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-6-daniele.ceraolospurio@intel.com>
 <Y302hgNHNFN0oElo@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y302hgNHNFN0oElo@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: af0d63ba-4045-430e-414c-08daccdd18b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I7TwQUjprygMvVcfe3p/henhXiLNhp14weBQPLeBCn3uaMGepxGiAcfDRv8l/JUpKxIcU3BqOzCd4yEVeN50IMW6TyJEPbp8Ye3d2mzIYlthorWsokzM7sNpsTiJSmQQnzYCzBx9w93CZ63E80WWNmE1gzwVZXMBcCfG4koa4t7uU0wlkYt1dZEy+4i9rfSx5HgW7JyPW2a5XZDANlHealqUxtDwnvmmozqNRY+wLvgod16Diqbl6TUJYyjHn/hi3Yx+w4yelgYFfXBpuRJPRi5mElE2YslAHrHhJfFHaYvG2p6bvC+PMkq+d78dgNh2UNvKf57OBNAgqXm8iq+RF9mT7BS+EG+wLqS5P/5XwpTveYuiY/Inu8PvQW/yTXU3C9+CwL5AKUv4M1/bodBaRaBo6HgDutIP+IebWJunAxZDzbwuZOgQnOIddC/zXYFTP0n4mryzDT5qN/ll4m/W6AujezYAlOI5Xs3yKtH/BFiI16JfTJQ7yKtCU5HOXCgi9hF1P1sb0G36/PUBJK3OYYQ7K6hobcRu5VX3Q0zDxrusBuJY2JGQvkxlYj+Ze86b4mzZHf3UEwzA85m/Y54lzpH2twt5rGzs5SQxiET06DfOymvyic5Q9SKz05AOY0oiUSVZx3yL5gkrGhLAHOlIc0peeDwi34C+uehAwMFhPRd/FJ3WEBo03swIzi0HfbynD6TpCQCxsGFIUbArG51XUzg20Oq1W9jJltaZYV9DRL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(5660300002)(83380400001)(37006003)(82960400001)(6506007)(316002)(450100002)(66476007)(8676002)(41300700001)(4326008)(26005)(6636002)(2616005)(36756003)(66946007)(66556008)(8936002)(6862004)(186003)(53546011)(38100700002)(2906002)(31696002)(86362001)(6512007)(6666004)(31686004)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z29aUyswZkdiZmZGbGdPTEVWK3J4R3lKN0w2dGU0TGJBSVlVNUs4TnFuczNv?=
 =?utf-8?B?ckhGcGJNYldTSndYNGxyVlBrZ0Vob3lXeHBFT2tEZmxCRkFVRTVUcDlTUXBh?=
 =?utf-8?B?cElqOERDb1JoMjhUc1N0MTNBMmVNTFRIOHU5YkxIdmliMXhZRVFZL0EwWGZq?=
 =?utf-8?B?bDhLaitYTnNPa2VWZVZRMGZWTEltM2VLSzV4Zm5QWHByQ0VHS0NkRGRFb1NV?=
 =?utf-8?B?Z2M2Nm9rNHhTTlZxNU95cmw5S1NKd1BWRUNtaDJVd1k4WjE2YkJhMzhDSStz?=
 =?utf-8?B?dlo5RFQ3U25ncUU1T3dUSVZrMjFmOGQxMFpNYjBUL3E5UnNDTXhJdmI2WnVI?=
 =?utf-8?B?M1lMZ0xKdWJsenF5cythZTJJOVowOCtLVnRMdU91SWJ5Y0Qrc2pPSlFEUWUy?=
 =?utf-8?B?OUhJQzJQUFZjcEtQSEY4ZUc0VDNkVFRkb2dvZEZnM3pnRWhUQ0pqZkxxbkpN?=
 =?utf-8?B?OUhlMnFJcUNiRCt5MTh0RHpWSkRjWXBpVTdGQ1VYNEsybWlYcHFwdmtrN3dQ?=
 =?utf-8?B?TVd0ZXd6ZCtCV0V5RjFqams3YnNXaFNnWE1ZRGpwVEkvNTNqVnFiZXlYVExh?=
 =?utf-8?B?S01DM1J5bDFZbVIyck90U2d3dlpEOVdaT0RvUDk5Ry9nSUF4bUVkWjZDMnRE?=
 =?utf-8?B?dDlYRFJOYzY4bW4zU1ZHa3FDNXhLMWlMc0poSGJHcThTeElqKzNGYjlpR2FK?=
 =?utf-8?B?R1c4VnphWlAwamxqRE1LVDZjV1Byd3Z4c2cycmhzTEhzYVhpSGhEVUNJWHNp?=
 =?utf-8?B?NktNK2lJWEMzaDdzc05lSWNrUG9naVdieHNMOUN1ZTdSanRpRTF4Y1I5N2dt?=
 =?utf-8?B?TFNMMEdab3dYaXF2ZWZzVFlVbGdyanFTZ2ErUER6b3I5Nk1LUHdiVTFxZUds?=
 =?utf-8?B?U1BBRVhmRGYzVDRwNytiU3R3UnYyRTBzM0FzcDViSDhRVUZmdTdnZUJMOWFN?=
 =?utf-8?B?aGdFcktaaHBsNWlId2FPZU5YNTBOUmJyNXZrU093aGN4SFM0ejhMSW1vYmN5?=
 =?utf-8?B?aHF3ZXFKZVNkOUEyTE1FaHNBbUJEVUtmdCtQNHBVeWVBUlF2QXlFZUhSN1ZN?=
 =?utf-8?B?YmlrdWdWWlU4T0t3Z3F0SGRod1RQTUJvMDJucDFqcnFwUmxocHZKcWM2RThN?=
 =?utf-8?B?Rk43TzBZYVJnUGhZM2pPTnZSeEpUMDRyWFB3NGRQTnh4aTFrSThQdHlEV1Iz?=
 =?utf-8?B?Y2M3bGxXNGlHM2lXVGdEdDltZlUwTi85TUtOdGN5Wi96U05WSFp2WlQ4b2ND?=
 =?utf-8?B?WFdDMzRnNUpzMkNPM1hPem9vZHVSUU5vK1pPbnlQaFpnbk1leG5ZTGNKSkIz?=
 =?utf-8?B?Z2ZsZi9NeG4xQTFubDB6dGFtTEkrU2RVcHZqNVBaR0Fha3BrR2JYeDRobjlz?=
 =?utf-8?B?U05wOWljRVFsQlA5OWFJZHM2RVA0dDA2Q0pxazVrdTREbnZROGJUelkvSFNG?=
 =?utf-8?B?OE1yMU1hUnNQMnFMenYzcU95ZlNFOGVwblEzWkxjeEhmWW9EM0prdThxZ29n?=
 =?utf-8?B?QnZMSEh2dXFaUFlrYmFkUVNmeWtUZ3I2emNVb3hZaFM0SFpIZUJIUXdFQ05Q?=
 =?utf-8?B?UVZwVnd1d1Q5VENxSXV4d3d0SGkxQjdxdkV2Sm5USVdFOVlXNkFQZGgxZThp?=
 =?utf-8?B?REVjRUI0M0tHMmJmcmM3dVkxaXJrdEZTd08zMHp3NXMrc3BsR0FuUTNkYk9V?=
 =?utf-8?B?MVBHdGdBbVo5Q0VGRW1GKytETDFzMmRBd0RKTXl0UDRiUlFBOWw5YzRtVWFK?=
 =?utf-8?B?SEovaGxoVnZ3dE9mbE1rK2ZVd2FHRzlSODA3U3hiQ045ckI4WmFDQzFsVWIw?=
 =?utf-8?B?MUYraUVFcWhjdUZJZWEwVzhVWXkyWFEydlRIUlArbllpNmx4OXU1VHpsYTlO?=
 =?utf-8?B?dGM0QUErT0laNkx0VXV6ZmZNVUdNbm1USURpbEdMZXlOQ3ZOZXc3c2d3dGRz?=
 =?utf-8?B?NERWaHdDbzlzb0FFMzBGYWYvTEpheWcwbG02ODBmMS9kQU9US0k3L1Z1VHF4?=
 =?utf-8?B?bU10b05GREpyQlk4ekJjVTlIb080U0NZdDFvcTlhMWx0bENySzZwNlRNQmFk?=
 =?utf-8?B?bHNzai84UGYrUmQ3RFJ1ZjFtY3JEWXQrNGN2OUVwbk9JYWpyS21zdlIzdXd3?=
 =?utf-8?B?aE1mTzBvWWkzZXFCMllFSTUwL0d1cHpwVnhHWi9EZXAxeTEveEVpd1EvN3pv?=
 =?utf-8?Q?opfnM5dlCK3m6FVYb48L4N4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af0d63ba-4045-430e-414c-08daccdd18b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 22:58:40.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ripwDdgVn2K+mW/KlhCJMIcEDLoqCc7BafJc3llTWQqQyxrO7khjH9LiRNaG/+M7hwLv2QoKMSSMmdwL7p8uUmnsMHX+vru4En39zerWycQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 12:52 PM, Rodrigo Vivi wrote:
> On Mon, Nov 21, 2022 at 03:16:16PM -0800, Daniele Ceraolo Spurio wrote:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> The GSC CS is only used for communicating with the GSC FW, so no need to
>> initialize it if we're not going to use the FW. If we're not using
>> neither the engine nor the microcontoller, then we can also disable the
>> power well.
>>
>> IMPORTANT: lack of GSC FW breaks media C6 due to opposing requirements
>> between CS setup and forcewake idleness. See in-code comment for detail.
>>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John C Harrison <John.C.Harrison@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/i915/intel_uncore.c       |  3 +++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index c33e0d72d670..99c4b866addd 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -894,6 +894,24 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>>   	engine_mask_apply_compute_fuses(gt);
>>   	engine_mask_apply_copy_fuses(gt);
>>   
>> +	/*
>> +	 * The only use of the GSC CS is to load and communicate with the GSC
>> +	 * FW, so we have no use for it if we don't have the FW.
>> +	 *
>> +	 * IMPORTANT: in cases where we don't have the GSC FW, we have a
>> +	 * catch-22 situation that breaks media C6 due to 2 requirements:
>> +	 * 1) once turned on, the GSC power well will not go to sleep unless the
>> +	 *    GSC FW is loaded.
>> +	 * 2) to enable idling (which is required for media C6) we need to
>> +	 *    initialize the IDLE_MSG register for the GSC CS and do at least 1
>> +	 *    submission, which will wake up the GSC power well.
>> +	 */
>> +	if (__HAS_ENGINE(info->engine_mask, GSC0) && !intel_uc_wants_gsc_uc(&gt->uc)) {
>> +		drm_notice(&gt->i915->drm,
>> +			   "No GSC FW selected, disabling GSC CS and media C6\n");
>> +		info->engine_mask &= ~BIT(GSC0);
>> +	}
>> +
>>   	return info->engine_mask;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>> index c1befa33ff59..e63d957b59eb 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -2701,6 +2701,9 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>>   		if (fw_domains & BIT(domain_id))
>>   			fw_domain_fini(uncore, domain_id);
>>   	}
>> +
>> +	if ((fw_domains & BIT(FW_DOMAIN_ID_GSC)) && !HAS_ENGINE(gt, GSC0))
>> +		fw_domain_fini(uncore, FW_DOMAIN_ID_GSC);
> On a quick glace I was asking "why do you need this since it doesn't have the gsc0?
> Then I remember that fw_domain got initialized and it will be skipped, right?
> Then I though about at least have a comment here, but finally I got myself wondering
> why we don't do this already in the if above, while we are cleaning the engine mask?

I've followed the existing code flows that we have in place for fused 
off VCS/VECS. Basically the existing code goes like this:

1) All FW domains for the platform are initialized
2) We read the fuses and adjust the engine mask accordingly
3) We go back and prune the FW domains that are not applicable anymore 
due to the updated mask.

The idea is to have a single gt-level function doing all the mask 
adjusting and an uncore-level one doing all the domain pruning. I'm not 
against changing this approach, but in that case we should update the 
behavior for VCS/VECS as well (which might be complicated, because 
VCS/VECS engines share FW domains, so the pruning logic is ugly).

Daniele

>
>>   }
>>   
>>   static void driver_flr(struct intel_uncore *uncore)
>> -- 
>> 2.37.3
>>

