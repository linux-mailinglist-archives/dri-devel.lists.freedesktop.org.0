Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20C114D6E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2AB6F97D;
	Fri,  6 Dec 2019 08:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AF96E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:38:01 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id s85so2474540ild.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=BPtd1lCkh28DO7EwzqWFu86aIj+E+y3RBRqfbiycXgU=;
 b=NPrV+ZIVu8IOQTIvOZJgA6hHYePh7ZEcjolXFRPuVgU7irRj6C5qPR4JbjCgh/NCEg
 q6t1fU+S1rL63kwP3eAcI0DlYxQB3JUibbwLzMFYbN5vxgg4GZmVPDub/zjZhWc3pE0t
 TEZFOc+ynAW8MJYXOaBIaeBig1FR5LdkkeEPtFtrZN5aVL/6vBgRq7qb1TNoErYlO/4P
 c/kL0Y/2AX8tiwR3gOGzlRoXzWUoTbMGijkUZrktEyvuVB4v620E7ZOWQ2lQIQH2QJOa
 77P5TBjcM9h53spWPDILpk8Bg516nstwlpCugv1eWZiiAlti/FsxF9SzXEUHxlnAwkzt
 LSiQ==
X-Gm-Message-State: APjAAAVGauTjMpokjPQ2zhAJjcOg7NyIaLBwOYBTs1y5yztfbHzL8BAO
 7OaxrHBn0/FwQWqZUCDrAdK/rGNgj9XLmq8wnsmwM/d1eRK1
X-Google-Smtp-Source: APXvYqw0yUIbNh+pGaBmjTGn6QTdUeXaeQPr8IF42eCrt+4KQEhGY66Ikiv3nYhzewKgZfr/soR4DDYF3lXcnPKyIFcc/jNYBhWi
MIME-Version: 1.0
X-Received: by 2002:a92:3984:: with SMTP id h4mr8301330ilf.36.1575553081339;
 Thu, 05 Dec 2019 05:38:01 -0800 (PST)
Date: Thu, 05 Dec 2019 05:38:01 -0800
In-Reply-To: <0000000000006dff110598d25a9b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bcf3bc0598f5090d@google.com>
Subject: Re: INFO: task hung in fb_open
From: syzbot <syzbot+a4ae1442ccc637162dc1@syzkaller.appspotmail.com>
To: airlied@linux.ie, ayan.halder@arm.com, b.zolnierkie@samsung.com, 
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 maxime.ripard@bootlin.com, peda@axentia.se, sam@ravnborg.org, 
 syzkaller-bugs@googlegroups.com, ville.syrjala@linux.intel.com, wens@csie.org
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
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

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCA5NzljMTFlZjM5Y2VlNzlk
NmY1NTYwOTFhMzU3ODkwOTYyYmUyNTgwCkF1dGhvcjogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4u
aGFsZGVyQGFybS5jb20+CkRhdGU6ICAgVHVlIEp1bCAxNyAxNzoxMzo0NiAyMDE4ICswMDAwCgog
ICAgIGRybS9zdW40aTogU3Vic3RpdHV0ZSBzdW40aV9iYWNrZW5kX2Zvcm1hdF9pc195dXYoKSB3
aXRoIGZvcm1hdC0+aXNfeXV2CgpiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBw
c3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTVkMmY5N2VlMDAwMDAKc3RhcnQgY29tbWl0OiAgIDU5
NmNmNDVjIE1lcmdlIGJyYW5jaCAnYWtwbScgKHBhdGNoZXMgZnJvbSBBbmRyZXcpCmdpdCB0cmVl
OiAgICAgICB1cHN0cmVhbQpjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC9sb2cudHh0P3g9MTNkMmY5N2VlMDAwMDAKa2VybmVsIGNvbmZpZzogIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTdkOGFiMmUwZTA5YzJhODIKZGFzaGJv
YXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1hNGFlMTQ0
MmNjYzYzNzE2MmRjMQpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9yZXByby5zeXo/eD0xNDI3M2VkYWUwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTVlNzY3N2FlMDAwMDAKClJlcG9ydGVk
LWJ5OiBzeXpib3QrYTRhZTE0NDJjY2M2MzcxNjJkYzFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNv
bQpGaXhlczogOTc5YzExZWYzOWNlICgiZHJtL3N1bjRpOiBTdWJzdGl0dXRlIHN1bjRpX2JhY2tl
bmRfZm9ybWF0X2lzX3l1digpICAKd2l0aCBmb3JtYXQtPmlzX3l1diIpCgpGb3IgaW5mb3JtYXRp
b24gYWJvdXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlz
ZWN0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
