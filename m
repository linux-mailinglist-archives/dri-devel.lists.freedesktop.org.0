Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76B5F0064
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 00:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6224C10E0B5;
	Thu, 29 Sep 2022 22:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117E10E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 22:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664490821; x=1696026821;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R2vU33QfWaMUxdCWGWk9dcuafKeqQMpCoTHXwG2x3kg=;
 b=Cc1FZuswp57caSOFuOa7ofKlp85HcqpSpcF2pqL1ae0qL01VIJTUGE+R
 ZJzPJ1VahhYWxWZCvRLt+yeYw3ZNN8ZbHNwkybnJHwFx5Ch3S9MLpnvIl
 3aHe6QT/u4RwLO3hHi6/SSdx+dolnBE/qtCZUYL2nibB5up9XXk0C3BSO
 2dyOcRvI6y8JqLlNyX1UL5sCwJHNznzNweTGSrfjtjLBPIaYTskOnC4hb
 8kg1Lt6n3vYt6RZiEoT73Y8UwS+Kd0eWbQJNjmHz7NOINSNoVBtE0gLDb
 RNbnf1wLF0z8ctJpS+0ocKwsPoO57yxjkDZhssZNhZ3RFKG5jvtojK6xQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="363886676"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="363886676"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 15:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="685042096"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="685042096"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2022 15:33:40 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 15:33:40 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 15:33:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 15:33:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 15:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNQ8qih+plDv/iPSza3A2sZpLUJGQKgS9o/U612faIih2StekR/fRSWttlNnidV1wp7NQW6oinpVVfuD5tGaDX/bAO8fpvPNJJ661M0cpJpfi3znGrUh5hu4nbMaubrDO1JVT4zJIW9dNoh9uPoZmQDfz7CbaxXCN7VHrEQL7XDITrJsGqjiiHlPOKaQ97hylt4woLlLRXjD/zb2SGxj5Lh+lh3j/I+J1dl/96kYSJ1hhTz2SvVUBt32rMEs8Co3Z+jWcF+fgoYMO5UvXQ5w8mV97S05NJXjYt/aZ3nKgD+0LScm1E39xc2smG6gwc4KN/OFRMIUV734HmHmO5fdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz6gFrO83rg83IxrIMnULcpmlcht9TV638SWfVyGWl8=;
 b=mUkXI5vSbpMDJdAYEH/AVPD9B3hoIAX35+lX095sqQqQ+Y5iKbP3NPsRxRLx0pADGxL9m2mSee0bru/cFjuGRqtvpU9w8eJkDnm0eea5UmsibRKDNTIxgyVuVIVuuanAqUd8OVoqlNeAB96urYGu3BimFYtd30Sx383cPL4veCNzAQ1f9eKwRfWMMBD2Y2Xk58J/Gc9YRPGeTImSw+xYFVgEpciEUc1uyT+SBuUHo6WoSVE8bh9ondrfRHzUT9RYjeniZW4Esf0fUi2HkToOlM1frKtflCHCS9ggN9qzzxvt+Y5jZIv2xW1hCzuU0HuqXCoNV5Hy5qbNK7oHjnEhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Thu, 29 Sep 2022 22:33:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%6]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 22:33:38 +0000
