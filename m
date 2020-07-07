Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C758217ACD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 23:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF4089C09;
	Tue,  7 Jul 2020 21:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAA889C09
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 21:58:28 +0000 (UTC)
IronPort-SDR: wgEH5Qu4q02qQRzuj8l5Ip/QvrlzuUq1+hXbe+mCA4J6YeHW2/NUBn0y2X/9Pxpt3FuCIlaHxT
 gzx3DgXvRS5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212647448"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="212647448"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 14:58:27 -0700
IronPort-SDR: yfS+lO0VC29WYs1+0Zi06PZSSJFf6DjZPi+IdmOcSFbATt6DJ5U3TYzOcrh7m0DkX40uALRjl/
 YWxuEXDjAjYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="357914426"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 07 Jul 2020 14:58:27 -0700
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 7 Jul 2020 14:58:26 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 7 Jul 2020 14:58:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 7 Jul 2020 14:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3WRfzBFvaM3n7MQuVA87vYl9pra6Cf9hhQnFlnYv6unDUdyMC95I41aISRvaQjitHnU2QQnlPz2hd9ipvsePPJLmzachupdhHQCyaQwzupwCaqTgq+aHKOh9Iy1HKvLyCdlA/2KazkyMcNczmzQkKxKl/PAR1Fr035PwSalvuYElOA9+iDcF4O2qbUCcyB6ptAXWBrFcu1u1X9/3KakTLep6atWQ1yVjyeet+uPjEuVMj1b6pxtPIPKzaLeInjT4AfG7LpPS4BSXzcIwGl1wUzd55IrIwV6HqHCtv2gUV8AQuYKvasVowZbFJuZiNpMUCxxspc17Eh4oEot4++7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKWWp5clsX3XPPnfRSK0b9pFEt4AdDitxnCB0dAtd1c=;
 b=PCAam9fHfjVr0F0v3/UjLPupVs+sb/m0KNTWcihSYogBYGtBlww9NT8c+mUt5ZvHiKEQMxv9PrfzW2q9d94912a7/BTHk+aAQZW8BKkv2bh72wKEwh4DHZh7UoYJL7Tc1RnSzT34n5tLGNAlkajGuXZA5Jo0gq1Vm3GL58ZDZeX1H2uz5goTdm1MfY4Xt9ulWF8RiN++0nUz/+BNNIex0U04v2461yjWWRZQGhXNu3yHxWqaYvX9g+IcN3lpuugj3P6XDtMw7F1blOeO1yWd0BNSJ0k2PbYxRfyxsHwYMj7U5p7rHVCLM4qe3sU7PGeNfn6tCz7dMhGW0A37+5W9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKWWp5clsX3XPPnfRSK0b9pFEt4AdDitxnCB0dAtd1c=;
 b=Ihrf1G6WiGAirLAVI7GkDaORVHX0KV1+bgI3+j1a2afnH4bPrq5qG8kP7cEhn16HTxxuHG3JQfkCFgkHJcUZfhe6SgdBbwIU2ypqNTUgeKvA+Dc+gdOCmINSIbQgCzRQkMu4rai7zS6s70PYMzQdDpJzmQORpPbjzAopdcXfG8k=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 21:58:24 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::ed68:a00b:2bb0:21cf%8]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 21:58:24 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Topic: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Thread-Index: AQHWTjmKZPnzyjUH+EiOzVuDukOX/Kjv8EEAgAFgqNCAABwVgIAACtwwgAD4kACAADxYAIAABK8AgAAuhoCAABn/AIABTcUAgAAFjoCAABaJAIAAOVAAgAEqX4CAAA2LgIAABleAgAAByQCABtRI4A==
Date: Tue, 7 Jul 2020 21:58:24 +0000
Message-ID: <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
 <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
