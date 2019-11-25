Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F845109A09
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720F76E25B;
	Tue, 26 Nov 2019 08:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724A789C17
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 22:37:02 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id c2so14924147ilj.16
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 14:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=KF2WjshW1BDTUg/k+IPUzgQidO5NFBNVVgPRIj2C55w=;
 b=slDUZ8MKjrefuUtgmKO4M8Nmiu2NH7xeoNTuCurAn9oEN3vi/k/lj4/9/ZIYasjdNe
 sOnCbR/0TgFHob4omhlPzLA/9BlQU/bLVLPjJUfSYjzpNA39WBF31b5mplWdxTkykacJ
 6rF+5Z2dE/MqK/sjEWDJcxl1y1wzre8CtAo3GSxUO2KZJ6TjOheZSoNXGTwAbyQiS3BY
 uSt4pDmzlJWijuD5yplLjgv3HUeExoQUHprbZjLfInBh8Vy3uX3X5+RGMA1LupGY/Z6+
 +JKRfheAiaeOinonG8fc9OUdFtn1HJPHDPWKzRn4ZiLEMWOGhFNEn25h6k6wfMPNVF3J
 zJKA==
X-Gm-Message-State: APjAAAWqF8wWELET7Jd7J+DmIDLS9IYGJksgDciR5bVJde94t6fupNOR
 /vMmEUYb9ClwXQUokR2dpirQzz5lHxqG4u1pagFR5W04SOJ6
X-Google-Smtp-Source: APXvYqwkBCex2KWBU45kzK7k9hy1eCU109ihsuTepJ0sQfsiJS80DmXhz/QeEsCiIwZ7ccJ1gnEjc/wJIBydu3gOime4bUB5ZGcg
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2181:: with SMTP id
 b1mr29243849iob.208.1574721421577; 
 Mon, 25 Nov 2019 14:37:01 -0800 (PST)
Date: Mon, 25 Nov 2019 14:37:01 -0800
In-Reply-To: <000000000000a52337056b065fb3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4160705983366e8@google.com>
Subject: Re: WARNING in md_ioctl
From: syzbot <syzbot+1e46a0864c1a6e9bd3d8@syzkaller.appspotmail.com>
To: airlied@linux.ie, chris@chris-wilson.co.uk, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, 
 rafael.antognolli@intel.com, rodrigo.vivi@intel.com, shli@kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCA0YjZjZTY4MTBhNWRjMGFm
Mzg3YTIzOGU4Yzg1MmUwZDM4MjIzODFmCkF1dGhvcjogUmFmYWVsIEFudG9nbm9sbGkgPHJhZmFl
bC5hbnRvZ25vbGxpQGludGVsLmNvbT4KRGF0ZTogICBNb24gRmViIDUgMjM6MzM6MzAgMjAxOCAr
MDAwMAoKICAgICBkcm0vaTkxNS9jbmw6IFdhUGlwZUNvbnRyb2xCZWZvcmUzRFN0YXRlU2FtcGxl
UGF0dGVybgoKYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
YmlzZWN0LnR4dD94PTEzYWViNTIyZTAwMDAwCnN0YXJ0IGNvbW1pdDogICBjNjFhNTZhYiBNZXJn
ZSBicmFuY2ggJ3g4Ni11cmdlbnQtZm9yLWxpbnVzJyBvZiBnaXQ6Ly9naXQuLi4KZ2l0IHRyZWU6
ICAgICAgIHVwc3RyZWFtCmZpbmFsIGNyYXNoOiAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L3JlcG9ydC50eHQ/eD0xMDZlYjUyMmUwMDAwMApjb25zb2xlIG91dHB1dDogaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTdhZWI1MjJlMDAwMDAKa2VybmVs
IGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTQwMTMx
ODBlN2M3YTlmZjkKZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L2J1Zz9leHRpZD0xZTQ2YTA4NjRjMWE2ZTliZDNkOApzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xNmJjYTIwNzgwMDAwMApDIHJlcHJv
ZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTQ4MTlh
NDc4MDAwMDAKClJlcG9ydGVkLWJ5OiBzeXpib3QrMWU0NmEwODY0YzFhNmU5YmQzZDhAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhlczogNGI2Y2U2ODEwYTVkICgiZHJtL2k5MTUvY25sOiAg
CldhUGlwZUNvbnRyb2xCZWZvcmUzRFN0YXRlU2FtcGxlUGF0dGVybiIpCgpGb3IgaW5mb3JtYXRp
b24gYWJvdXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlz
ZWN0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
