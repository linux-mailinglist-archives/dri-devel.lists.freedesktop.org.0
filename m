Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627914AB39
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E646E235;
	Tue, 18 Jun 2019 19:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27D86E235
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:52:06 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i34so11655519qta.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rKlvb5xlV7AjdrT+ymSYk12cKDt0ZQUtMF2LTHfZOts=;
 b=cs58c0G4eOJMLVQlAhw51/iyCPqUbrYnLdfs/3tQE3B8CX32Jkt0/6pQfTlegSwwhB
 SDbyb4JhAhkhBUn5HyTG8Jfy4eqUFgJWxl31g9pplP+md48QQXIZUsIrJJvglEZKQQcL
 Ujzfq4Y8HXuOzkWaLGkYEO6iItbB+S0j/DV07dnE+5qg2PMZklhz789AXVRkaLoakkah
 h42O9yPfTL45BtqA6vF9YHtON8ktiVc2mDQCCqscllNg7C/wn4IY6MM1bQ7e0vfLSoHL
 o3OJmw96JHW4iWQYEP5tvaOqU5SDM/3yoT51jSMC+JggnO4P/S/CNSEWbxUv0qTRO9m/
 Wrew==
X-Gm-Message-State: APjAAAUYgNimdH+JBpF4HtL+Dq+9Mu1UVVhqtPeecKN31saKxYvtJLzQ
 gvDH0CvsaeEMfHfyAwf54d55eg==
X-Google-Smtp-Source: APXvYqznfGGft1O/1HHlt55I6UyugR1Pndtb6Tm/zxXNwqMH2bv3sqw1e3e2bE9n7RoCnchsRnMmCw==
X-Received: by 2002:ac8:3132:: with SMTP id g47mr48006861qtb.155.1560887525765; 
 Tue, 18 Jun 2019 12:52:05 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 102sm7628154qte.52.2019.06.18.12.52.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 12:52:05 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:52:04 -0400
From: Sean Paul <sean@poorly.run>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH] drm: Permit video-buffers writecombine mapping for MIPS
Message-ID: <20190618195204.GC25413@art_vandelay>
References: <20190423123122.32573-1-fancer.lancer@gmail.com>
 <20190617134729.pd24boyqe2viyihm@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617134729.pd24boyqe2viyihm@mobilestation>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rKlvb5xlV7AjdrT+ymSYk12cKDt0ZQUtMF2LTHfZOts=;
 b=HIjadFGFGEXpbxE64Z3ryg2YKt6x7P7r8lG5rpQv4JTlECfohUBliyZGbXhgixpAAu
 Jh5lrATzJzvIM0sM1dMb2n4ed8dlnUBxyR3JldHddNTi1HNu3GGNWGWrewNBWI4ZynHz
 YEC5el4Ts3kwt+UHyvyrsGzBVXkA1G+8HhuIwVSOhXc++BMwQtb8uOJHt2VFgvCtJjvJ
 6a6x1rdEedYxVsntJDH2goukZi4FiHMQS5/zlqPjzn8Y2lXqybGFxntfiLAcnPH0BJub
 FwYwbC21szO0RkUWcuBWOEGq6+bVY7Z1y0PMyZDQZMqwEtoXnIEjplUs24QR6Wh2wXCa
 NS3g==
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
Cc: "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Paul Burton <paul.burton@mips.com>,
 Huang Rui <ray.huang@amd.com>, Ralf Baechle <ralf@linux-mips.org>,
 James Hogan <jhogan@kernel.org>, Junwei Zhang <Jerry.Zhang@amd.com>,
 Sean Paul <sean@poorly.run>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDQ6NDc6MzBQTSArMDMwMCwgU2VyZ2UgU2VtaW4gd3Jv
