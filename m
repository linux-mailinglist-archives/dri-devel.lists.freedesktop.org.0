Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728448500E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 10:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223110E6AB;
	Wed,  5 Jan 2022 09:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E83710E6AB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641375089; x=1672911089;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oGQYpp0guDR3o+i++e+DDowVr5JSVJENUmRfcj7aoEM=;
 b=NWFS2c/YQDx3/RpJcdju4BMBizHqm+1HK3NZJL7p5L9SyejPm65/wBT/
 GWLGv8x+OPbfhNKMOT1ALjbs0gydU3wqoMGimvqA4gINpg6LlftEuyL3O
 y/8qQrQkrgPzjEGWo/KHnN5vlZLKOvaAwW/VaEpq9bXK7/yqqeyUK0gK2
 24dGsDg4r/wcLvK8jJFZ+Oy3x2YAMf+RqV5ObWC8VmHraa2NHVp4O5dWA
 m873ewopf/Yg5dmt+y8IfiXLa1IXH92dnGntywhNw2DcJv2naia7WZfIp
 vbT7kJiZkyEtHVS3Jd/9KVLa7T07cYHgxMeiIMQembVEMizu3xuPRSkyp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222401001"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="222401001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 01:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="526450294"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 01:31:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 01:31:26 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 01:31:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 5 Jan 2022 01:31:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 5 Jan 2022 01:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAw3GzxGBWkMnaO1MpnkKVdrzK6amFQWT8JrT/gxf2QqLhYmUBMZ0iz3er+vhUtmYMPfgx1cknehUwwPhqiX7bZTQM/SDvp3iux7lrU5fh7OH6hnyyDeP5B3ZVJlmVq5mhBUN/Oi/W9283M+GkrzD2F2LIv+3YmBLKflbfcoh8bw5T6gXnd/FD9wtLi/fThW8ZetIeH+KvVIGQyYcLbCoKHGYRQkQq/0hOxPLx4JrrAPaGdrqP5ctFMHd4HbRWcOlOfQ6/4SW2oQZZU4mb8EQN1TdOeUlZbzZzOXv4DjSmQm+5Btha2xEqU8P/IhK7iKt8EJB/yjqTXPUpqSRfCUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqpNSRT6TBBwe54+EeFDAeyFtEM76Y4GT9ju+Ws9iW0=;
 b=nPBYjKnxqxCLcVK4zAWIThyEFGEafe35eQTq1uqMowvq25VVvHxIjmFNaB1mkzYUjB8cbz59GjlyytyzoCE3T8XvHNcRJ+GyVPWyoUVVk80y/Dvy1aIJ1dmqsR7qnRszVZhyEerx6HUqVK22V5x6bVwl1PRnnZ/QBFccAorBtr3EXL+SHw1CGRB5PzGG51Lf0U5XkXfhRomVAESCppHH+ZQ0SqgaEome31myLbcqcYfBYJ4Fg3NcQl9NgY6nIVw0JGV/XC5/LOodYUL5Qqu5e7FlMxd5/M0QKoonmLwCVR8L/ZO94rpBM+QpEIjRTZtPq72/XEwPeWeng4ENmQldrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Wed, 5 Jan 2022 09:31:22 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 09:31:22 +0000
Message-ID: <fa637b7a-c85b-6287-87ac-cf518b59d027@intel.com>
Date: Wed, 5 Jan 2022 10:31:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: add HDCP support
Content-Language: en-US
To: Xin Ji <xji@analogixsemi.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <dan.carpenter@oracle.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <sam@ravnborg.org>, <pihsun@chromium.org>,
 <tzungbi@google.com>, <maxime@cerno.tech>, <drinkcat@google.com>,
 <hsinyi@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <bliang@analogixsemi.com>,
 <qwen@analogixsemi.com>
