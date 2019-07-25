Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5176268
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5386ECF1;
	Fri, 26 Jul 2019 09:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jul 2019 19:31:58 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD716E821
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 19:31:58 +0000 (UTC)
Received: from linux-e202.suse.de ([46.85.222.234]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MK3FW-1i6l8X259S-00LTjb; Thu, 25 Jul 2019 21:26:43 +0200
From: Fabian Vogt <fabian@ritter-vogt.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
Date: Thu, 25 Jul 2019 21:26:41 +0200
Message-ID: <12154694.e2V3OH3Rcx@linux-e202.suse.de>
In-Reply-To: <CACRpkdYAgLJ9asftN5EafeN5EVEyH_xHVdwjbecZqvgz-JJ98A@mail.gmail.com>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <1709073.y2qmsckc0Q@linux-e202.suse.de>
 <CACRpkdYAgLJ9asftN5EafeN5EVEyH_xHVdwjbecZqvgz-JJ98A@mail.gmail.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OwjadK/hsEvg+BHwMVvckELquXvXqT2tyKgIoTLKnIscWoIqkP2
 ipBL4z3QCiWuyeEF8/Wgz8GFTsRGUmO1twYAc33gIFnFe8N0fTurmjn7f4lbrDIosy5R8MF
 leQMkIjNrUrNE+hGDbu/Atp+RKN/fx0gDUFTB63xBd6R5Uwz3k171KWQHEm7+7miCSzOFWf
 /UN4FntLamb+rVH7G7tug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0q9daoHxU24=:eLITzd4FMpw+7+Bi7cF4OU
 LYl6BXWiHadVE4qfUEZawvmqMRetPAPUhRzSeVTzwAEs175Zdxh7jNQMyJ+R0XWShtkdfQJUw
 SOZpBdLR1TRnuDuzaK/2WC9DabsF80usBP81XmudlHCIrGxv0Gv1S6cu3ybdWhxEBW8Aot1az
 gxCeuFJ/pMz3bte0v4CFaQC3b87evyHk83wLgVaBfn+jbIn725DYCnSw3UvA4wxkqEE3ZdF8E
 iVFgd9Eqb3/DgkfJWfbDssxi99WKxWjFQ6qSRUSd/HmJNGtHhNPrCtQ/8wKRiO4Xa68B+yU4N
 NUowwA/9wNbpIrsNxxHP7jMO6DMyw2B3WaQqtSJS9pEbX6w3kp6MqX0Vzp3gBrK4V1COb8k2w
 PblJjl4ciB8PT52Oux4eBfj8BME9GJkoyk1AaGGe8GJlk7mYwzmui8DUbtruVUxKuoXt+XoJt
 9SvnkbOqFL66df/BaM27TdvUqgfynsplLiqE9WQUMxiCSc6sdn9F6FrhqC2ADkPLgnU2gnXm1
 dKqKPOUEJUXBQGqPd3BDTG+4xRKEAVD6B+AbegwER0Ug3KhzAvesZIBQLkxPHp4gxMmO1Ge2J
 lBk5hhiqryAq9G7BNANrMX0L6EdM8jbqVu6l4IFfYDZpwTGhivpL9W3MWxrEzU8Jy6O/uJaiX
 GesHMgLipIeyvSse/DJqY/dOZj9TNiW1Y0esEk5L00Po57nNMCadGeMqg9ONPHA/+Xty+FODR
 DriViTfd5VJR7DwNjHG554vyo7s03PrMdMA/cIVuzK5bOHYxGVv8j46wwlg=
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Daniel Tang <dt.tangr@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBbSBNaXR0d29jaCwgMjQuIEp1bGkgMjAxOSwgMTQ6MzM6MDYgQ0VTVCBzY2hyaWViIExp
bnVzIFdhbGxlaWo6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNToxOSBQTSBGYWJpYW4gVm9n
dCA8ZmFiaWFuQHJpdHRlci12b2d0LmRlPiB3cm90ZToKPiAKPiA+IEkgZ2F2ZSB0aGUgc2VyaWVz
IGEgdHJ5ICh2aXJ0dWFsIENYIGFuZCBUUCBzbyBmYXIsIHdpbGwgZG8gb24gYSByZWFsIENYIGxh
dGVyKToKPiA+IE9PUFMgd2l0aCBhIG51bGxwdHIgZGVyZWYgZHVyaW5nIHByb2JlLgo+ID4gVGhp
cyBkaWZmIHdoaWNoIGp1c3QgbW92ZXMgc29tZSBsaW5lcyBhcm91bmQgZml4ZXMgdGhhdCBhbmQg
dGhlIExDRCBhcHBlYXJzIHRvCj4gPiB3b3JrIHByb3Blcmx5Lgo+IAo+IE9LIEkgZm9sZGVkIHRo
aXMgaW50byBteSBwYXRjaCwgdGhhbmtzIQo+IAo+ID4gT25jZSBJIHZlcmlmaWVkIHRoZSAyNGJp
dCBkZXB0aCBhbmQgY2xvY2sgc3BlZWQgY29uZmlnIG9uIEhXIGFzIHdlbGwsIEkgY2FuCj4gPiBn
aXZlIHlvdSBteSBUZXN0ZWQtYnksIG9yIHdvdWxkIHlvdSBwcmVmZXIgdGhhdCBJIHJlc3VibWl0
IHlvdXIgc2VyaWVzIHdpdGggdGhlCj4gPiBmaXggYmVsb3c/Cj4gCj4gSXQncyBmaW5lIGlmIHlv
dSB0ZXN0IGl0IGp1c3Qgd2l0aCB5b3VyIHBhdGNoIGFzLWlzLCBJIGRpZG4ndCBjaGFuZ2UgYW55
dGhpbmcKPiBlbHNlLgo+IAo+IEkgd291bGQgYmUgYW1hemVkIGlmIGl0ICJqdXN0IHdvcmtzIiBu
b3cuCgpJbmRlZWQsIHlvdSB3b24ndCBiZS4gT24gYSByZWFsIENYIHRoZSBMQ0QgZGlzcGxheXMg
c2hvd3MgY29udGVudCB3aXRob3V0CmFueSBvdGhlciBjaGFuZ2VzIHRvIHRoZSBzZXQsIGJ1dCBo
YXMgYSB+M0h6IHB1bHNhdGluZyBlZmZlY3Qgc2Nyb2xsaW5nIGZyb20KdGhlIHRvcCB0byB0aGUg
Ym90dG9tIGFuZCB0aGUgZ3JheSB0ZXh0IGNoYW5nZXMgY29sb3Igc2xpZ2h0bHkuCgpXaXRob3V0
IHRoZSBwYXRjaHNldCBhcHBsaWVkIGV2ZXJ5dGhpbmcgbG9va3MgcGVyZmVjdGx5LgoKSSB0cmll
ZCBzZXR0aW5nIHZyZWZyZXNoIHRvIDIwLCBmYl9icHAgdG8gMTYgYW5kIGZvcmNpbmcgYW4gaW52
ZXJ0ZWQgcGFuZWwKY2xvY2ssIGJ1dCB0aGUgcHVsc2luZyBkaWRuJ3QgY2hhbmdlLgoKVXNpbmcg
dGhlIGVtdWxhdGVkIENYIEkgY29tcGFyZWQgdGhlIGNvbnRlbnRzIG9mIHRoZSByZWdpc3RlcnMg
YW5kIGZvdW5kCnRoYXQgb25seSB0aGUgSVBDIGJpdCAod2hpY2ggSSB0cmllZCB0byBzZXQsIHNv
IHRoYXQncyBsaWtlbHkgbm90IGl0KSBhbmQKdGhlIGludGVycnVwdCByZWdpc3RlcnMgaGF2ZSBh
IGRpZmZlcmVudCBjb250ZW50LgoKQW55IGlkZWE/CgpUaGFua3MsCkZhYmlhbgoKPiBZb3VycywK
PiBMaW51cyBXYWxsZWlqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
