Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD765F1756
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358F10E478;
	Sat,  1 Oct 2022 00:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F910E478;
 Sat,  1 Oct 2022 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664583992; x=1696119992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J1nVmt8ueTkFcBe0MuIYCDWRQijRr0XZ9WmtDEVlyAQ=;
 b=bkklYfoZhAH8oYfhQcubKdFs6kDXk3gwdvl+SL/KhZm9QaDKBhY4P/pZ
 XvacJhMahpP8C4jf3M/0Qv5wLmkgSdSix+6fQRzuOC18IExYJ1fUVZ2Z4
 J2UxCZAGaxRDCxAxT88UxfMd62Aa6OVoCv9bV9vZjj+zQapsFnpPNN5iP
 bMd9IOTZElwdnInh/2rebOBw9J7F8hJ7R9GPFOKla0wGo6zmMomMvEW60
 vU3LVbSBFVzDBRxaInnacX3QkWs/PbxYz5DhoF/fbPizCCrmoq0AeeuEL
 qSi4xoMyt63qG0BPm0Py/FpOUd/0a5TovlwLqgrG/TCyMx1b7wH8gA9We w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="282688926"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="282688926"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="691434622"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="691434622"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 30 Sep 2022 17:26:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 17:26:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 17:26:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 17:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcrLUjIIfONo0v3cjYU3Lx8M2FQ3mk7S0A1X+fvxplMJPH3gZmfeyrLpXgIJFCnmgq0MtjLpSnZihw46B7S1sdzLnz9RqNn//e29f0pO3ALxmZkqz6Cth5MME71SeAjCKOSnmTS/dLUe6nzlH4FIFyCkJXTcddQU31wQoZaDt+M3HfiZv4AQ7wZlj83SbcIHiREPr/nJ8L4l2m6tcZRNZtLD15elMIRpIW/QuSvXtQTDGBU9sMpCBk3AAscZRVPzXBy/Ba4H/uxm63beCn2w15fzVabkr2EOWGx0toAoHdLsdRKG/7emhZXO2S1tax/1Eru0Yj5y/oj6KyS6ZqU/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFvpmF/d+WEwdRznT6yCEINZvBlmSxyFKlNq3imOdu4=;
 b=RbJns61ZKnqsmhn9SM5sp2c3JVJw/dtv7RJS8ZOhpv7aEAR75GcLc2Y8zM8NfYb3MY1y8ntv/vZV6qyYm+n2Gj5vhAC687i5uHWFoq+PlDe1CepQWyMeHB6dnjFTYwSeJ6VPWPZm7ZDxoFch/paYg3XNMbswbJaDRN6MpybVcRaatFm0B3jp21b5qpE+c3PIIO0Ii+kHYabbhaCb2KvIJrxYz3xlp+/uz+HI/wGDZLxE3/Efnxdgc67LA3Nq5KagsP4CMfTCVrpPC5tBHJBhruo9UA/LeLvDMpjws2SjFaKmH9uo3JTEA6u3prFTtFY/89q1CyvX5v36iBBlsWkVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Sat, 1 Oct
 2022 00:26:29 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.023; Sat, 1 Oct 2022
 00:26:29 +0000
