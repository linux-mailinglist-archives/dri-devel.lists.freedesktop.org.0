Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43063777DC0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752910E5A7;
	Thu, 10 Aug 2023 16:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D5D10E088
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691683774; x=1723219774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eKavocPbhkIobKDNKtkOTikmrjFs6qNsC6AkjSsnoIE=;
 b=DEbf8feubUzkKqbN+HbsWEYEqhdlEaCFruHkiRLFSkwA353opnAMdaGV
 YorphDERSySzbKuUQIlLGYLvggfItkRY8zymQLXUUX4Mx9RZmaaXIC6wi
 apNLvn0U2AACHB6o2wmuc5jWSRgbyV+5ysWtHFD28YXVV/AXzxhoEbOTS
 +7S6fcu79qmThIRlEKo6y+eCPO28CrCZzvp5ZmX007pjamrQi+T+nUQmI
 T321tgqoehSVwP959LWi7vcYKfY3pp/MT8TIdaa72QZ/pIpFrja48eWTO
 xJtYI+ZRJKvn6iveGdfUlNCfMbuw+ugqJCEbpcgPNfRpy9CQxgIv8gAkC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374213295"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="374213295"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="709214911"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709214911"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 10 Aug 2023 09:05:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 09:05:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 09:05:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 09:05:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 09:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOZ8fvUBiSU0bx4fRBrUibxBzmx9PZzqbJGY4nPxGEUGot9fiQuQJrFRSQZEU7iyf6DiwqbgDyjjZUPi/tnZlxlUJfDmH3Ps8QeJONQYtHw8R7/49W3vGv37wqwIxdnmaR27tsdbdnpkfpZBJd7Nyq2RiizVTwxNEGNFUUPlCgUcOuRh2e3fMNz/Maskrw74vdiXr82gMgxsB6XA5C+Mipvv/9BRXv5UkdJJjVnuPPqdTyVZqFOQK908m5WM4hJRoeXRDQZcaF9yc1IQ7xMIArLJd2C9ny9eFBRk2E+nbGjaZCbow0QwieOimv6xVNaPl8UXnqXo1huTBts7W/ckfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h39YyWFJn65uPO0prpJIN9+6VGui+NZub4qfxa2L6rw=;
 b=QQ7fAKJUWEZt+Slt1ii1Q1khAuVMAm+y4QPx9WiV7uf25eQy+Qu8HGmdMAHvC55DmOKUFk7lft3yYci6/wE432MLkmYAlTJUcr7He3Px3+oUAWmcomrvjDhqXS+8ovk345x1Xk5Hp3iPSnJqqveWVksIKAJeElLhtZaoYzT0r9D1oDLnj6chPf1eIWYmeOnYFNobPEb7hEsgAL9PSGeUJqexK1kYbbA+gdt+zamf/v0h9JuNZEGLVE7kzn9LmBc5T6uC80kwarG852qzzQoYpyJ5XCC0kqp9TZI3+VPc5sxYwI172WQ/i8O042pPNYtTDFnvShbcnPg1agAkPerXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 10 Aug
 2023 16:05:03 +0000
