Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E418C2C90D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822346E8FB;
	Mon, 30 Nov 2020 22:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819AC6E8FB;
 Mon, 30 Nov 2020 22:18:48 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e105so895550ote.5;
 Mon, 30 Nov 2020 14:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fa2/8Ci4xxzQgPpzblIpuZWOOQWDWwEoKG3A0meA3jA=;
 b=PV/B6n8yvOYcyf7wJKlL+Eb8wXVZq3DHArWxHUlRCN3HMm1d/q09v5FMBWbibWzrqq
 8ZDjWTpP9bzG2Mwv44PZ76GCOYi7P7/4m2lqhdibxMcV99qu+x/JbAaiLdgTINrkyWki
 5+7cT9WvHXjVdVW5j1XvHUoLRyB58uKi+F1gMX1i8y2lb6ntUYkzpE1vO+wpIgMFammt
 BBWfLTbp1l0MwMMctfCSfahUSiCAYOOoFs8tFd7Alnny/6mjOLiPxOMo/eP0AGRgjoK9
 h8+H4jM8+BP0ADW7NQwaWV2U6esy19bkdVNMbtigTLSpy9PymNUwtKivP5fLMdBMunrx
 Exyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fa2/8Ci4xxzQgPpzblIpuZWOOQWDWwEoKG3A0meA3jA=;
 b=fTr17cF14srk/3DNNxMEn9AL4bJofKXaXHc5fjyBNc/E4ufDKE+pJeCfx+m/P3Qm44
 XdlFb1O2T7iWxABXD4cTlMNn0k1uaOiGqo9ko02PuiFMBCumu89VN0sguMpPKwDlCWqi
 USR2l6dfCmDQIuOu7qL1VTAmznByS9SL7vY+z9yVI8B8xO96rZSXt0co38rSI5u+teLE
 VHJSD/Zwt5jExlCZLmmNSa8a9XHExvqEvCrP6RgzMmhzAyHT79GrjqeM1uQintA6OhoT
 7a4WmPnqakxmCgyeKGDHQBx68Zsgw2cJUK2RUGgr06Lx1eods3OXGphO+5N0QczDwfLl
 2KZA==
X-Gm-Message-State: AOAM533zRCywgUWy0fXaP2zfE7Ks4YZamWlB1o3PGVr7+qarbYG2fd9i
 zBVhQaMElgzXBXhKT9V0RXmXY9GChOylvvfrjgHy4cQo
X-Google-Smtp-Source: ABdhPJyYustfZfZl7BLQkBh0ByhfaBrekSB0Y+9Ti6o+YIXL+LHrA4K+GmLqB4BN7E9+McG+pO2SI0wVg6XdMdk/SRo=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18736439otg.311.1606774727965; 
 Mon, 30 Nov 2020 14:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-16-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:18:36 -0500
Message-ID: <CADnq5_OfkE7H9dsurRiFb8Y3XkCHwcK0zBMCYnNTz0KK_ihr0Q@mail.gmail.com>
Subject: Re: [PATCH 15/40] drm/amd/amdgpu/gfx_v8_0: Functions must follow
 directly after their headers
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmM6MzY5
ODogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVzY3JpcHRpb24g
aW4gJ0RFRkFVTFRfU0hfTUVNX0JBU0VTJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRo
YW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8w
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCj4gaW5kZXggNWU2ZDE1ZjQ0
NTYwYS4uOWE5MDU1MzFmODM3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjhfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4
XzAuYwo+IEBAIC0zNjg3LDYgKzM2ODcsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjhfMF9zZXR1cF9y
YihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgIG11dGV4X3VubG9jaygmYWRl
di0+Z3JibV9pZHhfbXV0ZXgpOwo+ICB9Cj4KPiArI2RlZmluZSBERUZBVUxUX1NIX01FTV9CQVNF
UyAgICgweDYwMDApCj4gIC8qKgo+ICAgKiBnZnhfdjhfMF9pbml0X2NvbXB1dGVfdm1pZCAtIGdh
cnQgZW5hYmxlCj4gICAqCj4gQEAgLTM2OTUsNyArMzY5Niw2IEBAIHN0YXRpYyB2b2lkIGdmeF92
OF8wX3NldHVwX3JiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgKiBJbml0aWFsaXpl
IGNvbXB1dGUgdm1pZCBzaF9tZW0gcmVnaXN0ZXJzCj4gICAqCj4gICAqLwo+IC0jZGVmaW5lIERF
RkFVTFRfU0hfTUVNX0JBU0VTICAgKDB4NjAwMCkKPiAgc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfaW5p
dF9jb21wdXRlX3ZtaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIHsKPiAgICAgICAg
IGludCBpOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
