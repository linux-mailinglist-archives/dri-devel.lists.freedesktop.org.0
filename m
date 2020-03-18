Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB561898DE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 11:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98986E8AF;
	Wed, 18 Mar 2020 10:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54A346E8AF;
 Wed, 18 Mar 2020 10:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 416DB2A6042;
 Wed, 18 Mar 2020 11:05:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 7baWg25bZC3q; Wed, 18 Mar 2020 11:05:53 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5D8952A6016;
 Wed, 18 Mar 2020 11:05:52 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jEVaA-000mQl-Gg; Wed, 18 Mar 2020 11:05:50 +0100
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Lucas Stach <dev@lynxeye.de>, Jacob Lifshay <programmerjake@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
Date: Wed, 18 Mar 2020 11:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xNyA2OjIxIHAubS4sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+IFRoYXQncyBvbmUg
b2YgdGhlIGlzc3VlcyB3aXRoIGltcGxpY2l0IHN5bmMgdGhhdCBleHBsaWNpdCBtYXkgc29sdmU6
IAo+IGEgc2luZ2xlIGNsaWVudCB0YWtpbmcgd2F5IHRvbyBtdWNoIHRpbWUgdG8gcmVuZGVyIHNv
bWV0aGluZyBjYW4gCj4gYmxvY2sgdGhlIHdob2xlIHBpcGVsaW5lIHVwIHVudGlsIHRoZSBkaXNw
bGF5IGZsaXAuIFdpdGggZXhwbGljaXQgCj4gc3luYyB0aGUgY29tcG9zaXRvciBjYW4ganVzdCBk
ZWNpZGUgdG8gdXNlIHRoZSBsYXN0IGNsaWVudCBidWZmZXIgaWYgCj4gdGhlIGxhdGVzdCBidWZm
ZXIgaXNuJ3QgcmVhZHkgYnkgc29tZSBkZWFkbGluZS4KCkZXSVcsIHRoZSBjb21wb3NpdG9yIGNh
biBkbyB0aGlzIHdpdGggaW1wbGljaXQgc3luYyBhcyB3ZWxsLCBieSBwb2xsaW5nCmEgZG1hLWJ1
ZiBmZCBmb3IgdGhlIGJ1ZmZlci4gKEN1cnJlbnRseSwgaXQgaGFzIHRvIHBvbGwgZm9yIHdyaXRh
YmxlLApiZWNhdXNlIHdhaXRpbmcgZm9yIHRoZSBleGNsdXNpdmUgZmVuY2Ugb25seSBpc24ndCBl
bm91Z2ggd2l0aCBhbWRncHUpCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUg
ZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
