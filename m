Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F47627E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79876ECE7;
	Fri, 26 Jul 2019 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035A36E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 02:34:01 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id v11so57058800iop.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 19:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=7CpkHsdwXfZwBwrO6vlf0OIv7joJOo5Z6wYVwguiJ04=;
 b=pr5ry0Wc9xwbMoP4KWgDm/EdyuZEVtEPC9aQ7LCSO6yANJwkeQSjLLT2lr5RwHtMHZ
 ohIYRzv10I/BrfzFfbIBRh4BukMrtXu4IaltJYvWCcgz73TNWLxQ8kZkltZLd3Z0XhLs
 i5LzgzzhZ7gs+fyVYx8P577gKzS2/w1XTNkNIDDUK3OOCJWFGxmqGHv96qTb0VTDdMv5
 DTRku7Wuo1Y1/l3P1shbEtRi1qyLzI4KVieqyNoFcCcb9DRqq2lCBOf4nId1IauJPuPg
 +P2jnhxwTzB5j7Y1nMw0AtABhmd01zJUvf/7+tpdI5zf/ETdSgHoHY7Hbar08AKh47kP
 K4kg==
X-Gm-Message-State: APjAAAXyMjvildmxp6iawrNuKtZa9LzZbtEgYJmMYt+gqEDVtd1JdBwk
 vTkXBs1kA0xynBSVtXIvowwVJ2k8KI6dHdkNSgsVpMyyYfl1
X-Google-Smtp-Source: APXvYqwFoHU762iKdsVHVX6yTlu7QfEbGsNdjn/z0ANksU56Shk8WreV3mmUqSXqtLdMgVlprsuuj4lm54a3cf1C9DCqoj4pnlX3
MIME-Version: 1.0
X-Received: by 2002:a02:b90e:: with SMTP id v14mr56641596jan.122.1564108441113; 
 Thu, 25 Jul 2019 19:34:01 -0700 (PDT)
Date: Thu, 25 Jul 2019 19:34:01 -0700
In-Reply-To: <000000000000b68e04058e6a3421@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005dbbc058e8c608d@google.com>
Subject: Re: memory leak in dma_buf_ioctl
From: syzbot <syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com>
To: bsingharora@gmail.com, coreteam@netfilter.org, davem@davemloft.net, 
 dri-devel@lists.freedesktop.org, duwe@suse.de, dvyukov@google.com, 
 kaber@trash.net, kadlec@blackhole.kfki.hu, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mingo@redhat.com, 
 mpe@ellerman.id.au, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 pablo@netfilter.org, rostedt@goodmis.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCAwNGNmMzFhNzU5ZWY1NzVm
NzUwYTYzNzc3Y2VlOTU1MDBlNDEwOTk0CkF1dGhvcjogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVs
bGVybWFuLmlkLmF1PgpEYXRlOiAgIFRodSBNYXIgMjQgMTE6MDQ6MDEgMjAxNiArMDAwMAoKICAg
ICBmdHJhY2U6IE1ha2UgZnRyYWNlX2xvY2F0aW9uX3JhbmdlKCkgZ2xvYmFsCgpiaXNlY3Rpb24g
bG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTU0Mjkz
ZjQ2MDAwMDAKc3RhcnQgY29tbWl0OiAgIGFiZGZkNTJhIE1lcmdlIHRhZyAnYXJtc29jLWRlZmNv
bmZpZycgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC4uLgpnaXQgdHJlZTogICAgICAgdXBzdHJlYW0KZmlu
YWwgY3Jhc2g6ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94
PTE3NDI5M2Y0NjAwMDAwCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L2xvZy50eHQ/eD0xMzQyOTNmNDYwMDAwMAprZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9ZDMxZGUzZDg4MDU5YjdmYQpkYXNoYm9h
cmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWIyMDk4YmM0
NDcyOGE0ZWZiM2U5CnN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94L3JlcHJvLnN5ej94PTEyNTI2ZTU4NjAwMDAwCkMgcmVwcm9kdWNlcjogICBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLmM/eD0xNjE3ODRmMDYwMDAwMAoKUmVwb3J0ZWQt
Ynk6IHN5emJvdCtiMjA5OGJjNDQ3MjhhNGVmYjNlOUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29t
CkZpeGVzOiAwNGNmMzFhNzU5ZWYgKCJmdHJhY2U6IE1ha2UgZnRyYWNlX2xvY2F0aW9uX3Jhbmdl
KCkgZ2xvYmFsIikKCkZvciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6
IGh0dHBzOi8vZ29vLmdsL3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