References: <20211109024237.3354741-1-xji@analogixsemi.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211109024237.3354741-1-xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:206:1::20) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a09cbc5a-0f7f-46a9-1a2b-08d9d02e22ec
X-MS-TrafficTypeDiagnostic: DM6PR11MB3913:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB39137BD0A029CE2DA1675AEFEB4B9@DM6PR11MB3913.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDxyMy6/sodivE/9R4nUjlQGEbZ3T7XMh2llXGDVjeSLVxw/TRi5PsCVfrZPMzed17Z9AV1T5KVfYADvdgqiTTWvAwjp/A+95t33yXyTMsFN17J7Vdv6oi9m3JYcteEWC4pvdN9CIi9qBHExzFj6929x5dJBB5Ftr7BcaLLmNlX6+Cb+8bjqvx73Q8ARlzo2xZBgpv6PgIJkyhuUmBzTh4dCt1Pse023MHDVrZBnXY++pBayLKgAKZJwjsBm/tcCj4UMcf8HlAa7T390oEek+MuY5aAFxfNgwmMJh7CYauBGpmB/i5wWfy2RKDrgzqU+DqSq1qIgcuW5rnN6srMxjhNken4UcxR5jMDzNx/Vim42jyR9UYHq1w8515khqHu62j00SVOlb7vZkHkTG1Tv4uEFNabXmDJ3mGQ2p6TwlfAaA+FD9n2Gm4r7Uijo4Acn9PUqtw7JuSi259BoYAogI57U3qsceP+x2CPQb7zLfIK/Gc4LecWSHZpCXCYLxSd7eT7BiLqZIBIpYeNIoY2YXB2A5SzdjvyCn0eD1nuGjwJAP/8NoGVZgm1uFRqAdX2C1JCDEvLmr1ZRamS4O4oTdQLOsdnrkt8vWKiydRf6J28QNjBdHjHsmEGUdTdrO5cD3jPyYc7u9khXrGNlhXCNKiY4oIZGc2SlyZcA79CX6saxyV5N6p8OKEMxLeYSYWM0pX/Dcb2EBTlh9AuNqwa5HAIHq2jLKLDdHhEd00CTYzbXWjlnB0hOBamROjdTJUaB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(66946007)(921005)(2616005)(83380400001)(66556008)(5660300002)(38100700002)(31696002)(66476007)(53546011)(26005)(186003)(7416002)(6486002)(30864003)(82960400001)(36916002)(6506007)(36756003)(31686004)(6512007)(6666004)(316002)(86362001)(508600001)(44832011)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akViVDMyQXc5NlBPU1Y5c2s2QVkyR2dkWk9meGN5dkJLT241bGJKaVZJVERB?=
 =?utf-8?B?N1pYSUdzUnZ4VGs2OE9mUU5QKzBObUpRS1FLNk1lNWtpbmxnbnl4L09hL3Qv?=
 =?utf-8?B?MDkxODZlVlBFd244RzhxOGI1MUdKdlJnOGlzblR1S053YlhLVUVvSEk4WCsr?=
 =?utf-8?B?SStUY0MrSlFXY2QxVnVCQ3hwUGloeXRFL0IyWnhNYW5KTEQraG5vUzV4WnB2?=
 =?utf-8?B?eGExdjNGUFdxbVBCSW8rVC91L3UvTk44UlF1WE9WU0xUOHJ3ZUYyWHdGVWp0?=
 =?utf-8?B?VkpuYm1WK2hwT3M3Y1BaKzNkaGREWlh4Vm56MFQyOGk4U2VGQ0ZrUlc3YUVt?=
 =?utf-8?B?bzV6Q1pXWklubERhbEhiNkI1WkxIOTZrMnp1ZWVqQ3BKQXYvam9rMnNGVEtk?=
 =?utf-8?B?Z0xBRzV4N045OElTR2R2SGplWE9XZnpsdlNnSlRqQ2lNZGlSUE9xUnNCc0xL?=
 =?utf-8?B?WG00UHhwZVEwQVNIRzVQTXAyYjZVQ0hzQXdIdUdtanZmT09iVmt6cm9uaFVD?=
 =?utf-8?B?K1BHWmk1aEhhaXF2ZktIU1FPSjN5NHpkZ3M3djFRVmJRY1A3T3BRcGRIMk5K?=
 =?utf-8?B?QmZVQWU1ZHZwVXpCNHBKZUF4Vll4ZEN2cE5xRUlMQ0lYbW1yV1FUY2t1SjRM?=
 =?utf-8?B?SUpsQWg3WG4raU1YVisrM1lCeTAydTVYWUlrVUtJVFJnd05GV0lXTlh1L0pQ?=
 =?utf-8?B?KzhqbnVlb3VLc1crN2pFclVhMjkwWncrbVZORUY4bVNzMUpvRGU0UDVFVENR?=
 =?utf-8?B?RDR5ejh4cHMvUXdkaFltY3dRelZUdk9DNEV3U0FUUGxrVTUwSlpQRW1qLzlr?=
 =?utf-8?B?MDhrTDBMdDNaMzFRd2xlQU5Halh6UFNTUVRFMk5YbW1tckl1c2NsYk5LV3Zh?=
 =?utf-8?B?WjkwNjhPRXIvUGRNbkRDYVBBMmNDMCtMbEswcnlqdG1sWTZNeGtlMCtjZUd5?=
 =?utf-8?B?UThpNTJXSC9COW1KUzhDQmlsSmtqSE51dUowSFRuU1BZQ1FrM0hLYkJlVHBD?=
 =?utf-8?B?NllXb0VNeEppOU5KeGw3WThBN0dsN3o4S1pXeEhXUGpJcFgzT1d1VlR4RWQ1?=
 =?utf-8?B?STZiU2Jxb0hJc2FQdGF2dGRqU3ZBMER2Vyt3QUN4RnpRU2thWjJkT2g5R0ZY?=
 =?utf-8?B?M1pSdnRqblBkRzJSUVBwQmM0UkZwbTZMVlhMczBiVzFqbTI5WU9FcGMwKzgr?=
 =?utf-8?B?SkVpck5Yc0NUNTBNeGdaWFNCMWpzeCtGRVNOWkhyVDVnRHVwVmZzNHBPV2Vv?=
 =?utf-8?B?RS9QSWhLMFFQODlqVW5BSUdzQ3dodW5vU0JZakNYNlVBZzFTWVo3SFlFdWNy?=
 =?utf-8?B?UnJyTk16ZkxFNGhLcHkvclR5WHRIT3FkOVlaZ3lDVURqNjY0NmpKUUtBU004?=
 =?utf-8?B?SDZtSWFmZDBodnIxRGQyckNvM0JXUzBWU0hJbG9UbmhPWjFwVEpyRGtNaWV1?=
 =?utf-8?B?dnZmZmQzUnlPWE1majAvL0VTM25wS3dIc29VbUJaUnQ4K2c3cFBrUkJrL3Zz?=
 =?utf-8?B?MWFzRGRSMkNNT3VnZHJ3ZGFRRVBld05hOUNER2M5akxKWUdZRS8xMU4rSm5N?=
 =?utf-8?B?UXFMQWVKTVBkekZPdzN3SUJEQWVFRFVQV2FOckV6ZjlKOExVQkdpbTJvQVFC?=
 =?utf-8?B?WS8vdGM4TU9HdkprWTYwWE41NXZsaHVBS2xmbEZzYW1iUmRkWXY0V1l1S3h0?=
 =?utf-8?B?dy8zSk1UdUcwMTlrbkVzU0JKeHBBdHlVY1RRRDl1a0JSd0FxRGVTVlYvam1k?=
 =?utf-8?B?OEpVMmFXN29jZDBnVllGcFJtOTA1LzlYM1Q0dFRZaEVLaVA2dFR4M2s2anla?=
 =?utf-8?B?L01UcVFoQTBZMWRqeGI2bk1UK0ZuZld1Q0FIWWdNY3UzOXpLRXZPQ2FsbC9t?=
 =?utf-8?B?OFUyeHBFeUkxR0tuVlRHaW5NOUdUajJYNnhjVUNXVmZqeEMzcWJaWHYrNTQv?=
 =?utf-8?B?aHd6K1c5U1FISlU5WUphOHM0UUVzbU5SR0RZNGFJemkyc3pheStsaXNoV1FM?=
 =?utf-8?B?dHA3SUVXR1BrRElYRENwZWkrS0R6RytlL3ZXNEQ0bmNQSkRQNTVtZlV5MW04?=
 =?utf-8?B?UjVSZWV4ZFdnZlVtZDJWMWxnWUlxa1BMdmQ4djFPU1ZXOXh1OFVBVXpyUmNU?=
 =?utf-8?B?Z3hBMzMrSU80eVhTU21GNTgwTmNZdk5aU0tUdjVzbkE4eDVxNlpwdUI1Z3Fh?=
 =?utf-8?Q?06+48yzYQgrVj+nOijhtuhA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a09cbc5a-0f7f-46a9-1a2b-08d9d02e22ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 09:31:22.4950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYTbH8phMdx6B6BYFypI0aI95MkqezMAZ6BYEfIaTxXDN61/4MEwnllwzGLtNayr3e+BokqTpC1Zn9kjgLSJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3913
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

