Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE865E7150
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 03:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5393D10E0E0;
	Fri, 23 Sep 2022 01:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6241F10E095
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663895886; x=1695431886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l3ul+CGCdTk69XKK5rNwUowrnd4TAMKcEnFnfyDpX20=;
 b=TfvVRuZ9oDtgk34SOoQEqsMHNquXRcDnZ9t4uVqbcYWdIX6Y23NpcNi2
 W4kDLWsLciHHL3n9mIwgC1FCIev8KwmjuZMI7iq5AI+mdZRQNFokOFvnJ
 NSVKK7E8UbRlpNHFPf8qwpJyE91RAQ0LTfwDA2HSqwOiiYlQe0uIF87Pk
 XhwPi4BbH3hkMJniKk6/YjSTPPYb8MHI3G4ZXYizAC27pjf0Vi1y5EtTa
 wvFiaV4yT0IspwTi7+QU0FZg+Gh27Ph84uY3yQOjijgSh9OjxLtrS/KC/
 nLB/kHr1pcH8p3rkJAZiXStIvh/sUliyuZvKi2qZxvmrbowQwOmRA+q57 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283574375"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="283574375"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 18:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="948838379"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2022 18:18:05 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 18:18:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 18:18:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 18:18:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 18:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5lL90fKt2YaWaqbNMDaUS2NGVRBSbrug/+DsDcHeSg6lXP1w0tnDpRrXaI7536lvsZA5cI8yLVAIDzUfSqKLOWCer/C1jfdU8HZh7Qdx/QmD2CQt5w2fNzntJbPfasI4So4d91ZRKdwruYc1zuRU8EmC6u9j9B30SmdQqsTn3g6F63OPRU1/6YKDcWu4RAkGIVV5BNbQlaGnXSgF67lNvWjmb1PeUGatg4rz6t6jvyfET0/aBf2zX1hojXF5YvJbK8Rp/swdJE8dQU5Zd8lf9kH1zy7xmMmH1cz6ZkRbRMQMobY4eKn7vxu8UQL+8E9/uK0VKsJXblMwvFOaNEvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myMUoiXtOJxDzw88Tt0zpzm75N+ctzDw88hVEii7450=;
 b=Ls5qwhbrAimaFXMW6ByvOKNEQoWA7d2AM9rSofGuGJTOySSdlb038r8ZzGcvMvEVcXEeHSRn4fw9tcKBvabjIdu4/pgto8O4WJp2GExKN8tQA/fe4rPxo+PcOVRh6rP8srMGhuFWuRefokQE1BO4cUA8vT4/ZhUNP+b69qd4lvcoWH141fND/4YfSczaTCZA9k93ucwKFv8TlNHzT+vLCEv26OX5amUZENNOAXbgtRVm+er+yiqNpF/eeZERJhZxbMVmdvOeAJeUAM04RoF0EFlg+GFqRQ/CF3HvpPB7794xBcuBhPNF6kjfbVTzQS5SStjngouljviX4IGBnBeH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 01:18:02 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::ccec:43dc:464f:4100]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::ccec:43dc:464f:4100%5]) with mapi id 15.20.5654.016; Fri, 23 Sep 2022
 01:18:02 +0000