Message-ID: <10c7e74d-937f-434d-363b-20cda5cba0d5@intel.com>
Date: Fri, 30 Sep 2022 17:26:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 6/7] drm/i915/guc: define media GT GuC send regs
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-7-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220922221117.458087-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: f773daf0-efd6-4846-893a-08daa34395b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dzdhdedbb49+0kLvR2JLIu3UwVyo/qaB3R/PvnNvLOj7xF9AajBchd7QEVCmLaaEOzOHTMoPjLDMiggJnpfJDaMBJOwTTT3rqmrpDdBZas+OnXK8peKHB+TLlJtnwEF+wCJt0OXrtevzlndSdCoDRTMe/j86rrFDy5+AZ/1Wt4IdbsrumP4EzBk++V6Dnkjuvib1Ot5OsoHgT5ilE6bdkga/mIgvVJiP8drzKkzs3oxtWB3TVTDLeKkput7YkKTR9BkXfgX/uLfRln+U62jOQDlIX+VSg5zYaKmZYEcsEWvfRd91jBM7QP3foRtG/7YOF1Lwg39dp1wJ4NATJS5i0KDXUloBaQ3yhQ41djf0f8MKLpXtC1cEyQSK/XZqGFZR/5NceQ26EB8A/AXYoD7K+KbZ30SDk7VQG4aqozwoLP9f88K/swb81SPBGs1a+FVmaoMaE9rjFIKKQArV4vSPlr7AoUQ3tIH4tu/es9epraH4oSg95ml4IxI93az8YKa7dgam0U6an0eTuJgNcWJqJa4aVtBNk+K3N+kzWiP0d7XpI3qwRnaKmUQcBa0gdPXfgvwqJ2CoHTsvyccFU8MGdMLbDC22Xyitk47s7WssZ4yYkl3xnUJkBoEQ6mo2pPh/mhPPiN8CFkDl3Cz3Dr8Tms/oXho/DrPeXkHot4Wr2niXD13Qu7M1yZZByk3vUmqmfz/28A9Co5sR+YtQw1Pbrj3XhNsMCfvSFPb1VPjEZQFj5mZDe/fbcpTFjjWa9hcN6DGRchuVcT5DD6YlmvCEiRn3YaWoUa3ao5hSTgs2qlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(83380400001)(478600001)(6486002)(82960400001)(6512007)(26005)(36756003)(2616005)(8936002)(2906002)(107886003)(31686004)(86362001)(38100700002)(5660300002)(31696002)(186003)(316002)(4326008)(41300700001)(66556008)(450100002)(66946007)(66476007)(8676002)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFdlaW1YTHF3R3o2MzlSd2FEMFQrdVVaK2xkRnhrWHZJMXZQVXg0L2UvMWlw?=
 =?utf-8?B?Ynh5MnZQQzhPaHV5TFZsekVsRlU4MUlaMVkwcUJEeFZpcU5mZ0RrT3NSaUdR?=
 =?utf-8?B?S3Y2NjVkaDBLSlhoVTNLVmxQd1dSUk9MdS96d01sVUtSUDZCT2lodW83Z2JJ?=
 =?utf-8?B?cFVKbEc0aWhvcFk1Uk0vZGJwOWd3SmJhSy9xMHlsbWtTRWZHOVJGUzk2K3lk?=
 =?utf-8?B?WTNJbWJDeitkWUw4MDh5WFBQK2kwV3puMGt1NjhVZjc5Lzgzb2NYRysvUGI5?=
 =?utf-8?B?V2dQZzRkQUZDUFlXU3lJM2Z3bFV1dzN1eHVvYUJIb2Y0dGRBZnNZRWNCVlg5?=
 =?utf-8?B?bWNyTm5mbTRsNDN3cWhvTTF0Uk1kUmlyN2FIVzQrczh4N3pVaFJBRzBhaStW?=
 =?utf-8?B?MUxRSGpDc0JyVncwYnRFckhqUmRBdGRiRElwREpXRkVoNDBESUpXUHcvVXhP?=
 =?utf-8?B?QytuR0dHb2oydmM3R0M2OUVhVTlUMjB4bit3MHdvSWM3S2tHRVZqanNjbnIw?=
 =?utf-8?B?NG1EK1BqbnRZeW5Qa2tJZm5wMGpWZ1EwVVJGQjkyN2hnSEVOQmVHdWRuVE5U?=
 =?utf-8?B?Q2xrZWxSWVZHN29rUm1jZWZ2K1N5Z2pFY3ZLM2sraUdYTkZiL2t5Y2IvMmp4?=
 =?utf-8?B?TGF2UGIwWG1ia3oxa0kwWTB2WXc0T2hGaTVOS3BuZWZHQ0pCOWZyc0FKd1Bk?=
 =?utf-8?B?RFJlNDVCZmU1amdVR1hKR0xSYW8wTTBRcTRjZDNjTzZRSEdZKy9KZ1BEOEph?=
 =?utf-8?B?cHNIRG5UOHBkZWJRS1gyeVF3MC9YT3V2SFZpRFN3Sy8zZ3ZwUVVvYmE1RGdW?=
 =?utf-8?B?T1pSMkJ0QXh1R1c2dXVpOFNvVWZCdFNvM09peVJNWTZrcS9adWxseEt3NmFo?=
 =?utf-8?B?ZGozUGM5ZHdtdEQwd2xzS1JnMGNDNFo2OHFHMWVLcGZJTko3Wkl4dFdianZx?=
 =?utf-8?B?LzgvMTA0N0lISWFCYngyVTZWdWNLa3RJMERzMFI3WU5vQXFudkNxSmdreUJs?=
 =?utf-8?B?VDVQTHdvVG4rcXd3bTBSUkJ4RjFRdkpVL3JjN2xuUG9HTWFLOFBsUW1hUG0x?=
 =?utf-8?B?MnJnVDhZOWNVZlhyUVNXOHRHUGd2clk1R2wyOGh2RVFMazZsVXFmTGxIMkZD?=
 =?utf-8?B?Tng0T2JHUXI2bjN1R2xYdFN3MkFTN2EvdmovWnJzVVlHMTM0ZHp1ZnBubDd4?=
 =?utf-8?B?cCt0K2RSN2tRM3NCckdCMXFGQUk0VndaS3N3WC82TktPblQya3U4OUp1UVgx?=
 =?utf-8?B?Vld2d3M1RUF1YnBXZUQ4aXA5aWhIVlNiMWtUSndXd2VOSFNrcmhyamFyN201?=
 =?utf-8?B?b0VMNG40L3N6dmlMZHFoQlcxNCsreWw3bEZrTnNvM3VSd0F5Yzg4RWFtMzdo?=
 =?utf-8?B?YXpWcy94RGNyR3dPYWUzUXNUYjVueXQzSDNERzkrSS80dTV1bWg0amRWbitS?=
 =?utf-8?B?NTRYZXNZbDQ1MjY4eGpiKzVhRENwSVpaY3BlbndjVXVhV0NWTjZNTEVZTmhl?=
 =?utf-8?B?dE5wRk8vaGk0eW41UVJBbW9aSk5UdlQxK0RDa0dWdVVPM1MyUjVkajE4RWFO?=
 =?utf-8?B?RnRSM1ljd2lOclVDb2M4QUZ4c3pKL3pFOVZEZ3lCUHBCdmhFc2t5M3ZXUG5v?=
 =?utf-8?B?WHdoTHZ3c2hXbVlSeEc4V3NtZEU0Y2dlb2FtekZvQU9IVkdkNTQrQnZkMzBV?=
 =?utf-8?B?em03TVdpdWxXelhHdzMvZmcrWFdWdjkyVDVXL1hnSFNrVGw1cThwZXo3Y09z?=
 =?utf-8?B?NngrTnFKdVhTMDdrN25TVW9QRG8zQTlFZUVwWUlrUFhwY2xtMHNrRnhsMjVR?=
 =?utf-8?B?SnpMNEx2c0hYMkN0aURKaENSSnllNW9lSlZ4QzFONDc3Z01jdHNFL3BjZ21x?=
 =?utf-8?B?aTViOCt1R0syWGdZcTdqS0lrR2M5M2pndnRBN3BvTm51OXR1RDBNcUpxTHZ1?=
 =?utf-8?B?RzNYYU1ua0hYK0lXamxDQWQ1ZnJDclRCVnpEaVYxMmxEaEpkSWl5elk0Y0Zw?=
 =?utf-8?B?eUNJZTlsY2xzYS9LeS9DUGFiL0hIZXJwR0JNTDJtcDd4QVZxcis2WFExb2RK?=
 =?utf-8?B?TU85Q0UzWFg2b2ZPeVJKWmlLYjNFT0FoaWl4eGNTVVVvcm1XZFRuWmRzTklU?=
 =?utf-8?B?YWs4dmdvSHZqTHRjelRtRHFZZUpOd09xNERydEhoNkVTK1VzMTYrcDZNRno4?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f773daf0-efd6-4846-893a-08daa34395b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2022 00:26:29.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByekBLHrebXd2/iBrgoSwXpG8O7U+swWNcg0yJisBQWwChUu9MqgQC5Cc6i/m4NPZjeYXylPOaG/ev9LfDL/ULYReGOGoRO0mNroATXfb+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
