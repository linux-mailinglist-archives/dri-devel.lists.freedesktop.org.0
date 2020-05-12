Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473F1CEEA8
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F9C89C52;
	Tue, 12 May 2020 07:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAF6F89C52
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3812E2A6045;
 Tue, 12 May 2020 09:58:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Yv23sHyiGvMR; Tue, 12 May 2020 09:58:00 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id DFE492A6042;
 Tue, 12 May 2020 09:57:59 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYPnb-000hR1-EV; Tue, 12 May 2020 09:57:59 +0200
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
Date: Tue, 12 May 2020 09:57:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
Content-Language: en-CA
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMSAxMDo1MSBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gTW9uLCBN
YXkgMTEsIDIwMjAgYXQgNDoyNSBQTSBSdWkgU2FsdmF0ZXJyYSA8cnNhbHZhdGVycmFAZ21haWwu
Y29tPiB3cm90ZToKPj4gQSBzZWd1bmRhLCAxMS8wNS8yMDIwLCAyMToyMSwgQWxleCBEZXVjaGVy
IDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IGVzY3JldmV1Ogo+Pj4KPj4+IE5vdGUgdGhlcmUgaXMg
bm8gbG9zcyBvZiBmdW5jdGlvbmFsaXR5IGhlcmUsIGF0IGxlYXN0IG9uIHJhZGVvbgo+Pj4gaGFy
ZHdhcmUuICBJdCBqdXN0IGNvbWVzIGRvd24gdG8gd2hpY2ggTU1VIGdldHMgdXNlZCBmb3IgYWNj
ZXNzIHRvCj4+PiBzeXN0ZW0gbWVtb3J5LCB0aGUgQUdQIE1NVSBvbiB0aGUgY2hpcHNldCBvciB0
aGUgTU1VIGJ1aWx0IGludG8gdGhlCj4+PiBHUFUuICBPbiBwb3dlcnBjIGhhcmR3YXJlLCBBR1Ag
aGFzIGJlZW4gcGFydGljdWxhcmx5IHVuc3RhYmxlLCBhbmQKPj4+IElJUkMsIEFHUCBoYXMgYmVl
biBkaXNhYmxlZCBieSBkZWZhdWx0IG9uIHJhZGVvbiBvbiBwb3dlcnBjIGZvciBhCj4+PiB3aGls
ZS4KPj4KPj4gU28gdGhpcyBiYXNpY2FsbHkganVzdCBkcm9wcyBzdXBwb3J0IGZvciB0aGUgQUdQ
IEdBUlQ/IFdoYXQgaGFwcGVucyB0byB0aGUgQUdQIHNpZ25hbGxpbmcgcmF0ZXMgKGJleW9uZCB0
aGUgYmFzZSByYXRlKT8KPiAKPiBJIGRvbid0IHJlbWVtYmVyIGVub3VnaCBvZiB0aGUgZGV0YWls
cywgYnV0IEkgc3Ryb25nbHkgZG91YnQgaXQgd2FzCj4gcmVsYXRlZCB0byB3aGljaCBNTVUgd2Fz
IHVzZWQgcGVyIHNlLiAgT24gcjF4eC9yMnh4IHBhcnRzLCBBR1Agd2FzCj4gZWZmZWN0aXZlbHkg
dGhlIG5vbi1zbm9vcGVkIHJvdXRlIHRvIG1lbW9yeSBhbmQgdGhlIGludGVybmFsIE1NVSBvbmx5
Cj4gcHJvdmlkZWQgc25vb3BlZCAoY29oZXJlbnQpIGFjY2VzcyB0byBtZW1vcnkuICBUaGF0IGFu
ZCB0aGUgbGltaXRlZAo+IFRMQiBzcGFjZSBhcmUgcHJvYmFibHkgd2FudCBsaW1pdGVkIHBlcmZv
cm1hbmNlIGluIHRoYXQgY2FzZS4gIEkgZG9uJ3QKPiByZWNhbGwgd2hhdCBzb3J0IG9mIFRMQnMg
dGhlIGNoaXBzZXQgR0FSVCB0YWJsZXMgcHJvdmlkZWQuICBPbiByM3h4Cj4gYW5kIG5ld2VyIHRo
ZSwgb24tY2hpcCBNTVUgc3VwcG9ydGVkIGJvdGggc25vb3BlZCBhbmQgdW5zbm9vcGVkCj4gdHJh
bnNhY3Rpb25zIGFuZCBoYWQgbW9yZSBUTEIgc3BhY2Ugc28gdGhlIGRpZmZlcmVuY2Ugd2Fzbid0
Cj4gc2lnbmlmaWNhbnQgSUlSQy4KCkZXSVcsIG9uIG15IGxhc3QtZ2VuZXJhdGlvbiBQb3dlckJv
b2sgd2l0aCBSVjM1MCAoSUlSQyksIHRoZXJlIHdhcyBhIGJpZwpwZXJmb3JtYW5jZSBkaWZmZXJl
bmNlIGJldHdlZW4gQUdQIGFuZCBQQ0kgR0FSVC4gVGhlIGxhdHRlciB3YXMgc29ydCBvZgp1c2Fi
bGUgZm9yIG5vcm1hbCBkZXNrdG9wIG9wZXJhdGlvbiwgYnV0IG5vdCBzbyBtdWNoIGZvciBPcGVu
R0wgYXBwcwood2hpY2ggd2VyZSB1c2FibGUgd2l0aCBBR1ApLgoKCi0tIApFYXJ0aGxpbmcgTWlj
aGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQu
Y29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBN
ZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
