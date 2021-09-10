Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE41406ABA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569666E9E4;
	Fri, 10 Sep 2021 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E0B6E9E4;
 Fri, 10 Sep 2021 11:31:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="208289200"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="208289200"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 04:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="694758413"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2021 04:31:04 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 04:31:04 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 04:31:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 04:31:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 10 Sep 2021 04:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC0jZjfUCdNHkQHLp+/PE9p5p37jblYFLz0mzvAvXXOABwkUkoLGAUkYS2kdWu7cBntVQoxH6EBtUpwmRAsvC0wJFvlIOS7IpCCPq3q3qvA0hZQdMWqmkvAYS3ayaQRDQdZnTcAgT8U3ZGi+0HKPJsxhQN/TLyjd/DxRL23m6dQWf+2SjiB+5j9SLS6F0ZkEeGabs/8zGjbwaaDZXNhvPtXJK6VfL7Bl5qaU6aHVv7AHgi0pNkjRWJwjibM8z/DZFqIDClyR21hbH6vDOXUDX8u9UrbEuRJCcKMqgpSR1b0xlB/CY+CNGh/fCdMUb7GnPNMWCikEFtiPrK9zbgAsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9iJjfh9mIuYdZcjMO7UqQ47/cJqAacwZjDePLvqTeMc=;
 b=d7WdQlU0DD9oLKrHN2P8FzkeXBumvfoA7ozj5JGzH1bZ4z9FZVII2KzGxylm+8mz7tLFPzNN8L5rUQ7QkQ3lfW+MyPj5aS4j3Z9xNk0qM1QU6wdP/0HIzZ/niAQfjVcP5eHeynM3cyzNhix5ovneeFP71WdHtoqblB/wStkSxO2K5xy1078pjR/dhp/n1/zuzGxPamG8mflZVgcgsKX6fxlMlaFRjkK62fAJ8/yWJ+nX4sU+T+gpiSHBIt72miA57lwaCtZM6yfo3KbVLc2YSXP0wHfDsYrzkzP0Tiqjax657wqz4W1CiDlwM1RU5e3CbAsGja2Wk9VdtgDQqCD6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iJjfh9mIuYdZcjMO7UqQ47/cJqAacwZjDePLvqTeMc=;
 b=HxNXOL+rEC0D8JJF5+bINv/tA/5SnuvMGJygHmLUn1niU0AfxV87qdQ7qcAcF3p7yEOuZyNwOl/+vSsAFEUzSYVuhrg6+1UCAvoJLCXQabGdyT+2pk+uPNPorNSzjWG7DKvTSI/fUJh3UdPM9VhiCl9bQIH4e8ghWuMV8RbkRvM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4491.namprd11.prod.outlook.com (2603:10b6:5:204::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Fri, 10 Sep 2021 11:31:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::2992:dfa6:f8a:b368]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::2992:dfa6:f8a:b368%8]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 11:31:03 +0000
Subject: Re: [PATCH RESEND] drm/i915: Mark GPU wedging on driver unregister
 unrecoverable
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20210903142837.216978-1-janusz.krzysztofik@linux.intel.com>
From: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
Message-ID: <379660d2-0253-5b04-3abb-60397447a4c8@intel.com>
Date: Fri, 10 Sep 2021 13:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210903142837.216978-1-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR1001CA0007.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b7::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
Received: from [10.249.149.238] (134.191.196.76) by
 DB6PR1001CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Fri, 10 Sep 2021 11:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c21927a0-b725-4ec8-868d-08d9744e789f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4491:
