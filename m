Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B58111B97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 23:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2F6F422;
	Tue,  3 Dec 2019 22:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359F36E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 22:22:36 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z124so2271222pgb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 14:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WUFFntsV9GWQxH2xEiMtMGTiHEnUItioA0CI190kL8o=;
 b=pjtHaG+0zDcHMBa+j+p5822+UK6VTHA81rfq+9nXy9HqqNJOjqaa1fqLkADcZalEPt
 RQsEunoOLBJy0wD73MlNv5VuapNy38doCOZfbnpWfM4DCTXcG9212P9oNEPH5MvXPQAz
 MYIyHz6Nh+XJHYmhknJ9/L2ZsUXhqL/xnwUqjhql/Y0UsRlbrgLfT6nI4f7i9V1aWzvb
 anY4l/a+a1FXFl+/kT5GAHU+VLxglq9hGUAMJTJ4+3b5cHGqDcWBkprQV6KsrpB4BQLT
 6xu5tAukhWcjXLxLCARCC7x73n5zdn37ENCx0YbpeB5L67koJbXmjHB3H4eg/erlm7v6
 Er7g==
X-Gm-Message-State: APjAAAU4f3VFv1Swdt0vj8WU1Oy8zE3/vMcP0Rqz6YgWux5uCDaH4vv3
 JnY6YfVaHMJkj5ZOFSZPhUQiag==
X-Google-Smtp-Source: APXvYqyWX3GXr5G09PtL3d5pS+d902L2fj13z6zE3hBT0ixPruP16jvHAkG9yTWgiA2y8zHopTszAw==
X-Received: by 2002:a65:5c0a:: with SMTP id u10mr7846832pgr.258.1575411755669; 
 Tue, 03 Dec 2019 14:22:35 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id l9sm4444155pgh.34.2019.12.03.14.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 14:22:35 -0800 (PST)
Date: Tue, 3 Dec 2019 14:22:32 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180
 soc
Message-ID: <20191203222232.GG228856@google.com>
References: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WUFFntsV9GWQxH2xEiMtMGTiHEnUItioA0CI190kL8o=;
 b=bn3QlKL7vQGhK8lGFIzeXVQeOlnmkW/WGjIxexoPzjAeijuRHQXjl0M/udzBuAI6cW
 QCaVRG5f/+Ls5qE8X9irTu+6QP+a9IvZ+SYeA7nmk9Pe4nU1ZBCK1MHX2YPQCvIseMS3
 iiHYDyWjBtXGx+TKbfqCahbY+bU12y33YOblo=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAxMjozNTowNVBNICswNTMwLCBIYXJpZ292aW5k
