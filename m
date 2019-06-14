Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1C46892
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161E891F2;
	Fri, 14 Jun 2019 20:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916A7891F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:05:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id r185so2483596iod.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5C43wu3L3N5pzf6np2Tk2w1tK+vx4ydRwvLJgDPv+o8=;
 b=gSVAmSOW7gn7Osn+7+JP3BalBTtz1gfxO50o7sCHsIoB7x649VFmgYRjuw7yGAZhg1
 MSDma/DBpAmT6hLAdt5p7+EffQKaSkshCMiiHXVfZ4I4IbPsiIKVB06A7yqcAJTJorjA
 +COyd+18CihocoVRR/Po+WW1TDryB8H5BSXJaLp3lTuRmEoqaKcpNSJcfx+h7vkel5yF
 t7YHA/9zisvdSNmVjkjqWdUBVQNu+890GjwLWYrp+25xwzIdcM7m9aiBbPMtHxjAjd3b
 FMjkWKu5dl4iJARjhcwOyG2btCtdGOnQVnpeOysQVdBlad286qI2P+wLZG6u/Kd06Umn
 v74g==
X-Gm-Message-State: APjAAAVZIowApMU8nkYCCHuMpb6LWow8EhxynsMAs5qKAx5eE8qKw2FS
 rtY7p9kwM+6lRYQD32ywcBKYkom3QcY=
X-Google-Smtp-Source: APXvYqyGKF/gj8uRKOr3Fl0j1Rw3+k+4EKt8EJp46Evd0qiTDUollGdAFhU9T5prNAaiDohUALQ2Mg==
X-Received: by 2002:a02:11c2:: with SMTP id 185mr7618362jaf.8.1560542748308;
 Fri, 14 Jun 2019 13:05:48 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id p4sm6547081iod.68.2019.06.14.13.05.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 13:05:47 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id k8so8536194iot.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:05:47 -0700 (PDT)
X-Received: by 2002:a5d:8ccc:: with SMTP id k12mr4025420iot.141.1560542746773; 
 Fri, 14 Jun 2019 13:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190613192244.5447-1-ezequiel@collabora.com>
In-Reply-To: <20190613192244.5447-1-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Jun 2019 13:05:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U84U0TaC=VUXeggCDJJNkPOJYmOL0JNT1Lf7Gecv-5Aw@mail.gmail.com>
Message-ID: <CAD=FV=U84U0TaC=VUXeggCDJJNkPOJYmOL0JNT1Lf7Gecv-5Aw@mail.gmail.com>
Subject: Re: [RFC/WIP] drm/rockchip: Support CRTC gamma LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5C43wu3L3N5pzf6np2Tk2w1tK+vx4ydRwvLJgDPv+o8=;
 b=AMP0YfPOb2jb7VFloRLdhNb04ngviheKaydxfNhvw9H6hfzRLPrkjGU9PEg9BUCkmd
 NZznbE9H/0ARo631Xkw0pUVxmRat8rBYqVXXl8UxFcQSKChFr8yLA14KEfCWjcSoZ1CY
 htcdN+RI4rTg3dbZfxOYq0AXi8Nxf/W/kQjZM=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAxMjoyMyBQTSBFemVxdWllbCBHYXJjaWEgPGV6
