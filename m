Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA356EC4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6089D8A;
	Wed, 26 Jun 2019 16:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8DC89D8A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:30:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e3so4128005edr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=pxtWuk1q9NwdLhCWjigp44Ai1m3FAAy67WUlQm2a8yA=;
 b=piTvLdphDrDH5xaMqFyNkHoYPTM/CeiJmqUOiTDx+HhlgMdWQqDFnAsPydRpAt5HEN
 KGRoCKXK7zgpQOvjACfsu7hasPI0mqLPcWmb/7grlEEwwPJ/vlFssbtjsJETb9CMnxlr
 nWvYQhoiqUNh6spMorgKVKV3BWjO8WBJjlxlUjvbf6YnF2/g2vabzrYqqlwCmM9Rpiqu
 2BSbpA1GesmeLVoN6MfoGpOWX6O+e81M8yBi3+l8k5TkUGQNeWXcRHYvCN2ogysR4vFL
 J6D90xC1xycRtDPtOUjgI/J86ln1xf1gunARPPy7EoZZ1VcMZFFC7UNA5gTNwFD/1Jl6
 uccA==
X-Gm-Message-State: APjAAAUl2nUo5XiowiHHuUFEI+3bMSezmcXkHmbyyb0CNP6oV/9S03YX
 U4gR6+JgaosdRrXatyCjCXGyZQ==
X-Google-Smtp-Source: APXvYqw14KV/pLRZOsgSJp+IRx5aZGACL1k4TeWcmneUTB28zjQgI7qKkEuffGFS5EHv4rTsmQzyaA==
X-Received: by 2002:a50:b4fd:: with SMTP id x58mr6357100edd.97.1561566600740; 
 Wed, 26 Jun 2019 09:30:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g7sm5884310eda.52.2019.06.26.09.29.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 09:29:59 -0700 (PDT)
