Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29CA74DA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6788589363;
	Tue,  3 Sep 2019 20:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7F89363
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:35:30 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id f187so6402308ywa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 13:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pwr73Ifq5MZWDOqqYWVQ92kOUvydUL8kklQud78eUJs=;
 b=sFyvBisNEfhlfHfAW4yy3fyyloiSaKZJ1UtaNnTXaiT9R6xczihwalfmUY2KokAkUM
 iwzX3XxTX1fC0OQrsSitSaVleb0nkt3yX4eGjbHDBNAP01hNx23O/6sLl6QhkIq1aAnp
 fnXz60er5IPC2Zq4c6gqNz+/C8BOQBqbqjBbrMoEDkVP7r/SO3d0fac7Ksp5U0hvbqNp
 V/IRPEWnKjyPKo8o2gcd3W653F9liKSwltWemXXyvcIig7GW8P6ErE4wD6cCQQvj4UtJ
 +hZRJgKVkNac5euQSdGIsWyBff+4andRN66TzUrgqY6q/0zZdP56pzhtRrUQ6G6hZ86A
 WzMw==
X-Gm-Message-State: APjAAAWS8ngOPK30A7ya0lqH6If1uT3fnxwUgj6v8os7o8oH5LI3SssS
 WEU2wopux+tEruknZXzis5JuQw==
X-Google-Smtp-Source: APXvYqwfJOUxosRmo8V5dxesORSeHIuM6ShnQY1aGpiUXTG5KqY5PTIzvrDeoLFx+EYtGBdQr4va3Q==
X-Received: by 2002:a81:84d4:: with SMTP id
 u203mr26754902ywf.106.1567542929119; 
 Tue, 03 Sep 2019 13:35:29 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g69sm3777935ywb.97.2019.09.03.13.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 13:35:25 -0700 (PDT)
Date: Tue, 3 Sep 2019 16:35:24 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 06/10] drm/msm: add kms->flush_commit()
Message-ID: <20190903203524.GJ218215@art_vandelay>
References: <20190829164601.11615-1-robdclark@gmail.com>
 <20190829164601.11615-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829164601.11615-7-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pwr73Ifq5MZWDOqqYWVQ92kOUvydUL8kklQud78eUJs=;
 b=ELdqVliyxeTW51ck6ee9Q2LraeCgUxfmOGv6+fiEQimkCVjhBsD0gEFVO66Dbyfn0g
 G1X3aEEQl4YN95BV8MPCAEv3ZTd2YyFmrTZRumnAQnKdQNuknxSIgNveJ2oosciek7Ay
 5oO3x3M3mQsIuE2ARuQ2ETH5jVeeFB2JftVPut9IGtPxIzpczsosbGc0RBiKc/S8z7iL
 uzmOSJxRb3pFLBTCp49IvcL96BhnVEdcQqC6kG3jOLZtMZxtG52TcqTmnYoSBB38oJ0f
 RX8JxSX/FbNQCz5wI14K1b8itHtewNvBXxteMX8t4BIpBcgFU3qWDHRm7L4ykZm9MZNu
 /siA==
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
Cc: Rob Clark <robdclark@chromium.org>, Enrico Weigelt <info@metux.net>,
 Jonathan Marek <jonathan@marek.ca>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>,
 Bruce Wang <bzwang@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Thomas Gleixner <tglx@linutronix.de>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDk6NDU6MTRBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBBZGQgLT5m
