Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D6127B1A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 13:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DBC6EC21;
	Fri, 20 Dec 2019 12:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D923A6E41D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:34:10 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id x1so3528309qvr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OM+8DC58J3a1Ql31mcDf8DJoUej0i6n4zpuo/9t+noM=;
 b=Teeb0IyvGBgEsXC2FUlY9Jj8vaOWfLiTgSTFn2BvkRD5ZneA6TfW521uY8dyShqNmq
 kOrZnE+CrofE8hYE9gtEigmbo/3NSu3GYRTZNnzSoUB9+/tSxfmdSEHJxy3dI/yV3r+w
 vxzYMowRH3yiGAp0vJIs36MzTdgudugCMcS6nHxqNdW1vUuBSFmqQPHDx4cSYSwBiKUL
 qD+p6esS0BXk8YMffgOC9OfbCjl/Jxzhy3qS8oI9xO14xBxICze1vSxaMMqSiNQrdVBo
 GW3Y7L6dPSEg+7bQrFzoPg11otBGNXUy7zqWY991NzHmvUPAPRmmXS/JV4BqMFBM6ueF
 8itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OM+8DC58J3a1Ql31mcDf8DJoUej0i6n4zpuo/9t+noM=;
 b=KD+N2rGiO4PG5x6vGVmdHOS1x/4DwMOjxJjo/V6VsqqedjnVuW/kjOfi2W0sPQKlho
 t/idV0+byBDtaTzVoUy9ZbkHzavUQFYCBTlwllFdOYraayO+L3Gj+ZzdDGizJqgwhUMU
 Q35Lo9//AuFRYeXkJWBvMLpq7QJ485biIma65zttUzf+/s2/I4bxa5A+08eS00kmAWw4
 nOF6UHVdf6ESi8+18hYcTaVYHpxEZtV0PGcKX+3Rxe5CvO4yR3DpB3eu6shNOPLDQZR1
 c94UdjoAvQPJhdqigPX72y4STsQJ4kZO4oQJCtsHi6aXvRMkMbdwiCE3XPXDddRB/Du3
 bXhA==
X-Gm-Message-State: APjAAAXGhftkNGr4RT8Elu8Ia73Tz+IFtQOkzTWnFkxOMDcck1+T2cte
 aPVOo1B7/TV5lk1zzwBkMK4KozR1QeMTijtLmMSSTNaP
X-Google-Smtp-Source: APXvYqyKI5y4pA6tV7V4WabZMrtDehFiaFukF68PpW0zRcn+eFsKt3hAK4ZqwXgE6QO/xNOP1AtOUW3XIb6X2q62uSg=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr11501073qvp.210.1576845250032; 
 Fri, 20 Dec 2019 04:34:10 -0800 (PST)
MIME-Version: 1.0
References: <1574850218-13257-1-git-send-email-yannick.fertre@st.com>
 <90e15f5b-0b65-1de7-229d-c8e0470071b5@st.com>
