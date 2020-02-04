Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F215190D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 11:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862D46E5AE;
	Tue,  4 Feb 2020 10:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2F16E5AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 10:56:56 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id dp13so8314992qvb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 02:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/oUsrvLxDIg2kRTkRIDa+3f0CNVdXlRSCLiuyEtYa9c=;
 b=QBN3hZRqRJfvXM7KsldzN/Y7UB9nRf6fT56y9YAkEYDPA55hGUnbTbep8I6bfTbsdW
 m9Pwoqx4QhXDeO4XtwYSVmDPrWsWQOAo19+2PH+U9Ib5ANtLC8DwrcskFIYSaLHRm45h
 wLNqkjMwYOrCgjqSaai4YcdjOhwatJxCFjhvu8E89Kxo754pXUvKWDfKHhQxIbcwKFzj
 h/dQt17+28/5KKynnLEiKf8IZ/OdCSCJJKD1FhhadNOwhLKCLtBsQjUOMyr5LS94Be9/
 jR+tIGVKEm8A36MijR7kSUYjISnBxK4tA4/iPgmJoWnNId1zmePgSeO4W49pCkgbszTL
 EAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/oUsrvLxDIg2kRTkRIDa+3f0CNVdXlRSCLiuyEtYa9c=;
 b=HXTy7c8YhJ/h+35eq4vhzupMumMlD4AcZeRllf/PJIRP6WQUG6SGlmVpp2swbG/nx9
 nP85Eukgh+v1q25WxRaVC+IiHmGX7G2ne54+3PwVT46VyOR0QAepWkkqdVK4RfGcnt+z
 qd4gB1aiu2SjbfusZ1lPrIaXFH3cM2jfIpYhEdWSUQgg5EvMRi8lFLRMl4lHWhYZn4Jg
 DwfOH/JWwnSFqot/qRruFW6tzbXazt+VhMsvfV8m5RO6aQEBm6qXMPvRsXc6cZVjYjdy
 YdPPngXAji3grsN6g+7aOVNItw2grYDJbKxaFVwNT7k8obY46ZODj0xrjlLck+OhAmKM
 dI1A==
X-Gm-Message-State: APjAAAXuJzOU6cXfGjptg4429KJSk1hlQu3QQ+Rlz0cANl2Yq+Qg3H3d
 Zn8fRJ0B8Ca7wcK0fmpkjwGcNJcTM6MoOEecqhe/5A==
X-Google-Smtp-Source: APXvYqwHoNsb4va0mzD8ErAs5TLzl8MOKBkFKNiQum74YciVvwTDMrSJ6Tqrk1Jak8OGeSAYlPULUa93UHza4xbn1YQ=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr25795609qvp.210.1580813815924; 
 Tue, 04 Feb 2020 02:56:55 -0800 (PST)
MIME-Version: 1.0
References: <1579528013-28445-1-git-send-email-yannick.fertre@st.com>
 <69cced11-c30a-da6c-0465-79b632901b62@st.com>