Hi Xin,

On 09.11.2021 03:42, Xin Ji wrote:
> This patch provides HDCP setting interface for userspace to dynamic
> enable/disable HDCP function.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 368 +++++++++++++++++++++-
>   drivers/gpu/drm/bridge/analogix/anx7625.h |  69 +++-
>   2 files changed, 425 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 001fb39d9919..6d93026c2999 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -26,6 +26,7 @@
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_dp_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_hdcp.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
> @@ -213,6 +214,60 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>   	return 0;
>   }
>   
> +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> +				 u8 addrh, u8 addrm, u8 addrl,


Wouldn't be more convenient to use single u32 address (in fact 24 bits 
of it)?


> +				 u8 len, u8 *buf)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int ret;
> +	u8 cmd;
> +
> +	if (len > MAX_DPCD_BUFFER_SIZE) {
> +		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");


Here and below (note from inline docs)m regarding DRM_DEV_ERROR and friends:

  NOTE: this is deprecated in favor of drm_err() or dev_err()


> +		return -EINVAL;
> +	}
> +
> +	cmd = ((len - 1) << 4) | 0x09;
Here and below you can replace magic numbers by macros.
> +
> +	/* Set command and length */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				AP_AUX_COMMAND, cmd);
> +
> +	/* Set aux access address */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_7_0, addrl);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_15_8, addrm);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_19_16, addrh);
> +
> +	/* Enable aux access */
> +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> +
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> +		return -EIO;
> +	}
> +
> +	usleep_range(2000, 2100);
> +
> +	ret = wait_aux_op_finish(ctx);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> +				     AP_AUX_BUFF_START, len, buf);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static int anx7625_video_mute_control(struct anx7625_data *ctx,
>   				      u8 status)
>   {
> @@ -669,6 +724,160 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
>   	return ret;
>   }
>   
> +static int anx7625_read_flash_status(struct anx7625_data *ctx)
> +{
> +	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
> +}
> +
> +static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
> +{
> +	int ret, val;
> +	struct device *dev = &ctx->client->dev;
> +	u8 ident[32];
> +
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				FLASH_ADDR_HIGH, 0x91);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 FLASH_ADDR_LOW, 0xA0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				R_FLASH_RW_CTRL, FLASH_READ);
> +	ret |= readx_poll_timeout(anx7625_read_flash_status,
> +				  ctx, val,
> +				  ((val & FLASH_DONE) || (val < 0)),
> +				  2000,
> +				  2000 * 150);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "flash read access fail!\n");
> +		return -EIO;
> +	}
> +
> +	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> +				     FLASH_BUF_BASE_ADDR,
> +				     FLASH_BUF_LEN, ident);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "read flash data fail!\n");
> +		return -EIO;
> +	}
> +
> +	if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
> +{
> +	int ret;
> +	struct device *dev = &ctx->client->dev;
> +
> +	/* Select HDCP 1.4 KEY */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				R_BOOT_RETRY, 0x12);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 FLASH_ADDR_HIGH, HDCP14KEY_START_ADDR >> 8);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 FLASH_ADDR_LOW, HDCP14KEY_START_ADDR & 0xFF);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 R_RAM_LEN_H, HDCP14KEY_SIZE >> 12);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 R_RAM_LEN_L, HDCP14KEY_SIZE >> 4);
> +
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 R_RAM_ADDR_H, 0);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 R_RAM_ADDR_L, 0);
> +	/* Enable HDCP 1.4 KEY load */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 R_RAM_CTRL, DECRYPT_EN | LOAD_START);
> +	DRM_DEV_DEBUG_DRIVER(dev, "load HDCP 1.4 key done\n");
> +	return ret;
> +}
> +
> +static int anx7625_hdcp_config(struct anx7625_data *ctx, bool on)
> +{
> +	u8 bcap;
> +	int ret;
> +	struct device *dev = &ctx->client->dev;
> +
> +	if (!on) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP 1.4\n");
> +
> +		/* Disable HDCP */
> +		ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> +		/* Try auth flag */
> +		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> +		/* Interrupt for DRM */
> +		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> +		if (ret < 0)
> +			DRM_DEV_ERROR(dev, "fail to disable HDCP\n");
> +
> +		return anx7625_write_and(ctx, ctx->i2c.tx_p0_client,
> +					 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> +	}


Code path for on==true, and on==false have nothing common.

This is definitely shows that anx7625_hdcp_config should be split to 
anx7625_hdcp_enable and anx7625_hdcp_disable (or on/off, whatever).


> +
> +	ret = anx7625_hdcp_key_probe(ctx);
> +	if (ret) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "no key found, not to do hdcp\n");
> +		return ret;
> +	}
> +
> +	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> +	if (!(bcap & 0x01)) {
> +		DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> +		return 0;
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> +
> +	/* First clear HDCP state */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> +				TX_HDCP_CTRL0,
> +				KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> +	usleep_range(1000, 1100);
> +	/* Second clear HDCP state */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> +				 TX_HDCP_CTRL0,
> +				 KSVLIST_VLD | BKSV_SRM_PASS | RE_AUTHEN);
> +
> +	/* Set time for waiting KSVR */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> +				 SP_TX_WAIT_KSVR_TIME, 0xc8);
> +	/* Set time for waiting R0 */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p0_client,
> +				 SP_TX_WAIT_R0_TIME, 0xb0);
> +	ret |= anx7625_hdcp_key_load(ctx);
> +	if (ret) {
> +		DRM_WARN("prepare HDCP key failed.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> +
> +	/* Try auth flag */
> +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> +	/* Interrupt for DRM */
> +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
> +
> +	return anx7625_write_or(ctx, ctx->i2c.tx_p0_client,
> +				TX_HDCP_CTRL0, HARD_AUTH_EN);
> +}
> +
>   static void anx7625_dp_start(struct anx7625_data *ctx)
>   {
>   	int ret;
> @@ -679,6 +888,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>   		return;
>   	}
>   
> +	/* Disable HDCP */
> +	anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> +
>   	if (ctx->pdata.is_dpi)
>   		ret = anx7625_dpi_config(ctx);
>   	else
> @@ -686,6 +898,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>   
>   	if (ret < 0)
>   		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> +
> +	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +
> +	ctx->dp_en = 1;
>   }
>   
>   static void anx7625_dp_stop(struct anx7625_data *ctx)
> @@ -705,6 +921,10 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>   	ret |= anx7625_video_mute_control(ctx, 1);
>   	if (ret < 0)
>   		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
> +
> +	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +
> +	ctx->dp_en = 0;
>   }
>   
>   static int sp_tx_rst_aux(struct anx7625_data *ctx)
> @@ -859,7 +1079,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>   				AP_AUX_ADDR_7_0, 0x50);
>   	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
>   				 AP_AUX_ADDR_15_8, 0);
> -	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
>   				 AP_AUX_ADDR_19_16, 0xf0);


