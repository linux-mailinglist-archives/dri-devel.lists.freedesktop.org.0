Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231A384E9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9766899C4;
	Fri,  7 Jun 2019 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552B899C4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:24:40 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id a27so658206qkk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 00:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=upxfiQQnJywJa1F/KiFsxdZWOGwi2RbI5YVXjOiY4iI=;
 b=Cc2KaW9P7tNJdAEb0sZijZpvN0sUM/2g8WFd2S20B8LfbhY1x56chP5sMogUFYe2qh
 Iq8Wr7BSLs5ToxMP+B1bwehmPB/Bw9I/wS9XT0sKja/ZFvYishsNEpLbjootnXC645E5
 PCpiyPboijITTsONmoEa4oyXHqYuUmLpbMgj/XKNUGhH5uB1HQplmEO7AEKgzN4AVMo2
 Kwht983HcfXAGSeRx9Rp5P0FAKC6D9UL83+Wb5uWob4z64CwFOzFIUphKg+CodmMNDIG
 K8pbDzS7bBiUTKLiTYAFYPyIKe0F5AdAEeagaqAyZp6n3/M97WG140qBZcR9ZS+LvKzx
 jjvg==
X-Gm-Message-State: APjAAAUWE/E6GDGwZNlwtb3UJiROcmUB6w5eZkWjm1TKwdsb61TGJFRL
 21tIu+iPYR3zEphZh5bJ/FwBhCzFTIChdaYPAeM=
X-Google-Smtp-Source: APXvYqzXvVkJDxwxnFjgBUA6OkoDsgeKkRLbElndupZT23zuOYix0hv8pQL879VOyXDrpHllYR1kAqgZkiNzNE06JkE=
X-Received: by 2002:a37:6ac3:: with SMTP id
 f186mr26168126qkc.281.1559892279236; 
 Fri, 07 Jun 2019 00:24:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Jun 2019 17:24:28 +1000
Message-ID: <CAPM=9tx_2-ANvU3CsasrHkaJsyRV+NxP1AoM0ZSu8teht3FuEg@mail.gmail.com>
Subject: [git pull] drm fixes for v5.2-rc4 (v2)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=upxfiQQnJywJa1F/KiFsxdZWOGwi2RbI5YVXjOiY4iI=;
 b=mKOz5FfrHM2STpMbV4QElYph4nVwnRJVCxEm6ysQTQ7q7GyAM5l/dnj+hT5Qil4LVO
 cAU1tZlIgNsoasjiD3LfYJEgG9omser+FmBh22p4IcDF9NBMaKYDQyHQh3+/AL4vfGFh
 RWSXoCMCND0Tte5VXVA83RoypicC/KQA/2nSwGPAX/I7mjoerFPR3Pt9ocKj6hq0ryqq
 5tuYlVtZLIIpuhWF1RlaKk1OhSlWkqUjXNBV0bJza9kGgydkVQ6SKamnTqVB6QtqSzJa
 joxquyZYDbj+wrOca276vY1cOlM7ADAcoYx2IdVTlB7E53UO6T6ZWurWIAh39bk7o/Pe
 7ZMg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExpbnVzLAoKQSBzbWFsbCBiaXQgbW9yZSBsaXZlbHkgdGhpcyB3ZWVrIGJ1dCBub3QgbWFq
b3JseSBzby4gSSdtIGF3YXkgaW4KSmFwYW4gbmV4dCB3ZWVrIGZvciBmYW1pbHkgaG9saWRheSwg
c28gSSdsbCBiZSBwcmV0dHkgZGlzY29ubmVjdGVkLApJJ3ZlIGFza2VkIERhbmllbCB0byBkbyBm
aXhlcyBmb3IgdGhlIHdlZWsgd2hpbGUgSSdtIG91dC4KCkkgc2VudCB0aGlzIG91dCBlYXJsaWVy
LCBidXQgSSBmb3Jnb3QgdGhlIHN1YmplY3QsIGFuZCB0aGVuIEJlbiBhc2tlZAphYm91dCBzb21l
IG5vdXZlYXUgZmlybXdhcmUgZml4ZXMuIFRoZSBub3V2ZWF1IGZpcm13YXJlIGNoYW5nZXMgYXJl
IGEKYml0IGxhcmdlLCBidXQgdGhleSBhZGRyZXNzIGEgYmlnIHByb2JsZW0gd2hlcmUgYSB3aG9s
ZSBzZXQgb2YgYm9hcmRzCmRvbid0IGxvYWQgd2l0aCB0aGUgZHJpdmVyLCBhbmQgdGhlIG5ldyBm
aXJtd2FyZSBmaXhlcyB0aGF0LCBzbyBJCnRoaW5rIGl0J3Mgd29ydGggdHJ5aW5nIHRvIGxhbmQg
aXQgbm93LgoKY29yZToKLSBBbGxvdyBmYiBjaGFuZ2VzIGluIGFzeW5jIGNvbW1pdHMgKGRyaXZl
cnMgYXMgd2VsbCkKCnVkbWFidWY6Ci0gVW5tYXAgc2NhdHRlcmxpc3Qgd2hlbiB1bm1hcHBpbmcg
dWRtYWJ1ZgoKbm91dmVhdToKLSBmaXJtd2FyZSBsb2FkaW5nIGZpeGVzIGZvciBzZWNib290IGZp
cm13YXJlIG9uIG5ldyBHUFUgcmV2aXNpb24uCgprb21lZGE6Ci0gb29wcywgZG1hIG1hcHBpbmcg
YW5kIHdhcm5pbmcgZml4ZXMKCmFybS1oZGxjZDoKLSBjbG9jayBmaXhlcywKLSBtb2RlIHZhbGlk
YXRpb24gZml4CgppOTE1OgotIEFkZCBhIG1pc3NpbmcgSWNlbGFrZSB3b3JrYXJvdW5kCi0gR1ZU
IC0gRE1BIG1hcCBmYXVsdCBmaXggYW5kIGVuZm9yY2VtZW50IGZpeGVzCgphbWRncHU6Ci0gRENF
IHJlc3VtZSBmaXgKLSBOZXcgcmF2ZW4gdmFyaWF0aW9uIHVwZGF0ZXMKCkRhdmUuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
