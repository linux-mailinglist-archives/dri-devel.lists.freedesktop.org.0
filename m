Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10296640DC8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 19:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C3B10E721;
	Fri,  2 Dec 2022 18:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799510E720;
 Fri,  2 Dec 2022 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670006855; x=1701542855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a3J5aMnc7xeSmqw2zEu8L+LuhgncfYel981KJ9Kj7qI=;
 b=XoIcDClEK6jC/75M2H+0uQnRSJjtqgsqZKvVwcfDtvf4p4mNGIGYOe3G
 b9Z2wH76u8l+ZVnjhoCcyCH3CA0qeUHnLUsk3Nro7ME4+ySp4M8eZXsQw
 g0RVJsbxBReDiE+DDZYfAlE8V1PtBOuYZBLdsc9yTEarcbKwEl7FSSVdo
 p9g1/vfUnh1AZszmP/FzkdSPmJu2/Sziq7Cm7pCnqiKIgpqk0xiCmvVWP
 +RH4WM7SNJ0ANYMlVK895pfniOkkGlQRHr7IsMf/JKZzEjYuUS6FGfKmo
 C/WL+GN+N7VGGB5JYDQtfo6HeIHRB5J/ariILGTeHoEty+OIc2lNFPpw6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="317874720"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="317874720"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 10:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="708578777"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="708578777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 10:47:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 10:47:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 10:47:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 10:47:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 10:47:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrE6NJovL10sAaYMcHNmpNwwOcwA8ZAFLORBklQTrt136gryFburUejhl2vojmblRxf0rTeIGFxY2y3wJnYKMJkA/KTD6s7TLL7y0helQmZs4zsQ2iJj06k4/sxrJ0WzlixO7zB6x50fEwrP1n+1iweMO9uGPa8t30SxwjlHPmIHNFTYx545IgA54dRF4bAQDfgOZ0jNa4goN5RuUW8Oe7409272FnOdyCcgUC28AfhE6bjqpA/Ubxd68bQm97LzpAuNRfrSUJ5qIJKWsn6hy3IGREfAnqo7hG5kMxYniIZGecY9CbNhi6AWAWTjm+L9yfasTGwxs03DoWhh+cdBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydr7+JdBaub0+gu9BszR4DmO0WNMeeGHR6Il4SMyZ34=;
 b=De6RNB2DPCEUnEkUKiXCMVZ8x8lBGLzHBO+M4N2qUXc2OAzWlKkPbcbvWCU//jSeO4aFJObQdWxuvF6TPTi8svxAGAT4/CXkQ1EKIA4dPu2Yqdk1IdFaKtqwPzVnsCoHs/CCkyRKE3f3u3upB6Zth4mx6EYaFt7f1j2ifv9QJKU/9k6Ds1gmqkKjFE/Tg1TQJ5CzPBVVdPBzG7yqoEfhjqrW+N4RRqMWLiA5/vzc1t4N5TE7POUN5xgRLgxFBXU+ZYMdN8zjv/lo0hMe++TxdcUiV+rxoJjDf4hW5Ma+RiV3r71xRe1iudNHYbxN9QcHH2zf2aMvPsCsG0JTk+PUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY5PR11MB6210.namprd11.prod.outlook.com (2603:10b6:930:26::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 18:47:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a05f:67f5:ab9c:6221]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a05f:67f5:ab9c:6221%5]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 18:47:31 +0000
