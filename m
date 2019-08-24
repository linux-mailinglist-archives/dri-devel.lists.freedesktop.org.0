Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333679BBF9
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 07:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505276E08C;
	Sat, 24 Aug 2019 05:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059446E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 05:23:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f21so3623558lfc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 22:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=u6/+wFW8V2VNoIXw+4p1fdQvpQu+HadJVx/6VAdQfK4=;
 b=k+k67p0BrNt6wvB/yGxqOmV3tSQqhGZKqEwkGW1naEhhWclsCvxpFJ8ZhtsmbqHxET
 lpQrUFR9zGu5I4ddCn4qQQjBasy8xHSIjuDnl838p0PzsiAT+rCBmC+LuK03JJhZhmkn
 l9i/SeUB+jyEq3T8wCDrv7x6/DuOuCELai2d4ReqbHY7itXxbPGxfB3uYPkiIYWpB6bt
 HXf5HaWsRbygPAtbCaZWJW0u8el5K6ZgODf28ZjFnujMg6n7KPfbdRnloszfI6P3rInG
 ICf4zGKL2KVRvj5BKNLDj+zMMBpgh49xndjPNckahaeg43h1s1KEG6uRVw6S/J7OIw0O
 lTFQ==
X-Gm-Message-State: APjAAAVWW6WOesTdxH5zkoIaZWDj8n26eAkPwHf+ZK13/dMqv/Q0goND
 I7K01H0EkFQhYdg+/rt3p5SpWXhORLBAEX1DqN9nFrOH
X-Google-Smtp-Source: APXvYqyMQ3B/fV6I229TFJGpuuSsZT/R+bhkUCO5DrGtNZcGvKbFfaPbfkJLfhpM5ATgbxw1Yo4Ijy2WGJW7Cu593cU=
X-Received: by 2002:a05:6512:4c8:: with SMTP id
 w8mr4697724lfq.98.1566624186100; 
 Fri, 23 Aug 2019 22:23:06 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 Aug 2019 15:22:55 +1000
Message-ID: <CAPM=9twtUmogvabQJD8CcazYfhWUjTUOyRkFomor77LbVDrcKA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.3-rc6 (the second coming)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=u6/+wFW8V2VNoIXw+4p1fdQvpQu+HadJVx/6VAdQfK4=;
 b=ucxSIsCZbsj+lVB6JqcvZX9B77ULKHjh/6W2T9/qDt1CJbcW5ei7Wy2UCd9OMwU749
 3xCfcA5sdqL66FCYNBi66rbRizZuCjqT/jttPnwVFeSgfZTpUKKhoLukzeT0GGwpqNQp
 CgUZdHeiU3FfDwMz6S+6UI029KNgZseQZEX0U/Fus0TLl7mapDuhX6HT0D/38PhSu0qG
 nXTZED2f2LIHAH4KF4P/RBHfI6rtgoEfSsSsuANxFd1YA2SNvSSWHq7r0xjT3jytYksg
 vanKmLjczKPR2Pux+q5VVA8MWhz098i9CRHT0BnTCqfQwMtr93pycEz/50m4QUMaazMt
 HtGw==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExpbnVzLAoKQWx0aG91Z2ggdGhlIHRyZWUgYnVpbHQgZm9yIG1lIGZpbmUgb24gYXJtIGhl
cmUsIGl0IGFwcGVhcnMgZWl0aGVyCmhlYWRlciBjbGVhbnVwcyBpbiBuZXh0IG9yIHNvbWUga2Nv
bmZpZyBjb21ibyBpdCBicmVha3MsIHNvIHRoaXMKY29udGFpbnMgYSBmaXggdG8gbWVkaWF0ZWsg
dG8gaW5jbHVkZSBkbWEtbWFwcGluZy5oIGV4cGxpY2l0bHkuCgpUaGVyZSB3YXMgYWxzbyBvbmUg
bm91dmVhdSBmaXggdGhhdCBjYW1lIGluIGxhdGUgdGhhdCBJIHdhcyBnb2luZyB0bwpsZWF2ZSB1
bnRpbCBuZXh0IHdlZWssIGJ1dCBzaW5jZSBJIHdhcyBzZW5kaW5nIHRoaXMgSSB0aG91Z2h0IGl0
IG1heQphcyB3ZWxsIGJlIGluIGhlcmUuCgpEYXZlLgoKZHJtLWZpeGVzLTIwMTktMDgtMjQ6CmRy
bSBmaXhlcyBmb3IgNS4zLXJjNiAocGFydCAyKQoKbWVkaWF0ZWs6Ci0gZml4IGJ1aWxkIGluIHNv
bWUgY2FzZXMKCm5vdXZlYXU6Ci0gZml4IGhhbmcgd2l0aCBpMmMgYW5kIG1zdCBkb2NrcwpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDc1NzEwZjA4ZWE3ZTQxYjJmNzAxMGRhM2Y2
ZGVhYjA2MWY3YTg1M2I6CgogIGRybS9hbWRncHUvcG93ZXJwbGF5OiBzaWxlbmNlIGEgd2Fybmlu
ZyBpbiBzbXVfdjExXzBfc2V0dXBfcHB0YWJsZQooMjAxOS0wOC0yMyAxMTo0NjozMiArMTAwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZpeGVzLTIwMTktMDgtMjQKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3ODM3OTUxYTEyZmRhZjg4ZDJjNTFmZjA3NTc5ODBj
MDAwNzI3OTBjOgoKICBkcm0vbWVkaWF0ZWs6IGluY2x1ZGUgZG1hLW1hcHBpbmcgaGVhZGVyICgy
MDE5LTA4LTI0IDE1OjA5OjIwICsxMDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0gZml4ZXMgZm9yIDUuMy1yYzYg
KHBhcnQgMikKCm1lZGlhdGVrOgotIGZpeCBidWlsZCBpbiBzb21lIGNhc2VzCgpub3V2ZWF1Ogot
IGZpeCBoYW5nIHdpdGggaTJjIGFuZCBtc3QgZG9ja3MKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRGF2ZSBBaXJsaWUgKDIp
OgogICAgICBNZXJnZSBicmFuY2ggJ2xpbnV4LTUuMycgb2YgZ2l0Oi8vZ2l0aHViLmNvbS9za2Vn
Z3NiL2xpbnV4IGludG8gZHJtLWZpeGVzCiAgICAgIGRybS9tZWRpYXRlazogaW5jbHVkZSBkbWEt
bWFwcGluZyBoZWFkZXIKCkx5dWRlIFBhdWwgKDEpOgogICAgICBkcm0vbm91dmVhdTogRG9uJ3Qg
cmV0cnkgaW5maW5pdGVseSB3aGVuIHJlY2VpdmluZyBubyBkYXRhIG9uIGkyYyBvdmVyIEFVWAoK
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgICB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2kyYy9hdXguYyB8IDI0ICsrKysrKysr
KysrKysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
