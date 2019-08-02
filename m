Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331167F5F9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 13:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364D26EDC7;
	Fri,  2 Aug 2019 11:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C2B6EDC7;
 Fri,  2 Aug 2019 11:28:48 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id c4so2738276uad.1;
 Fri, 02 Aug 2019 04:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBeROyjLs5DpPSH2mob5zPUEDstHJ6xeJ8m6O/jSN/Q=;
 b=uFU+wKkCCpZhloh5/1xiuN9VU1+/9k/d6rpAiY37xJfY1b9UiSnAQnejgweiiLjVRQ
 oI9M2xdbiiJYSV5y1UnmdePRbgXPV1vSYYiDZU4GIDldbJge232Pgb9hxBcRRC7hTjoJ
 lt9KjmXM0wPAeZc0hFFWtiTtfSMp5E3QtLAVq4ZN0KheBDUUXA5PH/dNbXsdGBrcqTmR
 EZqS/VikCPzcV07hptcpiynZBI6R5V4Ib2IuiAhTr6xppo1fQvt7zOol9nUTPKKVrTZt
 G4YTGdMXr1j+d8MGugjJtgsNSXF8sPvizdsbEvn6oRMa9+Q60n3JyS3jOQ3UmhBiWgu8
 czHg==
X-Gm-Message-State: APjAAAULGPQiMX+vryFv3GgBwq6FMhfNqjA6PNJvZI/uuyMarU+0ekbd
 AvQ4rXRbgrobCzIsQ7n7N6799i5zOL9HZCmw36o=
X-Google-Smtp-Source: APXvYqxXCLoJ6+pNL0FQIYPqqFkifStRa2r+X144ATk3gpnvzV/7AMphI8KktAxk0/t5ggkhN+/z5vWIpKPEXINr+TM=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr84907558uag.40.1564745327174; 
 Fri, 02 Aug 2019 04:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190731212944.3819-1-christian.gmeiner@gmail.com>
 <1564651333.7439.14.camel@pengutronix.de>
In-Reply-To: <1564651333.7439.14.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 2 Aug 2019 13:28:38 +0200
Message-ID: <CAH9NwWfOGbt+oO48-TSZ+WiXyxr-ie2ORaKBUcaD5KZQHWFjqg@mail.gmail.com>
Subject: Re: [PATCH] etnaviv: fix whitespace errors
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VBeROyjLs5DpPSH2mob5zPUEDstHJ6xeJ8m6O/jSN/Q=;
 b=u3zos+WZR8nOc8CMEcE03HVyv3Ecn33KbU85JvgmvUXZYebEOd/eKEMzf3byPy2oo5
 lBiGKgho7n2qGJqzW0f+OwcY1JZdWv2kdMbPFX5Ytj2TDXfqTW2Vfd+8ZgIEXgQaHGCG
 LxEGBZRuTB2u8XoL3lsA3S+3VH6XAn3CMDXDiSZpvAL4LfNoKNvlzyaeuV4VayfDqEAL
 EESSoFkKE0K+yjPqe+32nGXuwrCqBCewzxZ8C/qaao5aAB+vvodX9uUZ6ybaSVD+zPY1
 tn73edRZk3RtOdoGq/bXNBAQn/UcSUQJ5o07Dk/aEvlPQhcpjo/IIoNBKpd2VSrySJWF
 ynpA==
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGhpbGlwcAoKQW0gRG8uLCAxLiBBdWcuIDIwMTkgdW0gMTE6MjIgVWhyIHNjaHJpZWIgUGhp
bGlwcCBaYWJlbAo8cC56YWJlbEBwZW5ndXRyb25peC5kZT46Cj4KPiBIaSBDaHJpc3RpYW4sCj4K
PiBPbiBXZWQsIDIwMTktMDctMzEgYXQgMjM6MjkgKzAyMDAsIENocmlzdGlhbiBHbWVpbmVyIHdy
b3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVp
bmVyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfcGVyZm1vbi5jIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X3BlcmZtb24uYwo+ID4gaW5kZXggNDIyN2E0MDA2YzM0Li4wNmU2ZDNlZTFjMzQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+IEBAIC0xNSw4
ICsxNSw4IEBAIHN0cnVjdCBldG5hdml2X3BtX3NpZ25hbCB7Cj4gPiAgICAgICB1MzIgZGF0YTsK
PiA+Cj4gPiAgICAgICB1MzIgKCpzYW1wbGUpKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAo+ID4g
LSAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRvbWFp
biwKPiA+IC0gICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFs
ICpzaWduYWwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRvbWFpbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpOwo+Cj4gVGhh
dCBzaWxlbmNlcyBhIGNoZWNrcGF0Y2ggZXJyb3IsIGJ1dCBub3cgdGhlIGFsaWdubWVudCB0byB0
aGUKPiBvcGVuaW5nIHBhcmVudGhlc2lzIGlzIGdvbmUuCj4gSG93IGFib3V0IHVzaW5nIHR3byB0
YWJzIGFuZCBzaXggc3BhY2VzIGluc3RlYWQ/Cj4KCldvcmtzIGZvciBtZSAtIEkgdGhpbmsgbXkg
Z2l0IGNvbmZpZyB3YXMgdGhlIHByb2JsZW0gaGVyZS4KCltjb3JlXQogICAgICAgIHBhZ2VyID0g
bGVzcyAteDEsNQoKSSByZW1vdmVkIHRoaXMgbm93IGFuZCBsb29rcyBnaXQgZGlmZiBsb29rcyBi
ZXR0ZXIgbm93LgoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczov
L2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJpdmFjeXBvbGljeQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
