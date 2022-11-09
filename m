Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6605622A54
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3ED10E59C;
	Wed,  9 Nov 2022 11:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E810E59C;
 Wed,  9 Nov 2022 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667992956; x=1699528956;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rq04mNJCg0lcSWM1BRF0wfC0/7TqLK0DA7sNxgjc7Aw=;
 b=dE3Ku6BMh+NsxBqqX48Byvrnru24QHyxYKapSET4PKOTR3tYQ965UMk3
 gvoo+jzFK2CAxhkhsSogKaDOGCSXY5Eh2hQCkFzSlwazE+EaBhvKdLmf1
 bpkjLitGgKe5oIhRLxPHloXCoPznIhaERZ00/bsEjsBBgJUsec789lUtV
 5AFBlA7/YB3o7Pmp8l9NWEr16dos5FLUujdqKap0DNngG6lgZLrvc91wG
 xwR5l9vvZLR0nOgTUFZg8by7Ru/yCLuBv8SL36Qp/Dmwedv4olycWrFB9
 W0z1bBV2P62pf9kmlusvDxnc6B/fNmgXRe35L8eY7x9vf5chHEmxroPFj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="308572437"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="308572437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 03:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="705681370"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="705681370"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2022 03:22:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 03:22:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 03:22:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 03:22:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO/GvjuFzxfxOBF9RK5qQQawyJxUgblm/N/vB5VQ8tdOR1G9T6eF7B+RWGJz1dIyG2fsD11S+L4Trhk97tcjUHL/NT14iWkZsRhzv8KpTysOe/lJfe8LiyDHdu3H+sh68OWM3cuF/xVx+jLyvHvbP3iNIpNVJFKFFdKrn8hNcsyAB73qg7J3XGqNCYvPxEzEEaMmDrCDAwc7P1VD14oV5D3H+lWQP0TvlG6O3BcoEHR0mIYaY9n7YMIeugaR5hkUfLOWmuG0y4FsFJ2RHqvg6+Q+dFtNtkWUB64osbChqvi9q6RB0khvtU2PmzouTQ1KM4u2DetAYznFBqjXwaN+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQuYUcFVzvC9wYA3CZhmAIR6j9LAM7DdGfOh15bN/6Y=;
 b=McNMoGegB+L7r843pK6SKlv/nWe6RP4h2qiG2pzWLyY2FDTY2duGF+lt3085jwetE4SAetBlCAWjInDnSjpsHvPjL2XkEfpLSlVIdvfBq8JJ9viJ0My8WxXL5vwacQzEyDS8KRr+NUZsX3+khOacQyrw7Hp0Nqi7qe6ignRZDdy9Y8e5Rt/8qB5xO5nana0kt4Wq3TKkw0Hv+bAa6fnCTg2DzSoUm/anOsAW26zkIgavZlDr/SMcKyHMJOK7VsgAqBzbn+X5iw10Okrtf8yCHy4sxFVrgNHj5SdcuM+KN8s/bescrZnBxgqW7RkhLBAKPX9Hu2Ti+4METNoiZ2NQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 11:22:32 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 11:22:32 +0000