> The media GT shares the G-unit with the root GT, so a second set of
> communication registers is required for the media GuC.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 14 ++++++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  2 ++
>   2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index bac06e3d6f2c..b0beab44b34c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -156,7 +156,8 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   
>   void intel_guc_init_early(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct drm_i915_private *i915 = gt->i915;
>   
>   	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
>   	intel_guc_ct_init_early(&guc->ct);
> @@ -168,12 +169,17 @@ void intel_guc_init_early(struct intel_guc *guc)
>   	mutex_init(&guc->send_mutex);
>   	spin_lock_init(&guc->irq_lock);
>   	if (GRAPHICS_VER(i915) >= 11) {
> -		guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
>   		guc->interrupts.reset = gen11_reset_guc_interrupts;
>   		guc->interrupts.enable = gen11_enable_guc_interrupts;
>   		guc->interrupts.disable = gen11_disable_guc_interrupts;
> -		guc->send_regs.base =
> -			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
> +		if (gt->type == GT_MEDIA) {
> +			guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
> +			guc->send_regs.base = i915_mmio_reg_offset(MEDIA_SOFT_SCRATCH(0));
> +		} else {
> +			guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
> +			guc->send_regs.base = i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
> +		}
> +
>   		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
>   
>   	} else {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index a7092f711e9c..9915de32e894 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -36,6 +36,7 @@
>   #define SOFT_SCRATCH_COUNT		16
>   
>   #define GEN11_SOFT_SCRATCH(n)		_MMIO(0x190240 + (n) * 4)
> +#define MEDIA_SOFT_SCRATCH(n)		_MMIO(0x190310 + (n) * 4)
>   #define GEN11_SOFT_SCRATCH_COUNT	4
>   
>   #define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
> @@ -101,6 +102,7 @@
>   #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
>   #define   GUC_SEND_TRIGGER		  (1<<0)
>   #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
> +#define MEDIA_GUC_HOST_INTERRUPT	_MMIO(0x190304)
>   
>   #define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
>   #define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)

