Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A42C2C75
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264666E491;
	Tue, 24 Nov 2020 16:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D886E483;
 Tue, 24 Nov 2020 16:13:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so3443718wme.1;
 Tue, 24 Nov 2020 08:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qzYhP0b8ID3iThkWEoh3xFX/9VMn9nUYQ9ogFepHOHY=;
 b=TuQ0t9ZpKW4ggOGRiqM9dTnIH/lHkFnZhAF6uzm4dmBuQvOoa37WzbapO/5xtoLSkz
 zSVFoquDpoF8/3bSA3Zk7821O8rQHPeYblUsu2BGcMBmkWmX/aoNXNbtxN15GprgAPrh
 GjzCvfYT111CGrRk9Qh6cd04WWvw2KiGVMFQDTf/Y6khAlN4xCJKzqsn56333RzQ+VEQ
 Z6liRVkUclidNgKbEnh0N7IOFIZrt3JQtV6cenOM5d9NCG9hqmVx9mvSi08cStSCYRy1
 GQOLtAnZ2AIjSSlBCiAMTtzzvBmyyUXjN+rJ/ZW9ANS1l9hIpm7MMfCwJ484fhdwVL9v
 kdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qzYhP0b8ID3iThkWEoh3xFX/9VMn9nUYQ9ogFepHOHY=;
 b=PXjmFaAe8d4UcHbbeSNjylXGDNchc6ZPcX4EzU2HxWXuKLqwT16IzWtTBd8Qvto8SB
 Z6IQmY5gxAvHluzyWcenDdlRTeTDKDbisZkvn4s/FZFi05Q2rGkTo09KDHgKLbngpYjS
 0cBBSOcAoRBfn2DtWszAwJ0ZluCNqyqUnlmXtpo96rLfpz2OSQ5IGNop+3bCTS0A1Qsa
 0UVuOWfw33Eji4gVfwqpJxBUkZ6t9KzHWigfM3AeChIVAR8WKH1qBUCbD55zhwxUurMc
 bHx/lS0lPIwPgQwmtEJiRk1PVPbJZdiy84jT+YK4AfKIaAUOD2Ya98hyelsVg9oYXRB0
 TZDQ==
X-Gm-Message-State: AOAM531Te+a47gYdixD44hW6MEXNdltvDihWTJKlOri4nxve+nOlaTDo
 ev6EleHjQzqw9QNZWhCQSjpH6TYzsslhg2gTnC994fSd
X-Google-Smtp-Source: ABdhPJzeyZtAFf/J5jW+ZtF8k+WE6FDG/QuzE51jZAELAPXsmdi3+wHV8nliAKBzAjjloQOYFQfS141MEL7cbeStRP8=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr5100898wmb.39.1606234388284;
 Tue, 24 Nov 2020 08:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-26-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:12:57 -0500
Message-ID: <CADnq5_Nw3MuqV-GcAiCcUkaVPpm-wXnsQ6Y2X-aZY21AxYPYWQ@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/include/arct_ip_offset: Mark top-level
 IP_BASE definition as __maybe_unused
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

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hcmN0X3JlZ19pbml0LmM6Mjc6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2luY2x1ZGUvYXJjdF9pcF9vZmZzZXQuaDoyMjc6Mjk6IHdhcm5pbmc6IOKAmERCR1VfSU9f
QkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+
ICAyMjcgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgREJHVV9JT19CQVNFID17IHsgeyB7
IDB4MDAwMDAxRTAsIDB4MDAwMTI1QTAsIDB4MDA0MEI0MDAsIDAsIDAsIDAgfSB9LAo+ICB8IF5+
fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9pbmNsdWRlL2FyY3Rf
aXBfb2Zmc2V0Lmg6MTI3OjI5OiB3YXJuaW5nOiDigJhQQ0lFMF9CQVNF4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIDEyNyB8IHN0YXRpYyBjb25z
dCBzdHJ1Y3QgSVBfQkFTRSBQQ0lFMF9CQVNFID17IHsgeyB7IDB4MDAwMTI4QzAsIDB4MDA0MTE4
MDAsIDB4MDQ0NDAwMDAsIDAsIDAsIDAgfSB9LAo+ICB8IF5+fn5+fn5+fn4KPiAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FyY3RfcmVnX2luaXQuYzoy
NzoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hcmN0X2lwX29mZnNl
dC5oOjYzOjI5OiB3YXJuaW5nOiDigJhGVVNFX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgNjMgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQ
X0JBU0UgRlVTRV9CQVNFID17IHsgeyB7IDB4MDAwMTIwQTAsIDB4MDAwMTc0MDAsIDB4MDA0MDE0
MDAsIDAsIDAsIDAgfSB9LAo+ICB8IF5+fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQu
ICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXJj
dF9pcF9vZmZzZXQuaCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hcmN0X2lwX29mZnNldC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FyY3Rf
aXBfb2Zmc2V0LmgKPiBpbmRleCBhNzc5MWE5ZTFmOTA1Li5hZjFjNDY5OTE0MjliIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hcmN0X2lwX29mZnNldC5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FyY3RfaXBfb2Zmc2V0LmgKPiBAQCAtMjgs
MTIgKzI4LDEyIEBACj4gIHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCj4gIHsKPiAgICAgIHVuc2ln
bmVkIGludCBzZWdtZW50W01BWF9TRUdNRU5UXTsKPiAtfTsKPiArfSBfX21heWJlX3VudXNlZDsK
Pgo+ICBzdHJ1Y3QgSVBfQkFTRQo+ICB7Cj4gICAgICBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRSBp
bnN0YW5jZVtNQVhfSU5TVEFOQ0VdOwo+IC19Owo+ICt9IF9fbWF5YmVfdW51c2VkOwo+Cj4KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIEFUSFVCX0JBU0UgICAgICAgICAgICA9eyB7IHsg
eyAweDAwMDAwQzIwLCAweDAwMDEyNDYwLCAweDAwNDA4QzAwLCAwLCAwLCAwIH0gfSwKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