dGU6Cj4gSGVsbG8gZm9sa3MsCj4gCj4gQW55IHVwZGF0ZXMgb2YgdGhpcyBwYXRjaCBzdGF0dXM/
IEl0IGhhcyBiZWVuIGhlcmUgZm9yIGFib3V0IHR3byBtb250aHMuCj4gCgpTb3JyeSBmb3IgdGhl
IG1peHVwLCBsb29rcyBsaWtlIHRoaXMgb25lIGp1c3QgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3Mu
IEkndmUKYXBwbGllZCBpdCB0byBkcm0tbWlzYy1uZXh0IHdpdGggdGhlIGF0dGFjaGVkIEFjayBh
bmQgUmV2aWV3LgoKU2VhbgoKCj4gUmVnYXJkcywKPiAtU2VyZ2V5Cj4gCj4gT24gVHVlLCBBcHIg
MjMsIDIwMTkgYXQgMDM6MzE6MjJQTSArMDMwMCwgU2VyZ2UgU2VtaW4gd3JvdGU6Cj4gPiBTaW5j
ZSBjb21taXQgNGIwNTBiYTdhNjZjICgiTUlQUzogcGd0YWJsZS5oOiBJbXBsZW1lbnQgdGhlCj4g
PiBwZ3Byb3Rfd3JpdGVjb21iaW5lIGZ1bmN0aW9uIGZvciBNSVBTIikgYW5kIGNvbW1pdCBjNDY4
N2IxNWE4NDggKCJNSVBTOiBGaXgKPiA+IGRlZmluaXRpb24gb2YgcGdwcm90X3dyaXRlY29tYmlu
ZSgpIikgd3JpdGUtY29tYmluZSB2bWEgbWFwcGluZyBpcwo+ID4gYXZhaWxhYmxlIHRvIGJlIHVz
ZWQgYnkga2VybmVsIHN1YnN5c3RlbXMgZm9yIE1JUFMuIEluIHBhcnRpY3VsYXIgdGhlCj4gPiB1
bmNhY2hlZCBhY2NlbGVyYXRlZCBhdHRyaWJ1dGUgaXMgcmVxdWVzdGVkIHRvIGJlIHNldCBieSBp
b3JlbWFwX3djKCkKPiA+IG1ldGhvZCBhbmQgYnkgZ2VuZXJpYyBQQ0kgbWVtb3J5IHBhZ2VzL3Jh
bmdlcyBtYXBwaW5nIG1ldGhvZHMuIFRoZSBzYW1lCj4gPiBpcyBkb25lIGJ5IHRoZSBkcm1faW9f
cHJvdCgpL3R0bV9pb19wcm90KCkgZnVuY3Rpb25zIGluIGNhc2UgaWYKPiA+IHdyaXRlLWNvbWJp
bmUgZmxhZyBpcyBzZXQgZm9yIHZtYSdzIHBhc3NlZCBmb3IgbWFwcGluZy4gQnV0IGZvciBzb21l
Cj4gPiByZWFzb24gdGhlIHBncHJvdF93cml0ZWNvbWJpbmUoKSBtZXRob2QgY2FsbGluZyBpcyBp
ZmRlZmVkIHRvIGJlIGEKPiA+IHBsYXRmb3JtLXNwZWNpZmljIHdpdGggTUlQUyBzeXN0ZW0gYmVp
bmcgbWFya2VkIGFzIGxhY2tpbmcgb2Ygb25lLiBBdCB0aGUKPiA+IHZlcnkgbGVhc3QgaXQgZG9l
c24ndCByZWZsZWN0IHRoZSBjdXJyZW50IE1JUFMgcGxhdGZvcm0gaW1wbGVtZW50YXRpb24uCj4g
PiBTbyBpbiBvcmRlciB0byBpbXByb3ZlIHRoZSBEUk0gc3Vic3lzdGVtIHBlcmZvcm1hbmNlIG9u
IE1JUFMgd2l0aCBVQ0EKPiA+IG1hcHBpbmcgZW5hYmxlZCwgd2UgbmVlZCB0byBoYXZlIHBncHJv
dF93cml0ZWNvbWJpbmUoKSBjYWxsZWQgZm9yIGJ1ZmZlcnMsCj4gPiB3aGljaCBuZWVkIHN0b3Jl
IG9wZXJhdGlvbnMgYmVpbmcgY29tYmluZWQuIEluIGNhc2UgaWYgcGFydGljdWxhciBNSVBTCj4g
PiBjaGlwIGRvZXNuJ3Qgc3VwcG9ydCB0aGUgVUNBIGF0dHJpYnV0ZSwgdGhlIG1hcHBpbmcgd2ls
bCBmYWxsIGJhY2sgdG8KPiA+IG5vbmNhY2hlZC4KPiA+IAo+ID4gQ2M6IFJhbGYgQmFlY2hsZSA8
cmFsZkBsaW51eC1taXBzLm9yZz4KPiA+IENjOiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlw
cy5jb20+Cj4gPiBDYzogSmFtZXMgSG9nYW4gPGpob2dhbkBrZXJuZWwub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogVmFkaW0gVi4gVmxhc292IDx2YWRpbS52bGFzb3ZAdC1wbGF0Zm9ybXMucnU+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZtLmMgICAgICAgICAgfCA1ICsrKy0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgNCArKy0tCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zt
LmMKPiA+IGluZGV4IGMzMzAxMDQ2ZGZhYS4uNTAxNzhkYzY0MDYwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV92bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zt
LmMKPiA+IEBAIC02Miw3ICs2Miw4IEBAIHN0YXRpYyBwZ3Byb3RfdCBkcm1faW9fcHJvdChzdHJ1
Y3QgZHJtX2xvY2FsX21hcCAqbWFwLAo+ID4gIAkvKiBXZSBkb24ndCB3YW50IGdyYXBoaWNzIG1l
bW9yeSB0byBiZSBtYXBwZWQgZW5jcnlwdGVkICovCj4gPiAgCXRtcCA9IHBncHJvdF9kZWNyeXB0
ZWQodG1wKTsKPiA+ICAKPiA+IC0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4
Nl82NF9fKSB8fCBkZWZpbmVkKF9fcG93ZXJwY19fKQo+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9f
KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19wb3dlcnBjX18pIHx8IFwKPiA+
ICsgICAgZGVmaW5lZChfX21pcHNfXykKPiA+ICAJaWYgKG1hcC0+dHlwZSA9PSBfRFJNX1JFR0lT
VEVSUyAmJiAhKG1hcC0+ZmxhZ3MgJiBfRFJNX1dSSVRFX0NPTUJJTklORykpCj4gPiAgCQl0bXAg
PSBwZ3Byb3Rfbm9uY2FjaGVkKHRtcCk7Cj4gPiAgCWVsc2UKPiA+IEBAIC03Myw3ICs3NCw3IEBA
IHN0YXRpYyBwZ3Byb3RfdCBkcm1faW9fcHJvdChzdHJ1Y3QgZHJtX2xvY2FsX21hcCAqbWFwLAo+
ID4gIAkJdG1wID0gcGdwcm90X3dyaXRlY29tYmluZSh0bXApOwo+ID4gIAllbHNlCj4gPiAgCQl0
bXAgPSBwZ3Byb3Rfbm9uY2FjaGVkKHRtcCk7Cj4gPiAtI2VsaWYgZGVmaW5lZChfX3NwYXJjX18p
IHx8IGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX21pcHNfXykKPiA+ICsjZWxpZiBkZWZp
bmVkKF9fc3BhcmNfXykgfHwgZGVmaW5lZChfX2FybV9fKQo+ID4gIAl0bXAgPSBwZ3Byb3Rfbm9u
Y2FjaGVkKHRtcCk7Cj4gPiAgI2VuZGlmCj4gPiAgCXJldHVybiB0bXA7Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdXRpbC5jCj4gPiBpbmRleCA4OTVkNzdkNzk5ZTQuLjlmOTE4Yjk5MmY3ZSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gPiBAQCAtNTM5LDEzICs1MzksMTMg
QEAgcGdwcm90X3QgdHRtX2lvX3Byb3QodWludDMyX3QgY2FjaGluZ19mbGFncywgcGdwcm90X3Qg
dG1wKQo+ID4gIAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ID4gICNlbmRpZgo+ID4g
ICNpZiBkZWZpbmVkKF9faWE2NF9fKSB8fCBkZWZpbmVkKF9fYXJtX18pIHx8IGRlZmluZWQoX19h
YXJjaDY0X18pIHx8IFwKPiA+IC0gICAgZGVmaW5lZChfX3Bvd2VycGNfXykKPiA+ICsgICAgZGVm
aW5lZChfX3Bvd2VycGNfXykgfHwgZGVmaW5lZChfX21pcHNfXykKPiA+ICAJaWYgKGNhY2hpbmdf
ZmxhZ3MgJiBUVE1fUExfRkxBR19XQykKPiA+ICAJCXRtcCA9IHBncHJvdF93cml0ZWNvbWJpbmUo
dG1wKTsKPiA+ICAJZWxzZQo+ID4gIAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ID4g
ICNlbmRpZgo+ID4gLSNpZiBkZWZpbmVkKF9fc3BhcmNfXykgfHwgZGVmaW5lZChfX21pcHNfXykK
PiA+ICsjaWYgZGVmaW5lZChfX3NwYXJjX18pCj4gPiAgCXRtcCA9IHBncHJvdF9ub25jYWNoZWQo
dG1wKTsKPiA+ICAjZW5kaWYKPiA+ICAJcmV0dXJuIHRtcDsKPiA+IC0tIAo+ID4gMi4yMS4wCj4g
PiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBP
UwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
