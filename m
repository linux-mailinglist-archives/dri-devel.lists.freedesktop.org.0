Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71684113C8D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C386F5A2;
	Thu,  5 Dec 2019 07:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD36E94E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 21:41:02 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id k9so829415ili.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 13:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=JrNPfPX8ooL5t/Vw7RYAMqCMbF8rwCtCqkj0exct6ns=;
 b=iCaFFRkdbEe87bv08nyeJuwLufN8Ovit/H+nmQKXeXLXCVSsD8i66QmWHdQVhmrkOO
 HLcf889q6N9jzfUQi2dfVyHK0fyxgu6VkD/oqcWmlMEwSlKQkaqQljEKz4im3sjJpYWm
 fHyZDmnfg9quO8DW9N9NTjCZZbo8aoN//qN9dEA4jJ79xNc01rJQRTNrxpPr69cy2H2x
 CsyZ2SFMDflUXL4UzTIYV0Ead4PIiMHplk62UMbKdnsEjxOenvnRcutBj4Jco+x3/ypu
 InM83XyTKU8hrdks7kBZeGWhnh8aL0JSSlbYO59Hw0gobI3NIKZ4PdnTMq0R3NqnUvvl
 h3QA==
X-Gm-Message-State: APjAAAX4UpRnMx9C2ECQyMe1p004SOYFWZu+Lh7g+YvXaWufc/uQPj3q
 F7hhgeWRQ+JwB/2nt6MrMJjHVliP9zgiBvc8cje6Imhbx5be
X-Google-Smtp-Source: APXvYqweHEd887dmgHwZ98tD32QtHsIIU9QUEjKbdT4mjyi6aPIBc1Zjh5EyBzHGg/jDulIxR32o86hj/XmAPTryABiezG7aI+6v
MIME-Version: 1.0
X-Received: by 2002:a05:6638:d3:: with SMTP id
 w19mr5157404jao.127.1575495661402; 
 Wed, 04 Dec 2019 13:41:01 -0800 (PST)
Date: Wed, 04 Dec 2019 13:41:01 -0800
In-Reply-To: <0000000000002cfc3a0598d42b70@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e640e0598e7abc3@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_get_font
From: syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>
To: aryabinin@virtuozzo.com, b.zolnierkie@samsung.com, 
 daniel.thompson@linaro.org, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, dvyukov@google.com, ghalat@redhat.com, 
 gleb@kernel.org, gwshan@linux.vnet.ibm.com, hpa@zytor.com, jmorris@namei.org, 
 kasan-dev@googlegroups.com, kvm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mingo@redhat.com, mpe@ellerman.id.au, 
 pbonzini@redhat.com, penguin-kernel@i-love.sakura.ne.jp, ruscur@russell.cc, 
 sam@ravnborg.org, serge@hallyn.com, stewart@linux.vnet.ibm.com, 
 syzkaller-bugs@googlegroups.com, takedakn@nttdata.co.jp, tglx@linutronix.de, 
 x86@kernel.org
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCAyZGU1MGU5Njc0ZmM0Y2Ez
YzYxNzRiMDQ0NzdmNjllYjI2YjRlZTMxCkF1dGhvcjogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBy
dXNzZWxsLmNjPgpEYXRlOiAgIE1vbiBGZWIgOCAwNDowODoyMCAyMDE2ICswMDAwCgogICAgIHBv
d2VycGMvcG93ZXJudjogUmVtb3ZlIHN1cHBvcnQgZm9yIHA1aW9jMgoKYmlzZWN0aW9uIGxvZzog
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTEyN2EwNDJhZTAw
MDAwCnN0YXJ0IGNvbW1pdDogICA3NmJiOGIwNSBNZXJnZSB0YWcgJ2tidWlsZC12NS41JyBvZiBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wLi4KZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCmZpbmFsIGNy
YXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xMTdh
MDQyYWUwMDAwMApjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
eC9sb2cudHh0P3g9MTY3YTA0MmFlMDAwMDAKa2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWRkMjI2NjUxY2IwZjM2NGIKZGFzaGJvYXJkIGxp
bms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD00NDU1Y2EzYjMyOTFk
ZTg5MWFiYwpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9y
ZXByby5zeXo/eD0xMTE4MWVkYWUwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTA1Y2JiN2FlMDAwMDAKClJlcG9ydGVkLWJ5OiBz
eXpib3QrNDQ1NWNhM2IzMjkxZGU4OTFhYmNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhl
czogMmRlNTBlOTY3NGZjICgicG93ZXJwYy9wb3dlcm52OiBSZW1vdmUgc3VwcG9ydCBmb3IgcDVp
b2MyIikKCkZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0dHBz
Oi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