In-Reply-To: <90e15f5b-0b65-1de7-229d-c8e0470071b5@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 20 Dec 2019 13:33:59 +0100
Message-ID: <CA+M3ks663uFr-fpTXoKXd--yKi6q4o525H-eYM9ZsO4dpFS6yg@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: move pinctrl to encoder mode set
To: Philippe CORNU <philippe.cornu@st.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuLiAyIGTDqWMuIDIwMTkgw6AgMTg6MTksIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IERlYXIgWWFubmljaywKPiBUaGFuayB5b3UgZm9y
IHlvdXIgcGF0Y2gsCj4KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4KPgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LAoKVGhhbmtzLApCZW5qYW1pbgoK
PiBQaGlsaXBwZSA6LSkKPgo+IE9uIDExLzI3LzE5IDExOjIzIEFNLCBZYW5uaWNrIEZlcnRyZSB3
cm90ZToKPiA+IEZyb206IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgo+
ID4KPiA+IFRoZSBwaW4gY29udHJvbCBtdXN0IGJlIHNldCB0byBkZWZhdWx0IGFzIHNvb24gYXMg
cG9zc2libGUgdG8KPiA+IGVzdGFibGlzaCBhIGdvb2QgdmlkZW8gbGluayBiZXR3ZWVuIHR2ICYg
YnJpZGdlIGhkbWkKPiA+IChlbmNvZGVyIG1vZGUgc2V0IGlzIGNhbGwgYmVmb3JlIGVuY29kZXIg
ZW5hYmxlKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5m
ZXJ0cmVAc3QuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwg
MjQgKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBpbmRleCA0
OWVmNDA2Li5kYmE4ZTdmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiBAQCAtNDM1LDkgKzQz
NSw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKPiA+ICAgICAgIC8qIENvbW1pdCBzaGFkb3cgcmVnaXN0ZXJzID0gdXBkYXRlIHBs
YW5lcyBhdCBuZXh0IHZibGFuayAqLwo+ID4gICAgICAgcmVnX3NldChsZGV2LT5yZWdzLCBMVERD
X1NSQ1IsIFNSQ1JfVkJSKTsKPiA+Cj4gPiAtICAgICAvKiBFbmFibGUgTFREQyAqLwo+ID4gLSAg
ICAgcmVnX3NldChsZGV2LT5yZWdzLCBMVERDX0dDUiwgR0NSX0xURENFTik7Cj4gPiAtCj4gPiAg
ICAgICBkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7Cj4gPiAgIH0KPiA+Cj4gPiBAQCAtNDUxLDkg
KzQ0OCw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCj4gPgo+ID4gICAgICAgZHJtX2NydGNfdmJsYW5rX29mZihjcnRjKTsKPiA+
Cj4gPiAtICAgICAvKiBkaXNhYmxlIExUREMgKi8KPiA+IC0gICAgIHJlZ19jbGVhcihsZGV2LT5y
ZWdzLCBMVERDX0dDUiwgR0NSX0xURENFTik7Cj4gPiAtCj4gPiAgICAgICAvKiBkaXNhYmxlIElS
USAqLwo+ID4gICAgICAgcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfUlJJRSB8
IElFUl9GVUlFIHwgSUVSX1RFUlJJRSk7Cj4gPgo+ID4gQEAgLTEwNDIsOSArMTAzNiwxMyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGx0ZGNfZW5jb2Rlcl9mdW5jcyA9
IHsKPiA+ICAgc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX2Rpc2FibGUoc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9
IGVuY29kZXItPmRldjsKPiA+ICsgICAgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYt
PmRldl9wcml2YXRlOwo+ID4KPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4gPgo+
ID4gKyAgICAgLyogRGlzYWJsZSBMVERDICovCj4gPiArICAgICByZWdfY2xlYXIobGRldi0+cmVn
cywgTFREQ19HQ1IsIEdDUl9MVERDRU4pOwo+ID4gKwo+ID4gICAgICAgLyogU2V0IHRvIHNsZWVw
IHN0YXRlIHRoZSBwaW5jdHJsIHdoYXRldmVyIHR5cGUgb2YgZW5jb2RlciAqLwo+ID4gICAgICAg
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKPiA+ICAgfQo+ID4gQEAg
LTEwNTIsNiArMTA1MCwxOSBAQCBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gPiAgIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9l
bmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiA9IGVuY29kZXItPmRldjsKPiA+ICsgICAgIHN0cnVjdCBsdGRj
X2RldmljZSAqbGRldiA9IGRkZXYtPmRldl9wcml2YXRlOwo+ID4gKwo+ID4gKyAgICAgRFJNX0RF
QlVHX0RSSVZFUigiXG4iKTsKPiA+ICsKPiA+ICsgICAgIC8qIEVuYWJsZSBMVERDICovCj4gPiAr
ICAgICByZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsKPiA+ICt9Cj4g
PiArCj4gPiArc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX21vZGVfc2V0KHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQo+ID4gK3sKPiA+ICsg
ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZW5jb2Rlci0+ZGV2Owo+ID4KPiA+ICAgICAg
IERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4gPgo+ID4gQEAgLTEwNjcsNiArMTA3OCw3IEBAIHN0
YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBsdGRj
X2VuY29kZXJfaGVscGVyX2Z1bmNzID0gewo+ID4gICAgICAgLmRpc2FibGUgPSBsdGRjX2VuY29k
ZXJfZGlzYWJsZSwKPiA+ICAgICAgIC5lbmFibGUgPSBsdGRjX2VuY29kZXJfZW5hYmxlLAo+ID4g
KyAgICAgLm1vZGVfc2V0ID0gbHRkY19lbmNvZGVyX21vZGVfc2V0LAo+ID4gICB9Owo+ID4KPiA+
ICAgc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwg
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
