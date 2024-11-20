Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108ED9D4407
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 23:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B752D10E3CB;
	Wed, 20 Nov 2024 22:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqD/3z9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D9410E3CB;
 Wed, 20 Nov 2024 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732142996; x=1763678996;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BoljU10yPsS0UNoO74tSYLq9rtQMIH7yBRa6Wfu0Nj8=;
 b=gqD/3z9Mky3Ft5EpNDx2RargG9G3uksu6Ei5sdkK5S9uJlRQMkZpN5MJ
 2rSxWGjvDGOIKKx/keYJfDDO/yuKwUKXu9qPsGjLbfKW4z1iQ/sDNMRfT
 t4SxDj1qDC5eh1+901qDxcglqZFUvDbcI89MgjsHzv2RRrkNfGZX1TD4A
 GKFUebx+3Ucv8PqJqvQqqsgQQEParZ2HxKzdLPhBh8DxLu3Ws5kQVYULh
 QwJSpoBO3fSGUfjnwqk1wsCNWgcmxPdp+MmTBQRVMDx3iC1XJ5Em+kseo
 Mt0Lomuczj52pQPczd0pHZUnK5TPg8D4r//mz5DshW9nuUTv4eeJRGo5I Q==;
X-CSE-ConnectionGUID: rJRNZ6TESZmMbsWYLJJBKw==
X-CSE-MsgGUID: dc5otGe1S1iLJrsAnInrWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32364500"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="32364500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:49:56 -0800
X-CSE-ConnectionGUID: y1mQwrp/QYOH5hNhRlILmA==
X-CSE-MsgGUID: WI5+U+XyT7aQ7mQ5xedjIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="121008499"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 14:49:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 14:49:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 14:49:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 14:49:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px39kNTUExk1D1wotx2Gs7YS1LwFPSIhaerEhCW4CZ6tlWObEzQvl4GVjdAAUokddy2ak0fpcJp4/USEsUKHZXkpexrPySWxX/7sn1f49lnU50Y72G2rOXvYOy2D3/oseGVzPjkv1GitigGy20nZnKkyimX4Iq50xWuPgxO18lWMnUNatq14yOe8cw4Eh3zzW/8QTv5ZBg3HiOqoqQTMT+0AV5bhpnSA76TEllaTpMumBpAOULJwL2wPc7yuOHCp6uifYkSApomFTaB/Bb6h/+/+QiOc4MOoZM6cMdBZRhCpQEg5xN6cdbn7FVlc0gu+siXhljpmnHVwjqTFJAv4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52tGio6Xub5Ug0qa3+/fV7gCsCTj45GbZmEIxo8d27c=;
 b=FxCJM1R7SHGenWK6BfKM7ZJkOjyOZk/YEtx/6VOtYTW75oK0FELX9ZLKM0+mbII9NkJbB9dZ7o6ZWm8AV0TOfG+I4TL+rDKtslB08LTiUygImZcY437Xo9/pN5qAe2xZb+7wHcGuwXt+xI7D6LT6xUBdVO/zAADxYTjgW1y+t6oTPwF9ctkK2vhNg1g0uLV+7NFpHFxAc/bmPHnnN6xp0eLwwHGUtjZb2sXskOxE5UfktbuwA4eDz+I+vBD+4Ei3CsehanwPfCkFCNou1UXgyqq8e27iFiEcBFYNlLj9RP7KQuX+0TCyylEQEh0IxPd5cpr89/jViWMHLZoITpuAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Wed, 20 Nov
 2024 22:49:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 22:49:46 +0000
