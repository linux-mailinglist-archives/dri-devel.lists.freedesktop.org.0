Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2335118C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350BF10F4D8;
	Wed, 27 Apr 2022 14:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F2310E9B4;
 Wed, 27 Apr 2022 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651069780; x=1682605780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8bLy3I5AFwiT150Gx1aue4P6XL1EKRUcsUkJo0rZ9YU=;
 b=EvlhnJ3iH4TVBNMDi43NBKWKpqUUXdwv90eQxC+uBfLKwQ5weLj/7xBW
 ++ZzrQ/NCBPrc7id89J+UZ6LPfuQfPz5h+75cUZhFfftJoEn9OIFAqoUH
 nO+LQBDnPZdlQIwzfn6Xq23qmt5ftxPMV1RuT2ilP7Al4uVNsd9fmTyjy
 eRm1HjCaZ9kPcG5mK/wyAatixefqmhVhFH1SCyo19Y9OkuTIzPCd+7W9r
 zQVphEloAgXcioUK/dqiDEvpD26f42S+Nbz9VAZU9H9jGY0Xcfk2EQWDP
 IwZvlwvFEZJDbYIj74mtWkj8wk6dPHRo91c0NtGxlDS5g/pWEnOV3p+XN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246506726"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="246506726"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 07:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="680773749"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 27 Apr 2022 07:29:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 07:29:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 07:29:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 07:29:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 07:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf6bZxu39wKEjTW7TPEri+oa+3zMKqAQy2x9SCJvNYMpRZwxwZxeHkl11f03kdYE9ZH6fiYU38dBxLGLVBGmfFhST7nIJ1wqvpJ3Obl69vyPbupigg5yg06PTW6prVy7/Ea/B/mBkJydULA32sk3jNh3q2bge8Hgy7dsFIuxhr90/K2sCOGwRFaLQUUydYRxg3jw1eV3G6HM6a2gvo881yz6V06XyAQ13oYggstsGckA/jv9PvxiGFBsMKWwbamqefmY0mRozXtv1OA77Pp8WM7k7PgzOAlXJl2tD0+ADzaCuBUtiATYbUpiiU2IOrt1CIm6nyUKJdunyRJyXK2RWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkgcM7YO/b2mFL71d4zbHZN2Pc+SEgwLVXilbZqGJv0=;
 b=Ze6s+ywa4jR5XNkg5vZqHJT9GFR9j6VnUPY3gBGC3ZYnVViDDQMM/nS3DVEBl9Me1W7QMvPUBuCQHZsYaHiWtG6wQO6pzQmZvzNRckN+e2QUsYZd0G/5C3GNcMscszV73l9EHPSCO4ACUDHaGPzc8skBvKjvFMYg6w8Z+vKrTkr9Z1r3zB3o1EAEIihW9nw/y+VegPosgkcnDA8Nf0rs61I+NwyWhRKb7iM4FZQ1052RqlPR63Y4eUmL1SGK5qH29odh/m1xDi8XNal4tQSbflu+lhdPABgkKszUnfTp8+ZLQxC9oYQJ19fBqNTFE+ygh+DHBWtW2sqK4uG4YNBSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19)
 by CH2PR11MB4245.namprd11.prod.outlook.com (2603:10b6:610:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 14:29:32 +0000
Received: from DM4PR11MB5231.namprd11.prod.outlook.com
 ([fe80::5027:4735:1a5b:a083]) by DM4PR11MB5231.namprd11.prod.outlook.com
 ([fe80::5027:4735:1a5b:a083%4]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 14:29:32 +0000
Message-ID: <9934f4de-9f25-2422-092c-e8e2fe1d796e@intel.com>
Date: Wed, 27 Apr 2022 19:59:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/i915/uc: use io memcpy functions for device memory
 copy
Content-Language: en-US
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220406091809.746969-1-balasubramani.vivekanandan@intel.com>
From: Siva Mullati <siva.mullati@intel.com>
In-Reply-To: <20220406091809.746969-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::13) To DM4PR11MB5231.namprd11.prod.outlook.com
 (2603:10b6:5:38a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ff6ed47-d594-4c91-2c54-08da285a5867
X-MS-TrafficTypeDiagnostic: CH2PR11MB4245:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB42455E955C522B868D4E93A988FA9@CH2PR11MB4245.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5Lr7nuuP9zCAgViM2spUkVmOLZtH/sQcBB6TTA1YtP/YtAlWTuKYjpdCyPMxv7qardsVMeN0H2lFJhvyoDZhpBxzY6I/rSHoInbVmHGZQdFwiHanDHCeY2d/loHl5N2BmoHC/fYMe517IPnkusjruuVX6RTcUp6rCkhWxxDhAPzi5UN+mIdwH+XmQbNNHpO0ighfCaJbXs7n971SPgpmJ3m0PaoKDBhzan+3we39CnpkGldWHfvDP3lqGK3G5zzJhEhLt7UJSbkJFopJECA5hETIqtB0g9yod03325a3fL4YdtESQ1CF3O6fN+Il29dC4D7O3yt3bGrXOdRhYR3vspUarQjK6PFRiXO/5dOAHW6rlQ0WTxFR5Dhm9uYj6p2YCIMuur0eG5m6sOxWlfkPQs56EgDkyd1rnF7su4UM1QkyUPCoL5yypO0BUG5TDQqUnlizYZu72H4nOmqZoi3wdzb0ac/w/loMJQLaGH8VyKzBbti1Q8AQkK+fD27shXJyLn/BL8Q+wkkBsGeMuIrcCQHMgK2RO9sPejNUgV3HvGv11l1AS0cnJTMC295Tt+iyexbF2zVgV45EOMngi8966JOS5AK1Gul96YHtVRMz3oAD8QWNSY1IbU3bX2yNVQThTr90HYkErsPYBpFQXg4uofYX2DP5vJZmbXwjdt1JUZYyLy0oJ6dV52n8F2vsYVQ+XJxRrrZJUVwvJSMzV1ZfVVL61xH+qez/MR5/DNGlfwqpHpAitA3X2KjvDOIOGwEuzB2887mIAWbOQUBBC7/+SIgzfCNWO6mnl/zX7Cpx1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5231.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(8936002)(31696002)(5660300002)(44832011)(66476007)(66556008)(6666004)(4326008)(66946007)(86362001)(6486002)(316002)(2906002)(8676002)(82960400001)(508600001)(36756003)(450100002)(2616005)(107886003)(53546011)(31686004)(83380400001)(38100700002)(110136005)(186003)(54906003)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNrb1k2RHFha2EyTHJCcVAxcUJGdDI0KzdhODRJcG9EY0dRZk0zY3F0MExJ?=
 =?utf-8?B?Z0RPWXp6ZnlwSytYZlJUUUNBNVp3U1pUWGJpUCt2NHJOeGtVbldrK1pyWVFY?=
 =?utf-8?B?U2E2YTNvcUY1OEVuc2NVYUgyQzU5aHozK3VUbkRzM3pMVDlpTUhwV254MFVY?=
 =?utf-8?B?eVlQRzBMcko2cGJCeTFjTWhyczkyM0NCRmVKQ045Qy84dGVjYTNGYXhsTmh6?=
 =?utf-8?B?QUFYU0ZkUTk1ampodTRCZHhSUUNpV2oyOG1pWGJvbGpONWJOQzdiWFRBY1A0?=
 =?utf-8?B?cUJaZ1RiR2Q0cmJLUG83ZDhNemdjeGFIWVF4S3FUTWxHNVkzOHlXQlVBdDVC?=
 =?utf-8?B?YllZSGYxVnhSVGhHcmJpYkI1dG90VUFXUCtMakJQL2YySmx0ZENtVzIzb0xH?=
 =?utf-8?B?cEJtdnNmQ2UrbzVGZEQ3S2ZsVXp1ckhibitJQVhhdHVrcVRpUGV4SjRHWm9F?=
 =?utf-8?B?VnJDekkrVmlsSThaZzlJN1dPMjFuaWxkR2tleFJuRm83eHg0TkVOenJtQTAy?=
 =?utf-8?B?Z3V5YVJlUUFlck1adDFZNTNFc1lIenk4K1ZlR1hBM1dTN3FjZE1PWVhWZnUv?=
 =?utf-8?B?QitpdjQ4NTRoSFQ0ZldqKy9MOVl3TCs1NW5IM3NYMllDRGgycEJmTmtaM0lx?=
 =?utf-8?B?cHRSQStHSEgvYTljelZnZGs3WDRRUk9taWxLQzZ6c0Z6ckJ3cnA4UDJlMXp0?=
 =?utf-8?B?RldiTjF0L0NkL2lLY0d3VzhLV1dMRnl1SVRRdEg1bzI4K1Q5NFR2OEtzdy9R?=
 =?utf-8?B?Z0ZJeU5IOGY1akxGU0FNRE1MY28xbDU0Y3VpVUIwamxNaEFqZUR2T1RrNlIx?=
 =?utf-8?B?RUlmeXlqMlc2SEhjOU9FdlVLL1MrYTJKOU56TndzTXVNUnNBQnMvMmtRVUNE?=
 =?utf-8?B?ZktDRFc0c1VpOUN4ZEROTER1VVZxbThxNGFqQm9pR1RscmJCbHVhdjlkbDFx?=
 =?utf-8?B?VHZ0TDh3dHRrMkZrazNwdS9hUjI5azhwZ0xVdjJSSFd3SGZ5VlJQK1Q1QW1M?=
 =?utf-8?B?RW1qak1yQ2xNVkc2eW1aeW5JT3pldEdUYmZ1MEx2ejlRN1pjOVp0bHFsNVVJ?=
 =?utf-8?B?TUw0THFSMFZLUFRNd3FSbit6bHZETWtEU05naTY5WDNTTmZTMGlmbStvcyta?=
 =?utf-8?B?dEptUjdCdDdPb2g4RUx1blFRdkpsa0sxVXYrNk1hcitIK0lobW1QWkVIdThT?=
 =?utf-8?B?ajh2aFZoaXQ4aEVoZ1lWL01kQmhFL285aTd0TFBJSjRtL0tQdDNOTHlaZEFG?=
 =?utf-8?B?YlZiK0ttSStyRFQ4Nndmb2pVVmo1RjhOcHNlRjlrNzUyRytLVGRCQzVpTld4?=
 =?utf-8?B?WnZ1V2FrZVBnRzFOTjRQaUlrT1MxTGdhOXdnZWZCRlJqbUZJdUM4T21iZW4z?=
 =?utf-8?B?VFRKSjAyclRhdExuUXNKOHpnaWVWNm5CdDJCSyt4YnVnUEtBOFZpYXRNdGFQ?=
 =?utf-8?B?bm5ObXFiSDVKem9sSUV1eG9ab3VaWlNYNC9XdWNpNS9tTDR5bW1xTk1FQm85?=
 =?utf-8?B?NXRPOUdQU3JaTjdtdUJmQnJuNGpxSUptT0w1WmduWVFhUE13NVU4aDdEQWh6?=
 =?utf-8?B?YllpeXJsU3lWTGRwbHI3TGRLSjVaTnNDWGlpeVQ3VmllRkVCbzNqOXJMM2ZD?=
 =?utf-8?B?VFJzL0hlbkZhQjUvUUFnRHR6MmxkVThUMC9OZmJQb01mbGxpeDlqSnpaSnhj?=
 =?utf-8?B?VzVGaWkxcW5zbElCQ05qNVA3Rm9nVk5WWWhWT0xJdUJ3TEJpUHNCcldMVmIr?=
 =?utf-8?B?SFdoU1FUMlVXVi9wRHd6ZnkyT3Z0VW5Ibm1CTGNlempIb05seVBzdm9wZDlk?=
 =?utf-8?B?aXZvZ2QyTi9QYzUzS0QvTU94SlFuL3cvZ3M4cXI2VjBsaFBKaUlKNnVBQVM0?=
 =?utf-8?B?UUFPelNuYnh3b2htV0tYSkMycDZ0UTNxU2czVTNBbHYwYzVEZGJGQmxjM0Rq?=
 =?utf-8?B?eC9uZ29iZU9vTWsvT0x5czlaVDQxRmo5ZWQ2UUlDN1U5U2s4K21aTkhHVkZT?=
 =?utf-8?B?M21EcFQ4R1VCM3VFeVhXRGV5ejFjczYyV1NNVmduSm1ieWtpYnl2NmlPMzVw?=
 =?utf-8?B?Q3krblh5UjFORUZ1eUgxSVpUdzdXNVF6ZjNqRUY0MlRySy9ZSGM5c1ZQaGRX?=
 =?utf-8?B?S2VieCtuaWRCd082SmpwT0hWK2NEYXpXZzNTRlhnSFJqYnE0S01qYzNwRkRJ?=
 =?utf-8?B?M2xMT3JSQkpQZHlPbUNxWDVNbWI1T2VBOFdJaTZ5TUhUWS9LckZqZUI1OGZw?=
 =?utf-8?B?TGRaRVZIT2hqYVBZWmFyK2ltV2dQR3JCWFEyQmE1ZWZDOXY1c3VzOFNSYStz?=
 =?utf-8?B?VGczTW9XeG5Qbjk2VUd2YXNxVHZzR2VmL1A3dHN2Y01MYjFlV0R4bFc4bTF5?=
 =?utf-8?Q?mr7q87Re0mYhX+GxYR2WaoSPbLv88YYjc/LycxS9UbFoP?=
X-MS-Exchange-AntiSpam-MessageData-1: i1Xih4U147AfBTuzuTGHIF3HRW71dBS5Y7I=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff6ed47-d594-4c91-2c54-08da285a5867
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 14:29:32.5751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEOoWwD0VuFqPn82BkU9127AyTaAmqWgyLOx+tPc4Apd+w9Ap4YH/Ap7BHt79EYFANR2f3gdGb3PiWsEA0BWGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4245
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM

Acked-by: Siva Mullati <siva.mullati@intel.com>

On 06/04/22 14:48, Vivekanandan, Balasubramani wrote:
> When copying RSA use io memcpy functions if the destination address
> contains a GPU local memory address. Considering even the source
> address can be on local memory, a bounce buffer is used to copy from io
> to io.
> The intention of this patch is to make i915 portable outside x86 mainly
> on ARM64.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index bb864655c495..06d30670e15c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -589,7 +589,7 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
>  	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>  	struct i915_vma *vma;
>  	size_t copied;
> -	void *vaddr;
> +	void *vaddr, *bounce;
>  	int err;
>  
>  	err = i915_inject_probe_error(gt->i915, -ENXIO);
> @@ -621,7 +621,26 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
>  		goto unpin_out;
>  	}
>  
> -	copied = intel_uc_fw_copy_rsa(uc_fw, vaddr, vma->size);
> +	if (i915_gem_object_is_lmem(vma->obj)) {
> +		/* When vma is allocated from the GPU local memmory, it means
> +		 * the destination address contains an io memory and we need to
> +		 * use memcpy function for io memory for copying, to ensure
> +		 * i915 portability outside x86. It is most likely the RSA will
> +		 * also be on local memory and so the source of copy will also
> +		 * be an io address. Since we cannot directly copy from io to
> +		 * io, we use a bounce buffer to copy.
> +		 */
> +		copied = 0;
> +		bounce = kmalloc(vma->size, GFP_KERNEL);
> +		if (likely(bounce)) {
> +			copied = intel_uc_fw_copy_rsa(uc_fw, bounce, vma->size);
> +			memcpy_toio((void __iomem *)vaddr, bounce, copied);
> +			kfree(bounce);
> +		}
> +	} else {
> +		copied = intel_uc_fw_copy_rsa(uc_fw, vaddr, vma->size);
> +	}
> +
>  	i915_gem_object_unpin_map(vma->obj);
>  
>  	if (copied < uc_fw->rsa_size) {