Date: Wed, 26 Jun 2019 18:29:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] drm/bochs: fix framebuffer setup.
Message-ID: <20190626162957.GW12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20190626065551.12956-1-kraxel@redhat.com>
 <20190626065551.12956-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626065551.12956-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pxtWuk1q9NwdLhCWjigp44Ai1m3FAAy67WUlQm2a8yA=;
 b=F9CIevuQHRyHX0Cb4LbioMn7puTjlO57X0AZlpXpUCdNutm0m2aJ7IS0d8M21OWHZK
 +TETAqZTKW1TY9VDnAGJK5hZkd6b7xbLie+HSdTg2DDc63QTHsEvYtwx3R/luOMgj16x
 ehuLvbWfKr7ecteKGqISws5eJ8uiRlMZCBetw=
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6NTU6NTFBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBJZiBiby0+d2lkdGggZG9lc24ndCBtYXRjaCBmYi0+d2lkdGggdGhlIGRyaXZlciBm
YWlscyB0byBjb25maWd1cmUKPiB0aGUgZGlzcGxheSBjb3JyZWN0bHksIHJlc3VsdGluZyBpbiBh
IHNjcmFtYmxlZCBkaXNwbGF5LiAgRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHMuaCAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYyAg
fCAxMyArKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyB8
ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCj4gaW5kZXggY2MzNWQ0OTIxNDJjLi43OGMwMjgzNDk2
Y2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaAo+IEBAIC04Niw3ICs4Niw3IEBAIHZvaWQgYm9j
aHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKPiAgdm9pZCBib2Noc19o
d19zZXRmb3JtYXQoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCj4gIAkJCWNvbnN0IHN0cnVj
dCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdCk7Cj4gIHZvaWQgYm9jaHNfaHdfc2V0YmFzZShzdHJ1
Y3QgYm9jaHNfZGV2aWNlICpib2NocywKPiAtCQkgICAgICBpbnQgeCwgaW50IHksIHU2NCBhZGRy
KTsKPiArCQkgICAgICBpbnQgeCwgaW50IHksIGludCBmYndpZHRoLCB1NjQgYWRkcik7Cj4gIGlu
dCBib2Noc19od19sb2FkX2VkaWQoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMpOwo+ICAKPiAg
LyogYm9jaHNfbW0uYyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCj4gaW5kZXggNzkxYWIy
Zjc5OTQ3Li4xNDFhYTAyOTYyZDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hz
L2JvY2hzX2h3LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwo+IEBA
IC0yNTUsMTYgKzI1NSwyMSBAQCB2b2lkIGJvY2hzX2h3X3NldGZvcm1hdChzdHJ1Y3QgYm9jaHNf
ZGV2aWNlICpib2NocywKPiAgfQo+ICAKPiAgdm9pZCBib2Noc19od19zZXRiYXNlKHN0cnVjdCBi
b2Noc19kZXZpY2UgKmJvY2hzLAo+IC0JCSAgICAgIGludCB4LCBpbnQgeSwgdTY0IGFkZHIpCj4g
KwkJICAgICAgaW50IHgsIGludCB5LCBpbnQgZmJ3aWR0aCwgdTY0IGFkZHIpCj4gIHsKPiAtCXVu
c2lnbmVkIGxvbmcgb2Zmc2V0ID0gKHVuc2lnbmVkIGxvbmcpYWRkciArCj4gKwl1bnNpZ25lZCBs
b25nIG9mZnNldDsKPiArCXVuc2lnbmVkIGludCB2eCwgdnk7Cj4gKwo+ICsJYm9jaHMtPnN0cmlk
ZSA9IGZid2lkdGggKiAoYm9jaHMtPmJwcCAvIDgpOwo+ICsJb2Zmc2V0ID0gKHVuc2lnbmVkIGxv
bmcpYWRkciArCj4gIAkJeSAqIGJvY2hzLT5zdHJpZGUgKwo+ICAJCXggKiAoYm9jaHMtPmJwcCAv
IDgpOwo+IC0JaW50IHZ5ID0gb2Zmc2V0IC8gYm9jaHMtPnN0cmlkZTsKPiAtCWludCB2eCA9IChv
ZmZzZXQgJSBib2Nocy0+c3RyaWRlKSAqIDggLyBib2Nocy0+YnBwOwo+ICsJdnkgPSBvZmZzZXQg
LyBib2Nocy0+c3RyaWRlOwo+ICsJdnggPSAob2Zmc2V0ICUgYm9jaHMtPnN0cmlkZSkgKiA4IC8g
Ym9jaHMtPmJwcDsKPiAgCj4gIAlEUk1fREVCVUdfRFJJVkVSKCJ4ICVkLCB5ICVkLCBhZGRyICVs
bHggLT4gb2Zmc2V0ICVseCwgdnggJWQsIHZ5ICVkXG4iLAo+ICAJCQkgeCwgeSwgYWRkciwgb2Zm
c2V0LCB2eCwgdnkpOwo+ICsJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRF
WF9WSVJUX1dJRFRILCBmYndpZHRoKTsKPiAgCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVf
RElTUElfSU5ERVhfWF9PRkZTRVQsIHZ4KTsKPiAgCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBW
QkVfRElTUElfSU5ERVhfWV9PRkZTRVQsIHZ5KTsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNf
a21zLmMKPiBpbmRleCA1OTA0ZWRkYzgzYTUuLjFmNmFhMTFhMWRjOSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfa21zLmMKPiBAQCAtMzYsNiArMzYsNyBAQCBzdGF0aWMgdm9pZCBib2Noc19w
bGFuZV91cGRhdGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCj4gIAlib2Noc19od19zZXRi
YXNlKGJvY2hzLAo+ICAJCQkgc3RhdGUtPmNydGNfeCwKPiAgCQkJIHN0YXRlLT5jcnRjX3ksCj4g
KwkJCSBnYm8tPndpZHRoLAoKWW91IHdhbnQgdGhlIGRpbWVuc2lvbnMgb2YgdGhlIGRybV9mcmFt
ZWJ1ZmZlciBoZXJlLCBub3Qgc29tZXRoaW5nIGZyb20KdGhlIHVuZGVybHlpbmcgZ2VtIGJvLgoK
PiAgCQkJIGdiby0+Ym8ub2Zmc2V0KTsKCkkgdGhpbmsgc2FtZSBoZXJlLCBvciBhdCBsZWFzdCBh
ZGRpdGlvbmFsbHkgdGFrZSBpbnRvIGFjY291bnQgYm90aApkcm1fZnJhbWVidWZmZXIgb2Zmc2V0
IF9hbmRfIHZyYW0gb2Zmc2V0LgotRGFuaWVsCgo+ICAJYm9jaHNfaHdfc2V0Zm9ybWF0KGJvY2hz
LCBzdGF0ZS0+ZmItPmZvcm1hdCk7Cj4gIH0KPiAtLSAKPiAyLjE4LjEKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
