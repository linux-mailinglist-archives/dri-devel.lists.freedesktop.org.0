Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766070AF5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 23:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8BF89DBC;
	Mon, 22 Jul 2019 21:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4B289DBC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 21:02:10 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so18229300pgb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jw/FU1q0pCTK1VPg2x0ZxM+ApR0mweZ/rozgAV4xcGw=;
 b=Qu3qjwGxaDRybBrRMbbIcHq5KkWCy26ktImwmqK/V6Yw5iBfvcwW6jSoruyAndsuwJ
 FDQr9MaZ/9H8WaIPz22y4GQt4NBdNYY59+quw6khlt3PuQOGiVT2yyy92DY6BkaBuLfF
 NPFpevlqMgqOAUIQ8kLzFZPW2RREtygI/wHLjq1zf4O9QwtJyeKnCWzHjKv0V8s1KJXk
 qtFAzzVVOwe35NBIqLYNWnk9Gjq4E05YO1F9tgdpaBWiKNhhnDLm11qfiAGTw9Fy/FML
 Aj9z++FR5jz8DUpqs05CWRtrZexg2yA5R5dAxapU/Ic5PGEvyHsAj8JVBG/g/YCjQQJ3
 IRbg==
X-Gm-Message-State: APjAAAU30FjCc5Ep3btN3qFTBiA4vB7DLdoN1tN0xf4Gy/rWzXFmpw0e
 674ZRK3cMnfgk3Jfcj3FHnZIpA==
X-Google-Smtp-Source: APXvYqy0JMbb9a5jvwtfwKxQgHi6wKafXmWjMEI2PVTyNSoG3byUvxY11OdyC+FTFjRAHNVX00OMaA==
X-Received: by 2002:a62:17d3:: with SMTP id 202mr2111016pfx.198.1563829329650; 
 Mon, 22 Jul 2019 14:02:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id j12sm31137923pff.4.2019.07.22.14.02.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 14:02:08 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:02:07 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190722210207.GZ250418@google.com>
References: <20190722181945.244395-1-mka@chromium.org>
 <20190722202426.GL104440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722202426.GL104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jw/FU1q0pCTK1VPg2x0ZxM+ApR0mweZ/rozgAV4xcGw=;
 b=KT2OjFf489hhPucfneku58TnKRsVBg+Jt6CDqvPVKCR4NuubivT2BmyRivFWO6rbbb
 Ac8IJLVNnfBmc506gjj/ssCkA4OXd6ZOPTSaarcwu62k8dqEhAPAasxmJJcx9MGQLB85
 QxbVuPV7lmscfJYgXuE4UyTsHwhG6cNqloosk=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDQ6MjQ6MjZQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDExOjE5OjQ1QU0gLTA3MDAsIE1hdHRoaWFzIEth
