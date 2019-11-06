Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FDF2840
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCD66EEA6;
	Thu,  7 Nov 2019 07:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E786ED9B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:20:01 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id c67so18247542iof.22
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=QbobwaWWXn01psZxrEEOIRgurZbAVL2YBBMKCRdbKg0=;
 b=c623TQYvPufHR/0V9SuH9tmgTGDr53SH8yxo/nISR3O1cd7s4N0/8WMLt5IquoI1+V
 Sc0StSJWSKDJU9lsRbNTNdw9gKr/hnGKYXcB5ouC35fjvGhSExpOvywPLewV19c717UT
 uBpBPa8ZSV17evi+WT+X3TafoiomhYzk7i9c2w1OeoxOoHsIQHSQFnW81B1u7sAC+JwY
 FBfkV4Kco8vCs7J8yqAbQOBU42W8BtXrbYE0cCIcEeazbXEdIJ9MxFpm+2vDy8IIc2lC
 J8NkH7XzbcWbTpVJyEnt1NrcMcu+Dc8ZURqLXs96Pnc8+H3VCVkXB9EYR9o0UsPF1MPN
 7HYA==
X-Gm-Message-State: APjAAAU6iOP2ILVIMjnyrN1K9qXU6gDzoeI0DNqslS4nPTdAvvfv2U3u
 nEmwjUcN0XhcXz/YSqvBrnaUM4Qf6MkaHClA545/Al7ywBp9
X-Google-Smtp-Source: APXvYqypSQ9fhpxFp136CkTuJg8S2JHGyT1Q1HM7ZQrLQcFZ1R8db4+KQgj35ozavDMfx9kbB4OKxsoKjNLFZ6xz4SrlcF5/UZsr
MIME-Version: 1.0
X-Received: by 2002:a92:8c92:: with SMTP id s18mr3258760ill.2.1573053600559;
 Wed, 06 Nov 2019 07:20:00 -0800 (PST)
Date: Wed, 06 Nov 2019 07:20:00 -0800
In-Reply-To: <000000000000b2de3a0594d8b4ca@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000012ff570596af15cc@google.com>
Subject: Re: WARNING in drm_mode_createblob_ioctl
From: syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>
To: airlied@linux.ie, akpm@linux-foundation.org, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, dvyukov@google.com, keescook@chromium.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, sfr@canb.auug.org.au, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCA5ZTVhNjRjNzFiMmY3MGJh
NTMwZjgxNTYwNDZkZDdkZmI4YTdhMGJhCkF1dGhvcjogS2VlcyBDb29rIDxrZWVzY29va0BjaHJv
bWl1bS5vcmc+CkRhdGU6ICAgTW9uIE5vdiA0IDIyOjU3OjIzIDIwMTkgKzAwMDAKCiAgICAgdWFj
Y2VzczogZGlzYWxsb3cgPiBJTlRfTUFYIGNvcHkgc2l6ZXMKCmJpc2VjdGlvbiBsb2c6ICBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2VjdC50eHQ/eD0xMjVmZTZkY2UwMDAwMApz
dGFydCBjb21taXQ6ICAgNTEzMDliOWQgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9y
IDIwMTkxMTA1CmdpdCB0cmVlOiAgICAgICBsaW51eC1uZXh0CmZpbmFsIGNyYXNoOiAgICBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xMTVmZTZkY2UwMDAwMApj
b25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9
MTY1ZmU2ZGNlMDAwMDAKa2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL3gvLmNvbmZpZz94PWE5YjFhNjQxYzFmMWZjNTIKZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1mYjc3ZTk3ZWJmMDYxMmVlNjkxNApzeXog
cmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0x
MjEyZGMzYWUwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9yZXByby5jP3g9MTQ1ZjYwNGFlMDAwMDAKClJlcG9ydGVkLWJ5OiBzeXpib3QrZmI3N2U5
N2ViZjA2MTJlZTY5MTRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhlczogOWU1YTY0Yzcx
YjJmICgidWFjY2VzczogZGlzYWxsb3cgPiBJTlRfTUFYIGNvcHkgc2l6ZXMiKQoKRm9yIGluZm9y
bWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVK
I2Jpc2VjdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
