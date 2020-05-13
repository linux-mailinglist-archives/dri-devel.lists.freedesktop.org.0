Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0A1D0FB1
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939166E14C;
	Wed, 13 May 2020 10:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 865C56E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B05312A6046;
 Wed, 13 May 2020 12:26:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 4C2yzV7Klx1O; Wed, 13 May 2020 12:26:54 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 53DA42A6045;
 Wed, 13 May 2020 12:26:54 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYobF-000ruZ-P7; Wed, 13 May 2020 12:26:53 +0200
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Rui Salvaterra <rsalvaterra@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
 <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
Date: Wed, 13 May 2020 12:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMyAxMToyOCBhLm0uLCBSdWkgU2FsdmF0ZXJyYSB3cm90ZToKPiBPbiBXZWQs
IDEzIE1heSAyMDIwIGF0IDA4OjE5LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdy
b3RlOgo+Pgo+PiBpOTE1IGlzIGV2ZW4gd29yc2UsIHdlIG1hbnVhbGx5IG1lc3MgYXJvdW5kIHdp
dGggY2xmbHVzaC4gSW4KPj4gdXNlcnNwYWNlLiBTbyByZWFsbHkgdGhlcmUncyAyIGF4aXMgZm9y
IGRtYSBtZW1vcnk6IGNvaGVyZW50IHZzLgo+PiBub24tY29oZXJlbnQgKHdoaWNoIGlzIHNvbWV0
aGluZyB0aGUgZG1hLWFwaSBzb21ld2hhdCBleHBvc2VkKSwgaS5lLgo+PiBkbyB5b3UgbmVlZCB0
byBjbGZsdXNoIG9yIG5vdCwgYW5kIGNhY2hlZCB2cyB1bmNhY2hlZCwgaS5lLiBhcmUgdGhlCj4+
IFBBVCBlbnRyaWVzIHdjIG9yIHdiLgo+IAo+IFNvLCB0aGUgUG93ZXJQQyBBR1AgR0FSVCBlbmRz
IHVwIGJlaW5nIGNhY2hlZCBhbmQgbm9uLWNvaGVyZW50LCByaWdodAo+IChhc3N1bWluZyB0aGVy
ZSdzIG5vIHdheSB0byBzZXQgdGhlIHBhZ2UgYXR0cmlidXRlcyBNVFJSL1BBVC1zdHlsZSk/CgpJ
dCB3YXMgdW5jYWNoZWQgd2hlbiBJIHdhcyB1c2luZyBteSBsYXN0LWdlbiBQb3dlckJvb2sgKHVu
dGlsIGEgZmV3CnllYXJzIGFnbyksIHRob3VnaCBpdCdzIHBvc3NpYmxlIHRoYXQgYnJva2Ugc2lu
Y2UgdGhlbi4gSSBkb24ndCByZW1lbWJlcgp0aGUgZGV0YWlscyBob3cgaXQncyBkb25lIG9mZmhh
bmQgdGhvdWdoLgoKVGhlIG9ubHkgdGhlb3JldGljYWwgcHJvYmxlbSB0aGVyZSB3YXMgdGhhdCB0
aGUga2VybmVsIHN0aWxsIGhhZCBhCmNhY2hlYWJsZSBtYXBwaW5nIG9mIHRoZSBzYW1lIG1lbW9y
eSwgYW5kIGFueSBhY2Nlc3MgdmlhIHRoYXQgKGUuZy4KcHJlZmV0Y2ggZHVlIHRvIGFjY2VzcyB0
byBhIG5laWdoYm91cmluZyBwYWdlKSBjb3VsZCB0cmlnZ2VyIGEgbWFjaGluZQpjaGVjay4gQnV0
IEkgZG9uJ3QgcmVtZW1iZXIgZXZlciBoaXR0aW5nIHRoYXQuIE1heWJlIEkgd2FzIGp1c3QgbHVj
a3kKYWxsIHRob3NlIHllYXJzLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJl
IGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Bl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
