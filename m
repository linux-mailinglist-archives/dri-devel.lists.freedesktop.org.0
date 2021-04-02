Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E2352720
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 09:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1DE6EE33;
	Fri,  2 Apr 2021 07:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFB06EE1C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 07:56:37 +0000 (UTC)
IronPort-SDR: dBTz2/8BnAJqp6AXkdVoeH1+pC/gFwtACwQI+HO/yHMlHMZgZRPXuNEDpPkhM8WA8Cbu95JUq1
 cc0pJxYPM+XQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="212687659"
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; d="scan'208";a="212687659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 00:56:37 -0700
IronPort-SDR: VYXwrLUspHc99F/TLx+T/WQBLu2pbScG6E68V2h9w8X8kuuFmaY52IsGrXtIipXajaJKoMcrm2
 yMs8xtxJHf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; d="scan'208";a="377994664"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2021 00:56:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 00:56:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 2 Apr 2021 00:56:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 2 Apr 2021 00:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVdTwxkjuuXq2AVG06Ahj67zWMUX3sjI9v3X4Ak6thjeFS2sr1GZO5ee7yBnbt5qE1rxXTIrmG+KZIIDoeQaZDFvXHuqWJzEtmU0zR2SN10vELDM2qoul/gPjhqwkC7OEXl2sDNGpwxLnRYS6q6Wn99Qn5nWVUadXsRrB8kM/2UM0GC9bLZefXZ7HYuaqiVK1tsrHe3sw7d3STev3S4lzZRhmE6a00GMOj0x+0wMDqndNFU4znTe8cI+ddzZuP7u9TUkKzinaqxHT9pGGqf2o93X10eSREW/wTM+dq5ao5FYZ3I6CrCQeNsHTgmDwX1C90abH8TM/do5w/NFxTM8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTnX6ljwlKrO6RC4FXcUw0WfA1NRczJaSpVzEEFPXdE=;
 b=NHpITmNTUzGqdHjJUG6wUNUUuH6ygdWZrOomkdfNaQAiI3acw+hM5houBEp1Dr9d3EEN+B7EOosvy388FgFeIXBAwMpCm0e+wdfO9t6JSibqjhPPs63dKhSVcZw8WNS8SFwgTubna1b1HXZEqKkvu+E8frA2qRe0rBPBpsmC/jKBSyMqEkQKCricV4Z/EArDHbHYTnHVbnFBJTUqUSPvYE9yRjDj3Wk98gbVnOxULBj/52OgF2AG3p3b27htlQfEACiXW27+GmYZw3ZY0ZEzp4CT4+4+qrbfBOk633tEkh1aDxFP8khjaPou+p+ogtiYvTvWnCjzxEkmaDDvAIyz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTnX6ljwlKrO6RC4FXcUw0WfA1NRczJaSpVzEEFPXdE=;
 b=Vw6MMO90w1AN2hLsCufHxPMN9zQCKg/l90wwYYWuEWCpNQPfeppKHQAcc6ysi8DwmUesgdbtBLdAWeQ3I8kOpUf0JbwSN3NST3l/enPej3CO01Aq4xTcVFIUL9ILM1LmlZRnDlnAPJ1Bx+PWR2pBr+OKm8WB/uwSgcNU2+sNRwU=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 07:55:31 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10%2]) with mapi id 15.20.3977.033; Fri, 2 Apr 2021
 07:55:31 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
Subject: RE: [PATCH 2/2] drm/virtio: Include modifier as part of
 set_scanout_blob
Thread-Topic: [PATCH 2/2] drm/virtio: Include modifier as part of
 set_scanout_blob
Thread-Index: AQHXJdwnn8uIntYIpU6Bs1AYzBrSXqqdu/cAgAMIJJA=
Date: Fri, 2 Apr 2021 07:55:30 +0000
Message-ID: <BN7PR11MB2786BC5FE3B4F3D9D5E1AEA8897A9@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
 <20210331030439.1564032-2-vivek.kasireddy@intel.com>
 <20210331075958.ax4rqedbebnoad6x@sirius.home.kraxel.org>
