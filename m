Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B431B8A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9822A89E2C;
	Mon, 13 May 2019 14:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969B89E2C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:41:22 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id r3so14963306qtp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AShDMcr6wP0O8DE+n5XbgpPJ5YloQ1/JdOPbCC8lARw=;
 b=fWJ1kAycX2kAuBDe/xPS2kAr41pGRtYTBLhrGdX9kRR+pqP84POyb2/jLb8fxZsCqx
 vENvGHf4yGIO0fIaDyYkpz03zjPIjSaiylbWZANqOCy3uwiTGs/dVGjtA+NALxua/A1N
 26B1HMZbysdDwZu8ygEssear00hSXhp0EC6jd+070cl5rwK8Xi/hi203FqAZQ1lN8X8A
 mutgDaLkKPQKp4vsgj/0eD5+v/1oVnc11PnJkdrhPC1drm4Hq2KlKMpTIFms4DjTeK5N
 PDc8ZhEYgSm8QwOZnL/CG8lvewrCEQYFnDBDlN26xNe9QryZS2nClPOvHq6vBprFuHRz
 PtGw==
X-Gm-Message-State: APjAAAX5jeQBCRwcCm0ykmJdUv4CJlvNwM0XNBqPBNIagOr0BqdEzlIB
 YNT046nSd/Ki0X8n4rE2jyCSYg==
X-Google-Smtp-Source: APXvYqykNJUXhSJgZA6vtUnxVCZWGlTPm+rCJaK1kqlt7UHvDAJRFjnm1qlB5I6AjuDJ8LtM1pVexg==
X-Received: by 2002:ac8:3783:: with SMTP id d3mr21972886qtc.293.1557758481560; 
 Mon, 13 May 2019 07:41:21 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id o13sm6206257qtk.74.2019.05.13.07.41.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:41:20 -0700 (PDT)
Date: Mon, 13 May 2019 10:41:20 -0400
From: Sean Paul <sean@poorly.run>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/6] drm/rockchip: Change the scl_vop_cal_scl_fac to
 pass drm_format_info
Message-ID: <20190513144120.GM17077@art_vandelay>
References: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1557486447.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1557486447.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AShDMcr6wP0O8DE+n5XbgpPJ5YloQ1/JdOPbCC8lARw=;
 b=HkidcekKkBXgGOaNW72+pYp8w3VZS3ih8WWwPsmB/Ibu7CJs0yJAhBlEFyDteU5jD/
 Ggoo0PZceRDrjWt0tLEYlbjYfSwyLT/alA67azusGTnakoNEqljeQPvLgsR43eR/k0dJ
 hwQmGG4VdAGyHf6aGGvjhRmlPABjRvfA6qAmlY9QItuPNCGFEr0UGOx/SSuGMYaybjsX
 e0RiJqx4nfZ+qUZeMz3KOL5ByyauTWA7X+lGpDwcVJ9iLMZEUAkVpM/syZlwxcrDStH7
 3skFGnmq4XK5+6Jen+ktCVShwScLwsTp4uTSYT2sHTgh977o1y9tYN49jpYxV07QkqTx
 VMng==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDE6MDg6NDZQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBUaGUgUm9ja2NoaXAgVk9QIGRyaXZlciBoYXMgYSBmdW5jdGlvbiwgc2NsX3ZvcF9j