Date: Fri, 30 Sep 2022 00:33:33 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
Message-ID: <20220929223333.vh6wy45mfx6kccds@nostramo>
References: <20220927221206.55930-1-mcanal@igalia.com>
 <20220927221206.55930-2-mcanal@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927221206.55930-2-mcanal@igalia.com>
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b67272-51a6-4c69-e733-08daa26aa6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ClrtT9WHmeEnMuUB4WL8C95laeiYC5yGK7P1kH+YISIVXOTvfC3UDit/QnhixuCtcpum/5l8YSA1easifO0ppslVBKcogFweQluuxL3dMzBZs4bKtmgFYaPEvgpjT93Kh6U7Fflkgm1YTtr9Z6oskHazz/yUxv1TmKTubGN38r3Hp8YmzduTUAFstUCTJ0zzXFhWelhhsDLmpILGT/gomHxcbuYh3TifEUGUrY0gkWth7CA0yN5jiTdY70zCRBoVRAAUQhaqIud+WuY+zvYdnrqwgPkcNb/xjU6IrW5AHEDMBgmv0HoWELhHmpDFh1xZ60nBqemPrqh/HVPOqM/jahflCxpPaQ6vpvI0gGGsA7kaA45Uv5IElFKtU8j0gmb1xqu4KmucR36EYVqkSppLKRbngN9AETOWIDdM7Z9khFPxq/+qNXwfN/a7RBrCKletYcsbn397ZE4yQe86smX1juBhTwSjTR9mu6koD8Qa7XS88ugAKpKN2e157xCdNQTuSR62+IK8PbxCBJ0ZOzMudxe7y5J77/3KVOtoZUtfySpJ42T8m0Hs/JaQBurlBJWgoSc6OvMWyX2omTwmEmzYT/dXjB9BlKh5+tEtvWCQ2ots3WrNS0SH5z5arq0Dizb9BBXQFrAa5Nvjgm0vEz2+pVsWQJnYQtJZdIHNJviZkZYSlGBVjjJQ/+a3DSZJrK4NzXOArUxDerXxmD+23srHlmTFwqNT44gyWsJJzh+PQOf9cTfp6u3enwvoHPkYXeV7zPBdjZr3RvYHroRGmdaKEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(83380400001)(6512007)(66574015)(38100700002)(26005)(9686003)(54906003)(316002)(6916009)(1076003)(33716001)(2906002)(186003)(86362001)(5660300002)(7416002)(41300700001)(82960400001)(66476007)(4326008)(8676002)(66946007)(966005)(478600001)(6486002)(66556008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNneXRHUzJLQVdQcitoc1diK1hPMDBBWUxUK1R4VmljWEFDWURPRk5kQ1Fx?=
 =?utf-8?B?NmZrWDMvek5FV3hDZGdtTTdPa1dNb25GT2YvRStaN2tKYnMreUxYYXQwck4y?=
 =?utf-8?B?U0ZSb3dWWXhzYWlrR05sRlltSms0dnMxZE1SOE5VTHBDUFBCV1dzcWk0MDFs?=
 =?utf-8?B?enFITWljRWM2YVMyeWZkNEJHOElVT05Ja1JNN2dVRjhpYXhkVEliMlV1U0pt?=
 =?utf-8?B?a2N4VWpmYm9UOVBqQkdVd2IvZDQ0dmxUQmRDbkVpYUtiUkgxTXdtN3h6OFI0?=
 =?utf-8?B?dHAxZGx3T3ZQeTNuYnRsVHY5QUtvbmhzNyt6bEF2Q25Ya1B1UGpaNUhDdUJv?=
 =?utf-8?B?OTFLeHpwMmVyYlV0NWZUeVF6cU9GTnlHNnh2TzYxbXE5QmFUQ21hQitDSUhl?=
 =?utf-8?B?R2lXMHFSWnRDTGpxcXMzMnVta0pLM0FRcVNrem5IT2NuTUVsN1JZRkxLWXJL?=
 =?utf-8?B?VFZocWNpN2Z2ZFVkOGdkSnZXUWtTRmxaZkRGMGdjdVVVZ0cvV09zcERCUWxa?=
 =?utf-8?B?NnYxK25hd01ST05UZ3NCNWM3WWhsWGZ0OFZzT3lnMU1IVHpPVUdsWXhpaW1a?=
 =?utf-8?B?RUZoamsvNm9xSnMranBpcjFZU2ZlaEFEM1R5TlpKSjdNWStCc3hGbC9OZkpM?=
 =?utf-8?B?cnZsWmFSRGd4ampzVUN6THVxRnNORmIzVDZQSGlXUkVwUEQyb2RwdGNkZ01l?=
 =?utf-8?B?dElwWTBIczNLRnVmY1FDZVorMlllMURMQm5YVVEwUkFKbDNib25ta3Q1YkZn?=
 =?utf-8?B?Yjh0MUxpSVhhN3hIOUg4YVYzb1ZGRzFveWFjU2psUTNPWUwxRExZT1pCQUdJ?=
 =?utf-8?B?T3ZtblNzSzRuaTNUdlUxUUtMUWY5S2tlZDNRQ21QVWpUblJMQ3NNQUg3WGtU?=
 =?utf-8?B?RzFOVTN1OTlpSS9iUlo2eFlEN0tXVkxOTkpHNi9aeGdkeWhQcXg3eFhLYkxB?=
 =?utf-8?B?cklyKzhTYmlPSGlRSytjZ3JWWEdndTRmTkpqTGFLd3ZoU1A0ejBycG15NVNl?=
 =?utf-8?B?WVEyYVFjWWFhTmIrYzRiVnoyTzdFRFZ3ZWhQbVZaZ01hRkZra1V0OVFlMHlS?=
 =?utf-8?B?MWg3RHVjazlKeHJZSndYWTRtbFVCTmJjSmZyVXppK3I1SnN5UXlaWHpBdER3?=
 =?utf-8?B?OUllMDNvQ2I0a3NCelNoYTBvdzBEdkVIUmorL3d3WXpQMS96ZU5zSndFaHRT?=
 =?utf-8?B?R2x1ekNyNXN5ajlwRHJoRFNCYjNaZnBuMVAwaEYxODhhZWE0aHJIcHNFSkVx?=
 =?utf-8?B?THJDOWJvNzFhUFVaQ3VtbVdTYksvRkZET3VYdlFBaGN3dCtUVGd6TnpGS2U3?=
 =?utf-8?B?WnBndVNoSnB1RkVORGtIRmNQVjVCalBBTzNIbEJNM0tqd2hJRWxiQjlNK2pI?=
 =?utf-8?B?MEo0cHIxaVJBbWgzNllOSmQxZW90RWdlVU1IZ0JNc0ZzeVMzd3FxZ3dWSXlj?=
 =?utf-8?B?SUlMYm1xcUZXOTBWb3ljMGYwK25HNXNQWE8veTRuNCthcGxGVW10R2lXeE5r?=
 =?utf-8?B?ZE1DaFAwMU9vSWlBdmdEeEkzc2VRenduUjVrWFJNdjYzZ1VEN2V0cy9vSDhO?=
 =?utf-8?B?b0g2OGhVTmh0d0pNQnBrUkVzQjByMktiQnpJb2pJeEFzdHZ0aTRnLzdGNXhM?=
 =?utf-8?B?SStOQkpzejZneU9GVHNPYzB4enpuWTRQOVFGVVNWTW5hcUo4UFpMQkFqTGt1?=
 =?utf-8?B?VzZXL2pmTmFQRlRlckFhQ1FtVWRPZHNnemJrNzBKVGFRMG5qYk5aelNMWTMv?=
 =?utf-8?B?aEVEOU54b1JpYTY1ZXEzTUk0Nzl5R2hEcGdub05FYVd2Y0FWYU5OVVdpN2Jn?=
 =?utf-8?B?MElxQ2RaV2dJMjhGem80bEFOcFltazNEbzZTZzVGKzZFVmVLdlNuNEdOTlB1?=
 =?utf-8?B?ZWcxSVBNTlBGb3cvOERUREpDOVBqaXhHbHBzUE5ma0cyVjNMRnhSS0F6cStj?=
 =?utf-8?B?QThXK1dJek0ranZWZFNsSDdFWGVyV2VlL0VzdUduMjI3cjljY1lXOFhGYk5h?=
 =?utf-8?B?OVNsUXdMOEJEc296NmNVdFlyUnc2TDl6eHZFbkNBOXdVeUsvTXlTQWQ4SlNo?=
 =?utf-8?B?bVBhemNSL29Ic3NTVEpwWDNtM0lwMEFyRXVXY1ZGWWMycEVPS2RrdjQ0dTla?=
 =?utf-8?B?MmRqQU9kajZYZUwvT3hjOTZQOGRzMEpHSmV0YlRVRE1jVmE2OWlNVlZmSldh?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b67272-51a6-4c69-e733-08daa26aa6db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 22:33:38.3133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KN6/7ani4qqp3/8oH6NzmQKTj0p8X3h/iUnClkhbQwa6SIlqqNOo73F5ZXiCQ0MaQWv6fem7X9AMd3rH1xCNJNE4OXoOtomlfKX9eilKPCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 David Gow <davidgow@google.com>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa
 Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 07:12:06PM -0300, Maíra Canal wrote:
> The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
> structure with different parameters. This could be better represented
> by parameterized tests, provided by KUnit.
> 
> In order to convert the tests to parameterized tests, the test case for
> the client ID was changed: instead of using get_random_bytes to generate
> the client ID, the client ID is now hardcoded in the test case.

Generally "random" usage is not incompatible with parameterized tests, we can
create parameterized tests that use random data.
The idea is to pass a function that generates the actual param (where we have a
pointer to function as one of the members in "params" struct).

For example, see "random_dp_query_enc_client_id" usage here:
https://lore.kernel.org/dri-devel/20220117232259.180459-7-michal.winiarski@intel.com/

In this case, we just compare data going in with data going out (and the data
itself is not transformed in any way), so it doesn't really matter for coverage
and we can hardcode.

-Michał

> So, convert drm_test_dp_mst_sideband_msg_req_decode into parameterized
> tests and make the tests' allocations and prints completely managed by KUnit.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> v1 -> v2: https://lore.kernel.org/dri-devel/20220925222719.345424-1-mcanal@igalia.com/T/#m056610a23a63109484afeafefb5846178c4d36b2
> - Mention on the commit message the change on the test case for the client ID (Michał Winiarski).
> ---
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 370 ++++++++++++------
>  1 file changed, 243 insertions(+), 127 deletions(-)
