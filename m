Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0430E192
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 18:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8066C6EB15;
	Wed,  3 Feb 2021 17:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F25F6E16D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 17:58:51 +0000 (UTC)
IronPort-SDR: n8W6UlC3LLLrO+lyrAM7rb71+ifi9KNgwZDJPA7oUO6+vVzz4FIZUBLvQqP0Kn3hGb8tLRIucH
 zqDXPhFnzRtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="168769217"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="168769217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 09:58:50 -0800
IronPort-SDR: YfuinT6kOdWDpeJMn6rriwCV7HTAUVOSbvdNqCkqKVmyX89rdkF/pgHwGT3NdFPGfU2v7x3YO1
 yj7c/mZsZJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="392565376"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 03 Feb 2021 09:58:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 3 Feb 2021 09:58:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 3 Feb 2021 09:58:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 3 Feb 2021 09:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WauYF2zr7osr80+q/xzLzIP7ynSq3lFroNMxV9PMUldnYtzvq5fOLqdfkly87zI9EawLRjDKsqoZTisyGw8pV7KazYRwGU0sIANcjfCzS5umwNHVdKllzg/U8DBDXiPmhzJ99PoYWs3mNrSFqvDbjurecWWVoenc+1ipqs9we0M3dbQhcQ43OhFrRVaUS6St/RrHMIfaHEqIL9P32fRhPd0eomuf34TMR6zVVDuAZsFnbzEZgHsjCrBbA3zQrdXQaWJnTggFqy4l1r1Lvryqu0SADDZJ1mO9++WGM5eHY2xFQlnIJKyYZIlq/9CZd6CvIxiqPRVQNcznmhyURu4Klw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaJ+QqxjRAjkpi1i1DMqSh06Ab+F/ItEw7c6jc18GbM=;
 b=Gkb21svMnj5UkQ1E8xikxEnlhSVBvzQZGc6RmbdCpT+8z+JDPvZe+3BYAWklasYYJogfyxMIvtf+J8QnXSfD/vzzbO1q5FlkbzbWhhJkYWKsaw1O4i2MylM8NgQmCDbkCnIDTKyUYVoVl1E/sloQNb8zVvIjJzjm0/0NmUg8kG+CTYnKsw4WHlExx3BxAUqpoIkmlhJ5lJAb8u1luAXtc0j7lfE+18szJGGUgw5E7ZvDTDPPn2cPhBF1cUSM7X/Zz9jEb8d1NGIaO5+IaBrxt/2+nbYRrqihRraUrm6x0Y8Eb3/MUWplz98prkX5ttnXDTG03cTi/wIXJBhuZkvsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaJ+QqxjRAjkpi1i1DMqSh06Ab+F/ItEw7c6jc18GbM=;
 b=TS/RyDO7XxRnrLUt2rrCBAXmQqz1H8BWhGbu7OMf3ZstX3fa81BhcK3Di42pMfmIJu+u62InTnOceH+3LAh+DdpJegFgjLKOpiH31KfMRlaKRCBydcopDr12HGXfEpyipMS7f/Atcquy7MpxYYlxW7rycaKwr3BP7/cup5RzUJA=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1535.namprd11.prod.outlook.com (2603:10b6:301:d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 17:58:43 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 17:58:43 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHW81IsBXvBf9ch/Ui3XtDALqd1H6pB5ZYAgAD3NICAAIRsAIAAFi0AgAAZeICAAXeSgIAA9XkAgACyvICAABOigIAAAIWw
Date: Wed, 3 Feb 2021 17:58:43 +0000
Message-ID: <MW3PR11MB455504E449DC36622361DD22E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
 <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
 <YBluvZn1orYl7L9/@phenom.ffwll.local> <20210203060320.GK3264866@unreal>
 <MW3PR11MB455563A3F337F789613A9940E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
In-Reply-To: <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 488c9d5a-f5ab-4b94-9867-08d8c86d589f
x-ms-traffictypediagnostic: MWHPR11MB1535:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1535C4432A7B6D6CAE9E4B66E5B49@MWHPR11MB1535.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yart6WFz1fj5+phmHvwmTDuIBUCtUYJshRIj5D41PSxS91dfIEHb2TGCNleBz76+/RBV/HU/QONQTOXwqM+40VQejDC19PUU5oujQwOQuR4Z+X7rLq9luiF5/nyUV8Y9BKr2zJEZsLxt9eE3ng1kLlZPAIf/INc/8JomSP2XelgpPBEslt4ftyMLFNEjjHUldDf3iad42Pb/cEvGO5dQiUc2NaeUDhlHzhY4jL/vLQ8Lzvy1Iq0t2jlWNKe1QiM6fyaBgWuQS+5WhQPlBd2vP5/GeCyOgK5ufBrD+AtthOh5EC8tV3MCSMvyWsIFII8AgfZqZTkDfRWsqNDIG/xhhivUMNXoP8nDrxC0V6kLvGLsgm/udh1qdpa4ZxhLd26KtT0qUsiOoGuzgo4ObcPG38Ccu1dywtp4jcjVp9qR9UYq2ZD2HFoaCCROBlppoIIAthOY68LqORJH+x4EJBo+HJHxbTmqLYah6Kju3kDvZwAb07v56XzoeQEKGP4WZRGyQXqk+jBsyttlbLGM08enNjV+AqHPQJWdp/UUeaCs2eFPb5etWRe78DhAvkWpQIO7gOOBuXJ3sLFdtKjLaG7r0QHtoyKfqXZ1q2wAdlJ1Itx+rzKWC56RDz0wLWcWVCcH+pEvTsIDJGoTvQMv3d4/ai5CRWRK+uhp8uLu/LrkeFg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(366004)(136003)(54906003)(316002)(33656002)(9686003)(6916009)(478600001)(76116006)(5660300002)(66446008)(66946007)(8676002)(53546011)(55016002)(7696005)(966005)(7416002)(2906002)(52536014)(26005)(186003)(107886003)(83380400001)(8936002)(4326008)(71200400001)(86362001)(83080400002)(64756008)(66556008)(66476007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aTdBTC9BNzM5WWhrRi9obnJSRytNdkdlcUYvbnN6ZjlkKzVwWktybDRRN2Rt?=
 =?utf-8?B?eUE4enF5cUZVNkF6Um9pMFhLUUtSVjZXaU1IbWIycUkrWTFsa1dTRkpJNzEz?=
 =?utf-8?B?L2s2b3ErSlZ6RU8wbjNvSjRSMVlOU2NzSXRRcVVrZUExNHJsWUxUMFptQmli?=
 =?utf-8?B?R3VIN2FEWmhsWHR2NDJwNjVFd0laQ2RkMHRvdmU1U0FCbUQrVXczTEpWc3A1?=
 =?utf-8?B?VVgvVlFvOHJUSXMvN0JlVGFrZFNTbU1ocy9tOUFzYUZIb1IrMXVvdktIakJJ?=
 =?utf-8?B?aHYrUlc0WW9tK1JDWW9YU0RvRnpQeG1WK0xZL2VzQ1ZKcURBTyttd1UvVEgx?=
 =?utf-8?B?Z3BRYWRERmp6UkFRZFYzNGtkdnJzOW5kTnF0WmYrVENxbHpXNlRQcVFpUzBR?=
 =?utf-8?B?R2VzbG5rZW1JdS95bnU5TnZvMStrMkhsbjlKSS9GSEN3Wjk5SHJuenF2Unpx?=
 =?utf-8?B?TmtnNDZ1aXNMQnBLalRia05jZHFoUGhzaTdXcFl2WmhCUG5tdW5vNDNVT28v?=
 =?utf-8?B?U2l3M1YyelFEcnZiU2taazBETUZDbGQvRW0veS9CMWI5M1dLdTVVQVhBb2dM?=
 =?utf-8?B?UTErTFNENDBaaHAzUjZJMWtHclBKQ1dtNENzcDFPRXBhZXF5bnBzMlRmL0Za?=
 =?utf-8?B?Q3hwV1UrVGt3TThvWWdVMkUxcGp4cEM3UEp4aW10bSszZ0ZBTXB3TjNHSWtB?=
 =?utf-8?B?NjluSkI5Q09HQWdicHBoTGs1Rm9QcStnM2hwVXIzNFdJdE9yREh1Q1BvdDh4?=
 =?utf-8?B?U0dGMEJLTWY0NzVVWEtBTlV4U0d5MkhwbVBCNUdHT2kvcDlnbW9MQ1dhMEQr?=
 =?utf-8?B?b2FEWkd6Z2o2WEgvNU1CYm9iMXZJWG1UTmZnMXpRbFBJYVg4WU9IdUl0YTIr?=
 =?utf-8?B?WlpHMDlJcjAvNGFNTEowc2ZtWHI0cFB3cUl0YWxUUDhwNmNFeFdldEVpT3d3?=
 =?utf-8?B?bWRZOENkaU92bmczbWY4cDRKRU1Jait3WWpUQUIvQ2s2MC9HdTBla0V1Wno4?=
 =?utf-8?B?RVJSQXczd3o5dElwVzRqSzhXeTBTTjBrU2tESkVxMjFMQWNjWmhzNEFWbzZj?=
 =?utf-8?B?dDVWQmtpeEZ6UTlhR0YrTk1ZWnhRSWQ4TWl2YUtZS3FPc1RKVjl2OExlTk10?=
 =?utf-8?B?cUhtM1B2ZWJQMldMN2MvVEl2bmFGejM4M3lvbE9UT2h5WDBMVHZsT1AzcFI5?=
 =?utf-8?B?dWlwRDZvQ3VKT0tQRnpjNzhxa1FDaHhCejdwT0lyUHViY3A5d1NYL3ZqbTVR?=
 =?utf-8?B?QjhXTDdhU0k5RVF0RlZCZnRobzg2QnQ4cS84ZFBKS0ZGYkUvWXo3L2ZBU0R3?=
 =?utf-8?B?bytZK1hteDlwOVpZbzJnSDllb2xzYjhGR0xNckJzR1hzVWdqVkR5enBmSHQ3?=
 =?utf-8?B?NmkzRGxHZUxIc0JDRWxIclh1K1Z5R0hWRDJoNEFZTGI1OFNlb1E5V29CZzlo?=
 =?utf-8?B?ZEp6YlZFVUpqYXpkQ3djZGw0TldQZVVDQU5vT2g5RFJyd0dPN3E5cXArQmgz?=
 =?utf-8?B?cHpDNGRTSU1wWDdmZHBNRHpGVFliVnR3TUQ0N2JpaFdKZWgvR3FUeXczemRK?=
 =?utf-8?B?eHo0YW90akxaeVFRNVMyNW1ycUFzTUhnZnZOcnQvM1ZZUGEzV2R3U2ZQUVN2?=
 =?utf-8?B?ckZmRW1MclZQTHBqRDl1U2d3aHg2MGMxR0c3RCsvZUk0RmZocnVsbkpadEEv?=
 =?utf-8?B?ZjRQUnJLWDdZRk1KSUZ1cm9HeHdmSVdlZnBZeVVvOExIMThmYVZ5UUVxYWxu?=
 =?utf-8?Q?fxWSFc7FWJGR/Viyn0=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488c9d5a-f5ab-4b94-9867-08d8c86d589f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 17:58:43.5535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KX4Go7Slox4+zerCMgv7z5PeKNON0VVDuELR3bF+4SCZjf79S5SXTfLkP/VTFTQTvjDwwsKmi5TFfYiR3S6vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1535
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Gal
 Pressman <galpress@amazon.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Wednesday, February 03, 2021 9:53 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: Leon Romanovsky <leon@kernel.org>; Jason Gunthorpe <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> 
> On Wed, Feb 3, 2021 at 5:57 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
> >
> > > -----Original Message-----
> > > From: Leon Romanovsky <leon@kernel.org>
> > > Sent: Tuesday, February 02, 2021 10:03 PM
> > > To: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Jason Gunthorpe
> > > <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> > > <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>;
> > > Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> > > devel@lists.freedesktop.org>; Christian Koenig
> > > <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>;
> > > Vetter, Daniel <daniel.vetter@intel.com>
> > > Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR
> > > support
> > >
> >
> > <...>
> >
> > > > > > > > > > +#include <drm/drm.h>
> > > > > > > > > > +#include <drm/i915_drm.h> #include <drm/amdgpu_drm.h>
> > > > > > > > > > +#include <drm/radeon_drm.h>
> > > > > > > > >
> > > > > > > > > I assume these should come from the kernel headers package, right?
> > > > > > > >
> > > > > > > > This is gross, all kernel headers should be placed in
> > > > > > > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> > > > > > >
> > > > > > > drm kernel headers are in the libdrm package. You need that
> > > > > > > anyway for doing the ioctls (if you don't hand-roll the restarting yourself).
> > > > > > >
> > > > > > > Also our userspace has gone over to just outright copying
> > > > > > > the driver headers. Not the generic headers, but for the
> > > > > > > rendering side of gpus, which is the topic here, there's really not much generic stuff.
> > > > > > >
> > > > > > > > Jianxin, are you fixing it?
> > > > > > >
> > > > > > > So fix is either to depend upon libdrm for building, or have
> > > > > > > copies of the headers included in the package for the
> > > > > > > i915/amdgpu/radeon headers (drm/drm.h probably not so good idea).
> > > > > >
> > > > > > We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> > > > > >
> > > > >
> > > > > Yes, I will add a test for that. Also, on SLES, the headers
> > > > > could be under /usr/include/libdrm instead of /usr/include/drm.
> > > > > The make test
> > > should check that and use proper path.
> > > >
> > > > Please use pkgconfig for this, libdrm installs a .pc file to make
> > > > sure you can find the right headers.
> > >
> > > rdma-core uses cmake build system and in our case cmake find_library() is preferable over pkgconfig.
> >
> > Only the headers are needed, and they could be installed via either the libdrm-devel package or the kernel-headers package. The cmake
> find_path() command is more suitable here.
> 
> Except if your distro is buggy (or doesn't support any gpu drivers at
> all) they will never be installed as part of kernel-headers.

Right, that's why we want to check for the existence of the header file (find_path() does just that) instead of the existence of the package(s).

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
