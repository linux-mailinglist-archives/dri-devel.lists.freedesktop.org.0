Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FF1A90D
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530B896F7;
	Sat, 11 May 2019 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A702389AB7;
 Sat, 11 May 2019 17:09:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j24so6806606ljg.1;
 Sat, 11 May 2019 10:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jc2sq67GHfkt8a6DfX5BD5jFiy9VUsyYysgcb+GSqdY=;
 b=glMBKa1JTVDPzxUdfRLjLwLcEzPa2Os+VzgMnRhHMBcc6FBNriYbXslpdmFDxaRgYF
 12D2aZqCQQWpTqQGw+F8gbuxtPfRaDizqMn+7wVUYIMeduIMxuqM+GA4ABY1yzZ6Uykf
 7m2FYakNu7aYf9y1VxA6wcLWxLEf349+VtQw4539qNjngrSsKgEeNuy7yxl8rlCD4Y1f
 S0DBMcUn5G+3mgPVq2FIgQnyoUyCkGxw/IBlJb3EoliHzcQ4pkk0HIPtQ7i7OPYml0mn
 C2aYPR9JBn9aFabK5/kpdxhAnxvVMvZWku2fyfYCRbnBbxMIp183VvZslE0niK9QY7M3
 6g1w==
X-Gm-Message-State: APjAAAUyxmgcOPFzc1+sa848MBNKGHy5ArzRGmmUmLZXsMRcr6lqqm2y
 rPQk0/cWGSwUM44+bNXBmds=
X-Google-Smtp-Source: APXvYqwnjpEzzRU3HvIsOvN231lauKyHOahUPEE74FihBBsOYI5tc2MO4D7+9JeAvRMKphEFsn9qaA==
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr9127842ljm.62.1557594596093;
 Sat, 11 May 2019 10:09:56 -0700 (PDT)
Received: from localhost.localdomain
 (c-e295e355.03-206-616c6b1.bbcust.telenor.se. [85.227.149.226])
 by smtp.googlemail.com with ESMTPSA id n12sm2469661lfk.95.2019.05.11.10.09.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 May 2019 10:09:55 -0700 (PDT)
From: Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: fix duplication of nv50_head_atom struct
Date: Sat, 11 May 2019 19:08:31 +0200
Message-Id: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jc2sq67GHfkt8a6DfX5BD5jFiy9VUsyYysgcb+GSqdY=;
 b=PGAhBB2Ddzhp7Fbraaf0OTvMIAxsRPyrmCr1aDic2pAh4DeV3BdwYJyBz5nzZf1jtm
 FfWzqIzCl253cSd6+Wsltx3JFrdqUeG7iKLROkC7eIjn/JfGqLfwQM5Ds+ep37GWzGLU
 brSCeNShKprP0+3OPOL29Vkbv/u8XJVA0CXDprmjpFbm8dbMsVRUKAT2P/ug/ZTRoZUO
 VIz9qGuX19kgep6iNrQuoVV3WeJC/tdgZir0e2/fJ3FHYEHK8Ae5GQrR5ywfXAOFSCO3
 b18MPxdqTcvpvwMJLfG0bJWsww/+ykZgNE8cckjvg9xTza//lRk3SrmTvdY+9qnK57qA
 zMVA==
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
Cc: nouveau@lists.freedesktop.org,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bnY1MF9oZWFkX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoKSBtYWtlcyBhIGNvcHkgb2YgbnY1MF9o
ZWFkX2F0b20Kc3RydWN0LiBUaGlzIHBhdGNoIGFkZHMgY29weWluZyBvZiBzdHJ1Y3QgbWVtYmVy
IG5hbWVkICJvciIsIHdoaWNoCnByZXZpb3VzbHkgd2FzIGxlZnQgdW5pbml0aWFsaXplZCBpbiB0
aGUgZHVwbGljYXRlZCBzdHJ1Y3R1cmUuCgpEdWUgdG8gdGhpcyBidWcsIGluY29ycmVjdCBuaHN5
bmMgYW5kIG52c3luYyB2YWx1ZXMgd2VyZSBzb21ldGltZXMgdXNlZC4KSW4gbXkgcGFydGljdWxh
ciBjYXNlLCB0aGF0IGxlYWQgdG8gYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSBvdXRwdXQKcmVzb2x1
dGlvbiBvZiB0aGUgZ3JhcGhpY3MgZGV2aWNlIChHZUZvcmNlIEdUIDYzMCBPRU0pIGFuZCB0aGUg
cmVwb3J0ZWQKaW5wdXQgc2lnbmFsIHJlc29sdXRpb24gb24gdGhlIGRpc3BsYXkuIHhyYW5kciBy
ZXBvcnRlZCAxNjgweDEwNTAsIGJ1dAp0aGUgZGlzcGxheSByZXBvcnRlZCAxMjgweDEwMjQuIEFz
IGEgcmVzdWx0IG9mIHRoaXMgbWlzbWF0Y2gsIHRoZSBvdXRwdXQKb24gdGhlIGRpc3BsYXkgbG9v
a2VkIGxpa2UgaXQgd2FzIGNyb3BwZWQgKG9ubHkgcGFydCBvZiB0aGUgb3V0cHV0IHdhcwphY3R1
YWxseSB2aXNpYmxlIG9uIHRoZSBkaXNwbGF5KS4KCmdpdCBiaXNlY3QgcG9pbnRlZCB0byBjb21t
aXQgMmNhN2ZiNWMxY2M2ICgiZHJtL25vdXZlYXUva21zL252NTA6IGhhbmRsZQpTZXRDb250cm9s
T3V0cHV0UmVzb3VyY2UgZnJvbSBoZWFkIiksIHdoaWNoIGFkZGVkIHRoZSBtZW1iZXIgIm9yIiB0
bwpudjUwX2hlYWRfYXRvbSBzdHJ1Y3R1cmUsIGJ1dCBmb3Jnb3QgdG8gY29weSBpdCBpbgpudjUw
X2hlYWRfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSgpLgoKRml4ZXM6IDJjYTdmYjVjMWNjNiAoImRy
bS9ub3V2ZWF1L2ttcy9udjUwOiBoYW5kbGUgU2V0Q29udHJvbE91dHB1dFJlc291cmNlIGZyb20g
aGVhZCIpClNpZ25lZC1vZmYtYnk6IFBldGVyaXMgUnVkenVzaWtzIDxwZXRlcmlzLnJ1ZHp1c2lr
c0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9oZWFkLmMKaW5kZXggMmU3YTBjMzQ3ZGRiLi5hZGNlNjJmNGUxOGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMKQEAgLTQxMyw2ICs0MTMsNyBA
QCBudjUwX2hlYWRfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
CiAJYXN5aC0+b3ZseSA9IGFybWgtPm92bHk7CiAJYXN5aC0+ZGl0aGVyID0gYXJtaC0+ZGl0aGVy
OwogCWFzeWgtPnByb2NhbXAgPSBhcm1oLT5wcm9jYW1wOworCWFzeWgtPm9yID0gYXJtaC0+b3I7
CiAJYXN5aC0+ZHAgPSBhcm1oLT5kcDsKIAlhc3loLT5jbHIubWFzayA9IDA7CiAJYXN5aC0+c2V0
Lm1hc2sgPSAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
