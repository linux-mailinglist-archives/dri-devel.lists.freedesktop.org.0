Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B62C4839
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 20:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF156E8F5;
	Wed, 25 Nov 2020 19:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C16E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 19:27:11 +0000 (UTC)
IronPort-SDR: z8TgLUVEWgWER10etcnksIP/QZpHKPY84442EBlCebsBW3QoLum7LLDestO4qUz7cRUUzpQoyq
 UrGPEU6drjUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="171410773"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="171410773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 11:27:11 -0800
IronPort-SDR: M+b2LmzxJOf2GU6Bpoh91aEtRf8ltfUKq152CET0wdA34zi5AdPoSRANimJnJs/DBIYu1uIGc+
 ceY3rvaFHntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="365530639"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2020 11:27:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Nov 2020 11:27:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Nov 2020 11:27:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 25 Nov 2020 11:27:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftRiyu9V2kyCq/g60b8RP+hI2i2P7DjfxR4Ccco5uGVttf1J107Lf3+2t2r5hPTaSLLJt0BO8TVOGz12CG4jMZpQQzOYgKO/61QXeGAwWAnDbZ6cHTCJX9tXwbtqO2V9XVH/H/l72khAOkNO3ZK/bDV0F/hYkcF7RqGv/mJ4HzJJD6AvSUdk/DJD1dB3KrSNUEU8g2rHHslfasyIrMCGBvy9izLYlRAF3MJzDU5fr9rbeINDD9nZekaXIr8WiLuGA+2kJpnAWvdmBb4nwZLyw2KUI+YI51iavnmaGJ7gp8RWX/iTUrzuqmvw+jM8WgPcpbOlYHku4EUrv/S29Nq2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P7JnzIkmW+9Ex1vWhoSVZ/46d+7W0uSMcPylvO+lbM=;
 b=T9OLT0lCgmBzK2at+JHWm0P8QoQhHtziaxFsMjRwpfLAqIO17e2zQtyq8Aa/HVKEdG/zLIL2kYm0c0n09pneZHAyOGfPyQC5w4Y5Sz2pFqFlTbl1+3xwesHU2M925ADU6CQiZinVD544ks1uYzQEClOyFw/IqF9PYHeUtnWUxaMCSalwDjzCQ/rDX4plWdMnvkXBQ6IjcKTY7RRJ0g2ItEQqTDw98NNhYfO0IBiRabDPs/EI+bDAjfRFrVBv/VY9V1oVo8rPk2Tg6Za6Kin6GYgSMd1R7uH9zpVfwXsNdW2t5AphTKdcMyuZSChUdcum8hTJNaI3MwxVutP04Nmcfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P7JnzIkmW+9Ex1vWhoSVZ/46d+7W0uSMcPylvO+lbM=;
 b=BEx9lAMIR/J1zSO5dI/J7VY9hKfmvYSkVR9AZJhw0LDfkR0Guk0hic2qI+eQx+2CahZcL0BhA2WrJFoiVMFP8SQzkpjM9vhAfe4NGcS9G9ClBHGMN4EEgehdCua9d+099wuAk2UDgHi8AfPh+4jQwDyurrb6cwfvIoglVKZr1G8=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 19:27:07 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 19:27:07 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWwb+RTBTJqBZYLEWXdlNPeqTq1qnWAtcAgAFjXQCAADV8kIABEnOAgAAXigCAAHeKoA==
Date: Wed, 25 Nov 2020 19:27:07 +0000
Message-ID: <MW3PR11MB4555A91A6CF5D23AD538EF34E5FA0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
 <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201125105041.GX401619@phenom.ffwll.local> <20201125121456.GM5487@ziepe.ca>
