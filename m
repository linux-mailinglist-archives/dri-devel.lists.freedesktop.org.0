Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A3290CA4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 22:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBE06EE8C;
	Fri, 16 Oct 2020 20:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20C66EE8C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 20:16:47 +0000 (UTC)
IronPort-SDR: WjoEaCbvuAPkLaT1knaOgrU03Rmde2MsRwF4CVEO8twThMh7HySAqOXiMlbi7T/L0WbFDIdHzA
 e1MnhTG2dVYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="251377292"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="251377292"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 13:16:43 -0700
IronPort-SDR: WI4pT+18j9LpjmNAymQ+J7ud3NjcYZeJYsVcL78vvi3YomRQ1hsVFeKA/w11rLqmA5PloWQEhF
 Aad5gkKhk+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="522374668"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2020 13:16:42 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Oct 2020 13:16:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 16 Oct 2020 13:16:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 16 Oct 2020 13:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhPRFSPYRd7uaBqvxH5EfRVkQXh7FtRBwYF5py9C3OFNZiPnBYzegj9scE38Dwvfxj5dmxNFVcuoeocNCmKP738QVkOlmnqHqZG7yJhA1CL7QTL2cuQdDRoIeH5vGWKMSPl3utHiQdZR+ZU/ybeMO5lxiAOBtqdJz9SfJb0Y4JkXxeMJxzFKkeIpwlOLdtBh9qeE2VqqGvsLbEC7TuOee/nOIrw9HmYnwZrzK9zNNXByg8NRd2zAEo1dukhWO0D7Gsec9NX7gUwqrkHKwZmIi3nqSs0rqE+94KXm/kehLWBI4DaW+gq7s/NwYz2wp6jKuRsEWNFNoSTyav4QRoBzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bc6dHeC+Qlc6mangGTPCr/Qn3PNjIZ22exL1ixxcUw=;
 b=J6hyYB/ieFAT/qZ2UiiV4IHmr11uw0L9Dh0LS3VhMfd01bpsOn8yIB0h75lsITcsoxoMcauZWD/UKKZGbAKGpe7cwa85dAkxZ8ZgsOSf3moxsQHBrB3CaypBm86DD2BICRX/fgui29giGYjq/UttVGOvnFeps2zhNqBHhGkZjnUVoqTDTsn3zZ9I+iY+NKZ7LKL7byvVg/bqv55QJ2yhyLLL6Y5OzK4ACsTbUixbKTGpwwMzdW+bqKbg15rqdtyFS888+os8U6BhkH5sAiH/ytI5Ti05nhYqb0h8ZlKDsl0Y0o9j96OnDtQc8j/ogxaBxEV/8R+pi9yd/3VEld2TTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bc6dHeC+Qlc6mangGTPCr/Qn3PNjIZ22exL1ixxcUw=;
 b=mV3uxNZxvbbzr+I6g+kVY+l55tBSyK8/nsrnuyKOqIXVS/7rqnmuRnRhB0DiVmBLWeEB2mrWISBO/wTs49F+R5WHhPSQ5enV6iBCPR7aEn+B3uxZns08ifibBD+1Sqf/QzfgXFRAL7+eGUa0+G7fUt8df3AIf1/0714o/mLVmOU=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 20:16:37 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7067:d996:719:10fa%5]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 20:16:37 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWozz1hR5fnRv5A0WWquQaJ8S5uKmalpyAgAATs6A=
Date: Fri, 16 Oct 2020 20:16:37 +0000
Message-ID: <MW3PR11MB4555FE7B0395E22487925F05E5030@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
 <20201016185959.GC37159@ziepe.ca>
In-Reply-To: <20201016185959.GC37159@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 74bca7a8-3c85-4631-bb32-08d8721062ef
x-ms-traffictypediagnostic: MW3PR11MB4586:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4586162D3752AE84162BBFF5E5030@MW3PR11MB4586.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0d5rP5tQOklrQthuHkqtX8/oUOf/MDHfHVNUh01mIc1v8epwOMhyFntRKAiLfoc6EbWhf2tZkvlbeyd6f3H1wzFhmkPvcZZ8aYlPkFZnBT/+iRWdFCLvhvwUlLEgcXx6PDELuHvAhcinA1SkgJVEuQome8yzonQ9BkAVxg27XUU06PU+6R3VQhRvxC47cJwMieoxclI5RaN2L1XTpTNvGI4ts2vitLH7tAlrg+3BgLwM92MYin7aW7+Kmkqp4jYBz6iJEUpx8O56n6EgMKIJFqTQyuthoA1vGtseADABS89dbsCYGTrBJ1/pSg8w7GiexT+Z9g6qHprJGbRgpv+H/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(83380400001)(52536014)(66946007)(66556008)(5660300002)(66476007)(76116006)(55016002)(64756008)(66446008)(54906003)(7696005)(4744005)(316002)(33656002)(9686003)(478600001)(53546011)(2906002)(6916009)(86362001)(107886003)(6506007)(26005)(4326008)(186003)(8936002)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fPA0ZImPPOm+rNGRXgoDbASZ6I+Bu2d6fYjUD/NaldT1HMldGAPZ+x8Ul7hHd4LATXsoNmIYgjbx/xDRrmvtAd1vZr+GGy8xigGn+OqrbC4mkoXDxrS4BiMFAyFKLRi5buBWC0v+S8lnhIK8HmXo9cbTw1MUi7KqbrHCFYwjg7YRVTWqcTee4jDAEyRHcSl/oYdPBUxYrFXJPn2WTL8UUOcnDeVicQTSHvWP4Jn/Xf0F3btbFNoZfiiCy/ANrnCt5U01fq0esvJ13ZkjzQ6j575M0boxY1DNkqx8W/T4LsLOA+jTupEUqdbc8LNQbW3WyVbG8k10nq41y7LXgLdhBCrLO3qeIInrvJ4UXTg4fxysiwGWBGitAaojAfUZe9ogNs/0vvUzCNA3W0tmDWWkIRjgxJ1QBRuP8/Hz62+Uo5pDETPwLryLvmDsMadkfmujMJV8MBRRTQC1T+JpIlA4E/KgmTWpxGt2Jt8wDBWYZ/XQnPMLBS26wZYZVGC6kJhJ2CttunuD64x5FByzZ00EP4t0JYQLsUx1Y0wUGY3iM41CR/WWmIKSspgVoEkrcZWzZZLFG/PWY75MEvGQ4zLLqNHMrDZkMXrNO+lke9BT7IIn/tXBlcvgtWcxg7xsg9TFIR/0Qp7iY6diK9JS33NvzQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bca7a8-3c85-4631-bb32-08d8721062ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 20:16:37.6542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SEEZm3AgrQCvRDkzA7En5l5KeLuId8OQReVPeErQJCYqwzIib+5DHGhWbjN/wsIPxUg7nQyOzCyL7oRaaxBXAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Friday, October 16, 2020 12:00 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
> 
> > +static void ib_umem_dmabuf_invalidate_cb(struct dma_buf_attachment
> > +*attach) {
> > +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > +
> > +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +	ib_umem_dmabuf_unmap_pages(&umem_dmabuf->umem, true);
> > +	queue_work(ib_wq, &umem_dmabuf->work);
> 
> Do we really want to queue remapping or should it wait until there is a page fault?

Queuing remapping here has performance advantage because it reduces the chance
of getting the page fault.

> 
> What do GPUs do?
> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
