Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C655F65475
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 12:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E38A6E137;
	Thu, 11 Jul 2019 10:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC06E137
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 10:25:31 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so5243732edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 03:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=7U2G4EIDTohj4GLJBc1CsAdYb3Srm8+cHCV4KhEDuP0=;
 b=LbPUrHYfEQuj7KQWeYzIyJ0ar9zPP8PSRnoDDaqsq/Xv+oQ1YjSxrINeIw56JgOhmY
 HaP2WY2jBem2bP0DOsNYMkwYVlM1wYq7UACcmsYGzSpTSDOKzxmAZg9K3XkGGa4jTqSt
 c0Ax9WAAjRF1sJxEsn1uswwB/uEScnzVIAO13wyBpTvWtiPeiyYHevsgdWbL3QAUpHwc
 w4VIql873cvSQEBFG5HAGekWNSbZX5eB+8HJNPUucbDc0m7uDyT+O78y1XbmAvPsm6qA
 Xq8sIQBO2e4FLMRBTVzak8kUi38T27U2BNPH7/ck8PyzALCF9K8quyVSqv7k3ZaC1oyf
 QqEA==
X-Gm-Message-State: APjAAAULuYs+pLkziuJG3c/Gc3s3rObV2XkbarJHhcBJyR8b5AfhArgW
 stQMqVjPTFNAqPDAMBqlF78=
X-Google-Smtp-Source: APXvYqzOdFxx7QODvOuCnqI1mfdfr7m02Yx0mnJ15UPVOkEHhP7boRm7tJmqJjhEcUWKcHsDYq9N6A==
X-Received: by 2002:aa7:cd17:: with SMTP id b23mr2648368edw.278.1562840729665; 
 Thu, 11 Jul 2019 03:25:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y3sm1436461edr.27.2019.07.11.03.25.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 03:25:28 -0700 (PDT)
Date: Thu, 11 Jul 2019 12:25:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
Message-ID: <20190711102526.GK15868@phenom.ffwll.local>
Mail-Followup-To: Philippe CORNU <philippe.cornu@st.com>,
 Olivier MOYSAN <olivier.moysan@st.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "jsarha@ti.com" <jsarha@ti.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
 <20190710152720.GR15868@phenom.ffwll.local>
 <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7U2G4EIDTohj4GLJBc1CsAdYb3Srm8+cHCV4KhEDuP0=;
 b=WheCH8IDb1xLjYRkQ1wHhqBOQvwu9yadLjHXO+2GvTWatmnx3ohVHucMEFlWsb327e
 8oBL/JN3VnzQDpfznayYp5BYRXFtNz+qzfi7kDxf+viYPUc2s5/GMiZFA6C2e95tFaaH
 5eYJT5wwV5q1SpRg5tWMqZl9lM/DrKXjd8GJ4=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 Olivier MOYSAN <olivier.moysan@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "airlied@linux.ie" <airlied@linux.ie>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "jsarha@ti.com" <jsarha@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDk6Mjc6MzBBTSArMDAwMCwgUGhpbGlwcGUgQ09STlUg
