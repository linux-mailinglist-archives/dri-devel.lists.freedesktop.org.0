Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC063B5A94
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E734F6E2EF;
	Mon, 28 Jun 2021 08:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Mon, 28 Jun 2021 08:42:31 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2066E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624868847; x=1627460847;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbN59BDoyCxbK2z73YbVaHq8eKmFB6AcBl1RBQvtgvw=;
 b=jVK1jal+m5yc62e46iBir2J4jovsRBuD16zSCLz/m20qBvpyvYTDXnFw2msXPNOp
 eYUIAAboHBpybnnSUzhaS933G/9F1vRAtIHhZ9PIvPy4esn22mdUqoUn3j7hZJl5
 StGbpxgBoeW8jpzAl8vFx31LRZmtxo/dmbQTN/xnoOw=;
X-AuditID: c39127d2-a77bc70000001c5e-af-60d987ef564d
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id CD.BB.07262.FE789D06;
 Mon, 28 Jun 2021 10:27:27 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 28 Jun
 2021 10:27:27 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009; 
 Mon, 28 Jun 2021 10:27:27 +0200
From: Yunus Bas <Y.Bas@phytec.de>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add support for EDT
 ETM0350G0DH6 panel
Thread-Topic: [PATCH v2 2/2] drm/panel: simple: Add support for EDT
 ETM0350G0DH6 panel
Thread-Index: AQHXa/dt9W3ZVjAU7kWb0UZyILNcFw==
Date: Mon, 28 Jun 2021 08:27:27 +0000
Message-ID: <ad9d186062abc3c02f7094cd57159e5af4fdda7b.camel@phytec.de>
In-Reply-To: <20210331180757.463479-2-y.bas@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8881F6EC22E9A4A81B2D37325B8C6C0@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42JZI8BQqvu+/WaCwa5Tmha9504yWVz5+p7N
 YsXPrYwWP3fNY3Fg8dg56y67x/ZvD1g97ncfZ/JYMu0qWwBLFJdNSmpOZllqkb5dAlfGmQnf
 WQse8VbcnnGHuYFxC28XIweHhICJxPMN0l2MXBxCAsuZJDY3P2eCcB4yShx9OZsdwtnEKPH6
 ykRGkA42AUWJK7fyQeIiAhcYJdbNPQnUwckhLBAuce/Zb2YQW0QgQuJJWxMThK0nMeHQH0YQ
 m0VAVaK7az+YzSvgJnFkwwswm1PATOLs+69gvYwCshIbNpwHs5kFxCU2PfvOCmJLCAhILNkD
 EZcQEJV4+fgfVFxBoq2nkwnkNmYBTYn1u/QhWi0kLvatZ4WwFSWmdD9kh1grKHFy5hOWCYyi
 s5BsmIXQPQtJ9ywk3bOQdC9gZF3FKJSbmZydWpSZrVeQUVmSmqyXkrqJERhfhyeqX9rB2DfH
 4xAjEwfjIUYJDmYlEV6xqmsJQrwpiZVVqUX58UWlOanFhxilOViUxHk38JaECQmkJ5akZqem
 FqQWwWSZODilGhhnTb925RZHmjaLUp3L6c9PX0yZb/85bMHzgJUGl+e4TU9gixM3apt09Pmm
 utBp+fEtGpnLPZYX7lwbfyps713my6qhwXHGnB8qLq5NPXnj4MF/RnY+hbFZFxnFvhn8f/2T
 93P2Az+PieXNt0y6gtX571zYWr5ybdyFM7VKpbfZHXgsTho/DN6oxFKckWioxVxUnAgAbATJ
 HJ0CAAA=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkuIFRoaXMgcGF0Y2ggaGFzIGJlZW4gd2FpdGluZyBpbiB0aGUgbGlzdCBmb3IgcXVpdGUgc29t
ZSB0aW1lIG5vdy4NCkNhbiBzb21lb25lIHJldmlldyB0aGlzIHBhdGNoPw0KDQpTYW1lIGdvZXMg
Zm9yIHRoZSBmb2xsb3dpbmc6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAy
MTAzMzExODA3NTcuNDYzNDc5LTEteS5iYXNAcGh5dGVjLmRlLw0KDQpUaGUgY29ycmVzcG9uZGlu
ZyBkdC1iaW5kaW5ncyBhcmUgYWxyZWFkeSBhY2tlZCBieSBSb2IgSGVycmluZzoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyMTA0MDkxNDI2NTIuR0EzNTk5OTQ0
QHJvYmguYXQua2VybmVsLm9yZy8NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmlj
ZXRyZWUvMjAyMTA0MDkxNDI2MjYuR0EzNTk5MzQ0QHJvYmguYXQua2VybmVsLm9yZy8NCg0KVGhh
bmtzIGluIGFkdmFuY2UuDQoNClJlZ2FyZHMsDQpZdW51cyBCYXMNCg0KLS0gDQpNaXQgZnJldW5k
bGljaGVuIEdyw7zDn2VuDQpZdW51cyBCYXMNCg0KLVNvZnR3YXJlIEVuZ2luZWVyLQ0KUEhZVEVD
IE1lc3N0ZWNobmlrIEdtYkgNClJvYmVydC1Lb2NoLVN0ci4gMzkNCjU1MTI5IE1haW56DQpHZXJt
YW55DQpUZWwuOiArNDkgKDApNjEzMSA5MjIxLSA0NjYNCldlYjogd3d3LnBoeXRlYy5kZQ0KDQpT
aWUgZmluZGVuIHVucyBhdWNoIGF1ZjogRmFjZWJvb2ssIExpbmtlZEluLCBYaW5nLCBZb3VUdWJl
DQoNClBIWVRFQyBNZXNzdGVjaG5payBHbWJIIHwgUm9iZXJ0LUtvY2gtU3RyLiAzOSB8IDU1MTI5
IE1haW56LCBHZXJtYW55DQpHZXNjaMOkZnRzZsO8aHJlcjogRGlwbC4tSW5nLiBNaWNoYWVsIE1p
dGV6a2ksIERpcGwuLUluZy4gQm9kbyBIdWJlciB8DQpIYW5kZWxzcmVnaXN0ZXIgTWFpbnogSFJC
IDQ2NTYgfCBGaW5hbnphbXQgTWFpbnogfCBTdC5Oci4gMjY2NTAwNjA4LCBERQ0KMTQ5MDU5ODU1
DQpUaGlzIEUtTWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZv
cm1hdGlvbi4gSWYgeW91DQphcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgKG9yIGhhdmUg
cmVjZWl2ZWQgdGhpcyBFLU1haWwgaW4gZXJyb3IpDQpwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
aW1tZWRpYXRlbHkgYW5kIGRlc3Ryb3kgdGhpcyBFLU1haWwuIEFueQ0KdW5hdXRob3JpemVkIGNv
cHlpbmcsIGRpc2Nsb3N1cmUgb3IgZGlzdHJpYnV0aW9uIG9mIHRoZSBtYXRlcmlhbCBpbg0KdGhp
cyBFLU1haWwgaXMgc3RyaWN0bHkgZm9yYmlkZGVuLg0K
