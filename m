Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85D2C4C40
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 01:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A176E1F8;
	Thu, 26 Nov 2020 00:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163756E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 00:43:27 +0000 (UTC)
IronPort-SDR: 4NZzy4CsoM1g4aT35t8ezNKUkjTXvEJunU9ZCsqiF4HxFMR5F4uY/EHit1uga/bXYlobPadLX2
 1EnUxobyzUbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="172318327"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="172318327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 16:43:26 -0800
IronPort-SDR: +xCZl5yq1B2DwTbNPoJsnaV9mrRosKBvrHh6K35CoJRoLGVOy3ua/OEdZG3eZl/g+9nRfJO8xw
 NFMhJMM0UXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="359361037"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2020 16:43:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Nov 2020 16:43:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Nov 2020 16:43:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 25 Nov 2020 16:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vm2mO8IlFE5lttZDCOqggr8m6xHX0WPortrF/N183etM7MNcG4IPoDICVCjuZZFCr5M9tIN4vHD3/w6ofjSeNqCbLpr9mS70aJXgDHfSU5tIRva1OWW/Qq/yHWlwgixfgSXfrle7uWKMzLXiW2LZs3jVVACRch9pz0OzOaTFob8uHko+OE5hWma82gPHAheYPTBu7bk+FjppJqrhJXcVzh60l5Z6qP3NNaSlsF94CNjZ1TqjZ8DNvNFdUYjjrY+aNDPbQfqjxd8mjPQw4XFloLIifvgTZ8ybc5EFRwJemklsnhnDqJCsHhpgqCThs4//Vdkel8/3S8C4YHFau4ca3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CV8fkH+XF+1ktjabwaH/G6sVszWawEJssf3f66FGow=;
 b=F9MLq7+LZfDHMHbw72z+uq6T/9+KaC2435odhgf0YXnUrtsQpEyJ/YlMZ/n/D3R4oPS/lF9U3YW0JwObT/jwgwWVlv0aO2uOnftVJiy0KlbL4687jCFROpLYfswGPHO/6lPgwkbmivx2onsHhTk9qpelj1+tqHCAKCvNCPDZvABJNwvf6pnHDxr8GVBJky7hJSchsTjZkhPvdtJzsqc0yN06pd6TnskqgjDtmiH6U3dKBeUIvw2PMkmYLKY8HFLVXiPBzqljetucHZX1c9adLWu/5wTdVgGt81oQdkhSOLXB0KuPhVrEoEYOlknvJbQxkw97zjnNtHh9AScb/KJ4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CV8fkH+XF+1ktjabwaH/G6sVszWawEJssf3f66FGow=;
 b=Xy/VwlwesayyYP5TL4lATogXk6gWnaXQuV7l9R+ACrxt/M+HluBVai1GmaKkhVQSiA+0OBc8dpHcsvD3s5GGj0kXNSGv8Kol844XJdOII+wdVY0GV1Wzh6owOTqXdXPrc+STjIEDdXCyHBHCIts4PoogEwlB2Vu5AQrv19tJyxY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1374.namprd11.prod.outlook.com (2603:10b6:300:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 26 Nov
 2020 00:43:22 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 00:43:22 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWwb+RTBTJqBZYLEWXdlNPeqTq1qnWAtcAgAFjXQCAADV8kIABEnOAgAAXigCAAHeKoIAATXsAgAALbuA=
Date: Thu, 26 Nov 2020 00:43:22 +0000
Message-ID: <MW3PR11MB45556CCB5811EB917531A011E5F90@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
 <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201125105041.GX401619@phenom.ffwll.local> <20201125121456.GM5487@ziepe.ca>
 <MW3PR11MB4555A91A6CF5D23AD538EF34E5FA0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201126000006.GS5487@ziepe.ca>
In-Reply-To: <20201126000006.GS5487@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: ecd13ac7-61a0-41c6-b96d-08d891a446fa
x-ms-traffictypediagnostic: MWHPR11MB1374:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1374898D42831C6B3D875ECDE5F90@MWHPR11MB1374.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:248;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOxr5er5ztANPoHNV/qSHHzQCRL+uzMl/MHWAG05vq5lsI0c3ICV7x8fTxqXdB20JP0tEl71H6dpsT8pHCiqBjo7FOyav9IX2Hf5RBn8+08KwboMmYnSPMHahLx+Kb7VEX/6WJJdxneJyZRPaPLUFoa7dhKhpFzV6QQAiPdL/dJAOAS2e1fuV+2NcOHEHoBLvSeIYlRSTBOKsu/X1h5o1pIHBQYawKub/dEehT91nh4olsszqYBugC/YZ2VFRKQP7FGQmS5BKgKLqLQF2/X8uisKVMK73yzWdIZEnw6sDSTzm5sIPHdu8I2L33vGQMH/aSyJJtVLFnfd7/D5jvRLeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(55016002)(8676002)(83380400001)(6916009)(2906002)(9686003)(33656002)(26005)(76116006)(66476007)(66556008)(66946007)(66446008)(64756008)(478600001)(5660300002)(52536014)(186003)(8936002)(71200400001)(7696005)(53546011)(6506007)(4326008)(86362001)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0ffQccakL9wbOk3HkRXZMGBMwVXcL6k0ZcVV/3y0B9L9AE1VyuR8yWb8xHPx?=
 =?us-ascii?Q?9vB4RitSXMpVaHYXP7nLrr0u1T77fmywT/ImV5+J92LjAZeB/eJjvfmx4iGh?=
 =?us-ascii?Q?FFP0IiMejwOoPzghGLTgtbqjJeAEmmy20D2ZfbkyFFya2VRapRNcqRsyB0a5?=
 =?us-ascii?Q?/UwQPQiaFCYuwo6G9yBxluYoOtLEXZkSPMhjiZEjsE6bN8l8NfwQV6JDh2d2?=
 =?us-ascii?Q?Ob1J+S8Jdh/fStsSZXiltsxKGjTpebYbgUuajZ+2gAv2Dya3of6WSucbPyU6?=
 =?us-ascii?Q?HAZViqoee4/cj8EmngveDoE2rujPiWIsOkntcL0qc5dE8xyA/+sWrwLmuTEl?=
 =?us-ascii?Q?HF8Gm5c9zPgpT0Tg85s5ufe577l60C1o8AmNFIoUdesDyUbzO6go9G4WSHyN?=
 =?us-ascii?Q?Mo5Ts88n7++5vpD6bwdJcNEhEcMAbZXHOSL3imovvuInLevzdr546QxJxjVz?=
 =?us-ascii?Q?b7ax1T7zEg5RWoscw92qExLFNpDYWyHgFqa1N95blRzTbqwmbweYSq+iPOvB?=
 =?us-ascii?Q?IOheN9qG06FvkUTdplobj/AyXROR429cLcSh8EPAMOQ6b+ofqfV684lF1OUR?=
 =?us-ascii?Q?j4wEEOT+wPGG+BWQ7Ra9SkvbXO7xBkTcC+pbY8XRViTXnBz+lDvKE/4Lwkgf?=
 =?us-ascii?Q?Boa+hck6aPWrpWbs+dNVLgTaqakzHuiffporKjsmIzd11wt8/9diYqrpBTgX?=
 =?us-ascii?Q?gU4iTH815E83unvDnaNyhpavDDMxwQQc/sJPhLCFWmJO/5aPC/gRAP7WdsAA?=
 =?us-ascii?Q?vHYO4KSmuwwhDE1UyI5trDCDnGEfxJ4nX8VuhmFI0YMSz9VibiqGfmAdOust?=
 =?us-ascii?Q?jds0fhawvGuPeVvQBi/qGyc+nLsIsUpBdPqPBcSKjH6O8xDLftVXkG6DqpiP?=
 =?us-ascii?Q?WO4K48hb17O3GvCNsBZNqLX4JlIgbsG63aYLy1ywfSWF/3MKDxONar0PEeps?=
 =?us-ascii?Q?0sP2K5o/kiISqBdvvYlaPpT4YwFthlS161BbF2Npza0=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd13ac7-61a0-41c6-b96d-08d891a446fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 00:43:22.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l85QKwifxqFQYhOrPRjoCofNqJhiujz1cV3rKjjWl/D6EoLlsJA8DE7ABWxofHoolx05LUAl+BJbmbiyEu7pCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1374
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
> Sent: Wednesday, November 25, 2020 4:00 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> 
> On Wed, Nov 25, 2020 at 07:27:07PM +0000, Xiong, Jianxin wrote:
> > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > Sent: Wednesday, November 25, 2020 4:15 AM
> > > To: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky
> > > <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-
> > > devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>;
> > > Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> > > <christian.koenig@amd.com>
> > > Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR
> > > support
> > >
> > > On Wed, Nov 25, 2020 at 11:50:41AM +0100, Daniel Vetter wrote:
> > >
> > > > Yeah imo makes sense. It's a bunch more code for you to make it
> > > > work on
> > > > i915 and amd, but it's not terrible. And avoids the dependencies,
> > > > and also avoids the abuse of card* and dumb buffers. Plus not
> > > > really more complex, you just need a table or something to match
> > > > from the drm driver name to the driver-specific buffer create
> > > > function. Everything else stays the same.
> > >
> > > If it is going to get more complicated please write it in C then. We
> > > haven't done it yet, but you can link a C function through cython to
> > > the python test script
> > >
> > > If you struggle here I can probably work out the build system bits,
> > > but it should not be too terrible
> >
> > Thanks Daniel and Jason. I have started working in this direction.
> > There should be no technical obstacle here.
> 
> Just to be clear I mean write some 'get dma buf fd' function in C, not the whole test
> 
Yes, that's my understanding.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
