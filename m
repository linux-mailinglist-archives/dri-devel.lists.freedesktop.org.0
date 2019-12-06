Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987571169E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E5089F06;
	Mon,  9 Dec 2019 09:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95CE6FA55
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:34:01 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id b17so5170558ioh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 08:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=eN4yK+b1Bwvylv7Nm0VpeOFgnJkXHsh0eveEUiwrQH8=;
 b=ATokKLQ/WT5n9JQ9EWQg8z11DdSf7MBlg70DRe0L2h04tM+y/hU/h7KIBJUu7wBUDr
 oKhEi53qCC01Pgd+yEekmVxibxLtFiwH/Z9rzE+BypElqF8FzK/bRCPsDpPZLJvYRMfK
 3L9NK4/cobD5StmaqHtHZlP5Cksh59zK4u402ghEs2xa13xDe1pAa8Tj9hU6PXiJyuPb
 qq8UDbhxcRVbUqxa/Nx+JMT7yqKUESzzkQdg0ZXAHfJSosODJcnJfhUfIg8hqLHlM0cv
 V7BL9LXvNpfB6Jm34BF5V79LEppGDtUgcTdU7N+06rxWKOibF+4bmZ7JYkcScLD32d5+
 svvw==
X-Gm-Message-State: APjAAAXOyUR3Mmfj5GQ9Zarjm/JeOnodyTat21GWhGzsNHuHVUFMzgLk
 iVL8W79KxWhvRMvn1FPVUmABM7ejNn3woA9/CoM65dko/4bP
X-Google-Smtp-Source: APXvYqzZYpNyvisihbt8EN3KnLhQ+QrZm3JeQEpbdA8h9nBmjE1AdDXOmVmenOawWmDOfOfWECCiqsoRsetDdfRKflEyZvm4mUC+
MIME-Version: 1.0
X-Received: by 2002:a92:4891:: with SMTP id j17mr14417440ilg.33.1575650041118; 
 Fri, 06 Dec 2019 08:34:01 -0800 (PST)
Date: Fri, 06 Dec 2019 08:34:01 -0800
In-Reply-To: <000000000000e1d639059908223b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fdd04105990b9c93@google.com>
Subject: Re: KASAN: use-after-free Read in soft_cursor
From: syzbot <syzbot+cf43fb300aa142fb024b@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, coreteam@netfilter.org, davem@davemloft.net, 
 dri-devel@lists.freedesktop.org, gwshan@linux.vnet.ibm.com, kaber@trash.net, 
 kadlec@blackhole.kfki.hu, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, ruscur@russell.cc, 
 stewart@linux.vnet.ibm.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTE1MTJkMWJjZTAw
MDAwCnN0YXJ0IGNvbW1pdDogICBiMGQ0YmVhYSBNZXJnZSBicmFuY2ggJ25leHQuYXV0b2ZzJyBv
ZiBnaXQ6Ly9naXQua2VybmVsLm9yLi4KZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCmZpbmFsIGNy
YXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xNzEy
ZDFiY2UwMDAwMApjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
eC9sb2cudHh0P3g9MTMxMmQxYmNlMDAwMDAKa2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWYwN2EyMzAyMGZkN2QyMWEKZGFzaGJvYXJkIGxp
bms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1jZjQzZmIzMDBhYTE0
MmZiMDI0YgpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9y
ZXByby5zeXo/eD0xNzQ1YTkwZWUwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTM2MTA0MmFlMDAwMDAKClJlcG9ydGVkLWJ5OiBz
eXpib3QrY2Y0M2ZiMzAwYWExNDJmYjAyNGJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhl
czogMmRlNTBlOTY3NGZjICgicG93ZXJwYy9wb3dlcm52OiBSZW1vdmUgc3VwcG9ydCBmb3IgcDVp
b2MyIikKCkZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0dHBz
Oi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
