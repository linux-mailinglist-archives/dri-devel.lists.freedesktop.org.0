Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971314EBF4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EF6E8DE;
	Fri, 21 Jun 2019 15:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BDD6E8DE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:27:16 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r6so6691188oti.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/y2umFI+hLi0gqB/rGAubbWLUwkck+57yGiyeuQgSY=;
 b=f5/HWBW09uq3wggv/OrotHJqbAAnhxmrMVWldFM4JQ5p8tdjYjlJhTDuY8J6Rh9pJb
 N5+0C/Htb3/hdwbucrnsjQZrbiYggNdubJUViUhfOlbg+Kwy5NU8VD3fXmJmV+xLGHDT
 GwV/5UIVVKvcS3dqMFUnn7+7onsTsUZIBt2HZbtpFEiWGmjYOsC4K0puVXWSYbxrr1AV
 aCQYDq+5aojdbKH7QUL6J/ARGtXV31cEsp6ZcqPMKA69p+HpB2dwaOXdvgaXV4kQKDEm
 aGds9rVVIEdSgp4/tHSHiOIi8+VKWixI1zi82n6VVkZTk14w7Q6eXlV6/3iIsXRF4DEi
 N4fg==
X-Gm-Message-State: APjAAAVEoduSqAdFKVSi1URpjMZ7Rch/vfoAK6BPIjWiKbjDhx/Wfrmk
 VtmdPefxm/KoZVXxoIBKK2Og/yyQ3bVMWmnziE0Cyg==
X-Google-Smtp-Source: APXvYqwgOEf24UbMQB0qb7e97wfqsZUAngBWilMHIaq7tVmIYhrhEDo0c+FZY4p3gcRnoOqR3Rxglb8FloyZTHfS6Uo=
X-Received: by 2002:a9d:4b95:: with SMTP id k21mr6328797otf.281.1561130835867; 
 Fri, 21 Jun 2019 08:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
