Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24D496555
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 19:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E0B10E4EA;
	Fri, 21 Jan 2022 18:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606310E2BF;
 Fri, 21 Jan 2022 18:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642791238; x=1674327238;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lCY+bD+Odx7SlytqjDZGuvzpD9GqYgo+xT+TmMSIGIY=;
 b=fJnOH59FLbAnsTHb2g0lWL5bg25KoI3ZfSF34lsnK3PuBwIdN7MltkGP
 DnhQXDkrTLp/dOlVRNIuzsGMpuj7a1xdKvgvGWSy8TIhYq63Bmya5QMTh
 pIdXpHz8xAosGn2aEav4sW/iHb0C9kQcIe3nht/FCBUChbEROY4X/7NfG
 BeDxN756p122/bPjzM0Udspkae5j+rC2mV3Ck/T42dfOqmjOL+b4gIq/S
 Z4JXBKazyn1reOBLggX/qg7p4X1rzW1BE9EsL0Wjjnlne0GcOKAFlmlgG
 YmmVcpGUPPQ0rT9U7IkPy4JV/zkn78XEVl477yH+bd/UO9PsatzAeoXYg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="225707350"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="225707350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 10:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="561970853"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 21 Jan 2022 10:53:53 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 21 Jan 2022 10:53:52 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 21 Jan 2022 10:53:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 21 Jan 2022 10:53:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 21 Jan 2022 10:53:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQKxRG5NGOWpEoFOdzRLOCgbL2fDRVXazZ+6DUQX3foeuSqXd5JVrwJAIIxHXyFM9+/w2k6/pXiV6pkjYJ6g/kPxM5R4e2LW2xpJprBYGF/OlzifuLfgtyDpBldZ1uH0KhuQlYj+h5glGcBv614IZqbYrjF/VetLZ3ZA5xBP6oo4YBa9Ov8rq16NxIg+cD4zRmYWWGNPJtHE/HF3jk//HcF5kqJSTfU3yn9hGzyBXJd4EafIgQYd4KPX9URKiQ8uh7RmbGBzTLri5WYaUSTyk9nOhh8YtOTQA9uS9fWO+ZWDk25lBOHXi/My9bwCNjTYTIgOBYAMK0nYfzbUWcJArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3LXSP43m1A5+2rPRKM0fsnzZoJpwq+f93XIqXdT/Lc=;
 b=ZXKTJB44vr1qO+91ZK39lJn0wlmAMKTY3yw3sO+WAtqRHyp487m3duSDJOBBcxWnly3KL0fMa2157BOZkJTMHsDd+D7KIMIHgsHVHnlZ/P24PA9bKYQpjtW0+i8ott8so92MY/UtH2Occz+KChuc6nNBhDAgC4vCoz8FKsWMzDMzeX08nOB1gbvL1Z8DYVZZGO+bIuiM3Gyf619U8C7WmhfG7OAppYSQ+sSPg1qzrfc6d55SBvHlbAr/jAfzn+VnQ9Xu4ZWAaZHGd5ISuCM1rAfuoT5Gk/LMEUPbOOGkWLjjXk9SZwq5/TLqVa3+/QRRLfS0IHUateXNDhnvjzODkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB3788.namprd11.prod.outlook.com (2603:10b6:5:13a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 18:53:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 18:53:50 +0000
Message-ID: <02b4e901-cdcc-1c95-3ef3-03b0c1e698d9@intel.com>
Date: Fri, 21 Jan 2022 10:53:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220121043118.24886-1-matthew.brost@intel.com>
 <20220121043118.24886-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220121043118.24886-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR04CA0151.namprd04.prod.outlook.com (2603:10b6:104::29)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c8c82d-5b46-4443-d041-08d9dd0f5cb3
X-MS-TrafficTypeDiagnostic: DM6PR11MB3788:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3788976BF6CEEDB68C3C12ADBD5B9@DM6PR11MB3788.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WGDXoK/qFyNlxtac5na1pCxD1QjMKEwK71krOazniCrtahOKpLMDvgZJz39/jcR4vRpDIAPdOoSFFAbj/wylxuy9VJE8GHMapwsz2qqgvpVMQjCVI5cT3OnpD8vRYOzJ35sBJ97RICRg2LGxsHhRKlL0taKU9JtSQFBXw2zt7lPZbVF+o+fk/DI3AoGcw/EjkExkV7M3yYspQW6quiXI0hf3IH11PqmNWqC2sHcFsUcdThjDBsgnsCWq3/aDbXzSmZ4fLCdTPJ8cIztR8xbLsCKNgHRSO844awTFt6AGPn8FMmv3IcV6luAoINgKFbImBTgfUJrpQvGOdviOo9JWrWcV1im5zjJeDakKf457/Gac58zJgtt2p18B047tarFu5pLmrFnuRcbsKxFglE4LCSlpJRkJYbjQZtBzGr4Ke1fLhvs0febM7iI+eVUiP5FCAxHPl0hME9ksrl6nfRyjXu9/2/+Ocrns6Zyga8wJFIxETWLgAm+PTy/VHdxp8RbQnyRFRSORGLt7s2UjS8pJDJ9WYgkrPFbnmyLp2TmdyywJgaLNU2AX9EsVDcNlc+PTK9L7GPaxfYB4TBdKrGtxAc1lEuKhjlDG2REVv0npGrwn3Bi2cLLKET1V2sZcPd3jmuPNGZ2NBbFQYWe/wBS+jQJufoYFtHAIJOvwvA6NKThgN8WZb90wFZ8VR2iWEPe8sme9vcqSiLhjgWoSmwCYraneWRJlCMIwfwkg2ccRuhYvCngJ5hLBJfz7IsNCGoUH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(83380400001)(82960400001)(8936002)(53546011)(26005)(6512007)(6486002)(66476007)(66946007)(66556008)(5660300002)(2906002)(38100700002)(31696002)(450100002)(86362001)(186003)(36756003)(316002)(31686004)(6666004)(2616005)(508600001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkkyM3VGa0p3OXlKWTkrZnBuYWo0TWtKdTQwOGNRZWFlMnc5aUUwZE9sNTA1?=
 =?utf-8?B?eXBIM29DK1VwWUpsOWVCeFVnVkFHZFV6SnEzcG0vc0h2d3B5amEyK2R1OVFM?=
 =?utf-8?B?T3p6enNyNlJyTUZDc0dRVzArTXAwaWduc0tnS09vb2JoZWtZVkQ2a1lJVDMx?=
 =?utf-8?B?RUpnSEl3d1BFL2tHV3BMZ1dOK0JRTUw5Zlk0a0dZRWVaNXNMTGYyYTJoR2N3?=
 =?utf-8?B?ZDBzcXZ2emRFVUJzUVdoOXNuZkdTNWZlZVV0cnFrd25pTThWVnF3NlE3N081?=
 =?utf-8?B?UHgxeXhwdU14cXdFY213eElPM09rUUdMWSticDRlREpsVEswZTNJMXRaQ1pt?=
 =?utf-8?B?N1ppaDVVdk1aSkFrUGZaNGRZVjhCMFlkT1ZtUWRCSlQ4NWRZbkdNTzlranln?=
 =?utf-8?B?S1lKSVRQYnBHVzV0MWtxSy9Mdm5aMUpjUlhtb3JVWFBmYysrQUM0bEJWTllD?=
 =?utf-8?B?Ky9qYm9QNk1vUURDbXFDaUFFLzNpdXB2UkxKMnFGWFVRTWtIdVgvNkhRaHdD?=
 =?utf-8?B?RFFkbW9mKytVVDQrczNQaHlzWGRLdlRVK0t0d0h1YlpKc0wvWDU3UjB1bVl3?=
 =?utf-8?B?Tk9iZW5lbnNwdjZSb0IzdjJQNTBNZ1FNa2l1dkFjeStYcWYwUmFDb3VTaDNi?=
 =?utf-8?B?Rlg5Yml3U2pkZENYdDYzcHE2RU9LYTZ1Zm5UU0hXcXpJWWtJcTBIc3V2czNB?=
 =?utf-8?B?ekxCR0w5R2I0dXVKeWFnWkVHYWpVZUwwUWpHa2x6aVpVcFQ1WDBZbm9udVd6?=
 =?utf-8?B?T0NkWTdiRC83c040UEF5T1lKT0lhaDZOTjFTOWlvSVo5WWphNEYzd3RNY0hG?=
 =?utf-8?B?UG80aGhWR0VzKzRDVDJCUGRzL1lVOGR2cStPZGRRbDMxNjNNNVBGSlVJNEJy?=
 =?utf-8?B?a21SLzJ2RzFiNEV5b0FEOXp6U1FzS2YrdnVtWUcyb1hSZXpGWDRSSk9PV2dl?=
 =?utf-8?B?QjM4cmpaVEdVSjhML1M4N2dpbjU5akY5Vi9CVUpsRVVLNGZpbERMVGJEcDg3?=
 =?utf-8?B?dEdGYWFFRnhHVWt0S1F6ajB2NS9wbnZLNnVSa1lUZVI0VTFWaDE3OEVYRWda?=
 =?utf-8?B?amwyRlBvWjdrK1Y0Nk5waXEzVzRwRzliOEsraGxIOERVZTFNbkQrY2Y2dUln?=
 =?utf-8?B?MEVWM2dNbXFvdm85MVRpQkwvV1Z6UU93bkF5QVlUWnRTZkNUR1ZkVE5FMnB0?=
 =?utf-8?B?d3RuVTNCQ3hjNkxEQXk1czhqMm1sRSt0TmRhemdDZEtGWEk1TEUyNFI5NEJ1?=
 =?utf-8?B?aVZmZ3NYMFlrQVJFR284dm1ZMEptWWpNajlxN0JDc0paNkllZFVUVHBmTGhT?=
 =?utf-8?B?WjQ2UXNYUEFINkxwbmVUOXhSNnRqQzhpM1dyK3lQUU5jYUgxcTZiZ0c5Qnl5?=
 =?utf-8?B?VVY0QmI4Vml3cWhWOEtMZkRnK2hkbExQQXpGWk5aNmJBZVNObGpmdFVWZU95?=
 =?utf-8?B?VXlHVVI2c1F6ZDBVVXNFMWFabzk3M2xWUktYcVRNb0MwVTN1bFRjb1NaUmtN?=
 =?utf-8?B?aFc3QzFQaTQyU0FjbGRYWVJHR3N5dzNXS2Foc0hJK2pJTThueGxGc2RDK0pV?=
 =?utf-8?B?R2s0TkRUYXJWUzVtSFFQYlVzNWM1VGRCL3pHRVkzbVliU1B2SGVpdGhTWm5W?=
 =?utf-8?B?Z21wVWNHODlTNTNZMzBodUR0aDNHZGt6Qm1GYjFhamF6NVk0S3VjTWJqSUNt?=
 =?utf-8?B?TEZOQUtlZnpObGtYazR1d25XaG8vcklrUElLZjJ1MXlsMGZoWEIwWjJpeW5n?=
 =?utf-8?B?bHZRbTgra0haaGVpRWZzT3JrN0d4RDd1eXhnSkhpeHRFR25UZmJhVzQyVW54?=
 =?utf-8?B?NUFUNThZcXlwWDkzT3g4clE4R2lLcTE2bVZXOTFLSzI5V0dlVWVzSXpDbmp1?=
 =?utf-8?B?UFE1Rkt5azM0WkdtbnpvbDRVZWl2a244eWJHUkJmaVV2QWRpakdLdVpiaW1U?=
 =?utf-8?B?NnJqSUttSzJkSG93MS80T2Fya3g3VnlPSUI2eDRHZlhYOVMrTDdGSTR3Si9D?=
 =?utf-8?B?c0g3RlFPZ01UakRqMHk1Z0tWQmR4bnZKdXplY2FkcEhtTCswMi9Lbk9WYW13?=
 =?utf-8?B?djMwYzJ2SUpNTE9DUElhN2lRNHVpd2RuTjcyYlZBT01oR2JraWNFdkZ2TlVT?=
 =?utf-8?B?QlVTb3lXdVlEaXQyOFN3ME1wYWlUTmNUaHltYjU3WjZPRFdhTVZnbDR1Nld6?=
 =?utf-8?B?blZOcmQxOXJVWWVLOFFFc3lXWE5keXhEa2k3QmNpWm5WQlRYbHRXUElzd25W?=
 =?utf-8?Q?80DmkhitEcRsYZEX5q6uUtgXhhUgFuoPW7Cp8m/0e4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c8c82d-5b46-4443-d041-08d9dd0f5cb3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 18:53:50.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uv8jOC4daVJ4BiPAUdf1NT12HNCaOhi0fXjwE37vgrniYAFtpZtHx+cafKFwQUwM0PXjaHcgA0y3s7eWaMwk457USBUq+fME5LOvjd+H7r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3788
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

On 1/20/2022 20:31, Matthew Brost wrote:
> The G2H handler needs to be flushed during a GT reset but a G2H
> indicating engine reset failure can trigger a GT reset. Add a worker to
> trigger the GT rest when an engine reset failure is received to break
> this circular dependency.
>
> v2:
>   (John Harrison)
>    - Store engine reset mask
>    - Fix typo in commit message
> v3:
>   (John Harrison)
>    - Fix another typo in commit message
>    - s/reset_*/reset_fail_*/
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++++--
>   2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 9d26a86fe557a..d59bbf49d1c2b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -119,6 +119,15 @@ struct intel_guc {
>   		 * function as it might be in an atomic context (no sleeping)
>   		 */
>   		struct work_struct destroyed_worker;
> +		/**
> +		 * @reset_fail_worker: worker to trigger a GT reset after an
> +		 * engine reset fails
> +		 */
> +		struct work_struct reset_fail_worker;
> +		/**
> +		 * @reset_fail_mask: mask of engines that failed to reset
> +		 */
> +		intel_engine_mask_t reset_fail_mask;
>   	} submission_state;
>   
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3918f1be114fa..9a3f503d201aa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1731,6 +1731,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   }
>   
>   static void destroyed_worker_func(struct work_struct *w);
> +static void reset_fail_worker_func(struct work_struct *w);
>   
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
> @@ -1761,6 +1762,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
> +	INIT_WORK(&guc->submission_state.reset_fail_worker,
> +		  reset_fail_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> @@ -4026,6 +4029,26 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
>   	return gt->engine_class[engine_class][instance];
>   }
>   
> +static void reset_fail_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.reset_fail_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	intel_engine_mask_t reset_fail_mask;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	reset_fail_mask = guc->submission_state.reset_fail_mask;
> +	guc->submission_state.reset_fail_mask = 0;
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +	if (likely(reset_fail_mask))
> +		intel_gt_handle_error(gt, reset_fail_mask,
> +				      I915_ERROR_CAPTURE,
> +				      "GuC failed to reset engine mask=0x%x\n",
> +				      reset_fail_mask);
> +}
> +
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
> @@ -4033,6 +4056,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	u8 guc_class, instance;
>   	u32 reason;
> +	unsigned long flags;
>   
>   	if (unlikely(len != 3)) {
>   		drm_err(&gt->i915->drm, "Invalid length %u", len);
> @@ -4057,10 +4081,15 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>   		guc_class, instance, engine->name, reason);
>   
> -	intel_gt_handle_error(gt, engine->mask,
> -			      I915_ERROR_CAPTURE,
> -			      "GuC failed to reset %s (reason=0x%08x)\n",
> -			      engine->name, reason);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	guc->submission_state.reset_fail_mask |= engine->mask;
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +
> +	/*
> +	 * A GT reset flushes this worker queue (G2H handler) so we must use
> +	 * another worker to trigger a GT reset.
> +	 */
> +	queue_work(system_unbound_wq, &guc->submission_state.reset_fail_worker);
>   
>   	return 0;
>   }

