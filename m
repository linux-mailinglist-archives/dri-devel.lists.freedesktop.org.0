Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F4578991
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 20:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D6B10E8B0;
	Mon, 18 Jul 2022 18:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B4B10F5C0;
 Mon, 18 Jul 2022 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658168969; x=1689704969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sZG4ZSzbFJ71ks1DHPO4/FxwHcj8McGaZ3dC3/UY8BQ=;
 b=iw3+dCUwwqAKPEllkuywqkrwbRraNEPLjcQh1Br+Q3n+pjgRHIVNsESm
 N85iEOv20NqExxvhe1lBa8eLEGRmFMSBTqeZILwmOJk3Z/iD772sxR80n
 +3/9EMhe2Q5ClbsXVT+GliqjUqRcDfX/fLYdW4p50eQz+FtqDFIn3SO7a
 G4XPw25nOIPwIig6fItkp8Jg1Haj1pp2+6N6T3OKFWsb16fDgRhOBrh5i
 pwjhP3SXFtXoNgEdAisxLnlZVuPDZ1dUMxahcPDUWmY6xaITmhVyX/oIk
 XjFNEPNUd7+uECuU5qo81oOAM57kVIU5k49pU57B+U7Z4D+GZuVAiL2Ur w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266073459"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="266073459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 11:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="655402447"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2022 11:29:25 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 11:29:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Jul 2022 11:29:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 11:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leYv1sMAcLI9PZPXc8a2N2G3vDY6t4xxDhlQGbZD9U+kZCXnxgS1Hs7v8Sd6or0ea2hxH+KAD/YvJlbwH7t9JnWVp7o7YTycdKKZdKKzCevrM+3mCV9yLVJiuNoQVSkbpoLFOuuyqIlBdmjVYaD8Cn78ySW9lF+WvGaGuHAM0NlZOkXyBT+17LWdqiFDt7yncQTdlOUlpamXS2wlFZocJEt2b637xpDuQB7R8PIYWfgJZBH3SD1B1i93wdHIH5GAnz/BZwtl6qKalUIHXzVg97iFCxKSa0LO6cTPWxllI1qUCbybq68K5T/VOEat8qwzT7F19Rm+gCq3xaSbtKEoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91PD4oQMZLFIJP35yPPfAyVTq4LneBiAmXXaxiqDstw=;
 b=LcJPOlUZwclZ9ULGrYeh32/CHr5b6FawB4BgzDEO9VhZ+x8ouVZBfgqGFkhdIZdM8jPojo4YPoeE7K5i9IhL/1Q+deXX3uDPcRdSMG/Bk4zmePpR/R0UYQ8WawuBq3UEgFdB3PqcnO75jQo0k+fpklg0NoMXJLpdtuVyyLVBkUzNC9rGiYIuZEqRoDGWnWp0FCI9wlwtUjvwg0y9h6UdEZeIYg0h0CzOC9wP7iBT8ohxCKrhgeC7djY2wAjVqkiTGrpvQi4OycCdTaYkpA3bGSki/7vsee2/NXjKIbAG7uTBBFqF5L8C5FKerx0G/5bqU56ivOiRxriNFnC++07ylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 18:29:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 18:29:23 +0000