YW4gUCB3cm90ZToKPiBDaGFuZ2VzIGluIHYxOgo+IAktTW9kaWZ5IGNvbW1pdCB0ZXh0IHRvIGlu
ZGljYXRlIERTSSB2ZXJzaW9uIGFuZCBTT0MgZGV0YWlsKEplZmZyZXkgSHVnbykuCj4gCS1TcGxp
dHRpbmcgdmlzaW9ub3ggcGFuZWwgZHJpdmVyIGNvZGUgb3V0IGludG8gYQo+IAkgZGlmZmVyZW50
IHBhdGNoKHNldCksIHNpbmNlIHBhbmVsIGRyaXZlcnMgYXJlIG1lcmdlZCBpbnRvCj4gCSBkcm0t
bmV4dCB2aWEgYSBkaWZmZXJlbnQgdHJlZShSb2IgQ2xhcmspLgoKVGhlIGNoYW5nZSBsb2cgc2hv
dWxkbid0IGJlIHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCBwbGVhc2UgcGxhY2UgaXQKYWZ0
ZXIgdGhlICctLS0nIHNlcGFyYXRvci4KCkkgdGhpbmsgYXQgbGVhc3QgYSBvbmUgbGluZSBjb21t
aXQgbWVzc2FnZSBiZXNpZGVzIHRoZSBzdWJqZWN0IGlzCm1hbmRhdG9yeSwgc28gaWYgeW91IG1v
dmUgdGhlIGNoYW5nZSBsb2cgZG93biB5b3UnbGwgaGF2ZSB0byBhZGQKc29tZSBzaG9ydCBzdW1t
YXJ5LgoKPiBTaWduZWQtb2ZmLWJ5OiBIYXJpZ292aW5kYW4gUCA8aGFyaWdvdmlAY29kZWF1cm9y
YS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmgg
fCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfY2ZnLmMKPiBpbmRleCBiN2I3YzFhLi43Yjk2N2RkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHNpL2RzaV9jZmcuYwo+IEBAIC0xMzMsNiArMTMzLDEwIEBAIHN0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgZHNpX3NkbTg0NV9idXNfY2xrX25hbWVzW10gPSB7Cj4gIAkiaWZhY2UiLCAi
YnVzIiwKPiAgfTsKPiAgCj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZHNpX3NjNzE4MF9i
dXNfY2xrX25hbWVzW10gPSB7Cj4gKwkiaWZhY2UiLCAiYnVzIiwKPiArfTsKPiArCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9jZmcgPSB7Cj4gIAkuaW9f
b2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKPiAgCS5yZWdfY2ZnID0gewo+IEBAIC0xNDcsNiAr
MTUxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9j
ZmcgPSB7Cj4gIAkubnVtX2RzaSA9IDIsCj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG1zbV9kc2lfY29uZmlnIHNjNzE4MF9kc2lfY2ZnID0gewo+ICsJLmlvX29mZnNldCA9IERTSV82
R19SRUdfU0hJRlQsCj4gKwkucmVnX2NmZyA9IHsKPiArCQkubnVtID0gMSwKPiArCQkucmVncyA9
IHsKPiArCQkJeyJ2ZGRhIiwgMjE4MDAsIDQgfSwJLyogMS4yIFYgKi8KPiArCQl9LAo+ICsJfSwK
PiArCS5idXNfY2xrX25hbWVzID0gZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzLAo+ICsJLm51bV9i
dXNfY2xrcyA9IEFSUkFZX1NJWkUoZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzKSwKPiArCS5pb19z
dGFydCA9IHsgMHhhZTk0MDAwIH0sCj4gKwkubnVtX2RzaSA9IDEsCj4gK307Cj4gKwo+ICBjb25z
dCBzdGF0aWMgc3RydWN0IG1zbV9kc2lfaG9zdF9jZmdfb3BzIG1zbV9kc2lfdjJfaG9zdF9vcHMg
PSB7Cj4gIAkubGlua19jbGtfZW5hYmxlID0gZHNpX2xpbmtfY2xrX2VuYWJsZV92MiwKPiAgCS5s
aW5rX2Nsa19kaXNhYmxlID0gZHNpX2xpbmtfY2xrX2Rpc2FibGVfdjIsCj4gQEAgLTIwMSw2ICsy
MTksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgZHNpX2NmZ19o
YW5kbGVyc1tdID0gewo+ICAJCSZtc204OTk4X2RzaV9jZmcsICZtc21fZHNpXzZnX3YyX2hvc3Rf
b3BzfSwKPiAgCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJf
Ml8xLAo+ICAJCSZzZG04NDVfZHNpX2NmZywgJm1zbV9kc2lfNmdfdjJfaG9zdF9vcHN9LAo+ICsJ
e01TTV9EU0lfVkVSX01BSk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl80XzEsCj4gKwkJ
JnNjNzE4MF9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29wc30sCj4gKwo+ICB9Owo+ICAK
PiAgY29uc3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgKm1zbV9kc2lfY2ZnX2dldCh1MzIg
bWFqb3IsIHUzMiBtaW5vcikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2NmZy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCj4gaW5kZXggZTJi
N2E3ZC4uOTkxOTUzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lf
Y2ZnLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmgKPiBAQCAtMTks
NiArMTksNyBAQAo+ICAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YxXzRfMQkweDEwMDQw
MDAxCj4gICNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJfMl8wCTB4MjAwMDAwMDAKPiAg
I2RlZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl8yXzEJMHgyMDAyMDAwMQo+ICsjZGVmaW5l
IE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzRfMQkweDIwMDQwMDAxCj4gIAo+ICAjZGVmaW5lIE1T
TV9EU0lfVjJfVkVSX01JTk9SXzgwNjQJMHgwCj4gIAo+IC0tIAo+IDIuNy40Cj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
