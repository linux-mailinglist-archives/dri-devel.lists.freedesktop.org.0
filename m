Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF93618A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 18:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293089D58;
	Wed,  5 Jun 2019 16:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762DC89D58
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 16:43:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p26so6725176edr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=KBcdlC2ge4pIUucUxWkoWdjWUTsRJ1rNVGCprD2ivyU=;
 b=QFLfaUM2pXbH16QjumGF72LNgmz/ZLgAcGE0jFsUjXajvtXLxKLUOypQZP+pzLt0dH
 4RjP2c6vA3V2diAb66YygCWW29UlkLe/kY8Nk4x1Jhow5ZFZlCQ4NaefGaeRqYG3QVhM
 5bAqSiw3tSQBa+cgAWOAkk7MGkCNrwEDhBXNqDu6F9pkdjjjYj0CN3xBLLZ8UAnQJdHJ
 JkhhNbfdmKEb9z8tTliPibL8Ye6P4AAqnN52Q5V0DDOOgdtkSKuCisC3eoJ36BCs+58V
 6XW00/EC3YI3Bw6qGZSJuTsoyKBKTZdekmTANon9F+HbQ6QqL4pvUbRHF8Dn8GozZfvO
 45Gw==
X-Gm-Message-State: APjAAAVZvIM0j8P8vtKyE44xD/ZqC5F4vFKGBuvqIDcIKEFvmMUMpgho
 oX1h4khhRbUhvkBlcUVdtaTy4A==
X-Google-Smtp-Source: APXvYqxYooJuchDDLhGj3YGqX6lTZeNR1SkGUDIjgyR0U5BbobNF4DL0ouZKEor0ihHjJoSaH5k9XQ==
X-Received: by 2002:a17:906:1e0a:: with SMTP id
 g10mr37110742ejj.127.1559752993062; 
 Wed, 05 Jun 2019 09:43:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i33sm5680970ede.47.2019.06.05.09.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 09:43:12 -0700 (PDT)
Date: Wed, 5 Jun 2019 18:43:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/1] drm/sis: drop drmP.h use
Message-ID: <20190605164310.GV21222@phenom.ffwll.local>
References: <20190605135539.12940-1-sam@ravnborg.org>
 <20190605135539.12940-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605135539.12940-2-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=KBcdlC2ge4pIUucUxWkoWdjWUTsRJ1rNVGCprD2ivyU=;
 b=UN3xpoS5aphnYKMnys0XcEag6MaOMG6tLBVrhXlHYEq3CR7a/QpekvUSbEuZ/q+GRa
 wvKdJQrfR/dSyMrC+CoZdGWcVyXbygl3/ypHDZLXHUDnbXXPofR41P8ndDf2SXaJVBFB
 7k+UVoPnLfeeVOTS3MOp/bqQOsM3O1kuhIfJM=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6NTU6MzlQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIuCj4gUmVwYWxj
