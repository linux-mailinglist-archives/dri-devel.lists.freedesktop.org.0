Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9D1D1059
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 12:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6918289C19;
	Wed, 13 May 2020 10:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A4FF89C19
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 10:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 881142A604A;
 Wed, 13 May 2020 12:57:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id KPng9Ya5OvG7; Wed, 13 May 2020 12:57:48 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 40BF52A6045;
 Wed, 13 May 2020 12:57:48 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYp59-000s8C-Ou; Wed, 13 May 2020 12:57:47 +0200
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Rui Salvaterra <rsalvaterra@gmail.com>
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
 <69696543-7c0e-604d-ed29-721b1b99d44e@daenzer.net>
 <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <2612115a-eaa0-9bf9-1227-adbf7f75e1e7@daenzer.net>
Date: Wed, 13 May 2020 12:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALjTZvYsNsW9ytGpbUKv1uf9r6DJkAbQzyDbx7Ru+fCP34w4kQ@mail.gmail.com>
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

T24gMjAyMC0wNS0xMyAxMjozOSBwLm0uLCBSdWkgU2FsdmF0ZXJyYSB3cm90ZToKPiBPbiBXZWQs
IDEzIE1heSAyMDIwIGF0IDExOjI3LCBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4KPj4gVGhlIG9ubHkgdGhlb3JldGljYWwgcHJvYmxlbSB0aGVyZSB3YXMgdGhh
dCB0aGUga2VybmVsIHN0aWxsIGhhZCBhCj4+IGNhY2hlYWJsZSBtYXBwaW5nIG9mIHRoZSBzYW1l
IG1lbW9yeSwgYW5kIGFueSBhY2Nlc3MgdmlhIHRoYXQgKGUuZy4KPj4gcHJlZmV0Y2ggZHVlIHRv
IGFjY2VzcyB0byBhIG5laWdoYm91cmluZyBwYWdlKSBjb3VsZCB0cmlnZ2VyIGEgbWFjaGluZQo+
PiBjaGVjay4gQnV0IEkgZG9uJ3QgcmVtZW1iZXIgZXZlciBoaXR0aW5nIHRoYXQuIE1heWJlIEkg
d2FzIGp1c3QgbHVja3kKPj4gYWxsIHRob3NlIHllYXJzLgo+IAo+IElmIHRoYXQncyB0aGUgaXNz
dWUsIEkgYXNzdXJlIHlvdSBub3dhZGF5cyB5b3UgY2FuIGhpdCBpdCBxdWl0ZQo+IHJlbGlhYmx5
LCBhdCBsZWFzdCBvbiBteSBpQm9vayBHNC4KCkhvdyBkbyB5b3Uga25vdyB5b3UncmUgaGl0dGlu
ZyB0aGF0IHBhcnRpY3VsYXIgaXNzdWU/CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29m
dHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2
ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
