Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E9136470
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 01:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6747F6E353;
	Fri, 10 Jan 2020 00:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ED26E353
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 00:49:54 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200110004952epoutp04bef054d515bdd1a00f70c9cb6e159761~oYCd8PY6b2801628016epoutp042
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 00:49:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200110004952epoutp04bef054d515bdd1a00f70c9cb6e159761~oYCd8PY6b2801628016epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578617392;
 bh=9llBaxZQihQ0FI+mzVpfexSpdKELJdhgop34n/hcIBI=;
 h=Date:From:Reply-To:To:CC:Subject:In-Reply-To:References:From;
 b=cUauapf1vvbyx9UA6oIbXtVQHYFBvdULRqDaTCNsu2hSwKqBjOXHsWqbn4guJATL/
 Pl83CSVw12Nuv8+aWSUwXnkCL83EpKsyMwREEtREuhEpeYaCDOGIm8zoTAFxCHcEAg
 TcMsxfBSIwcA/8NtTfo1UkIFJ0ewJF6+mzkM66tk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200110004951epcas1p13cc7c0c7faf30e43358ba1396a53e893~oYCdhK7Wk2829228292epcas1p1e;
 Fri, 10 Jan 2020 00:49:51 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 47v4Bh2hDbzMqYkh; Fri, 10 Jan
 2020 00:49:48 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 C4.B3.51241.C2AC71E5; Fri, 10 Jan 2020 09:49:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200110004947epcas1p3a93bb1970c4d04a44d93a850c76527b1~oYCZc8Dbk2319923199epcas1p3T;
 Fri, 10 Jan 2020 00:49:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200110004947epsmtrp134c20f2801a93ce74ca1bbd2fba1f041~oYCZcTBDV3120131201epsmtrp1e;
 Fri, 10 Jan 2020 00:49:47 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-7e-5e17ca2c8307
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 73.3B.10238.B2AC71E5; Fri, 10 Jan 2020 09:49:47 +0900 (KST)
Received: from [10.113.221.222] (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200110004947epsmtip2f479dc193329bf171759581d01e6872c~oYCZNpNtj2491224912epsmtip2g;
 Fri, 10 Jan 2020 00:49:47 +0000 (GMT)
Message-ID: <5E17CAE8.7090601@samsung.com>
Date: Fri, 10 Jan 2020 09:52:56 +0900
From: Seung-Woo Kim <sw0312.kim@samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:16.0) Gecko/20121011
 Thunderbird/16.0.1
MIME-Version: 1.0
To: Niclas Zeising <zeising@daemonic.se>
Subject: Re: [PATCH] xf86drm: only include <sys/sysctl.h> for FreeBSD build
 case
