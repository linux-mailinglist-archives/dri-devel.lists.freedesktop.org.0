Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F92AB2BF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2096E148;
	Fri,  6 Sep 2019 07:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A436E0B8;
 Thu,  5 Sep 2019 12:34:08 +0000 (UTC)
Received: from [0.0.0.0] (unknown [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.heh.ee (Postfix) with ESMTPSA id 05B9C16BF1F;
 Thu,  5 Sep 2019 15:34:06 +0300 (EEST)
Subject: Re: Xorg indefinitely hangs in kernelspace
To: Gerd Hoffmann <kraxel@redhat.com>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
 <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
From: Jaak Ristioja <jaak@ristioja.ee>
Openpgp: preference=signencrypt
Autocrypt: addr=jaak@ristioja.ee; prefer-encrypt=mutual; keydata=
 mDMEWyjlXBYJKwYBBAHaRw8BAQdABEPNmQfWmwZZXSl5vKnpI1UVtS4l2N9kv7KqyFYtfLe0
 IEphYWsgUmlzdGlvamEgPGphYWtAcmlzdGlvamEuZWU+iJYEExYIAD4WIQTjaPCMFhRItZ2p
 iV/uxscoTrbt3AUCWyjlXAIbIwUJA8OZNAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDu
 xscoTrbt3OYPAP9l6ZjLh4qK2r/H1b+7a7qZIAjwf0o4AX6qvtX1WERxywEAhhtOHg+G8idL
 FR08XPW7nlobl2qEHMnqBTqteSsz1gG4OARbKOVcEgorBgEEAZdVAQUBAQdAU6y3a2gcxTI+
 bZgPkJjPXxr0tvuLpCqkIb/envF5ajADAQgHiH4EGBYIACYWIQTjaPCMFhRItZ2piV/uxsco
 Trbt3AUCWyjlXAIbDAUJA8OZNAAKCRDuxscoTrbt3OG5AP0cd6gLbKVSBvSEgRNQ+BNk/1a5
 lSQtocXAcwUx0X9h0gEAqIZ9u7pCWBlRTL+rij97VWWkB/jb1deZ2gExNhd6RAU=
Message-ID: <e4b7d889-15f3-0c90-3b9f-d395344499c0@ristioja.ee>
Date: Thu, 5 Sep 2019 15:34:12 +0300
User-Agent: undefined
MIME-Version: 1.0
In-Reply-To: <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ristioja.ee; s=mail; 
 t=1567686846; bh=LFJJB8HaRCeJflug32dzVDXPw+towLk1sQP9ogor7+A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CZYFfli/f+r3GSXDHeu3Xk/mw2JOlWDFAjueuJ5OXXzuOkPEPJjx9D1A+z4lMpy8D
 J/U25+xiF3ZhAWaiX3eM96x67vZyCbKsePG8cD3KV73LpOd9u0J+JVrcu5CJHELu+N
 mJZOXBW9G41Y1oS9e/R96a4REJ3a/4zI+PLlQa6E=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMDkuMTkgMTA6MTQsIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMDYs
IDIwMTkgYXQgMDk6MDA6MTBQTSArMDMwMCwgSmFhayBSaXN0aW9qYSB3cm90ZToKPj4gSGVsbG8h
Cj4+Cj4+IEknbSB3cml0aW5nIHRvIHJlcG9ydCBhIGNyYXNoIGluIHRoZSBRWEwgLyBEUk0gY29k
ZSBpbiB0aGUgTGludXgga2VybmVsLgo+PiBJIG9yaWdpbmFsbHkgZmlsZWQgdGhlIGlzc3VlIG9u
IExhdW5jaFBhZCBhbmQgbW9yZSBkZXRhaWxzIGNhbiBiZSBmb3VuZAo+PiB0aGVyZSwgYWx0aG91
Z2ggSSBkb3VidCB3aGV0aGVyIHRoZXNlIGRldGFpbHMgYXJlIHVzZWZ1bC4KPiAKPiBBbnkgY2hh
bmdlIHdpdGgga2VybmVsIDUuMy1yYzcgPwoKRGlkbid0IHRyeS4gRGlkIHlvdSBjaGFuZ2Ugc29t
ZXRoaW5nPyBJIGNvdWxkIHRyeSwgYnV0IEkndmUgZG9uZSBzbwpiZWZvcmUgYW5kIGV2ZXJ5IHRp
bWUgdGhpcyBidWcgbWFuaWZlc3RzIGl0c2VsZiB3aXRoIE1BSk9SLk1JTk9SLXJjIyBJCmdldCBh
c2tlZCB0byB0cnkgdmVyc2lvbiBNQUpPUi4oTUlOT1IrMSktcmMjIHNvIEkgZ3Vlc3MgSSBjb3Vs
ZCBhcyB3ZWxsCmdpdmUgdXA/CgpBbHJpZ2h0LCBJJ2xsIGluc3RhbGwgNS4zLXJjNywgYnV0IG9u
Y2UgbW9yZSBpdCBtaWdodCB0YWtlIHNvbWUgdGltZSBmb3IKdGhpcyBidWcgdG8gZXhwb3NlIGl0
c2VsZi4KCk9uZSB0aGluZyB0byBub3RlIHRob3VnaCwgaXMgdGhhdCB0aGlzIG9jY3VycmVkIG11
Y2ggbW9yZSBvZnRlbiB3aXRoCm9sZGVyIGtlcm5lbHMgKG9yIG9sZGVyIHZlcnNpb25zIG9mIHRo
ZSBLdWJ1bnR1IGRlc2t0b3AvRmlyZWZveCBpbiBteQpWTSksIHNvbWV0aW1lcyBldmVuIHNldmVy
YWwgdGltZXMgaW4gYW4gaG91ciBvZiB1c2UuCgoKQmVzdCByZWdhcmRzLApKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