Date: Wed, 20 Nov 2024 14:50:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kenneth.w.graunke@intel.com>, <lionel.g.landwerlin@intel.com>,
 <jose.souza@intel.com>, <simona.vetter@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <boris.brezillon@collabora.com>,
 <airlied@gmail.com>, <mihail.atanassov@arm.com>, <steven.price@arm.com>,
 <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Message-ID: <Zz5nrl3H2wAagwgE@lstrano-desk.jf.intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-3-matthew.brost@intel.com>
 <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f802caa1-85a7-4a5f-ae92-9b1c0f4c500e@amd.com>
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 598a897f-6384-483c-4470-08dd09b5a1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JMe7j4APXMVKgWG6cujGiqIyzhGekCk0m0x4Xc0lCrTbbjTxkni8ptYBIx?=
 =?iso-8859-1?Q?t5mPRPRBaz+hwDld9P5IyCHyqcWofy13QVH1J35VNDPO5HjTNMldGhTSoq?=
 =?iso-8859-1?Q?Zaw9jLJHzSw3cxWR79bZBaI9bkoD6CmStccWCoEvR7d5/VlkMPLcaCPghx?=
 =?iso-8859-1?Q?jwsNRfDcSXHXu4aYd4wFJpUOq2ZhaSR4aYEUMpZYxqajoX/BLmRNIQMhi5?=
 =?iso-8859-1?Q?iJFh2M13/kowCSMsEOmLNk0uiguyO+rKap/O1VxWpOG/aQ7CBuB/u1Ovxx?=
 =?iso-8859-1?Q?ZiIY4Wu8IYfNFYi/v2i2ndxSJPjRgkZw+iavtVNXvuryF5lfqrauUEdlp8?=
 =?iso-8859-1?Q?jMQNQbHIC6JT8MeM1tcvmr4FAkyuvgC4PqQNvHp1roKx1JtA92cDqztFr6?=
 =?iso-8859-1?Q?8OLEsaCwPjPcmsYztpXTy+yqf5NNYhs4QSkVgFmvVZGTA/gs1Mb6lDsOHL?=
 =?iso-8859-1?Q?45bL/L7/bSThN8jgWvRhww3ZNXlk0d8JO2m5nntRPAadE2yw3hqpo6JHSt?=
 =?iso-8859-1?Q?P0cLO1V9kXDMRSSZPfdVbj610k8GR4GRqhEj0cytpJRpmF+G0ZKz5wMUky?=
 =?iso-8859-1?Q?jCLBV9fiLkbnDjx2Xs6TAOzkaNf601m65jkK/hPmLctx1u2KTXp+j6OS8p?=
 =?iso-8859-1?Q?7myLlzGg8u7oJtcRahDzp1PkxyCDybvqq+oydLQ94L1tvJ9eQgYvtMIT9e?=
 =?iso-8859-1?Q?EbKciHHqs7RQTuW4kpvMWtjbwXlBh9UBPQG6kNBeT5QgJ3zJiME/a3tzr+?=
 =?iso-8859-1?Q?kp5NvawVoG5oUqvc/w7ShMcMZpYDD/AxOUSGFd4SeGoD8htkL1hec4YXAi?=
 =?iso-8859-1?Q?WTgh2L+TarzBNHkF9dJ/2zejM0ZOv+wSBzl3Yb6/wWjT+chy0zbAANx3ms?=
 =?iso-8859-1?Q?FgNUcPChmm2fUGZDZQp3P8vSjnM8vU+mjNWD3G5XSWeezpDEYF5veF3kUe?=
 =?iso-8859-1?Q?pzkDztbnLkcgrXOlOcHR8KHZBWDzdfz9soA8ywmWHKDOkF07VQbkxlTggl?=
 =?iso-8859-1?Q?W2OyUArXa3d7LQvkN2YoDTRplPcHR+o/YgN2zAeFDb+BSir4G3TYcxYKbZ?=
 =?iso-8859-1?Q?rj/Ja73crMAo+MeGEF9otKh69vEFuGcz32BqFvQb0srQH7zWt4Mi1FxW42?=
 =?iso-8859-1?Q?gKkwG9PPsZqM7f1LPBa0C2YDCXPnWwlEH647CER5K0nBckkwNr7hYpvgKJ?=
 =?iso-8859-1?Q?QCZs/Ue+HZjfoETPAkX2aFOk5EyVRsElIIyYaxXvxlGu6/uCig6dmNvFbF?=
 =?iso-8859-1?Q?yrAdFrbTRiuICJUbKNWUtKIoCtU+ZHsNIDSpX1mt+/6UYy7F9XjmxLxDOC?=
 =?iso-8859-1?Q?OvGf8Hey8rncYg/fSeF1Ymtr22MrxvtAxoUWeDPmS/ICpRpxm6K17Bg0QG?=
 =?iso-8859-1?Q?Vr+4NfdiNV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Lz3gq4JP49YTVaX5qmVz+sNsKMENFvZlnOG5GeDDIDfNcUWABE6iESYwuc?=
 =?iso-8859-1?Q?XJxLlR0JkjRQj1Vs39R04qOgEPxMc9bfBQiZBjLXR3bZT0QmSOR4mbMYgy?=
 =?iso-8859-1?Q?9niItPogc+UZv+lpkx9IusFG8n+nZstbz7FH9ag4P37at7XEjHMi5Injld?=
 =?iso-8859-1?Q?raPHczGKkWgVckEsNpFf78CRnsrpqbeeqLnnCJRFZ/KtbG2WujWQGrB3tZ?=
 =?iso-8859-1?Q?LO0K2VdPazBcfBEp5T1exml9EUEGk6j7ZxE5VnTupKmpZ/jZHpfRGO9YLi?=
 =?iso-8859-1?Q?+Wkqx4IH4yKgr50+A7560C48XgJlB9dQMK0uQht1NHUVVaYkApLIBflJgq?=
 =?iso-8859-1?Q?1m3Nht0ajX8ckFQh8X2VyevnVgpNvAgnpGb8kcYgGThBzS4EWAVfzQ5rr9?=
 =?iso-8859-1?Q?PgqN6Ie8xu1yxDjra6bZWNfLWHEKBnZBeyE7C9MyywjbpA/alQnYJXCcUP?=
 =?iso-8859-1?Q?v6fmRDtUG31QZUgLIkIRGVq78BzzmEtz/JrexrrT4z6VG2MppO7+u9OLZx?=
 =?iso-8859-1?Q?1bLHTrnY+3bnM4nuzaGoRkXTNSdtHW0XFlLkYa2lKYOSqQDXhtOpv9ExGg?=
 =?iso-8859-1?Q?LrTKvMy45DvoOHOTKzjLeKnbbcYzuvSJiao7smGdLqKoYqGJjNEiMFQknR?=
 =?iso-8859-1?Q?KMZozsfnoTJqiMozwaOHI/ITBlA0hMUL4zRz7Sh+sSgQzmfjU33lGdP9BJ?=
 =?iso-8859-1?Q?qJXmmY0myVsr07/MtJF26S1ZnAe11pHlWzaQ2vRKoSqae3jQy7ommTr2N6?=
 =?iso-8859-1?Q?4Sn0Ycu/pSW8AwGf6Zs/wlEQSRJAK/vKYWRt71B/sM1wA0bUfgmSLopguO?=
 =?iso-8859-1?Q?becNJjpwfoJRulS85ec6pM2mQtIbEJspOnma6TWUY09CiCA2L7jZfdvezg?=
 =?iso-8859-1?Q?zi1XLew0WpYStrDFF5fh4ZPx71vAt7MagosWbNBZ5U+mpRGn1yMCw1EPM+?=
 =?iso-8859-1?Q?6IL+aRiRcQ/l6QjySWkJsgwCmuUX1z9qM+RHULRL3EGffTYZ3UeiW4+eEZ?=
 =?iso-8859-1?Q?2eWFJh6mYsX0MSl4Uv5PfUauo8qGcXbrNSrJ0uumpRBB37rdOKnKGFDXXb?=
 =?iso-8859-1?Q?68u3eTeKllqWNThAAmybeRkqdTdzrvIl9wnGH7lWPKMR++K8faqXMawzPY?=
 =?iso-8859-1?Q?vk6n2AZpnRV5ssE11W5MWfR4XGvfcLxdY90NJgv1dRGKoTdVtR4jqDOnlg?=
 =?iso-8859-1?Q?K+MAejKUnrrhd3Ia650xuaMMcQptDuBQ7Ns8oXvgVKQjYNQ0uv0SGvYoxo?=
 =?iso-8859-1?Q?22u7KLLOsSgNLSI0p86Sa9Z/yZ+6QDgnpFSolEsT01aXaw7Ep4YJchZ4fd?=
 =?iso-8859-1?Q?NkQbZOSdp4oUf8PDmg33Syux6Nlbt9VATzcuAOhbwynYwSaxCtl2VsXISk?=
 =?iso-8859-1?Q?GKtmr1rlMZG6j0/iTW++h2bqRRHlz8OoA7Y0NbeE9KqDbSvCsbDSUpmgTe?=
 =?iso-8859-1?Q?H/VWIopk/0Lsn8Slqrb4HzKcQRBA6o0McCPSAePNCdAQ81rHALuuzlDKkV?=
 =?iso-8859-1?Q?2YaOfC2axVVTENxfeJEsY9JIznfD6VmIFQhCZziwBluLtMKllY33hR4nSw?=
 =?iso-8859-1?Q?SQDcunwcMlKQPklDeZ7E4hLt8SFhECrrAygDbR0rooNMPjeZTIZ9J/WeGc?=
 =?iso-8859-1?Q?5l18Cia+ZHzXh6I8mu8SB7cAiZLYMcgspfgHF02JbD0zg4oVKMht58hw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598a897f-6384-483c-4470-08dd09b5a1da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 22:49:46.7078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAqp+JuiqBmL95WyX8BfOTvMPXbIDMH8xu7dJWEF375qSjjZUifvzWYn2rxn5IBntqR/YYmyp+TxKvIDEwvaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Wed, Nov 20, 2024 at 02:38:49PM +0100, Christian König wrote:
