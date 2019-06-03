Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309DD33FBD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF2E896D8;
	Tue,  4 Jun 2019 07:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93AE890F7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 11:57:27 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r10so15781617otd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 04:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s8IrT+ZVUu/ua1eJGDjSCYHjA3EdBkhtlk4Nvg1NcZI=;
 b=Q8wPA1N3tqleclb7l5I1lDKcTbbniMVfZ2lV2pZvNHUEBZ5U+BIioDgQRhNXHo+IYW
 eYXXqaqY9IV7pY7EKzBNht97CgUC3O23ZSGc/TlTnYfd1vblCvXrMDeFXMLkosVKHcqr
 HqCoW57L4abYgA0aoppgwzFYTzBTyBytHVlcyFRvrdCZYgTwPzIlp2BNEzALoMLROPuN
 I5nnZSDiagXd42fjmI/pJVruSktHvQxfTAFxndfuXrLSY4HjegInSX7VZpunUVg2pQ4W
 4a7rf8s6g9p1lizjeCqCp8AZekkgkryBqy49ecHRufRAkbogyr/iskyad/xUlhSKIcxj
 ptPg==
X-Gm-Message-State: APjAAAWkClOsRWd2UcuwzdklnUP5va80Cq0qr0Wqomi5kHO2Ugg2Gxac
 cboAWf+xptIiXQEPDWBWan3iYusFHGvWBmgQrlk=
X-Google-Smtp-Source: APXvYqyLGMR9eX3q7uVsJJpJKv/kzwezOPp0H91F9vHs+NwF7iG+KvgbNZf2f3fdLFx9TbtDOTz65UlzBbXFgWuKqE8=
X-Received: by 2002:a9d:68c2:: with SMTP id i2mr852060oto.59.1559563046881;
 Mon, 03 Jun 2019 04:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
 <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
In-Reply-To: <1559560752-12314-1-git-send-email-shobhitkukreti@gmail.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 3 Jun 2019 13:57:13 +0200
Message-ID: <CA+7wUswkGyBrnbAZrA57PcxTb1jB=dLkv9SYXT05A2fX8Mb0jw@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: Fix Warning comparing pointer to 0
 reported by coccicheck
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAxOjIxIFBNIDxzaG9iaGl0a3VrcmV0aUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gRnJvbTogU2hvYmhpdCBLdWtyZXRpIDxzaG9iaGl0a3VrcmV0aUBnbWFpbC5j
b20+Cj4KPiBGaXhlZCBXYXJuaW5nIENvbXBhcmluZyBQb2ludGVyIHRvIDAuIENoYW5nZWQgcmV0
dXJuIHZhbHVlIHRvIC1FTk9NRU0gdG8KPiByZXBvcnQga3phbGxvYyBmYWlsdXJlCj4KPiBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBXQVJOSU5HIGNvbXBhcmluZyBwb2ludGVyIHRv
IDAKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBXQVJOSU5HIGNvbXBhcmluZyBw
b2ludGVyIHRvIDAKPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBXQVJOSU5HIGNv
bXBhcmluZyBwb2ludGVyIHRvIDAKPgo+IFNpZ25lZC1vZmYtYnk6IFNob2JoaXQgS3VrcmV0aSA8
c2hvYmhpdGt1a3JldGlAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gTW9k
aWZpZWQgY29tbWl0IG1lc3NhZ2UgdG8gcmVwb3J0IGNoYW5nZSBpbiByZXR1cm4gdHlwZQo+Cj4g
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29u
dHJvbGZiLmMKPiBpbmRleCA3YWY4ZGIyLi4wNzkwN2M1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29udHJvbGZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRy
b2xmYi5jCj4gQEAgLTE4Miw3ICsxODIsNyBAQCBpbnQgaW5pdF9tb2R1bGUodm9pZCkKPiAgICAg
ICAgIGludCByZXQgPSAtRU5YSU87Cj4KPiAgICAgICAgIGRwID0gb2ZfZmluZF9ub2RlX2J5X25h
bWUoTlVMTCwgImNvbnRyb2wiKTsKPiAtICAgICAgIGlmIChkcCAhPSAwICYmICFjb250cm9sX29m
X2luaXQoZHApKQo+ICsgICAgICAgaWYgKGRwICE9IE5VTEwgJiYgIWNvbnRyb2xfb2ZfaW5pdChk
cCkpCj4gICAgICAgICAgICAgICAgIHJldCA9IDA7Cj4gICAgICAgICBvZl9ub2RlX3B1dChkcCk7
Cj4KPiBAQCAtNTgwLDcgKzU4MCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnRyb2xfaW5pdCh2
b2lkKQo+ICAgICAgICAgY29udHJvbF9zZXR1cChvcHRpb24pOwo+Cj4gICAgICAgICBkcCA9IG9m
X2ZpbmRfbm9kZV9ieV9uYW1lKE5VTEwsICJjb250cm9sIik7Cj4gLSAgICAgICBpZiAoZHAgIT0g
MCAmJiAhY29udHJvbF9vZl9pbml0KGRwKSkKPiArICAgICAgIGlmIChkcCAhPSBOVUxMICYmICFj
b250cm9sX29mX2luaXQoZHApKQo+ICAgICAgICAgICAgICAgICByZXQgPSAwOwo+ICAgICAgICAg
b2Zfbm9kZV9wdXQoZHApOwo+Cj4gQEAgLTY4Myw4ICs2ODMsOCBAQCBzdGF0aWMgaW50IF9faW5p
dCBjb250cm9sX29mX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpkcCkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTlhJTzsKPiAgICAgICAgIH0KPiAgICAgICAgIHAgPSBremFsbG9jKHNpemVv
ZigqcCksIEdGUF9LRVJORUwpOwo+IC0gICAgICAgaWYgKHAgPT0gMCkKPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTlhJTzsKPiArICAgICAgIGlmIChwID09IE5VTEwpCgpuaXQ6IEkgd291bGQg
aGF2ZSB1c2UgYCFwYCAoc2FtZSBmb3IgdGhlIG90aGVycyBhYm92ZSkuIE1heWJlCmNoZWNrcGF0
Y2ggd2l0aCAtLXN0cmljdCB3b3VsZCB3YXJuIGZvciB0aG9zZSAoY2FuJ3QgcmVtZW1iZXIgZnJv
bSB0b3AKb2YgbXkgaGVhZCkuCgpBbnl3YXk6CgpSZXZpZXdlZC1ieTogTWF0aGlldSBNYWxhdGVy
cmUgPG1hbGF0QGRlYmlhbi5vcmc+Cgo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
PiAgICAgICAgIGNvbnRyb2xfZmIgPSBwOyAvKiBzYXZlIGl0IGZvciBjbGVhbnVwcyAqLwo+Cj4g
ICAgICAgICAvKiBNYXAgaW4gZnJhbWUgYnVmZmVyIGFuZCByZWdpc3RlcnMgKi8KPiAtLQo+IDIu
Ny40Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
