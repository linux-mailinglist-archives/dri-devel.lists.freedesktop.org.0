Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2635741B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 20:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0D6E961;
	Wed,  7 Apr 2021 18:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1BE6E961
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 18:21:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F586610FB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617819686;
 bh=6IzZ4ewk1F/4pw/+NzJddwhXjuWoLgmyjvWAZZiNYb4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=paebOXfO7oQOisIj0P3TsYpYZcfstDUm/w1W0TG8/kbzPeGsUiDp93KWP4BIyTDo6
 Ka0RziAYU2ui8FIsy2Hsntvgrk6vkd3Z8mabIFJxgIU1U+tEU2WcnLXvdfrZdyZpNU
 hr3pUiw4uGC29ZHZIp7G54a7jLEih8GF9D+kuVfPPxlVHD6TSkDzADElZUmKlvfWoQ
 XNfbUafQQvU4v5GjvS+LmKqP6QsuGEJ7ehXuiHcThix0jCc93CkXgF8SPL4rLdrP2T
 w/LkPbKkj0J/cQz5VZXNTtyChtaw8ZSg5r8P2Yq8EHrzFoFU2RYFBXdGUZ7801dOor
 hOkskusJG/Tng==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0358361106; Wed,  7 Apr 2021 18:21:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 07 Apr 2021 18:21:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212077-2300-ecFJvygJFY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIwNzcKCkJhdCBN
YWxpbiAoYmF0X21hbGluQGFidi5iZykgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8UmVt
b3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAg
ICAgICAgICBTdGF0dXN8UkVPUEVORUQgICAgICAgICAgICAgICAgICAgIHxSRVNPTFZFRAogICAg
ICAgICBSZXNvbHV0aW9ufC0tLSAgICAgICAgICAgICAgICAgICAgICAgICB8Q09ERV9GSVgKCi0t
LSBDb21tZW50ICMxNSBmcm9tIEJhdCBNYWxpbiAoYmF0X21hbGluQGFidi5iZykgLS0tCklzc3Vl
IGZpeGVkIGluIDUuMTEuMTIgZXZlbiBub3cgaXQgY29uc3VtZXMgbGVzcyBwb3dlciAofjEsMDdX
IGxlc3MpLgoKQmVmb3JlOgoKYW1kZ3B1LXBjaS0wMTAwCkFkYXB0ZXI6IFBDSSBhZGFwdGVyCnZk
ZGdmeDogICAgICA3NTYuMDAgbVYgCmVkZ2U6ICAgICAgICAgKzM1LjAgQyAgKGNyaXQgPSArOTQu
MCBDLCBoeXN0ID0gLTI3My4xIEMpCnBvd2VyMTogICAgICAgIDguMTQgVyAgKGNhcCA9ICA2MC4w
MCBXKQoKQWZ0ZXI6CgphbWRncHUtcGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIKdmRkZ2Z4
OiAgICAgIDc1Ni4wMCBtViAKZWRnZTogICAgICAgICArMzguMMKwQyAgKGNyaXQgPSArOTQuMMKw
QywgaHlzdCA9IC0yNzMuMcKwQykKcG93ZXIxOiAgICAgICAgNy4wNyBXICAoY2FwID0gIDYwLjAw
IFcpCgpUaGFuayB5b3UhCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBh
IGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3
YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
