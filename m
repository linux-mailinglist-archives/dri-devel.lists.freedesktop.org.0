Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C3B1FC2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310F06F3B7;
	Fri, 13 Sep 2019 13:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DCF6F3B5;
 Fri, 13 Sep 2019 13:33:48 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id g14so13081468vsp.1;
 Fri, 13 Sep 2019 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hnl7OpEfza4YbA2qYO4VUD1uuEgWDd+IAdiDL6hY/pM=;
 b=Ko25rUHAQWXSMzGd3XvUfefpYLsRGi9saxD7iHvd3s947jgxWiriWfwVoqbvfzpYTV
 7X0IA3mCr5SS+l4E7jcTd4AwJM0Y0okyGv1NX+pIqS8OjwxLD4jbCRG6ZOWZ2f0tnYRH
 4NMkOh9olrCmN2snZ2ol8ZINzjPzPfPFAh1VYAmwQzeyhKzldIIKj6vFrEZT71947Bxc
 /6Su55od3WZ7A9nFvMCNgX059lR38jS+uYn9oGGP/1zNmliEVI1QHp7dRkO8E4jN+1nP
 0qRVfsmh+mpazMtUqeLoeYfRlu3/7v46Zu26W28SIuCUDKGOd0ZOAYcxINLH813meZ+U
 Rjuw==
X-Gm-Message-State: APjAAAW3hhJQfLoc75WrkSXilQg3b4AvJwKoran62rdGa68K0Kw5z6Qn
 2SX8Uy81ACxAg3JDoAJxBoTkQJrFe6TIJHbvTj0=
X-Google-Smtp-Source: APXvYqzXCO+EpVFbPYPlwDYijbuWIyqt5+tfpfwugxLjt/Ev9WUQG2jABsTvE5FdPYOUoUJaDM+fpDyxEF5WEXd7iPA=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr20291160vsq.220.1568381627687; 
 Fri, 13 Sep 2019 06:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
In-Reply-To: <20190913130606.981926197@linuxfoundation.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 09:33:36 -0400
Message-ID: <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.9+" <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywKClRoaXMgZmVlbHMgbGlrZSBpdCdzIG1pc3NpbmcgYSBGcm9tOiBsaW5lLgoKY29t
bWl0IGI1MTNhMThjZjFkNzA1YmQwNGVmZDkxYzQxN2U3OWU0OTM4YmUwOTMKQXV0aG9yOiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpEYXRlOiAgIE1vbiBKYW4gMjggMTY6MDM6NTAgMjAx
OSAtMDUwMAoKICAgIGRybS9ub3V2ZWF1OiBEb24ndCBXQVJOX09OIFZDUEkgYWxsb2NhdGlvbiBm
YWlsdXJlcwoKSXMgdGhpcyBhbiBhcnRpZmFjdCBvZiB5b3VyIG5vdGlmaWNhdGlvbi1vZi1wYXRj
aGVzIHByb2Nlc3MgYW5kIEkKbmV2ZXIgbm90aWNlZCBiZWZvcmUsIG9yIHdhcyB0aGUgcGF0Y2gg
aW5nZXN0ZWQgaW5jb3JyZWN0bHk/CgpDaGVlcnMsCgogIC1pbGlhCgpPbiBGcmksIFNlcCAxMywg
MjAxOSBhdCA5OjE2IEFNIEdyZWcgS3JvYWgtSGFydG1hbgo8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOgo+Cj4gWyBVcHN0cmVhbSBjb21taXQgYjUxM2ExOGNmMWQ3MDViZDA0ZWZk
OTFjNDE3ZTc5ZTQ5MzhiZTA5MyBdCj4KPiBUaGlzIGlzIG11Y2ggbG91ZGVyIHRoZW4gd2Ugd2Fu
dC4gVkNQSSBhbGxvY2F0aW9uIGZhaWx1cmVzIGFyZSBxdWl0ZQo+IG5vcm1hbCwgc2luY2UgdGhl
eSB3aWxsIGhhcHBlbiBpZiBhbnkgcGFydCBvZiB0aGUgbW9kZXNldHRpbmcgcHJvY2VzcyBpcwo+
IGludGVycnVwdGVkIGJ5IHJlbW92aW5nIHRoZSBEUCBNU1QgdG9wb2xvZ3kgaW4gcXVlc3Rpb24u
IFNvIGp1c3QgcHJpbnQgYQo+IGRlYnVnZ2luZyBtZXNzYWdlIG9uIFZDUEkgZmFpbHVyZXMgaW5z
dGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
Rml4ZXM6IGY0NzljMGJhNGExNyAoImRybS9ub3V2ZWF1L2ttcy9udjUwOiBpbml0aWFsIHN1cHBv
cnQgZm9yIERQIDEuMiBtdWx0aS1zdHJlYW0iKQo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJl
ZGhhdC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
ICMgdjQuMTArCj4gU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMyArKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IGluZGV4IGY4ODlkNDFhMjgxZmEuLjVlMDFi
ZmI2OWQ3YTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4g
QEAgLTc1OSw3ICs3NTksOCBAQCBudjUwX21zdG9fZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlcikKPgo+ICAgICAgICAgc2xvdHMgPSBkcm1fZHBfZmluZF92Y3BpX3Nsb3RzKCZtc3Rt
LT5tZ3IsIG1zdGMtPnBibik7Cj4gICAgICAgICByID0gZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3Bp
KCZtc3RtLT5tZ3IsIG1zdGMtPnBvcnQsIG1zdGMtPnBibiwgc2xvdHMpOwo+IC0gICAgICAgV0FS
Tl9PTighcik7Cj4gKyAgICAgICBpZiAoIXIpCj4gKyAgICAgICAgICAgICAgIERSTV9ERUJVR19L
TVMoIkZhaWxlZCB0byBhbGxvY2F0ZSBWQ1BJXG4iKTsKPgo+ICAgICAgICAgaWYgKCFtc3RtLT5s
aW5rcysrKQo+ICAgICAgICAgICAgICAgICBudjUwX291dHBfYWNxdWlyZShtc3RtLT5vdXRwKTsK
PiAtLQo+IDIuMjAuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