In-Reply-To: <69cced11-c30a-da6c-0465-79b632901b62@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:56:45 +0100
Message-ID: <CA+M3ks5dcQOcHAszgCP=XH5dQrO7OYqpHybeZOm2dXrLBeoJ+w@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: enable/disable depends on encoder
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

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjQ3LCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFyIFlhbm5pY2ssCj4gVGhhbmsgeW91IGZv
ciB5b3VyIHBhdGNoLAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+Cj4KPiBQaGlsaXBwZSA6LSkKPgo+IE9uIDEvMjAvMjAgMjo0NiBQTSwgWWFubmlj
ayBGZXJ0cmUgd3JvdGU6Cj4gPiBGcm9tOiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJl
QHN0LmNvbT4KPiA+Cj4gPiBXaGVuIGNvbm5lY3RlZCB0byBhIGRzaSBob3N0LCB0aGUgbHRkYyBk
aXNwbGF5IGNvbnRyb2xsZXIKPiA+IG11c3Qgc2VuZCBmcmFtZXMgb25seSBhZnRlciB0aGUgZW5k
IG9mIHRoZSBkc2kgcGFuZWwKPiA+IGluaXRpYWxpemF0aW9uIHRvIGF2b2lkIGVycm9ycyB3aGVu
IHRoZSBkc2kgaG9zdCBzZW5kcwo+ID4gY29tbWFuZHMgdG8gdGhlIGRzaSBwYW5lbCAoZHNpIHB4
IGZpZm8gZnVsbCkuCj4gPiBUbyBhdm9pZCB0aGlzIGlzc3VlLCB0aGUgZGlzcGxheSBjb250cm9s
bGVyIG11c3QgYmUKPiA+IGVuYWJsZWQvZGlzYWJsZWQgd2hlbiB0aGUgZW5jb2RlciBpcyBlbmFi
bGVkL2Rpc2FibGVkLgo+ID4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KClRoYW5rcwpCZW5q
YW1pbgoKPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVA
c3QuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMTQgKysr
KysrKystLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gaW5kZXggNzE5ZGZjNS4uOWVmMTI1ZCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTQzNyw5ICs0MzcsNiBAQCBzdGF0aWMgdm9p
ZCBsdGRjX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiAgICAg
ICAvKiBDb21taXQgc2hhZG93IHJlZ2lzdGVycyA9IHVwZGF0ZSBwbGFuZXMgYXQgbmV4dCB2Ymxh
bmsgKi8KPiA+ICAgICAgIHJlZ19zZXQobGRldi0+cmVncywgTFREQ19TUkNSLCBTUkNSX1ZCUik7
Cj4gPgo+ID4gLSAgICAgLyogRW5hYmxlIExUREMgKi8KPiA+IC0gICAgIHJlZ19zZXQobGRldi0+
cmVncywgTFREQ19HQ1IsIEdDUl9MVERDRU4pOwo+ID4gLQo+ID4gICAgICAgZHJtX2NydGNfdmJs
YW5rX29uKGNydGMpOwo+ID4gICB9Cj4gPgo+ID4gQEAgLTQ1Myw5ICs0NTAsNiBAQCBzdGF0aWMg
dm9pZCBsdGRjX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4K
PiA+ICAgICAgIGRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7Cj4gPgo+ID4gLSAgICAgLyogZGlz
YWJsZSBMVERDICovCj4gPiAtICAgICByZWdfY2xlYXIobGRldi0+cmVncywgTFREQ19HQ1IsIEdD
Ul9MVERDRU4pOwo+ID4gLQo+ID4gICAgICAgLyogZGlzYWJsZSBJUlEgKi8KPiA+ICAgICAgIHJl
Z19jbGVhcihsZGV2LT5yZWdzLCBMVERDX0lFUiwgSUVSX1JSSUUgfCBJRVJfRlVJRSB8IElFUl9U
RVJSSUUpOwo+ID4KPiA+IEBAIC0xMDU4LDkgKzEwNTIsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZW5jb2Rlcl9mdW5jcyBsdGRjX2VuY29kZXJfZnVuY3MgPSB7Cj4gPiAgIHN0YXRpYyB2
b2lkIGx0ZGNfZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+
ICAgewo+ID4gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4g
PiArICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKPiA+
Cj4gPiAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+ID4KPiA+ICsgICAgIC8qIERpc2Fi
bGUgTFREQyAqLwo+ID4gKyAgICAgcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1Jf
TFREQ0VOKTsKPiA+ICsKPiA+ICAgICAgIC8qIFNldCB0byBzbGVlcCBzdGF0ZSB0aGUgcGluY3Ry
bCB3aGF0ZXZlciB0eXBlIG9mIGVuY29kZXIgKi8KPiA+ICAgICAgIHBpbmN0cmxfcG1fc2VsZWN0
X3NsZWVwX3N0YXRlKGRkZXYtPmRldik7Cj4gPiAgIH0KPiA+IEBAIC0xMDY4LDYgKzEwNjYsNyBA
QCBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpCj4gPiAgIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
diA9IGVuY29kZXItPmRldjsKPiA+ICsgICAgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRk
ZXYtPmRldl9wcml2YXRlOwo+ID4KPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4g
Pgo+ID4gQEAgLTEwNzgsNiArMTA3Nyw5IEBAIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFi
bGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+ID4gICAgICAgICovCj4gPiAgICAgICBp
ZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBJKQo+ID4gICAg
ICAgICAgICAgICBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRkZXYtPmRldik7Cj4g
PiArCj4gPiArICAgICAvKiBFbmFibGUgTFREQyAqLwo+ID4gKyAgICAgcmVnX3NldChsZGV2LT5y
ZWdzLCBMVERDX0dDUiwgR0NSX0xURENFTik7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVu
Y3MgPSB7Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