In-Reply-To: <94d436b2-b4e0-3414-a2fc-9d58e5ad4c07@daemonic.se>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGc2djMFQvReCkPlgnmiiB2rEWiwFXNDXygJr4YLA4gUlb6ZZO
 EXBJULQqGiqgDeK+xYAaQBHBaNAqKBANoA8KiVt4EFRwF4NG2w5G3v6zfPe/557LksoyRsVa
 HR7R7RBsHDOJaro3R5OU2Blv0tYGYg1Pv40whit9dynDxSd1yFBVOcgYfJ2/iCW0sfnDA8J4
 7tYgYTzZscb48kAwKmusRZn0hrxUiyjkim616Mhx5lod5jRu9brs5dn6ZC2fxKcYFnBqh2AX
 07j0jMyklVZb0JxTbxFs+cFUpiBJ3NxFqW5nvkdUW5ySJ40TXbk2V4pLIwl2Kd9h1uQ47Qt5
 rXaePti4Kc9SceA5cvlxYcOT+0QxGosqRZEs4PnQ87kmohRNYpW4GcFA315CDj4jGN31drzy
 HUH9w3qyFLFhpPedJkQr8W0EvX6Qe0YQjJ05TYUKCpwAR57eC2sKz4KymrN0SDM4EVrPj9Ey
 rIbu61VMSMfi9VB114dkNho6jg6E2al4NrSMvgpfgsRHEJz6+jsiVIjBa+HOa9ksEi+Ga8N7
 wgeReDqUXD9GhgDA/Qy0N3ZR8qDpUO4N0LKOgaEHjRGyVsGgzzuut8GNQz8jZHgfgoN7d47D
 Omi9UEmExifxHKi7OVdOz4CWsRNINp4Mw98O0vILKWCfVym3zISWtgpGTqugun6dnDbC+R+X
 iUNoRvWEkasnTFD93+s0ImtRnOiS7GZR4l36iQu+isJ/MSGlGbU/zgggzCIuSmGJiTcpaWGL
 VGQPIGBJbqqi7VmcSanIFYq2im5ntjvfJkoBpA9up5xUxeY4gz/b4cnm9fN0Op1hPp+s53ku
 XsGO9mxUYrPgEfNE0SW6/3EEG6kqRlPs5sSmykKJpU1lj4o2LvuyqKCja+tCqmj4p5kuL/mQ
 Xj5T7S88vv3NZqq1Z/T+iO5ciXX7igpr78B7RUP3R19x9FD0FP9+7e+m7jMv6n0xgU9Wt/fZ
 4mn+3Zf6Vy8tsFtN9sOp8dfiqN2pXRpmR92qZd6LWY0NWZGdfzxvbcRajpIsAp9AuiXhL0sS
 53ahAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvK72KfE4g2O/eS2ufH3PZrH21kEW
 i+WX1zNazJj8ks2i/9QfJgdWjx1vjzN5LN7zkslj3slAj/vdQF7fllWMAaxRXDYpqTmZZalF
 +nYJXBmTum8yFkwTqNh4+QhTA+Nvni5GDg4JAROJS6/1uhi5OIQEdjNK7Px5namLkRMoLiUx
 99t2RogaYYnDh4shat4ySixtXsMGUsMroCUx9cphFhCbRUBVom/lIlYQm01AR2L/kt9gtpCA
 gsSFrTPA6kUFQiR+fbzCCtErKHFy5hOwXhEBDYmdPx6wgyxgFpjGKLF30iRmkISwQJDEgYcL
 WCA2P2OU+Ll8ASNIglPAXmLzu1Y2kOuYBdQl1s8TAgkzC8hLNG+dzTyBUWgWkh2zEKpmIala
 wMi8ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOA60NHcwXl4Sf4hRgINRiYc3Q1g8
 Tog1say4MvcQowQHs5II79EbYnFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZ/mHYsUEkhPLEnN
 Tk0tSC2CyTJxcEo1MDqde8ZjkvTAmfFpGM+1U+3Mpgo/VbdXzXRu2R93M+z5CkPZRwetVSS2
 5n+wa9/EvOjlAmPej7XtC6WWbK7WNjwxcY/vm3v7hD+5ZU3Q9ji8nP2yw5FJcVXJd5/onora
 MDux9uBj9pLpGTusVZ8s72a/GPTS7Kvxfllu1+tq32XdrqZcEjXtF1diKc5INNRiLipOBACg
 Ztg+fwIAAA==