Date: Fri, 23 Sep 2022 09:17:25 +0800
From: Feng Tang <feng.tang@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: Re: [PATCH 01/12] slab: Introduce kmalloc_size_roundup()
Message-ID: <Yy0JJV4c3DffCF+4@feng-clx>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-2-keescook@chromium.org>
 <YyxDFfKmSNNkHBFi@hyeyoo>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YyxDFfKmSNNkHBFi@hyeyoo>
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0ab040-ae7c-44e6-8509-08da9d01759a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6V8+euZIkJYjQSDnHjWKaHQEB6DTWqX6s0TcA4E4D3pSyH8Lf0c9gH8NKz5y2DR3R5qK7KA5mnOkJYrJdWTV8HdCUlRbeUb5/j6tMWQJ3bkv7wH3gmV5HFxFNvWgmqXNopNxPxp1KVKaoAmSPILkDuEupXMn3UZ7P8qecu2BM5Vtel0K4xRENxCiwKUd6d7L4mbJ93m72VYNw99gn10qlminsPH9RhxIIMYipTBFZ8e9SQrDcmeC8xnBuRa2oaAHDK1A/PS+YwG40h/Kmg86/Y3qcKsMNNrnjZcLYzronuJX7CB2ku+F6lT7rlhzQbTLPRnf8v4gBbuouOGpbgp+uF0iQEme+A8QFd67lJCIl9b3ynN3PiPzJoO/xZCsQ7h6DgEeHtBt7rh/qpWwhoOEx3wX73rmQAvL8F57LgMu8xzwZGeJq8/b3ZeIjQQwT/eIa3CbcCBwMYVknRxZPFmNfNqLk9oOJaiGEZvGEHJf8HBJHO1sQHVGRwpicctAXELMUA9IyOabI+kzAN3dTROKLbut1goOs2Uo9Fs06lK4oyHdtTrrY46vIvdtpaj03kCDskfGVU9oUfBFINcSKeqfEsqypVOdcWgvzpTR+l3xZ0v4wywYnIcOFipcq/TtZOiX8ZxDI8yu207YIr4vADFs0Wx8McaBp1rm8aztd7KOAzE6AFOjfc6wit2Ms4fadepdnnPo7TP9M4Gl5phR9vqykBoONKS9/vEumvcD0AYC74QVsRHuHJNX86EJ6NRfhZ7IfZw61tLrLytqIIOixdWlDGvD76kxGMI7wZzItUBKLX7z077VvA+F1Unn00GU5JCWAiDhjCxG9oKjtAkp9i+7jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199015)(8936002)(186003)(66556008)(5660300002)(66946007)(83380400001)(41300700001)(4326008)(6506007)(478600001)(7406005)(26005)(7416002)(9686003)(6916009)(33716001)(6512007)(66476007)(8676002)(2906002)(86362001)(6666004)(38100700002)(54906003)(966005)(44832011)(6486002)(82960400001)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?owj8151iRwJDfX+jX1EkBZacYNEQZ+4DrarNXuVKKWvghQTRrAVclv6Qq+l9?=
 =?us-ascii?Q?ygxc68zZCXFHrWRLFuG7lRAPF9ehB3dVcax1mBB8TK9kgeV+EkoyuVks97so?=
 =?us-ascii?Q?8kn2quQV6CVmCOzP6miUSSASQmqps/bHhuVdzp60nWaSBVYibKeBZZjDqPA8?=
 =?us-ascii?Q?RwFsU02OPnjT14XnjxyQ1/EcPaYf+LQ0L6X+wBMeWiofymaMFxH04EkwWSqL?=
 =?us-ascii?Q?PHfb5O4/xOZe+QGGxuBo9HWNtJR5lv4lSM7smiqlvWjIbWvZRx8eUCgwasqE?=
 =?us-ascii?Q?TKcyM2JJKSLLgMr855jqW9Q7kqOfldQtV/iMuPMqeMNMcENRC/MKuYedlRj/?=
 =?us-ascii?Q?8bYgsXT2rXt/ZcDjNiFOWh+so8s/oM/mTii1T8P1CZFwU8g2ad7rknPGPnTy?=
 =?us-ascii?Q?1VmPc9UQpe8quJJnNijgq8F7OJA1eaYfaCP6PdawuSQ6xKlP+yTCjHxNwZ0E?=
 =?us-ascii?Q?Sv9R0M5suOZV3ihcEMQ7ox/l1dRJizFKICCsyHoGjeFXAmNhVBDEyxVCS7iT?=
 =?us-ascii?Q?EP2TMdjDSILcwR3y//i8cJlmejQHzlZSy8CtgmdhLX4B+R8lepxkEX9yhqKH?=
 =?us-ascii?Q?Bi9NSHnZWNxDkgTfT04M500RLu1BwUVxWuyi/mvLCd7gXwXeI8nSVOGMo5Rg?=
 =?us-ascii?Q?dNf/2vnCIRx+NwblKOUlcl7zP7oaT+0/pO2IU+f/54dBjNuTr/W3qCMb3rn1?=
 =?us-ascii?Q?VfkZYgtRH62O7Oggps3WOXAKxMgysRPOEdSAHGELetvgBC+dAIFFwVjyqiYa?=
 =?us-ascii?Q?I/k/qGRLzlnCdAX7mbDErdnM340agdqbT2/wgq8gW6B1lJJ89Sgh5wPLE05S?=
 =?us-ascii?Q?eLXEkfJoQfReO35JE4lCw2BC8yJfr5g3ywfiALbMLY7Phi5rHFBu1pE+jtuO?=
 =?us-ascii?Q?XHOxiXonZy95JkwU790XsyRdR8eScPgz5o5sLUXK1QbFC3dA5NLx+PCLJ6AY?=
 =?us-ascii?Q?2BrtnhLAy25yVGOYIHZ/6Rp/LFUwcP5SxnyyviVqErhG8nlvE/6+IZXa1Z2E?=
 =?us-ascii?Q?w3OJpkqJw5WAVRfzq1OrhWNhiJ6lb8uvNKKeLNguZDVfg5KnIVQI3AhXacva?=
 =?us-ascii?Q?/LDlikCmgzqO+JLH2TMrkviNssITHCRjeh3wT7LO4Jr2j3mfGXS6sSU6aaEA?=
 =?us-ascii?Q?roM1NjQffBMm8CqCNrWQLy4Pq37jLNZ1EZ6CP0cMJro8eY5XTBMvXCmQQb9j?=
 =?us-ascii?Q?zt3VQcZoGRPp7PYFiDUH/oqURkY/reYUQHHGYbXm0dol9AL2QFwS1Iqd95As?=
 =?us-ascii?Q?W4R2HokMDZI0Dh0bnaxZEPso2W+2F9JhlDAiG1KwCnrFiqP78syEkC+DuISg?=
 =?us-ascii?Q?c8q+MQOj1/n0bnWapMAv9pz8cEzksNXJNkhmC/crR3LXR4AI+ook3DXrgw5U?=
 =?us-ascii?Q?zyTs3kWw8xPkCPFSV0JquRpITFTih8xi4FkgF+Ow58TcvQjoUpg6su8DXIQ+?=
 =?us-ascii?Q?i1PP7AQqETUe1Xf43ftPagC3iZjCBgkn7MeSl+covGXs7u4MVtJfsgem3+Tb?=
 =?us-ascii?Q?y+vZqwWss1JRZakS2ZLLwitCMQnRcyip6YyStxXjF+yoVSIdtMFI4ku9V6eH?=
 =?us-ascii?Q?pzHauWk33lkFYTL1ryHK4hfmvz/BxnPEMY4lWlCD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0ab040-ae7c-44e6-8509-08da9d01759a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 01:18:02.2591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REs2eeqwREID/61A/OqDNwf1VdpYcsGMa+CVnsln0X/rG4ol9P/vOb64oJHStPfdvzzu4p5rb+p2NA1Gk9mJVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Jacob Shin <jacob.shin@amd.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "dev@openvswitch.org" <dev@openvswitch.org>, "x86@kernel.org" <x86@kernel.org>,
 "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 David Rientjes <rientjes@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian K??nig <christian.koenig@amd.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Hyeonggon for looping in me.

