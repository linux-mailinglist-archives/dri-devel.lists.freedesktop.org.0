Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A872E2CE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 14:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37910E06A;
	Tue, 13 Jun 2023 12:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68F110E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:25:15 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-403-Ufe39FLKM9uv02YWJ1c2EA-1; Tue, 13 Jun 2023 13:25:11 +0100
X-MC-Unique: Ufe39FLKM9uv02YWJ1c2EA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 13 Jun
 2023 13:25:03 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 13 Jun 2023 13:25:03 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Kasireddy, Vivek'" <vivek.kasireddy@intel.com>, David Hildenbrand
 <david@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Hugh Dickins <hughd@google.com>
Subject: RE: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Topic: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Index: AQHZmkrTMFwnMH2R1EGnnRur83Hw9a+FyCfggAEHOQCAAT7FoIAAoNDA
Date: Tue, 13 Jun 2023 12:25:03 +0000
Message-ID: <89652021ecea4aa2ada763c97deeb543@AcuMS.aculab.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
 <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2FzaXJlZGR5LCBWaXZlayA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gU2Vu
dDogMTMgSnVuZSAyMDIzIDA5OjI2DQouLi4NCj4gPiBJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJl
Y3QsIHRoYXQgd2UgY2FuIGVmZmVjdGl2ZWx5IGxvbmctdGVybSBwaW4NCj4gPiAod29yc2UgdGhh
biBtbG9jaykgNjQgTWlCIHBlciBVRE1BQlVGX0NSRUFURSwgYWxsb3dpbmcgZXZlbnR1YWxseSAh
cm9vdA0KPiA+IHVzZXJzDQo+DQo+IFRoZSA2NCBNaUIgbGltaXQgaXMgdGhlIHRoZW9yZXRpY2Fs
IHVwcGVyIGJvdW5kIHRoYXQgd2UgaGF2ZSBub3Qgc2VlbiBoaXQgaW4NCj4gcHJhY3RpY2UuIFR5
cGljYWxseSwgZm9yIGEgMTkyMHgxMDgwIHJlc29sdXRpb24gKGNvbW1vbmx5IHVzZWQgaW4gR3Vl
c3RzKSwNCj4gdGhlIHNpemUgb2YgdGhlIEZCIGlzIH44IE1CICgxOTIweDEwODB4NCkuIEFuZCwg
bW9zdCBtb2Rlcm4gR3JhcGhpY3MNCj4gY29tcG9zaXRvcnMgZmxpcCBiZXR3ZWVuIHR3byBGQnMu
DQoNCldoYXQgY29kZSBkb2VzIGFuZCB3aGF0IHBvdGVudGlhbGx5IG1hbGljaW91cyBjb2RlIG1p
Z2h0IGRvDQphcmUgZW50aXJlbHkgZGlmZmVyZW50IHRoaW5ncy4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

