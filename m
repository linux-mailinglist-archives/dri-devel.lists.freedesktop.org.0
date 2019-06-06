Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFC38593
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0B589BFC;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CB7892BC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 19:52:08 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m24so1197074ioo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 12:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHvZ08UQ6F9DrHSAJkdM4lRvAaL9fp+PzcKQDvAi3QA=;
 b=iaTzLIts1UIxUF43De4NTfVpnwFu8s7ii+13OGa2B/lbgTP8G+ppT9XlIypqs9i3Zh
 nUE5uSS5ytPp+w1iKJehZhMS+49gl2sbX5RJIk1cSYjHGCaCGVF4xAykufx+MOJe9d0P
 UDAcmTBF7yFbukvixXNfzjFWrAGT29OIUU3fEGaiX/OERKWLiDOs9MclnY8uROuwgyya
 9ZU0SW/IE7QosYHlckHfls3hMC0zSbDJu5WiR8BXqsrOh2rY4vMFVH/mYjcsa4Vjo78i
 DuHkE237q/ctIiEhCMfJvV4xpl1IzOh608WUKokVmGHi31XFh+ECGH1Kkp/29OInxPpK
 miFA==
X-Gm-Message-State: APjAAAVF/oL9TyXxEF4tJ2Y+7aiSIgodRB+WWltBXOh6SIzm1MkjrJ0t
 Bpid2bG2gaqU6KNNeAf8JbgUtE2L2719tsX/oZM=
X-Google-Smtp-Source: APXvYqymvS7JveFRHGX2qEIRdNfDHD4Cnki5S0RB9Xg/IBxcdtjj13BXWkPSvtVcEsD98/qeQ1BPGZK9lP9LOmRePc8=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr7342606ioh.263.1559850727465; 
 Thu, 06 Jun 2019 12:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
 <CGME20190605070532epcas2p2154c96c417cca1c1fc3c149c66447560@epcas2p2.samsung.com>
 <20190605070507.11417-6-andrew.smirnov@gmail.com>
 <9f847830-7bc6-c377-5cd7-b3cff783cbb3@samsung.com>
