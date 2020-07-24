Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5022BD3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 06:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72FE6E91E;
	Fri, 24 Jul 2020 04:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75A56E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 04:56:52 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v18so299872ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=39B552rOVuQr2Xg7u2Ye/tXd5T1f52cUplKQU/FRNlw=;
 b=lk71s0ceyeNzvR5egC7cotmpELo+FlzHVdaL78nod0JX7N/1c4RaQ1+kDV6zxEYSLc
 Ny3MumicKcO4LwyzG0VVnkmWc9+LM6KjDuWy9SgaXSsy84pFWr+gs65v6zr24qW5N7uy
 mDpaodRrBDKer0NEIQXA/Oc5CTGiyzAx4ofzACG10B0DzECKpy+Z1KQs5bxGYbj8Tgzm
 h32Ztl0tlstvty1/GHamN/I6SHgGDP7QVhtII4Kz3NX0kfR5ZrbEojRL2q1ZoN5PPx24
 ThDEKtEgddVtO1RUii/uHFuXT1+F5X22Y3ZImlFctji6NuMTxxyr+t4qgGHTXgaKL223
 Ok8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=39B552rOVuQr2Xg7u2Ye/tXd5T1f52cUplKQU/FRNlw=;
 b=fDUu0IO6XLTkqu57jChMj8GmPhbKLqd2CD0Ecq30kYSVhK5jMzrtag1vfQnN7t4lDb
 xXVj7zB9Xk5sETJktA5NodjWMYWQ1yjzO09JD1Qpl2nzvT6H8QEtXFl85c3F0nd85vqD
 XNSa+sjxMs5HTbICigRjrz4DPeg1Za1vKRV1EUMb+QOB7/0WA5Z8uPz8lhhdbp4NVfy4
 Zge23pQk3ewJLzmc1m0dIpRM7P+dzSRjZTi+L2PNv+QCUArYX0Eb2aBv8gUIlETk2aHi
 iCp260CdU90TSF/VBo9OxOOheGc57+f56Epo2wkz+SofjEnOpRbZwaBI4pi/35DQDWuo
 lvjw==
X-Gm-Message-State: AOAM5314KFeFVS1ZfFbDB12V8MMbz16whpr22JSQrJ1oMiB30J+2I7nr
 iXPDm+EuVcJ4K0GlG91ljvxWnMfU0mcMNHriKv4=
X-Google-Smtp-Source: ABdhPJyQZgKurdxHDzMjEVHATc+iSgxDpC/lesn76a1ODXYSuHXO6rl/8gY1v481ZRWJeQp8CdFlX9i6BtV84rQnfyY=
X-Received: by 2002:a17:906:8782:: with SMTP id
 za2mr5218765ejb.419.1595566611256; 
 Thu, 23 Jul 2020 21:56:51 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Jul 2020 14:56:40 +1000
Message-ID: <CAPM=9twWoMc=xxXnZ7kKYp_fmYEquLE=PgVtjPhcH86Ocv3W7g@mail.gmail.com>
Subject: [git pull] drm fixes for 5.8-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVpZXQgZml4ZXMsIEkgbWF5IGhhdmUgYSBzaW5nbGUgcmVncmVzc2lvbiBmaXggZm9sbG93IHVw
IHRvIHRoaXMgZm9yCm5vdXZlYXUsIGJ1dCBpdCBtaWdodCBiZSBuZXh0IHdlZWssIEJlbiB3YXMg
dGVzdGluZyBpdCBhIGJpdCBtb3JlIC4KCk90aGVyd2lzZSB0d28gYW1kZ3B1IGZpeGVzLCBvbmUg
bGltYSBhbmQgb25lIHN1bjRpLgoKRGF2ZS4KCmRybS1maXhlcy0yMDIwLTA3LTI0Ogpkcm0gZml4
ZXMgZm9yIDUuNi1yYzcKCmFtZGdwdToKLSBGaXggY3Jhc2ggd2hlbiBvdmVyY2xvY2tpbmcgVmVn
YU0KLSBGaXggcG9zc2libGUgY3Jhc2ggd2hlbiBlZGl0aW5nIGRwbSBsZXZlbHMKCnN1bjRpOgot
IEZpeCBpbnZlcnRlZCBIUEQgcmVzdWx0OyBmaXhlcyBhbiBlYXJsaWVyIGZpeAoKbGltYToKLSBm
aXggdGltZW91dCBkdXJpbmcgcmVzZXQKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCBiYTQ3ZDg0NWQ3MTVhMDEwZjdiNTFmNmY4OWJhZTMyODQ1ZTZhY2I3OgoKICBMaW51eCA1Ljgt
cmM2ICgyMDIwLTA3LTE5IDE1OjQxOjE4IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0g
dGFncy9kcm0tZml4ZXMtMjAyMC0wNy0yNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGQ4OTA0Y2E5ZDMzOGNkYWE2N2UzYmQwNmQ3YTdkNDE4ZTQyNjY0OGM6CgogIE1lcmdlIHRhZyAn
YW1kLWRybS1maXhlcy01LjgtMjAyMC0wNy0yMicgb2YKZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9w
Lm9yZy9+YWdkNWYvbGludXggaW50byBkcm0tZml4ZXMgKDIwMjAtMDctMjMKMTQ6MDY6MTYgKzEw
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmRybSBmaXhlcyBmb3IgNS42LXJjNwoKYW1kZ3B1OgotIEZpeCBjcmFzaCB3
aGVuIG92ZXJjbG9ja2luZyBWZWdhTQotIEZpeCBwb3NzaWJsZSBjcmFzaCB3aGVuIGVkaXRpbmcg
ZHBtIGxldmVscwoKc3VuNGk6Ci0gRml4IGludmVydGVkIEhQRCByZXN1bHQ7IGZpeGVzIGFuIGVh
cmxpZXIgZml4CgpsaW1hOgotIGZpeCB0aW1lb3V0IGR1cmluZyByZXNldAoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaGVu
LVl1IFRzYWkgKDEpOgogICAgICBkcm06IHN1bjRpOiBoZG1pOiBGaXggaW52ZXJ0ZWQgSFBEIHJl
c3VsdAoKRGF2ZSBBaXJsaWUgKDIpOgogICAgICBNZXJnZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIw
MjAtMDctMjInIG9mCmdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBp
bnRvIGRybS1maXhlcwogICAgICBNZXJnZSB0YWcgJ2FtZC1kcm0tZml4ZXMtNS44LTIwMjAtMDct
MjInIG9mCmdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4IGludG8gZHJt
LWZpeGVzCgpQYXdlxYIgR3Jvbm93c2tpICgxKToKICAgICAgZHJtL2FtZGdwdTogRml4IE5VTEwg
ZGVyZWZlcmVuY2UgaW4gZHBtIHN5c2ZzIGhhbmRsZXJzCgpRaWFuZyBZdSAoMSk6CiAgICAgIGRy
bS9saW1hOiBmaXggd2FpdCBwcCByZXNldCB0aW1lb3V0CgpRaXUgV2VuYm8gKDEpOgogICAgICBk
cm0vYW1kL3Bvd2VycGxheTogZml4IGEgY3Jhc2ggd2hlbiBvdmVyY2xvY2tpbmcgVmVnYSBNCgog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICAgICAgICAgIHwgIDkg
KysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211
bWdyLmMgfCAxMCArKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3BwLmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hk
bWlfZW5jLmMgICAgICAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
