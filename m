Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF92109CA5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A246E2E3;
	Tue, 26 Nov 2019 10:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4012E6E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:54:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i12so21832916wrn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 02:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0m2aIhtiBled0Rier5l0ndzlr2Gepz/S9qpk6DhIAfk=;
 b=SfQzbkjymgp1rF8vrINS8QrDVYQ1ngAqeYCuamsAGKcZy5I+OWulK5lypFGo78R/dq
 h0m6FVoSI3AiWiUSKPrjGbkn/xgKmiwgJ18cEM5W0qn5Lpjgfyl1sQ9iwav9YQ7dA+Ah
 9c2ap0G+wahEtSazTBQWyRIookEyizMXm+kHP5xgq3chzJGV3L2iS19vgxuqCWDQahaP
 lDeXndmYmxnRc1ut1mJBPsuM8RzUtBvgIXLBqGDgbTFDZ/JbyLtX4zQoExtDhEh8JwgO
 Qo2OhzkekIwshb1uF8+dTlR2yOAoc4vJ11qr+Cvvf4wmulCGuEVa+s2163uVoJkrMHhW
 NlzQ==
X-Gm-Message-State: APjAAAWb0r50L9Uqh1iTGI/8KBf3/iBibm2Dhuj8C6/smyUH9KjfwSaH
 5/yIfgq9ZdKvf0qvAzW1fQHQ7OQnpfY=
X-Google-Smtp-Source: APXvYqw2gpCez7KPdk4MsgX35uNVq4zbeJB++ioWP7G+2byVIAVs0drRL1YXoZ9d5vA/Sb0+8pTpuA==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr39752974wra.27.1574765691638; 
 Tue, 26 Nov 2019 02:54:51 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w10sm2539028wmd.26.2019.11.26.02.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 02:54:50 -0800 (PST)
Date: Tue, 26 Nov 2019 11:54:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 15/15] dma-buf: Remove kernel map/unmap hooks
Message-ID: <20191126105448.GT29965@phenom.ffwll.local>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-16-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-16-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0m2aIhtiBled0Rier5l0ndzlr2Gepz/S9qpk6DhIAfk=;
 b=H72nIzOOdIFUycAlN3KTFm1PNpG0WIxnp1c1QKmWXGSzn+l8m2zJZIpgqZHKTfnVj9
 uyZzc+y/gLUch5vBzIb7M6QjwwvnnSzOrafZIIlbde2z81m53lKsTWHMHiwfklNHcQPa
 XYAhPjnC8CEk68oBHqLXbplYwwhg/qjwJxoS4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MzZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBBbGwgaW1wbGVtZW50YXRpb25zIGFyZSBnb25lIG5vdy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwoKQXBwbGllZCB0
aGUgZmluYWwgdHdvIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgbm93IHRvby4KLURhbmllbAoKPiAt
LS0KPiAgaW5jbHVkZS9saW51eC9kbWEtYnVmLmggfCAyNSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9kbWEtYnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+IGluZGV4
IDdmZWI5YzM4MDVhZS4uYWJmNTQ1OWE1YjlkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgv
ZG1hLWJ1Zi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBAQCAtMjQ5LDMxICsy
NDksNiBAQCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgewo+ICAJICovCj4gIAlpbnQgKCptbWFwKShzdHJ1
Y3QgZG1hX2J1ZiAqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gIAo+IC0JLyoqCj4g
LQkgKiBAbWFwOgo+IC0JICoKPiAtCSAqIE1hcHMgYSBwYWdlIGZyb20gdGhlIGJ1ZmZlciBpbnRv
IGtlcm5lbCBhZGRyZXNzIHNwYWNlLiBUaGUgcGFnZSBpcwo+IC0JICogc3BlY2lmaWVkIGJ5IG9m
ZnNldCBpbnRvIHRoZSBidWZmZXIgaW4gUEFHRV9TSVpFIHVuaXRzLgo+IC0JICoKPiAtCSAqIFRo
aXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4gLQkgKgo+IC0JICogUmV0dXJuczoKPiAtCSAqCj4g
LQkgKiBWaXJ0dWFsIGFkZHJlc3MgcG9pbnRlciB3aGVyZSByZXF1ZXN0ZWQgcGFnZSBjYW4gYmUg
YWNjZXNzZWQuIE5VTEwKPiAtCSAqIG9uIGVycm9yIG9yIHdoZW4gdGhpcyBmdW5jdGlvbiBpcyB1
bmltcGxlbWVudGVkIGJ5IHRoZSBleHBvcnRlci4KPiAtCSAqLwo+IC0Jdm9pZCAqKCptYXApKHN0
cnVjdCBkbWFfYnVmICosIHVuc2lnbmVkIGxvbmcpOwo+IC0KPiAtCS8qKgo+IC0JICogQHVubWFw
Ogo+IC0JICoKPiAtCSAqIFVubWFwcyBhIHBhZ2UgZnJvbSB0aGUgYnVmZmVyLiBQYWdlIG9mZnNl
dCBhbmQgYWRkcmVzcyBwb2ludGVyIHNob3VsZAo+IC0JICogYmUgdGhlIHNhbWUgYXMgdGhlIG9u
ZSBwYXNzZWQgdG8gYW5kIHJldHVybmVkIGJ5IG1hdGNoaW5nIGNhbGwgdG8gbWFwLgo+IC0JICoK
PiAtCSAqIFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4gLQkgKi8KPiAtCXZvaWQgKCp1bm1h
cCkoc3RydWN0IGRtYV9idWYgKiwgdW5zaWduZWQgbG9uZywgdm9pZCAqKTsKPiAtCj4gIAl2b2lk
ICooKnZtYXApKHN0cnVjdCBkbWFfYnVmICopOwo+ICAJdm9pZCAoKnZ1bm1hcCkoc3RydWN0IGRt
YV9idWYgKiwgdm9pZCAqdmFkZHIpOwo+ICB9Owo+IC0tIAo+IDIuMjQuMAo+IAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