In-Reply-To: <9f847830-7bc6-c377-5cd7-b3cff783cbb3@samsung.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 6 Jun 2019 12:51:56 -0700
Message-ID: <CAHQ1cqGuDj2wVbKRMxBsFWk6cK4HO54ivajqSNfXate_NzF+Yg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] drm/bridge: tc358767: Drop custom
 tc_write()/tc_read() accessors
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KHvZ08UQ6F9DrHSAJkdM4lRvAaL9fp+PzcKQDvAi3QA=;
 b=jbDvBSQKpvmcMfisYPWINLkIs3i3NZs3RpdPSdnRUOHZnK1IOgnssVmxivPMMSoK4e
 nv/niDA3x/sHbTqqGxpF7OBCH1o4MvD1RBWwK2KQoN7/h2miH0lAtmdrkm47ZBrYI13w
 zt7vPo7wvgZLRvh1Gbnb6uHqUNOp1C1yUqwme7OSii8ttZ7QiWEESYK8uRtN5RF5QTrU
 BN693xbH+tersd1T+gYqV8Tvly0puO4lUKcMojAn4ieh8PAhmYlk01sk9Pgx3tzF/Pg/
 zmisvsJvs5pc9GzSL93Q4yWuXqYhyOkJmKKu74bQDnGI01kFwj9PQ7nwZ6XjK7Z6nb2Q
 +0wA==
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCAzOjM0IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+IHdyb3RlOgo+Cj4gT24gMDUuMDYuMjAxOSAwOTowNCwgQW5kcmV5IFNtaXJub3Yg
d3JvdGU6Cj4gPiBBIHZlcnkgdW5mb3J0dW5hdGUgYXNwZWN0IG9mIHRjX3dyaXRlKCkvdGNfcmVh
ZCgpIG1hY3JvIGhlbHBlcnMgaXMKPiA+IHRoYXQgdGhleSBjYXB0dXJlIHF1aXRlIGEgYml0IG9m
IGNvbnRleHQgYXJvdW5kIHRoZW0gYW5kIHRodXMgcmVxdWlyZQo+ID4gdGhlIGNhbGxlciB0byBo
YXZlIG1hZ2ljIHZhcmlhYmxlcyAncmV0JyBhbmQgJ3RjJyBhcyB3ZWxsIGFzIGxhYmVsCj4gPiAn
ZXJyJy4gVGhhdCBtYWtlcyBhIG51bWJlciBvZiBjb2RlIHBhdGhzIHJhdGhlciBjb3VudGVyaW50
dWl0aXZlIGFuZAo+ID4gc29tZXdoYXQgY2x1bmt5LCBmb3IgZXhhbXBsZSB0Y19zdHJlYW1fY2xv
Y2tfY2FsYygpIGVuZHMgdXAgYmVpbmcgbGlrZQo+ID4gdGhpczoKPiA+Cj4gPiAgICAgICBpbnQg
cmV0Owo+ID4KPiA+ICAgICAgIHRjX3dyaXRlKERQMF9WSURNTkdFTjEsIDMyNzY4KTsKPiA+Cj4g
PiAgICAgICByZXR1cm4gMDsKPiA+IGVycjoKPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPgo+ID4g
d2hpY2ggaXMgcmF0aGVyIHN1cnByaXNpbmcgd2hlbiB5b3UgcmVhZCB0aGUgY29kZSBmb3IgdGhl
IGZpcnN0Cj4gPiB0aW1lLiBTaW5jZSB0aG9zZSBoZWxwZXJzIGFyZ3VhYmx5IGFyZW4ndCByZWFs
bHkgc2F2aW5nIHRoYXQgbXVjaCBjb2RlCj4gPiBhbmQgdGhlcmUncyBubyB3YXkgb2YgZml4aW5n
IHRoZW0gd2l0aG91dCBtYWtpbmcgdGhlbSB0b28gdmVyYm9zZSB0bwo+ID4gYmUgd29ydGggaXQg
Y2hhbmdlIHRoZSBkcml2ZXIgY29kZSB0byBub3QgdXNlIHRoZW0gYXQgYWxsLgo+Cj4KPiBPbiB0
aGUgb3RoZXIgc2lkZSwgZXJyb3IgY2hlY2tpbmcgYWZ0ZXIgZXZlcnkgcmVnaXN0cnkgYWNjZXNz
IGlzIHZlcnkKPiBhbm5veWluZyBhbmQgc2lnbmlmaWNhbnRseSBhdWdtZW50cyB0aGUgY29kZSwg
bWFrZXMgaXQgcmVkdW5kYW50IGFuZAo+IGxlc3MgcmVhZGFibGUuIFRvIGF2b2lkIGl0IG9uZSBj
YW4gY2FjaGUgZXJyb3Igc3RhdGUsIGFuZCBkbyBub3QgcGVyZm9ybQo+IHJlYWwgd29yayB1bnRp
bCB0aGUgZXJyb3IgaXMgY2xlYXIuIEZvciBleGFtcGxlIHdpdGggZm9sbG93aW5nIGFjY2Vzc29y
Ogo+Cj4gdm9pZCB0Y193cml0ZShzdHJ1Y3QgdGNfZGF0YSAqdGMsIHUzMiByZWcsIHUzMiB2YWwp
ewo+Cj4gICAgIGludCByZXQ7Cj4KPiAgICAgaWYgKHRjLT5lcnJvcikgLy9UaGlzIGNoZWNrIGlz
IElNUE9SVEFOVAo+Cj4gICAgICAgICByZXR1cm47Cj4KPiAgICAgcmV0ID1yZWdtYXBfd3JpdGUo
Li4uKTsKPgo+ICAgICBpZiAocmV0ID49IDApCj4KPiAgICAgICAgIHJldHVybjsKPgo+ICAgICB0
Yy0+ZXJyb3IgPSByZXQ7Cj4KPiAgICAgZGV2X2Vycih0Yy0+ZGV2LCAiRXJyb3Igd3JpdGluZyBy
ZWdpc3RlciAlI3hcbiIsIHJlZyk7Cj4KPiB9Cj4KPiBZb3UgY2FuIHNhZmVseSB3cml0ZSBjb2Rl
IGxpa2U6Cj4KPiAgICAgdGNfd3JpdGUodGMsIERQX1BIWV9DVFJMLCBCR1JFTiB8IFBXUl9TV19F
TiB8IFBIWV9BMF9FTik7Cj4KPiAgICAgdGNfd3JpdGUodGMsIERQMF9QTExDVFJMLCBQTExVUERB
VEUgfCBQTExFTik7Cj4KPiAgICAgdGNfd3JpdGUodGMsIERQMV9QTExDVFJMLCBQTExVUERBVEUg
fCBQTExFTik7Cj4KPiAgICAgaWYgKHRjLT5lcnJvcikgewo+Cj4gICAgICAgICB0Yy0+ZXJyb3Ig
PSAwOwo+Cj4gICAgICAgICBnb3RvIGVycjsKPgo+ICAgICB9Cj4KPiBUaGlzIGlzIG9mIGNvdXJz
ZSBsb29zZSBzdWdnZXN0aW9uLgo+CgpJIGFtIGdvaW5nIHRvIGhhdmUgdG8gZGlzYWdyZWUgd2l0
aCB5b3Ugb24gdGhpcyBvbmUsIHVuZm9ydHVuYXRlbHkuClVzaW5nIHJlZ21hcCBBUEkgZXhwbGlj
aXRseSBkZWZpbml0ZWx5IG1ha2VzIGNvZGUgbW9yZSB2ZXJib3NlLCBsZXNzCnJlYWRhYmxlIG9y
IG1vcmUgYW5ub3lpbmcgdGhvdWdoPyBOb3QgcmVhbGx5IGZyb20gbXkgcGVyc3BlY3RpdmUuIFdp
dGgKcmVnbWFwIGNvZGUgSSBrbm93IHdoYXQgdGhlIGNvZGUgaXMgZG9pbmcgdGhlIG1vbWVudCBJ
IGxvb2sgYXQgaXQsCndpdGggdGhlIGV4YW1wbGUgYWJvdmUsIG5vdCBzbyBtdWNoLiBJIGFsc28g
ZmluZCBpdCBhbm5veWluZyB0aGF0IEkKbm93IGhhdmUgdG8gcmVtZW1iZXIgdGhlIHRyaWNrcyB0
aGF0IHRjX3dyaXRlIGlzIHB1bGxpbmcgaW50ZXJuYWxseSBhcwp3ZWxsIGFzIGJlIG1pbmRmdWwg
b2YgYSBnbG9iYWwtaXNoIGVycm9yIHN0YXRlIG9iamVjdC4gTXkgcHJvYmxlbSB3aXRoCm9yaWdp
bmFsIGNvZGUgd2FzIHRoYXQgYSkgaXQgdHJhZGVkIGV4cGxpY2l0bmVzcyBmb3IgY29uY2lzZW5l
c3MgaW4gYQphbiB1bmZhdm9yYWJsZSB3YXksIHdoaWNoIEkgc3RpbGwgdGhpbmsgaXMgdHJ1ZSBm
b3IgY29kZSBhYm92ZSBiKSBpdApkaWRuJ3QgcHJvdmlkZSBhIGNvbXByZWhlbnNpdmUgYWJzdHJh
Y3Rpb24gY29tcGxldGVseSByZW1vdmluZyByZWdtYXAKQVBJIGFuZCBzdGlsbCByZWxpZWQgb24g
dGhpbmdzIGxpa2UgcmVnbWFwX3VwZGF0ZV9iaXRzKCkgZXhwbGljaXRseSwKbWFraW5nIHRoZSBj
b2RlIGV2ZW4gbW9yZSBjb25mdXNpbmcgKHRydWUgZm9yIGFib3ZlIGV4YW1wbGUgYXMgd2VsbCku
CkkgdGhpbmsgdGhpcyBkcml2ZXIgaXNuJ3QgYmlnIGVub3VnaCB0byBoYXZlIGEgZGVkaWNhdGVk
IHBlcnNvbiBhbHdheXMKd29ya2luZyBvbiBpdCBhbmQgaXQgd2lsbCBtb3N0bHkgc2VlIG9jY2Fz
aW9uYWwgY29tbWl0cyBmcm9tIHNvbWV3aGF0CnJhbmRvbSBmb2xrcyB3aG8gYXJlIGNvbWluZyB0
byB0aGUgY29kZWJhc2UgZnJlc2gsIHNvIGNyZWF0aW5nIGFzCmxpdHRsZSAiaW5zdGl0dXRpb25h
bCBrbm93bGVkZ2UiLCBzbyB0byBzcGVhaywgaW4gYSBmb3JtIG9mIGEgY3VzdG9tCmV4Y2VwdGlv
bi1saWtlIG1lY2hhbmlzbSBhbmQgb3B0aW5nIGZvciBleHBsaWNpdCBidXQgdmVyYm9zZSBjb2Rl
CnNlZW1zIGxpa2UgYSBwcmVmZXJhYmxlIGNob2ljZS4KCkFueXdheSwgSSBnZXQgaXQgdGhhdCdz
IGl0IGlzIGEgbG9vc2Ugc3VnZ2VzdGlvbiA6LSksIGp1c3Qgd2FudGVkIHRvCnByb3ZpZGUgYSBk
ZXRhaWxlZCBleHBsYW5hdGlvbiB3aHkgSSdkIHJhdGhlciBub3QgZ28gdGhhdCB3YXkuCgpUaGFu
a3MsCkFuZHJleSBTbWlybm92Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
