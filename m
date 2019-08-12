Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44E8E6C7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCDE6E8ED;
	Thu, 15 Aug 2019 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542B86E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:35:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q12so14147184wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bI/XNvST8XNcDi45EkijYU3OEXqnGirukbOk+hlTQLA=;
 b=KcxeGkSva/BcoobQt1v9FDxdXeUOWLHbhqEo2893tQd02IKNwGLV73EbrlfolHlaSV
 3jdoBbJzJcSh8u1OWtOq+D4OQzImf+zW1fVZysuBHNQq6+DzWNThWTq4Tc1j8qugzEfS
 wMU+JNBOdUffgJOzAuXmj3WiVP6cRB9vA0Nvbo6WP9XraquNQvpyam9pKfAR0JNJ9Nux
 rWspK2m6/rziZ0lqIY2PDPixUOgDVSUGlQXIpBhUzCT+Iixke4SfwRYlMmH5clNexXzw
 +AeElS95uDi0ZvBlsKoVnX9cMwbBz8JfLqAWBLB6lhknOYCBEUWzn66ICCtowUyHRWvF
 gzag==
X-Gm-Message-State: APjAAAUPTPIsQjj6erBiIJlQCDArdMl74CphkvY8++wijrpznJPTJWsa
 K3dLIHaw0oXTx+/GijihrE/l8g==
X-Google-Smtp-Source: APXvYqwcxXo5+Ieqa7x45x82mtMfFr5hiRSw/QjuF6zvGPfArN1YfCX/7LH4MHP/oMjJqqKPm3GOmw==
X-Received: by 2002:adf:f281:: with SMTP id k1mr40956211wro.154.1565613340871; 
 Mon, 12 Aug 2019 05:35:40 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm14914204wrm.52.2019.08.12.05.35.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:35:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
In-Reply-To: <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
 <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