> Am 19.11.24 um 00:37 schrieb Matthew Brost:
> > Normalize user fence attachment to a DMA fence. A user fence is a simple
> > seqno write to memory, implemented by attaching a DMA fence callback
> > that writes out the seqno. Intended use case is importing a dma-fence
> > into kernel and exporting a user fence.
> > 
> > Helpers added to allocate, attach, and free a dma_fence_user_fence.
> > 
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/dma-buf/Makefile               |  2 +-
> >   drivers/dma-buf/dma-fence-user-fence.c | 73 ++++++++++++++++++++++++++
> >   include/linux/dma-fence-user-fence.h   | 31 +++++++++++
> >   3 files changed, 105 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
> >   create mode 100644 include/linux/dma-fence-user-fence.h
> > 
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index c25500bb38b5..ba9ba339319e 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -1,6 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > -	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
> > +	 dma-fence-preempt.o dma-fence-unwrap.o dma-fence-user-fence.o dma-resv.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
> >   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > diff --git a/drivers/dma-buf/dma-fence-user-fence.c b/drivers/dma-buf/dma-fence-user-fence.c
> > new file mode 100644
> > index 000000000000..5a4b289bacb8
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-fence-user-fence.c
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/dma-fence-user-fence.h>
> > +#include <linux/slab.h>
> > +
> > +static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > +{
> > +	struct dma_fence_user_fence *user_fence =
> > +		container_of(cb, struct dma_fence_user_fence, cb);
> > +
> > +	if (user_fence->map.is_iomem)
> > +		writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
> > +	else
> > +		*(u64 *)user_fence->map.vaddr = user_fence->seqno;
> > +
> > +	dma_fence_user_fence_free(user_fence);
> > +}
> > +
> > +/**
> > + * dma_fence_user_fence_alloc() - Allocate user fence
> > + *
> > + * Return: Allocated struct dma_fence_user_fence on Success, NULL on failure
> > + */
> > +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void)
> > +{
> > +	return kmalloc(sizeof(struct dma_fence_user_fence), GFP_KERNEL);
> > +}
> > +EXPORT_SYMBOL(dma_fence_user_fence_alloc);
> > +
> > +/**
> > + * dma_fence_user_fence_free() - Free user fence
> > + *
> > + * Free user fence. Should only be called on a user fence if
> > + * dma_fence_user_fence_attach is not called to cleanup original allocation from
> > + * dma_fence_user_fence_alloc.
> > + */
> > +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence)
> > +{
> > +	kfree(user_fence);
> 
> We need to give that child a different name, e.g. something like
> dma_fence_seq_write or something like that.
> 

Yea, I didn't like this name either. dma_fence_seq_write seems better.

> I was just about to complain that all dma_fence implementations need to be
> RCU save and only then saw that this isn't a dma_fence implementation.
> 

Nope, just a helper to back a value which user space can find when a
dma-fence signals.

> Question: Why is that useful in the first place? At least AMD HW can write
> to basically all memory locations and even registers when a fence finishes?
> 

This could be used in a few places.

1. VM bind completion a seqno is written which user jobs can then wait
on via ring instructions. We have something similar to this is Xe for LR
VMs already but I don't really like that interface - it is user address
+ write value. This would be based on a BO + offset which I think makes
a bit more sense and should perform quite a better too. I haven't wired
this up in this series but plan to doing this.

2. Convert an input dma-fence into seqno writeback when the dma-fence
signals. Again this seqno is something the user can wiat on via ring
instructions.

The flow here would be, a user job needs to wait on external dma-fence
in a syncobj, syncfile, etc..., call the convert dma-fence to user fence
IOCTL before the submission (patch 22, 28 in this series), program the
wait via ring instructions, and then do the user submission. This would
avoid blocking on external dma-fences in the submission path.

I think this makes sense and having a light weight helper to normalize
this flow across drivers makes a bit sense too.

Matt

> Regards,
> Christian.
> 
> > +}
> > +EXPORT_SYMBOL(dma_fence_user_fence_free);
> > +
> > +/**
> > + * dma_fence_user_fence_attach() - Attach user fence to dma-fence
> > + *
> > + * @fence: fence
> > + * @user_fence user fence
> > + * @map: IOSYS map to write seqno to
> > + * @seqno: seqno to write to IOSYS map
> > + *
> > + * Attach a user fence, which is a seqno write to an IOSYS map, to a DMA fence.
> > + * The caller must guarantee that the memory in the IOSYS map doesn't move
> > + * before the fence signals. This is typically done by installing the DMA fence
> > + * into the BO's DMA reservation bookkeeping slot from which the IOSYS was
> > + * derived.
> > + */
> > +void dma_fence_user_fence_attach(struct dma_fence *fence,
> > +				 struct dma_fence_user_fence *user_fence,
> > +				 struct iosys_map *map, u64 seqno)
> > +{
> > +	int err;
> > +
> > +	user_fence->map = *map;
> > +	user_fence->seqno = seqno;
> > +
> > +	err = dma_fence_add_callback(fence, &user_fence->cb, user_fence_cb);
> > +	if (err == -ENOENT)
> > +		user_fence_cb(NULL, &user_fence->cb);
> > +}
> > +EXPORT_SYMBOL(dma_fence_user_fence_attach);
> > diff --git a/include/linux/dma-fence-user-fence.h b/include/linux/dma-fence-user-fence.h
> > new file mode 100644
> > index 000000000000..8678129c7d56
> > --- /dev/null
> > +++ b/include/linux/dma-fence-user-fence.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __LINUX_DMA_FENCE_USER_FENCE_H
> > +#define __LINUX_DMA_FENCE_USER_FENCE_H
> > +
> > +#include <linux/dma-fence.h>
> > +#include <linux/iosys-map.h>
> > +
> > +/** struct dma_fence_user_fence - User fence */
> > +struct dma_fence_user_fence {
> > +	/** @cb: dma-fence callback used to attach user fence to dma-fence */
> > +	struct dma_fence_cb cb;
> > +	/** @map: IOSYS map to write seqno to */
> > +	struct iosys_map map;
> > +	/** @seqno: seqno to write to IOSYS map */
> > +	u64 seqno;
> > +};
> > +
> > +struct dma_fence_user_fence *dma_fence_user_fence_alloc(void);
> > +
> > +void dma_fence_user_fence_free(struct dma_fence_user_fence *user_fence);
> > +
> > +void dma_fence_user_fence_attach(struct dma_fence *fence,
> > +				 struct dma_fence_user_fence *user_fence,
> > +				 struct iosys_map *map,
> > +				 u64 seqno);
> > +
> > +#endif
> 
