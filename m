Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4DA2FCD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7A6E280;
	Fri, 30 Aug 2019 06:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABC2F6E280
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:25:36 +0000 (UTC)
X-UUID: 59d948ae0e16412ebff2a44e0df5220c-20190830
X-UUID: 59d948ae0e16412ebff2a44e0df5220c-20190830
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1358243706; Fri, 30 Aug 2019 14:25:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:25:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:25:35 +0800
Message-ID: <1567146329.5942.18.camel@mtksdaap41>
Subject: Re: [PATCH v5, 27/32] drm/mediatek: add connection from RDMA1 to DSI0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:25:29 +0800
In-Reply-To: <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F2F3D7BC5A4F670280F7D4277302E6A46330E9FB3DE1CA6135116014A39081C2000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IFJETUExIHRvIERTSTAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggMDNhNDZlYy4uYWE2MTczYiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTE3NSw2ICsxNzUsNyBA
QCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhIHsKPiAgCXUzMiByZG1hMF9zb3V0X2NvbG9yMDsK
PiAgCXUzMiByZG1hMV9zb3V0X3NlbF9pbjsKPiAgCXUzMiByZG1hMV9zb3V0X2RwaTA7Cj4gKwl1
MzIgcmRtYTFfc291dF9kc2kwOwo+ICAJdTMyIGRwaTBfc2VsX2luOwo+ICAJdTMyIGRwaTBfc2Vs
X2luX3JkbWExOwo+ICAJdTMyIGRzaTBfc2VsX2luOwo+IEBAIC00MzMsNiArNDM0LDkgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NvdXRfc2VsKGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNf
cmVnX2RhdGEgKmRhdGEsCj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEw
ICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9DT0xPUjApIHsKPiAgCQkqYWRkciA9IGRhdGEtPnJk
bWEwX3NvdXRfc2VsX2luOwo+ICAJCXZhbHVlID0gZGF0YS0+cmRtYTBfc291dF9jb2xvcjA7Cj4g
Kwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUExICYmIG5leHQgPT0gRERQX0NP
TVBPTkVOVF9EU0kwKSB7Cj4gKwkJKmFkZHIgPSBkYXRhLT5yZG1hMV9zb3V0X3NlbF9pbjsKPiAr
CQl2YWx1ZSA9IGRhdGEtPnJkbWExX3NvdXRfZHNpMDsKPiAgCX0gZWxzZSB7Cj4gIAkJdmFsdWUg
PSAwOwo+ICAJfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
