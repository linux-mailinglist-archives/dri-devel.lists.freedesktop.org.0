Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572287289E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67FC6E462;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50416E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:40:01 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id u25so48932580iol.23
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=w92/D4APly1S0dijjuo/84NrUKS2JIroIh/+k83Y0Yg=;
 b=Icou5+FyPmE6Kg6BGlf8NftXJlI3grQBNDtE43FnNUr6i5TF5TEi0ODfVyvgSck++Y
 tAQUqKJ5nhqRC2h/FtU8a78OseHbXNhBdW8OAcFGcDIXwaFvGg7i3alKA5/Wdx2wkHLE
 f8wAips4TXME/Nwo8gJagaIP7MSGfFBqMU4Sa4p/rRSfXxOocD0zsxJZ6EX6TXBYJJC0
 nX2TgFaet8v0nQbHYO7aeskzYJYZwVpXhFggykxNAQyJGGo0VFpds1WKfj/ACTxOrfOs
 s70lAyflQbOA3mUT5X9uZzh0JiS0rKIK//b+ELpp0MIZ9mLD+oklC/DeIDyW/7omJbA7
 s40Q==
X-Gm-Message-State: APjAAAX37kmre75dfa53JR4WbD3cb5AHlQcQFmyEJ9w33JwSZB9LIlUD
 VS6G22g6udIpOTUI8xQ/e6hxR1Pm2ecoodvKRMkoEP8fDQMT
X-Google-Smtp-Source: APXvYqxZV7f2M7mWAmPB7Zk6w2/BTeh9n6/BKLJgP5HdF+ftj8Txa1VpP1wlpVLNOViX/+n9pFrEH7CBKE5ifAlRW9n+RxMquc0l
MIME-Version: 1.0
X-Received: by 2002:a05:6638:691:: with SMTP id
 i17mr82704018jab.70.1563932401090; 
 Tue, 23 Jul 2019 18:40:01 -0700 (PDT)
Date: Tue, 23 Jul 2019 18:40:01 -0700
In-Reply-To: <5d3744ff777cc_436d2adb6bf105c41c@john-XPS-13-9370.notmuch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000384ae4058e636360@google.com>
Subject: Re: kernel panic: stack is corrupted in pointer
From: syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 ast@kernel.org, bpf@vger.kernel.org, christian.koenig@amd.com, 
 daniel@iogearbox.net, david1.zhou@amd.com, dri-devel@lists.freedesktop.org, 
 dvyukov@google.com, john.fastabend@gmail.com, leo.liu@amd.com, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
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

SGVsbG8sCgpzeXpib3QgaGFzIHRlc3RlZCB0aGUgcHJvcG9zZWQgcGF0Y2ggYW5kIHRoZSByZXBy
b2R1Y2VyIGRpZCBub3QgdHJpZ2dlciAgCmNyYXNoOgoKUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTog
IApzeXpib3QrNzlmNWYwMjgwMDVhNzdlY2I2YmJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQoK
VGVzdGVkIG9uOgoKY29tbWl0OiAgICAgICAgIGRlY2I3MDVlIGxpYmJwZjogZml4IHVzaW5nIHVu
aW5pdGlhbGl6ZWQgaW9jdGwgcmVzdWx0cwpnaXQgdHJlZTogICAgICAgYnBmCmtlcm5lbCBjb25m
aWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD04NzMwNWMzY2E5
YzI1YzcwCmNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1l
bnRhbCkKCk5vdGU6IHRlc3RpbmcgaXMgZG9uZSBieSBhIHJvYm90IGFuZCBpcyBiZXN0LWVmZm9y
dCBvbmx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
