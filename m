Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A841D4AE5
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8CA6E139;
	Fri, 15 May 2020 10:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D996E139;
 Fri, 15 May 2020 10:28:00 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id a7so611802uak.2;
 Fri, 15 May 2020 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3n9AM9nUet+cKV+6rKTLJ2mxhROsEpoAkrE2eV2F+EI=;
 b=GBd2GeA6ataobGDg4jQ4FXSHegGNPaQOmwt2GXy5yXDDA4iYjmYrAyuXfpcqPOa5YC
 SF9w+wnW3gVanphCuwC/a4oviMWmCoXQneufhGcsnrpK5Ad0ik3r1jHO8tUXr5h1LNTz
 58e7y69b+tbJCwxalQ7E3P5ZZF80hxgfXQ6Pz+ouc8M8+xqhJyP5mL1aE/msDqlsnlNj
 0H95XbJIIBUk+cC+t4q5msndpSKxlWiQmNeJ23MscOK28PbdH7u9kpaJRqF2V4m3xHZL
 m1zPrVnnHk8NJc221dc+9pBZrYE8pk2/kHML83MaIZRvBw27+h4eO9R5Y8xIEb13e1xY
 bZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3n9AM9nUet+cKV+6rKTLJ2mxhROsEpoAkrE2eV2F+EI=;
 b=CKhUmDZwuh71TeqWCa/x+dXOQL3Cr81xBYGlZEzOP+1eiu8Jd0gTITacgp/XC1b0sW
 1sJJy83hO4wxQWtp1PQelUAnlYwSLDwgGHFNbGGAJSZaz/G88jVzuDiTgq5js2Dfgofn
 49kr2KdFDPJzOE9eJwXLlhNKMNi9To1EnuxQ6DSpCzTjJ0FhxAgTFAMWdr52Rt2wc51K
 VG4pe2vQ2cG8f8J9+Y3pS2etm/hdfiIIRIMCsX3Aq9kltkNTTdKejzOkY2EjcfKssIrj
 VXAUeZf9ycKvPCzKl8FYTa199+Zz/eiQDdMNOzhKLG3rXQe2w74eqDLDRl1VbVqVqMcw
 uIQw==
X-Gm-Message-State: AOAM531PMq/MAEU3ARWLe2iwvLO+3ISr42BwOihcBJ764XKW645Byrb0
 /qjJ6SnpAHAfUbmPS7YIw7IMaNbZ29W+cKsSG3g=
X-Google-Smtp-Source: ABdhPJwklJ5H1ic2J2YXfycgYALz3yo5uNGEUuzlAu3/5Yu2QHdMkr06dR+9Ff99k9fEmbwDkLDnmKHi4E+YFv57mes=
X-Received: by 2002:ab0:662:: with SMTP id f89mr2162219uaf.118.1589538479980; 
 Fri, 15 May 2020 03:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
 <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
 <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
 <a51cb70623c4c2441bb8df8385f56c99392b8435.camel@pengutronix.de>
