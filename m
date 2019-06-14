Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF945327
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C6B892A4;
	Fri, 14 Jun 2019 03:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67EE9892A4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:55:42 +0000 (UTC)
X-UUID: 0247b3bdad94423384cd99e839ad574f-20190614
X-UUID: 0247b3bdad94423384cd99e839ad574f-20190614
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2064053008; Fri, 14 Jun 2019 11:55:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 11:55:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 11:55:37 +0800
Message-ID: <1560484537.16718.14.camel@mtksdaap41>
Subject: Re: [PATCH v3, 15/27] drm/mediatek: add component OVL_2L1
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 14 Jun 2019 11:55:37 +0800
In-Reply-To: <1559734986-7379-16-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-16-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MiArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8y
TDEKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgMSArCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggODA5NDkyNi4uNWEwZWMwZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yNjgsNiAr
MjY4LDcgQEAgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7Cj4gIAlbRERQX0NPTVBPTkVOVF9P
VkwwXQk9IHsgTVRLX0RJU1BfT1ZMLAkwLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9PVkwx
XQk9IHsgTVRLX0RJU1BfT1ZMLAkxLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9PVkxfMkww
XQk9IHsgTVRLX0RJU1BfT1ZMXzJMLAkwLCBOVUxMIH0sCj4gKwlbRERQX0NPTVBPTkVOVF9PVkxf
MkwxXQk9IHsgTVRLX0RJU1BfT1ZMXzJMLAkxLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9Q
V00wXQk9IHsgTVRLX0RJU1BfUFdNLAkwLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9QV00x
XQk9IHsgTVRLX0RJU1BfUFdNLAkxLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9QV00yXQk9
IHsgTVRLX0RJU1BfUFdNLAkyLCBOVUxMIH0sCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5oCj4gaW5kZXggYTgxYzMyMi4uZDdlZjQ4MCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+IEBAIC02MCw2ICs2MCw3
IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiAgCUREUF9DT01QT05FTlRfT0QxLAo+ICAJRERQ
X0NPTVBPTkVOVF9PVkwwLAo+ICAJRERQX0NPTVBPTkVOVF9PVkxfMkwwLAo+ICsJRERQX0NPTVBP
TkVOVF9PVkxfMkwxLAo+ICAJRERQX0NPTVBPTkVOVF9PVkwxLAo+ICAJRERQX0NPTVBPTkVOVF9Q
V00wLAo+ICAJRERQX0NPTVBPTkVOVF9QV00xLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
