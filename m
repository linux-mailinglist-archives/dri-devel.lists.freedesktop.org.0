Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA604C8456
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EC810E287;
	Tue,  1 Mar 2022 06:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE17710E287
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 06:48:52 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-122-WdwIAktFNf2mPBI1Zr5aEQ-1; Tue, 01 Mar 2022 06:48:50 +0000
X-MC-Unique: WdwIAktFNf2mPBI1Zr5aEQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 06:48:49 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 1 Mar 2022 06:48:49 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Abhinav Kumar' <quic_abhinavk@quicinc.com>, Johannes Berg
 <johannes@sipsolutions.net>, Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Thread-Topic: [PATCH] devcoredump: increase the device delete timeout to 10
 mins
Thread-Index: AQHYLOuC8GeBLyfvf0C5oMN+SX9icKyqFqUw
Date: Tue, 1 Mar 2022 06:48:49 +0000
Message-ID: <8fa2f879e33e4e42b76e21c6fbdcb023@AcuMS.aculab.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
 <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
 <2add9ba7-7bc8-bd1d-1963-61e8154b0e3c@quicinc.com>
 <989efb15-cc5e-8f6d-c313-118f01498e33@quicinc.com>
In-Reply-To: <989efb15-cc5e-8f6d-c313-118f01498e33@quicinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: "rafael@kernel.org" <rafael@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "khsieh@codeaurora.org" <khsieh@codeaurora.org>,
 "nganji@codeaurora.org" <nganji@codeaurora.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "aravindh@codeaurora.org" <aravindh@codeaurora.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWJoaW5hdiBLdW1hcg0KPiBTZW50OiAyOCBGZWJydWFyeSAyMDIyIDIxOjM4DQouLi4N
Cj4gV2UgYWxzbyBkaWQgc29tZSBwcm9maWxpbmcgYXJvdW5kIGhvdyBtdWNoIGluY3JlYXNpbmcg
dGhlIGJsb2NrIHNpemUNCj4gaGVscHMgYW5kIGhlcmUgaXMgdGhlIGRhdGE6DQo+IA0KPiBCbG9j
ayBzaXplCWNvc3QNCj4gDQo+IDRLQgkgICAgICAgIDIyOXMNCj4gOEtCCSAgICAgICAgIDg2cw0K
DQpZb3UgbXVzdCBoYXZlIGFuIE8obl4yKSBvcGVyYXRpb24gaW4gdGhlcmUgLSBmaW5kIGl0Lg0K
DQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQs
IE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86
IDEzOTczODYgKFdhbGVzKQ0K

