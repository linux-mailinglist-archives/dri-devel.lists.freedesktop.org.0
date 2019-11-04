Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E12EDB82
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 10:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033506E1E9;
	Mon,  4 Nov 2019 09:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249D66E1F3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 09:18:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o28so16086496wro.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 01:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=C+mdmjB1CD0aIAaCvI1wabUYWE3wtxx37hk22n4aNLo=;
 b=koW6mQh63JLzMcIJXs5mWCOG/yu3CidL306ifHLozAWMSQCxsKKuXfJ8WapKX+ErV5
 EOsrbUPcvc3hpjOI2uY0gv1nfVYwQNuC9BI7PEO+n6d7/4S+96Re+r1SnNuR2JIhB83T
 GMn/dtUQpdh4wlyOB478r3qPwU0jzBEHZV2BQrSqS6w9BqzLm2Kxtr8+rWWSseOUKnmx
 2IE3DTGd7p2Mq/CqoYe7IfMGQaG3OAnw5nFbla5P6BHWXttMnEF4Oo2QohoNqSEoBoTb
 qXaLmj6wFHz5DeHsJULRN6X9j4g10Uh5fzpnOHr4NuHMhyWaoUBGBcZNp9ibZOMqiK3R
 zNzw==
X-Gm-Message-State: APjAAAVlxs+3tE0VQ1bk3Ay83jfYURBpuJA1mRIIdsRWvbS9rDqKkcIp
 Legx9NmRFtbORntZMf1nykvtAQ==
X-Google-Smtp-Source: APXvYqzePKswQ02ooYmSqlUvPJhSOsMR3Xt1hJdqDDdvKa+Emp7Tt5iHz2Qs0ea6EKI6OBqrn8tjdA==
X-Received: by 2002:adf:f686:: with SMTP id v6mr23662458wrp.141.1572859096576; 
 Mon, 04 Nov 2019 01:18:16 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l18sm20727728wrn.48.2019.11.04.01.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 01:18:15 -0800 (PST)
