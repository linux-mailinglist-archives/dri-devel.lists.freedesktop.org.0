Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E86532A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BC16E15D;
	Thu, 11 Jul 2019 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321096E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:28:28 +0000 (UTC)
Date: Thu, 11 Jul 2019 08:28:25 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Message-ID: <hG3hgN80Bt03njzCaW7h3xaog7ppTTBzmsShC0L5LdCbr5dFkHMJHHxizeYa_IYP7uCwMG-vPJOWMhueq2LirNKFhulkkni2KFf3XA24bb8=@emersion.fr>
In-Reply-To: <20190711082105.GI15868@phenom.ffwll.local>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <20190711082105.GI15868@phenom.ffwll.local>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1562833706;
 bh=uO/ecoIZ2xzNWLdcDpPcmeAWP8zlhJ3RlT1sV4HBWmw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=iRvRu6fn8uLULxJGDBqYbkw16kiVfajS53oG9l4Krbq11GjnhOYVHxR9/vbDD+A8K
 tAc81R2aMl37+/3IvtzLPPP6Ic+CHW3G3yYBfgRUHhZTsIBVthtfHrhKqUNS3rscM7
 pl2UfCfEt8Bm6//efUUusEn9PiOqGt9I42Uaao+Q=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIEp1bHkgMTEsIDIwMTkgMTE6MjEgQU0sIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDEwOjM4OjMxUE0g
LTAzMDAsIFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6Cj4KPiA+IFRoZSBjb21wdXRlX2NyYygpIGZ1
bmN0aW9uIGlzIHJlc3BvbnNpYmxlIGZvciBjYWxjdWxhdGluZyB0aGUKPiA+IGZyYW1lYnVmZmVy
IENSQyB2YWx1ZTsgZHVlIHRvIHRoZSBYUkdCIGZvcm1hdCwgdGhpcyBmdW5jdGlvbiBoYXMgdG8K
PiA+IGlnbm9yZSB0aGUgYWxwaGEgY2hhbm5lbCBkdXJpbmcgdGhlIENSQyBjb21wdXRhdGlvbi4g
VGhlcmVmb3JlLAo+ID4gY29tcHV0ZV9jcmMoKSBzZXQgemVybyB0byB0aGUgYWxwaGEgY2hhbm5l
bCBkaXJlY3RseSBpbiB0aGUgaW5wdXQKPiA+IGZyYW1lYnVmZmVyLCB3aGljaCBpcyBub3QgYSBw
cm9ibGVtIHNpbmNlIHRoaXMgZnVuY3Rpb24gcmVjZWl2ZXMgYSBjb3B5Cj4gPiBvZiB0aGUgb3Jp
Z2luYWwgYnVmZmVyLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGlu
IGEKPiA+IGNvbnRleHQgd2l0aG91dCBhIGJ1ZmZlciBjb3B5LCBpdCB3aWxsIGNoYW5nZSB0aGUg
aW5pdGlhbCB2YWx1ZS4gVGhpcwo+ID4gcGF0Y2ggbWFrZXMgY29tcHV0ZV9jcmMoKSBjYWxjdWxh
dGUgdGhlIENSQyB2YWx1ZSB3aXRob3V0IG1vZGlmeWluZyB0aGUKPiA+IGlucHV0IGZyYW1lYnVm
ZmVyLgo+Cj4gVWggd2h5PyBGb3Igd3JpdGViYWNrIHdlJ3JlIHdyaXRpbmcgdGhlIG91dHB1dCB0
b28sIHNvIHdlIGNhbiB3cml0ZQo+IHdoYXRldmVyIHdlIHdhbnQgdG8gaW50byB0aGUgYWxwaGEg
Y2hhbm5lbC4gRm9yIHdyaXRlYmFjayB3ZSBzaG91bGQgbmV2ZXIKPiBhY2NlcHQgYSBwaXhlbCBm
b3JtYXQgd2hlcmUgYWxwaGEgYWN0dWFsbHkgbWF0dGVycywgdGhhdCBkb2Vzbid0IG1ha2UKPiBz
ZW5zZS4gWW91IGNhbid0IHNlZSB0aHJvdWdoIGEgcmVhbCBzY3JlZW4gZWl0aGVyLCB0aGV5IGFy
ZSBhbGwgb3BhcXVlIDotKQoKSSdtIG5vdCBzdXJlIGFib3V0IHRoYXQuIFNlZSBlLmcuCmh0dHBz
Oi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1NlZS10aHJvdWdoX2Rpc3BsYXkKCk1hbnkgZHJpdmVy
cyBhbHJlYWR5IGFjY2VwdCBGQnMgd2l0aCBhbHBoYSBjaGFubmVscyBmb3IgdGhlIHByaW1hcnkK
cGxhbmUuCmh0dHBzOi8vZHJtZGIuZW1lcnNpb24uZnIvZm9ybWF0cz9wbGFuZT0xCgpKdXN0IG1h
a2luZyBzdXJlIHdlIGFyZW4ndCBwYWludGluZyBvdXJzZWx2ZXMgaW50byBhIGNvcm5lci4gOlAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
