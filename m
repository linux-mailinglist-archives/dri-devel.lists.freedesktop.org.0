Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588962ADCD2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A5C89AFF;
	Tue, 10 Nov 2020 17:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E489AFF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:24:06 +0000 (UTC)
IronPort-SDR: kCxtIKxWBxknfGrNuI7hsDupavZZc9piSs2wwduiHcGaJ3H7QbMhP8cqJDRICYSxOkI/TNoiR7
 lRLTKY/8HfsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166506032"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="166506032"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 09:24:04 -0800
IronPort-SDR: Ixcs+6aGVSQsHKlWekv80vuwLhh5LIFGrHAX6htll+/D5OErRwYfiwcP6CQbudlGy60kPgyA+q
 YQ0t0qt12bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="356237184"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2020 09:24:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 09:24:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 09:24:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Nov 2020 09:24:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 10 Nov 2020 09:24:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku89Vr+asrnxUsIas+xd0kiZzrncSZB3/bYHb7DZLBhTq54MZfG5ICD422/L+A0JiKdlxRp6Fv9zuauX9Lmq9WDKPv5de6oywv43FP5VBSUsHJ/WXEttGCGugkcPx+n7MRPfVfoz/Mg+8k0+Q84FMS6qwimhmG9uEXlR15Pvn3xPPKExb34CHC+d2J3Vz8TTkow3ayzQaNh87A62SUC6mlenLg8cqZzA2fWO2sOsK1tj9ksDqLudMcL275bvYmIAPtDEBQ/0Ml957cF/sF7U/vZsVSmoAz+3z4VsxOtY+Qu/prhN6+LjaCslORulodaa7gV0f8/pAr8c/BhvvK8DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPTMbO8I631+fSVwqE6AWGBwcFD8Y2W8HAF0RqzVfJk=;
 b=LZct2UFxBER9EmiCFV0Fojh78G7XJZ5JIwdVsXhvVB5aXQn8I98iY+0XTbWMFo1BisOVD48LyNsxtkgA8Sna2dWEUgFiTN8dNbzGcaFlUZsbus6/SxfdOU6AvWGcrjDt5JLearXJLwgkhZHl7ajsT5A7eO2JcLaepnYMECD9rYeU3J9L4vihUUOXggdzP8Qya54Sz21jIXwiLaZxAaf+JhBfjyMtA7kR4kRN8T+ET2mPs9DdOrK6jwUjfh9ZkwZ308PWi5qtUvuyJ7evimz3S93hCIuxuL7736OzvQfT/Z2tJ+R+3JJ+YOv0HC78VbpaCaYAT3Ras6L1qhyxD3lUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPTMbO8I631+fSVwqE6AWGBwcFD8Y2W8HAF0RqzVfJk=;
 b=jFYCSj5sqags/41ScN6EQtKV9tFbCE2+RT3A1x/gvwSDpkuFlGFOTfdBIdcDbQNZVsZqLwnSxFuk5gyqWriBWpbNsxyP5yGxzBz2cs2btW0PYS31qXL/gXdLW0vRsw3Krft9hMwY5fw2x1OhA52jO7AHfADRhfwKm/mMCUDECz8=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1583.namprd11.prod.outlook.com (2603:10b6:301:b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Tue, 10 Nov
 2020 17:23:32 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 17:23:32 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Topic: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Thread-Index: AQHWs8PR1fXMlpsAzEa77sJjy3Zc0Km6OnuAgAEPmYCAAAVLgIAGIMeAgAADsICAAASEgIAAK21g
Date: Tue, 10 Nov 2020 17:23:32 +0000
Message-ID: <MW3PR11MB455531573642A36FB621FF3CE5E90@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-2-git-send-email-jianxin.xiong@intel.com>
 <20201106000851.GK36674@ziepe.ca>
 <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201106163953.GR36674@ziepe.ca>
 <20201110141445.GI401619@phenom.ffwll.local>
 <20201110142757.GM244516@ziepe.ca>
 <20201110144407.GM401619@phenom.ffwll.local>
In-Reply-To: <20201110144407.GM401619@phenom.ffwll.local>
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
x-ms-office365-filtering-correlation-id: 0f3ac50f-283b-459d-8da5-08d8859d58f1
x-ms-traffictypediagnostic: MWHPR11MB1583:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB158311FDCAE783509F196263E5E90@MWHPR11MB1583.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYrdHtyeRj3OcMXx75W8G41aCa8OSL82k7Ngcujpwv2zPnH26ibJJWJRmMEkvCmSC3ncwyzD3/qJ+2EYj7r32fBmrYBIhWekObPE3PQ/qhaogbRPqkq++IcVGq199KP7/4HgmHFFA8YA/mSFaiw4ZqC1PHaM3L3RV1kAWmijpJrda0jKIUttQhFtjw/cy7Plsfz4OrZbDWZ+artHbIpZEQX2UjE57bZIgdNE032Fecl5rB+QAtVzCs0Y7n8J/bq9ev2L7CVk/d3es69fMPNnAcHY8iIq9RxyfMSV/ZJh3UFcPjgYNxVjobTIJs4NnKFv8GKse+hAEsxH5BiL+kB9Hd/fDFt6r9Mx4QH1A/dS1diPzecMKq3YklIJKXT0J2/60erdro/e2MWKN6Ea16vXPAz+R7e3v9l5qvYMmzZampg5H8CPuxEQvt0g2KHoWahAeQLJNP0MC5f58enKbM68IA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(33656002)(54906003)(26005)(83080400002)(86362001)(4326008)(186003)(53546011)(110136005)(6506007)(52536014)(316002)(8676002)(83380400001)(966005)(76116006)(66946007)(66476007)(64756008)(66556008)(66446008)(478600001)(8936002)(7696005)(55016002)(2906002)(9686003)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U5PbxPJhUtzcfdfDdYFD74eDkSEYZo4fz09ha85UJvGdZDGK5rLZjMOyG2V0uYTu6Os/k8AVoWqiRl5z+9s1uCGTOrHCRlPVMn/mFTBHLD/FkFpGG2t/VOKeJafYU5WgnG0uegpcXyYZJ2u8NaFKM9d9+brphY21UDpTMplCFdrdakoVuHKTZ7sHp/6Q7NJQh90jmjwDjmeM705ROPY83C+iKl1ozn8RsAW6h3Z5FklDaECKyHj0LSKyT8ICAtBDGxm5kB3RNsRJ/AK9+W6SZXaIChSQ7YrzWTq/fIH0Nvtpx2FKk7ln7KvGDXc2l5Skfj/v6Cb/iaa2UvtYFmOlY3MKH+/b+6JQRm7JC85XktIC/hYNsCc0fn6moi7eBJA6PEMDDPg2wofOKM7ppeRXICunPxF2hH7FeCARn/fLAUYOIr0qW5JOQUODsl8mjtuI4Hw9E00+lzLUnxCO1ynzrzc4Gy1vI2Q5p+Q+LvJ168lpKmayf+LTOju+DWU9d9xNiWDjzj8oEvWqxo0rTm8euf9FSdz+iBwSd/JzcPQD/qJnNju69WCi2MVJet4ntq73VtljbvZ+SKzYanf5NGp+z4PIzfxCfJznxyIQGNhEDhreJerMNR2+RtBsFVCF9neKPlAWj8b18KV9PS0rBdRvUdHVEZnRMLiAZzEUqYLxtB+BiyJicjkIinef473jm1GT3WQ/8TYSyyU4Hy/1j1nGqKL3gZ64AlYcneKM8lJ9bbm0+Yjvf8SLeytYQ4aIoqnss2Hkz+Fjb0eeAJi6hXs5c1dpAcGOIhOyVMWg2sBtoxUrmUcpqeZPYy/v3i3pBQO47DnZNdbwEhny04nyKt4ALGq8OiGsBXCSCZa+Yl2XJO5Fr9f/xaJ2aadr7m303dShpGt8kjIdkxQX7CIWYZFNXw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3ac50f-283b-459d-8da5-08d8859d58f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 17:23:32.0425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1x6LNrV5DgejAnkkwm29+Cf5I6AkH3vVaAurqq96+j6iWL6nyO7fDu9mCen1hwG/w7cF7oy5AFSFORFee3CNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1583
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
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, November 10, 2020 6:44 AM
> To: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky <leon@kernel.org>; linux-
> rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>;
> Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user memory region
> 
> On Tue, Nov 10, 2020 at 10:27:57AM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 10, 2020 at 03:14:45PM +0100, Daniel Vetter wrote:
> > > On Fri, Nov 06, 2020 at 12:39:53PM -0400, Jason Gunthorpe wrote:
> > > > On Fri, Nov 06, 2020 at 04:34:07PM +0000, Xiong, Jianxin wrote:
> > > >
> > > > > > The user could specify a length that is beyond the dma buf,
> > > > > > can the dma buf length be checked during get?
> > > > >
> > > > > In order to check the length, the buffer needs to be mapped. That can be done.
> > > >
> > > > Do DMA bufs even have definitate immutable lengths? Going to be a
> > > > probelm if they can shrink
> > >
> > > Yup. Unfortunately that's not document in the structures themselves,
> > > there's just some random comments sprinkled all over that dma-buf
> > > size is invariant, e.g. see the @mmap kerneldoc in dma_buf_ops:
> > >
> > > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlig
> > > ht=dma_buf_ops#c.dma_buf_ops
> > >
> > > "Because dma-buf buffers have invariant size over their lifetime, ..."
> > >
> > > Jianxin, can you pls do a kerneldoc patch which updates the comment
> > > for dma_buf.size and dma_buf_export_info.size?

Sure. 

> >
> > So we can check the size without doing an attachment?
> 
> Yeah size should be invariant over the lifetime of the dma_buf (it's also needed for dma_buf_vmap kernel cpu access and dma_buf_mmap
> userspace mmap forwarding). No lock or attachment needed. But like I said, would be good to have the kerneldoc patch to make this clear.
> 
> The history here is that the X shm extension suffered badly from resizeable storage object exploits of the X server, this is why both dma-buf
> (and also drm_gem_buffer_object before that generalization) and memfd are size sealed.
> -Daniel
> 
> > That means the flow should be put back to how it was a series or two
> > ago where the SGL is only attached during page fault with the entire
> > programming sequence under the resv lock

Will do.

> >
> > Jason
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