Date: Mon, 18 Jul 2022 14:29:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Wang <wangborong@cdjrlc.com>
Subject: Re: [PATCH] drm/i915/gt: Remove unneeded semicolon
Message-ID: <YtWmfuJ9EvnFDh2t@intel.com>
References: <20220716184439.72056-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220716184439.72056-1-wangborong@cdjrlc.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e315cb18-784b-419b-a59f-08da68eb7025
X-MS-TrafficTypeDiagnostic: PH7PR11MB5793:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPWIPOoEEv+XVjmzTcLDIA2ncDgZ0n1KdnGk+gJ9zlY7Jnefkqr9Ec3iCxE1TrDjt4QFnHgpztBKSVszLiInW95hrusiDehOg5dU/+OOg6UJ5WJ00841PG8SqI470MAZ05xXLS37224Xyqmuao+RnlaqSF5QQzCoOeW1jWJ7jrMVdCkq4Myi4fXeC741D65Yh2dXUOPxVlDWACYOzgIden3wLDA5tJWRXesGvezYq2pTx19cMeRQwflhoeka2e1CU/S/MXhB8jEAEVk8A9M0cunRDXFnpQp2N36wtVcevH1FSR6QPId734N+xDI0bzkI/k3UvVXjFPAxNAR3HFEVtRtDhvXa4ROy406XotwvthOfOvMps1EtpRZZsGhUkrGusA3HRNYg/1s6+M03tgglEz8Li5h2H4z7K6DbC/0zbpY/egQ0Tv+jclkoYnVI7Dz1Xk5Ug6ZBboGNTuhx7Oq6OWn/Dq1D3Z/Em4aL8eNTxeHp4kHt2fMj3dbJmYxu6obFowhFt5jbn9dTcZKkSvnjSaYdJJpjsfmCtPOA7Agx4YIDhIE/blPjNEPk1IS7UtbIo58oPnbebt3P+SJsexQT4a4AMAlSxsb+UMqLTPTCya/LunEGS4GF9E1v+TJU8O54Po9TMV8QrhwWTK6NLA7Bd+TRiFlMJSzLtzXOiH04LFf/e/CU5sg8z54d0P5XyA5UUGiwOIvSJyQ/SWt6yW278Qy3mISNOkBAdZQDRIK1yObL7MIjHOGiggBJLwO8Xs6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(39860400002)(136003)(366004)(4744005)(7416002)(8936002)(5660300002)(44832011)(8676002)(66946007)(4326008)(66476007)(66556008)(36756003)(2616005)(38100700002)(2906002)(6486002)(82960400001)(41300700001)(6666004)(478600001)(6916009)(26005)(86362001)(83380400001)(316002)(6506007)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aYqzH2Zm1O9JAD/Dvl3PRMF8cOP5iXApXfI6bG6ZaTBmNaOv3wq5G3XNQihi?=
 =?us-ascii?Q?2PlXjVGyb+FbClSLo02/PYV6BOrn0LcFiXKlaThWv/2f1q0uaJAfqT+UzLJd?=
 =?us-ascii?Q?zmJ+JxDtjjw4KRdJlfB+S65bO8VzlOlv1vceX9wMgWu1JrqLne4s6E/h47Wz?=
 =?us-ascii?Q?KzPursK3Ajcedp/0rKHcSa8NCkmjYLbp+z2H0iQXJfqKuKm+SDSY8inoVc1e?=
 =?us-ascii?Q?4ZamkomGblfbGG9W7VtUlGanXHZoYj0j5ZwssOp1w7eqYYbg6bnVx8kJBiKc?=
 =?us-ascii?Q?ylXK/YR9hmYRHJY/vXBi9p9kIU/f1V0QBiSSG5wFs3Gt3PiB4FXXnmXpA3QI?=
 =?us-ascii?Q?0tzMHTYVzLb+vGACLrDu51y+OKq1eBh0ItsuqqmpPIk18uyEFuEJrFHd30S2?=
 =?us-ascii?Q?BrFSpX/YQVPYhTELTFuTw8UbdRJd6aCNFVhxoj/7YuoAz45VB9HIL/7uZxwC?=
 =?us-ascii?Q?puvXAj2BP6MbnfU/jOxN6B2nYg05mY66f5INLRDSKYS1kRcwvVTg2pJmDUsa?=
 =?us-ascii?Q?hB3+zRG3MnlGGdAUfvgmyi2LD/Ajw4OZbhs7q1C0KDuHe/qwGTyDQcfTgtcO?=
 =?us-ascii?Q?PrOt6ELzf5uR2irULOmAlG28sSnzEP8bd9AnxLrxijj6qg46wuHeh7Utjtda?=
 =?us-ascii?Q?0kzfaGhSkwgbZAAa+lKJOXIYv2ZNJgMgwMHmeFqrik/vL5MZZ9D1qneF6s4L?=
 =?us-ascii?Q?VOYF99J/CLcggUlKtpE3+RaGhbOIuUSTjIelrWwQ3eIU3IXfqnpG1itoEGNQ?=
 =?us-ascii?Q?IbFir9FczPfvBR/8++7qnctpBRpcmxx6BKixKs7LKx1WDE0D2yOusFKjC4ER?=
 =?us-ascii?Q?8r7s/8IjVbnw1Cle64wdrtPEhubR3ZPMlBwg3dX6sgjixXzf1QgPd/du51x1?=
 =?us-ascii?Q?nxbDsN1rYmkpfJY3/xK+qUhANy+T+nT0Cp3MUI6HrwZcr26EWQt9hyfT9qeb?=
 =?us-ascii?Q?QLkg19gcwGnJ5DuzjDh3YbkNljAro+paH+aJGbUfTXGIISjWbV+CErAXqlrq?=
 =?us-ascii?Q?6plVR05zDlRHiUm06tjqA9zO3ILVm3HKMSaLuP4g7lyE9pLnMsyKOathYIy+?=
 =?us-ascii?Q?1pUUM7yo/wFmtrWFd325cQN3UH6Br3PDJKGZKCcEd1lcQU9YQTZ3UxTXHM5v?=
 =?us-ascii?Q?6JWULGy3QujH3S4qvQN0HpUBOAlgntmDihTJxpuAwI8Cg1TSUpVpy3nYT+SC?=
 =?us-ascii?Q?jb/tKKXL/xARM08iLKSuMSMF1STd1ZYAMxL3MLMpfE0g1f1QzZDX78Cm/hK4?=
 =?us-ascii?Q?kmAE2ZJHOk/6S1T0E3O+l/Bxeg/yTWVuRb3SPQYiXHH3vT7dMDT4OG3kHxQb?=
 =?us-ascii?Q?SQebGn4r6prQ/aJ37ogfqJNuFzO8x+8/zqccF4i3QHmYcd1X0oYZt2JcLk4k?=
 =?us-ascii?Q?RquaVZxkXp95Oy4/jITaknAeDXpeTWO+6A3eZ3jTvrRiSS1jYdbwPVLOfez2?=
 =?us-ascii?Q?aj1DuYSUJP3syzr+lJ31O3ufXsVf+q2KYu/I4ZJBLRqDcTp6Wf8rPIO3VmYD?=
 =?us-ascii?Q?9hR7x/irZ7dUkaFmNc1h+Bc0g8GCFK9B7P8ryXPWev47tj4eSBZV72OsMqLM?=
 =?us-ascii?Q?GgcSoxJH4lcxYzOGI39wEuklRBGE/AFCimwEDRUDQ4YS47Y4WgodQVT9cZe8?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e315cb18-784b-419b-a59f-08da68eb7025
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 18:29:23.6183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGv2puNxOcLj82LCdEhK1eW7Adsb3fDxwzNEj54w5lG7G9wfJXozm9x5r0XQlOoJKsUSXr7PW1HGZwgr2UFO+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 matthew.auld@intel.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 17, 2022 at 02:44:39AM +0800, Jason Wang wrote:
> The semicolon after the `}' in line 648 is unneeded.

same here

The line number changes... if you remove the "in line #"
the msg gets better.
With that changed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 2c35324b5f68..a69b244f14d0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -645,7 +645,7 @@ static int scatter_list_length(struct scatterlist *sg)
>  	while (sg && sg_dma_len(sg)) {
>  		len += sg_dma_len(sg);
>  		sg = sg_next(sg);
> -	};
> +	}
>
>  	return len;
>  }
> --
> 2.35.1
>