In-Reply-To: <a51cb70623c4c2441bb8df8385f56c99392b8435.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 15 May 2020 12:27:48 +0200
Message-ID: <CAH9NwWc6zUvoJ0xep9zO2Ocm8BzR7nRNx9=EQuwb5DXsX-J0Zw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
To: Lucas Stach <l.stach@pengutronix.de>
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
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnIuLCAxNS4gTWFpIDIwMjAgdW0gMTI6MjQgVWhyIHNjaHJpZWIgTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+Cj4gQW0gRnJlaXRhZywgZGVuIDE1LjA1LjIwMjAsIDEy
OjEyICswMjAwIHNjaHJpZWIgUGF1bCBDZXJjdWVpbDoKPiA+IEhpIENocmlzdGlhbiwKPiA+Cj4g
PiBMZSB2ZW4uIDE1IG1haSAyMDIwIMOgIDEyOjA5LCBDaHJpc3RpYW4gR21laW5lcgo+ID4gPGNo
cmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4gPiBBbSBNby4sIDExLiBN
YWkgMjAyMCB1bSAxNDozOCBVaHIgc2NocmllYiBDaHJpc3RpYW4gR21laW5lcgo+ID4gPiA8Y2hy
aXN0aWFuLmdtZWluZXJAZ21haWwuY29tPjoKPiA+ID4gPiAgVGhlIEdDODYwIGhhcyBvbmUgR1BV
IGRldmljZSB3aGljaCBoYXMgYSAyZCBhbmQgM2QgY29yZS4gSW4gdGhpcwo+ID4gPiA+IGNhc2UK
PiA+ID4gPiAgd2Ugd2FudCB0byBleHBvc2UgcGVyZm1vbiBpbmZvcm1hdGlvbiBmb3IgYm90aCBj
b3Jlcy4KPiA+ID4gPgo+ID4gPiA+ICBUaGUgZHJpdmVyIGhhcyBvbmUgYXJyYXkgd2hpY2ggY29u
dGFpbnMgYWxsIHBvc3NpYmxlIHBlcmZtb24gZG9tYWlucwo+ID4gPiA+ICB3aXRoIHNvbWUgbWV0
YSBkYXRhIC0gZG9tc19tZXRhLiBIZXJlIHdlIGNhbiBzZWUgdGhhdCBmb3IgdGhlIEdDODYwCj4g
PiA+ID4gIHR3byBlbGVtZW50cyBvZiB0aGF0IGFycmF5IGFyZSByZWxldmFudDoKPiA+ID4gPgo+
ID4gPiA+ICAgIGRvbXNfM2Q6IGlzIGF0IGluZGV4IDAgaW4gdGhlIGRvbXNfbWV0YSBhcnJheSB3
aXRoIDggcGVyZm1vbgo+ID4gPiA+IGRvbWFpbnMKPiA+ID4gPiAgICBkb21zXzJkOiBpcyBhdCBp
bmRleCAxIGluIHRoZSBkb21zX21ldGEgYXJyYXkgd2l0aCAxIHBlcmZtb24KPiA+ID4gPiBkb21h
aW4KPiA+ID4gPgo+ID4gPiA+ICBUaGUgdXNlcnNwYWNlIGRyaXZlciB3YW50cyB0byBnZXQgYSBs
aXN0IG9mIGFsbCBwZXJmbW9uIGRvbWFpbnMgYW5kCj4gPiA+ID4gIHRoZWlyIHBlcmZtb24gc2ln
bmFscy4gVGhpcyBpcyBkb25lIGJ5IGl0ZXJhdGluZyBvdmVyIGFsbCBkb21haW5zCj4gPiA+ID4g
YW5kCj4gPiA+ID4gIHRoZWlyIHNpZ25hbHMuIElmIHRoZSB1c2Vyc3BhY2UgZHJpdmVyIHdhbnRz
IHRvIGFjY2VzcyB0aGUgZG9tYWluCj4gPiA+ID4gd2l0aAo+ID4gPiA+ICBpZCA4IHRoZSBrZXJu
ZWwgZHJpdmVyIGZhaWxzIGFuZCByZXR1cm5zIGludmFsaWQgZGF0YSBmcm9tIGRvbXNfM2QKPiA+
ID4gPiB3aXRoCj4gPiA+ID4gIGFuZCBpbnZhbGlkIG9mZnNldC4KPiA+ID4gPgo+ID4gPiA+ICBU
aGlzIHJlc3VsdHMgaW46Cj4gPiA+ID4gICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5n
IHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwCj4gPiA+ID4KPiA+ID4gPiAgT24g
c3VjaCBhIGRldmljZSBpdCBpcyBub3QgcG9zc2libGUgdG8gdXNlIHRoZSB1c2Vyc3BhY2UgZHJp
dmVyIGF0Cj4gPiA+ID4gYWxsLgo+ID4gPiA+Cj4gPiA+ID4gIFRoZSBmaXggZm9yIHRoaXMgb2Zm
LWJ5LW9uZSBlcnJvciBpcyBxdWl0ZSBzaW1wbGUuCj4gPiA+ID4KPiA+ID4gPiAgUmVwb3J0ZWQt
Ynk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gPiA+ICBUZXN0ZWQt
Ynk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gPiA+ICBGaXhlczog
ZWQxZGQ4OTliYWEzICgiZHJtL2V0bmF2aXY6IHJld29yayBwZXJmbW9uIHF1ZXJ5Cj4gPiA+ID4g
aW5mcmFzdHJ1Y3R1cmUiKQo+ID4gPiA+ICBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4g
PiA+ICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJA
Z21haWwuY29tPgo+ID4gPiA+ICAtLS0KPiA+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfcGVyZm1vbi5jIHwgMiArLQo+ID4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiAgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+ID4gPiA+ICBpbmRleCBlNjc5NWJh
ZmNiYjkuLjM1ZjcxNzFlNzc5YSAxMDA2NDQKPiA+ID4gPiAgLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+ID4gPiAgKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+ID4gPiAgQEAgLTQ1Myw3ICs0NTMsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluCj4gPiA+ID4gKnBtX2RvbWFpbihj
b25zdCBzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgIGlm
ICghKGdwdS0+aWRlbnRpdHkuZmVhdHVyZXMgJiBtZXRhLT5mZWF0dXJlKSkKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4KPiA+ID4gPiAgLSAgICAgICAg
ICAgICAgIGlmIChtZXRhLT5ucl9kb21haW5zIDwgKGluZGV4IC0gb2Zmc2V0KSkgewo+ID4gPiA+
ICArICAgICAgICAgICAgICAgaWYgKChtZXRhLT5ucl9kb21haW5zIC0gMSkgPCAoaW5kZXggLSBv
ZmZzZXQpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldCArPSBtZXRh
LT5ucl9kb21haW5zOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiA+ID4gPiAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiAgLS0KPiA+ID4gPiAgMi4yNi4yCj4g
PiA+ID4KPiA+ID4KPiA+ID4gcGluZwo+ID4KPiA+IEknbGwgbWVyZ2UgaXQgdG9tb3Jyb3cgaWYg
dGhlcmUncyBubyBmdXJ0aGVyIGZlZWRiYWNrLgo+Cj4gSHVoPyBFdG5hdml2IHBhdGNoZXMgYXJl
IGdvaW5nIHRocm91Z2ggdGhlIGV0bmF2aXYgdHJlZS4KPgo+IFdlIG5vdyBoYXZlIHR3byBkaWZm
ZXJlbnQgc29sdXRpb25zIHRvIHRoZSBzYW1lIGlzc3VlLiBJIGZpcnN0IHdhbnQgdG8KPiBkaWcg
aW50byB0aGUgY29kZSB0byBzZWUgd2h5IHR3byBkZXZlbG9wZXJzIGNhbiBnZXQgY29uZnVzZWQg
ZW5vdWdoIGJ5Cj4gdGhlIGNvZGUgdG8gY29tZSB1cCB3aXRoIHRvdGFsbHkgZGlmZmVyZW50IGZp
eGVzLgo+CgpZb3Ugd2lsbCBzZWUgdGhhdCB0aGUgc29sdXRpb25zIGFyZSBub3QgdG90YWxseSBk
aWZmZXJlbnQuIEkgcmVhbGx5IGhvcGVkIHRvCmdldCB0aGlzIGZpeGVkIGluIHRoZSA1LjcgcmVs
ZWFzZS4uIGJ1dCBJIHRoaW5rIGl0cyBub3cgdG9vIGxhdGUuCgotLSAKZ3JlZXRzCi0tCkNocmlz
dGlhbiBHbWVpbmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWluZXIuaW5mby9wcml2YWN5
cG9saWN5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
