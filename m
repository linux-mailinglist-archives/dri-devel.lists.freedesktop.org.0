Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95929AC0CE2
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0A310EDB7;
	Thu, 22 May 2025 13:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azt+xpH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E8810EDE2;
 Thu, 22 May 2025 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747920902; x=1779456902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eO6FtNEr7VeK8kbtcgd+2b1jqH29fEU0rJFAn2yVjB0=;
 b=azt+xpH+/Runt9vZMmY8zf6V46yxjbYsBALUYxnfgANhTVlFiFVXyu/2
 weEaRC7aZ3CMPzzatkBTAnYG9zKZLjWC1uRdqw/uM3GqYrRXakF15IRQJ
 zkapAyjtlQVRN8TOqxgiGszi1GGWtGQUZQ45vnTZNHb3LdlTt0jb3uUNb
 FKqbuVGVu459BxKRm5wKHeH8/H/XU8M10I3TO8bt0xcDFROXtxUtuFvzt
 +spnQWJDMDwEdmCzRRXQ4geQHNqiAIlgtp7Z+cyA02l7PWdIN09n/CF8Y
 1sO/iRllgPlBLIXVJ4Qro6AIOeMu6FNbrMC0Uu/xNwfi4CAV8wz883w35 Q==;
X-CSE-ConnectionGUID: Zus5dGluQcKaXh//SY4mWA==
X-CSE-MsgGUID: d5oggGyISrKPyvBkFJUXOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53610058"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="53610058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:34:43 -0700
X-CSE-ConnectionGUID: nnutytN+T5aruoOXWWX5zw==
X-CSE-MsgGUID: bng20pt+S+2s3HX/iO/tGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140475425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:34:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 06:34:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 06:34:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 06:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2vrrgBUNOWlGSrR8yiLEW3iMnG2PDjfVbHlbGF3vuCeXv+ONFfrJC6X3o1KyMi3CoeMr3QrIHPsVEZLffYPrIT49aKEThmdVXgRC/Zuqp7JvnaCRjmR/qW9RykvHX71y3JYTS1EpYyvonG8gdL2gnkgQtjbHdRSJY/4AQr+wC/EUXTWP8z88aygQv01M8FydE/dOjqXcNTTmCvARBzgOp3/5YMSc8qTBhX366OyqDkiK77yet2mJTAhVz1O0a1P6+IhKADxZ9Q7UlOYPHI95v/kgXWWd8CAMtxy0r+XlPT5lKJm+Nvr7656fx86VKhoZ0nIGBuU2HAnjmT3b+qxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmXOKwvKbZO3izTwVcRVucdPMAoHmbo6ukcaKmOqZXk=;
 b=ai769TTOuVcK9vJ16y7b2esp2mEKVC59BTabS3pyMRwELU9p/RVTIrS4BDEsim2ggolztpLlz2TxZXhz91Gyj5Zmu5X0qhUuw4TBePX71vBtnohauZiJ/U7C65sosXoGoXX0Xs0ZieoI92yvCCm835hP6f95aTG+pG+Lk8ztYmWUmGu+zjNqzu1q0+yJYVu/PCCH4kHiNMrip+9QkbypPWbVeie2/qNZcVwT3EiDR0feNkuGVgnLIpbarEls6sS6xmdiHKSOdhH9F9IKvgkRPP111K3PIfIZdX7MNoXeUNqbdCP8svV/ihXPCUVNR42KbMgAuWfdSCTzQU8krrtH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 13:34:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 13:34:24 +0000
Date: Thu, 22 May 2025 08:34:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: Dave Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] iosys-map: add new accessor interfaces and use them
 internally.
