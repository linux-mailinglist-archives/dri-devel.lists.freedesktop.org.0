Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228530AD75
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 18:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182276E85C;
	Mon,  1 Feb 2021 17:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169626E85C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 17:12:42 +0000 (UTC)
IronPort-SDR: ujzG4vWuNkLJqS/K6zuvG+ujKJNV2DvtEPqcumOXakEf4tf7lbSNu+sN5G8wxjsyfok9HDa0vI
 V4M5UwcfpDzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180796237"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="180796237"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 09:12:42 -0800
IronPort-SDR: gjDdF4FPbz1CO7YtkpSSMgKNCx4M+PoJgKz6xWic+JuMRmSghW63wwKrVpeoAFyLiu8rpm2MU0
 FKh2mIXkwtZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="405834162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2021 09:12:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 09:12:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 1 Feb 2021 09:12:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 1 Feb 2021 09:12:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiwiuX3tCP3WrYhryJ4Mg7ZfGtfzrDfFNEDUXKIElvV+OgzGBOqd4+S5q30n1RLrHwvD+ONaqjD49dyoK5+HSAqOK9Az6HbEfmMx9FarWImYmsx6XVKDTkRJcGK/3WKpQs2T83QKFvyhL7VOYNJ77X7G3Ur4vp+6A4FInSihTFXnTx6NI8OJJ/EUJTIBCC7mL9yn79OpaUYwQZO+JLpx15yO8MHfNnRyz9LgpoT2DCn39BfwjJNCYwxI5GJbFhwwD/h2bd2yoxtVvff2oTE4/8yD72twRzibZkNoSF7Sw+NAGD8TzzwESWwGJyOb8/nffN0w50abgVymi1paPLZQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNM2oWq9Htt9eVPSGtPFZGmV5WidufMM8Ylxvftvx5s=;
 b=iQ3FSOiHxG4kxjvCccYlbPQNxungJk+RgqAI44Wp3Rqqu3e+zCDHb5x/R05YlQ0mMOM9hOSrbzmyHa87DpO8vGSsx270E/srMtCyYk1KhefJ8NfUfR4ioLXcYFmItAamyJiMYMaEku7h+PmWOo1bxxZBrdESTFD4t4SY0p18/XS4nlQFg2Dr2HVDm1VdVMvZT29uQBJFXAefjzxt4VRrLsCDLSXDgcMHs1g76MgUGR8TsFJF0tH6N1xBXpc+gWUNtIbUorDkC9sXfMXwIlG6ZcbCY2u8RtrhVX1iR9fOWuwgs6jlep6LwVrgs67OB67AuyjJ+iwbSVi0HB7yka3ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNM2oWq9Htt9eVPSGtPFZGmV5WidufMM8Ylxvftvx5s=;
 b=dtrRht6HbeGZ5FsOFmRRNlaFzRe1GRaHp8AfEbokr7UiaE2wR5iBlPFdBorzk2CY1LmgMvhLtFheoViSf2P1Ke/2eyqwnK/h/sTNtKA9+x9dfFC2e+4tZOWH5Rx7zliDEaDcpe2QI6YxQ1d5PZ6iZpZlwGp4f3yRA6hzhmG7b/4=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2112.namprd11.prod.outlook.com (2603:10b6:301:50::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 17:12:37 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 17:12:37 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH rdma-core v7 5/6] tests: Add tests for dma-buf based
 memory regions
Thread-Topic: [PATCH rdma-core v7 5/6] tests: Add tests for dma-buf based
 memory regions
Thread-Index: AQHW81IuKgbK67xKWkWTrvoviqU6oKpBc/sAgAIfJVA=
Date: Mon, 1 Feb 2021 17:12:36 +0000
Message-ID: <MW3PR11MB4555F45D21C7375CED57E0B5E5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-6-git-send-email-jianxin.xiong@intel.com>
 <b147c3ca-5754-f317-9f3b-5fbd42eaf4c0@nvidia.com>
