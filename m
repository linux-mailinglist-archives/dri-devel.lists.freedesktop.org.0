Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63B478059
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 00:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621B710EDD9;
	Thu, 16 Dec 2021 23:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5610EDD9;
 Thu, 16 Dec 2021 23:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639696435; x=1671232435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eQfx2v6T35hc12n+XAXjN+ceqqW4mOUBcfQjMDYM1cs=;
 b=UWhI4I2zXNmmTJj8NCqsfmIZ9u9amj4XTImnWJ6aO6zG0kHqX/ecj3DN
 77+5lnR3mqcfkVijFkstRQls3scSqYx03Ke21qXh4bKWqGCSbCt9ckQrJ
 FCJE8DShmrFLrEhMat/raqHPWpn13repmrI63AXSm16tUpSpH9ZsvXlBu
 O6gF8jer63zv+NI+dvRR/82vysytTP0awOoxBZMv1vybMvD+7uLUsDlte
 k4JIuLnLrqKlnKRVVtFwGKm98BIPx0Sx3yDPn4tCS9XbCBeYEP8p7TW2j
 VUJjBdjtpM+6monuWSGLuDx8e214uPtyRS4RSSbFvR0r57G/NX1ZKSvyU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239576057"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239576057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="506534386"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 15:13:54 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 15:13:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 15:13:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 15:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2tvwHuKLQenoAvKLvGC0MN8CClKNI96yLXhTYMp02PzvqtFSZtgyagLjQwrfan5l9pwZuVFinSegY5SAETXEw+c7Nrk5079Y/HZEnBNRxOHqEN63DkXAJ4T3dXqVd191vTwhAMPNIdEp2vwkmNSeWvD37anpIGbBHHBQwJmjkOqQTESLtxsqEUAqSRiYdeGRgv0FnhbV2p73UNWnMItgH+zdenXwEcCha7X+dZnY4h493UBni1ZR7fUJzy75BYLFj64vnr2jpMVOrA15tuKebWv2Izz8xx6ZdDsQ+Zm59pQKGoUy/mfr+oB+z0hVbjUZt0qDUll0aJ6D2qEszygHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E00XklI3mFGjGs4wh5xRGKqYfjlxGJHrcR+g396Ry+c=;
 b=B+yQBTcGhEVX8b0dGZZDXx/nvhJEJ7gRMZhr80YYCbJ4skc1u8q5esqvdtG1nPf17IQRY6jRe7PT/69DUqlMuyZZN7s7D9H6EzDbBJYjm+ZzKDioQp3wBfPx8J46NHUr7wdQf+BiwVhraKTphn/1bMy10wHtwPwjTtE4iCHEuHnEpcggf9qmKEZX/rdFuKBqfk8H600m2/FwuNE7ywqf9oxo6EdVal79ff+YADTJIbg/fDz+j38inwL7ev/7vk4x8p/GxaG4H/X9JsBGMEHmYCQSjU8HUw5iqv/4RX4MAEOujNdMFGyI0rmc452Le15JipiYjQA/F/AwvslOqE3c/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Thu, 16 Dec 2021 23:13:50 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4690.026; Thu, 16 Dec 2021
 23:13:50 +0000
Message-ID: <54a5f02f-e03a-1211-4f20-b41ecc1691ca@intel.com>
Date: Thu, 16 Dec 2021 15:13:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v8 12/16] drm/i915/display: Use to_gt() helper
 for GGTT accesses
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-13-andi.shyti@linux.intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20211214193346.21231-13-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
Received: from [10.0.0.208] (67.181.129.204) by
 SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 23:13:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27b3386-f147-4815-ee94-08d9c0e9b851
