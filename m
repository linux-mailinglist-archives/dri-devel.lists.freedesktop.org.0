Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6CF41D5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BB36F889;
	Fri,  8 Nov 2019 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6256ED71
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:42:07 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id o5so1841867iob.19
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 05:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=WTUaaUrmKVHorKvakIXCTTRuudk2YAQScGxgofVTkUI=;
 b=YEFisOLjERpmKaOCA4P1JZedsfqb7zLmXGGxUb3UG00msUd2r+Dy0UFrbePYbnIIjr
 7a2TsNwgYEXUjgZ5o155Qm26uy/CuxnK7K9x9e8qFnqmekw30dA63zF4UWRBQ8C+4BIe
 I1SIiq9XDTTPZfWEyhJo3Sdo0aj1UPwuuQpoDwQUzuQ6PpF/UFqLUgG+F/J/JaT36ui7
 XIlDEw4S54HT6KN/r1m43i9eR2ylSMT1jjWf2QsFe6DbmmOflO2bzotMZSxWGLrdq4QW
 tVkPOu1NrEtDN555SaKBAQ5+BKC5Hkm499Ot8xvfBLLz/iBaoZKs9rZIuwE9Ksn7JIyT
 dVFg==
X-Gm-Message-State: APjAAAWAtzi3tAXKiiwBmg3frzQsB4tF0At73YwyYJCGvU2tUcI2xkIV
 Ven8SOV+W0vn+Dw3H3Btlk2LWt/8xtR2MhjT1QJ0YLfiWmBN
X-Google-Smtp-Source: APXvYqzOTbKLWUtJfV+eTnZAGIHCOihW1P53mf2MSnAtW+U2zup71yFaexRFHdR5rbJrPPIrMXY88woVwchxPC8nR165HI7yQ6Is
MIME-Version: 1.0
X-Received: by 2002:a5d:8c94:: with SMTP id g20mr3746490ion.13.1573134126988; 
 Thu, 07 Nov 2019 05:42:06 -0800 (PST)
Date: Thu, 07 Nov 2019 05:42:06 -0800
In-Reply-To: <000000000000aa8703057a7ea0bb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2c94e0596c1d47b@google.com>
Subject: Re: WARNING in dma_buf_vunmap
From: syzbot <syzbot+a9317fe7ad261fc76b88@syzkaller.appspotmail.com>
To: andy@greyhouse.net, davem@davemloft.net, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, j.vosburgh@gmail.com,
 kyungmin.park@samsung.com, linaro-mm-sig-owner@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, m.szyprowski@samsung.com, maheshb@google.com, 
 mchehab+samsung@kernel.org, mchehab@kernel.org, netdev@vger.kernel.org, 
 pawel@osciak.com, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
 tfiga@chromium.org, vfalico@gmail.com
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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

c3l6Ym90IHN1c3BlY3RzIHRoaXMgYnVnIHdhcyBmaXhlZCBieSBjb21taXQ6Cgpjb21taXQgNjJk
Y2I0ZjQxODM2YmQzYzQ0YjViNjUxYmI2ZGYwN2VhNGNiMTU1MQpBdXRob3I6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgpEYXRlOiAgIFRodSBOb3YgOCAxMjoyMzozNyAy
MDE4ICswMDAwCgogICAgIG1lZGlhOiB2YjI6IGNoZWNrIG1lbW9yeSBtb2RlbCBmb3IgVklESU9D
X0NSRUFURV9CVUZTCgpiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9iaXNlY3QudHh0P3g9MTE2YWYxMWM2MDAwMDAKc3RhcnQgY29tbWl0OiAgIGQ0MTIxN2Fh
IE1lcmdlIHRhZyAncGNpLXY0LjIwLWZpeGVzLTEnIG9mIGdpdDovL2dpdC5rZXJuZWwuLgpnaXQg
dHJlZTogICAgICAgdXBzdHJlYW0Ka2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL3gvLmNvbmZpZz94PTRhMGE4OWYxMmNhOWIwZjUKZGFzaGJvYXJkIGxpbms6IGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1hOTMxN2ZlN2FkMjYxZmM3NmI4
OApzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5z
eXo/eD0xNmY3YjZmNTQwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBw
c3BvdC5jb20veC9yZXByby5jP3g9MTA1YTI3ODM0MDAwMDAKCklmIHRoZSByZXN1bHQgbG9va3Mg
Y29ycmVjdCwgcGxlYXNlIG1hcmsgdGhlIGJ1ZyBmaXhlZCBieSByZXBseWluZyB3aXRoOgoKI3N5
eiBmaXg6IG1lZGlhOiB2YjI6IGNoZWNrIG1lbW9yeSBtb2RlbCBmb3IgVklESU9DX0NSRUFURV9C
VUZTCgpGb3IgaW5mb3JtYXRpb24gYWJvdXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczov
L2dvby5nbC90cHNtRUojYmlzZWN0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