In-Reply-To: <20201125121456.GM5487@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e88e6a31-0aa2-453b-1547-08d8917818cc
x-ms-traffictypediagnostic: MW3PR11MB4602:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB46020C9AC5099C4D7842FCD8E5FA0@MW3PR11MB4602.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:248;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DqEcRp2YIigrrjKnKtARxPWRgq1VW+MXiLziogBtNOuiypst+xpaPT6P+7YJkf02R7zPrBMDbjrBDdYrqgYDif+vOUvK8uZYhQcOpv6RSlsJSfcBBWsr6+1YYrPBDRVq3ksIIJpVt/0nuvhi3eKFasYFWuhu3MQQMuDsH6nyRUFgdZ2/FOLKpzBCtmeykRplNwe6nsM8Y+9mWSToFwqHu8hmywEPNHkkVuHWc8maT1BHWWSywiK5GnqJyfNWwNlDfAZZFj7YxV0mNjiA9tuGoBbhrQRUbkysT21HVEshv+OY4klsE+iPWCLNMsZORSDfdk2RCkQwCvY2ejJtiYrZ3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(9686003)(186003)(71200400001)(33656002)(66946007)(8676002)(52536014)(316002)(55016002)(76116006)(66446008)(66476007)(83380400001)(66556008)(8936002)(64756008)(2906002)(478600001)(86362001)(7696005)(6506007)(110136005)(4326008)(54906003)(53546011)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/8CqosiMjr/MUFDLP81YGJ9fUB8CC7wwHMKQ3lcRcSdsgYtwYQ+cqH02R7ds?=
 =?us-ascii?Q?ufr7SLLmgNvjNqhtgUUFI/VsEsq4FbnWpHb4Pi4fgeTpoClSn/x+70TuFOOO?=
 =?us-ascii?Q?EQKNHNlCIR5Zz307SRKPNNjlgiH4bBa1Fg+AsE8/6IV1y2wChi1IJYZli5Hk?=
 =?us-ascii?Q?Sox7n9kCXtPiGv5KuNmo74JH1OSTWh8dTZJw8hieBVQrIGoH2au4adEqcxg2?=
 =?us-ascii?Q?fae7AVojmZZiaay71I7M4yjxQf4Hrp2XsRvBWUVXxcexY2xLSpMAxtDIXKlw?=
 =?us-ascii?Q?0t12Ban1UIhfb4pEzgp3hSXhHjkDLy/PeW2r45wCySfFJ+p54RhWRrPXljk1?=
 =?us-ascii?Q?jcAIoslWQe8xUrG/wG10UN2uKgXEqByt1ps+qmCkiAcyt+GHCsLSCbAi8uOE?=
 =?us-ascii?Q?XDNOGg6MCyW+0zI2RBs7gFJGbEH2K0bWmZzXnu8Ei68GBk5MpLObG3QVKtME?=
 =?us-ascii?Q?3Rh3Bom9vWU/UdwMRqG4rkFoAaxF7iAKAVYlMyyF//cZ/BhkjOQnVj+4rysi?=
 =?us-ascii?Q?pM5nsLO25+uNHDiTSHlBhqzx5Z4SpVQjc5SK2IYTh4tLVzF8WhXOFg4ow3wT?=
 =?us-ascii?Q?ZXuWi330gD7VZFHjrBuWIBN6Ba3rPHhs5DUOwLrb22/Mzadgzz/01avy3Hsr?=
 =?us-ascii?Q?jIW1KkkQ+k7iOYux3A6Cl5xJ9/VNxKeGCrnJTQaXmXInsENlE4PJpvNM73fd?=
 =?us-ascii?Q?iqKvurJMoBtU0/pdxcDuqAOGHAas3s1pKymIW75twz+EZen+FPI2b0WBuxcV?=
 =?us-ascii?Q?cJuqnJWrFiW+u7EaQjCjmFBDSPS/A/4KV35XYXL7GtdGLKmOnlbJACmOXkw8?=
 =?us-ascii?Q?93DGBBgR5BvBicy+H1IKR+IrEdf1GeE0ARJGJDWNt9YcOjTzOo1uiuHKFoFe?=
 =?us-ascii?Q?9b1nUHCTNicv4m95XgSyq1j9tZa+H14Ad80aj9Ys4mcYn7M+EE3aW7jg8eHX?=
 =?us-ascii?Q?amt18fY7JBjS0JuFTrl/RQimMyQY0UV/AqRTk8mZwlM=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88e6a31-0aa2-453b-1547-08d8917818cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 19:27:07.0787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXQzJHYVBP3j4MyFWiBUIaP/3RNTc2PM15yEyeVdir6FPkgJy9yrX6AYLMe5XBCcw6VemrfHfTdTzRFGK3zvXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Wednesday, November 25, 2020 4:15 AM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-
> devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> 
> On Wed, Nov 25, 2020 at 11:50:41AM +0100, Daniel Vetter wrote:
> 
> > Yeah imo makes sense. It's a bunch more code for you to make it work
> > on
> > i915 and amd, but it's not terrible. And avoids the dependencies, and
> > also avoids the abuse of card* and dumb buffers. Plus not really more
> > complex, you just need a table or something to match from the drm
> > driver name to the driver-specific buffer create function. Everything
> > else stays the same.
> 
> If it is going to get more complicated please write it in C then. We haven't done it yet, but you can link a C function through cython to the
> python test script
> 
> If you struggle here I can probably work out the build system bits, but it should not be too terrible

Thanks Daniel and Jason. I have started working in this direction. There should be no
technical obstacle here. 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