X-CMS-MailID: 20200110004947epcas1p3a93bb1970c4d04a44d93a850c76527b1
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae
References: <CGME20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae@epcas1p4.samsung.com>
 <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
 <871rs8psjy.fsf@intel.com>
 <94d436b2-b4e0-3414-a2fc-9d58e5ad4c07@daemonic.se>
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
Reply-To: sw0312.kim@samsung.com
Cc: eric.engestrom@intel.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIwMjDrhYQgMDHsm5QgMTDsnbwgMDA6MjgsIE5pY2xhcyBaZWlzaW5nIHdyb3RlOgo+
IE9uIDIwMjAtMDEtMDkgMTY6MTgsIEphbmkgTmlrdWxhIHdyb3RlOgo+PiBPbiBUaHUsIDA5IEph
biAyMDIwLCBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPiB3cm90ZToKPj4+
IFRoZSA8c3lzL3N5c2N0bC5oPiBoZWFkZXIgaXMgb25seSByZXF1aXJlZCBGcmVlQlNEIGFuZCBH
TlUgbGliYwo+Pj4gMi4zMCBzdGFydHMgdG8gd2FybiBhYm91dCBMaW51eCBzcGVjaWZpYyA8c3lz
L3N5c2N0bC5oPiBoZWFkZXIKPj4+IGRlcHJlY2F0aW9uLiBPbmx5IGluY2x1ZGUgPHN5cy9zeXNj
dGwuaD4gZm9yIEZyZWVCU0QuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2V1bmctV29vIEtpbSA8
c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPj4+IC0tLQo+Pj4gICB4Zjg2ZHJtTW9kZS5jIHwgICAg
MiArKwo+Pj4gICAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGY4NmRybU1vZGUuYyBiL3hmODZkcm1Nb2RlLmMKPj4+
IGluZGV4IDIwN2Q3YmUuLmZmMWQzMWQgMTAwNjQ0Cj4+PiAtLS0gYS94Zjg2ZHJtTW9kZS5jCj4+
PiArKysgYi94Zjg2ZHJtTW9kZS5jCj4+PiBAQCAtNDIsOSArNDIsMTEgQEAKPj4+ICAgI2luY2x1
ZGUgPHN0ZGludC5oPgo+Pj4gICAjaW5jbHVkZSA8c3RkbGliLmg+Cj4+PiAgICNpbmNsdWRlIDxz
eXMvaW9jdGwuaD4KPj4+ICsjaWYgZGVmaW5lZCAoX19GcmVlQlNEX18pIHx8IGRlZmluZWQgKF9f
RnJlZUJTRF9rZXJuZWxfXykKPj4+ICAgI2lmZGVmIEhBVkVfU1lTX1NZU0NUTF9ICj4+Cj4+IE5v
dCB0aGF0IEkga25vdyBhbnl0aGluZyBhYm91dCB0aGlzLCBidXQgc2hvdWxkbid0IHlvdSBpbnN0
ZWFkIGZpeAo+PiBIQVZFX1NZU19TWVNDVExfSCBkZWZpbml0aW9uIGluIGNvbmZpZ3VyZSBzdGFn
ZSB0byBvbmx5IGJlIGVuYWJsZWQgb24KPj4gRnJlZUJTRD8KPj4KPj4gQlIsCj4+IEphbmkuCj4+
Cj4+PiAgICNpbmNsdWRlIDxzeXMvc3lzY3RsLmg+Cj4+PiAgICNlbmRpZgo+Pj4gKyNlbmRpZiAv
KiBkZWZpbmVkIChfX0ZyZWVCU0RfXykgfHwgZGVmaW5lZCAoX19GcmVlQlNEX2tlcm5lbF9fKSAq
Lwo+Pj4gICAjaW5jbHVkZSA8c3RkaW8uaD4KPj4+ICAgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPj4K
PiAKPiBIaSEKPiBUaGlzIGZpeCBsb29rcyBPSyBvbiBGcmVlQlNEIChJIGhhdmVuJ3QgaGFkIHRp
bWUgdG8gdGVzdCksIGhvd2V2ZXIsIGFzCj4gaGFzIGJlZW4gcG9pbnRlZCBvdXQsIHBlcmhhcHMg
dGhlIGNoYW5nZSBzaG91bGQgZ28gaW50byB0aGUgbWVzb24gYnVpbGQKPiBzY3JpcHQgb3IgY29u
ZmlndXJlIGluc3RlYWQuCgpPaywgSSB3aWxsIHRyeSB0byBmaXggaW4gYnVpbGQgc2lkZSBpbnN0
ZWFkIG9mIGluY2x1ZGUgaXRzZWxmLgoKPiBJIGRvbid0IGtub3cgaWYgb3RoZXIgT1NlcyAob3Ro
ZXIgQlNEcyBwcmltYXJpbHkpIG5lZWQgdGhpcyBhcyB3ZWxsLiBJJ20KPiBwcmV0dHkgc3VyZSBp
dCdzIG5lZWRlZCBvbiBEcmFnb25mbHlCU0QgYXQgbGVhc3QuCj4gUGVyaGFwcyBrZWVwIHRoZSBp
bmNsdWRlIGZvciBldmVyeXRoaW5nIGV4Y2VwdCBMaW51eCBmb3IgdGhlIHRpbWUgYmVpbmc/CgpB
cyBmYXIgYXMgSSBjaGVja2VkLCBzeXNjdGxieW5hbWUoKSBjYWxsZWQgb25seSB3aXRoIEZyZWVC
U0QgYnVpbGQgZmxhZwppcyBvbmx5IGZ1bmN0aW9uIGRlZmluZWQgaW4gPHN5cy9zeXNjdGwuaD4g
YXQgbGVhc3QgZm9yIHhmODZkcm1Nb2RlLmMsCmJ1dCBJIG1pc3NlZCBzb21ldGhpbmcuIFRoZSBo
ZWFkZXIgZGVwcmVjYXRpb24gaXMgZG9uZSBmcm9tIExpbnV4LCBzbyBpdApzZWVtcyBmaW5lIHJl
bW92aW5nIHRoZSBoZWFkZXIgaW5jbHVkZSBvbmx5IGZvciBMaW51eC4KCkJlc3QgUmVnYXJkcywK
LSBTZXVuZy1Xb28gS2ltCgo+IFJlZ2FyZHMKCi0tIApTZXVuZy1Xb28gS2ltClNhbXN1bmcgUmVz
ZWFyY2gKLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
