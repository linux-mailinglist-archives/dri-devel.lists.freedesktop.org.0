Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C092B523D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085266EA67;
	Mon, 16 Nov 2020 20:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D46EA65;
 Mon, 16 Nov 2020 20:16:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so20216044wru.6;
 Mon, 16 Nov 2020 12:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iLPALqEQiM6jDL+mCkTNxXZv8QcvmWDHOLkPd8CS1b4=;
 b=Ta2D67qLLEYrg8GhEch6dOd4yTiw339hDecmpbTuQ86ZWBZIUrFU9RwWoKwWkuaUJ2
 EBeTYbQJ+07LB+0HcvYBhK1aVtG7fV5H8Yj4Hdt8lUO6kqPaTuvSmiD1WT/VNTej2tO+
 naWC3eqj+4qhIUBEnt4rEkO81zDhUT6MdOiE3WQKC9HxYXuckd8sIypF8fHkDGwc6KNF
 ggtNG6qbwtm2VCvTUPoxyYWYkmouZkLA4uq8GR9pcjrkXp0j9/1aihukqm4mw3K8jEWZ
 EAr4lNNc4fChcTwpLyPs+mdhfUw46Mvh8u9BcSKVgBJP2SCSkxtQjkgJ7CapaIbL3pBU
 9dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iLPALqEQiM6jDL+mCkTNxXZv8QcvmWDHOLkPd8CS1b4=;
 b=e4fBUXcr5anQ7tMEjrh/e0g8xs8PvQEbdjw2Cdgm+v/1X29ZpRwgdcO1/hW8kqZ5Nb
 FkG8GGVaB15+SAapAy8/8qU8zZ+0rug1/1yNfUYhRYKBGdsOB4csoQqs1vK0aVGHHA9F
 eWMEQRG/EqaNRrUQuN/Rsdq82an2gaXDcuBEQBpBmsj7/RMeGLnTUke5UmemiZ5rSoaW
 q0+y3cFo+2nI345fdJW0zRqnX5aIZDj+O/YZYcds0OMApXlYNIkQDpJDKCU6Yw4S4wSt
 BI/LzyyQS05AA5adjqAQ+k+ETRtGqtJCXXyY+/BvVZI7LXbshiKFT1M7A9zhDMxrHeK7
 M+8g==
X-Gm-Message-State: AOAM531yz43rT4TboHhNDTX/H76J4045rciuWaiEYGKly0tYWxpMudfn
 JSIrXYe7GUrBwKwajFxG1PdqDZsRZjN/C4n3BG8=
X-Google-Smtp-Source: ABdhPJwUchvyXjzuMjKCjVfeAtTXUEDmkr0D32kySo0C2GRIt0OX31+iccB6sYoBnE5gShhRlMi4jZ1soDLk9E8ziJo=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr21055026wru.362.1605557816070; 
 Mon, 16 Nov 2020 12:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-24-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-24-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:16:45 -0500
Message-ID: <CADnq5_P_S4sXJzof9_mWAAAVzqBqSBYwtyUeDpLqgbWSz7Dw4g@mail.gmail.com>
Subject: Re: [PATCH 23/43] drm/radeon/evergreen_dma: Move
 'evergreen_gpu_check_soft_reset()'s prototype to shared header
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jOjM4MjU6
NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhldmVyZ3JlZW5fZ3B1X2No
ZWNrX3NvZnRfcmVzZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAzODI1IHwgdTMyIGV2
ZXJncmVlbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikK
PiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBs
aWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVy
Z3JlZW4uaCAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fZG1h
LmMgfCAzICstLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5o
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaAo+IGluZGV4IDMwYzljYTk5Y2Vk
OTAuLmViNDZhYzc3NzY5NTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9l
dmVyZ3JlZW4uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmgKPiBA
QCAtNDcsNSArNDcsNiBAQCBpbnQgc3Vtb19ybGNfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7Cj4gIHZvaWQgZXZlcmdyZWVuX2dwdV9wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KTsKPiAgdTMyIGV2ZXJncmVlbl9nZXRfbnVtYmVyX29mX2RyYW1fY2hh
bm5lbHMoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICB2b2lkIGV2ZXJncmVlbl9wcmlu
dF9ncHVfc3RhdHVzX3JlZ3Moc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICt1MzIgZXZl
cmdyZWVuX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsK
Pgo+ICAjZW5kaWYgICAgICAgICAgICAgICAgICAgICAgICAgLyogX19SQURFT05fRVZFUkdSRUVO
X0hfXyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9k
bWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5jCj4gaW5kZXggNzY3
ODU3ZDRhOGM1Yy4uNTJjNzlkYTFlY2Y1NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2V2ZXJncmVlbl9kbWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2RtYS5jCj4gQEAgLTI0LDEwICsyNCw5IEBACj4KPiAgI2luY2x1ZGUgInJhZGVvbi5o
Igo+ICAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIKPiArI2luY2x1ZGUgImV2ZXJncmVlbi5oIgo+
ICAjaW5jbHVkZSAiZXZlcmdyZWVuZC5oIgo+Cj4gLXUzMiBldmVyZ3JlZW5fZ3B1X2NoZWNrX3Nv
ZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IC0KPiAgLyoqCj4gICAqIGV2
ZXJncmVlbl9kbWFfZmVuY2VfcmluZ19lbWl0IC0gZW1pdCBhIGZlbmNlIG9uIHRoZSBETUEgcmlu
Zwo+ICAgKgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