In-Reply-To: <b147c3ca-5754-f317-9f3b-5fbd42eaf4c0@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 139e1c58-97b6-4e54-67f1-08d8c6d492c2
x-ms-traffictypediagnostic: MWHPR1101MB2112:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21124E164BA1AF5523051C38E5B69@MWHPR1101MB2112.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jUxxWGYCDt6voReumf/6A5Q1k3sKknWEnjA80UcPVombf/cX9JpJ47e9FiABpfseGQf7KznystmpM8VNUukqVSAvfS2rWwcdr4FJr7CVom+ov8i6gizz5oWgR40bufea5bFMUMLAcDQvHODHv85zMEZ9BixL6yz38pVcLSMFWbTGMnIDnKXHCdNaH1V/dBIsCgS0/oie1Fg4jKIdIvnMC+smDtea70yrNWg10GEfbafi0o08tt6gF0EP9+DvRb50aIFbG66+YuSafyzJLNzHhpXU5+8Lsokt0LUoKbsMsC7dr2QbrcAPgCxjFAQYzQlnAxqfEYEeEhsHGzJSHlovs8LSL2J9mGsZNFs/AbO3n8DyykTI32B/czIVgHTwIfIoZ1UnjS2ZsJdozI8ZtkLmlVCV4ATZKgDUkZo8BWoCQxkjnTXZCeDQSFmr92Ge7qEkIRZ+QFfXz39FyJldJ8F0kvtz0gTulPQLBM+QHCtcxB4yhAStC0glCtaHOCocFv2T/snGCWXaSbDDSHu9XM885g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(110136005)(53546011)(6506007)(54906003)(9686003)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(186003)(4326008)(55016002)(8676002)(52536014)(7416002)(7696005)(83380400001)(8936002)(33656002)(316002)(71200400001)(5660300002)(26005)(86362001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?akJ3T01vdmVRUXEyeUE3eE05NWREYXcrejhIQjREMmdkRnNJV3hoSFFjRjFK?=
 =?utf-8?B?bUo4NGRNSWk1RGYvdkFhLzd0d054MW1qSVZTdFVvbExkNXFHWW9semZTYTV3?=
 =?utf-8?B?UEtRZFZxYmVZY1hybHA0TER0QXAyaC9pSzQxTTduQ3NiSlV5ckd0UFU5M1FY?=
 =?utf-8?B?Vlk0UVhHaHBWc3BtcGRua2U1UWgvRmZKVHoybDhRK3gvZXRjZ2MwTWM0bllV?=
 =?utf-8?B?aUZNMnF4WW16UVRjdXpTZXExSlcyS3Fzd0J4ZGpyVjRsenRNNzBNTVIzQXh0?=
 =?utf-8?B?VC9ueUlDTFRQNVNvSEN2Q1NLYjB4RXEyYW0xcXhTVGIvLzJpQ3BTU1RVNnBi?=
 =?utf-8?B?YlF6WHhVejlST09BMk14MFBHMnUveXBiQlpNb0lHc3E4ejF6Zjd1Yy9FN0or?=
 =?utf-8?B?TG9vaUlXUUhmL2pzbTNubjhWY2NyR1pVWjBwSG5zSzdCckFNRFZBcnBReFFI?=
 =?utf-8?B?M0sydlN5ZTVSN0RyMU84M1hMSW9BT3lNV0N4WUlnRE9LYjBKOTBCWkxMYTFi?=
 =?utf-8?B?aTJBZXlLbGFnMUhNY1ExVVBMUUlSS2RCVG1aYy9DV0ZtN1JJNUNtN3VwSndu?=
 =?utf-8?B?WEp3cGo4ZFRSUDF5TDg5N2hVVDVRSkRqNXZjWHdTOEZ0czBVTjl3dkd6NzVP?=
 =?utf-8?B?d1RIQ1RCWlFWSzlRaitVb2pFQ0tjNm40YXZzOC95SG1ZRnY0UG0rbHBKR2RQ?=
 =?utf-8?B?Ly81OElkUTQxeXVTR21UcklHNmtSd011ZDFhZGh3ajZ4OGpsV3RWYmVPMzQ4?=
 =?utf-8?B?UGI4Yk1nQW5mM3JWM1ZneHhuUnZPdG9kbmovYWJNaWlqdjNmSE1zSDFGOTMv?=
 =?utf-8?B?MlZWYzZheWJLV09EZU8yY0RwYm02c0hheHYrc1lnSFE0bE85QUJHMXk4bzc3?=
 =?utf-8?B?NzNrVzIzbjJrbkpHRW1MZi9UaVVlZ1pGNVBoekYzbUFFNElJTE5JY0VJOTUr?=
 =?utf-8?B?cjN4TEhuY3dsejkxQytabkFaYU5iQnM0SUtXTlNaWTBkUytIVkF5T1ZPUTAy?=
 =?utf-8?B?Z1dkUEdTb1Q4cFBuZ0crdi9ZRVFJQmxCR21mZzBNWFZOQ09LTm5qcTMvQXdl?=
 =?utf-8?B?T1JtU29MUHRGRVdMVXJXSElMRVRNQk1qVVRZcDlHQkIzS2tjcXpmQ3h5ZG8x?=
 =?utf-8?B?d1lRbGU5dmtFdnpkdUo1U0lCaUlXZFMrcVlkaDhTWTc3YUsydTRTbzJUNTJi?=
 =?utf-8?B?Tm5ReUFWTW5jRjNKajJxa0grWTc4SkhlVHB6T0hlOHlBUHo4MWJOY0NYa243?=
 =?utf-8?B?MHlrUVVUY1MyYjBna1c0TUJZdURkMTZoVlIxcnVCc2NydjZ0ckI3U0FId2pX?=
 =?utf-8?B?VjZnU2ZCZnV1NXpEUlUwNGg3N1p6aDlDUEVGc0ZYbUltREc3SFR4T0FDbnp5?=
 =?utf-8?Q?Y+ZNa2RjuYsHWtxK8cZzVLVKlKvfuDiA=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139e1c58-97b6-4e54-67f1-08d8c6d492c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 17:12:36.9788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgAujVEe5ndfdkAkPoz2m/eNEtCOy2/4YvxcP2FjiVOlk8Icig2emRq++c69o2fnXoBw1jmARzq+jQiTuwVS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2112
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: John Hubbard <jhubbard@nvidia.com>
> Sent: Sunday, January 31, 2021 12:45 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky <leon@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel <daniel.vetter@intel.com>; Edward Srouji
> <edwards@nvidia.com>; Yishai Hadas <yishaih@nvidia.com>
> Subject: Re: [PATCH rdma-core v7 5/6] tests: Add tests for dma-buf based memory regions
> 
> On 1/25/21 11:57 AM, Jianxin Xiong wrote:
> > Define a set of unit tests similar to regular MR tests and a set of
> > tests for send/recv and rdma traffic using dma-buf MRs. Add a utility
> > function to generate access flags for dma-buf based MRs because the
> > set of supported flags is smaller.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> 
> Hi Jianxin,
> 
> It's awesome to see a GPU to IB test suite here!
> 
> > ---
> >   tests/args_parser.py |   4 +
> >   tests/test_mr.py     | 266 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >   tests/utils.py       |  26 +++++
> >   3 files changed, 295 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/args_parser.py b/tests/args_parser.py index
> > 446535a..5bc53b0 100644
> > --- a/tests/args_parser.py
> > +++ b/tests/args_parser.py
> > @@ -19,6 +19,10 @@ class ArgsParser(object):
> >           parser.add_argument('--port',
> >                               help='Use port <port> of RDMA device', type=int,
> >                               default=1)
> > +        parser.add_argument('--gpu', nargs='?', type=int, const=0, default=0,
> > +                            help='GPU unit to allocate dmabuf from')
> > +        parser.add_argument('--gtt', action='store_true', default=False,
> > +                            help='Allocate dmabuf from GTT instead of
> > + VRAM')
> 
> Just to be kind to non-GPU people, how about:
> 
> 	s/GTT/GTT (Graphics Translation Table)/
> 
> 

<...>

> > +def check_dmabuf_support(unit=0):
> > +    """
> > +    Check if dma-buf allocation is supported by the system.
> > +    Skip the test on failure.
> > +    """
> > +    device_num = 128 + unit
> > +    try:
> > +        DmaBuf(1, unit=unit)
> 
> unit?? This is a GPU, never anything else! Let's s/unit/gpu/ throughout, yes?
> 

Thanks for the feedback. Will integrate the suggestions in upcoming patch.

Jianxin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