On Thu, Sep 22, 2022 at 07:12:21PM +0800, Hyeonggon Yoo wrote:
> On Wed, Sep 21, 2022 at 08:10:02PM -0700, Kees Cook wrote:
> > In the effort to help the compiler reason about buffer sizes, the
> > __alloc_size attribute was added to allocators. This improves the scope
> > of the compiler's ability to apply CONFIG_UBSAN_BOUNDS and (in the near
> > future) CONFIG_FORTIFY_SOURCE. For most allocations, this works well,
> > as the vast majority of callers are not expecting to use more memory
> > than what they asked for.
> > 
> > There is, however, one common exception to this: anticipatory resizing
> > of kmalloc allocations. These cases all use ksize() to determine the
> > actual bucket size of a given allocation (e.g. 128 when 126 was asked
> > for). This comes in two styles in the kernel:
> > 
> > 1) An allocation has been determined to be too small, and needs to be
> >    resized. Instead of the caller choosing its own next best size, it
> >    wants to minimize the number of calls to krealloc(), so it just uses
> >    ksize() plus some additional bytes, forcing the realloc into the next
> >    bucket size, from which it can learn how large it is now. For example:
> > 
> > 	data = krealloc(data, ksize(data) + 1, gfp);
> > 	data_len = ksize(data);
> > 
> > 2) The minimum size of an allocation is calculated, but since it may
> >    grow in the future, just use all the space available in the chosen
> >    bucket immediately, to avoid needing to reallocate later. A good
> >    example of this is skbuff's allocators:
> > 
> > 	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
> > 	...
> > 	/* kmalloc(size) might give us more room than requested.
> > 	 * Put skb_shared_info exactly at the end of allocated zone,
> > 	 * to allow max possible filling before reallocation.
> > 	 */
> > 	osize = ksize(data);
> >         size = SKB_WITH_OVERHEAD(osize);
> > 
> > In both cases, the "how large is the allocation?" question is answered
> > _after_ the allocation, where the compiler hinting is not in an easy place
> > to make the association any more. This mismatch between the compiler's
> > view of the buffer length and the code's intention about how much it is
> > going to actually use has already caused problems[1]. It is possible to
> > fix this by reordering the use of the "actual size" information.
> > 
> > We can serve the needs of users of ksize() and still have accurate buffer
> > length hinting for the compiler by doing the bucket size calculation
> > _before_ the allocation. Code can instead ask "how large an allocation
> > would I get for a given size?".
> > 
> > Introduce kmalloc_size_roundup(), to serve this function so we can start
> > replacing the "anticipatory resizing" uses of ksize().
> >
> 
> Cc-ing Feng Tang who may welcome this series ;)
 
Indeed! This will help our work of extending slub redzone check,
as we also ran into some trouble with ksize() users when extending
the redzone support to this extra allocated space than requested
size [1], and have to disable the redzone sanity for all ksize()
users [2].

[1]. https://lore.kernel.org/lkml/20220719134503.GA56558@shbuild999.sh.intel.com/
[2]. https://lore.kernel.org/lkml/20220913065423.520159-5-feng.tang@intel.com/

Thanks,
Feng

> > [1] https://github.com/ClangBuiltLinux/linux/issues/1599
> >     https://github.com/KSPP/linux/issues/183
> > 
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