In-Reply-To: <20210331075958.ax4rqedbebnoad6x@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d29d5973-9069-4442-5bd5-08d8f5acb024
x-ms-traffictypediagnostic: BN9PR11MB5452:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5452199DF565C226494242EA897A9@BN9PR11MB5452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0eCaJ0S4ABp94qdiXcx21qV5kZYXCf2COWDhoLmfWaNP2K0T92F0Sp+YxQupfrarX3f/P3zU9qw9JxKNmkhwEprOUvEqFJ28zIFD14Eqwq9Z+WkrWVF6KeN/Mxb7uwUBocDclUCfXovnNHU48OB9xSzyUzBQRSFX19p7VJoNFTbXCKi/+5ln6aJFsfAjkKAEa60Frt3bantWoxn3ZlxU++rBpxzyXkZQWK6PwXZkHNSp88QJ2Dst23bWIkGOyXfJhDSfojjDcYqjWdiOoG7pOoFTKRfnHmMmhQOmvLkH0Q5XkdwvQnwuhcYGF1RSxiK9qNx/c2AtDPK+JpvPkSzfySOUEgztfNtM0b7SEiXRK9E9UcdAz9KToK1Jl/8Yal/RwdESgoLQzqI4EXViTZUm2p0tmk271xL5NNaFCCtRoaCTbr3dsut+5HJRB/TApbHfw7xMtjEhqBMnW+b/gOki1viAcp42ccI+eUb+xn9TCKxkycvUD1gfj/ibg1ANji50d4NCEei8tlKIzlCQtkIjpyx5ihTCWC0sAbemSOWU+FyeWolrz/t2ZnX4EpqhzNi6mIW0lQelAB6Ihv2Ol7hMGNKhEUtNPhdgYw/JxFTT78VimTb4l6BB5a07r2sz/sgbE46hXuOdcPmZtr9uQcIGgFCkpeWn0pabqa08p7oeM51k+fcc5igQf+tFZQ3Hyjw3INITx8MQcGCbhq7oNN7BPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(316002)(86362001)(53546011)(38100700001)(66476007)(110136005)(7696005)(83380400001)(2906002)(6506007)(55016002)(54906003)(9686003)(478600001)(64756008)(66556008)(8676002)(66946007)(66446008)(52536014)(26005)(71200400001)(966005)(6636002)(4326008)(5660300002)(186003)(33656002)(8936002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MTu7z0rpP8PDsV9ONDC3xvbCYbEGLolB5PqeAPS6KrSCLeJDS1hwWIGupgJn20xBRYR0ReGGeJB/feOR8MvakpFS3yq0xETxsQULfXlG7li8643Z+HN58A2f9emXG6U+Nte1Q4wNzqPz8uRLfQEgKjKePcxA45PDWou97nsoW8+t/isaUSzC85Tr8n6hTpli+lsugBm5az8ziLlm3A8lI1FPxxeN/82xxmzWKhi9SCSMR3evaZNjEN3qggQ6mCoAVZUl4SOmwWzCoz7Cm4d3M4Rhbs25rzvTaSNkQlRXk0d9e1LNamWI/LCmkosGxCx6tJQnVcthyFvw3+RjkMfxyfq+Bg4CM7fj8LNqkYqPMf0/sn4C76i8OuIsbVy8IjlguXCmL0vWDUBPrU4WVPbSJ3+jLLrYMcBiNxrwoWUtBhat29USbEPR/9VtGyVslDMGYy7Vri4gKbKGj/fLgT99Chtoq54yLDRl+FX/xgyp1czbZSUP2fw9KOZIkySPYqpQ3IvRXzQ0ve6P2ocnMs/QiNXySijl4D2MKSKi78rMr+tibekLIkrwvywxdjmxoP0hyCb2Xw8SCgNB+XKZjLphaRVEe4/68a8qt9kpjE1MSz4H4Ij44dBHEMmZN0pZKux8JWif9t1VLFP/S0AtD+K/te3OcHnS623864+O0AFSrT4C4kB6wdDoT9RVnBeijh+QjgRJWqFOZUfiJqNOp2ipEbpuE7Zt6lmJ0nFL10WwvQkZSjpThNCz0I/S/H8Kztdu
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29d5973-9069-4442-5bd5-08d8f5acb024
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 07:55:31.0138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +p+Na+G4a2KNSys21dz0HkpoO68AiwPvI4/4zX2IAxWvRGF6CWMG2Gw1b4LaBUhA2Q15SdiYRdqq8N8sBxk9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5452
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Gerd
> Hoffmann
> Sent: Wednesday, March 31, 2021 4:00 PM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: dri-devel@lists.freedesktop.org; gurchetansingh@chromium.org
> Subject: Re: [PATCH 2/2] drm/virtio: Include modifier as part of
> set_scanout_blob
> 
>   Hi,
> 
> > -#define MAX_INLINE_CMD_SIZE   96
> > +#define MAX_INLINE_CMD_SIZE   112
> 
> Separate patch please.
> 
> > --- a/include/uapi/linux/virtio_gpu.h
> > +++ b/include/uapi/linux/virtio_gpu.h
> > @@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {
> >  	__le32 width;
> >  	__le32 height;
> >  	__le32 format;
> > +	__le64 modifier;
> >  	__le32 padding;
> >  	__le32 strides[4];
> >  	__le32 offsets[4];
> 
> Nope.  This breaks the virtio protocol.
> 
> We'll need a virtio feature flag to negotiate modifier support between guest and
> host.  When supported by both sides it can be used.  The new field should be
> appended, not inserted in the middle.  Or we create a new
> virtio_gpu_set_scanout_blob2 struct with new command for this.
> 
> Also: I guess the device should provide a list of supported modifiers, maybe as
> capset?

Hi,

I agree that we need a way to get the supported modifiers' info to guest user space mesa, specifically to the iris driver working in kmsro mode.
So, from the guest mesa iris driver's point of view, the working flow may like this:
1) Get the modifier info from a display device through the kms_fd. In our case, the kms_fd comes from the virtio-gpu driver. So the info should come from virtio-gpu device.
2) When guest wants to allocate a scan-out buffer, the iris driver needs to check which format and modifier is suitable to be used.
3) Then, iris uses the kms_fd to allocate the scan-out buffer with the desired format.
     Maybe this time we'd better consider using VIRTGPU_RESOURCE_CREATE to allocate buffer instead of using DRM_IOCTL_MODE_CREATE_DUMB. It seems VIRTGPU_RESUORECE_CREATE can give more fb info.

BR,
Tina

> 
> Note: I think it is already possible to create resources with modifiers when using
> virgl commands for that.  Allowing modifiers with virgl=off too makes sense
> given your use case, but we should not use diverging approaches for virgl=on vs.
> virgl=off.  Specifically I'm not sure virtio_gpu_set_scanout_blob is the right place,
> I think with virgl=on the modifier is linked to the resource not the scanout ...
> 
> Cc'ing Gurchetan Singh for comments.
> 
> take care,
>   Gerd
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