In-Reply-To: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Jun 2019 17:27:00 +0200
Message-ID: <CAKMK7uEjh+GrSy5AgbVLVQd1S5oJ8KFiWEUmxtMMVdcMSBtdCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
To: Raymond Smith <Raymond.Smith@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r/y2umFI+hLi0gqB/rGAubbWLUwkck+57yGiyeuQgSY=;
 b=IckKuSoiNlAN+R3Z7KagwwSqiMULpfnyYjhGFqV3B10qOS3tAz5qWzbravJhLfm7Nn
 MBM47QBtmecN/B9H/8yM571Y8ymLkyQDWRh8HrG5CiN4gKyxfKwjuhVrpgLPKjtkGOwl
 Qu3S509r9QsAZGUnh9qhM/im3oxrR62oXDIJw=
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "yuq825@gmail.com" <yuq825@gmail.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MjEgUE0gUmF5bW9uZCBTbWl0aCA8UmF5bW9uZC5T
bWl0aEBhcm0uY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2
X0JMT0NLX1VfSU5URVJMRUFWRUQgbW9kaWZpZXIgdG8KPiBkZW5vdGUgdGhlIDE2eDE2IGJsb2Nr
IHUtaW50ZXJsZWF2ZWQgZm9ybWF0IHVzZWQgaW4gQXJtIFV0Z2FyZCBhbmQKPiBNaWRnYXJkIEdQ
VXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXltb25kIFNtaXRoIDxyYXltb25kLnNtaXRoQGFybS5j
b20+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTAgKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmgKPiBpbmRleCAzZmVlYWEzLi44ZWQ3ZWNmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBA
QCAtNzQzLDYgKzc0MywxNiBAQCBleHRlcm4gIkMiIHsKPiAgI2RlZmluZSBBRkJDX0ZPUk1BVF9N
T0RfQkNIICAgICAoMVVMTCA8PCAxMSkKPgo+ICAvKgo+ICsgKiBBcm0gMTZ4MTYgQmxvY2sgVS1J
bnRlcmxlYXZlZCBtb2RpZmllcgo+ICsgKgo+ICsgKiBUaGlzIGlzIHVzZWQgYnkgQXJtIE1hbGkg
VXRnYXJkIGFuZCBNaWRnYXJkIEdQVXMuIEl0IGRpdmlkZXMgdGhlIGltYWdlCj4gKyAqIGludG8g
MTZ4MTYgcGl4ZWwgYmxvY2tzLiBCbG9ja3MgYXJlIHN0b3JlZCBsaW5lYXJseSBpbiBvcmRlciwg
YnV0IHBpeGVscwo+ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiArICovCj4gKyNk
ZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgXAo+ICsg
ICAgICAgZm91cmNjX21vZF9jb2RlKEFSTSwgKCgxVUxMIDw8IDU1KSB8IDEpKQoKVGhpcyBzZWVt
cyB0byBiZSBhbiBleHRyZW1lbHkgcmFuZG9tIHBpY2sgZm9yIGEgbmV3IG51bWJlci4gV2hhdCdz
IHRoZQp0aGlua2luZyBoZXJlPyBBc2lkZSBmcm9tICJkb2VzbnQgbWF0Y2ggYW55IG9mIHRoZSBh
ZmJjIGNvbWJvcyIgb2ZjLgpJZiB5b3UncmUgYWxyZWFkeSB1cCB0byBoYXZpbmcgdGhyb3duIGF3
YXkgNTViaXRzLCB0aGVuIGl0J3Mgbm90IGdvaW5nCnRvIGxhc3QgbG9uZyByZWFsbHkgOi0pCgpJ
IHRoaW5rIGEgZ29vZCBpZGVhIHdvdWxkIGJlIHRvIHJlc2VydmUgYSBidW5jaCBvZiB0aGUgaGln
aCBiaXRzIGFzCnNvbWUgZm9ybSBvZiBpbmRleCAoYWZiYyB3b3VsZCBnZXQgaW5kZXggMCBmb3Ig
YmFja3dhcmRzIGNvbXBhdCkuIEFuZAp0aGVuIHRoZSBsb3dlciBiaXRzIHdvdWxkIGJlIGZvciBm
cmVlIHVzZSBmb3IgYSBnaXZlbiBpbmRleC9tb2RlLiBBbmQKdGhlIGZpcnN0IG1vZGUgaXMgcHJv
YmFibHkgYW4gZW51bWVyYXRpb24sIHdoZXJlIHBvc3NpYmxlIG1vZGVzIHNpbXBsZQpnZXQgZW51
bWVyYXRlZCB3aXRob3V0IGZ1cnRoZXIgZmxhZ3Mgb3IgYW55dGhpbmcuCgpUaGUgb3RoZXIgYml0
OiBXb3VsZCBiZSByZWFsIGdvb2QgdG8gZGVmaW5lIHRoZSBmb3JtYXQgYSBiaXQgbW9yZQpwcmVj
aXNlbHksIGluY2x1ZGluZyB0aGUgbGF5b3V0IHdpdGhpbiB0aGUgdGlsZS4KCkFsc28gb2ZjIG5l
ZWRzIGFja3MgZnJvbSBsaW1hL3BhbmZyb3N0IHBlb3BsZSBzaW5jZSBJIGFzc3VtZSB0aGV5J2xs
CmJlIHVzaW5nIHRoaXMsIHRvby4KClRoYW5rcywgRGFuaWVsCgo+ICsKPiArLyoKPiAgICogQWxs
d2lubmVyIHRpbGVkIG1vZGlmaWVyCj4gICAqCj4gICAqIFRoaXMgdGlsaW5nIG1vZGUgaXMgaW1w
bGVtZW50ZWQgYnkgdGhlIFZQVSBmb3VuZCBvbiBhbGwgQWxsd2lubmVyIHBsYXRmb3JtcywKPiAt
LQo+IDIuNy40Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