d3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IAo+IE9uIDcvMTAvMTkgNToyNyBQTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDEyOjQxOjAzUE0gKzAwMDAs
IFBoaWxpcHBlIENPUk5VIHdyb3RlOgo+ID4+IEhpIE9saXZpZXIsCj4gPj4gYW5kIG1hbnkgdGhh
bmtzIGZvciB5b3VyIHBhdGNoLgo+ID4+IEdvb2QgdG8gaGF2ZSB0aGUgYXVkaW8gZ3JhcGggY2Fy
ZCBzdXBwb3J0LCBsb29rcyBvay4KPiA+PiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBo
aWxpcHBlLmNvcm51QHN0LmNvbT4KPiA+IAo+ID4gU2luY2UgeW91IGhhdmUgZHJtLW1pc2MgY29t
bWl0IHJpZ2h0cyBJJ20gYXNzdW1pbmcgeW91J3JlIGdvaW5nIHRvIHB1c2gKPiA+IHRoaXMgdG9v
LiBDb3JyZWN0Pwo+IAo+IFJlZ2FyZGluZyB0aGlzIHBhdGNoIGluIHBhcnRpY3VsYXIsIHRoZXJl
IGlzIHN0aWxsIG1pc3NpbmcgYW4gYWNrZWQtYnkgCj4gZnJvbSBhICJicmlkZ2UiIG1haW50YWlu
ZXIuIEFsc28gaXQgY291bGQgYmUgbmljZSB0byB3YWl0IGZvciB0aGUgCj4gcmV2aWV3ZWQtYnkg
ZnJvbSBKaXJ5IGFzIGl0IGtub3dzIHdlbGwgdGhpcyBzaWkgZHJpdmVyIGFuZCBzZW50IHJlY2Vu
dGx5IAo+IGdvb2QgcGF0Y2hlcyBvbiBpdCAoYWxyZWFkeSBtZXJnZWQpLgoKVGhlIGJyaWRnZSBt
YWludGFpbmVyIGlzIGxvb2tpbmcgZm9yIG5ldyBicmlkZ2UgbWFpbnRhaW5lcnMgKGF0bSB3ZSBo
YXZlCm9ubHkgb25lLCBkZWZhY3RvKSwgc28gZm9yIGJyaWRnZSBkcml2ZXIgcGF0Y2hlcyBJIHJl
YWxseSBkb24ndCB0aGluayBpdCdzCmEgZ29vZCBpZGVhIHRvIGdhdGUgb24gdGhhdCBzaW5nbGUg
Ym90dGxlLW5lY2suIEluZnJhc3RydWN0dXJlIGlzIGEgYml0IGEKZGlmZmVyZW50IHRoaW5nLgoK
PiBXaXRoIHRoYXQsIEJlbmphbWluIG9yIEkgKG9yIGEgYnJpZGdlIG1haW50YWluZXIpIGNhbiBw
dXNoIHRoaXMgcGF0Y2ggKyAKPiB0aGUgc2VyaWUgbmFtZWQgImRybS9icmlkZ2U6IHNpaTkwMng6
IGZpeCBhdWRpbyBtY2xrIG1hbmFnZW1lbnQiIGFzIEkgCj4gdGhpbmsgaXQgaXMgYmV0dGVyIHRv
IHB1c2ggdGhpcyBzZXJpZSAqYmVmb3JlKiB0aGlzIHBhdGNoLgoKV2FodGV2ZXIgeW91IGZlZWwg
bGlrZSwganVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIHlvdSdyZSBub3Qgc3R1Y2sKdHdpZGRsaW5n
IHRodW1icy4gVGhlIGVudGlyZSBwb2ludCBvZiBkcm0tbWlzYyBpcyB0byBmYWNpbGl0eSBtZXNo
IHJldmlldwphbmQgbWFpbnRhaW5lcnNoaXAsIGJlY2F1c2UgdGhlIHN0cmljdCBoaWVyYXJjaHkg
anVzdCBkb2Vzbid0IHdvcmsgZm9yCnNtYWxsZXIgdGhpbmdzLiBFeGFjdGx5IGJlY2F1c2UgeW91
J3JlIGFsd2F5cyBibG9ja2VkIG9uIGEgYm90dGxlbmVjawpzb21ld2hlcmUuCi1EYW5pZWwKCj4g
Cj4gVGhhbmtzLAo+IFBoaWxpcHBlIDotKQo+IAo+IAo+ID4+IFBoaWxpcHBlIDotKQo+ID4+Cj4g
Pj4gT24gNy8zLzE5IDEwOjA0IEFNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPiA+Pj4gSW1wbGVt
ZW50IGdldF9kYWlfaWQgY2FsbGJhY2sgb2YgYXVkaW8gSERNSSBjb2RlYwo+ID4+PiB0byBzdXBw
b3J0IEFTb0MgYXVkaW8gZ3JhcGggY2FyZC4KPiA+Pj4gSERNSSBhdWRpbyBvdXRwdXQgaGFzIHRv
IGJlIGNvbm5lY3RlZCB0byBzaWk5MDJ4IHBvcnQgMy4KPiA+Pj4gZ2V0X2RhaV9pZCBjYWxsYmFj
ayBtYXBzIHRoaXMgcG9ydCB0byBBU29DIERBSSBpbmRleCAwLgo+ID4+Pgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5Ac3QuY29tPgo+ID4+PiAtLS0K
PiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCAyMyArKysrKysrKysr
KysrKysrKysrKysrKwo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+
ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ID4+PiBpbmRleCBkZDdhYTQ2NmIy
ODAuLmRhZjllZjNjZDgxNyAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMKPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMK
PiA+Pj4gQEAgLTE1OCw2ICsxNTgsOCBAQAo+ID4+PiAgICAKPiA+Pj4gICAgI2RlZmluZSBTSUk5
MDJYX0kyQ19CVVNfQUNRVUlTSVRJT05fVElNRU9VVF9NUwk1MDAKPiA+Pj4gICAgCj4gPj4+ICsj
ZGVmaW5lIFNJSTkwMlhfQVVESU9fUE9SVF9JTkRFWAkJMwo+ID4+PiArCj4gPj4+ICAgIHN0cnVj
dCBzaWk5MDJ4IHsKPiA+Pj4gICAgCXN0cnVjdCBpMmNfY2xpZW50ICppMmM7Cj4gPj4+ICAgIAlz
dHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gPj4+IEBAIC02OTAsMTEgKzY5MiwzMiBAQCBzdGF0aWMg
aW50IHNpaTkwMnhfYXVkaW9fZ2V0X2VsZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
Cj4gPj4+ICAgIAlyZXR1cm4gMDsKPiA+Pj4gICAgfQo+ID4+PiAgICAKPiA+Pj4gK3N0YXRpYyBp
bnQgc2lpOTAyeF9hdWRpb19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29t
cG9uZW50LAo+ID4+PiArCQkJCSAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50KQo+ID4+
PiArewo+ID4+PiArCXN0cnVjdCBvZl9lbmRwb2ludCBvZl9lcDsKPiA+Pj4gKwlpbnQgcmV0Owo+
ID4+PiArCj4gPj4+ICsJcmV0ID0gb2ZfZ3JhcGhfcGFyc2VfZW5kcG9pbnQoZW5kcG9pbnQsICZv
Zl9lcCk7Cj4gPj4+ICsJaWYgKHJldCA8IDApCj4gPj4+ICsJCXJldHVybiByZXQ7Cj4gPj4+ICsK
PiA+Pj4gKwkvKgo+ID4+PiArCSAqIEhETUkgc291bmQgc2hvdWxkIGJlIGxvY2F0ZWQgYXQgcmVn
ID0gPDM+Cj4gPj4+ICsJICogUmV0dXJuIGV4cGVjdGVkIERBSSBpbmRleCAwLgo+ID4+PiArCSAq
Lwo+ID4+PiArCWlmIChvZl9lcC5wb3J0ID09IFNJSTkwMlhfQVVESU9fUE9SVF9JTkRFWCkKPiA+
Pj4gKwkJcmV0dXJuIDA7Cj4gPj4+ICsKPiA+Pj4gKwlyZXR1cm4gLUVJTlZBTDsKPiA+Pj4gK30K
PiA+Pj4gKwo+ID4+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29kZWNfb3BzIHNpaTkw
MnhfYXVkaW9fY29kZWNfb3BzID0gewo+ID4+PiAgICAJLmh3X3BhcmFtcyA9IHNpaTkwMnhfYXVk
aW9faHdfcGFyYW1zLAo+ID4+PiAgICAJLmF1ZGlvX3NodXRkb3duID0gc2lpOTAyeF9hdWRpb19z
aHV0ZG93biwKPiA+Pj4gICAgCS5kaWdpdGFsX211dGUgPSBzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxf
bXV0ZSwKPiA+Pj4gICAgCS5nZXRfZWxkID0gc2lpOTAyeF9hdWRpb19nZXRfZWxkLAo+ID4+PiAr
CS5nZXRfZGFpX2lkID0gc2lpOTAyeF9hdWRpb19nZXRfZGFpX2lkLAo+ID4+PiAgICB9Owo+ID4+
PiAgICAKPiA+Pj4gICAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0
IHNpaTkwMnggKnNpaTkwMngsCj4gPj4+Cj4gPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