ZWhsY2tlIHdyb3RlOgo+ID4gVGhlIEREQy9DSSBwcm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEg
bXVsdGktYnl0ZSByZXF1ZXN0IHRvIHRoZQo+ID4gZGlzcGxheSB2aWEgSTJDLCB3aGljaCBpcyB0
eXBpY2FsbHkgZm9sbG93ZWQgYnkgYSBtdWx0aS1ieXRlCj4gPiByZXNwb25zZS4gVGhlIGludGVy
bmFsIEkyQyBjb250cm9sbGVyIG9ubHkgYWxsb3dzIHNpbmdsZSBieXRlCj4gPiByZWFkcy93cml0
ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90Cj4g
PiBzdXBwb3J0ZWQgd2hlbiB0aGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgaXMgdXNlZC4gVGhl
IEkyQwo+IAo+IFRoaXMgaXMgdmVyeSBsaWtlbHkgYSBzdHVwaWQgcXVlc3Rpb24sIGJ1dCBJIGRp
ZG4ndCBzZWUgYW4gYW5zd2VyIGZvciBpdCwgc28KPiBJJ2xsIGp1c3QgYXNrIDopCj4gCj4gSWYg
dGhlIGNvbnRyb2xsZXIgc3VwcG9ydHMgeGZlcnMgb2YgOCBieXRlcyBhbmQgMSBieXRlcywgY291
bGQgeW91IGp1c3Qgc3BsaXQKPiB1cCBhbnkgb2YgdGhlc2UgdHJhbnNhY3Rpb25zIGludG8gbGVu
LzgrbGVuJTggdHJhbnNhY3Rpb25zPwoKVGhlIGNvbnRyb2xsZXIgaW50ZXJwcmV0cyBhbGwgdHJh
bnNmZXJzIHRvIGJlIHJlZ2lzdGVyIGFjY2Vzc2VzLiBJdCBpcwpub3QgcG9zc2libGUgdG8ganVz
dCBzZW5kIHRoZSBzZXF1ZW5jZSAnMHgwYSAweDBiIDB4MGMnIGFzIHRocmVlIGJ5dGUKdHJhbnNm
ZXJzLCB0aGUgY29udHJvbGxlciBleHBlY3RzIGFuIGFkZHJlc3MgZm9yIGVhY2ggYnl0ZSBhbmQK
KHN1cHBvc2VkbHkpIHNlbmRzIGl0IG92ZXIgdGhlIHdpcmUsIHdoaWNoIHR5cGljYWxseSBpc24n
dCB3aGF0IHlvdQp3YW50LgoKQWxzbyB0aGUgOC1ieXRlIHJlYWRzIG9ubHkgc2VlbSB0byBiZSBz
dXBwb3J0ZWQgaW4gY2VydGFpbgpjb25maWd1cmF0aW9ucyAoIndoZW4gdGhlIERXQ19IRE1JX1RY
XzIwIHBhcmFtZXRlciBpcyBlbmFibGVkIikuCgo+ID4gdHJhbnNmZXJzIGNvbXBsZXRlIHdpdGhv
dXQgZXJyb3JzLCBob3dldmVyIHRoZSBkYXRhIGluIHRoZSByZXNwb25zZQo+ID4gaXMgZ2FyYmFn
ZS4gQWJvcnQgdHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChEREMpIHdpdGgK
PiA+IC1FT1BOT1RTVVBQLCB0byBtYWtlIGl0IGV2aWRlbnQgdGhhdCB0aGUgY29tbXVuaWNhdGlv
biBpcyBmYWlsaW5nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gY2hhbmdl
ZCBERENfSTJDX0FERFIgdG8gRERDX0NJX0FERFIKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgOCArKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMKPiA+IGluZGV4IDA0NWIxYjEzZmQwZS4uMjg5MzM2MjlmM2M3IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiBAQCAt
MzUsNiArMzUsNyBAQAo+ID4gIAo+ID4gICNpbmNsdWRlIDxtZWRpYS9jZWMtbm90aWZpZXIuaD4K
PiA+ICAKPiA+ICsjZGVmaW5lIEREQ19DSV9BRERSCQkweDM3Cj4gPiAgI2RlZmluZSBERENfU0VH
TUVOVF9BRERSCTB4MzAKPiA+ICAKPiA+ICAjZGVmaW5lIEhETUlfRURJRF9MRU4JCTUxMgo+ID4g
QEAgLTMyMiw2ICszMjMsMTMgQEAgc3RhdGljIGludCBkd19oZG1pX2kyY194ZmVyKHN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcCwKPiA+ICAJdTggYWRkciA9IG1zZ3NbMF0uYWRkcjsKPiA+ICAJaW50
IGksIHJldCA9IDA7Cj4gPiAgCj4gPiArCWlmIChhZGRyID09IEREQ19DSV9BRERSKQo+ID4gKwkJ
LyoKPiA+ICsJCSAqIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBkb2VzIG5vdCBzdXBwb3J0
IHRoZSBtdWx0aS1ieXRlCj4gPiArCQkgKiByZWFkIGFuZCB3cml0ZSBvcGVyYXRpb25zIG5lZWRl
ZCBmb3IgRERDL0NJLgo+ID4gKwkJICovCj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAr
Cj4gPiAgCWRldl9kYmcoaGRtaS0+ZGV2LCAieGZlcjogbnVtOiAlZCwgYWRkcjogJSN4XG4iLCBu
dW0sIGFkZHIpOwo+ID4gIAo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
