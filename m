Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650B2CD5F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B62D6E282;
	Tue, 28 May 2019 17:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F6489D2E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:51:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S9p58l053355;
 Tue, 28 May 2019 04:51:05 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S9p5Zg111430
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 04:51:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 04:51:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 04:51:04 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S9p1dU109124;
 Tue, 28 May 2019 04:51:01 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To: Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
From: Keerthy <j-keerthy@ti.com>
Message-ID: <00eb938e-00be-0601-8a60-9736fa5eeb5c@ti.com>
Date: Tue, 28 May 2019 15:21:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528093952.GM5447@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559037065;
 bh=PQt/Rzo/FGP3unzgA/uX2Tft86m2alMfQ36IpVx/LMk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vGhSdFa2YECyQm1z0I4zNBHdXJ9D5z/mma4thhaJvkLMF4zaPiAZynl5OEdXSyZht
 YIiF1Dif/7Dqu7JMKNsl8TS6NRa0l/xpDnqtCVTeNuyyySqG3zqzyJcGf0xGGS9MTT
 Z8jsuoAFCjehPvPcBeWMFSGLbwZ25/8kJgqbOEEo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyOC8wNS8xOSAzOjA5IFBNLCBUb255IExpbmRncmVuIHdyb3RlOgo+IEhpLAo+IAo+ICog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gWzE5MDUyOCAwOToxOV06Cj4+
IE9uIDI3LzA1LzIwMTkgMTQ6MjEsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cj4+Cj4+Pj4gTG9va3Mg
Z29vZCB0byBtZS4gRm9yIHNvbWUgcmVhc29uIEkgY2FuJ3QgYm9vdCA1LjItcmMyIChvbiB4MTUp
IHNvIEkgaGF2ZW4ndAo+Pj4+IGJlZW4gYWJsZSB0byB0ZXN0IHlldC4gSSdsbCBwaWNrIHRoZSBz
ZXJpZXMgdXAgaW4gYW55IGNhc2UsIGFuZCBJJ2xsIHRlc3QgaXQKPj4+PiB3aGVuIEkgZ2V0IHRo
ZSBrZXJuZWwgYm9vdGluZy4KPj4+Cj4+PiBHcmVhdCBnb29kIHRvIGhhdmUgdGhlc2UgbWVyZ2Vk
IGZpbmFsbHkgOikKPj4+Cj4+PiBIbW0gSSB3b25kZXIgaWYgc29tZSB4MTUgbW9kZWxzIGFyZSBh
ZmZlY3RlZCBieSB0aGUgU29DIHZhcmlhbnQKPj4+IGNoYW5nZXMgcXVldWVkIGluIG15IGZpeGVz
IGJyYW5jaD8KPj4KPj4gVGhpcyBpcyB3aGF0IEkgc2VlIHdpdGggZWFybHljb24sIG9uIGxpbnV4
LW9tYXAgZml4ZXMgYnJhbmNoLiBJIHRoaW5rIHRoaXMgbG9va3MKPj4gc2ltaWxhciB0byB3aGF0
IEkgc2F3IHdpdGggZHJhNzYgX3dpdGhvdXRfIHRoZSBmaXhlcy4KPiAKPiBPSyBzb3VuZHMgbGlr
ZSB3ZSBuZWVkIHRvIHVzZSBzb21lIGRpZmZlcmVudCBTb0Mgc3BlY2lmaWMgLmR0c2kgZmlsZSwK
PiBpcyB0aGlzIG1heWJlIHgxNSByZXYgYz8KPiAKPiBZb3UgY2FuIGRldGVjdCB3aGljaCBtb2R1
bGVzIGZhaWwgYmFzZWQgb24gdGhlIG1vZHVsZSBiYXNlIGFkZHJlc3MKPiBmb3IgcmV2aXNpb24g
cmVnaXN0ZXIgc2VlbiB3aXRoIHRoZSBmb2xsb3dpbmcgZGVidWcgcGF0Y2guIFRoZW4KPiB0aG9z
ZSBuZWVkIHRvIGJlIHRhZ2dlZCB3aXRoIHN0YXR1cyA9ICJkaXNhYmxlZCIgYXQgdGhlIG1vZHVs
ZQo+IGxldmVsIGluIHRoZSBTb0Mgc3BlY2lmaWMgZHRzaSBmaWxlLgoKClRvbWksCgpNeSBmaXJz
dCBzdXNwZWN0IHdvdWxkIGJlIHJ0Yy4KCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9h
bTU3MjguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNTcyOC5kdHNpCmluZGV4IDgyZTU0Mjdl
ZjZhOS4uMTdiMWIxYjRkYjkyIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTU3Mjgu
ZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTU3MjguZHRzaQpAQCAtMzEsMyArMzEsNyBA
QAogICZhdGxfdG0gewogICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwogIH07CisKKyZydGN0
YXJnZXQgeworICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cit9OwoKUmVnYXJkcywKS2VlcnRo
eQo+IAo+IFJlZ2FyZHMsCj4gCj4gVG9ueQo+IAo+IDg8IC0tLS0tLS0tLS0tLS0tCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYnVzL3RpLXN5c2MuYyBiL2RyaXZlcnMvYnVzL3RpLXN5c2MuYwo+IC0t
LSBhL2RyaXZlcnMvYnVzL3RpLXN5c2MuYwo+ICsrKyBiL2RyaXZlcnMvYnVzL3RpLXN5c2MuYwo+
IEBAIC0yMDY5LDYgKzIwNjksOCBAQCBzdGF0aWMgaW50IHN5c2NfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgIAlzdHJ1Y3Qgc3lzYyAqZGRhdGE7Cj4gICAJaW50IGVycm9y
Owo+ICAgCj4gKwlkZXZfaW5mbygmcGRldi0+ZGV2LCAicHJvYmluZyBkZXZpY2VcbiIpOwo+ICsK
PiAgIAlkZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmRkYXRhKSwgR0ZQ
X0tFUk5FTCk7Cj4gICAJaWYgKCFkZGF0YSkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