In-Reply-To: <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 513e0610-76b6-423c-f5dc-08d822c0df1f
x-ms-traffictypediagnostic: MWHPR11MB1280:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1280D3BBD05182CE631FEB0EE5660@MWHPR11MB1280.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EJHXKrHvBMnrK6tLQu77sNgTiHrc3peWlclfm9myC87CElg56HnO1QqZnExs78Ec3N814AjUEO8P2t8symH45BC4UtOEbpDKNronLg9dEvzQWTrTuInxO+fUumd+NvXrU8cKuR0iNeRsh2SaEz9+dit7NGNHuOCLgu25d6fO0BvUh/ZjwE0E33OOa/TSFEYPXMO0ExxZPXHJC8J8vWTB97V0ix46bex9HjTgtxWSEjNtvX/yPAHBx1eS2dI58Mj8Tlmj9cFRWOtRCDFSD+h8D+K0S0i2UHnRfOYSkDcdFFg4/WXDsN64wkz2wqacLJM7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(66476007)(6506007)(66556008)(83380400001)(2906002)(8936002)(26005)(33656002)(71200400001)(8676002)(186003)(316002)(110136005)(7696005)(54906003)(86362001)(66446008)(66946007)(55016002)(64756008)(76116006)(4326008)(5660300002)(107886003)(66574015)(52536014)(9686003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hvMJG5itT6GwZRmxeo7rR3QeMRvdKFnZgu9VJc279FKndhSugLgtXjVip43n6NBbJvk5vn45iF38F/kbIpnPGHZw5csrRPg6Z/9D62ax9JwylSzsAbiSGDxdhcHFobTErtJLSTWuD4DJl4Efhaxy5iAbjA1pVwFMQE3pyewcTLUBu0CxxDENusE2IeLa4rtALRG6VjaBhymmrUrDnY/CJfdBVglSqYtPlILmdh7a+8JevxmTKd2Y8VF3Jx9qp08MMPqbjKinrqvGwJqfAFAMo80vdfp1kalgLPcE4Cdicjg6dPYw/zWULr0nHUcVKOG/B4NXs9g7Ki2cQOIDMepppW67sqteFSTCTHbgE/jpwCgDIuVLpcOQZqAIYobIStA2kfiPFM7X1JR7fTyP0DZMWbrJh9nrYi7N1DrQFMniXQtvld3ifj8oJUoNuMUiUgaOQQJv+qftywMLI+nihsk8aPVZnSHB3CSgt6Dy6YJUe3WLm/XSZpFcP0h88WCn+O7s
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513e0610-76b6-423c-f5dc-08d822c0df1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 21:58:24.4179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X988LxJmpcFsiR1hhGNrHIw/tFRgDiKb/qIo/OHq4Fbc2RFK/pg9KD+wf3DGyGueI1tLbp6ZZXftO4d4lcifaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Doug Ledford <dledford@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQW0gMDMuMDcuMjAgdW0gMTU6MTQgc2Nocmll
YiBKYXNvbiBHdW50aG9ycGU6DQo+ID4gT24gRnJpLCBKdWwgMDMsIDIwMjAgYXQgMDI6NTI6MDNQ
TSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gPg0KPiA+PiBTbyBtYXliZSBJJ20ganVz
dCB0b3RhbGx5IGNvbmZ1c2VkIGFib3V0IHRoZSByZG1hIG1vZGVsLiBJIHRob3VnaHQ6DQo+ID4+
IC0geW91IGJpbmQgYSBwaWxlIG9mIG1lbW9yeSBmb3IgdmFyaW91cyB0cmFuc2FjdGlvbnMsIHRo
YXQgbWlnaHQNCj4gPj4gaGFwcGVuIHdoZW5ldmVyLiBLZXJuZWwgZHJpdmVyIGRvZXNuJ3QgaGF2
ZSBtdWNoIGlmIGFueSBpbnNpZ2h0IGludG8NCj4gPj4gd2hlbiBtZW1vcnkgaXNuJ3QgbmVlZGVk
IGFueW1vcmUuIEkgdGhpbmsgaW4gdGhlIHJkbWEgd29ybGQgdGhhdCdzDQo+ID4+IGNhbGxlZCBy
ZWdpc3RlcmluZyBtZW1vcnksIGJ1dCBub3Qgc3VyZS4NCj4gPiBTdXJlLCBidXQgb25jZSByZWdp
c3RlcmVkIHRoZSBtZW1vcnkgaXMgYWJsZSB0byBiZSB1c2VkIGF0IGFueSBtb21lbnQNCj4gPiB3
aXRoIG5vIHZpc2liaWx0eSBmcm9tIHRoZSBrZXJuZWwuDQo+ID4NCj4gPiBVbmxpa2UgR1BVIHRo
ZSB0cmFuc2FjdGlvbnMgdGhhdCB0cmlnZ2VyIG1lbW9yeSBhY2Nlc3MgZG8gbm90IGdvDQo+ID4g
dGhyb3VnaCB0aGUga2VybmVsIC0gc28gdGhlcmUgaXMgbm8gYWJpbGl0eSB0byBpbnRlcnJ1cHQg
YSBjb21tYW5kDQo+ID4gZmxvdyBhbmQgZmlkZGxlIHdpdGggbWFwcGluZ3MuDQo+IA0KPiBUaGlz
IGlzIHRoZSBzYW1lIGZvciBHUFVzIHdpdGggdXNlciBzcGFjZSBxdWV1ZXMgYXMgd2VsbC4NCj4g
DQo+IEJ1dCB3ZSBjYW4gc3RpbGwgc2F5IGZvciBhIHByb2Nlc3MgaWYgdGhhdCB0aGlzIHByb2Nl
c3MgaXMgdXNpbmcgYSBETUEtYnVmIHdoaWNoIGlzIG1vdmVkIG91dCBhbmQgc28gY2FuJ3QgcnVu
IGFueSBtb3JlIHVubGVzcyB0aGUgRE1BLWJ1ZiBpcw0KPiBhY2Nlc3NpYmxlIGFnYWluLg0KPiAN
Cj4gSW4gb3RoZXIgd29yZHMgeW91IHNvbWVob3cgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCB0aGUg
aGFyZHdhcmUgaXMgbm90IGFjY2Vzc2luZyBhIHBpZWNlIG9mIG1lbW9yeSBhbnkgbW9yZSB3aGVu
IHlvdSB3YW50IHRvIG1vdmUgaXQuDQo+IA0KDQpXaGlsZSBhIHByb2Nlc3MgY2FuIGJlIGVhc2ls
eSBzdXNwZW5kZWQsIHRoZXJlIGlzIG5vIHdheSB0byB0ZWxsIHRoZSBSRE1BIE5JQyBub3QgdG8g
cHJvY2VzcyBwb3N0ZWQgd29yayByZXF1ZXN0cyB0aGF0IHVzZSBzcGVjaWZpYyBtZW1vcnkgcmVn
aW9ucyAob3Igd2l0aCBhbnkgb3RoZXIgY29uZGl0aW9ucykuIA0KDQpTbyBmYXIgaXQgYXBwZWFy
cyB0byBtZSB0aGF0IERNQS1idWYgZHluYW1pYyBtYXBwaW5nIGZvciBSRE1BIGlzIG9ubHkgdmlh
YmxlIHdpdGggT0RQIHN1cHBvcnQuIEZvciBOSUNzIHdpdGhvdXQgT0RQLCBhIHdheSB0byBhbGxv
dyBwaW5uaW5nIHRoZSBkZXZpY2UgbWVtb3J5IGlzIHN0aWxsIG5lZWRlZC4NCg0KSmlhbnhpbg0K
DQo+IENocmlzdGlhbi4NCj4gDQo+ID4NCj4gPiBKYXNvbg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