Message-ID: <f54h5mhkkcexf57vpyrzscjdetztqt3itg47fmlazsbo47zrcr@swwclbb7dkg7>
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-2-airlied@gmail.com>
 <2cc885d5-adcf-46d1-abca-c50431ca8316@suse.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2cc885d5-adcf-46d1-abca-c50431ca8316@suse.de>
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: e98c3af3-830a-4a47-cb77-08dd99355ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fydLf1KxhJYghCp5E67cMaI20j1V+gb1rYZJ5tZDLhu//F3fkdXfFUyB+1cx?=
 =?us-ascii?Q?CdueuIRY7iKONgQpsUrb6Z1W6QxhGWNzZhoL8b4U/SLRrooaRZYwW6iWzybP?=
 =?us-ascii?Q?BNuO2XDoc5Y1snNLSC3vIBlCw9D9xRHaMbizteyPpN/IZegIQgJrjyAUhC03?=
 =?us-ascii?Q?h0pdIQv96EsrX+zyWD0V8zmygHIeEoUGnWBhHCadUDBHH7zHGXT87fwd/lq8?=
 =?us-ascii?Q?akGgKUONqIbwbJw1FWsixX0Bx+M9IIwevpnOnz0/HQ8eyGqjD0IRId0QtvO7?=
 =?us-ascii?Q?FpJGxMRzpZlGSd98B00fWqIcpRxc2kozxPCUcCdQAuQwDFN67QUgTjAsIGRw?=
 =?us-ascii?Q?bNSMAhKuYko6yqRq7tXwfdZHisVA7Gr58LTmjbMpfwt8hvP3T2dK4HSKmTiY?=
 =?us-ascii?Q?6n7CSkULjTc6yXGJHj7dQf2sRmlRxzgqVwsrtF7CUk7kvwbGSzGQMRUIUfvc?=
 =?us-ascii?Q?rmpxN4nmqhMGqLKhvciOvN+xyplyWyvqLV/b3RsE0IQgzlF0KAxPTn2hSKNk?=
 =?us-ascii?Q?zboiWURy0jTVDM6p2m9qnHpI1Y3KcQEezxxrXgEqRxUuPSs0v4fz+BeMAM9g?=
 =?us-ascii?Q?4jsEg3hksH2k13E5wBOqpN5v2p1aSaX7a7plwpdn+Kg2KxsMZX1ZccPmiWVa?=
 =?us-ascii?Q?C6d0fLArC33ng4qEml6ivTZ3xpCCzjE0IGDlyGebQJm15ZFqhFsw3hioaeTi?=
 =?us-ascii?Q?yZ5X9ODdbFsR0HkT5DizfspW51e/Fcv/enORh+HXfUO3UgHITztHuHcQnCyt?=
 =?us-ascii?Q?LRHx5m4/tEkzj5SviuG14FM2boF9dBokx4eD/4q3/obn6W4F3E/R2lIBIMOq?=
 =?us-ascii?Q?/bxoHFgyc8E19pY/bZ3ZbMLBOdKed++wtQ2VtsZI9g5wU0daIlx9/5JjzxVY?=
 =?us-ascii?Q?xW4ycUbaKrWqzgTOAqGWIKyp7PzaZQ8JUOtRmGJyNKhyehQ21ZUiXKe+aTIw?=
 =?us-ascii?Q?r6tnL7hDO0oi10uJ7RrcC00SMVmQaU0IHCj7tvNcNW8x7PlCs5Wg57Gubdnu?=
 =?us-ascii?Q?tUrWf25DB34eCcufKGJxNAWs10OQjTHom2TE0yYmOPZDnjrCnOCfNWerSYxc?=
 =?us-ascii?Q?YKuUGoVbUbUrVX1CG1dO5vHEMU8GX/wIxLltGaimY4SYJd6CmaBEXUQ3XQGL?=
 =?us-ascii?Q?1C7fg+FIBF93W2bW5ceaLk4CipOapXBDPUvTDXj461lmzBeERmW1qceHbYD+?=
 =?us-ascii?Q?mqinl2a7832ihZBuGTnbZ/IrTpfK/ISqxTfDlPQY6fH2lPta7XaFSgIZpFBx?=
 =?us-ascii?Q?KKq2/6kiOYHD8HVR5Ky09GgtiG6FPEBlmN3yecIL2vMcNQZtOtYFwSObENid?=
 =?us-ascii?Q?37q9U7Wz5kiSJTIU0jYe8AN3zuFEfKnKo29zGu+HI4J4XXdIfkF8ZrxzUlwd?=
 =?us-ascii?Q?GwKgKsjxcE0l4jnS06YfwJz6AXg6M+sKMxEjh8k4M7txFoghPpySGssmd2tO?=
 =?us-ascii?Q?lv+yFmDxPn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rmc2FQxHKhuswcyXKypk1enY6XwaMBuxvAd+vuKSr7Djm3oU34yAubvnif12?=
 =?us-ascii?Q?K2niczMK1Iv022PW/Te55V1sPM1AmC2r6cVXey1DaoBBZzj0DtJVvkKXBWCT?=
 =?us-ascii?Q?lxKczC3TTPz2PVxhFYmg1zMPI07P4VLJ7ox7Rgy2YT0vuKdSBaQ7js1kUOU5?=
 =?us-ascii?Q?CEppbCadI4ctBCRh5oDwUqO63wmnBdANLWVS5/ooRfp0zY26mVvdk42GbxJ9?=
 =?us-ascii?Q?v2qakB8TuAySF4YH4LIxQsVsztP+pP34y7++gH5+OnJIGJXqGoO13lX0BSoq?=
 =?us-ascii?Q?cffFO7e51aCIk5iRmokD7kH9p9FuX0Y/mzhjbtNCnLJue+74waC+aggaA5/J?=
 =?us-ascii?Q?q1BauxipvOsszzjho8Vev19FObQa5huFXJ0lrgtcKdscqoBbKI1RhuXDcqUA?=
 =?us-ascii?Q?Ehl2Lr+98XONI2YV21F9p1VS/136MO54jBxBBoOTy1TiNaJ87HCAzTJw2Ayx?=
 =?us-ascii?Q?bpVmCqu1Li7Wy1MMZuZQTsHhwUnmyPpD7gatXMJqlJYsGVe2eu0d/goouO+Y?=
 =?us-ascii?Q?9d+YsQqR+aLXg7lviUbiSd6SkEHCKOgyPaCop7OR9g1UW+aLFMbzWbN0Bo1O?=
 =?us-ascii?Q?qoudMLWZ73bgKpgV6lyX/p1mMnlYYGt0kv62kLknH2CuDoHoVRvjkbbahXoY?=
 =?us-ascii?Q?yYpmQZ+1VUHzSvWEyiI9eVReYT4fTyPX9wRJ4U0uOojXTU/VloAR/DvPfK2x?=
 =?us-ascii?Q?Ha+SCnbgIzxx/8Yt2iaxWLi6Yx0Pgd07M9oSOPBUf9FwbNzIhbGbySpEsRzH?=
 =?us-ascii?Q?9Dp5v8QWCJvlfAeFDgzMUhZ/vbgIerr1kXpTcVUtYwnxWf7cW6hRD7DbR0LR?=
 =?us-ascii?Q?SkLkwlVN7Oor6H6q4WNmRq7xcrJMzNNdQ8desYJohFN2w8yQLArI3MatYSVx?=
 =?us-ascii?Q?AEuPTosEReXGJnXr8gd+QCgCXpRRvnch4ormt0lEv4/XAsFfnGmXmXN6473R?=
 =?us-ascii?Q?Fhs1okKgq6XttzuHR5jUX13DMwVRICU2my84+EaD8WYi+GzhLvdmROsOF+VV?=
 =?us-ascii?Q?PBujDFYbrFeVgm5LEHKfeFil5QTKQ2S6Y018OrR96KrNh8Nm196CP3vaZusb?=
 =?us-ascii?Q?S0OZGgsZ3Du7QSdDXJ8zFmLlMa44Ec2ZZ8MI7uS7poE5wWAXxJaXz37s12oZ?=
 =?us-ascii?Q?a6aNY0tqoM1AAYX1GD6XaoADfkQmpQrUOoZO6iCGiKy/9GjENjCDatTQpdbd?=
 =?us-ascii?Q?EKvkZaO96Esjf8wCs+D5uL59zuKZjKfP13fzr0GMw/W6LTCYUrNbuB7n75YM?=
 =?us-ascii?Q?iUb21dzdsBGZs2XYKbwKmPGCQgLMJIYn7hzDVW3sHFTwwOvM+ZlIJJg5f1ZK?=
 =?us-ascii?Q?qUd7QArDTh3QpS23vbpOjJwqmX1gKVx/Knwl4mJot+FWUnbIUgaj01ulP0rk?=
 =?us-ascii?Q?Q2ILHHtB8R2URqvKpjQ188ixKmfJzAkPO8tBV7uApWmIt+rCxgOTa4mXcOik?=
 =?us-ascii?Q?B22JCqjrZuhvFXBHtb1w+H2t8Xdg7ku2Q21C3wQoDbPva5UmngI7N0HhKbFh?=
 =?us-ascii?Q?UKizQP38kxMhs4Mnyf08Sk2wRYTSH/XFBPSU1wB6OUAGKGwk/zLTwZNyQZFU?=
 =?us-ascii?Q?NpA/7G0yjLi8qUAKPEgiBELyETyye+EPXkh/worS6fJMu0xgPDpNjlQ11SgZ?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98c3af3-830a-4a47-cb77-08dd99355ddc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:34:24.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nqzb0L3ijvN/OTOCJfvwnj4G/Fr84xBmknvTrAoiSNq+OhowSDsoRuKRS6tJUAKi0jTqU/9bEIOlIfW9nFvN2Rg1NxUBGirjKP5nYJyzXHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
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

