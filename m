Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC312A253
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1AD6E5C0;
	Tue, 24 Dec 2019 14:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 687 seconds by postgrey-1.36 at gabe;
 Tue, 24 Dec 2019 11:47:37 UTC
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655889C9C;
 Tue, 24 Dec 2019 11:47:37 +0000 (UTC)
Received: from [199.195.250.187] (port=52781 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1ijiTp-0004XE-5O; Tue, 24 Dec 2019 11:36:05 +0000
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 198A945CC4;
 Tue, 24 Dec 2019 11:35:39 +0000 (UTC)
Date: Tue, 24 Dec 2019 19:35:36 +0800
In-Reply-To: <CAFBinCCDmCHQW+nBHzsodz0R=GKoqv1EEzB=UY=ypFs4Q6MFmQ@mail.gmail.com>
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <20191216154803.GA3921@kevin>
 <CAFBinCCDmCHQW+nBHzsodz0R=GKoqv1EEzB=UY=ypFs4Q6MFmQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [Lima] [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: lima@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <54FE8BA3-BB70-4411-9FD9-4AE460097A95@aosc.io>
X-BlackCat-Spam-Score: 14
X-Spam-Status: No, score=1.4
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, yuq825@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAxOeW5tDEy5pyIMjTml6UgR01UKzA4OjAwIOS4i+WNiDc6Mjg6NDEsIE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IOWGmeWIsDoK
PkhpIEFseXNzYSwKPgo+T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgNDo0OCBQTSBBbHlzc2EgUm9z
ZW56d2VpZwo+PGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBJ
ZiBzbyBtdWNoIGNvZGUgaXMgYmVpbmcgZHVwbGljYXRlZCBvdmVyLCBJJ20gd29uZGVyaW5nIGlm
IGl0IG1ha2VzCj4+IHNlbnNlIGZvciB1cyB0byBtb3ZlIHNvbWUgb2YgdGhlIGNvbW1vbiBkZXZm
cmVxIGNvZGUgdG8gY29yZSBEUk0KPj4gaGVscGVycz8KPmlmIHlvdSBoYXZlIGFueSByZWNvbW1l
bmRhdGlvbiB3aGVyZSB0byBwdXQgaXQgdGhlbiBwbGVhc2UgbGV0IG1lIGtub3cKPihJIGFtIG5v
dCBmYW1pbGlhciB3aXRoIHRoZSBEUk0gc3Vic3lzdGVtIGF0IGFsbCkKPgo+bXkgaW5pdGlhbCBp
ZGVhIHdhcyB0aGF0IHRoZSBkZXZmcmVxIGxvZ2ljIG5lZWRzIHRoZSBzYW1lIGluZm9ybWF0aW9u
Cj50aGF0IHRoZSBzY2hlZHVsZXIgbmVlZHMgKHdoZXRoZXIgd2UncmUgc3VibWl0dGluZyBzb21l
dGhpbmcgdG8gYmUKPmV4ZWN1dGVkLCB0aGVyZSB3YXMgYSB0aW1lb3V0LCAuLi4pLgo+aG93ZXZl
ciwgbG9va2luZyBhdCBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyLyB0aGlzIHNlZW1zIHByZXR0
eQo+c3RhbmQtYWxvbmUgc28gSSdtIG5vdCBzdXJlIGl0IHNob3VsZCBnbyB0aGVyZQo+YWxzbyB0
aGUgTWFsaS00eDAgR1BVcyBoYXZlIHNvbWUgIlBNVSIgd2hpY2ggKm1heSogYmUgdXNlZCBpbnN0
ZWFkIG9mCgpJdCdzIG9wdGlvbmFsLiBXZSBjYW5ub3QgcHJvbWlzZSBpdHMgZXhpc3RhbmNlIG9u
IGEgZ2l2ZW4KaGFyZHdhcmUsIGFuZCBJIGhlYXJkIHRoYXQgYXQgbGVhc3Qgb24gQWxsd2lubmVy
IEg1IE1hbGkgUE1VCmlzIGJyb2tlbi4KCj5wb2xsaW5nIHRoZSBzdGF0aXN0aWNzIGludGVybmFs
bHkKPnNvIHRoaXMgaXMgd2hlcmUgSSByZWFsaXplIHRoYXQgd2l0aCBteSBjdXJyZW50IGtub3ds
ZWRnZSBJIGRvbid0IGtub3cKPmVub3VnaCBhYm91dCBsaW1hLCBwYW5mcm9zdCwgRFJNIG9yIHRo
ZSBkZXZmcmVxIHN1YnN5c3RlbSB0byBnZXQgYQo+Z29vZCBpZGVhIHdoZXJlIHRvIHB1dCB0aGUg
Y29kZS4KPgo+Cj5NYXJ0aW4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj5saW1hIG1haWxpbmcgbGlzdAo+bGltYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbGltYQoKLS0g
CuS9v+eUqCBLLTkgTWFpbCDlj5HpgIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH44CCCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