Message-ID: <edcecc8e-5e39-2e10-5185-504bc3e010b2@intel.com>
Date: Fri, 2 Dec 2022 10:47:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/guc: enable GuC GGTT invalidation from the start
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221110175823.3867135-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221110175823.3867135-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY5PR11MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfa16f3-d01c-4329-e534-08dad495aaee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lP8gx+wvHirVPhZqzFfvyIkFSM24PgdXSbeIWPc6hvJNqPXFBGHZbuuL92HRsNpO8R9OoAZ/GDdZWgXthTMxt14EXcZgLA0QqRFw9oqQArd7v3ae/2jdY2Vn3jNejpIgiWb1w5389gXZn+3pcm8WhawGGCmscuY7EuHT7cxNRUTqKShkCEEH93OfXot1H0AhfScwb7iijVrgphJ+LgWTxsQYM/ZYBCkqMCKAhqNOez+LPVHwqVcxOKVLE2I2F2mZPHo87Xvm5gJQYKgFN2qUnJrOokCr1yeKb8U/YbPH3ngelPmKX7jEl9pYGefVXClMtNh4Ll+kuDGpkSdzuUtR92ZQPdGwhK7ILhUJGKZTKNuhRAtMEwi/TydAcRlVxRGsVZ+BuJF82KD/DiwiQKS1r5NXvjMrRRRpbJ3LXTTI2yYOnncCy9C58dGVbAMVkXXXmW9f/hf56JNUBfbp8ouQtgxT8zEVzzaQcKABY9IGlFDIWtYpFtPsIu6n7gXjVsO0Jq8L2JT787NllYcmgAt+TePHSF5oNofyGkBordy1lOZxttfxVsRrjpN+D9QpJijWpBdULBw/H+G9mV8sJ5CuL36RN0RMaSeFKCXSXbHHrs1q75uvkEsKWSR4R42wGn/UoRP8+DBAE2Zn0Boq9vfN2zZv1OFZY6GUAqc58ysL4z0Q4z0Zat6tFRRFvSaya1QBBZFGygqlpKcmRFhDW/1UJLcMMATG5h678nUZzRflHMc7/bVbFG/fmgUpBeKN+5C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199015)(26005)(186003)(6506007)(53546011)(66476007)(8676002)(66946007)(66556008)(450100002)(478600001)(6666004)(6486002)(107886003)(4326008)(2616005)(41300700001)(5660300002)(8936002)(83380400001)(2906002)(38100700002)(82960400001)(36756003)(316002)(86362001)(31696002)(54906003)(31686004)(6512007)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZiSWVHVjB2NDdHelpNUlE1VFphcGpBejJHZUU5ZG9nYXFSdXVQenVmYUxa?=
 =?utf-8?B?TlBvYVlJK1greDc5VDFoU28rM21XYVZGa1Mydm5Mb1FUaHFkazc0YmxhK1hK?=
 =?utf-8?B?R1RicWNnYVFNU1RnT0psZGJ0dWQvZ0VhL0cwY3VmdVU0ZUFYMHc1eXBNQ1ZS?=
 =?utf-8?B?eG9EbG9PdnRVQjhDSVJ3cEhTaTJ2Sk1VQ1BjR0JITkhYMFIweTR5OVJHREZJ?=
 =?utf-8?B?RVAyeGZtTUp0OWJGNjBCSXpSVHF5eXdTbkdRcWhSdVFkdWxNYUpnaXRocGh3?=
 =?utf-8?B?N1BEakhMUzhQRk53N2NLc2VNKzJOMkptN2VnM0JtaDRsMHQvUFlQY1JQUFo4?=
 =?utf-8?B?N0VsZTQwb3J5RVRpckNXTy94WHlydm5rTXNNbUVua1laTlBWbW81V3E1THE5?=
 =?utf-8?B?Qmd5cFROcmtrKzV0OUo0dlpKdU5jQnVTQnFNdmtyQVhZTmNWN2dWM2pQZXZV?=
 =?utf-8?B?UGRzNmxEOG1UKzlxdXBUODdIUklmTWdGRnF4bEN6TEN4TkhkeVJENlByRXI1?=
 =?utf-8?B?OWE0d3ZCWjBkc09zejBKbkRuNTdFYVhTQjFmR01vd3Jkbi85S1lobC9GaVJr?=
 =?utf-8?B?bFUxNGxUUEsrS05vNmN2NGNiSEQ2NmJJZmd3Q09MZjc4VmVpMUhjUUVPQnVC?=
 =?utf-8?B?WGxXcUFIZnlsekVYV1d1TXp4QkRlaDkrZ2NPUTdiVUE0NDFhZFlLeXQ3ZVpp?=
 =?utf-8?B?Y1RPUmtrZmM4RTdzLzdMaE55QjdmdWtWckJmdnByTmNqRkRaUlpMMzNYNCtS?=
 =?utf-8?B?elkyTGZwa0FoTFZyeUdUSU1RQjQ5bDF6Uk0vZEVBamNuc1AvL3hpY1RsUXNF?=
 =?utf-8?B?a1Q3ZU1Wc2RKMktDN0ZlTFZvOXFleXE3MExCQU9PSDFDTG0vR3hMZ1U4a0ox?=
 =?utf-8?B?NEdFaldoRmU3ZXk3aFFxb2duOC9URVZaWDdBeG10Y3kxcnp2a1RhV1g5NVJS?=
 =?utf-8?B?aEpYZlBYRkFQdkVONmFvUENaclJET3Z6TWZCMkdjUGxjS2JwMk5PRUdNOVNH?=
 =?utf-8?B?d2xNUEEwVlp3cHRIOHNhejlRK0NFLyt2VDM3RHk3WUpMOFJmb0dhMTkvSTBp?=
 =?utf-8?B?VHE2QnhGZVJrYUxHd2xFdDhOV0ROckFEY3QwdWVoeDZTS2I0N1NOTVl4UWF4?=
 =?utf-8?B?MUt5dmg3NlNtWE4zUThPVHpCc09nUzB1NGhpREE0Y1c5Y1R6MjVDeFNkSjJr?=
 =?utf-8?B?enhmaDRtYmVRQWRJaUxEaW96alphSVRoSmRwQ3hjeThzSEtJQnBlR0pGUG9B?=
 =?utf-8?B?ZnY5bjZ5VFlKcU9pT2RmR3Y3cHZhRXdDU1Q2Z3E3eU9CYzdWZkd3Z0JVWXhu?=
 =?utf-8?B?VDRmejRrTlk4bHBlMGgvcjQ3Lys5cElaM21tQVdjVERSNXZkNGNoVTFwOVls?=
 =?utf-8?B?MXE3cnhqZjBkVFBRMkN4ODNXU0ZuMlVZUnVYV3huRGtZeWIyK1FxUzNiSXBi?=
 =?utf-8?B?RGtnYWcycGJvVUZYSUxiVERWT1g2aEtqazRjU3lHMHR4N2FHVTlBWG10alFW?=
 =?utf-8?B?Z2hJTVZaeHdVWmdRb2tZWFRjWlY0N1FONDNHdUcxYXJnemFSWjA0ZXRaZjlk?=
 =?utf-8?B?bDg2ZFd2bjEwZjEyK3VVcFU4dlNWWUtVU2R5Tlp2WXNZNlc0WU0wN0RNNGYx?=
 =?utf-8?B?Y2FRSGtZRmpiMDIweGFUUzg4b3Ntc3MwS2hncXdDMUUyZHI2dkowTEtmb3Rv?=
 =?utf-8?B?NjBWeTNhT2RoUThadzg1V3VEbVd3WldTSWdZSjU5bGxQa3diRml2VTdiSjE0?=
 =?utf-8?B?TTk5eGhBbkFkYjFJQ2hPQUQxcnhlTDI2UXEvVkd5eE9reHNhYjJ0N05oZjZM?=
 =?utf-8?B?VFR6SUwxMmNZSmNUVGcxem1qaGRuVE8wL3p3bXJ0eG80dXB1bHlRbWVUNFI0?=
 =?utf-8?B?SW5VOFgrV0RtTlJlMnMwM1BGZ2s1dks5WHR1N3JrVGZUT0dUVXgzcW5BUitz?=
 =?utf-8?B?Tzd4dDh0TzZDcW9LeUJXcFZodE5qcmI1VDJhc0JMU001ZWpjakVGb1RWcnFa?=
 =?utf-8?B?M09EV1lUd0FrdHhWNmVOZWxSUHV0VmxzNy9lNGdXeWVjNHkxT2NBdUY2YkJt?=
 =?utf-8?B?Rlo5TUhoRFhNcGlSc3VJMFA5aDBjZnJiYi9uWG5TcUdMdHZ4YmtqRHdvUXJh?=
 =?utf-8?B?U1lCeEZFS3ZWSFNWUEFhcWczbm4zTnEyemF5ZTFoL0pBYTJveFNXckdhM25l?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfa16f3-d01c-4329-e534-08dad495aaee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 18:47:31.1532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe4er8rzK8zlngff8rhDgBdiygux/w9PEuWMg0ysugX/QcquDldjSndqRB0DnzPii7U74XQ5A/cGXHBgVup+W/O/nhr8oDDm7UzUdceDqEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6210
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 09:58, Daniele Ceraolo Spurio wrote:
> Invalidating the GuC TLBs while GuC is not loaded does not have negative
> consequences, so if we're starting the driver with GuC enabled we can
> use the GGTT invalidation function from the get-go, iinstead of switching
> to it when we initialize the GuC objects.
>
> In MTL, this fixes and issue where we try to overwrite the invalidation
> function twice (once for each GuC), due to the GGTT being shared between
> the primary and media GTs
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c   | 28 ++++----------------------
>   drivers/gpu/drm/i915/gt/intel_gtt.h    |  2 --
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c |  7 -------
>   3 files changed, 4 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 2518cebbf931..2dbe6ad5c900 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -979,7 +979,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>   			I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
>   	}
>   
> -	ggtt->invalidate = gen8_ggtt_invalidate;
> +	if (intel_uc_wants_guc(&ggtt->vm.gt->uc))
> +		ggtt->invalidate = guc_ggtt_invalidate;
> +	else
> +		ggtt->invalidate = gen8_ggtt_invalidate;
>   
>   	ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
>   	ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
> @@ -1216,29 +1219,6 @@ int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>   	return 0;
>   }
>   
> -void i915_ggtt_enable_guc(struct i915_ggtt *ggtt)
> -{
> -	GEM_BUG_ON(ggtt->invalidate != gen8_ggtt_invalidate);
> -
> -	ggtt->invalidate = guc_ggtt_invalidate;
> -
> -	ggtt->invalidate(ggtt);
> -}
> -
> -void i915_ggtt_disable_guc(struct i915_ggtt *ggtt)
> -{
> -	/* XXX Temporary pardon for error unload */
> -	if (ggtt->invalidate == gen8_ggtt_invalidate)
> -		return;
> -
> -	/* We should only be called after i915_ggtt_enable_guc() */
> -	GEM_BUG_ON(ggtt->invalidate != guc_ggtt_invalidate);
> -
> -	ggtt->invalidate = gen8_ggtt_invalidate;
> -
> -	ggtt->invalidate(ggtt);
> -}
> -
>   /**
>    * i915_ggtt_resume_vm - Restore the memory mappings for a GGTT or DPT VM
>    * @vm: The VM to restore the mappings for
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4d75ba4bb41d..fcbbfed79f15 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -579,8 +579,6 @@ void intel_ggtt_unbind_vma(struct i915_address_space *vm,
>   int i915_ggtt_probe_hw(struct drm_i915_private *i915);
>   int i915_ggtt_init_hw(struct drm_i915_private *i915);
>   int i915_ggtt_enable_hw(struct drm_i915_private *i915);
> -void i915_ggtt_enable_guc(struct i915_ggtt *ggtt);
> -void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>   int i915_init_ggtt(struct drm_i915_private *i915);
>   void i915_ggtt_driver_release(struct drm_i915_private *i915);
>   void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 1bcd61bb50f8..4ec954b6b4e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -421,9 +421,6 @@ int intel_guc_init(struct intel_guc *guc)
>   	/* now that everything is perma-pinned, initialize the parameters */
>   	guc_init_params(guc);
>   
> -	/* We need to notify the guc whenever we change the GGTT */
> -	i915_ggtt_enable_guc(gt->ggtt);
> -
>   	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_LOADABLE);
>   
>   	return 0;
> @@ -448,13 +445,9 @@ int intel_guc_init(struct intel_guc *guc)
>   
>   void intel_guc_fini(struct intel_guc *guc)
>   {
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
>   	if (!intel_uc_fw_is_loadable(&guc->fw))
>   		return;
>   
> -	i915_ggtt_disable_guc(gt->ggtt);
> -
>   	if (intel_guc_slpc_is_used(guc))
>   		intel_guc_slpc_fini(&guc->slpc);
>   

