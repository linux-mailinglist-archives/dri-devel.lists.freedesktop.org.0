Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97E4363D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E15C898FD;
	Thu, 13 Jun 2019 13:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FCB898FD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:07:15 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so31092479edr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8euqq8+yyAHM7C4c5+FQ6e4ZOvH9H9Y/u7zPPpEFQps=;
 b=NXzAKLASdsE44Q3Nh9zDTtbZGf3HdJXum5ELDiL6wEfnk3p5C47gsm9OJVeSfcbmhz
 ASH+G/Ypo3CDGZ3dzQ0PT+XU7ix67w4Ggbgzz5Qi+5XZg2vX7jDOOd4g4kLai2oGd+Ao
 FO4Lzx0Haw8vBlVo1cJbSxcXsWYYodXpggP/A4o/2LhHKeOBqk4OruXmaZAHXOkL4+o5
 FO/OYc9x8eeOAJD4aEC9PqUtZiuevP1ImJbQUMbyZwjX59E4OGRIcYo1cg79O6b8q6jU
 ++l7/XOmFeq8/G39fzWXRFtFA/Okn6CrEQZ6/YUQe2WjrtPnN98QjWKiihnVm7biKNWL
 gu6A==
X-Gm-Message-State: APjAAAWowGTs79xdgu0rv7hZtWiyNxojM4XFWOgZv8vhUuDvAv8dzpTW
 9xy58Ox5Sa3JTZj7VQgKD/ugAA==
X-Google-Smtp-Source: APXvYqyo0br8rJcQRc//LGaHbxegUsVzZQa1rlJ4OVZv4bFlngG+iGrB4mSqGpHHPDmfBc1okJv3Eg==
X-Received: by 2002:aa7:c5d6:: with SMTP id h22mr22587022eds.8.1560431233842; 
 Thu, 13 Jun 2019 06:07:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u15sm893264edi.10.2019.06.13.06.07.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 06:07:13 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:07:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH 2/3] drm/vkms: stop generating CRCs on buffer overflow
Message-ID: <20190613130711.GL23020@phenom.ffwll.local>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
 <20190613121802.2193-2-oleg.vasilev@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613121802.2193-2-oleg.vasilev@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8euqq8+yyAHM7C4c5+FQ6e4ZOvH9H9Y/u7zPPpEFQps=;
 b=D9I5Tae+AI3wTuOZWjeG78UEEs2pT78OwgUDtu1ZFYtgsPq/mYBA1EpygTNmiy7eao
 i6h+J/0UpQtw+5dNpPBu++MkTCRTT3GvXsz6O4tKtTdlQcFb+Clqwp2IPu3HBdK6f5di
 Qb1P9xTk8oajx7NbTXINbu4xHDUTNX8SsNfLQ=
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6MTg6MDFQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdy
b3RlOgo+IEJlY2F1c2UgaW50ZXJydXB0cyBhcmUgZ2VuZXJhdGVkIGFydGlmaXRpYWxseSwga2Vy
bmVsIGJ1ZyBtYXkgbGVhZCB0bwo+IGluZmludGUgYXR0ZW1wdHMgdG8gc3VibWl0IENSQy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMgfCAxMCArKysrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfY3JjLmMKPiBpbmRleCBkN2I0MDlhM2MwZjguLmJjNzE3YTg4ODhiNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYwo+IEBAIC0xNjcsNiArMTY3LDcgQEAgdm9pZCB2a21z
X2NyY193b3JrX2hhbmRsZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAl1MzIgY3JjMzIg
PSAwOwo+ICAJdTY0IGZyYW1lX3N0YXJ0LCBmcmFtZV9lbmQ7Cj4gIAl1bnNpZ25lZCBsb25nIGZs
YWdzOwo+ICsJaW50IHJldDsKPiAgCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmb3V0LT5zdGF0ZV9s
b2NrLCBmbGFncyk7Cj4gIAlmcmFtZV9zdGFydCA9IGNydGNfc3RhdGUtPmZyYW1lX3N0YXJ0Owo+
IEBAIC0yMDIsNyArMjAzLDE0IEBAIHZvaWQgdmttc19jcmNfd29ya19oYW5kbGUoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQo+ICAJICogbWlzc2luZyBmcmFtZXMKPiAgCSAqLwo+ICAJd2hpbGUg
KGZyYW1lX3N0YXJ0IDw9IGZyYW1lX2VuZCkKPiAtCQlkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KGNy
dGMsIHRydWUsIGZyYW1lX3N0YXJ0KyssICZjcmMzMik7Cj4gKwl7CgpCaWtlc2hlZDogS2VybmVs
IGNvZGluZ3N0eWxlIHB1dHMgdGhpcyBvbiB0aGUgc2FtZSBsaW5lIGFzIHRoZSBjbG9zaW5nICkK
b2YgdGhlIHdoaWxlL2lmL2Zvci4KCkFzaWRlIGZyb20gdGhhdCBub3Qgc3VyZSB0aGF0J3MgdXNl
ZnVsIGhlcmUsIHdlJ3ZlIGZpeGVkIHRoZSBidWcgYnkgbm93Ci4uLgotRGFuaWVsCgo+ICsJCXJl
dCA9IGRybV9jcnRjX2FkZF9jcmNfZW50cnkoY3J0YywgdHJ1ZSwgZnJhbWVfc3RhcnQrKywgJmNy
YzMyKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCURSTV9XQVJOKCJWS01TIHN0b3AgZ2VuZXJhdGlu
ZyBDUkNzXG4iKTsKPiArCQkJb3V0LT5jcmNfZW5hYmxlZCA9IGZhbHNlOwo+ICsJCQlicmVhazsK
PiArCQl9Cj4gKwl9Cj4gIAo+ICBvdXQ6Cj4gIAkvKiB0byBhdm9pZCB1c2luZyB0aGUgc2FtZSB2
YWx1ZSBmb3IgZnJhbWUgbnVtYmVyIGFnYWluICovCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