X-MS-TrafficTypeDiagnostic: DM8PR11MB5590:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB5590093BF34AF25D796FFDB08C779@DM8PR11MB5590.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvAq/TmK6x0QIcRanGUsR8ZZ6fPFJmI11MFUrpF3zuEBjLy3MUNNrfCAidC9++EHPMrGrGrMi9X/DEW4biE7ZVgg6607t9rltlazUqwOL3zKrrYU80/Hl5vstutC6Ukxyed4qHcMUNL5Rb/nAjWT7/A9Ao/XxQ/3WXkueVcQDTFdNeN5uDJldbZ0HmZwHutSOB85mvCaSd46KMRIOvK1Ij9NZoKMvHphfsyWSJNv6QN4ZehHp0vYj9ZAx8/ut52CwirBdOTmcTpuk7PqqsgrJaYLfll7/F4qavLbrkveLtlW9JDLhK8wgR6+l6bVCeKkzcJxGwt8PyVg4ZcoTwJhoY14jkkV1V6jjCGCs7RWTacJ7hr3T4EUMfpc48odFbrACo2g8mVkQKcR2Vu3sGZBz+mCjWmTAX60OdEVKT0FsJHw2hhwNdcMD6fF3mKaxd3a8e4XxN9namEC/9e0sFz+/tzmnGS/J9WsJSd9fsI65fc+4JLfLUd0AFV031XTjPtPyi8bpj+gY4ImUHaCJTU6gHSzu0+CogWdgWIfderRRfLuDbChKYV4NFzJjX2tZZUuOXtYQj+pbPYoWtRr4cRlMe6Dw+nKW9Efty8Dg9Jw2dzq+dKpqQ21fAoTqlRbdDalg291l5TB6hrEHBwZv6hRuDi6UQLxa0XfQNVsNQBI3Ibkw1rfC7f8BwxEY2YbVbZ8hCsaoXQG3O5XxLXTAdV1sDl3MTrWarmze1JWSfrQq+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(31696002)(38100700002)(54906003)(83380400001)(5660300002)(956004)(8936002)(2616005)(66556008)(82960400001)(186003)(508600001)(86362001)(8676002)(2906002)(53546011)(316002)(66946007)(110136005)(4326008)(6486002)(66476007)(16576012)(31686004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU91WkJiNndJUy9mVG1SSzRuc3gzeldqRFd1YWxEcll2NC9OLzVacmtVVWZk?=
 =?utf-8?B?RVZIdkJlTXN0MkVjSVloMmpGc0V4SnFLdVBmcGhHZmtlbXJZRDBFcHpDY2Fz?=
 =?utf-8?B?aVFkL2tCNC9lL1lhcFJUeXZJZTd5YXJFUWY1b3dPVitvd20xcW1xYXNDZnhI?=
 =?utf-8?B?U0lzaGUxUjJ5RWMza0tSazVtWnk0cG8zWVk5cjY5WlZDcHB6VEFNOVR5Szkx?=
 =?utf-8?B?eG9YREV5QTRMN2FoUzhVc3FoaThobkwwY25hRmpSVitrVStBTmJ0Wld3RXU1?=
 =?utf-8?B?VGxoYTFwdnRZalNBNEo1RFZ4aHhPTHgvV3g3ck1nQi8vaEtBWnNsV2tJdmFu?=
 =?utf-8?B?dGM1RG50MVh6dWk0RXBpcERjTm0wcU9NbUtGZzFUSThtMXNXN3JMaG1panl2?=
 =?utf-8?B?azk5NjVGcjVSL3pUSnNlY3Nmc01ySWZwcm9POEhoaUl0QStLdlpmMUFvZExI?=
 =?utf-8?B?b1Q4bnpENVFYTzQ4TklRbG9UZmFDazl0QXpXWEt2YVFCNExFalZwZEtrSENv?=
 =?utf-8?B?bkF0c3l0KzZGVTVPTUlBU2tTak1nUUFqS2xWRHhpQVJma3NMbnFjbTh3Wmtn?=
 =?utf-8?B?dG9mWURpY0o4NFJSMmtXYmlvSDNLT2NNNlpwY3pRYjRoQTR4dllIbStmTUx6?=
 =?utf-8?B?Z1BUY0RtVmp6YW45cXRIYzN2TjN6R0VEQXE5MUVnMTlNekhZaFpocWpDbnNC?=
 =?utf-8?B?dGxKSlVUV1VsT2IrZ2NKcVVGZXlMMXc3bm9ndG5ua2d1eHVVSEtpYjhzZkxo?=
 =?utf-8?B?cU9SVm44d09KOVRyY29Tb3ZMWktRVStOUEk3cy8wL0F1bW03UTI3eUk4RDlj?=
 =?utf-8?B?OGtkWG9JVXZjQUxrRks2ZUJ3NGE1enlMVUVDYVBMaXl3VG4xY3NGdlVRL1Bl?=
 =?utf-8?B?SFcvRkdjaVRlTHBJVzhsVE8wbUd4SmtDUTl6TFgxemI0WHRadnBYTGY5bDZI?=
 =?utf-8?B?SkdDMUwzL0pvUHFkenNmdENkendCdDhzbGZkTFJRNFJKNEpLeWlNQlNxQmFN?=
 =?utf-8?B?OTNZSDdKVnJXYTZDTkMxQiswWVQ0NjJ5ajFtQ2dLck5MNndJbmRDWjAzdTBQ?=
 =?utf-8?B?bFk5cXhpSnAremVGSitQNUhQS3B2Yk5GcFdHUVA0cjNNT01xNE0vZEpLcUhr?=
 =?utf-8?B?UkNqTmN1aFo0cTNqY3R4c1NORnBZUHVGUjZuMW54N2sxdldiYTBJL1U5STRv?=
 =?utf-8?B?cjB0OFMxZXJnRXdpRndUM2d2UmFvTFpIcm1aUnBKbUhsY3RTaFQwRXNtNkNq?=
 =?utf-8?B?Q0xRSTF6bHdRVzhjVEFpWjgvWHFOKzA2MG9BeEZLbGJFSWpQUDdOU1YvVTBl?=
 =?utf-8?B?SHpwcVNOd3RjRkROWFlkak5maFFFdVJCeDI3RnRTalkxTnJlRjFlamRVcXpZ?=
 =?utf-8?B?R1lpZHRVRDB2N3NqNG1rYmZUOGtZaGxRN0pTdWJNd1A1ZnBIQ0s1ZytVUU5O?=
 =?utf-8?B?cG1SZUJHZlBoNnYyTHhUWlc1dHhqWld0dG5nOXg2ekEwN1RIMDlQSGdmYmNW?=
 =?utf-8?B?cFI2ZTlobFYzKzJSTWMwcVFZMFMzazJYc0JUMFc4QndrT1d2Zkhxc0UxZFpI?=
 =?utf-8?B?a0c0K0FIeS9vQUFXYy9naVFLMFdtRlhCREpLeHpVOVExTjlJVzdsQ0JFa05C?=
 =?utf-8?B?bjhIa1luSHdSemhGcjVzRmRtbTdwSHVvcUxveG5hNjBTVlU4VE51ZVJVdVBG?=
 =?utf-8?B?Y1J4YSsyWTkya09GNGc4MjhZYXNMcUxuOVUvbXB3M3ovYVlzUzA3MU0xSUFP?=
 =?utf-8?B?UVoxQ256TkE5d1JaaWlMcXd6d28zRlI4YUJkdE5ndUZtMGFDcWhjWmRrSkRB?=
 =?utf-8?B?b0hINWpxOFV5ZDhmMHYwVGQwaFRvdGRPRDlCR3Z3bm5wTCswdCtFL1JtY2hq?=
 =?utf-8?B?M2Nmck5jMVcrRkpPOEtFU005emFRU2lrN3lxcWZLeG5LL2ZwUFZBM0hMYS8w?=
 =?utf-8?B?Y2R5TGowV2RtY2pob0Qzc3pvMG9hOU9UY1J4SVJOVW5zRTBjZElZbDlId0ZG?=
 =?utf-8?B?bm5UUHBLSFJ1dHZDSFlTWEdXdXFuaFZVYnBZejkxRTJCb3d4Z2JjK0JVOEFR?=
 =?utf-8?B?a1JlWGhsQ0M2Tk9nSTMyTFlXYmVJa2lqSWZ6NmtwUVRzYUFjMytsREx5QXdV?=
 =?utf-8?B?OTNlOW5LK24zY3dkSmFrbDdqV0tuR2k2aC9OUWJobHFqN2ZqYkdhb3dWL0VB?=
 =?utf-8?B?NytKaXAyanJ2R1o1SW5yaUFBdUlqZGJ5RFlZRFExSkJtU0NuTlRaRXFYdlNK?=
 =?utf-8?B?UW5JYUlpbGJWVDY3TGszeTdrWFh3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a27b3386-f147-4815-ee94-08d9c0e9b851
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 23:13:50.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw4qBTcLsUnFIMNVUuxL8hUu3R11GyaqAkSrw0JI10SX+NtUc5uJLCs/0u5HwmgZtw+139XpeK6aPYmRQGaCrWrsBV1Gs3qWWpftNv7v/zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2021 11:33 AM, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
>
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_fbc.c           | 2 +-
>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 2 +-
>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 8be01b93015f..98319c0322d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -595,7 +595,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
>   	else if (DISPLAY_VER(i915) == 9)
>   		skl_fbc_program_cfb_stride(fbc);
>   
> -	if (i915->ggtt.num_fences)
> +	if (to_gt(i915)->ggtt->num_fences)
>   		snb_fbc_program_fence(fbc);
>   
>   	intel_de_write(i915, ILK_DPFC_CONTROL,
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index adc3a81be9f7..41d279db2be6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -180,7 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>   	struct drm_device *dev = helper->dev;
>   	struct drm_i915_private *dev_priv = to_i915(dev);
>   	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> -	struct i915_ggtt *ggtt = &dev_priv->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
>   	const struct i915_ggtt_view view = {
>   		.type = I915_GGTT_VIEW_NORMAL,
>   	};
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 01ce1d72297f..e4186a0b8edb 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -94,7 +94,7 @@ initial_plane_vma(struct drm_i915_private *i915,
>   		goto err_obj;
>   	}
>   
> -	vma = i915_vma_instance(obj, &i915->ggtt.vm, NULL);
> +	vma = i915_vma_instance(obj, &to_gt(i915)->ggtt->vm, NULL);
>   	if (IS_ERR(vma))
>   		goto err_obj;
Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>   