bHVzaF9jb21taXQoY3J0Y19tYXNrKS4gIEN1cnJlbnRseSBhIG5vLW9wLCBidXQga21zIGJhY2tl
bmRzCj4gc2hvdWxkIG1pZ3JhdGUgd3JpdGluZyBmbHVzaCByZWdpc3RlcnMgdG8gdGhpcyBob29r
LCBzbyB3ZSBjYW4gZGVjb3VwbGUKPiBwdXNoaW5nIHVwZGF0ZXMgdG8gaGFyZHdhcmUsIGFuZCBm
bHVzaGluZyB0aGUgdXBkYXRlcy4KPiAKPiBPbmNlIHdlIGFkZCBhc3luYyBjb21taXQgc3VwcG9y
dCwgdGhlIGh3IHVwZGF0ZXMgd2lsbCBiZSBwdXNoZWQgZG93biB0bwo+IHRoZSBodyBzeW5jaHJv
bm91c2x5LCBidXQgZmx1c2hpbmcgdGhlIHVwZGF0ZXMgd2lsbCBiZSBkZWZlcnJlZCB1bnRpbCBh
cwo+IGNsb3NlIHRvIHZibGFuayBhcyBwb3NzaWJsZSwgc28gdGhhdCBtdWx0aXBsZSB1cGRhdGVz
IGNhbiBiZSBjb21iaW5lZCBpbgo+IGEgc2luZ2xlIGZyYW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jICB8ICA2ICsrKysKPiAgZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDQvbWRwNF9rbXMuYyB8ICA2ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL21kcDUvbWRwNV9rbXMuYyB8ICA2ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fYXRvbWljLmMgICAgICAgICB8ICA5ICsrKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9rbXMuaCAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKCi9zbmlwCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9rbXMuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2ttcy5oCj4gaW5kZXggMTBkZDE3MWI0M2Y4Li5iYjcwYzE3NThjNzIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fa21zLmgKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9rbXMuaAo+IEBAIC0zMCwxMiArMzAsNDcgQEAgc3RydWN0IG1zbV9r
bXNfZnVuY3Mgewo+ICAJaXJxcmV0dXJuX3QgKCppcnEpKHN0cnVjdCBtc21fa21zICprbXMpOwo+
ICAJaW50ICgqZW5hYmxlX3ZibGFuaykoc3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRybV9j
cnRjICpjcnRjKTsKPiAgCXZvaWQgKCpkaXNhYmxlX3ZibGFuaykoc3RydWN0IG1zbV9rbXMgKmtt
cywgc3RydWN0IGRybV9jcnRjICpjcnRjKTsKPiAtCS8qIG1vZGVzZXQsIGJyYWNrZXRpbmcgYXRv
bWljX2NvbW1pdCgpOiAqLwo+ICsKPiArCS8qCj4gKwkgKiBBdG9taWMgY29tbWl0IGhhbmRsaW5n
Ogo+ICsJICovCj4gKwo+ICsJLyoqCj4gKwkgKiBQcmVwYXJlIGZvciBhdG9taWMgY29tbWl0LiAg
VGhpcyBpcyBjYWxsZWQgYWZ0ZXIgYW55IHByZXZpb3VzCj4gKwkgKiAoYXN5bmMgb3Igb3RoZXJ3
aXNlKSBjb21taXQgaGFzIGNvbXBsZXRlZC4KPiArCSAqLwo+ICAJdm9pZCAoKnByZXBhcmVfY29t
bWl0KShzdHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUp
Owo+ICsKPiArCS8qKgo+ICsJICogRmx1c2ggYW4gYXRvbWljIGNvbW1pdC4gIFRoaXMgaXMgY2Fs
bGVkIGFmdGVyIHRoZSBoYXJkd2FyZQo+ICsJICogdXBkYXRlcyBoYXZlIGFscmVhZHkgYmVlbiBw
dXNoZWQgZG93biB0byBlZmZlY3RlZCBwbGFuZXMvCj4gKwkgKiBjcnRjcy9lbmNvZGVycy9jb25u
ZWN0b3JzLgo+ICsJICovCj4gKwl2b2lkICgqZmx1c2hfY29tbWl0KShzdHJ1Y3QgbXNtX2ttcyAq
a21zLCB1bnNpZ25lZCBjcnRjX21hc2spOwo+ICsKPiArCS8qIFRPRE8gcmVtb3ZlIC0+Y29tbWl0
KCksIHVzZSAtPmZsdXNoX2NvbW1pdCgpIGluc3RlYWQ6ICovCj4gIAl2b2lkICgqY29tbWl0KShz
dHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOwo+IC0J
dm9pZCAoKmNvbXBsZXRlX2NvbW1pdCkoc3RydWN0IG1zbV9rbXMgKmttcywgdW5zaWduZWQgY3J0
Y19tYXNrKTsKPiArCj4gKwkvKioKPiArCSAqIFdhaXQgZm9yIGFueSBpbi1wcm9ncmVzcyBmbHVz
aCB0byBjb21wbGV0ZSBvbiB0aGUgc3BlY2lmaWVkCj4gKwkgKiBjcnRjcy4gIFRoaXMgc2hvdWxk
IG5vdCBibG9jayBpZiB0aGVyZSBpcyBubyBpbi1wcm9ncmVzcwo+ICsJICogY29tbWl0IChpZS4g
ZG9uJ3QganVzdCB3YWl0IGZvciBhIHZibGFuayksIGFzIGl0IHdpbGwgYWxzbwo+ICsJICogYmUg
Y2FsbGVkIGJlZm9yZSAtPnByZXBhcmVfY29tbWl0KCkgdG8gZW5zdXJlIGFueSBwb3RlbnRpYWwK
PiArCSAqICJhc3luYyIgY29tbWl0IGhhcyBjb21wbGV0ZWQuCj4gKwkgKi8KPiAgCXZvaWQgKCp3
YWl0X2ZsdXNoKShzdHJ1Y3QgbXNtX2ttcyAqa21zLCB1bnNpZ25lZCBjcnRjX21hc2spOwo+ICAK
PiArCS8qKgo+ICsJICogQ2xlYW4gdXAgYXJlIGNvbW1pdCBpcyBjb21wbGV0ZWQuICBUaGlzIGlz
IGNhbGxlZCBhZnRlcgoKcy9hcmUvb3VyLz8KCldpdGggdGhhdCBmaXhlZCwKClJldmlld2VkLWJ5
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCgoKPiArCSAqIC0+d2FpdF9mbHVzaCgpLCB0
byBnaXZlIHRoZSBiYWNrZW5kIGEgY2hhbmNlIHRvIGRvIGFueQo+ICsJICogcG9zdC1jb21taXQg
Y2xlYW51cC4KPiArCSAqLwo+ICsJdm9pZCAoKmNvbXBsZXRlX2NvbW1pdCkoc3RydWN0IG1zbV9r
bXMgKmttcywgdW5zaWduZWQgY3J0Y19tYXNrKTsKPiArCj4gKwkvKgo+ICsJICogRm9ybWF0IGhh
bmRsaW5nOgo+ICsJICovCj4gKwo+ICAJLyogZ2V0IG1zbV9mb3JtYXQgdy8gb3B0aW9uYWwgZm9y
bWF0IG1vZGlmaWVycyBmcm9tIGRybV9tb2RlX2ZiX2NtZDIgKi8KPiAgCWNvbnN0IHN0cnVjdCBt
c21fZm9ybWF0ICooKmdldF9mb3JtYXQpKHN0cnVjdCBtc21fa21zICprbXMsCj4gIAkJCQkJY29u
c3QgdWludDMyX3QgZm9ybWF0LAo+IEBAIC00NSw2ICs4MCw3IEBAIHN0cnVjdCBtc21fa21zX2Z1
bmNzIHsKPiAgCQkJY29uc3Qgc3RydWN0IG1zbV9mb3JtYXQgKm1zbV9mbXQsCj4gIAkJCWNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICpjbWQsCj4gIAkJCXN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqKmJvcyk7Cj4gKwo+ICAJLyogbWlzYzogKi8KPiAgCWxvbmcgKCpyb3VuZF9waXhjbGspKHN0
cnVjdCBtc21fa21zICprbXMsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAgCQkJc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKTsKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
