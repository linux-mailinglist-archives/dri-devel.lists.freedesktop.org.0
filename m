Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C182CD3101
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826C06E3AA;
	Thu, 10 Oct 2019 18:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC46E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:58:17 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id 129so2557675ywb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HnzDo6J7XPtXSDGmFJ7m3yzfxGtmqMxou+frhT1YXbY=;
 b=BQL0ESzYKfOZ3sUrxo+CHtwJC1Xn2zfDm/aRLuF/zSZUOwtNlSsajrYpr3ewrlaWdv
 8b8//zf8olICOTM+JQOie6h3+3rItTrucNvpHNSpZUtcR+rCklI1I+Xtxoa6GxwS53NF
 X/rJ9ZaMd9BvVhqLqVeCx7dbjLdXBbWXSJpMn8zFzhs14rwUQ+CnwkgTMlBrZLxNlRff
 krVk5yRzE44jMN/uTMgiviuZIXnwJR4n9+YSK1HJ9hATzePXtrZzoWOjbdl/cH0jnq3G
 A/4Dzah0gjtbBEvt8Z8uE17wBkphZcF0zFhR077BqHWtm5bnVjUoxj09xlXHoBc1QFVF
 hEJA==
X-Gm-Message-State: APjAAAVcfo6HtXExJ1vjQyQX/I0OOHdeuezqZbIsC0gzb5cBuZK3WP33
 4oBjfucXC4WZ6oXtrwruofh+yw==
X-Google-Smtp-Source: APXvYqykLeC0EhYVvNXlLWQlfAuhK8feubMl8CwTajOuOLhB38mkuNImas2t5fnAYgZxwucnqhDaaw==
X-Received: by 2002:a0d:c385:: with SMTP id f127mr8349803ywd.509.1570733896503; 
 Thu, 10 Oct 2019 11:58:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r193sm1583030ywg.38.2019.10.10.11.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 11:58:16 -0700 (PDT)
Date: Thu, 10 Oct 2019 14:58:15 -0400
From: Sean Paul <sean@poorly.run>
To: kholk11@gmail.com
Subject: Re: [PATCH v2 3/5] drm/msm/dsi: Add configuration for 28nm PLL on
 family B
Message-ID: <20191010185815.GM85762@art_vandelay>
References: <20190926105256.61412-1-kholk11@gmail.com>
 <20190926105256.61412-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926105256.61412-4-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HnzDo6J7XPtXSDGmFJ7m3yzfxGtmqMxou+frhT1YXbY=;
 b=CQDn43tZBrhtRfHpzLdWL4rdyoSA0rTfFg/J40LA8pTbo9zJBlPXaAKX8dCLzTbriS
 USdPMwP8uzu7N7TGxaqN9xLUWJtG4knYWhb/kdT5uPwLy/3AxHkSb6aNm0QaKxnv7PsT
 H89yVk/OqtnXkLyrEHWazDd6ioGboYjwP/mPLNwQvAlK1an72DiOEN+mFdjA9Zi0CFHw
 AYX6bD46i2M3Tj7ZyYwtH4CnJjN4xCdKIjNT2Q6b/4eHTdNPprqkJn9el6CgpJ0N5CF9
 k6cYdWo7rGN2Upddpdf5M2idrg4Fd/f0md4xNV+ct5LJFzQwryNg2zNXkqPu+P0CxEUD
 prWA==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
 sean@poorly.run, georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NTI6NTRQTSArMDIwMCwga2hvbGsxMUBnbWFpbC5j