On Thu, May 22, 2025 at 01:58:54PM +0200, Thomas Zimmermann wrote:
>
>
>Am 22.05.25 um 08:52 schrieb Dave Airlie:
>>From: Dave Airlie <airlied@redhat.com>
>>
>>This adds accessors inlines to the iosys-map. The intent is to
>>roll the iomem flag into the lower bits of the vaddr eventually.
>>
>>First just add accessors to move all current in-tree users over to.
>>
>>Signed-off-by: Dave Airlie <airlied@redhat.com>
>>---
>>  include/linux/iosys-map.h | 53 +++++++++++++++++++++++++--------------
>>  1 file changed, 34 insertions(+), 19 deletions(-)
>>
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>index 4696abfd311c..5ce5df1db60a 100644
>>--- a/include/linux/iosys-map.h
>>+++ b/include/linux/iosys-map.h
>>@@ -114,6 +114,21 @@ struct iosys_map {
>>  	bool is_iomem;
>>  };
>>+static inline bool iosys_map_is_iomem(const struct iosys_map *map)
>>+{
>>+	return map->is_iomem;
>>+}
>>+
>>+static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
>>+{
>>+	return map->vaddr_iomem;
>>+}
>>+
>>+static inline void *iosys_map_ptr(const struct iosys_map *map)
>>+{
>>+       return map->vaddr;
>>+}
>>+
>
>These helpers need documentation.

