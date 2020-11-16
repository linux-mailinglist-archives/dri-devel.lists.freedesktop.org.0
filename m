Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80D2B4BB6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 17:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E973389EB7;
	Mon, 16 Nov 2020 16:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCB689EB7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 16:53:44 +0000 (UTC)
IronPort-SDR: j2xC6IUn5bmBnaEDVTCqRuDS96hjw6Hqgy/5WnhnnKMa+vi8GOWuz8Z+nDwoo5bAuwYSvrJbuE
 M8kTfX/b27VA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="169992979"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="169992979"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 08:53:43 -0800
IronPort-SDR: /FP+xwXTpQF5f+VXuchhVvsJRvADRSBW5uUPlRdMHZvbatEI6Qin/x20lKeppxgiZ/qKksxWJN
 o1Eb1m0jZC1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="475588894"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 08:53:43 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 08:53:42 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 08:53:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Nov 2020 08:53:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 16 Nov 2020 08:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+FdiRnOn6U2sv1DX5T20Jl1A4SivHjdzRY7+ziDo49KAj5XRVL0WtPV6Go21bLficVUg+qB9/L0B3a2bSHr2z8DWLttaqSemzECMJEWz5GTJ/IfqGptsqkvXYhel9hiYSbaACDGxe2cU20+Y4HOzOoIj1/nU0NAII22FftUvF5Iq28hdjI0qpBBIUG+W9dp4ndXKhKcz4d98/hhkzksmAFWmavJk5EPAfl4J0eBT+c/xQyIbMEtw9J/jeDQyBKFxuDFMWeKS63CvOa5zkQ4pyqWw69sjBk4neBVhBEgt1DYxcnZp9UtNwQhxpFnrVA2KA4oFEYXnz5obYFS9Sf31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOyhEY76VCg5jbJ+AGsxuMDCTk2Uh2BWbuAmmIVBK5E=;
 b=NOdt7Nqszz+o8/74MJs0SQ92lzgjsY/zOOSvwloMAkjLSUT0o22EVkUl4RGz27P+T/MVKR39nTDuz/TWdjkDFIelvik4hIm2AMxDqEuC9u+IlMQlw/fXCm3xLuX43C8Uuphlk36QR80yl8L81gjM8OIpA9PKMsA5ueKMj2wPDOZBBnLe+bsSTzjsUA9I69yxB+AXOl7nLQjM79bx5UJsjlFNztEKLZFAxvrqJFgiCbNaN6rVVMklIkzHd5qtWt8SOC2v+xC0Y2JEcix/mD+TIponA5IlpTa57FCKV53qW8VxTIKGVGGgNKpuAVYbD6nty93gxvi09iWSNzt+C9P9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOyhEY76VCg5jbJ+AGsxuMDCTk2Uh2BWbuAmmIVBK5E=;
 b=WndLKJKsSerdb6ciEZbK1DORDipUJd5pPAAlL9fwBUWfETNoVWXE44o5gd77T/PehqCFzEEXxuT4QNe8cD9vYdLLvB3KQLoWBsLWPF1iEXAwbXoMJpLywHia9zi0ayqGSIe23wVktlo/9p3ET88VnDBpNTXHhW7IeBDDecAKhME=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 16:53:40 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 16:53:40 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Colin Ian King <colin.king@canonical.com>
Subject: RE: [PATCH][next] drm/kmb: fix array out-of-bounds writes to
 kmb->plane_status[]
Thread-Topic: [PATCH][next] drm/kmb: fix array out-of-bounds writes to
 kmb->plane_status[]
Thread-Index: AQHWubTDEj9KsuGeVk6Q7nJ6wWbG5anGJsWAgAACaQCAADGjAIAEohjA
Date: Mon, 16 Nov 2020 16:53:39 +0000
Message-ID: <BY5PR11MB4182D871B9BD3FB79213D6F18CE30@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201113120121.33212-1-colin.king@canonical.com>
 <20201113145557.GB3647624@ravnborg.org>
 <8dd5b960-d6c4-73cc-703e-349dc66f2937@canonical.com>
 <20201113180214.GA3675629@ravnborg.org>