b20gd3JvdGU6Cj4gRnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNv
bT4KPiAKPiBUaGUgMjhubSBQTEwgaGFzIGEgZGlmZmVyZW50IGlvc3BhY2Ugb24gTVNNL0FQUSBm
YW1pbHkgQiBTb0NzOgo+IGFkZCBhIG5ldyBjb25maWd1cmF0aW9uIGFuZCB1c2UgaXQgd2hlbiB0
aGUgRFQgcmVwb3J0cyB0aGUKPiAicWNvbSxkc2ktcGh5LTI4bm0taHBtLWZhbS1iIiBjb21wYXRp
YmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBHLiBEZWwgUmVnbm8gPGtob2xrMTFAZ21h
aWwuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2ku
dHh0ICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jICAg
ICAgICAgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaCAg
ICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMjhu
bS5jICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAo+IGluZGV4IGFmOTU1ODZjODk4Zi4uZDNiYTllZTIy
ZjM4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9kc2kudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbXNtL2RzaS50eHQKPiBAQCAtODMsNiArODMsNyBAQCBEU0kgUEhZOgo+ICBSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBhdGlibGU6IENvdWxkIGJlIHRoZSBmb2xsb3dpbmcK
PiAgICAqICJxY29tLGRzaS1waHktMjhubS1ocG0iCj4gKyAgKiAicWNvbSxkc2ktcGh5LTI4bm0t
aHBtLWZhbS1iIgo+ICAgICogInFjb20sZHNpLXBoeS0yOG5tLWxwIgo+ICAgICogInFjb20sZHNp
LXBoeS0yMG5tIgo+ICAgICogInFjb20sZHNpLXBoeS0yOG5tLTg5NjAiCgpTYW1lIGNvbW1lbnQg
aGVyZSByZTogcHV0dGluZyBiaW5kaW5nIHVwZGF0ZXMgaW4gc2VwYXJhdGUgcGF0Y2hlcy4KClNl
YW4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCj4gaW5kZXggNDA5N2VjYTFi
M2VmLi41MDdjMDE0NmEzMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
cGh5L2RzaV9waHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5
LmMKPiBAQCAtNDgxLDYgKzQ4MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGRzaV9waHlfZHRfbWF0Y2hbXSA9IHsKPiAgI2lmZGVmIENPTkZJR19EUk1fTVNNX0RTSV8yOE5N
X1BIWQo+ICAJeyAuY29tcGF0aWJsZSA9ICJxY29tLGRzaS1waHktMjhubS1ocG0iLAo+ICAJICAu
ZGF0YSA9ICZkc2lfcGh5XzI4bm1faHBtX2NmZ3MgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAicWNv
bSxkc2ktcGh5LTI4bm0taHBtLWZhbS1iIiwKPiArCSAgLmRhdGEgPSAmZHNpX3BoeV8yOG5tX2hw
bV9mYW1iX2NmZ3MgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAicWNvbSxkc2ktcGh5LTI4bm0tbHAi
LAo+ICAJICAuZGF0YSA9ICZkc2lfcGh5XzI4bm1fbHBfY2ZncyB9LAo+ICAjZW5kaWYKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgKPiBpbmRleCBjNDA2OWNlNmFmZTYuLjI0YjI5
NGVkMzA1OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3Bo
eS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaAo+IEBAIC00
MCw2ICs0MCw3IEBAIHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgewo+ICB9Owo+ICAKPiAgZXh0ZXJu
IGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yOG5tX2hwbV9jZmdzOwo+ICtl
eHRlcm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4bm1faHBtX2ZhbWJf
Y2ZnczsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yOG5t
X2xwX2NmZ3M7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlf
MjBubV9jZmdzOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5
XzI4bm1fODk2MF9jZmdzOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8yOG5tLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8y
OG5tLmMKPiBpbmRleCBiM2Y2NzhmNmMyYWEuLjNiOTMwMDU0NWUxNiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMKPiBAQCAtMTQyLDYgKzE0MiwyNCBA
QCBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fY2ZncyA9IHsK
PiAgCS5udW1fZHNpX3BoeSA9IDIsCj4gIH07Cj4gIAo+ICtjb25zdCBzdHJ1Y3QgbXNtX2RzaV9w
aHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fZmFtYl9jZmdzID0gewo+ICsJLnR5cGUgPSBNU01fRFNJ
X1BIWV8yOE5NX0hQTSwKPiArCS5zcmNfcGxsX3RydXRodGFibGUgPSB7IHt0cnVlLCB0cnVlfSwg
e2ZhbHNlLCB0cnVlfSB9LAo+ICsJLnJlZ19jZmcgPSB7Cj4gKwkJLm51bSA9IDEsCj4gKwkJLnJl
Z3MgPSB7Cj4gKwkJCXsidmRkaW8iLCAxMDAwMDAsIDEwMH0sCj4gKwkJfSwKPiArCX0sCj4gKwku
b3BzID0gewo+ICsJCS5lbmFibGUgPSBkc2lfMjhubV9waHlfZW5hYmxlLAo+ICsJCS5kaXNhYmxl
ID0gZHNpXzI4bm1fcGh5X2Rpc2FibGUsCj4gKwkJLmluaXQgPSBtc21fZHNpX3BoeV9pbml0X2Nv
bW1vbiwKPiArCX0sCj4gKwkuaW9fc3RhcnQgPSB7IDB4MWE5NDQwMCwgMHgxYTk0ODAwIH0sCj4g
KwkubnVtX2RzaV9waHkgPSAyLAo+ICt9Owo+ICsKPiAgY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5
X2NmZyBkc2lfcGh5XzI4bm1fbHBfY2ZncyA9IHsKPiAgCS50eXBlID0gTVNNX0RTSV9QSFlfMjhO
TV9MUCwKPiAgCS5zcmNfcGxsX3RydXRodGFibGUgPSB7IHt0cnVlLCB0cnVlfSwge3RydWUsIHRy
dWV9IH0sCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