ZXF1aWVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gQEAgLTE3NDQsNiArMTc5Myw0MSBAQCBp
bnQgcm9ja2NoaXBfZHJtX3dhaXRfdmFjdF9lbmQoc3RydWN0IGRybV9jcnRjICpjcnRjLCB1bnNp
Z25lZCBpbnQgbXN0aW1lb3V0KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wocm9ja2NoaXBfZHJtX3dh
aXRfdmFjdF9lbmQpOwo+Cj4gK3N0YXRpYyBpbnQgdm9wX2dhbW1hX2x1dF9yZXF1ZXN0KHN0cnVj
dCBkZXZpY2UgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cmVzb3VyY2UgKnJlcywgc3RydWN0IHZvcCAqdm9wKQo+ICt7Cj4gKyAgICAgICByZXNvdXJjZV9z
aXplX3Qgb2Zmc2V0ID0gdm9wLT5kYXRhLT5nYW1tYV9sdXRfYWRkcl9vZmY7Cj4gKyAgICAgICBy
ZXNvdXJjZV9zaXplX3Qgc2l6ZSA9IFZPUF9HQU1NQV9MVVRfU0laRSAqIDQ7Cj4gKwo+ICsgICAg
ICAgLyoKPiArICAgICAgICAqIFNvbWUgU29DcyAoZS5nLiBSSzMyODgpIGhhdmUgdGhlIGdhbW1h
IExVVCBhZGRyZXNzIGFmdGVyCj4gKyAgICAgICAgKiB0aGUgTU1VIHJlZ2lzdGVycywgd2hpY2gg
bWVhbnMgd2UgY2FuJ3QgcmVxdWVzdCBhbmQgaW9yZW1hcAo+ICsgICAgICAgICogdGhlIGVudGly
ZSByZWdpc3RlciBzZXQuIE90aGVyIChlLmcuIFJLMzM5OSkgaGF2ZSBnYW1tYSBMVVQKPiArICAg
ICAgICAqIGFkZHJlc3MgYmVmb3JlIE1NVS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBUaGVy
ZWZvcmUsIHdlIG5lZWQgdG8gcmVxdWVzdCBhbmQgaW9yZW1hcCB0aG9zZSB0aGF0IGhhdmVuJ3QK
PiArICAgICAgICAqIGJlZW4gYWxyZWFkeS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHZv
cC0+bGVuID49IChvZmZzZXQgKyBzaXplKSkgewo+ICsgICAgICAgICAgICAgICB2b3AtPmx1dF9y
ZWdzID0gdm9wLT5yZWdzICsgb2Zmc2V0Owo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWRldm1fcmVxdWVzdF9tZW1fcmVnaW9uKGRldiwg
cmVzLT5zdGFydCArIG9mZnNldCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZSwgZGV2X25hbWUoZGV2KSkpIHsKPiArICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2
LCAiY2FuJ3QgcmVxdWVzdCBnYW1tYSBsdXQgcmVnaW9uXG4iKTsKPiArICAgICAgICAgICAgICAg
cmV0dXJuIC1FQlVTWTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICB2b3AtPmx1dF9yZWdzID0g
ZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCArIG9mZnNldCwgc2l6ZSk7Cj4gKyAgICAgICBp
ZiAoIXZvcC0+bHV0X3JlZ3MpIHsKPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJjYW4n
dCBpb3JlbWFwIGdhbW1hIGx1dCBhZGRyZXNzXG4iKTsKPiArICAgICAgICAgICAgICAgZGV2bV9y
ZWxlYXNlX21lbV9yZWdpb24oZGV2LCByZXMtPnN0YXJ0ICsgb2Zmc2V0LCBzaXplKTsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICB9CgpJJ20gY3VyaW91cyBoZXJl
LiAgSSB3YXMgYWx3YXlzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgeW91IHdlcmUKc3VwcG9z
ZWQgdG8gc3BlY2lmeSBhbGwgb2YgeW91ciBtZW1vcnkgcmVnaW9ucyBpbiB0aGUgZGV2aWNlIHRy
ZWUuCi4uLmJ1dCBoZXJlIHRoZSBkZXZpY2UgdHJlZSBvbiByazMyODggc2F5czoKCnZvcGI6IHZv
cEBmZjkzMDAwMCB7CiAgICBjb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzI4OC12b3AiOwogICAg
cmVnID0gPDB4MCAweGZmOTMwMDAwIDB4MCAweDE5Yz47CiAgICAuLi4KfTsKCi4uLmFuZCB3ZSdy
ZSBub3cgbWFwcGluZyA0MDk2IGJ5dGVzIHN0YXJ0aW5nIGF0IDB4ZmY5MzEwMDAuICBJcyB0aGF0
CnJlYWxseSBsZWdpdD8gIFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBwdXQgdGhpcyBleHRyYSBt
ZW1vcnkgcmFuZ2UgaW4KdGhlIGR0cz8KCkhybSwgYnV0IHRoZW4gSSBndWVzcyB5b3UgbmVlZCB0
byBmaWd1cmUgb3V0IHdoYXQgdG8gZG8gYWJvdXQgb2xkZXIKZGV2aWNlIHRyZWVzLiAgRG8geW91
IGRpc2FibGUgdGhlIGdhbW1hIExVVCBmZWF0dXJlPyAgLi4ub3IgZG8geW91IGRvCmV4YWN0bHkg
d2hhdCB0aGUgY29kZSBoZXJlIGlzIGRvaW5nIGFuZCBqdXN0IG1hcCBpdCBhbnl3YXk/ICBJIGd1
ZXNzCnlvdSBjb3VsZCBqdXN0IGtlZXAgdGhlIGNvZGUgaGVyZSAoYW5kIGl0J2xsIHdvcmsgZmlu
ZSksIGJ1dCBtYXliZSBpbgpwYXJhbGxlbCB3ZSBzaG91bGQgYWRkIGl0IHRvIHRoZSAuZHRzIGZp
bGUgYW5kIGJpbmRpbmdzPwoKLS0tCgpJIHdpbGwgc2F5IHRoYXQsIHRob3VnaCBJIGRvbid0IGtu
b3cgbXVjaCAoYW55dGhpbmc/KSBhYm91dCBnYW1tYQpMVVRzLCBJIHJhbiB0aGUgQ2hyb21lIE9T
ICJnYW1tYV90ZXN0IiBwcm9ncmFtIGFuZCBzYXcgYSBwcmV0dHkgUkdCCmdyYWRpZW50IG9uIHRo
ZSBib3RoIHRoZSBpbnRlcm5hbCBzY3JlZW4gYW5kIEhETUkgbW9uaXRvciBvbiBteQpyazMyODgt
dmV5cm9uLWplcnJ5LiAgVGh1czoKClRlc3RlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
