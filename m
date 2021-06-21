Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FF3AEBEE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBEC89346;
	Mon, 21 Jun 2021 15:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E189346
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624287875; x=1626879875;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMFm7DRqfOr51mpOkgcgQZ4WLcz/JJndEHy5ANm5f5o=;
 b=nGyAn87Oj1+ENFgGJ7g3DNAOXtac0ZKf+UZ7oDRVy3b9MOwlWrdY1Jpo0GfRqo50
 VZkOTstkPb6NN5Y0D9RiT0E14y+sGsuEaAcTO9XavaYG9sDkLQtB+AUai9LQV4YE
 CMhS/FgWI4m6SQV6WYIT3tSg0IMy+MhwtBl4SR4EtL8=;
X-AuditID: c39127d2-a9fbd70000001c5e-57-60d0aa83d6cf
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id AA.67.07262.38AA0D06;
 Mon, 21 Jun 2021 17:04:35 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 21 Jun
 2021 17:04:35 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009; 
 Mon, 21 Jun 2021 17:04:35 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Topic: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Index: AQHXMdf+y0dS36bcQE6gcAvYiVq17ar1fdqAgCjp/gCAAGNSgIAADRwA
Date: Mon, 21 Jun 2021 15:04:35 +0000
Message-ID: <eae45605716b194bae63e445a28f07897d4e82fe.camel@phytec.de>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
 <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
 <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
 <20210621141739.GA823900@ravnborg.org>
In-Reply-To: <20210621141739.GA823900@ravnborg.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F0C08E8BCAC684F8D34E77AEC286C94@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsWyRoChTLd51YUEgxdXDS16z51ksvi/bSKz
 xZWv79ksOicuYbe4vGsOm8WKn1sZLX7umsfiwO6x99sCFo+ds+6ye8zumMnqsf3bA1aP+93H
 mTyWTLvK5vF5k1wAexSXTUpqTmZZapG+XQJXxtJZN1gKLrBWTL8T1sC4h7WLkZNDQsBE4trz
 32xdjFwcQgLLmST+rdvNCOE8ZJTYveQdlLOJUeLD5BNgLWwCLhKf276xgdgiApoSH19PYgcp
 Yha4xSSxYdFSFpCEsECixOVDX1kgipIkpj58zAphu0kc37CCHcRmEVCVOHfxIROIzQsUb5rT
 DXXHI0aJCat/MYMkOAWMJW7OWw42iFFAVqKz4R1YA7OAuMSmZ9+hnhCQWLLnPDOELSrx8vE/
 qLiCRFtPJ1A9B1C9psT6XfoQrRYS254sY4awFSWmdD9kh7hBUOLkzCcsExjFZyHZMAuhexaS
 7llIumch6V7AyLqKUSg3Mzk7tSgzW68go7IkNVkvJXUTIzCaD09Uv7SDsW+OxyFGJg7GQ4wS
 HMxKIrw3Uy4kCPGmJFZWpRblxxeV5qQWH2KU5mBREufdwFsSJiSQnliSmp2aWpBaBJNl4uCU
 amDU2PzK9+P9W/dWMMxI6mTRapNQFi+eyl6RJjUzzD3f4rG67QGZ41UlHf93r1m/rc/zr2Cy
 QW1xsIfvbeE45l35GR7RR9JCZF7vXuymIcwhuE7wxuSAd1H57rzXGnM/6B2MWspXwVG7huHU
 Prfn1xj+nJ2uZFyy/sb6eiWTGffW1nwOruw60KDEUpyRaKjFXFScCAAHGwMV1AIAAA==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpPbiBNb24sIDIwMjEtMDYtMjEgYXQgMTY6MTcgKzAyMDAsIFNhbSBSYXZuYm9y
ZyB3cm90ZToNCj4gSGkgU3RlZmFuLA0KPiANCj4gT24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgMDg6
MjI6MTBBTSArMDAwMCwgU3RlZmFuIFJpZWRtw7xsbGVyIHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0K
PiA+IGFub3RoZXIgZ2VudGxlIHBpbmcuDQo+ID4gDQo+ID4gQWxzbyBhZGRpbmcgTGF1cmVudCBQ
aW5jaGFydCB0byBDQy4NCj4gDQo+IENhbiBJIGFzayB5b3UgdG8gcmVzZW5kIHRoZSB3aG9sZSBs
b3QuIEkgaGF2ZSByZXN1cmZhY2VkIGFmdGVyIGFuDQo+IG9mZi1saW5lIHBlcmlvZCBhbmQgZGVs
ZXRlZCBhbGwgcGVuZGluZyBtYWlscy4NCj4gDQo+IEkgY291bGQgcHJvYmFybHkgaHVudCBkb3du
IHRoZSBtYWlscyBzb21ld2hlcmUgYnV0IHJlc2VuZCBpcyBlYXNpZXIgb24NCj4gbXkgZW5kLg0K
DQpTdXJlLCBubyBwcm9ibGVtLCBJJ2xsIHNlbmQgaXQgb3V0IEFTQVAuDQoNClN0ZWZhbg0KDQo+
IA0KPiAJU2FtDQo=
