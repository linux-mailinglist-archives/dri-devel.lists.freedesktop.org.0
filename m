Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F967A2FB5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90B16E26C;
	Fri, 30 Aug 2019 06:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C31D56E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:23:40 +0000 (UTC)
X-UUID: be59b7b98b384e11bbfdd4a7c4bf4645-20190830
X-UUID: be59b7b98b384e11bbfdd4a7c4bf4645-20190830
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1084025278; Fri, 30 Aug 2019 14:23:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:23:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:23:32 +0800
Message-ID: <1567146206.5942.17.camel@mtksdaap41>
Subject: Re: [PATCH v5, 26/32] drm/mediatek: add connection from RDMA0 to
 COLOR0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:23:26 +0800
In-Reply-To: <1567090254-15566-27-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-27-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 90CFDD7BE289D8F53A9415F306A9B989ED8B297FE8AD0D097BA97BD393BD3FD12000:8
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
IFJETUEwIHRvIENPTE9SMAoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8
IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggNDJhMTMwYS4uMDNhNDZlYyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTE3MSw2ICsxNzEs
OCBAQCBzdHJ1Y3QgbXRrX2RkcCB7Cj4gIAo+ICBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhIHsK
PiAgCXUzMiBvdmwwX21vdXRfZW47Cj4gKwl1MzIgcmRtYTBfc291dF9zZWxfaW47Cj4gKwl1MzIg
cmRtYTBfc291dF9jb2xvcjA7Cj4gIAl1MzIgcmRtYTFfc291dF9zZWxfaW47Cj4gIAl1MzIgcmRt
YTFfc291dF9kcGkwOwo+ICAJdTMyIGRwaTBfc2VsX2luOwo+IEBAIC00MjgsNiArNDMwLDkgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NvdXRfc2VsKGNvbnN0IHN0cnVjdCBtdGtfbW1z
eXNfcmVnX2RhdGEgKmRhdGEsCj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JE
TUEyICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kzKSB7Cj4gIAkJKmFkZHIgPSBESVNQX1JF
R19DT05GSUdfRElTUF9SRE1BMl9TT1VUOwo+ICAJCXZhbHVlID0gUkRNQTJfU09VVF9EU0kzOwo+
ICsJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09IEREUF9D
T01QT05FTlRfQ09MT1IwKSB7Cj4gKwkJKmFkZHIgPSBkYXRhLT5yZG1hMF9zb3V0X3NlbF9pbjsK
PiArCQl2YWx1ZSA9IGRhdGEtPnJkbWEwX3NvdXRfY29sb3IwOwo+ICAJfSBlbHNlIHsKPiAgCQl2
YWx1ZSA9IDA7Cj4gIAl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