Message-ID: <023d4f19-499f-5274-38b1-baa977b7a819@intel.com>
Date: Wed, 9 Nov 2022 16:52:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/i915/mtl: Media GT and Render GT share common GGTT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
 <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <Y2AJ6yybXsknyUcH@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2a7194-1b07-4386-7a4e-08dac244b193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXvkC9ELnYD5otI+kcM1he/6bjmJ/qX7JOJ2YFxlxAY+45MaiGRMsEocb383lk4QiF3fBKr2EDGXIunMCPyqHBaFKLKK2dX3WURH8ryDbQ9X1MXyFIcCyL/BMFudO3jxFL6OG4XVc0j/9Hir1gzMH4ssLxaFWPO/lEHGgv7fglUpUD6Ap+8mt4Gp/9yZqmANPpq7nCoOTNlChWHdYWgr7dF7M6KXXXVE76TGvZ6eOE/9INR3KKHwmi99kJpeBl4zISf0Dn3MUUA0JN0PWQ25xtvcKGzfvTFv15OUf85JjnrUFhttNMktWTtVR4EavznXciUYO4RLaRIuFiIOxSg8/JIdcECPzK5VojgNU5aw+U3Z2VINYUq1iSdSvh0cRsEl3hCZPzjJDmsXef7sq1oq4UJHvpaHP3B5VbyGxARO8DloE+UdqPVkfttMByJk3V6vAuZkoXgfOis4yTxoR7sBFtN4ubIkxsxTQUTVB15KYELIbxvtIigWe6fUOX2jMsVNaRguvSc2bd6UgWpSUsDLrGv4FyF3KDErZhofQYl9RfhT+Dtw68/KfssPsb21I8iYgE5dn1Czq8ItDGL/oZu4tGP3F83XyQOFJcCVJuprRqLmPACNGMGRwJNBrigbt21p0Mi/PvS60jJsFoBHcsBV9iW4HOn4eGB+ZYVpwO7V8rvNnXfc0Yy4cNZ/BrauhSnOHSPNdF8Vky2cmWchfDKydZQV3u/k4SQyuhRT2pNQ44tdPDMswHN0IxGKkiZSsX2pYTW8Te3b1/46OtdjFL6Rm9G7XHc6oCmczLvbWI6qISc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(36756003)(31686004)(82960400001)(38100700002)(30864003)(83380400001)(86362001)(31696002)(6512007)(2616005)(53546011)(186003)(6666004)(6486002)(478600001)(37006003)(316002)(6636002)(450100002)(66556008)(66476007)(66946007)(6862004)(8936002)(5660300002)(41300700001)(4326008)(26005)(6506007)(8676002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25QQ2V0ZFU5Wlp1dXVGa2VqVHU5Nmx6QVplRW41c3pvN0wyK3hycDl5V1FX?=
 =?utf-8?B?VWUrVFhSbzdYcmt2amRKZjlzL3pUcERUcElDbDlBeWhwcXFHQ2RJMTVxZGov?=
 =?utf-8?B?V3M3MVYySHdOMUxEcVo5NEc5YXYyWmpLaE5QNHQzUlFCZzIxRHdPY1NxakQv?=
 =?utf-8?B?dzdGajlQMUFSSDRySS9PMUhkTGVHNDM4NFZySFdEYUNUL0tPMG94RFlFN2R4?=
 =?utf-8?B?YnkzaTRubWx3c3RPT1Y0Zy9RS2RuUi9DMG1PYTlGS3Vna0dNRnU3TjJoSnRj?=
 =?utf-8?B?Rlc1WVFQTG50Y2tYcFQ2M1F2MzR1QURIeFF6R2pGSlJXUDRCQzV0MFMrOWUy?=
 =?utf-8?B?aDZydm5RaFg4Tkc4bnlvWFhSWUZZNXlId1VLczVnMkFmV1JpMytqN1BQWmFG?=
 =?utf-8?B?dXF3NldpZmRqWlplemUzTDAzVnlkOU5DU2c1VUxQMWszM0xMZ093ZTlyOG5U?=
 =?utf-8?B?YXF2WHR5K0FGdDk2dVp4N2hxd3paMHhoZGtZY2FzUmRBb29XUWFlbGVKUHZI?=
 =?utf-8?B?Q3JKRGtpK0d2RUs4SzVzMy9NeHYwY2diTnVhSU1rTDU0NVdJdUVjL0IxRUlO?=
 =?utf-8?B?UHhrTHg0V1E5S2JrNldTMkNqdTYzOEtLSGFVcWg4cGtvMTQwTUFMYmxNd3g3?=
 =?utf-8?B?UHVtTzh3Qlp2T2U5SDgzU2d2MzhtekYxOFlLV05vU0lleW5XVUxDNzBFMEgv?=
 =?utf-8?B?cW1JUFUvNTc4VXlvalNRMGdycGdLV1ArSnNNcTY5Q29mZ3Uyak1WbHVuMTBo?=
 =?utf-8?B?WDlIMG1ER01ZVm5hcWtwSUd1b3MwRERXc1AvSDhzR0NtaWMvL1NyL1Zka0JX?=
 =?utf-8?B?QXVnZ0tFMmE3dlNSUk5MR3Zid0c5NFFWSjQxQ1FOSEFmWVNvWElWSHNEb1VD?=
 =?utf-8?B?ZjMrd1VDblpqei9JakRIcWhQTlV2TldxMlJ1ZFFTSnMwdTJNSFlzdDQ5MUJp?=
 =?utf-8?B?MzF2WkZtaENDOEZmbi9QWll5K0hGMDBOZ1p0MHBuMENxbm45RGY0UzFjVXNx?=
 =?utf-8?B?WGVuTnJzZU9FR3M4V21qWXNuLzByL3JwKzRlWEJYZFdWamt3WTllSWpVbmZ2?=
 =?utf-8?B?RXJoL0tNelZhRDFvMDhXT2RXTllGd0xmM2l3Rm5zL2c5QUkwdHozQzNibWtF?=
 =?utf-8?B?V0h4TVJoZDJmUWhwbVJ6VlQyM3AwNTd6LzY2SmJ1NTRFMWh5ZkJ2b0JRQU43?=
 =?utf-8?B?djZOZXU2RkFGYXI2ODgwaUlCT0ZNdlhHbmk5SXN4Nkh0cENLam4yYkNJZ2JE?=
 =?utf-8?B?YnFTMDd5MHR2MFZlSTg3Ui9ZUVQ4Y3hodXVpbGNUT3UyaEZWYkoyYU1RS3Ar?=
 =?utf-8?B?YllsTGRseHFsTjBuaWs2eGI5VWVSekN0RVNZOFc0Mm9WN2tZQ1VVZHdFYkxz?=
 =?utf-8?B?K081Q1NDT0wyRzlJS2k1MDN5M2taMXdhUjJMaDluTW42OFh6L1dqMGpwKzE3?=
 =?utf-8?B?ZngwUURPdE9xMlFZbm42NS9jQmFOeEtsWS9WYVRuWGNNM2tMV3RzczdZaitQ?=
 =?utf-8?B?TWcxTnNVQktkY1ZZcEM4cTEzRnhPWENFOS9zeW91c3FPMXRoLzREY0g2Wlpy?=
 =?utf-8?B?eWk0VW1rZ3ZyVVp3bTF5emdXcEpJWFlpeWVZZm5QQnJKM29qYUFOam82ampt?=
 =?utf-8?B?VjhjN2w5aDFnRVBVc0EvdE1hcFRWTWllYW05ZHgzQUl3czdRdE54WGZJM1FJ?=
 =?utf-8?B?dUpzVG1HYVhaYUFEVlJzb1JrTTFKMkttS1dqN2ZsSjVMbUFRU3FaWWxab3Jh?=
 =?utf-8?B?Ym9DdktBK3JPaHNuSVNPUWU3WlQ4c0craEdLbENGeWhnTVE5OHJrdHc1dXdo?=
 =?utf-8?B?NVlPM3g4dW1FWFpnd1lyT3lBQkVXMFJ4ek10T1YrY0lPK1c4OGlCMlBBWS9F?=
 =?utf-8?B?ZlhZRUVJeHBtNXBZbVZTNjZkZ1E4Zlp6eGgwZWYxOG5rdDhERTFucC9KTjJt?=
 =?utf-8?B?QjdlelkxSUZHVFNIQzNiWS8xTjRzaXEzUjV5U0wrRjZGT1p0MStsU05LV0Jl?=
 =?utf-8?B?UE5nR0pnT3Y5VzljVEk2RldTcE5oKzlLUGg3Mkk0QTVNVVlENWg0YmI3VlRh?=
 =?utf-8?B?QkhzRmloZDJldXZ4OTBwaURpYWF6RnkzMXVHNXg3Vy9XWUlWdVk1RFNiV0Jv?=
 =?utf-8?B?Kzh0Mmp1UGtYdnpYa2V4bW9HMGlHVUluSlJHcERZYlp4V3VXalVlNkMzT2tt?=
 =?utf-8?Q?ENXKQwGcNzxetY5u5ZNmB/c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2a7194-1b07-4386-7a4e-08dac244b193
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 11:22:32.2905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaVy6WsKmNhIDHnePnR5QTJFfgkyK+umxr1KpcgQx6/rTheYjUmFX8f6ymc4Ky//uuSdZpKuJ+SEtGzwGtH+HWKfZUJQzZQ0V8V1hF6MQuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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



On 31-10-2022 23:16, Matt Roper wrote:
> On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
>> On XE_LPM+ platforms the media engines are carved out into a separate
>> GT but have a common GGTMMADR address range which essentially makes
>> the GGTT address space to be shared between media and render GT.
> 
> While this is all true, I feel like this description is lacking a bit of
> explanation for why/how that translates into the code changes below.
> For example you should elaborate on the areas this impacts, such as the
> need to invalidate both GTs' TLBs, retire requests for both GTs, etc.
> 
> Also, the movement of the PAT setup should be noted and explained as
> well since it differs from how you approached the other changes here.
> 
>>
>> BSPEC: 63834
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 49 +++++++++++-------
>>  drivers/gpu/drm/i915/gt/intel_gt.c        | 15 +++++-
>>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 ++
>>  drivers/gpu/drm/i915/i915_driver.c        | 19 +++++--
>>  drivers/gpu/drm/i915/i915_gem_evict.c     | 63 +++++++++++++++++------
>>  drivers/gpu/drm/i915/i915_vma.c           |  5 +-
>>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>  drivers/gpu/drm/i915/selftests/mock_gtt.c |  1 +
>>  9 files changed, 115 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 2518cebbf931..f5c2f3c58627 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -196,10 +196,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>> +
>>  	i915_ggtt_suspend_vm(&ggtt->vm);
>>  	ggtt->invalidate(ggtt);
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  }
>>  
>>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>> @@ -214,27 +217,36 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  
>>  static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  {
>> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>> +	struct intel_uncore *uncore;
>> +	struct intel_gt *gt;
>>  
>> -	/*
>> -	 * Note that as an uncached mmio write, this will flush the
>> -	 * WCB of the writes into the GGTT before it triggers the invalidate.
>> -	 */
>> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>> +		uncore = gt->uncore;
>> +		/*
>> +		 * Note that as an uncached mmio write, this will flush the
>> +		 * WCB of the writes into the GGTT before it triggers the invalidate.
>> +		 */
>> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> 
> This isn't a GT register, so writing it for each GT doesn't do anything
> different than just writing it once.  But actually it doesn't look like
> this is even a register we should be writing to anymore since Xe_HP.
> The GFX_FLSH_CNTL register no longer lives here.

Ok I'll remove the iteration over gt, also i do not see an equivalent
register for Xe_HP, so i'll leave this as it is for now.
> 
>> +	}
>>  }
>>  
>>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>  {
>> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>>  
>>  	gen8_ggtt_invalidate(ggtt);
>>  
>> -	if (GRAPHICS_VER(i915) >= 12)
>> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> -	else
>> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	if (GRAPHICS_VER(i915) >= 12) {
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_uncore_write_fw(gt->uncore,
>> +					      GEN12_GUC_TLB_INV_CR,
>> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> +	} else {
>> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
>> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +	}
>>  }
>>  
>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> @@ -986,8 +998,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>  
>>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>  
>> -	setup_private_pat(ggtt->vm.gt);
>> -
>>  	return ggtt_probe_common(ggtt, size);
>>  }
>>  
>> @@ -1186,7 +1196,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>>  		(u64)ggtt->mappable_end >> 20);
>>  	drm_dbg(&i915->drm, "DSM size = %lluM\n",
>>  		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
>> -
>> +	INIT_LIST_HEAD(&ggtt->gt_list);
>>  	return 0;
>>  }
>>  
>> @@ -1296,9 +1306,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>>  
>>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  {
>> +	struct intel_gt *gt;
>>  	bool flush;
>>  
>> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +		intel_gt_check_and_clear_faults(gt);
>>  
>>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>>  
>> @@ -1307,9 +1319,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>  	if (flush)
>>  		wbinvd_on_all_cpus();
>>  
>> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>> -		setup_private_pat(ggtt->vm.gt);
>> -
>>  	intel_ggtt_restore_fences(ggtt);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 2e796ffad911..d72efb74563a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -110,9 +110,17 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>>  
>>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>>  {
>> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>> +	/* Media GT shares primary GT's GGTT */
>> +	if (gt->type == GT_MEDIA) {
>> +		gt->ggtt = to_gt(gt->i915)->ggtt;
>> +	} else {
>> +		gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
>> +		if (!gt->ggtt)
>> +			return -ENOMEM;
>> +	}
>>  
>> -	return gt->ggtt ? 0 : -ENOMEM;
>> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>> +	return 0;
>>  }
>>  
>>  int intel_gt_init_mmio(struct intel_gt *gt)
>> @@ -965,6 +973,9 @@ int intel_gt_tiles_init(struct drm_i915_private *i915)
>>  	int ret;
>>  
>>  	for_each_gt(gt, i915, id) {
>> +		if (GRAPHICS_VER(i915) >= 8)
>> +			setup_private_pat(gt);
>> +
> 
> Since the term "tile" is used for PVC-style remote tiles (which we have
> some framework for, but haven't enabled yet), it seems confusing to have
> the PAT setup for all GTs (including the standalone media GT) in a
> function called intel_gt_tiles_init().  Maybe we should also have a prep
> patch that renames this function if we're going to start doing non-tile
> things in here too?

i'll move this to i915_driver_hw_probe
> 
>>  		ret = intel_gt_probe_lmem(gt);
>>  		if (ret)
>>  			return ret;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index 6f686a4244f0..aee37e9e79b0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -292,6 +292,9 @@ struct intel_gt {
>>  	struct kobject *sysfs_defaults;
>>  
>>  	struct i915_perf_gt perf;
>> +
>> +	/** link: &ggtt.gt_list */
>> +	struct list_head ggtt_link;
>>  };
>>  
>>  struct intel_gt_definition {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 4d75ba4bb41d..cb1272702a1a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>  	struct mutex error_mutex;
>>  	struct drm_mm_node error_capture;
>>  	struct drm_mm_node uc_fw;
>> +
>> +	/** List of GTs mapping this GGTT */
>> +	struct list_head gt_list;
>>  };
>>  
>>  struct i915_ppgtt {
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index c3d43f9b1e45..6b973182ddcc 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -577,7 +577,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>>  	struct pci_dev *root_pdev;
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>>  
>>  	if (i915_inject_probe_failure(dev_priv))
>>  		return -ENODEV;
>> @@ -614,9 +615,11 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>>  
>>  	i915_perf_init(dev_priv);
>>  
>> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>> -	if (ret)
>> -		goto err_perf;
>> +	for_each_gt(gt, dev_priv, i) {
>> +		ret = intel_gt_assign_ggtt(gt);
>> +		if (ret)
>> +			goto err_perf;
>> +	}
>>  
>>  	ret = i915_ggtt_probe_hw(dev_priv);
>>  	if (ret)
>> @@ -1318,7 +1321,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>>  static int i915_drm_resume(struct drm_device *dev)
>>  {
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>> -	int ret;
>> +	struct intel_gt *gt;
>> +	int ret, i;
>>  
>>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>  
>> @@ -1333,6 +1337,11 @@ static int i915_drm_resume(struct drm_device *dev)
>>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>  
>>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>> +
>> +	for_each_gt(gt, dev_priv, i)
>> +		if (GRAPHICS_VER(gt->i915) >= 8)
>> +			setup_private_pat(gt);
>> +
>>  	/* Must be called after GGTT is resumed. */
>>  	intel_dpt_resume(dev_priv);
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index f025ee4fa526..e9d4352ebfb8 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -43,16 +43,30 @@ static bool dying_vma(struct i915_vma *vma)
>>  	return !kref_read(&vma->obj->base.refcount);
>>  }
>>  
>> -static int ggtt_flush(struct intel_gt *gt)
>> +static int ggtt_flush(struct i915_address_space *vm)
>>  {
>> -	/*
>> -	 * Not everything in the GGTT is tracked via vma (otherwise we
>> -	 * could evict as required with minimal stalling) so we are forced
>> -	 * to idle the GPU and explicitly retire outstanding requests in
>> -	 * the hopes that we can then remove contexts and the like only
>> -	 * bound by their active reference.
>> -	 */
>> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +	int ret = 0;
>> +
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>> +			/*
>> +			 * Not everything in the GGTT is tracked via vma (otherwise we
>> +			 * could evict as required with minimal stalling) so we are forced
>> +			 * to idle the GPU and explicitly retire outstanding requests in
>> +			 * the hopes that we can then remove contexts and the like only
>> +			 * bound by their active reference.
>> +			 */
>> +			ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		ret = intel_gt_wait_for_idle(vm->gt, MAX_SCHEDULE_TIMEOUT);
> 
> This function is only ever got called on the GGTT as far as I can see
> (which makes sense given that its name starts with 'ggtt').  It's not
> clear to me why we want to handle PPGTT too now?
> 
Thanks for catching this, it is indeed only used for GGTT, so this
i915_is_ggtt check is not needed.
> Even if this is intentional and correct, it might be best to move this
> up to a small if statement at the top of the function with a return so
> that we can eliminate a level of nesting from most of the function.
> 
>         if (!i915_is_ggtt(vm)) {
>                 wait for idle;
>                 return;
>         }
> 
>         ...
> 
> 
>> +	}
>> +	return ret;
>>  }
>>  
>>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>> @@ -149,6 +163,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	struct drm_mm_node *node;
>>  	enum drm_mm_insert_mode mode;
>>  	struct i915_vma *active;
>> +	struct intel_gt *gt;
>>  	int ret;
>>  
>>  	lockdep_assert_held(&vm->mutex);
>> @@ -174,7 +189,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  				    min_size, alignment, color,
>>  				    start, end, mode);
>>  
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +
>> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  search_again:
>>  	active = NULL;
>> @@ -246,7 +268,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>  		return -EBUSY;
>>  
>> -	ret = ggtt_flush(vm->gt);
>> +	ret = ggtt_flush(vm);
> 
> As noted above, this call is always done on GGTT (since we checked and
> returned if it wasn't GGTT just before this point in the function).
> 
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -332,7 +354,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>>  	 * a stray pin (preventing eviction) that can only be resolved by
>>  	 * retiring.
>>  	 */
>> -	intel_gt_retire_requests(vm->gt);
>> +	if (i915_is_ggtt(vm)) {
>> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +		struct intel_gt *gt;
>> +
>> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +			intel_gt_retire_requests(gt);
>> +	} else {
>> +		intel_gt_retire_requests(vm->gt);
>> +	}
>>  
>>  	if (i915_vm_has_cache_coloring(vm)) {
>>  		/* Expand search to cover neighbouring guard pages (or lack!) */
>> @@ -437,11 +467,10 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>>  	 * pin themselves inside the global GTT and performing the
>>  	 * switch otherwise is ineffective.
>>  	 */
>> -	if (i915_is_ggtt(vm)) {
>> -		ret = ggtt_flush(vm->gt);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +
>> +	ret = ggtt_flush(vm);
>> +	if (ret)
>> +		return ret;
> 
> It's not clear to me why we're removing the GGTT check here?

with the above change done, this will be restored.

Thanks,
Aravind.
> 
> 
> Matt
> 
>>  
>>  	do {
>>  		struct i915_vma *vma, *vn;
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index c39488eb9eeb..24cbee3c1ce5 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1542,6 +1542,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  			   u32 align, unsigned int flags)
>>  {
>>  	struct i915_address_space *vm = vma->vm;
>> +	struct intel_gt *gt;
>> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>  	int err;
>>  
>>  	do {
>> @@ -1557,7 +1559,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  		}
>>  
>>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
>> -		flush_idle_contexts(vm->gt);
>> +		list_for_each_entry_rcu(gt, &ggtt->gt_list, ggtt_link)
>> +			flush_idle_contexts(gt);
>>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>  			/*
>>  			 * We pass NULL ww here, as we don't want to unbind
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> index e5dd82e7e480..2535b9684bd1 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>>  	 */
>>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>  		i915_ggtt_resume(to_gt(i915)->ggtt);
>> +		if (GRAPHICS_VER(i915) >= 8)
>> +			setup_private_pat(to_gt(i915));
>>  		i915_gem_resume(i915);
>>  	}
>>  }
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> index 568840e7ca66..b519d271f4fe 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> @@ -127,6 +127,7 @@ void mock_init_ggtt(struct intel_gt *gt)
>>  	ggtt->vm.vma_ops.bind_vma    = mock_bind_ggtt;
>>  	ggtt->vm.vma_ops.unbind_vma  = mock_unbind_ggtt;
>>  
>> +	INIT_LIST_HEAD(&ggtt->gt_list);
>>  	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
>>  }
>>  
>> -- 
>> 2.25.1
>>
> 
