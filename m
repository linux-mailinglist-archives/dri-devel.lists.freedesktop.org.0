Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA8B0943
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3211C6EBD9;
	Thu, 12 Sep 2019 07:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820C6E29B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 14:01:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k13so30832751ioj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 07:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVldwPHBEEmbVAp0mqxQZ8yLS+V+O/vse0Nw9BG4UF4=;
 b=De4K2TzEDzYyttjogncw+wzyWnFkPuf9pX4yVvCQM52JSA7L76C/HJdFUckyaIRxES
 Oeq9i9LDKW1ZhUgNo6fH/TgvcPthbdAS6nhs1C/k72W15+dkxrLkNi0xPa9MYyEB4yl9
 +4WsINlEYi+9dmoWUcVmYCXt1r/BHPpw03QKUp3v9xgaF7ogzXGkBLex7fJxPGsS9g8h
 V58Rt99KU8PTGkh6JKi9D780tffmrjitg3GUOy+yyDtxhRQh/xL91q4odxqQl12xt5KN
 nYJG1dURL2oW19qsHeZu5amTuA6SbQqjh6kFDyCT01nzjkqwFY+ZQjLO74Y1R+xQyMRD
 jNaQ==
X-Gm-Message-State: APjAAAV5ZqawYsdgFc+dk1aosQMaAPaAE6D/NSfFho48zZ1wwlFdfFff
 ct2os4wL5N23IM4VyJBbUXuUCdPMA9NgvZT6xkZx2A==
X-Google-Smtp-Source: APXvYqxA0bdjqPHqQ2NueNxICWH/tLLMJq1Vz+tJAm+kZ8i8BExfLfIhffXcQQNYtvksdWYGm4ADVKWY6+G86Koreqs=
X-Received: by 2002:a05:6638:93b:: with SMTP id
 27mr1396480jak.36.1568210511727; 
 Wed, 11 Sep 2019 07:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-5-mathieu.poirier@linaro.org>
 <20190910143601.GD3362@kroah.com>
In-Reply-To: <20190910143601.GD3362@kroah.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 11 Sep 2019 08:01:40 -0600
Message-ID: <CANLsYkwkq2fLWsGXHxr2tSBLHdfe4JXgu8ehuD1FOEQeDAPNnA@mail.gmail.com>
Subject: Re: [BACKPORT 4.14.y 04/18] usb: dwc3: Allow disabling of
 metastability workaround
To: Greg KH <greg@kroah.com>
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gVldwPHBEEmbVAp0mqxQZ8yLS+V+O/vse0Nw9BG4UF4=;
 b=hBNyoV0eH/Hs1sEwCVhxj9P0JoyfQUrF0U3/ZXzz5girYAggowVoFY2+1JI1EFRFpQ
 Fjsdy0gmaNawhrBqh3dirr4WnLeBVcC85YwTMGzVZcowXPgFcVvsoCQ2eF8suXeCJVkz
 JzE011UVXk9nKhJXe1Y50RbHaKbNCH5/fiOGC5eeYN5XB9LkSZHr4wCn93Q4fqtTOCHy
 ptj6s8zn2e1a8JDLxhyaflKp/gsslZYNCH3Xqp+OJsjpf3peoaBVI2T8yCpbdH7MD6Fo
 bl/p/zPK8SVvwuHoAbYY/baFe/qYTBigkc9dQIQv9bno/q7j4HmDRzajYYWIY4yFWnXz
 WJBQ==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 "# 4 . 7" <stable@vger.kernel.org>, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBTZXAgMjAxOSBhdCAwODozNiwgR3JlZyBLSCA8Z3JlZ0Brcm9haC5jb20+IHdy
