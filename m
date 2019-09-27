Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3EBFCBD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 03:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE106EE3B;
	Fri, 27 Sep 2019 01:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F2586EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 01:36:00 +0000 (UTC)
X-UUID: 5e1ccc7495624bca967c0db918d765e7-20190927
X-UUID: 5e1ccc7495624bca967c0db918d765e7-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1212430850; Fri, 27 Sep 2019 09:35:58 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 09:35:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 09:35:56 +0800
Message-ID: <1569548156.24127.8.camel@mtksdaap41>
Subject: Re: [PATCH v7 0/9] Support dsi for mt8183
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 27 Sep 2019 09:35:56 +0800
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 96B661CDA23811F28DDB1E62DDDC91320333D6BBD6AD6D5537737BB548B1DEDC2000:8
X-MTK: N
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
LTUuNSBbMV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9s
aW51eC5naXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sK
Ck9uIFRodSwgMjAxOS0wOS0xOSBhdCAxNDo1NyArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IENo
YW5nZXMgc2luY2UgdjY6Cj4gIC0gYWRkIGRwaHkgcmVzZXQgdG8gYXZvaWQgZHBoeSBmaWZvIGVy
cm9yIGFmdGVyIGxpbmVzIG51bWJlciBzZXR0aW5nCj4gIC0gc2VwYXJhdGUgZHNpIGNtZCByZWcg
c2V0dGluZyBmcm9tICJmaXhlcyBDTURRIHJlZyBhZGRyZXNzIG9mIG10ODE3Mwo+ICAgIGlzIGRp
ZmZlcmVudCB3aXRoIG10MjcwMSIKPiAKPiBDaGFuZ2VzIHNpbmNlIHY1Ogo+ICAtIGZpbmUgdHVu
ZSBkcGh5IHRpbWluZy4KPiAKPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ICAtIG1vdmUgbWlwaV9kc2lf
aG9zdF91bnJlZ2l0ZXIoKSB0byAucmVtb3ZlKCkKPiAgLSBmaW5lIHR1bmUgYWRkIGZyYW1lIHNp
emUgY29udHJvbCBjb2Rpbmcgc3R5bGUKPiAgLSBjaGFuZ2UgdGhlIGRhdGEgdHlwZSBvZiBkYXRh
X3JhdGUgYXMgdTMyLCBhbmQgYWRkIERJVl9ST1VORF9VUF9VTEwKPiAgLSB1c2UgZGl2X3U2NCB3
aGVuIDgwMDAwMDAwMDBVTEwgLyBkc2ktPmRhdGFfcmF0ZS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYz
Cj4gIC0gYWRkIG9uZSBtb3JlICd0YWInIGZvciBiaXR3aXNlIGRlZmluZS4KPiAgLSBhZGQgVGVz
dGVkLWJ5OiBSeWFuIENhc2UgPHJ5YW5kY2FzZUBjaHJvbWl1bS5vcmc+Cj4gCWFuZCBSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4uCj4gIC0gcmVtb3ZlIGNvbXBhcmUgZGFf
aHNfemVybyB0byBkYV9oc19wcmVwYXJlLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gY2hh
bmdlIHRoZSB2aWRlbyB0aW1pbmcgY2FsYyBtZXRob2QKPiAgLSBmaW5lIHRoZSBkc2kgYW5kIG1p
cGl0eCBpbml0IHNlcXVlbmNlCj4gIC0gZmluZSB0dW5lIGNvbW1pdCBtc2cKPiAKPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+ICAtIHNlcGFyYXRlIGZyYW1lIHNpemUgYW5kIHJlZyBjb21taXQgY29udHJv
bCBpbmRlcGVuZGVudCBwYXRjaGVzLgo+ICAtIGZpeCBzb21lIHJldHVybiB2YWx1ZXMgaW4gcHJv
YmUKPiAgLSByZW1vdmUgRFNJX0NNRFcwIGluICJDTURRIHJlZyBhZGRyZXNzIG9mIG10ODE3MyBp
cyBkaWZmZXJlbnQgd2l0aCBtdDI3MDEiIAo+IAo+IEppdGFvIFNoaSAoOSk6Cj4gICBkcm0vbWVk
aWF0ZWs6IG1vdmUgbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0byBwcm9iZQo+ICAgZHJtL21lZGlh
dGVrOiBmaXhlcyBDTURRIHJlZyBhZGRyZXNzIG9mIG10ODE3MyBpcyBkaWZmZXJlbnQgd2l0aAo+
ICAgICBtdDI3MDEKPiAgIGRybS9tZWRpYXRlazogcmVwbGFjZSB3cml0ZWIoKSB3aXRoIG10a19k
c2lfbWFzaygpCj4gICBkcm0vbWVkaWF0ZWs6IGFkZCBkc2kgcmVnIGNvbW1pdCBkaXNhYmxlIGNv
bnRyb2wKPiAgIGRybS9tZWRpYXRlazogYWRkIGZyYW1lIHNpemUgY29udHJvbAo+ICAgZHJtL21l
ZGlhdGVrOiBhZGQgbXQ4MTgzIGRzaSBkcml2ZXIgc3VwcG9ydAo+ICAgZHJtL21lZGlhdGVrOiBj
aGFuZ2UgdGhlIGRzaSBwaHl0aW1pbmcgY2FsY3VsYXRlIG1ldGhvZAo+ICAgZHJtOiBtZWRpYXRl
azogYWRqdXN0IGRzaSBhbmQgbWlwaV90eCBwcm9iZSBzZXF1ZW5jZQo+ICAgZHJtL21lZGlhdGVr
OiBhZGQgZHBoeSByZXNldCBhZnRlciBzZXR0aW5nIGxhbmVzIG51bWJlcgo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICB8IDIzMyArKysrKysrKysrKysrKysrKystLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