Date: Mon, 12 Aug 2019 14:35:39 +0200
Message-ID: <1jo90uimsk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=bI/XNvST8XNcDi45EkijYU3OEXqnGirukbOk+hlTQLA=;
 b=ltoZPdDDIHtFi84wMSTH18qO2lGDQMLD8q+GOlpjwYklx43w44pX9RLkk/UEZFpp5n
 bC3GzphMPhB6+tvx7gw90L/wzbAvYXiJYpTKgP7bknRq8nKamLiU29/teVYUoULSOnXe
 xB07Udy9o+Ewk9kywDosNx9NasLrbCnySassqAWfxNE6NFMRO4BQiv20TcDX5FBVg+PZ
 brYqdp7nHkUCz/6c1yVQyh0SMQ0UtN2WJEO78ZnxD+4ybl6lF7VHgxG0G4mdmmjyC/GP
 7Ry/2trw/UXrHkHdoGEa+h6YHou2Lmn7FgyUbmvc62VUHNe4NltIs8wpjufZpOKRvo8v
 zbvA==
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uIDEyIEF1ZyAyMDE5IGF0IDE0OjE5LCBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+IHdyb3RlOgoKPiBIaSwKPgo+IE9uIDEyLzA4LzIwMTkgMTQ6MDcsIEplcm9t
ZSBCcnVuZXQgd3JvdGU6Cj4+IFRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gaW1w
cm92ZSB0aGUgc3VwcG9ydCBvZiB0aGUgaTJzCj4+IGludGVyZmFjZSBvZiB0aGUgc3lub3BzeXMg
aGRtaSBjb250cm9sbGVyLgo+PiAKPj4gT25jZSBhcHBsaWVkLCB0aGUgaW50ZXJmYWNlIHNob3Vs
ZCBzdXBwb3J0IGFsbCB0aGUgdXN1YWwgaTJzIGJ1cyBmb3JtYXRzLAo+PiA4IGNoYW5uZWxzIHBs
YXliYWNrIGFuZCBwcm9wZXJseSBzZXR1cCB0aGUgY2hhbm5lbCBudW1iZXIgYW5kIGFsbG9jYXRp
b24KPj4gaW4gdGhlIGluZm9mcmFtZXMuCj4+IAo+PiBBbHNvLCB0aGUgZHctaGRtaSBpMnMgaW50
ZXJmYWNlIHdpbGwgbm93IHByb3ZpZGUgdGhlIGVsZCB0byB0aGUgZ2VuZXJpYwo+PiBoZG1pLWNv
ZGVjIHNvIGl0IGNhbiBleHBvc2UgdGhlIHJlbGF0ZWQgY29udHJvbHMgdG8gdXNlciBzcGFjZS4K
Pj4gCj4+IFRoaXMgd29yayB3YXMgaW5zcGlyZWQgYnkgSm9uYXMgS2FybG1hbidzIHdvcmssIGF2
YWlsYWJsZSBoZXJlIFswXS4KPj4gCj4+IFRoaXMgd2FzIHRlc3RlZCB0aGUgQW1sb2dpYyBtZXNv
bi1nMTJhLXNlaTUxMCBwbGF0Zm9ybS4KPj4gRm9yIHRoaXMgc3BlY2lmaWMgcGxhdGZvcm0sIHdo
aWNoIHVzZXMgY29kZWMyY29kZWMgbGlua3MsIHRoZXJlIGlzIGEKPj4gcnVudGltZSBkZXBlbmRl
bmN5IGZvciBwYXRjaCA4IG9uIHRoaXMgQVNvQyBzZXJpZXMgWzFdLgo+PiAKPj4gQ2hhbmdlcyBz
aW5jZSB2MSBbMl06Cj4+ICAqIEZpeCBjb3B5IHNpemUgaW4gLmdldF9lbGQoKQo+PiAKPj4gWzBd
OiBodHRwczovL2dpdGh1Yi5jb20vS3dpYm9vL2xpbnV4LXJvY2tjaGlwL2NvbW1pdHMvcm9ja2No
aXAtNS4yLWZvci1saWJyZWVsZWMtdjUuMi4zCj4+IFsxXTogaHR0cHM6Ly9sa21sLmtlcm5lbC5v
cmcvci8yMDE5MDcyNTE2NTk0OS4yOTY5OS0xLWpicnVuZXRAYmF5bGlicmUuY29tCj4+IFsyXTog
aHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDgwNTEzNDEwMi4yNDE3My0xLWpicnVuZXRA
YmF5bGlicmUuY29tCj4+IAo+PiBKZXJvbWUgQnJ1bmV0ICg4KToKPj4gICBkcm0vYnJpZGdlOiBk
dy1oZG1pLWkyczogc3VwcG9ydCBtb3JlIGkycyBmb3JtYXQKPj4gICBkcm0vYnJpZGdlOiBkdy1o
ZG1pOiBtb3ZlIGF1ZGlvIGNoYW5uZWwgc2V0dXAgb3V0IG9mIGFoYgo+PiAgIGRybS9icmlkZ2U6
IGR3LWhkbWk6IHNldCBjaGFubmVsIGNvdW50IGluIHRoZSBpbmZvZnJhbWVzCj4+ICAgZHJtL2Jy
aWRnZTogZHctaGRtaS1pMnM6IGVuYWJsZSBscGNtIG11bHRpIGNoYW5uZWxzCj4+ICAgZHJtL2Jy
aWRnZTogZHctaGRtaS1pMnM6IHNldCB0aGUgY2hhbm5lbCBhbGxvY2F0aW9uCj4+ICAgZHJtL2Jy
aWRnZTogZHctaGRtaS1pMnM6IHJlc2V0IGF1ZGlvIGZpZm8gYmVmb3JlIGFwcGx5aW5nIG5ldyBw
YXJhbXMKPj4gICBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogZW5hYmxlIG9ubHkgdGhlIHJlcXVp
cmVkIGkycyBsYW5lcwo+PiAgIGRybS9icmlkZ2U6IGR3LWhkbWktaTJzOiBhZGQgLmdldF9lbGQg
c3VwcG9ydAo+Cj4gUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KPgo+IEpvbmFzLCBpcyBwYXRjaCA4IG9rIGZvciB5b3Ugbm93ID8gSWYgeWVzIEkn
bGwgYXBwbHkgdGhlbSB0bwo+IGRybS1taXNjLW5leHQuCgpQbGVhc2UgZG9uJ3QgISBJIGRpZCBu
b3QgcGljayB0aGUgcmlnaHQgY2hhbmdlIGFuZCB3aGF0IEkganVzdCBzZW50IGlzCmp1c3QgY3Jh
enksIGdpdmUgbWUgYSBzZWNvbmQgdG8gcmVzZW5kCgo+Cj4gTmVpbAo+Cj4+IAo+PiAgLi4uL2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1haGItYXVkaW8uYyAgIHwgMjAgKystLS0tLQo+PiAg
Li4uL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgIHwgIDEgKwo+PiAg
Li4uL2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgNjAgKysrKysr
KysrKysrKysrKystLQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMgICAgIHwgMzcgKysrKysrKysrKysrCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuaCAgICAgfCAxMyArKystCj4+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRt
aS5oICAgICAgICAgICAgICAgICAgfCAgMiArCj4+ICA2IGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNl
cnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