b3RlOgo+Cj4gT24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTA6MTc6NDVBTSAtMDYwMCwgTWF0aGll
dSBQb2lyaWVyIHdyb3RlOgo+ID4gRnJvbTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQHRpLmNvbT4K
PiA+Cj4gPiBjb21taXQgNDJiZjAyZWM2ZTQyMGU1NDFhZjlhNDc0MzdkMGJkZjk2MWNhMjk3MiB1
cHN0cmVhbQo+ID4KPiA+IFNvbWUgcGxhdGZvcm1zIChlLmcuIFRJJ3MgRFJBNyBVU0IyIGluc3Rh
bmNlKSBoYXZlIG1vcmUgdHJvdWJsZQo+ID4gd2l0aCB0aGUgbWV0YXN0YWJpbGl0eSB3b3JrYXJv
dW5kIGFzIGl0IHN1cHBvcnRzIG9ubHkKPiA+IGEgSGlnaC1TcGVlZCBQSFkgYW5kIHRoZSBQSFkg
Y2FuIGVudGVyIGludG8gYW4gRXJyYXRpYyBzdGF0ZSBbMV0KPiA+IHdoZW4gdGhlIGNvbnRyb2xs
ZXIgaXMgc2V0IGluIFN1cGVyU3BlZWQgbW9kZSBhcyBwYXJ0IG9mCj4gPiB0aGUgbWV0YXN0YWJp
bGl0eSB3b3JrYXJvdW5kLgo+ID4KPiA+IFRoaXMgY2F1c2VzIHVwdG8gMiBzZWNvbmRzIGRlbGF5
IGluIGVudW1lcmF0aW9uIG9uIERSQTcncyBVU0IyCj4gPiBpbnN0YW5jZSBpbiBnYWRnZXQgbW9k
ZS4KPiA+Cj4gPiBJZiB0aGVzZSBwbGF0Zm9ybXMgY2FuIGJlIGJldHRlciBvZmYgd2l0aG91dCB0
aGUgd29ya2Fyb3VuZCwKPiA+IHByb3ZpZGUgYSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSB0byBzdWdn
ZXN0IHRoYXQgc28gdGhlIHdvcmthcm91bmQKPiA+IGlzIGF2b2lkZWQuCj4gPgo+ID4gWzFdIERl
dmljZSBtb2RlIGVudW1lcmF0aW9uIHRyYWNlIHNob3dpbmcgUEhZIEVycmF0aWMgRXJyb3IuCj4g
PiAgICAgIGlycS85MC1kd2MzLTk2OSAgIFswMDBdIGQuLi4gICAgNTIuMzIzMTQ1OiBkd2MzX2V2
ZW50OiBldmVudCAoMDAwMDA5MDEpOiBFcnJhdGljIEVycm9yIFtVMF0KPiA+ICAgICAgaXJxLzkw
LWR3YzMtOTY5ICAgWzAwMF0gZC4uLiAgICA1Mi41NjA2NDY6IGR3YzNfZXZlbnQ6IGV2ZW50ICgw
MDAwMDkwMSk6IEVycmF0aWMgRXJyb3IgW1UwXQo+ID4gICAgICBpcnEvOTAtZHdjMy05NjkgICBb
MDAwXSBkLi4uICAgIDUyLjc5ODE0NDogZHdjM19ldmVudDogZXZlbnQgKDAwMDAwOTAxKTogRXJy
YXRpYyBFcnJvciBbVTBdCj4KPiBEb2VzIHRoZSBEVCBhbHNvIG5lZWQgdG8gZ2V0IHVwZGF0ZWQg
d2l0aCB0aGlzIG5ldyBpZCBmb3IgdGhpcz8gIElzIHRoYXQKPiBhIHNlcGFyYXRlIHBhdGNoIHNv
bWV3aGVyZT8KClRoZSB1cHN0cmVhbSBjb21taXQgaXM6CgpiOGM5YzZmYTIwMDIgQVJNOiBkdHM6
IGRyYTc6IERpc2FibGUgVVNCIG1ldGFzdGFiaWxpdHkgd29ya2Fyb3VuZCBmb3IgVVNCMgoKU2hv
dWxkIEkganVzdCBzZW5kIHRoZSBsYXR0ZXIgb3IgeW91IHByZWZlciBhIHJlc2VuZCB3aXRoIGJv
dGggcGF0Y2hlcz8KClRoYW5rcywKTWF0aGlldQoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
