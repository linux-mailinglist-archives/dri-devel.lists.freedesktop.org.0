Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE18391181
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 09:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F76EC21;
	Wed, 26 May 2021 07:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Wed, 26 May 2021 07:49:21 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA17D6EC21
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1622014457; x=1624606457;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZiC0o82iNqxh+a9Sg/LstfcHK8M5jFd72acQEvq3y4=;
 b=Nvgu//o941FxDg8PckXgr99WD/plb8zu97w0KtaYgcv1npup6n8EV4Px3377ldoR
 i73IIpW95d5S4GS8xFPzJYEBWaqe4uE0gN33moRkUWe9ipYZPODty1SRZUFPxhD0
 6vTXqPrB4YSMMjm+KkIBdqYiOtSnCzOGAW6Y8655Pw8=;
X-AuditID: c39127d2-e89bd70000001c67-68-60adf9f9712d
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 5F.D5.07271.9F9FDA06;
 Wed, 26 May 2021 09:34:17 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 26 May
 2021 09:34:17 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009; 
 Wed, 26 May 2021 09:34:17 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Topic: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Thread-Index: AQHXMdf+y0dS36bcQE6gcAvYiVq17ar1fdqA
Date: Wed, 26 May 2021 07:34:17 +0000
Message-ID: <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
In-Reply-To: <20210415091616.53415-1-s.riedmueller@phytec.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D9959056898F34DA341EAA1918CBCA1@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsWyRoChVPfnz7UJBu/6jS16z51ksvi/bSKz
 xZWv79ksLu+aw2ax4udWRoufu+axOLB57P22gMVj56y77B7bvz1g9bjffZzJY8m0q2wenzfJ
 BbBFcdmkpOZklqUW6dslcGUsOfWBtWAVV8Wqd/dYGxg7uLoYOTkkBEwkJh34wtTFyMUhJLCc
 SeLOr4PMEM5DRokPa2dAZTYxSuw7c5EdpIVNwEXic9s3NpCEiMAGRomHu/ewgjjMAh2MEqe3
 vAWrEhZIlLh86CsLiC0ikCQx9eFjVgjbSGLKvfuMIDaLgKrEp3cXwWp4BdwkZt9fChYXErCR
 +DdxLzOIzSlgK9H2Zi1YnFFAVqKz4R0TiM0sIC6x6dl3VognBCSW7DnPDGGLSrx8/A8qriDR
 1tMJVM8BVK8psX6XPkSrhcSHN1sYIWxFiSndD9khThCUODnzCcsERvFZSDbMQuiehaR7FpLu
 WUi6FzCyrmIUys1Mzk4tyszWK8ioLElN1ktJ3cQIjN3DE9Uv7WDsm+NxiJGJg/EQowQHs5II
 78HmtQlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YWpBbBZJk4OKUaGPXe
 /sxVKWT69YNfZ/kX/g6l8jtvtI0+zknSfvlJ/qlomtOCVdvulKe0N5ko3utZdEr6eyCz4OvH
 zIdDDz9eXbhoyW3dF9we3ppfJC8mv5Faf3Drc5U7XUsUm+oemu4+UXbmy5LF/EuP+51fUXtY
 Z+bKExvD5PQn5cv/W71wXdGFVclXz67pvqSnxFKckWioxVxUnAgAZHdZhcsCAAA=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCmdlbnRsZSBwaW5nIGZvciB0aGlzIHNtYWxsIHNlcmllcy4NCg0KUmVnYXJkcywNClN0
ZWZhbg0KDQpPbiBUaHUsIDIwMjEtMDQtMTUgYXQgMTE6MTYgKzAyMDAsIFN0ZWZhbiBSaWVkbXVl
bGxlciB3cm90ZToNCj4gVGhlIEFVTyBHMTA0U04wMiBWMiBpcyBhbiBMVkRTIGRpc3BsYXkgd2hp
Y2ggc3VwcG9ydHMgNiBhbmQgOCBicGMgUFNXRy4NCj4gQWRkIHRoZSBjb3JyZXNwb25kaW5nIGNv
bm5lY3RvciB0eXBlIGFuZCA4IGJwYyBhcyBkZWZhdWx0IGJ1c19mb3JtYXQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIgKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMNCj4gaW5kZXggNGUyZGFkMzE0Yzc5Li40NDU4M2QwZWQ5MDIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gQEAgLTEwOTgsNiArMTA5
OCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fZzEwNHNuMDIgPSB7DQo+
ICAJCS53aWR0aCA9IDIxMSwNCj4gIAkJLmhlaWdodCA9IDE1OCwNCj4gIAl9LA0KPiArCS5idXNf
Zm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRywNCj4gKwkuY29ubmVjdG9y
X3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fZzEyMWVhbjAxX21vZGUgPSB7DQo=
