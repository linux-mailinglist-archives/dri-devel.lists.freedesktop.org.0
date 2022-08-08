Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEE58CE48
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 21:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FE910EF96;
	Mon,  8 Aug 2022 19:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CF910EF3C;
 Mon,  8 Aug 2022 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659985557; x=1691521557;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vh4bPfJ2m0TS357SAcUVx5G047HOcOxD7QGDxuuBGDc=;
 b=CBRODuazmg1roVtmsAAUYYFHqmzZDSuXmlZEv1tAEE2O1LXHWjTYFP2A
 u86NfRSptnmRj19La5Hw+FOmUiM+wKdM96mS4dJjYKEouGGU2jrUAQSFp
 t7t2A81s+MREgbQRHSCktKyJ1ED0mX7aJu4z7X/+hdVYDhhhIanZlxvhA
 UxTq2xlMifI8SR7AkBw/R/ySMZ9uOO/KyPYnTqfEpP6THd1kzaIfisxRM
 dpK5cuozkUdLnGv6lfIfY3XEC5Yqg0ZUpnPlHTE8xT6Jxv9UN7LfmnnQb
 WxB15mmmUljN6vGEnC2wDlF2uApDUa8QBVWlo5aDdSIi6++lsXw3StkV7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316593746"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="316593746"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 12:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="850193017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2022 12:04:43 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 12:04:42 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 12:04:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 12:04:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 12:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6d1K1Jr7DSrBJzhVz8wbmgCtVc8b+oUcEt9F4CgERXrhB2IDs0AvEHfiUO8isPE176rBvKao5nW6j5xT9yLTKiYfUPtHvRzUaofMRANG38UIH4JfU5cDBVU1tC9XErgBRCgraa54+l9AqwotG147nFo4hKCtsD3EvmEo2ETd/FqHifMe9spWcXTKHfBL7giiGxgb2V4rrG/qfsM94kGuAB3lepN/N9hlOVfw6lTlv5+aMvGOfnpQRoHQQMvdNsoTZyues3p/neN5Ib2eiDdm7YvyLmrN5SCjWYaX15olfxOujaFbvjg5TnmWkK25xOz/CiZmQuHJq4KQu9uMVY/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohcghvxqYY8C5zV/Ma63AhjggHVoXq2cbmhqSDw43kQ=;
 b=L5aWXwqIUr4S5jM+zu83P6scFXtIMf3irln8fueMVqXdNh7cmUWEobmhKsAAoSSHW1qxllVfzwIfhfWTb7M5azw4ZPrgwybsL+wNClYJGqv9mh2DiAwUy/j++ldiqkiuE8NymZiTcoThwN1BZUcoWhyY/L9U/DUqw5O0ukldLe8cw/srEo+ASlsVw9kyrS/4c/1TdIOaFujAvWtnhOpiqfFR5GpkZ1R2gm+4DrWcXQa95jnvzk3kAqQ0e7qkcrPqpgmDwLfPzFzmoTEA5v49oOHgJAXRDTt2LTM3YhqWXqjOzPusoNbsTb1RN9pEz1n+XemQ5LUIxEQ3/Q4f93ZVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN7PR11MB2835.namprd11.prod.outlook.com (2603:10b6:406:ac::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 19:04:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Mon, 8 Aug 2022
 19:04:19 +0000
Date: Mon, 8 Aug 2022 15:04:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm/i915: pass a pointer for tlb
 seqno at vma_invalidate_tlb()
Message-ID: <YvFeLbUcC6yiCL5G@intel.com>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
 <YvE75o0uOtDGayNK@alfio.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YvE75o0uOtDGayNK@alfio.lan>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 113015f8-2b6e-44da-3861-08da7970cc08
X-MS-TrafficTypeDiagnostic: BN7PR11MB2835:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8u00ANLKkPvOr4Vqp85I+8gQc1QUQheteDbM35WirSx/VoAIyhODHIZ7kdvZVfCsxoX5xRuTH2UQUad7Rxh2JWJQkmP5W4LBibvKHbucnB7u5ebOLW7YYzYuy3wqpUIbQgU6pt8lVkHL/P1gC5I1DQs5oe9Nq2vmy1yJESXo5CllhyrjIQYfNJFmzg6OTduxPaXSyiGHbZbM2CvdKwcFaarcnBv0g09x81RPnoz62sI7xpKmgxfEIiuijeXGrWiS9zryRN04w6GldAjuqVRqE8LXoocgX2UXmGqPT4Dq+AyvBcfBx8nSV8HZInPtraS9343rTiL33JtcE1/OEF7LK3UHNkUwvd1ruQ2ieRWQoQ3opnwubDGncB/tzMyrVpGrx7flEDzUJxFbCERhKLCT/C9OJWQPawDnRUaxHk8BeO0T20HbJr3bszblNCVDng8aFrdMgDmi039nuj4nfN74xb0n96lOrP0i4SSZ/hrqu6AnseyHpWAS1OJ4lHBbDLE4N9i19NEtYyfQZMfHnrgEZCMe3cY7In/clznxqx486At+IRzH37+M4Me4OrhFng4xovLSjrTy7ARoUwYm3D2rRacED+R21JJR1IfHq0Phr6ltZVOwgLpx5LgRg6GRTqgsegq2ErsIG3Jwl5de4sl+9JgodzqS/44Lt2vKns0qs54gzm6SN2LyO14OMK4fSgj78WT72eZ6fWtMnAWEZ0KYgzniPccvSjDlF6J2NKePGBSN9eDLTRIRMD6p4zenYKG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(6666004)(83380400001)(186003)(44832011)(6486002)(41300700001)(2906002)(478600001)(36756003)(4744005)(54906003)(5660300002)(86362001)(38100700002)(6916009)(82960400001)(316002)(8936002)(26005)(6512007)(6506007)(2616005)(8676002)(66946007)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oL3Sb1bbtxot5E9J3Ymlmn3J+E1GWDFutYl23OSwAay45zABuWIIiGmSq06c?=
 =?us-ascii?Q?hXtuQGedo9iby/U43yMnLpxGMSAzX6l5bPKFQzwC7/UEg6euOzHJ9wfKW/db?=
 =?us-ascii?Q?IdLLUqqZgSIw20VMmFCtexn+BmpglQR9cjbWIGyn1jYhPJdBgr2Tig9fiFbb?=
 =?us-ascii?Q?z1p4Elee4EIwxfG3nRg0EBY8Vthatg7W28md1iyawLH4z83LhVvXcDmYNFWj?=
 =?us-ascii?Q?FvlBWU7hBazCu7IycgeUEjOYejaZA0rxLKS62SFWrlWEfKvPAzLj1UMvpPpG?=
 =?us-ascii?Q?MdLP9wjh1T2c3prB5caJNY/IxjLDqaQWHOpvjruvILEHJEfxxhiMHed+DWv2?=
 =?us-ascii?Q?3nRHDp9Cdq1nk2bWFMbE+A47uVnUQozIif2TL90c2AB/Tk25O4BoPTKuUNwC?=
 =?us-ascii?Q?8yVxrHBCoppBv/4e5mIAjmN1T4lBJGXE4v3uTpsbKMH/71XC31KaVV1IfHBP?=
 =?us-ascii?Q?R4cIylqpfY+KcxQeubJpjzrrcTrCOsWsaARM7eCCCaljYMATLUs1frVke6tp?=
 =?us-ascii?Q?bmzpevdn1WTJLbPhJaZL5u9iBaQoxgIV+KkSNU4LSa2hNNEy0AqDJTNIDtpo?=
 =?us-ascii?Q?w3kGHpSbpdc0EcUVkJ1OBq7Ad19KK7G2S22YEWJEoeZgOcJUYnpHipGzqxbL?=
 =?us-ascii?Q?fYmKoTUoR4aF8DjWvpR9xFM5WKftMAl6M7vAe+EQmoUrqxgrgZ/91HgKOKZ2?=
 =?us-ascii?Q?nWMYAfSYj5cW5suioprk1mco5yYomxHR67aK9N5FnHaJXMop00oSyqsKyYy4?=
 =?us-ascii?Q?/c+kUMzxeaqfILSs2K2bdfIR8vwpovDX8hPjCki8ZRQohJ1gG5nit6ABQNXd?=
 =?us-ascii?Q?8mtVdsmJzDeNofhL5/2bdfeNd5rFG+LNLg66x603zS5D81iqupgQTmAiz41y?=
 =?us-ascii?Q?wLt4ZgjNiu7eMuszo1DfrHWvPRSNu6oV+CDammCP+KS85FBC3t84X5ix4zl8?=
 =?us-ascii?Q?tHHR7fVfpWS5Lk/OcBg2gFHehQLh3mSkUGt2eEDPhdCMwB8MIehx6t0pvhoa?=
 =?us-ascii?Q?tNvKicOn23DkHi19plUncau22t2gl1myyTMwpUdvvfnXzjHjFGRWkDQGcXOq?=
 =?us-ascii?Q?S0glO8RB+x8rXYBuvyXgGpV9dDjBYi6MM06qf9OMZo6q7SxQLmtGGdWuP7Ia?=
 =?us-ascii?Q?kSeg3qR+rt/S3eXwqUKoJR0RaYVimP6F+eOiVYTgua0R9ImH2LUybnMmGPKU?=
 =?us-ascii?Q?DtdF3sMoOf0wD2mm3IJIvye5FFjeyfMbtvLKbbOmyuARR3anhLIUqlcSBwkC?=
 =?us-ascii?Q?5ztxplU55+Hk0whd9AzIQ6pGDMN0ToE87ERazm7rdRqr6GiCeUWDYqygGSlt?=
 =?us-ascii?Q?c+sogJWREbja+9mAfS4AZ/JQFoD2Imjq9ELHsltLzZh3Kj4YOljvkn6/zgFL?=
 =?us-ascii?Q?8uhrCQ5Snl4OjF0Kcrm70NLSlkFuZ2wOndRdPjL4saEUw2Oi2gxWH35zovwY?=
 =?us-ascii?Q?hDp4vw/lCw5DO1S7/XxgcOyvAyFU536O4HcrSKWSR0+e0sIzNh4S91EUCJJf?=
 =?us-ascii?Q?oQ7HqtluB4HmdPanhU8b2riP/pP4MDxyQ613J7bjzRj52SB4SZj8gtGsU4z4?=
 =?us-ascii?Q?H1envcDtjofLjbU9/44j0emqDwsmlNqAIE6p/zZzPo77STK8Fexh7isHTfZl?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 113015f8-2b6e-44da-3861-08da7970cc08
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 19:04:19.5391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBwB9TwIzQM7VBiwWQxg8/k2NsLJPzTmvtEAQ9G2Pk/AZwsQJ2cZsJBH5XDsl3Wj0b9tKXYiXbIOPqyLQI4kQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2835
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 06:37:58PM +0200, Andi Shyti wrote:
> Hi Mauro,
> 
> On Thu, Aug 04, 2022 at 09:37:22AM +0200, Mauro Carvalho Chehab wrote:
> > WRITE_ONCE() should happen at the original var, not on a local
> > copy of it.
> > 
> > Fixes: 5d36acb7198b ("drm/i915/gt: Batch TLB invalidations")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks and pushed...

> 
> Are you going to send it to the stable mailing list?

I added cc stable while pushing and the cherry-pick to drm-intel-next-fixes
has the right sha, so I'd assume this would be automagically now.
But yeap, it would be good if Mauro can follow up whenever this gets
to Linus tree and Greg's script start to pop up the heads-up messages.

Thanks,
Rodrigo.

> 
> Andi
