Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B105B46A0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 06:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5DC6E060;
	Tue, 17 Sep 2019 04:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A366E060
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 04:53:34 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id b1so1161661vsr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 21:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CtOzsuDtZRRmlAjyo8qnVgp9R8D/vRJkDqyMYP/VQz0=;
 b=hu+K20lb7OlH9LbJyxM1qHh98LzjTGvqJkkokUwW8mnqu/hvAa7ulDzhCeN/HW0Wo7
 tkijsop2BaZYr4xHXcJXdnaEScvWRe4Ybk2skw35xJuJ/4CTsVWzSZjGDACWHuVAjr+j
 Q5cxTjsMUVx3A9xwsvp4TASVOouNDBhgkmdZKqveqi6YRBb2b43eh/2Yz4ATHSwkZBJy
 HQ/jeqHb+oBNVvJhQNh0vZ51AWc+4kFC7/RHLFlVuraGnXFqj2v1lEI2izmUE/GUC+tO
 Fp2hALYXrMonNHq0v5vSiQfBRx2ONtDY86kdcUkO+ZR0FJ5ugw75IazvKaGp4RbRlEkA
 34eA==
X-Gm-Message-State: APjAAAWj2eYfW4aN09qrS3Fo/SpNwgD8I8SE0QII8xUzm7n42IZHHCmb
 +haLInPxraHkzQL+WIjK9mbTHUv6IpT2u/QeGjjZQFQ1
X-Google-Smtp-Source: APXvYqxu/O4A6NqeGlYq80R9ejvSNYrIJlagKypeaoeCW3cbJh/ENeh3Zv9L7llVLejAcRWx/1N6rc02zf7ZKB3xICE=
X-Received: by 2002:a67:2981:: with SMTP id p123mr788255vsp.121.1568696013699; 
 Mon, 16 Sep 2019 21:53:33 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 17 Sep 2019 14:53:22 +1000
Message-ID: <CACAvsv5bLthhq7kh04A0JKxGnBdOTCxiu0hs7FZ1x3_9Rc9YoA@mail.gmail.com>
Subject: nouveau-next-5.4
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CtOzsuDtZRRmlAjyo8qnVgp9R8D/vRJkDqyMYP/VQz0=;
 b=C5gP14zQ+Ja6dy8Qit+RUPclhbRcJdd8k2Ihf31eRekQChIsnkSFUGGHSqBSSb8zR8
 skeMm7rDq24ohWhWsTOSpzKeM5UMeTElUs6rAhZj//WQtFu52KP1hZruEHzOL+U0vfv3
 52PN1acFQgfkMSBBNMhzFtSgNTwBWX6MNtdaqVk+wrtCHL0YrVTYaKms35o7T+VMkp0M
 50bIpIQZMlO38K7+xp64Qq5aBg1bcwgM+IfQ60GBmLFV2qEVvKbm5nAskb1euDLKHC2r
 grQ4g/0QIsGEkOElP59UlAUqtBT9w5BZ6sSatKcrdqr7LI05tvooMWjDxPKLCkHp46FF
 a+3g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IERhdmUsCgpBIGNvdXBsZSBvZiBmaXhlcyBmcm9tIFRoaWVycnkgZml4aW5nIGlzc3VlcyBh
cyBhIHJlc3VsdCBvZiB0aGUKcmVzZXJ2YXRpb24gb2JqZWN0IHJld29yayBpbiB0aGlzIGN5Y2xl
LCBhcyB3ZWxsIGFzIGEgZml4IGZyb20gTHl1ZGUKdG8gYWxsb3cgdGhlIGRyaXZlciB0byBsb2Fk
IG9uIFRoaW5rcGFkIFA3MS4KClRoYW5rcywKQmVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCA5YTYwYjI5OTBkNmMyYjdhYjkzNWZlMGE1Y2MyNzRkZTY3ZDk4YmVkOgoKICBN
ZXJnZSBicmFuY2ggJ2V0bmF2aXYvbmV4dCcgb2YKaHR0cHM6Ly9naXQucGVuZ3V0cm9uaXguZGUv
Z2l0L2xzdC9saW51eCBpbnRvIGRybS1uZXh0ICgyMDE5LTA5LTA2CjE2OjU4OjEwICsxMDAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdGh1Yi5j
b20vc2tlZ2dzYi9saW51eCBsaW51eC01LjQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBiNTY4ZGI2MmM1YzQ2YzhkODU5ZjFiOTUzODQ5NWVhMGZjYmU3MDAwOgoKICBkcm0vbm91dmVh
dS9iYXIvZ20yMGI6IEF2b2lkIEJBUjEgdGVhcmRvd24gZHVyaW5nIGluaXQgKDIwMTktMDktMTcK
MTQ6NTA6MTYgKzEwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkx5dWRlIFBhdWwgKDEpOgogICAgICBkcm0vbm91dmVh
dS9rbXMvbnY1MC06IERvbid0IGNyZWF0ZSBNU1RNcyBmb3IgZURQIGNvbm5lY3RvcnMKClRoaWVy
cnkgUmVkaW5nICg0KToKICAgICAgZHJtL25vdXZlYXU6IEZpeCBmYWxsb3V0IGZyb20gcmVzZXJ2
YXRpb24gb2JqZWN0IHJld29yawogICAgICBkcm0vbm91dmVhdS9wcmltZTogRXh0ZW5kIERNQSBy
ZXNlcnZhdGlvbiBvYmplY3QgbG9jawogICAgICBkcm0vbm91dmVhdTogRml4IG9yZGVyaW5nIGJl
dHdlZW4gVFRNIGFuZCBHRU0gcmVsZWFzZQogICAgICBkcm0vbm91dmVhdS9iYXIvZ20yMGI6IEF2
b2lkIEJBUjEgdGVhcmRvd24gZHVyaW5nIGluaXQKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmMgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKystLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uaCAgICAgICAgICAgIHwgIDQgKystLQog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYyAgICAgICAgICAgfCAgNyArKy0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgICAgICAgICB8IDI3
ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2Jhci9nbTIwYi5jIHwgIDEgLQogNiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