agreed

>
>We should encourage users to the other helpers for interacting with 
>iosys-map structures instead of decoding them manually. OTOH there are 
>cases where decoding them by hand is clearly better. I'd suggest to 
>prefix the new helpers with __ so mark them an internal/special.

 From the other patches there are quite a few cases that would be using
"internal"  API. From those there are just a few cases in which we'd
have a direct translation to existing API... so I wouldn't make this
internal when they are clearly needed externally.

Lucas De Marchi

>
>Best regards
>Thomas
>
>>  /**
>>   * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address in system memory
>>   * @vaddr_:	A system-memory address
>>@@ -234,9 +249,9 @@ static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>>   */
>>  static inline bool iosys_map_is_null(const struct iosys_map *map)
>>  {
>>-	if (map->is_iomem)
>>-		return !map->vaddr_iomem;
>>-	return !map->vaddr;
>>+	if (iosys_map_is_iomem(map))
>>+		return !iosys_map_ioptr(map);
>>+	return !iosys_map_ptr(map);
>>  }
>>  /**
>>@@ -286,10 +301,10 @@ static inline void iosys_map_clear(struct iosys_map *map)
>>  static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
>>  				       const void *src, size_t len)
>>  {
>>-	if (dst->is_iomem)
>>-		memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
>>+	if (iosys_map_is_iomem(dst))
>>+		memcpy_toio(iosys_map_ioptr(dst) + dst_offset, src, len);
>>  	else
>>-		memcpy(dst->vaddr + dst_offset, src, len);
>>+		memcpy(iosys_map_ptr(dst) + dst_offset, src, len);
>>  }
>>  /**
>>@@ -306,10 +321,10 @@ static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
>>  static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
>>  					 size_t src_offset, size_t len)
>>  {
>>-	if (src->is_iomem)
>>-		memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
>>+	if (iosys_map_is_iomem(src))
>>+		memcpy_fromio(dst, iosys_map_ioptr(src) + src_offset, len);
>>  	else
>>-		memcpy(dst, src->vaddr + src_offset, len);
>>+		memcpy(dst, iosys_map_ptr(src) + src_offset, len);
>>  }
>>  /**
>>@@ -322,7 +337,7 @@ static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
>>   */
>>  static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>>  {
>>-	if (map->is_iomem)
>>+	if (iosys_map_is_iomem(map))
>>  		map->vaddr_iomem += incr;
>>  	else
>>  		map->vaddr += incr;
>>@@ -341,10 +356,10 @@ static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>>  static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>  				    int value, size_t len)
>>  {
>>-	if (dst->is_iomem)
>>-		memset_io(dst->vaddr_iomem + offset, value, len);
>>+	if (iosys_map_is_iomem(dst))
>>+		memset_io(iosys_map_ioptr(dst) + offset, value, len);
>>  	else
>>-		memset(dst->vaddr + offset, value, len);
>>+		memset(iosys_map_ptr(dst) + offset, value, len);
>>  }
>>  #ifdef CONFIG_64BIT
>>@@ -393,10 +408,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   */
>>  #define iosys_map_rd(map__, offset__, type__) ({					\
>>  	type__ val_;									\
>>-	if ((map__)->is_iomem) {							\
>>-		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
>>+	if (iosys_map_is_iomem(map__)) {						\
>>+		__iosys_map_rd_io(val_, iosys_map_ioptr(map__) + (offset__), type__);	\
>>  	} else {									\
>>-		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
>>+		__iosys_map_rd_sys(val_, iosys_map_ptr(map__) + (offset__), type__);	\
>>  	}										\
>>  	val_;										\
>>  })
>>@@ -415,10 +430,10 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   */
>>  #define iosys_map_wr(map__, offset__, type__, val__) ({					\
>>  	type__ val_ = (val__);								\
>>-	if ((map__)->is_iomem) {							\
>>-		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
>>+	if (iosys_map_is_iomem(map__)) {						\
>>+		__iosys_map_wr_io(val_, iosys_map_ioptr(map__) + (offset__), type__);	\
>>  	} else {									\
>>-		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
>>+		__iosys_map_wr_sys(val_, iosys_map_ptr(map__) + (offset__), type__);	\
>>  	}										\
>>  })
>
>-- 
>--
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Frankenstrasse 146, 90461 Nuernberg, Germany
>GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>HRB 36809 (AG Nuernberg)
>