In-Reply-To: <20201113180214.GA3675629@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dc2fb12-50fb-423b-b574-08d88a502b45
x-ms-traffictypediagnostic: BY5PR11MB3895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB389571612D78AC5615C566EA8CE30@BY5PR11MB3895.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oNi8Q99F6kum4KP0POWfER4Z/goXGNuxYKDdKixU2qF/PYaRDu2DFEgh5Ecn5BeVeteV0UjOUuedxEHyh3VOXOKu2ZCgktGlg9+bRCj+n+SoUVQBkXT6VbaNBQeSXFsa6JonAQcOA6Ybx5wh8Rv8mkZNNgn1Kt1zBwAedACUEI1M4tQmMNdng8CNKGAP4XaTCw5cznZPGM1oiMyGYHiAyKrIN/z5sPKzVefitQvarjzyNUI1xBF3wPf/stE8BOQgfCix7W1+3+lWE0bs2A0ZDvb+lxSPWnCCDkJ2rL4kvpcclBqGnMEZ04Xe4OQhP+i9fJkqIRk0MribdH4dO4E23g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(52536014)(86362001)(478600001)(8676002)(6506007)(5660300002)(7696005)(26005)(4326008)(71200400001)(66446008)(66556008)(64756008)(76116006)(66476007)(33656002)(53546011)(66946007)(186003)(55016002)(9686003)(83380400001)(54906003)(2906002)(110136005)(8936002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0+KNqmt04ekUjTRrw3alB0G8+idZmYhflnephcjI5lzYLEx2t6xUV4iat2G3uJ+ENw+8zofPMlydcyGQqCbOgpcD/yBYUeupuZDBkMUweszsFBB0xVHE6Mu6AqYSVse/TEuSRpFy42/ED2mV3OrF2QzTwA7H4A3Di5lmPWqJG9a+SYXMyo6H8u3kAoSBIZ9ls6wsAMfg+/qNI6FSI7L/K3iU9//YTIqZ6lighCmKuv1aeMGxY33I5bg512ve6zk80vGwi/njlhxHckJLFBsQbgQVHok1DZzLdthHtSNBFMs5kAQ0KmQvBPVeMZZQ8ARMCmk0UMLOlO7Ip9wF1iBDBfozhAgDyj5OzK8Ck+1zFEACoDM87LlNO0KB6LQlClbV36a4fo2Wf+q5gveMNEalIhFjVP4qqBf7xneaIg0sBa2f6qP8hlBTSu2Wu060109J5Mo3ElIck+uPlexADrkaQZngKagJUqf3qPEfsWZ6UabFG+tqKZcXVPNM/u5Q3aW66QI7Vz84DFAM4fwmwLAStK8CQdgD9nweVGuxPW15fgmh+JXzW77NKiQD2v0MhYnxts7tfIagMigUfTjd2PIb0kjVZi5KlnCJNxIZFLuRcFS2u8YWAGJatmSrwJmuDOGjyP1kcPUZig52bWNzQuOMbg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc2fb12-50fb-423b-b574-08d88a502b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 16:53:39.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uoz59lFKfNub/arTiaw/gAP0l+5WhNIRGCjU1GeFul1gpCccuf1aOA7mK5AvZGtbhVgpa684iU7fpi9JlsyUe1G2bBKC4GpyXzr7iJQ/bTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
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
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam and Colin,

> -----Original Message-----
> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: Friday, November 13, 2020 10:02 AM
> To: Colin Ian King <colin.king@canonical.com>
> Cc: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; kernel-
> janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next] drm/kmb: fix array out-of-bounds writes to kmb-
> >plane_status[]
> 
> Hi Colin.
> On Fri, Nov 13, 2020 at 03:04:34PM +0000, Colin Ian King wrote:
> > On 13/11/2020 14:55, Sam Ravnborg wrote:
> > > Hi Colin.
> > >
> > > On Fri, Nov 13, 2020 at 12:01:21PM +0000, Colin King wrote:
> > >> From: Colin Ian King <colin.king@canonical.com>
> > >>
> > >> Writes to elements in the kmb->plane_status array in function
> > >> kmb_plane_atomic_disable are overrunning the array when plane_id is
> > >> more than 1 because currently the array is KMB_MAX_PLANES elements
> > >> in size and this is currently #defined as 1.  Fix this by defining
> > >> KMB_MAX_PLANES to 4.
> > >
> > > I fail to follow you here.
> > > In kmb_plane_init() only one plane is allocated - with id set to 0.
> > > So for now only one plane is allocated thus kmb_plane_atomic_disable()
> > > is only called for this plane.
> > >
> > > With your change we will start allocating four planes, something that is
> > > not tested.
> > >
> > > Do I miss something?
> > >
> > > 	Sam
> > >
> >
> > The static analysis from coverity on linux-next suggested that there was
> > an array overflow as follows:
> >
> > 108 static void kmb_plane_atomic_disable(struct drm_plane *plane,
> > 109                                     struct drm_plane_state *state)
> > 110 {
> >
> >    1. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> > !__builtin_types_compatible_p()) */, taking false branch.
> >
> > 111        struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> >
> >    2. assignment: Assigning: plane_id = kmb_plane->id.
> >
> > 112        int plane_id = kmb_plane->id;
> > 113        struct kmb_drm_private *kmb;
> > 114
> > 115        kmb = to_kmb(plane->dev);
> > 116
> >
> >    3. Switch case value LAYER_3.
> >
> > 117        switch (plane_id) {
> > 118        case LAYER_0:
> > 119                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
> > 120                break;
> 
> With the current code this is the only case that hits.
> So coverity is right that if we hit other cases that would result in a
> bug. But kmb_plane->id will for now not have other values than 0.
> 
> So it is a subtle false positive.
> There is some "dead" code here - but this is in preparation for more
> than one layer and we will keep the code for now, unless Anitha chimes
> in and says otherwise.

Thanks Sam, I was out on Friday. Agree with Sam, let's keep the current code for now. Kmb->plane_id will not have non-zero values now.
Only one plane is supported and tested currently, the extra code is in preparation for multiple planes.

Thanks,
Anitha
> 
> 	Sam
> 
> > 121        case LAYER_1:
> >
> >    (#2 of 4): Out-of-bounds write (OVERRUN)
> >
> > 122                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> > 123                break;
> > 124        case LAYER_2:
> >
> >    (#3 of 4): Out-of-bounds write (OVERRUN)
> >
> > 125                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> > 126                break;
> >
> >    4. equality_cond: Jumping to case LAYER_3.
> >
> > 127        case LAYER_3:
> >
> >    (#1 of 4): Out-of-bounds write (OVERRUN)
> >    5. overrun-local: Overrunning array kmb->plane_status of 1 8-byte
> > elements at element index 3 (byte offset 31) using index plane_id (which
> > evaluates to 3).
> >
> > 128                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> > 129                break;
> > 130        }
> > 131
> >
> >    (#4 of 4): Out-of-bounds write (OVERRUN)
> >
> > 132        kmb->plane_status[plane_id].disable = true;
> > 133 }
> > 134
> >
> > So it seems the assignments to  kmb->plane_status[plane_id] are
> > overrunning the array since plane_status is allocated as 1 element and
> > yet plane_id can be 0..3
> >
> > I could be misunderstanding this, or it may be a false positive.
> >
> > Colin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