ZWQgd2l0aCByZWxldmFudCBoZWFkZXIgZmlsZXMgYW5kIHNvcnRlZCBoZWFkZXIgZmlsZXMgaW4g
YWxsIGZpbGVzCj4gdG91Y2hlZC4KPiAKPiBSZXBsYWNlZCBEUk1fe1JFQUQsV1JJVEV9IHRvIGF2
b2lkIHRoZSBkcm1fb3NfbGludXggaGVhZGVyLgo+IAo+IEJ1aWxkIHRlc3RlZCB3aXRoIGFsbHll
c2NvbmZpZywgYWxsbW9kY29uZmlnIG9uIHZhcmlvdXMgYXJjaGl0ZWN0dXJlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19kcnYuYyB8ICA4ICsrKysrLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5oIHwgMTAgKysrKy0tLS0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vc2lzL3Npc19tbS5jICB8ICA3ICsrKysrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3Npcy9zaXNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19kcnYuYwo+
IGluZGV4IGUwNGE5MjY1OGNkNy4uZWUzODAxMjAxZWNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zaXMvc2lzX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfZHJ2
LmMKPiBAQCAtMjcsMTEgKzI3LDEzIEBACj4gIAo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Cj4gIAo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+
Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+
Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3BjaWlkcy5oPgo+ICAjaW5jbHVkZSA8ZHJtL3Npc19kcm0u
aD4KPiAtI2luY2x1ZGUgInNpc19kcnYuaCIKPiAgCj4gLSNpbmNsdWRlIDxkcm0vZHJtX3BjaWlk
cy5oPgo+ICsjaW5jbHVkZSAic2lzX2Rydi5oIgo+ICAKPiAgc3RhdGljIHN0cnVjdCBwY2lfZGV2
aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+ICAJc2lzZHJ2X1BDSV9JRFMKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19k
cnYuaAo+IGluZGV4IDMyOGY4YTc1MDk3Ni4uODEzMzk0NDNiM2IxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zaXMvc2lzX2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Npcy9z
aXNfZHJ2LmgKPiBAQCAtMjgsNyArMjgsOSBAQAo+ICAjaWZuZGVmIF9TSVNfRFJWX0hfCj4gICNk
ZWZpbmUgX1NJU19EUlZfSF8KPiAgCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX2xlZ2FjeS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9tbS5oPgo+ICAK
PiAgLyogR2VuZXJhbCBjdXN0b21pemF0aW9uOgo+ICAgKi8KPiBAQCAtNDYsMTIgKzQ4LDggQEAg
ZW51bSBzaXNfZmFtaWx5IHsKPiAgCVNJU19DSElQXzMxNSA9IDEsCj4gIH07Cj4gIAo+IC0jaW5j
bHVkZSA8ZHJtL2RybV9tbS5oPgo+IC0KPiAtCj4gLSNkZWZpbmUgU0lTX0JBU0UgKGRldl9wcml2
LT5tbWlvKQo+IC0jZGVmaW5lIFNJU19SRUFEKHJlZykgICAgICAgICBEUk1fUkVBRDMyKFNJU19C
QVNFLCByZWcpCj4gLSNkZWZpbmUgU0lTX1dSSVRFKHJlZywgdmFsKSAgIERSTV9XUklURTMyKFNJ
U19CQVNFLCByZWcsIHZhbCkKPiArI2RlZmluZSBTSVNfUkVBRChyZWcpICAgICAgICAgcmVhZGwo
KCh2b2lkIF9faW9tZW0gKilkZXZfcHJpdi0+bW1pby0+aGFuZGxlKSArIChyZWcpKQo+ICsjZGVm
aW5lIFNJU19XUklURShyZWcsIHZhbCkgICB3cml0ZWwodmFsLCAoKHZvaWQgX19pb21lbSAqKWRl
dl9wcml2LT5tbWlvLT5oYW5kbGUpICsgKHJlZykpCj4gIAo+ICB0eXBlZGVmIHN0cnVjdCBkcm1f
c2lzX3ByaXZhdGUgewo+ICAJZHJtX2xvY2FsX21hcF90ICptbWlvOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc2lzL3Npc19tbS5jIGIvZHJpdmVycy9ncHUvZHJtL3Npcy9zaXNfbW0u
Ywo+IGluZGV4IDE2MjJkYjI0Y2QzOS4uZTUxZDQyODlhM2QwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zaXMvc2lzX21tLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2lzL3Npc19t
bS5jCj4gQEAgLTMxLDExICszMSwxNCBAQAo+ICAgKiAgICBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLWF0LXR1bmdzdGVuZ3JhcGhpY3MtZG90LWNvbT4KPiAgICovCj4gIAo+IC0jaW5jbHVkZSA8
ZHJtL2RybVAuaD4KPiArI2luY2x1ZGUgPHZpZGVvL3Npc2ZiLmg+Cj4gKwo+ICsjaW5jbHVkZSA8
ZHJtL2RybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgo+ICAjaW5jbHVk
ZSA8ZHJtL3Npc19kcm0uaD4KPiArCj4gICNpbmNsdWRlICJzaXNfZHJ2LmgiCj4gIAo+IC0jaW5j
bHVkZSA8dmlkZW8vc2lzZmIuaD4KPiAgCj4gICNkZWZpbmUgVklERU9fVFlQRSAwCj4gICNkZWZp
bmUgQUdQX1RZUEUgMQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
