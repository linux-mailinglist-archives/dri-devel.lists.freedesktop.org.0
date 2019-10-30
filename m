Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0047E9DCA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 15:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FBD6EA50;
	Wed, 30 Oct 2019 14:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1036EA50
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 14:44:33 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id p6so2811857iod.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 07:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v69E/vAISH85pBxwVE2N7vhsH75pOHxu/fxiGY0QbeQ=;
 b=TcbG3lK5PwA0UX21d+VBoj26iMGmn2sTdEpwQ70nY8sc9dxd+FDrYL8xlHDoWrxZlO
 9N8PU/lW9ZB1jZQECN7bLzpWI4qvBY/5aglqYJBvMVLNCso+ZMXrEygwW4OKExYpfDe1
 tHFzqaKrBNPemOP1saJ2lpq/VsZh9FmdPfmx3jmSubYPQiA0EQa5RW14w0avCvGPZx6b
 IqktQs5Uq5Ho9zoeOV5UHwxeHQrLEF9RTlkQhQ7pDO37D/SWu42fEJ7ssvqzRGBJNnvg
 wpVRjA3vQ9MFtIpbfaY4D7WY6i6EzF3N5JqCIpNkAz9HiHZtiSIDuBU+HXg4E6XACvOb
 z7Rw==
X-Gm-Message-State: APjAAAV9GE8lMw3NaHCdbjlUSwtQ/rVHvAGSiAVVyzzYFqXWRqbOP0H7
 DgMUV8dZX47wKx6YE404MHZYo9zViUPtVWIairR1vQ==
X-Google-Smtp-Source: APXvYqz9ISkB3eGeL8FfMvO09xLvJ4YONlu+FugWEIXfRPeSrJQJUmxiQL8wy/pNoaUViiXqYAOHQtwSg3lnrA2NftI=
X-Received: by 2002:a5e:9245:: with SMTP id z5mr87806iop.205.1572446672018;
 Wed, 30 Oct 2019 07:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Oct 2019 09:44:20 -0500
Message-ID: <CAHCN7xJ-1b_OHXy_u8TvA5i4PuWGbci6YN3x1hUY_UaLxzu+QQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v69E/vAISH85pBxwVE2N7vhsH75pOHxu/fxiGY0QbeQ=;
 b=jXjnRC/x0AeJB/QbSDoglLlI2mM7uoL59nA1SheOa24mpXYHVbx8ZGru91eHCOC5yI
 SJ7vwR86I0EES8IlDT4BmaDC+tPi6otXqTk+VUUQQiYLCsCmtehR0jpFweGy7EDkdets
 kUr2diEZfOmYvdliAUEOSVoTxDU+45JBI8xWqBWSRt8bxMK3LKc3fYZojC1uHE/Tlz9N
 E8KOg3JZclRFc4rXl5LP83vK/QrmmmBVQp2o5mTvTyDf+dX3WPd4887MZPG8Yc7xsuco
 oiVncDPY0nb1HmJ49VrFGHGIqvmcCr3BsVmxsXtwQYePRzEYveNrwfqIWRbnMbe3Rv8Z
 S82w==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgODo1MiBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBQcmV2aW91c2x5LCB0aGVyZSB3YXMgYW4gb21hcCBwYW5lbC1kcGkg