Date: Mon, 4 Nov 2019 10:18:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
Message-ID: <20191104091808.GA10326@phenom.ffwll.local>
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031214839.27039-1-manasi.d.navare@intel.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=C+mdmjB1CD0aIAaCvI1wabUYWE3wtxx37hk22n4aNLo=;
 b=MskO4hLLiykfJ1GUVPikzV3WaBIH5QVT+4tlb7mZE8LW9APFtAjm4hLoWDOTctE2MA
 P+oVnjEo3mwGLZXSq5xH3U76K2p+c5Ig+qpcXG5AME4AT/twIqTBpe7JeXMgcvyZDu24
 rCaqPLoXsK80KgQjOna5j7yTcEUKrea+qVQgg=
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDI6NDg6MzlQTSAtMDcwMCwgTWFuYXNpIE5hdmFyZSB3
cm90ZToKPiBJbiBjYXNlIG9mIHRpbGVkIGRpc3BsYXlzLCBpZiB3ZSBob3RwbHVnIGp1c3Qgb25l
IGNvbm5lY3RvciwKPiBmYmNvbiBjdXJyZW50bHkganVzdCBzZWxlY3RzIHRoZSBwcmVmZXJyZWQg
bW9kZSBhbmQgaWYgaXQgaXMKPiB0aWxlZCBtb2RlIHRoZW4gdGhhdCBiZWNvbWVzIGEgcHJvYmxl
bSBpZiByZXN0IG9mIHRoZSB0aWxlcyBhcmUKPiBub3QgcHJlc2VudC4KPiBTbyBpbiB0aGUgZmJk
ZXYgZHJpdmVyIG9uIGhvdHBsdWcgd2hlbiB3ZSBwcm9iZSB0aGUgY2xpZW50IG1vZGVzZXQsCj4g
d2Ugd2UgZG9udCBmaW5kIGFsbCB0aGUgY29ubmVjdG9ycyBmb3IgYWxsIHRpbGVzLCB0aGVuIG9u
IGEgY29ubmVjdG9yCj4gd2l0aCBvbmUgdGlsZSwganVzdCBmYWxsYmFjayB0byB0aGUgZmlyc3Qg
YXZhaWxhYmxlIG5vbiB0aWxlZCBtb2RlCj4gdG8gZGlzcGxheSBvdmVyIGEgc2luZ2xlIGNvbm5l
Y3Rvci4KPiAKPiBTdWdnZXN0ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CgpIbSwgc2hvdWxk
IHdlIG1heWIgaGF2ZSBhIHNsaWdodCB0aW1lb3V0IGZpcnN0IHRvIHdhaXQgZm9yIHRoZSAybmQK
Y29ubmVjdG9yPyBPdGhlcndpc2UgbG90cyBvZiBmbGlja2VyaW5nIGdvaW5nIG9uIHdoZW4gcGx1
Z2dpbmcgaW4gb25lIG9mCnRoZXNlIHNjcmVlbnMgLi4uCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gaW5kZXggODk1YjczZjIzMDc5Li5lMjhhNzIzNTg3
ZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gQEAgLTExNCw2ICsx
MTQsMjAgQEAgZHJtX2NsaWVudF9maW5kX21vZGVzZXQoc3RydWN0IGRybV9jbGllbnRfZGV2ICpj
bGllbnQsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgCXJldHVybiBOVUxMOwo+ICB9Cj4gIAo+
ICtzdGF0aWMgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKgo+ICtkcm1fY29ubmVjdG9yX2ZhbGxi
YWNrX25vbl90aWxlZF9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gK3sK
PiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwo+ICsKPiArCWxpc3RfZm9yX2VhY2hf
ZW50cnkobW9kZSwgJmNvbm5lY3Rvci0+bW9kZXMsIGhlYWQpIHsKPiArCQlpZiAobW9kZS0+aGRp
c3BsYXkgPT0gY29ubmVjdG9yLT50aWxlX2hfc2l6ZSAmJgo+ICsJCSAgICBtb2RlLT52ZGlzcGxh
eSA9PSBjb25uZWN0b3ItPnRpbGVfdl9zaXplKQo+ICsJCQljb250aW51ZTsKPiArCQlyZXR1cm4g
bW9kZTsKPiArCX0KPiArCXJldHVybiBOVUxMOwo+ICt9Cj4gKwo+ICBzdGF0aWMgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKgo+ICBkcm1fY29ubmVjdG9yX2hhc19wcmVmZXJyZWRfbW9kZShzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBpbnQgd2lkdGgsIGludCBoZWlnaHQpCj4gIHsK
PiBAQCAtMzQ4LDggKzM2MiwxNyBAQCBzdGF0aWMgYm9vbCBkcm1fY2xpZW50X3RhcmdldF9wcmVm
ZXJyZWQoc3RydWN0IGRybV9jb25uZWN0b3IgKipjb25uZWN0b3JzLAo+ICAJc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcjsKPiAgCXU2NCBjb25uX2NvbmZpZ3VyZWQgPSAwOwo+ICAJaW50
IHRpbGVfcGFzcyA9IDA7Cj4gKwlpbnQgbnVtX3RpbGVkX2Nvbm5zID0gMDsKPiAgCWludCBpOwo+
ICAKPiArCWZvciAoaSA9IDA7IGkgPCBjb25uZWN0b3JfY291bnQ7IGkrKykgewo+ICsJCWNvbm5l
Y3RvciA9IGNvbm5lY3RvcnNbaV07Cj4gKwkJaWYgKCFjb25uZWN0b3ItPmhhc190aWxlKQo+ICsJ
CQljb250aW51ZTsKPiArCj4gKwkJbnVtX3RpbGVkX2Nvbm5zICsrOwo+ICsJfQo+ICsKPiAgcmV0
cnk6Cj4gIAlmb3IgKGkgPSAwOyBpIDwgY29ubmVjdG9yX2NvdW50OyBpKyspIHsKPiAgCQljb25u
ZWN0b3IgPSBjb25uZWN0b3JzW2ldOwo+IEBAIC0zOTQsNiArNDE3LDEyIEBAIHN0YXRpYyBib29s
IGRybV9jbGllbnRfdGFyZ2V0X3ByZWZlcnJlZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqKmNvbm5l
Y3RvcnMsCj4gIAkJCQkgICAgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+dGlsZV9n
cm91cCA/IGNvbm5lY3Rvci0+dGlsZV9ncm91cC0+aWQgOiAwKTsKPiAgCQkJbW9kZXNbaV0gPSBk
cm1fY29ubmVjdG9yX2hhc19wcmVmZXJyZWRfbW9kZShjb25uZWN0b3IsIHdpZHRoLCBoZWlnaHQp
Owo+ICAJCX0KPiArCQlpZiAoY29ubmVjdG9yLT5oYXNfdGlsZSAmJgo+ICsJCSAgICBudW1fdGls
ZWRfY29ubnMgPCBjb25uZWN0b3ItPm51bV9oX3RpbGUgKiBjb25uZWN0b3ItPm51bV92X3RpbGUp
IHsKPiArCQkJRFJNX0RFQlVHX0tNUygiRmFsbGluZyBiYWNrIHRvIG5vbiB0aWxlZCBtb2RlIG9u
IENvbm5lY3RvciAlZFxuIiwKPiArCQkJCSAgICAgIGNvbm5lY3Rvci0+YmFzZS5pZCk7Cj4gKwkJ
CW1vZGVzW2ldID0gZHJtX2Nvbm5lY3Rvcl9mYWxsYmFja19ub25fdGlsZWRfbW9kZShjb25uZWN0
b3IpOwo+ICsJCX0KPiAgCQkvKiBObyBwcmVmZXJyZWQgbW9kZXMsIHBpY2sgb25lIG9mZiB0aGUg
bGlzdCAqLwo+ICAJCWlmICghbW9kZXNbaV0gJiYgIWxpc3RfZW1wdHkoJmNvbm5lY3Rvci0+bW9k
ZXMpKSB7Cj4gIAkJCWxpc3RfZm9yX2VhY2hfZW50cnkobW9kZXNbaV0sICZjb25uZWN0b3ItPm1v
ZGVzLCBoZWFkKQo+IC0tIAo+IDIuMTkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