This is bugfix? How it is related to the rest of patchset.


Regards

Andrzej


>   	if (ret < 0) {
>   		DRM_DEV_ERROR(dev, "access aux channel IO error.\n");
> @@ -1688,6 +1908,83 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>   	return 0;
>   }
>   
> +void hdcp_check_work_func(struct work_struct *work)
> +{
> +	u8 status;
> +	struct delayed_work *dwork;
> +	struct anx7625_data *ctx;
> +	struct device *dev;
> +	struct drm_device *drm_dev;
> +
> +	dwork = to_delayed_work(work);
> +	ctx = container_of(dwork, struct anx7625_data, hdcp_work);
> +	dev = &ctx->client->dev;
> +
> +	if (!ctx->connector) {
> +		DRM_ERROR("HDCP connector is null!");
> +		return;
> +	}
> +
> +	drm_dev = ctx->connector->dev;
> +	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> +	mutex_lock(&ctx->hdcp_wq_lock);
> +
> +	status = anx7625_reg_read(ctx, ctx->i2c.tx_p0_client, 0);
> +	DRM_DEV_DEBUG_DRIVER(dev, "sink HDCP status check: %.02x\n", status);
> +	if (status & BIT(1)) {
> +		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_ENABLED;
> +		drm_hdcp_update_content_protection(ctx->connector,
> +						   ctx->hdcp_cp);
> +		DRM_DEV_DEBUG_DRIVER(dev, "update CP to ENABLE\n");
> +	}
> +
> +	mutex_unlock(&ctx->hdcp_wq_lock);
> +	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> +}
> +
> +static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
> +					  struct drm_connector_state *state)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int cp;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "hdcp state check\n");
> +	cp = state->content_protection;
> +
> +	if (cp == ctx->hdcp_cp)
> +		return 0;
> +
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +		if (ctx->dp_en) {
> +			DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP\n");
> +			anx7625_hdcp_config(ctx, true);
> +
> +			queue_delayed_work(ctx->hdcp_workqueue,
> +					   &ctx->hdcp_work,
> +					   msecs_to_jiffies(2000));
> +		}
> +	}
> +
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +			DRM_ERROR("current CP is not ENABLED\n");
> +			return -EINVAL;
> +		}
> +		anx7625_hdcp_config(ctx, false);
> +		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +		drm_hdcp_update_content_protection(ctx->connector,
> +						   ctx->hdcp_cp);
> +		DRM_DEV_DEBUG_DRIVER(dev, "update CP to UNDESIRE\n");
> +	}
> +
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +		DRM_ERROR("Userspace illegal set to PROTECTION ENABLE\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int anx7625_bridge_attach(struct drm_bridge *bridge,
>   				 enum drm_bridge_attach_flags flags)
>   {
> @@ -1902,25 +2199,58 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
>   	return true;
>   }
>   
> -static void anx7625_bridge_enable(struct drm_bridge *bridge)
> +static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
>   {
>   	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>   	struct device *dev = &ctx->client->dev;
>   
> -	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
> +	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge atomic check\n");
> +	anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
> +				  &crtc_state->adjusted_mode);
> +
> +	return anx7625_connector_atomic_check(ctx, conn_state);
> +}
> +
> +static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *state)
> +{
> +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +	struct device *dev = &ctx->client->dev;
> +	struct drm_connector *connector;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "drm atomic enable\n");
> +
> +	if (!bridge->encoder) {
> +		DRM_DEV_ERROR(dev, "Parent encoder object not found");
> +		return;
> +	}
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
> +							     bridge->encoder);
> +	if (!connector)
> +		return;
> +
> +	ctx->connector = connector;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "attached content protection.\n");
>   
>   	pm_runtime_get_sync(dev);
>   
>   	anx7625_dp_start(ctx);
>   }
>   
> -static void anx7625_bridge_disable(struct drm_bridge *bridge)
> +static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old)
>   {
>   	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>   	struct device *dev = &ctx->client->dev;
>   
>   	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
>   
> +	ctx->connector = NULL;
>   	anx7625_dp_stop(ctx);
>   
>   	pm_runtime_put_sync(dev);
> @@ -1950,11 +2280,14 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
>   
>   static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>   	.attach = anx7625_bridge_attach,
> -	.disable = anx7625_bridge_disable,
>   	.mode_valid = anx7625_bridge_mode_valid,
>   	.mode_set = anx7625_bridge_mode_set,
> -	.mode_fixup = anx7625_bridge_mode_fixup,
> -	.enable = anx7625_bridge_enable,
> +	.atomic_check = anx7625_bridge_atomic_check,
> +	.atomic_enable = anx7625_bridge_atomic_enable,
> +	.atomic_disable = anx7625_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.detect = anx7625_bridge_detect,
>   	.get_edid = anx7625_bridge_get_edid,
>   };
> @@ -2134,6 +2467,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	anx7625_init_gpio(platform);
>   
>   	mutex_init(&platform->lock);
> +	mutex_init(&platform->hdcp_wq_lock);
> +
> +	INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
> +	platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
> +	if (!platform->hdcp_workqueue) {
> +		DRM_DEV_ERROR(dev, "fail to create work queue\n");
> +		ret = -ENOMEM;
> +		goto free_platform;
> +	}
>   
>   	platform->pdata.intp_irq = client->irq;
>   	if (platform->pdata.intp_irq) {
> @@ -2143,7 +2485,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   		if (!platform->workqueue) {
>   			DRM_DEV_ERROR(dev, "fail to create work queue\n");
>   			ret = -ENOMEM;
> -			goto free_platform;
> +			goto free_hdcp_wq;
>   		}
>   
>   		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
> @@ -2213,6 +2555,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>   	if (platform->workqueue)
>   		destroy_workqueue(platform->workqueue);
>   
> +free_hdcp_wq:
> +	if (platform->hdcp_workqueue)
> +		destroy_workqueue(platform->hdcp_workqueue);
> +
>   free_platform:
>   	kfree(platform);
>   
> @@ -2228,6 +2574,12 @@ static int anx7625_i2c_remove(struct i2c_client *client)
>   	if (platform->pdata.intp_irq)
>   		destroy_workqueue(platform->workqueue);
>   
> +	if (platform->hdcp_workqueue) {
> +		cancel_delayed_work(&platform->hdcp_work);
> +		flush_workqueue(platform->workqueue);
> +		destroy_workqueue(platform->workqueue);
> +	}
> +
>   	if (!platform->pdata.low_power_mode)
>   		pm_runtime_put_sync_suspend(&client->dev);
>   
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 3d79b6fb13c8..89b1b347a463 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -59,10 +59,23 @@
>   
>   /***************************************************************/
>   /* Register definition of device address 0x70 */
> -#define  I2C_ADDR_70_DPTX              0x70
> -
> -#define SP_TX_LINK_BW_SET_REG 0xA0
> -#define SP_TX_LANE_COUNT_SET_REG 0xA1
> +#define TX_HDCP_CTRL0			0x01
> +#define STORE_AN			BIT(7)
> +#define RX_REPEATER			BIT(6)
> +#define RE_AUTHEN			BIT(5)
> +#define SW_AUTH_OK			BIT(4)
> +#define HARD_AUTH_EN			BIT(3)
> +#define ENC_EN				BIT(2)
> +#define BKSV_SRM_PASS			BIT(1)
> +#define KSVLIST_VLD			BIT(0)
> +
> +#define SP_TX_WAIT_R0_TIME		0x40
> +#define SP_TX_WAIT_KSVR_TIME		0x42
> +#define SP_TX_SYS_CTRL1_REG		0x80
> +#define HDCP2TX_FW_EN			BIT(4)
> +
> +#define SP_TX_LINK_BW_SET_REG		0xA0
> +#define SP_TX_LANE_COUNT_SET_REG	0xA1
>   
>   #define M_VID_0 0xC0
>   #define M_VID_1 0xC1
> @@ -71,6 +84,12 @@
>   #define N_VID_1 0xC4
>   #define N_VID_2 0xC5
>   
> +#define KEY_START_ADDR			0x9000
> +#define KEY_RESERVED			416
> +
> +#define HDCP14KEY_START_ADDR		(KEY_START_ADDR + KEY_RESERVED)
> +#define HDCP14KEY_SIZE			624
> +
>   /***************************************************************/
>   /* Register definition of device address 0x72 */
>   #define AUX_RST	0x04
> @@ -155,9 +174,43 @@
>   
>   #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
>   
> +#define R_BOOT_RETRY		0x00
> +#define R_RAM_ADDR_H		0x01
> +#define R_RAM_ADDR_L		0x02
> +#define R_RAM_LEN_H		0x03
> +#define R_RAM_LEN_L		0x04
>   #define FLASH_LOAD_STA          0x05
>   #define FLASH_LOAD_STA_CHK	BIT(7)
>   
> +#define R_RAM_CTRL              0x05
> +/* bit positions */
> +#define FLASH_DONE              BIT(7)
> +#define BOOT_LOAD_DONE          BIT(6)
> +#define CRC_OK                  BIT(5)
> +#define LOAD_DONE               BIT(4)
> +#define O_RW_DONE               BIT(3)
> +#define FUSE_BUSY               BIT(2)
> +#define DECRYPT_EN              BIT(1)
> +#define LOAD_START              BIT(0)
> +
> +#define FLASH_ADDR_HIGH         0x0F
> +#define FLASH_ADDR_LOW          0x10
> +#define FLASH_LEN_HIGH          0x31
> +#define FLASH_LEN_LOW           0x32
> +#define R_FLASH_RW_CTRL         0x33
> +/* bit positions */
> +#define READ_DELAY_SELECT       BIT(7)
> +#define GENERAL_INSTRUCTION_EN  BIT(6)
> +#define FLASH_ERASE_EN          BIT(5)
> +#define RDID_READ_EN            BIT(4)
> +#define REMS_READ_EN            BIT(3)
> +#define WRITE_STATUS_EN         BIT(2)
> +#define FLASH_READ              BIT(1)
> +#define FLASH_WRITE             BIT(0)
> +
> +#define FLASH_BUF_BASE_ADDR     0x60
> +#define FLASH_BUF_LEN           0x20
> +
>   #define  XTAL_FRQ_SEL    0x3F
>   /* bit field positions */
>   #define  XTAL_FRQ_SEL_POS    5
> @@ -392,21 +445,29 @@ struct anx7625_data {
>   	struct platform_device *audio_pdev;
>   	int hpd_status;
>   	int hpd_high_cnt;
> +	int dp_en;
> +	int hdcp_cp;
>   	/* Lock for work queue */
>   	struct mutex lock;
>   	struct i2c_client *client;
>   	struct anx7625_i2c_client i2c;
>   	struct i2c_client *last_client;
> +	struct timer_list hdcp_timer;
>   	struct s_edid_data slimport_edid_p;
>   	struct device *codec_dev;
>   	hdmi_codec_plugged_cb plugged_cb;
>   	struct work_struct work;
>   	struct workqueue_struct *workqueue;
> +	struct delayed_work hdcp_work;
> +	struct workqueue_struct *hdcp_workqueue;
> +	/* Lock for hdcp work queue */
> +	struct mutex hdcp_wq_lock;
>   	char edid_block;
>   	struct display_timing dt;
>   	u8 display_timing_valid;
>   	struct drm_bridge bridge;
>   	u8 bridge_attached;
> +	struct drm_connector *connector;
>   	struct mipi_dsi_device *dsi;
>   };
>   
