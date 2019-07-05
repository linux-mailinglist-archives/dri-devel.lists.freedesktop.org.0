Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C293360AF7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 19:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD26A6E507;
	Fri,  5 Jul 2019 17:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F966E507
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 17:21:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5CCDD803B4;
 Fri,  5 Jul 2019 19:21:06 +0200 (CEST)
Date: Fri, 5 Jul 2019 19:20:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp
 LD-D5116Z01B panel
Message-ID: <20190705172058.GA2788@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=OJLUmJNqMcVkCySmTlIA:9 a=CjuIK1q_8ugA:10
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVmZnJleS4KClBhdGNoIGxvb2tzIGdvb2QsIGJ1dCB0aGVyZSBpcyBhIGZldyBmaWVsZHMg
dGhhdCBhcmUgbm90IGluaXRpYWxpemVkLgpEaWQgeW91IGZvcmdldCB0aGVtLCBvciBhcmUgdGhl
eSBub3QgbmVlZGVkPwoKT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6NTc6NTVBTSAtMDcwMCwg
SmVmZnJleSBIdWdvIHdyb3RlOgo+IFRoZSBTaGFycCBMRC1ENTExNlowMUIgaXMgYSAxMi4zIiBl
RFAgcGFuZWwgd2l0aCBhIDE5MjBYMTI4MCByZXNvbHV0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2ltcGxlLmMKPiBpbmRleCA1YTkzYzRlZGYxZTQuLmU2ZjU3ODY2NzMyNCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiBAQCAtMjM1NCw2ICsyMzU0
LDI5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzYW1zdW5nX2x0bjE0MGF0Mjlf
MzAxID0gewo+ICAJfSwKPiAgfTsKPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBzaGFycF9sZF9kNTExNnowMWJfbW9kZSA9IHsKPiArCS5jbG9jayA9IDE2ODQ4MCwK
PiArCS5oZGlzcGxheSA9IDE5MjAsCj4gKwkuaHN5bmNfc3RhcnQgPSAxOTIwICsgNDgsCj4gKwku
aHN5bmNfZW5kID0gMTkyMCArIDQ4ICsgMzIsCj4gKwkuaHRvdGFsID0gMTkyMCArIDQ4ICsgMzIg
KyA4MCwKPiArCS52ZGlzcGxheSA9IDEyODAsCj4gKwkudnN5bmNfc3RhcnQgPSAxMjgwICsgMywK
PiArCS52c3luY19lbmQgPSAxMjgwICsgMyArIDEwLAo+ICsJLnZ0b3RhbCA9IDEyODAgKyAzICsg
MTAgKyA1NywKPiArCS52cmVmcmVzaCA9IDYwLAo+ICt9OwpObyAuZmxhZ3M/IElzIGl0IG5vdCBu
ZWVkZWQgZm9yIGFuIGVEUCBwYW5lbD8KCj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVs
X2Rlc2Mgc2hhcnBfbGRfZDUxMTZ6MDFiID0gewo+ICsJLm1vZGVzID0gJnNoYXJwX2xkX2Q1MTE2
ejAxYl9tb2RlLAo+ICsJLm51bV9tb2RlcyA9IDEsCj4gKwkuYnBjID0gOCwKPiArCS5zaXplID0g
ewo+ICsJCS53aWR0aCA9IDI2MCwKPiArCQkuaGVpZ2h0ID0gMTIwLAo+ICsJfSwKPiArfTsKTm8g
LmJ1c19mb3JtYXQ/Ck5vIC5idXNfZmxhZ3M/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