YWxfc2NsX2ZhYywgdGhhdCB3aWxsCj4gbG9va3VwIHRoZSBkcm1fZm9ybWF0X2luZm8gc3RydWN0
dXJlIGZyb20gdGhlIGZvdXJjYyBwYXNzZWQgdG8gaXQgYnkgaXRzCj4gY2FsbGVyLgo+IAo+IEhv
d2V2ZXIsIGl0cyBvbmx5IGNhbGxlciBhbHJlYWR5IGRlcmVmZW5jZXMgdGhlIGRybV9mb3JtYXRf
aW5mbyBzdHJ1Y3R1cmUKPiBpdCBoYXMgYWNjZXNzIHRvIHRvIHJldHJpZXZlIHRoYXQgZm91cmNj
LiBDaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGF0Cj4gZnVuY3Rpb24gdG8gcGFzcyB0aGUgZHJt
X2Zvcm1hdF9pbmZvIHN0cnVjdHVyZSBkaXJlY3RseSwgcmVtb3ZpbmcgdGhlIG5lZWQKPiBmb3Ig
YW4gZXh0cmEgbG9va3VwLgo+IAo+IFN1Z2dlc3RlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJl
bEBwZW5ndXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
YyB8IDExICsrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcC5jCj4gaW5kZXggMjBhOWMyOTZkMDI3Li45YzBkNmIzNjc3MDkgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiBAQCAtMzE1LDE0ICszMTUs
MTMgQEAgc3RhdGljIHVpbnQxNl90IHNjbF92b3BfY2FsX3NjYWxlKGVudW0gc2NhbGVfbW9kZSBt
b2RlLCB1aW50MzJfdCBzcmMsCj4gIAo+ICBzdGF0aWMgdm9pZCBzY2xfdm9wX2NhbF9zY2xfZmFj
KHN0cnVjdCB2b3AgKnZvcCwgY29uc3Qgc3RydWN0IHZvcF93aW5fZGF0YSAqd2luLAo+ICAJCQkg
ICAgIHVpbnQzMl90IHNyY193LCB1aW50MzJfdCBzcmNfaCwgdWludDMyX3QgZHN0X3csCj4gLQkJ
CSAgICAgdWludDMyX3QgZHN0X2gsIHVpbnQzMl90IHBpeGVsX2Zvcm1hdCkKPiArCQkJICAgICB1
aW50MzJfdCBkc3RfaCwgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbykKPiAgewo+
ICAJdWludDE2X3QgeXJnYl9ob3Jfc2NsX21vZGUsIHlyZ2JfdmVyX3NjbF9tb2RlOwo+ICAJdWlu
dDE2X3QgY2Jjcl9ob3Jfc2NsX21vZGUgPSBTQ0FMRV9OT05FOwo+ICAJdWludDE2X3QgY2Jjcl92
ZXJfc2NsX21vZGUgPSBTQ0FMRV9OT05FOwo+IC0JaW50IGhzdWIgPSBkcm1fZm9ybWF0X2hvcnpf
Y2hyb21hX3N1YnNhbXBsaW5nKHBpeGVsX2Zvcm1hdCk7Cj4gLQlpbnQgdnN1YiA9IGRybV9mb3Jt
YXRfdmVydF9jaHJvbWFfc3Vic2FtcGxpbmcocGl4ZWxfZm9ybWF0KTsKPiAtCWNvbnN0IHN0cnVj
dCBkcm1fZm9ybWF0X2luZm8gKmluZm87Cj4gKwlpbnQgaHN1YiA9IGRybV9mb3JtYXRfaG9yel9j
aHJvbWFfc3Vic2FtcGxpbmcoaW5mby0+Zm9ybWF0KTsKPiArCWludCB2c3ViID0gZHJtX2Zvcm1h
dF92ZXJ0X2Nocm9tYV9zdWJzYW1wbGluZyhpbmZvLT5mb3JtYXQpOwo+ICAJYm9vbCBpc195dXYg
PSBmYWxzZTsKPiAgCXVpbnQxNl90IGNiY3Jfc3JjX3cgPSBzcmNfdyAvIGhzdWI7Cj4gIAl1aW50
MTZfdCBjYmNyX3NyY19oID0gc3JjX2ggLyB2c3ViOwo+IEBAIC0zMzEsOCArMzMwLDYgQEAgc3Rh
dGljIHZvaWQgc2NsX3ZvcF9jYWxfc2NsX2ZhYyhzdHJ1Y3Qgdm9wICp2b3AsIGNvbnN0IHN0cnVj
dCB2b3Bfd2luX2RhdGEgKndpbiwKPiAgCXVpbnQzMl90IHZhbDsKPiAgCWludCB2c2tpcGxpbmVz
Owo+ICAKPiAtCWluZm8gPSBkcm1fZm9ybWF0X2luZm8ocGl4ZWxfZm9ybWF0KTsKPiAtCj4gIAlp
ZiAoaW5mby0+aXNfeXV2KQo+ICAJCWlzX3l1diA9IHRydWU7Cj4gIAo+IEBAIC04NTYsNyArODUz
LDcgQEAgc3RhdGljIHZvaWQgdm9wX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmUsCj4gIAlpZiAod2luLT5waHktPnNjbCkKPiAgCQlzY2xfdm9wX2NhbF9zY2xfZmFj
KHZvcCwgd2luLCBhY3R1YWxfdywgYWN0dWFsX2gsCj4gIAkJCQkgICAgZHJtX3JlY3Rfd2lkdGgo
ZGVzdCksIGRybV9yZWN0X2hlaWdodChkZXN0KSwKPiAtCQkJCSAgICBmYi0+Zm9ybWF0LT5mb3Jt
YXQpOwo+ICsJCQkJICAgIGZiLT5mb3JtYXQpOwo+ICAKPiAgCVZPUF9XSU5fU0VUKHZvcCwgd2lu
LCBhY3RfaW5mbywgYWN0X2luZm8pOwo+ICAJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGRzcF9pbmZv
LCBkc3BfaW5mbyk7Cj4gCj4gYmFzZS1jb21taXQ6IGE4MDIzMDM5MzRiM2JkNGRmNmUyZmM4YmYy
ZTRlYmNlZDFjMzc1NTYKPiAtLSAKPiBnaXQtc2VyaWVzIDAuOS4xCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