ZHJpdmVyIHRoYXQgd291bGQKPiByZWFkIGdlbmVyaWMgdGltaW5ncyBmcm9tIHRoZSBkZXZpY2Ug
dHJlZSBhbmQgc2V0IHRoZSBkaXNwbGF5Cj4gdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2
ZXIgd2FzIHJlbW92ZWQgc28gdGhlIHNjcmVlbgo+IG5vIGxvbmdlciBmdW5jdGlvbnMuICBUaGlz
IHBhdGNoIG1vZGlmaWVzIHRoZSBwYW5lbC1zaW1wbGUKPiBmaWxlIHRvIHNldHVwIHRoZSB0aW1p
bmdzIHRvIHRoZSBzYW1lIHZhbHVlcyBwcmV2aW91c2x5IHVzZWQuCj4KPiBGaXhlczogOGJmNGIx
NjIxMTc4ICgiZHJtL29tYXA6IFJlbW92ZSBwYW5lbC1kcGkgZHJpdmVyIikKPgoKV2lsbCB0aGlz
IGJlIGFibGUgdG8gbWFrZSBpdCBpbnRvIGxpbnV4LW5leHQgZm9yIHRoZSA1LjUgbWVyZ2Ugd2lu
ZG93PwogSSBiZWxpZXZlIFRvbnkgaGFzIHBpY2tlZCB1cCB0aGUgZGV2aWNlIHRyZWUgcG9ydGlv
biBpbiBoaXMgb21hcAp0cmVlLCBidXQgSSBoYXZlbid0IHNlZW4gYW55IG5vdGlmaWNhdGlvbnMg
b24gdGhpcyBzZXJpZXMgb24gd2hldGhlcgpvciBub3QgaXQncyBiZWluZyBhcHBsaWVkLiAgSSBh
bHNvIGRvbid0IGtub3cgd2hpY2ggdHJlZSBJIG5lZWQgdG8KbG9vayBpZiBpdCdzIGFscmVhZHkg
YmVlbiBhcHBsaWVkLgoKVGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBhIHdoaWxl
IGFnbyB3aGVyZSB0aGUgZHJpdmVyIEkgd2FzCnVzaW5nIGZvciB0aGUgZGlzcGxheSB3YXMgcmVt
b3ZlZC4KCnRoYW5rIHlvdSwKCmFkYW0KCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPiAtLS0KPiBWNTogIE5vIENoYW5nZQo+IFY0OiAgTm8gQ2hhbmdlCj4gVjM6ICBObyBD
aGFuZ2UKPiBWMjogIE5vIENoYW5nZQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
Ywo+IGluZGV4IDVkNDg3Njg2ZDI1Yy4uNzJmNjk3MDlmMzQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYwo+IEBAIC0yMDYxLDYgKzIwNjEsNDAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1pdHN1YmlzaGlfYWEwNzBtYzAxX21vZGUgPSB7Cj4g
ICAgICAgICAuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZT
WU5DLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsb2dp
Y3BkX3R5cGVfMjhfbW9kZSA9IHsKPiArICAgICAgIC5jbG9jayA9IDkwMDAsCj4gKyAgICAgICAu
aGRpc3BsYXkgPSA0ODAsCj4gKyAgICAgICAuaHN5bmNfc3RhcnQgPSA0ODAgKyAzLAo+ICsgICAg
ICAgLmhzeW5jX2VuZCA9IDQ4MCArIDMgKyA0MiwKPiArICAgICAgIC5odG90YWwgPSA0ODAgKyAz
ICsgNDIgKyAyLAo+ICsKPiArICAgICAgIC52ZGlzcGxheSA9IDI3MiwKPiArICAgICAgIC52c3lu
Y19zdGFydCA9IDI3MiArIDIsCj4gKyAgICAgICAudnN5bmNfZW5kID0gMjcyICsgMiArIDExLAo+
ICsgICAgICAgLnZ0b3RhbCA9IDI3MiArIDIgKyAxMSArIDMsCj4gKyAgICAgICAudnJlZnJlc2gg
PSA2MCwKPiArICAgICAgIC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVf
RkxBR19QVlNZTkMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
bG9naWNwZF90eXBlXzI4ID0gewo+ICsgICAgICAgLm1vZGVzID0gJmxvZ2ljcGRfdHlwZV8yOF9t
b2RlLAo+ICsgICAgICAgLm51bV9tb2RlcyA9IDEsCj4gKyAgICAgICAuYnBjID0gOCwKPiArICAg
ICAgIC5zaXplID0gewo+ICsgICAgICAgICAgICAgICAud2lkdGggPSAxMDUsCj4gKyAgICAgICAg
ICAgICAgIC5oZWlnaHQgPSA2NywKPiArICAgICAgIH0sCj4gKyAgICAgICAuZGVsYXkgPSB7Cj4g
KyAgICAgICAgICAgICAgIC5wcmVwYXJlID0gMjAwLAo+ICsgICAgICAgICAgICAgICAuZW5hYmxl
ID0gMjAwLAo+ICsgICAgICAgICAgICAgICAudW5wcmVwYXJlID0gMjAwLAo+ICsgICAgICAgICAg
ICAgICAuZGlzYWJsZSA9IDIwMCwKPiArICAgICAgIH0sCj4gKyAgICAgICAuYnVzX2Zvcm1hdCA9
IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCj4gKyAgICAgICAuYnVzX2ZsYWdzID0gRFJNX0JV
U19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdFIHwKPiAr
ICAgICAgICAgICAgICAgICAgICBEUk1fQlVTX0ZMQUdfU1lOQ19EUklWRV9ORUdFREdFLAo+ICt9
Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIG1pdHN1YmlzaGlfYWEwNzBt
YzAxID0gewo+ICAgICAgICAgLm1vZGVzID0gJm1pdHN1YmlzaGlfYWEwNzBtYzAxX21vZGUsCj4g
ICAgICAgICAubnVtX21vZGVzID0gMSwKPiBAQCAtMzI4Nyw2ICszMzIxLDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKPiAgICAgICAg
IH0sIHsKPiAgICAgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibGcsbHAxMjlxZSIsCj4gICAg
ICAgICAgICAgICAgIC5kYXRhID0gJmxnX2xwMTI5cWUsCj4gKyAgICAgICB9LCB7Cj4gKyAgICAg
ICAgICAgICAgIC5jb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IiwKPiArICAgICAgICAgICAg
ICAgLmRhdGEgPSAmbG9naWNwZF90eXBlXzI4LAo+ICAgICAgICAgfSwgewo+ICAgICAgICAgICAg
ICAgICAuY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMDcwbWMwMS1jYTEiLAo+ICAgICAgICAg
ICAgICAgICAuZGF0YSA9ICZtaXRzdWJpc2hpX2FhMDcwbWMwMSwKPiAtLQo+IDIuMTcuMQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
