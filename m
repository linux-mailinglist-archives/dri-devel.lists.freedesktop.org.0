Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611754BC27
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D46E425;
	Wed, 19 Jun 2019 14:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737A38924C;
 Wed, 19 Jun 2019 10:27:30 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id B2E0F3E93E;
 Wed, 19 Jun 2019 10:27:28 +0000 (UTC)
Date: Wed, 19 Jun 2019 06:27:28 -0400
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org,
 robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Subject: Re: [PATCH v2 5/6] soc: qcom: add OCMEM driver
Message-ID: <20190619102728.GA894@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
 <20190619023209.10036-6-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619023209.10036-6-masneyb@onstation.org>
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560940049;
 bh=MOk9vBejJD3LU6pvBKkl0HAgBqxiYYl+m7zxPntItDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NHTEMx1GjbaN2+J57y71Lmw6cyCTUTc//Df/6nc1PdjAadKR4+knfGiGK8xtnYs30
 XDLg4JB15+XvEgUXz37mMkzC1zuBgI0BbRr1mVUZWdfg+iV3SafJuDg9hrxPnHTe+D
 imbxp7cXdi7boHKky3/3zJvkePfad63ao+kCLYe0=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MzI6MDhQTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+ICsrKyBiL2luY2x1ZGUvc29jL3Fjb20vb2NtZW0uaAo+IEBAIC0wLDAgKzEsNjIgQEAK
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ICsvKgo+ICsg
KiBUaGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSBhbGxvY2F0b3IgYWxsb3dzIHZhcmlvdXMgY2xp
ZW50cyB0byBhbGxvY2F0ZQo+ICsgKiBtZW1vcnkgZnJvbSBPQ01FTSBiYXNlZCBvbiBwZXJmb3Jt
YW5jZSwgbGF0ZW5jeSBhbmQgcG93ZXIgcmVxdWlyZW1lbnRzLgo+ICsgKiBUaGlzIGlzIHR5cGlj
YWxseSB1c2VkIGJ5IHRoZSBHUFUsIGNhbWVyYS92aWRlbywgYW5kIGF1ZGlvIGNvbXBvbmVudHMg
b24KPiArICogc29tZSBTbmFwZHJhZ29uIFNvQ3MuCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoQykg
MjAxOSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiArICogQ29weXJpZ2h0
IChDKSAyMDE1IFJlZCBIYXQuIEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29t
Pgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX19PQ01FTV9IX18KPiArI2RlZmluZSBfX09DTUVNX0hf
Xwo+ICsKPiArZW51bSBvY21lbV9jbGllbnQgewo+ICsJLyogR01FTSBjbGllbnRzICovCj4gKwlP
Q01FTV9HUkFQSElDUyA9IDB4MCwKPiArCS8qCj4gKwkgKiBUT0RPIGFkZCBtb3JlIG9uY2Ugb2Nt
ZW1fYWxsb2NhdGUoKSBpcyBjbGV2ZXIgZW5vdWdoIHRvCj4gKwkgKiBkZWFsIHdpdGggbXVsdGlw
bGUgY2xpZW50cy4KPiArCSAqLwo+ICsJT0NNRU1fQ0xJRU5UX01BWCwKPiArfTsKPiArCj4gK3N0
cnVjdCBvY21lbTsKPiArCj4gK3N0cnVjdCBvY21lbV9idWYgewo+ICsJdW5zaWduZWQgbG9uZyBv
ZmZzZXQ7Cj4gKwl1bnNpZ25lZCBsb25nIGFkZHI7Cj4gKwl1bnNpZ25lZCBsb25nIGxlbjsKPiAr
fTsKPiArCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19RQ09NX09DTUVNKQo+ICsKPiArc3RydWN0
IG9jbWVtICpvZl9nZXRfb2NtZW0oc3RydWN0IGRldmljZSAqZGV2KTsKPiArc3RydWN0IG9jbWVt
X2J1ZiAqb2NtZW1fYWxsb2NhdGUoc3RydWN0IG9jbWVtICpvY21lbSwgZW51bSBvY21lbV9jbGll
bnQgY2xpZW50LAo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gK3ZvaWQgb2NtZW1fZnJl
ZShzdHJ1Y3Qgb2NtZW0gKm9jbWVtLCBlbnVtIG9jbWVtX2NsaWVudCBjbGllbnQsCj4gKwkJc3Ry
dWN0IG9jbWVtX2J1ZiAqYnVmKTsKPiArCj4gKyNlbHNlIC8qIElTX0VOQUJMRUQoQ09ORklHX1FD
T01fT0NNRU0pICovCj4gKwo+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBvY21lbSAqb2ZfZ2V0X29j
bWVtKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJcmV0dXJuIE5VTEw7CgpUaGlzLCBhbG9u
ZyB3aXRoIG9jbWVtX2FsbG9jYXRlKCkgYmVsb3csIG5lZWQgdG8gcmV0dXJuIEVSUl9QVFIoLUVO
T1NZUykuCmFkcmVub19ncHVfb2NtZW1faW5pdCgpIG5lZWRzIHRvIGNoZWNrIGZvciB0aGlzIGVy
cm9yIGNvZGU6CgogICAgICAgIG9jbWVtID0gb2ZfZ2V0X29jbWVtKGRldik7CiAgICAgICAgaWYg
KElTX0VSUihvY21lbSkpIHsKICAgICAgICAgICAgICAgIGlmIChQVFJfRVJSKG9jbWVtKSA9PSAt
RU5YSU8gfHwgUFRSX0VSUihvY21lbSkgPT0gLUVOT1NZUykgewogICAgICAgICAgICAgICAgICAg
ICAgICAvKgogICAgICAgICAgICAgICAgICAgICAgICAgKiBSZXR1cm4gc3VjY2VzcyBzaW5jZSBl
aXRoZXIgdGhlIG9jbWVtIHByb3BlcnR5IHdhcwogICAgICAgICAgICAgICAgICAgICAgICAgKiBu
b3Qgc3BlY2lmaWVkIGluIGRldmljZSB0cmVlLCBvciBvY21lbSBzdXBwb3J0IGlzCiAgICAgICAg
ICAgICAgICAgICAgICAgICAqIG5vdCBjb21waWxlZCBpbnRvIHRoZSBrZXJuZWwuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKICAg
ICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihvY21lbSk7CiAg
ICAgICAgfQoKQnJpYW4KCgoKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBzdHJ1Y3Qgb2NtZW1f
YnVmICpvY21lbV9hbGxvY2F0ZShzdHJ1Y3Qgb2NtZW0gKm9jbWVtLAo+ICsJCQkJCSAgICAgICBl
bnVtIG9jbWVtX2NsaWVudCBjbGllbnQsCj4gKwkJCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6
ZSkKPiArewo+ICsJcmV0dXJuIE5VTEw7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBv
Y21lbV9mcmVlKHN0cnVjdCBvY21lbSAqb2NtZW0sIGVudW0gb2NtZW1fY2xpZW50IGNsaWVudCwK
PiArCQkJICAgICAgc3RydWN0IG9jbWVtX2J1ZiAqYnVmKQo+ICt7Cj4gK30KPiArCj4gKyNlbmRp
ZiAvKiBJU19FTkFCTEVEKENPTkZJR19RQ09NX09DTUVNKSAqLwo+ICsKPiArI2VuZGlmIC8qIF9f
T0NNRU1fSF9fICovCj4gLS0gCj4gMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
