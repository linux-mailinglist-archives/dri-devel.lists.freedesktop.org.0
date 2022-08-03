Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F43588511
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 02:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220E90053;
	Wed,  3 Aug 2022 00:15:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239BA90A43;
 Wed,  3 Aug 2022 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659485710; x=1691021710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RVSRiXO/haWFMpn4Az1tWELBIXWf+qXL4gLxqJqcZT4=;
 b=e6hT+TQLnppaUF2UBKI0gZnuyhG+Sh1DgfxS6xMSnh2kugg2dR46x4V7
 obffSCsR8/YXgryvK1/gKdnjrPmTUS0Qm46tqmCjzGWznqqnN48oaovN+
 StS9XY/UvTJCiJWysp/qhhWjpGQXjChF6iHq+Dn2d0CmLMYnAXNKCFksE
 4AX5GOdenJfJGPkVeNAAscMjlWlAeLadOMhykSky74txYPTxivt4QQ8pD
 Nvki8Rs3GurJAQgB3pytiQhT3ivCoqRpyEK7qeIBLk60AW52duW7ZUwFq
 Ev1quMQC1JSbsk01MTaCgYwOncYDywZ8VopMyetg5op/dCG0GguG4kxUh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="272595509"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="272595509"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 17:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="670648703"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2022 17:15:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:15:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:15:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 17:15:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 17:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwa4MeZJaLk9jWT8dgd2yyJhA0ncx8qo339i6qzBh5kUAIVw0YwDljsqkWOxmDpsP+g62HOA1Q/ltSaiRee65OJSDeODLgxAS6ZnL3K3EAKpUvU7QfTnFkkFuEiE3pRSisCGyOB9E7B03LF4lpXxbbzWAEgzqkhZKjB2pJDLjfEu5htWtRs7dcm3AhnLzAKUtuo+EztgvfEtfq7OZRssiQFe2vcFrr5razoFOMCegwxj+IYDhGAZmj+wh9NyIbfVhZg2f75+P20vzs+CN+VYXg72KfBiLM88g17B0UNcqcoxUjIRH0b9W8a+zB8Bv7FcMLLcMz/5mR7kq5jIfJJZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KY7+6d3d7yk7y0Cq8N5/XOQW/UseAFQV5m6MvBh5+8=;
 b=Ni6GNHCXVSn3bymux/AbyWGkwykt5HFUuxdIqiJJS3P/74KjHq5Zw6EcEwFHKmBHeoxHsDcLil0hm+6M7JhnSSm/1HgYjMdTpjkf+t4iDqHYwTlwJVSqDH/HLiIXfB7XZHSZuBd3ft+o1vX9daDlA+rqpSu3qMcpYpEs9w7OmVyMBIGN4hHGHv1o5dLCu+PLKU7NUcAf+vokh9wqThyUiyxPWTK0lIg3XIsClwR0wWY/64ABw+3OUvWoeM39aEYbjaFYSc6jLRiSySV42AAQ0/iKmep1LhR/rbGd1v80AiBQxGJuGcJfCo6cWRd5IW8+FC9wKg5ja8CUInr76aURoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3496.namprd11.prod.outlook.com (2603:10b6:a03:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 00:14:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 00:14:58 +0000
Message-ID: <09c31e60-c155-2bb8-77bc-1266ab73ab8c@intel.com>
Date: Tue, 2 Aug 2022 17:14:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/guc: Use streaming loads to
 speed up dumping the guc log
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-6-John.C.Harrison@Intel.com>
 <2c7675a1557691dd5546ef2bb36ad9190def37d3.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2c7675a1557691dd5546ef2bb36ad9190def37d3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ae6d3c-4885-4b13-4502-08da74e53365
X-MS-TrafficTypeDiagnostic: BYAPR11MB3496:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rddjYeCBuB04nVKrHdSNhHA9lcfz17tdF52lXUrkMMT6aqL4yGUu0RilyWw2vkzrQGcmCPM1P/zAAML41pSRUyXVkVtFgT8/3Gby11PsxhaR8aiNyQRBNa1RkeyTL+xD55hcDM4i8ud1Oq2PfNGKypt6GZcs2gS4HCwHtzXI3qXJRvxkrfBY1MQA5MXBnUICbh7Eyk53C6jOgCt/uE6IkPfd15ark+mI3nMyZV7YCsmKsIQLPsKBmwadesSD3UvZiM72HOFlT7F2EP8v6m997OFgtceMPkSgCEJHPtofV2U9aGExN1IvKZZVUFwkkuqe0Iiotx5JsmqFFFjPPBavfxakdj5VicJii2u2ffZQmrLxk+clGOXUF5Gr4PGWj7UVx9vOr9RbD8Tc/WtahsoF0ynf1foO5mqZJr/st6fxNjKHos1tG/ySMJThacQxr/MiICTFKX4OkpN7q4CmF64WDKj5cAcHQepJGzKIjqiuq0piVg6d2zpRGrtr/NW3vs2E/uTJOf5925dIIVzAbWkP0ztb1h5+LUONEOorXaEbPTtiEs1SCA/eLRgovs7+d7XQtPTusDK5vhlju3r8E5iJ2nZeBbb+AllFCFFMkW4peN3Mnt1+0mbgKk3XoBerSx7/qgUS7TjgNwelNDFWVdMV7ChZE9pH050arehuV4dUBBiSgAUcXUW7LJ2+60FVSBcbOyuf2nLwJ1bgS5MdWbvotATBl92+ESe6pccJrXxVkPA9U2q+mCXRlaodEhYfoGvVt2LQNdzRBAYlHYkHSrWdYlRmdNAVfE9khvJ9F4ZjOXf5gDU7l6BT7ady5ibvfG3gyYj0JZs5XaHrBO5SuVu/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(6512007)(26005)(54906003)(4326008)(86362001)(6506007)(8676002)(53546011)(66556008)(66476007)(31696002)(66946007)(5660300002)(110136005)(186003)(82960400001)(8936002)(38100700002)(316002)(2616005)(83380400001)(107886003)(2906002)(6486002)(31686004)(478600001)(450100002)(36756003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJWajhmSHBtYXJuTnp4YmcwdEpvSmZ0eCtTOSt4Rm5FNmo4bmFGWFpsc2ZK?=
 =?utf-8?B?TDVxbEppZzF4cVdsL0h6bUh6Zks0UGhhUzhwb3VjUFRQcVU3Y3l1L0h2WG0z?=
 =?utf-8?B?bzZwbDdyZjg5MWVZWWp3Y2FDV1B6ODNrdHpCancrSHJXaGpnZnU5NnBqK2NV?=
 =?utf-8?B?OTdoWCtQOUUyaTlRVndjeHBDN2RCTXBNTE5oY25ZTFE0TExtL0E2aEJSbk1D?=
 =?utf-8?B?RGNvWUtGNVdHMk1rNUhQRzlHZVVVbzEyN2xLWUs1Ynp4a08zQ3QwQkkxa0Qw?=
 =?utf-8?B?NzA5TG1zVHhuUWtSYk9JMGo5WkVDN25NNzZEaWNzRTNUME9QNjlBSUZ2blVy?=
 =?utf-8?B?N1RnREdCM3N5OEVWeCtnV2ZKSUNGckgzQ3BYaXJFV2FnUXpCMU9GV0tENkh4?=
 =?utf-8?B?WUFMcTh2QkE3WFBJd3RvVFlyN3N1c1dxbmNKTUJDV2FmdEZtTGNzNUNDdkp6?=
 =?utf-8?B?NFhEZFRpeWhFdnNTVUZwLy8vNEJwVEh4WFFlcFpVQVFFOFQ5WjRoenZDZ0pI?=
 =?utf-8?B?WHBUNGlTWGhWZEMzVWJrekY1MGdEeE1GQUlxdE1nY0JHeHAxMUUzVGFxMnFC?=
 =?utf-8?B?ejI1cmJzNkovdEc1RzNWRTlpZlpmR25nOCtDT1F5eHh4MFQvQkVkclZMMmww?=
 =?utf-8?B?WEIvVUt3c2UyZDdDdFNRK3FiQ3l3dWk4QUs0dlB6U05jMVJLanNsWFV1cS9V?=
 =?utf-8?B?aFJWSUFJMy9uVjlrbmFoeFhvQnMxazFNZjI0Mi9mQnZFRmoxcDJYUndrSGl2?=
 =?utf-8?B?VHUyT083ODBvM0J6RHZxVHVKOVJHajIyczBzSlh1SC96QWhORkVhL0lWbDZp?=
 =?utf-8?B?OGtuVlZ1aXlOS0k5aEhCUVR6cUpmQmQxSzJiQXVRSG50L0RFWnRITWkzNDFa?=
 =?utf-8?B?S0R3c3pEVCswNWNLcjI2ZW45VUlESmxFOGRJSEV0TDNPUENrUzVITGV1cnBS?=
 =?utf-8?B?M21tb0F1d0lrYm1XcW5WeDEyeVdUbCtLMkdndFBoUCtYV2wyVDA4UnM1am9N?=
 =?utf-8?B?TnRBT3Z6dHJHYXpCWnhxM1Z3UEhQT3ltb0xDL0VCWnBkNzc3eDZEdzRla1Fo?=
 =?utf-8?B?eG44aThhbnlyLzcrOWFGQ2pUSTFuek16NmZzVnkrN3BRQXE1RW5WdlgzNmlx?=
 =?utf-8?B?UkU0MGdnS0dFbWMzS2VpQzdZeGdkMkczNVpzNVc3YWlNNVdnNVQvQUFoemxq?=
 =?utf-8?B?dDFleUtiVXlwNDNmVmZvek9vVnRSUHJORWdPUjR4TW1lOHQ0b2FtUGhmNEl4?=
 =?utf-8?B?UnpRUzd1SEQrOUpqdWkyeEgzclYva1N0TDZaWkRUOEdKeUhrVk56Z0EzYlRi?=
 =?utf-8?B?ZjAvVEJJb25lV21Sb1BrZFlaQ01JU1g4b1Y5TURlQXpqSXk1Q3k2NWNDaDRi?=
 =?utf-8?B?R1hmNnpHUUovNmlacWtVUmZFNkluajR3ZEROUWF5bTJPQndrMXJEclpCRXZo?=
 =?utf-8?B?Wk1hMWU4eW5PQTdjZk9NMW50ZTdNQy9BZDAwNjVRUXV0cTNSeVBsT2pPOXFh?=
 =?utf-8?B?Y0poeURlYUVmclN1YWZUWDZGY0VJYmExWGVEeUxRdWxHQmY3S0pwUDFSRHRp?=
 =?utf-8?B?QXorU0lKd2VjNHNDM01yclROZHQ0elBXYnRNMkk5d2hqSEFkYk9Db1RFamkx?=
 =?utf-8?B?VllGZW03Mmk4RWZ3NjFsdlEwOU11aWJKalQ2U2g2YXRBcnkrUjZoc29idG1Z?=
 =?utf-8?B?amtMYlh4NThJeElOckpXVnQ1eDF4TUxoSEhYajJLYVliWDhRNGFFOFdBa3ll?=
 =?utf-8?B?VmtOemF5QmdvaDRDcUhTcXVtYzBHdkhjeXlUSTJsckNuWmJMMVJwRTVqOC9S?=
 =?utf-8?B?cW80NEtIbGFSUnFSMUNLanJNWC80UVRHeFhvU3ZMK1kwdGFjUWtQN3ZWRlBW?=
 =?utf-8?B?UXBtckl6cjlmWHpEcHhOVUNYbThMM3FQS1dxWW9Eb3I5RG9kTzI4TEVyUVBJ?=
 =?utf-8?B?Tk9wcEh1YlVUN2VxYkFZdUMxWHlMV2tCazIxL0NpL2haZktZRitsTllZNEpa?=
 =?utf-8?B?WFdvWnNCYnRpNGltaHNRV3FWb0lDSXVZbDB0MUZuV0xMeTYvNlVLbnlBcjc5?=
 =?utf-8?B?OTdIQ0Z0TDhOY3NRdmZjMzZHTW81dXJ0ek96ZmdVa1Z1ZnlWancxNUJDclRW?=
 =?utf-8?B?bDhxZ3gwbzY0TitqcGZhRW4xVVpsc1haZDNWVDh2UmNLQVdNSEFzVVVGeWpH?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ae6d3c-4885-4b13-4502-08da74e53365
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 00:14:58.6672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmto+aOqMMxgM8vXGWNLaMmcLTcBg/yJQSI56qoohUY2EkeZdxoX40FiCE/Gps712iGE6nCS+wpWyF9NlW+51RDbrxcP5uWMJhfXNBTeP2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3496
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
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2022 11:48, Teres Alexis, Alan Previn wrote:
> One concern below. Else, nice, simple yet good optimization here. :)
>
> In the interest of quicker progression, I will provide a conditional R-B if you can either fix the issue raised below on
> the way in or provide a reason why that's not an issue:
Not an issue, but code changes like that can't be 'fixed on the way in'. 
Tweaking a commit message can potentially happen when merging patches 
but not code changes. For that you have to repost for CI.

John.

>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Wed, 2022-07-27 at 19:20 -0700, John.C.Harrison@Intel.com wrote:
>> From: Chris Wilson <chris.p.wilson@intel.com>
>>
>> Use a temporary page and mempy_from_wc to reduce the time it takes to
>> dump the guc log to debugfs.
>>
>> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 24 ++++++++++++++++------
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index 07d31ae32f765..4722d4b18ed19 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -750,8 +750,9 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>>   	struct intel_guc *guc = log_to_guc(log);
>>   	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
>>   	struct drm_i915_gem_object *obj = NULL;
>> -	u32 *map;
>> -	int i = 0;
>> +	void *map;
>> +	u32 *page;
>> +	int i, j;
>>   
>>   	if (!intel_guc_is_supported(guc))
>>   		return -ENODEV;
>> @@ -764,23 +765,34 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>>   	if (!obj)
>>   		return 0;
>>   
>> +	page = (u32 *)__get_free_page(GFP_KERNEL);
>> +	if (!page)
>> +		return -ENOMEM;
> Alan: although unlikely, its possible that user could trigger debugfs mid of a gt reset - not sure if we need to use the
> "uc->reset_in_progress" before calling this allocation and return a different error in that case like EAGAIN or EBUSY or
> ECONNRESET.
Doesn't matter.

The issue of thou shalt not allocate memory during a reset is only 
relevant to code that can be called from within the reset path. As in, 
you must not do something that could block the reset from completing. 
This is only debugfs code. It is not called from within the reset path. 
So if it gets blocked waiting for memory to be released, no-one cares.

John.


>
>> +
>>   	intel_guc_dump_time_info(guc, p);
>>   
>>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>>   	if (IS_ERR(map)) {
>>   		DRM_DEBUG("Failed to pin object\n");
>>   		drm_puts(p, "(log data unaccessible)\n");
>> +		free_page((unsigned long)page);
>>   		return PTR_ERR(map);
>>   	}
>>   
>> -	for (i = 0; i < obj->base.size / sizeof(u32); i += 4)
>> -		drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> -			   *(map + i), *(map + i + 1),
>> -			   *(map + i + 2), *(map + i + 3));
>> +	for (i = 0; i < obj->base.size; i += PAGE_SIZE) {
>> +		if (!i915_memcpy_from_wc(page, map + i, PAGE_SIZE))
>> +			memcpy(page, map + i, PAGE_SIZE);
>> +
>> +		for (j = 0; j < PAGE_SIZE / sizeof(u32); j += 4)
>> +			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> +				   *(page + j + 0), *(page + j + 1),
>> +				   *(page + j + 2), *(page + j + 3));
>> +	}
>>   
>>   	drm_puts(p, "\n");
>>   
>>   	i915_gem_object_unpin_map(obj);
>> +	free_page((unsigned long)page);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.37.1
>>