X-Microsoft-Antispam-PRVS: <DM6PR11MB4491AFCD40CC3DA6E24D3FEE98D69@DM6PR11MB4491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7wkCvQ3Iq+NYD90xmko7CKXTSd8U1ND0uQcOxMUq4AbtMPXOgR+cWSUILrBpW46nMFZR91oupYaQh/LbWmqoM4TEQvXQXsYm/hNI/5onO6Psn2mogszPhQl7R4sw3CB+dKpjmooAH0Lf6wih+G+HUw352i+pZrjKypMDiQ2Fe8fkqesps5u3hTzYVLnEYuyuodr7lTmElWQxBYlLB6dk2TniGfVxLkhGkvyxXw6IITrpaUZdU7gikE3KXndAIi/O4T3dqHs2uCFzu2b8h07rykc2C31hLP76X60kNKzLFzZqMN2JdfHXzrlZTj8tDGntAwpxo4n7okMqNwbvcJxtHEW3gZ3NGyS7L6eTdgSg9NzVCiiOUFCDvtTIp5feQ0wm3aZnvqTXXjUJi0qO0A4Xf78T72+xdRo9d5/1xduQotLaSAjKQpFEjfbJlJzZJXp2dOhHqvPPp+34wgxpC96FUo/yVz1+NA7wJKHZ8Df/IccfdNulvoiTJ1t+KpOqjjFbWz9Y7MQSp2/v5ekPBaMXYyr3RlyYqfdXV2JiD2Q40PDwIrjYwW8VJdL1NImETRXGvLEEhevXltnviX7OrTTTAt0aa1pFnPHmNZoNI8In17tu2LwYaDCgJifCmlR7bPotio3RhbamvgV4klJdvJ0lShBKA+LjmkU0CkvF6kzZvDjWDsNItt41tzjDiKhcBeFcyh8m4abjVbvtHLtCX4Msy1pK9p8gOMIBZTdSKnK5DM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(31686004)(316002)(36756003)(86362001)(38100700002)(186003)(6666004)(66476007)(2906002)(26005)(66946007)(66556008)(2616005)(8676002)(6486002)(4326008)(31696002)(8936002)(956004)(16576012)(83380400001)(53546011)(478600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0MwMUZ4N1kzN2RxLzFGYWRaZmhRM3lIN08zRnZOSzk4TU1nRFh4UUROOVh3?=
 =?utf-8?B?SGlKTnZsYnlhTkFKZU00K2xWaElRWnlQb1JuNW9mM0hnV29CT3JiNkZOR2M5?=
 =?utf-8?B?N2NIamx3MWJOODBvUndrZXVjRW1NRlNSbW9TdzViK3BZZHJublRKS2ZiZW1U?=
 =?utf-8?B?TmYyQzBlRFZVYWo2Q0dtVWxmbHN3K0M2U2tYemZ5Y082RWdEUWk2dE9SbE14?=
 =?utf-8?B?WEpLbStFdWtmaFRDTVkrM2QxbnFDNXZUbkt3SlhJL0NNL095YzVxWXBUbTBM?=
 =?utf-8?B?aURhYTdSNUM5OU9OMjRzRHJzeUo4OGNCTEZjRVRBVE5XVmJFVUVJSlQ4WERB?=
 =?utf-8?B?Y2xkUGtmdUlmSWRrUnpVZjFvS2FTWVh6RDA1MlJ4RjJMSjZJU3BKMHEvQjI5?=
 =?utf-8?B?R0R5bDhGb0wwYTdFSFI3OWZHaENjSlNVMHpYTHpUbEt2TEViWEFzdWVJQWVn?=
 =?utf-8?B?U1lObmpseEQ5bUF6REtuczl2cmVkVVpPbTZ0aTNGOHZoQm1YMDliR3dxSTZN?=
 =?utf-8?B?RHJCbHBYN0EzU2NRQ0d4aS9SREd3WitCaE9RQ0pmWHpQRHBQc0hiWHdGSWtR?=
 =?utf-8?B?TjlQYXo2Y0RLWTdvb0dZT2NxM3FSNFp2QUl4Ni9XVmpnekJ3UzdYUkNDSlRq?=
 =?utf-8?B?R1hPZVBDMTJLVnRiT3pZS3QxQkpJZzRkUENSdytTR3E2eE1CVEFLQTQ5Z2Uy?=
 =?utf-8?B?Rk5zVlBLWGNuMmlpckhnNnJhYkNsYWNVa0hyMmlvaXplZllDTFdWM3NLclZq?=
 =?utf-8?B?Mmp5cTZ5WnU4b1czdUJacml3RFdHMU5MYVNMc3hGZ1pOOEpLc05PZTltaFQ2?=
 =?utf-8?B?UE1hRGUrR2RoOEYwaVlVT245N0hiRzJzczFsTnlZeGdwbWs5VDhYa0RGTkR5?=
 =?utf-8?B?ckNJK1pMS0RPRUU4aXltZjZveTdsNE90UHJ6eUtjWVozMjFPR1BKbk9KYW9l?=
 =?utf-8?B?ekQ5aEtXenFFemRSeXlITzRhRmpmSXVpRUpiN1htenZtSGZaK1JpNVI3UCs5?=
 =?utf-8?B?WGRrUHk4RjZZMmNvcDNQTGRkQXlDNVRHN1RUUG5WdU51bHdjVWwrU1lEVjg1?=
 =?utf-8?B?Y2p6K2Jrcmt4TmVjQzlGNEpUcDN2VTMyVzd3anhvVHZpRjJzZ1RXQWVDRWZN?=
 =?utf-8?B?bkJZNExxcVUzRlhoZXVWQnJmVFh2K3JiejBMSVVLV1diSWFLVUdFUU4wR0Vh?=
 =?utf-8?B?RCtnSzdEbXlCb0NoUm9Pd21VVjE1cWZDRkZVcXlJOVlGRlRWTU5HQ25vN3A0?=
 =?utf-8?B?bXJ1U0htWnkwWk9LOUxzREFHZWJ5U0NNNE92YWtsQWk0UDkwRzBFVWFrNlE0?=
 =?utf-8?B?UGdRVEVFODZuMjV4aEQ3VGN3RUI5NWVvQ1ZOTVp2aG56bWFkSWg0dGlHcWU4?=
 =?utf-8?B?Rjk1U2kyM2VRdGlwZEg2bnhtRVh6b0dQbnBqTXZuNTE4V0dkcEFyNkZQWFA0?=
 =?utf-8?B?QU5IRGlHVFl4WGpac3FBdEFiMjM4TXNSVnV5SkJ6T3krUUZSTWl6OHVWQURw?=
 =?utf-8?B?c1VpdE4yek9CazF0QkpBaWVGSC9XREwyOTNqY0Nid1FuNU5MOS94MVNqdHFV?=
 =?utf-8?B?bUVtellwbGJ0cVY4WDcrcWtBaTUxOEpvVE1LZHgrSzh3QTQ5cHlJUHJBcXBz?=
 =?utf-8?B?UldMY3pTM2xZbzR1TVpXZjdmVGF1T2tJUjhZcWs0dVoxYS84N3kxY28rNDBx?=
 =?utf-8?B?UVZVZVkyYk5heWdvTjB4MHczWEJndElIbGhnV05HbFFZM1RCcmpid0lKM2Fq?=
 =?utf-8?Q?WIlgdcZxgfVXfyA49IC38yXRRipDrFgP7MkctGW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c21927a0-b725-4ec8-868d-08d9744e789f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:31:03.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQl1Zv+ecptZUbVCm7VyX8WDfrD2tYn1Rs3vNFoKPSdwAZYutB7lBXCZ85jxYNsFeKOgLef8WQgja+nq6dS8g6GeDmwPC/uW4hLJ9OKynJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4491
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.09.2021 16:28, Janusz Krzysztofik wrote:
> GPU wedged flag now set on driver unregister to prevent from further
> using the GPU can be then cleared unintentionally when calling
> __intel_gt_unset_wedged() still before the flag is finally marked
> unrecoverable.  We need to have it marked unrecoverable earlier.
> Implement that by replacing a call to intel_gt_set_wedged() in
> intel_gt_driver_unregister() with intel_gt_set_wedged_on_fini().
> 
> With the above in place, intel_gt_set_wedged_on_fini() is now called
> twice on driver remove, second time from __intel_gt_disable().  This
> seems harmless, while dropping intel_gt_set_wedged_on_fini() from
> __intel_gt_disable() proved to break some driver probe error unwind
> paths as well as mock selftest exit path.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
> Resending with Cc: dri-devel@lists.freedesktop.org as requested.
> 
> Thanks,
> Janusz
> 
>   drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 62d40c986642..173b53cb2b47 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -750,7 +750,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>   	 * all in-flight requests so that we can quickly unbind the active
>   	 * resources.
>   	 */
> -	intel_gt_set_wedged(gt);
> +	intel_gt_set_wedged_on_fini(gt);
>   
>   	/* Scrub all HW state upon release */
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> 