Received: from PH0PR11MB4886.namprd11.prod.outlook.com
 ([fe80::c5df:b8c3:8976:c817]) by PH0PR11MB4886.namprd11.prod.outlook.com
 ([fe80::c5df:b8c3:8976:c817%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 16:05:03 +0000
Message-ID: <97bf5b80-ca0c-638b-9b5d-1cae70f3df58@intel.com>
Date: Thu, 10 Aug 2023 09:04:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 01/11] net: add netdev netlink api to bind dma-buf
 to a net device
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, <netdev@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-2-almasrymina@google.com>
From: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
In-Reply-To: <20230810015751.3297321-2-almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To PH0PR11MB4886.namprd11.prod.outlook.com
 (2603:10b6:510:33::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4886:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 26475419-15a5-4b98-9151-08db99bb8eb0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODKVx7uRQCurVgPpeEy5o8JrJHWnSA6yQzNgLHXIKwIf3vbU4eIaQrTW7RhXD8guxaF+mkX+NkSj2NYMDgowuRzY4z9LCUp0+W6x89joFfowkdg7qpvZ/EoOeeXX8y6Zd7/VpkJt8gvGGCfyHKROgx9W9RqDl5p5y9xPLpY2DO8ozdkj2Zb/xcAmihFxnv5ZurzkTfF4SBo46SNuV9aDc1qLXdbl+4NOkZBe+T4FAQtaBuopnc7eYRMT0kSvmysV24X0pds3F2k8oXTejG5LPQT+O/E4ccObwopkadT8PQ36xhLDBNbm5/WV0aJ3CVXy24Ev+9KKxFcxvz15Pwx6X8X4V0jCkrnOSgkzuek+IcVUDCl2lzVLzwEVTxI+WYzcDXSBlA1JywbzRZNvwBtA5QFn5aiDekwRvPnFfaAr698miBZtK3AVEG+bgDkX70DA3LckKoqSbco+G0yxMjFinX7sDUZZRqDJnrfZvzSt4jF2jE0j2Nnr8eY+zuMP6gSqHk414bZYyfZh7cR0MsmMqWS0bjLnRRexGhErHaHMMsHi2MJgkzhu3WlNJFlgq3G+j+F0j2bNUMpEbCJiTNUrl93vHuB94QLzjgy5kxxsNgSPC2btQqFtSh7i/6r7UQObTgkk6x+SL2LSMuVns/08Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(186006)(1800799006)(451199021)(66476007)(66556008)(54906003)(66946007)(41300700001)(8676002)(316002)(8936002)(966005)(6486002)(86362001)(2616005)(38100700002)(31696002)(26005)(82960400001)(6512007)(4326008)(6666004)(53546011)(6506007)(107886003)(36756003)(478600001)(31686004)(7416002)(5660300002)(2906002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0h2WjNMRmJNeTdmb3ZmWFpaS0hMZ1dqRmRTM0N1MmE5Z0lxNGtVNTVjcXpR?=
 =?utf-8?B?Qmd5UzRDY09aZWpaYjMvMmFHVDJUcjhKQmt2VDIwRmFyNjUyQlVoajFadWJ0?=
 =?utf-8?B?QjJyZTROa2IxMkxGMlAzWFpYTWYyQWZmMjlQRmg0Z1BQZlY3bHVxNTdObCtG?=
 =?utf-8?B?WGc3RnFPUHgxWkpRSlpYVkpyL04wMDRGQkhpYmsyRWVQZHlBcHRmS0hrRFZn?=
 =?utf-8?B?WkV6Y2dXd2VEZmpCQjQ0ZXBlV2Q5dEdaY3cxaURnUnhsUno0V29qYUkxMGVU?=
 =?utf-8?B?Ymo4ZTdVa3pYUDFJL2YxNVFHdjBPc3FiMzNYVXNVdDVGeU1YakoySXNDeE5K?=
 =?utf-8?B?RURRRFlPVmdZb3RPQUZSZ2dzdWxHeVF6Vi9vbm9vQlZKdHYrS1lIaDgyaWpM?=
 =?utf-8?B?SGZ6UXdXMDVZUDhwRXJ4NmMxZzArUUNVMUc2Z3JJbk01NTU5emtxaklyOWZ5?=
 =?utf-8?B?TmdlTEJxcHUxV1dSZXJvZjliUHh0WlNnK1BTcmFkbk5NYXFXemdmQytDMGRo?=
 =?utf-8?B?ZjRPN2IycWxkTWljS3BkcDdLYkZWZFVDZ0w1UWtTSlFndnZOdkhoMVpnTzN1?=
 =?utf-8?B?WDJCb3ZraTBraVVZVW1mNmtwV2lRQkZUZzR0ajB5Y09PSSthK1A1OGx1WTl0?=
 =?utf-8?B?UitFYmpWZEpLTjdHbitDeVhnbjdDMGxBZnRpM3ZqM1hhV0cweHAzVjhJMkVv?=
 =?utf-8?B?RDN0cEVZT2FaR0JjRkp3dkV3VkoxcGNFeFhQc3BNZlR0YzFhTDUvVGJkZlp5?=
 =?utf-8?B?aWV5YWkwMjlOVGFZTEZZak4wQ2wzT2Y5Y1hDU3EvRnJrRHZaMzJBMThqaTBx?=
 =?utf-8?B?bjBGM2JTWGY5ZTBWbjZEM3Bma21hQWpYelN2S25xNHUzL1V2VVM4NS9kTGRE?=
 =?utf-8?B?b05kOTF4SExERDBGQkQ3YUNqMGwwY1V2QTBnSDhHWmdhM2tIS2FlZy9JZmlF?=
 =?utf-8?B?bGJZTWxyUWVwRWY1U2hlZGtNOU41anJPNXpQSDZoRHpuUC9IV0IrQWlYN0ow?=
 =?utf-8?B?eWhnbDJiNXJONUYwMTZ5Nit5UTVwc2RpdHRsZmdTaGplYVBrVDhMOTQ3L0to?=
 =?utf-8?B?NFNuVG1zL2gvV0M5Q3l2TVIvWFVLNWxsYWpGY0ROMmh1SmJOUHZobWdUdzBa?=
 =?utf-8?B?RHJFRGdqMG5LRjJ4cTNjZFc4dDhlTlduWGdxUFhvZ1BYL0pucWVMcTJjY1Ny?=
 =?utf-8?B?TWlCNXZnQUR6SEkvaWo2V1N0bzZEZ2dFR2JMMzBZY0g0RlA2UUpjSFpXVkhh?=
 =?utf-8?B?aXFNQkNucVcxbzU4Nmh6NUJrQ2xoQlF1dW0rWmJsR014QzJlUE1DdmhPUTBW?=
 =?utf-8?B?QWRSTFFJRXliRVRLcDdKTTh4VFRpcUZqSE1jcCt2TWM5bEJXTkc0b0xlZ0NN?=
 =?utf-8?B?bVRqYXRtVEpCRXY0bEtkQ05Od0RPR3RlTUxQZjI5OVVWclRVaUZORTF4ZnJ5?=
 =?utf-8?B?NEVHd0x0R01adHpJNjBVTVVBc2pUUzhxak93UDdNS3FnRWlxSno4VVpUbmlw?=
 =?utf-8?B?OUlVZDY2MWJDNVV2TGwzOXlhdnVnQi84QzNNZHRMZ3VXOVozNEVzTDlmRXVI?=
 =?utf-8?B?R2xHY0xaSmtvQ1ErVDVpQStEOXFmamZGWTVObzJyUGlBRDNwOUpBY04yQVpR?=
 =?utf-8?B?RElTTFdIMnBHVDVVNDlEZzV0eDgxSUJZZjIxTXpyRUYvb1h3NUJSdkc3MnZM?=
 =?utf-8?B?b3RMUHZyV2EweEFLcVNNa1Q0M3NJc3JSRnF2YzNtb0FBV1FwYVRZWGVLTlU2?=
 =?utf-8?B?V3phT21lZWg0Nk5OeU1QdWZOc0hnemRRUVF0aGh6dEswMFpBWkhPbmtjZytv?=
 =?utf-8?B?K2Y0a20wdVkrRUZHU21pRTJjMUdsc1EvMUdyb1Ayb1J0NmhrdjlmS0EyUTBK?=
 =?utf-8?B?bFZIdU5SdHV1QmlOSmxHOXAzMkJ1K29YWXl0UldNS2hpSlJtS1NlNWhENG1B?=
 =?utf-8?B?UGl6RE9sM3NuTGJMSEROYmh0SUFESUU3djZQUzFPTGJZcVloZkY2aGZqS3Zj?=
 =?utf-8?B?cnppQnlobk54c3hHcjl0Yng2K3MrVi81d3hraFAzTzZ4RERhTDRHV3d0VkFt?=
 =?utf-8?B?WlU3YmQrMXVnYmdjSTFiRGJScmsvUWhCMkpXaUhYc2ZBSGxKYmptMmFCVGhC?=
 =?utf-8?B?REFJaXVnNEJ3YmdLSlRpWHZteWxuZnJ4T2ZxcmV0cWl1cjJsZjlIaUJRZkRS?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26475419-15a5-4b98-9151-08db99bb8eb0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 16:05:03.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCg5Zk+r6w/IjLVgzNyE3rVCUZU6lxdcbI5+BQlMzrLM3JXSXfUjiDTpN+Ek0ep9Q4f3RH2SJMPBY/348SRGqpVyt+BPnmNpJwdgWL9nQBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/9/2023 6:57 PM, Mina Almasry wrote:
> API takes the dma-buf fd as input, and binds it to the netdevice. The
> user can specify the rx queue to bind the dma-buf to. The user should be
> able to bind the same dma-buf to multiple queues, but that is left as
> a (minor) TODO in this iteration.

To support binding dma-buf fd to multiple queues, can we extend/change 
this interface to bind dma-buf fd to a napi_id? Amritha is currently 
working on a patchset that exposes napi_id's and their association with 
the queues.

https://lore.kernel.org/netdev/169059098829.3736.381753570945338022.stgit@anambiarhost.jf.intel.com/

