Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8466BDA1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4F46E051;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3440893EC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:58:07 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id x24so26387824ioh.16
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=xGhpke50w1HUdO4d+bMv4tRJs7OApHioe/mQSw+3RDI=;
 b=J209v1cxs3Br0Z6w8n7AouT8NrN+sdAU7vCmgF1eTjBTQkv3z/PW5plG5ulI4kWdm2
 gBONFNxgo40tH9/q+FI0MtyFjamKU59I34y3S6hp2GIxyA527OcEKyO4cVY7Gz8Fkeoe
 CFsIsA4IKdSLBaAchBUDyhnfVrs3n2/gZwKpJCi86nmfVo/MJv0mrsf2d8a2bH4a/h9J
 wmuafgsysFltl5WIiL03/Bi5mt1QKWQ8pCYqyT4xNCowSFpoJtqnnW0/YjTMkCe1CE/B
 KGX6FOfImtYlXbGXFj3sRkpdJaUltWoMp8uy0O1CGPXOUDqd5OoYTrpp6eQx/A+F/4sC
 jKGQ==
X-Gm-Message-State: APjAAAUkv2x5ePk3A1AMb0zeDpSUF7mJQEIeT3VKWJRqWfyUvYoWJlJK
 CikNYca1MftIuaJau9fkYpfGyOHMvTw3TzuKGfIJHdrqlEF8
X-Google-Smtp-Source: APXvYqw7It60pOBuNYJfJLi1piGKUvvfXpqDCoRvvkiel4I1k+kLvg6kN7FksQE73xl+q4o2wU76sxcen7uKp5mgmj9gq5yWQ7Dj
MIME-Version: 1.0
X-Received: by 2002:a5d:9e48:: with SMTP id i8mr34368541ioi.51.1563353887164; 
 Wed, 17 Jul 2019 01:58:07 -0700 (PDT)
Date: Wed, 17 Jul 2019 01:58:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001a51c4058ddcb1b6@google.com>
Subject: kernel panic: stack is corrupted in pointer
From: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 ast@kernel.org, christian.koenig@amd.com, daniel@iogearbox.net, 
 david1.zhou@amd.com, dri-devel@lists.freedesktop.org, leo.liu@amd.com, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBjcmFzaCBvbjoKCkhFQUQgY29tbWl0
OiAgICAxNDM4Y2RlNyBBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAxOTA3MTYK
Z2l0IHRyZWU6ICAgICAgIGxpbnV4LW5leHQKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEzOTg4MDU4NjAwMDAwCmtlcm5lbCBjb25maWc6
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD0zNDMwYTE1MWUxNDUy
MzMxCmRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0
aWQ9NzlmNWYwMjgwMDVhNzdlY2I2YmIKY29tcGlsZXI6ICAgICAgIGdjYyAoR0NDKSA5LjAuMCAy
MDE4MTIzMSAoZXhwZXJpbWVudGFsKQpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xMTFmYzhhZmEwMDAwMAoKVGhlIGJ1ZyB3YXMgYmlz
ZWN0ZWQgdG86Cgpjb21taXQgOTZhNWQ4ZDQ5MTVmM2UyNDFlYmI0OGQ1ZGVjZGQxMTBhYjljN2Rj
ZgpBdXRob3I6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KRGF0ZTogICBGcmkgSnVsIDEzIDE1
OjI2OjI4IDIwMTggKzAwMDAKCiAgICAgZHJtL2FtZGdwdTogTWFrZSBzdXJlIElCIHRlc3RzIGZs
dXNoZWQgYWZ0ZXIgSVAgcmVzdW1lCgpiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTRhNDYyMDA2MDAwMDAKZmluYWwgY3Jhc2g6ICAg
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE2YTQ2MjAwNjAw
MDAwCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50
eHQ/eD0xMmE0NjIwMDYwMDAwMAoKSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBidWcsIHBsZWFz
ZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1pdDoKUmVwb3J0ZWQtYnk6IHN5emJv
dCs3OWY1ZjAyODAwNWE3N2VjYjZiYkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkZpeGVzOiA5
NmE1ZDhkNDkxNWYgKCJkcm0vYW1kZ3B1OiBNYWtlIHN1cmUgSUIgdGVzdHMgZmx1c2hlZCBhZnRl
ciBJUCAgCnJlc3VtZSIpCgpLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVj
dG9yOiBLZXJuZWwgc3RhY2sgaXMgY29ycnVwdGVkIGluOiAgCnBvaW50ZXIrMHg3MDIvMHg3NTAg
bGliL3ZzcHJpbnRmLmM6MjE4NwpTaHV0dGluZyBkb3duIGNwdXMgd2l0aCBOTUkKS2VybmVsIE9m
ZnNldDogZGlzYWJsZWQKCgotLS0KVGhpcyBidWcgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBt
YXkgY29udGFpbiBlcnJvcnMuClNlZSBodHRwczovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5m
b3JtYXRpb24gYWJvdXQgc3l6Ym90LgpzeXpib3QgZW5naW5lZXJzIGNhbiBiZSByZWFjaGVkIGF0
IHN5emthbGxlckBnb29nbGVncm91cHMuY29tLgoKc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0
aGlzIGJ1ZyByZXBvcnQuIFNlZToKaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93
IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90LgpGb3IgaW5mb3JtYXRpb24gYWJvdXQgYmlzZWN0
aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCnN5emJvdCBj
YW4gdGVzdCBwYXRjaGVzIGZvciB0aGlzIGJ1ZywgZm9yIGRldGFpbHMgc2VlOgpodHRwczovL2dv
by5nbC90cHNtRUojdGVzdGluZy1wYXRjaGVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
