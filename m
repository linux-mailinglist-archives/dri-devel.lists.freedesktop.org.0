Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8633B074
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 11:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886ED89A83;
	Mon, 15 Mar 2021 10:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AB489A61
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 10:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FBA964EC4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615805884;
 bh=ihjKxAosQdRjMYsq24bm1SS/UBuM8jGiqhEweq6Thyw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cBT+2tnQKlxBbLGsf7LiHrT11HOfdLYlFcl0Xqwr/R6ifuvzQZWsrX222oqNNv4FN
 TJYtt5wnTXXWb7LpTlPt2zrou/7IvbNhCPkgNt2k4z3jYMSRKrFseg5MdTHrz6+slw
 LG1g9aVTbv0/gLsEEAfKyVra8x/lEe3xDXkNLRpBdVujq3WGzUp/ngQEuoNNFsqbxi
 NF1eQOylVNwiB3BvDVmo4OXmPPofJWqWOa9eH9OBzj8qRhjhIB0VcZOUmK7XU7BCO4
 NosuvCewRr3Mhbrz0j4USZGG5maWdzawZp+R3OrscwiWMoq6bb3i/A1vvzmf511Edx
 L0seFUIIk5PmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 86DC865350; Mon, 15 Mar 2021 10:58:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Mon, 15 Mar 2021 10:58:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m11.1l1.f64@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-cU6PeieArB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM5MDUKCi0tLSBD
b21tZW50ICMyNSBmcm9tIG0xMS4xbDEuZjY0QGdtYWlsLmNvbSAtLS0KSSBmb3VuZCBhbm90aGVy
IHdvcmthcm91bmQgYW5kIGl0J3MgZWFzaWVyIHRoYW4gRVZFUiBhbmQgaXQncyBkb25lIHZpYQpt
a2luaXRjcGlv8J+YgQoKCkZpcnN0LCB3aGF0J3MgbWtpbml0Y3BpbyhodHRwczovL3dpa2kuYXJj
aGxpbnV4Lm9yZy9pbmRleC5waHAvTWtpbml0Y3Bpbyk/CgoKClRoZSBpbml0aWFsIHJhbWRpc2sg
aXMgaW4gZXNzZW5jZSBhIHZlcnkgc21hbGwgZW52aXJvbm1lbnQgKGVhcmx5IHVzZXJzcGFjZSkK
d2hpY2ggbG9hZHMgdmFyaW91cyBrZXJuZWwgbW9kdWxlcyBhbmQgc2V0cyB1cCBuZWNlc3Nhcnkg
dGhpbmdzIGJlZm9yZSBoYW5kaW5nCm92ZXIgY29udHJvbCB0byBpbml0LiBUaGlzIG1ha2VzIGl0
IHBvc3NpYmxlIHRvIGhhdmUsIGZvciBleGFtcGxlLCBlbmNyeXB0ZWQKcm9vdCBmaWxlIHN5c3Rl
bXMgYW5kIHJvb3QgZmlsZSBzeXN0ZW1zIG9uIGEgc29mdHdhcmUgUkFJRCBhcnJheS4gbWtpbml0
Y3BpbwphbGxvd3MgZm9yIGVhc3kgZXh0ZW5zaW9uIHdpdGggY3VzdG9tIGhvb2tzLCBoYXMgYXV0
b2RldGVjdGlvbiBhdCBydW50aW1lLCBhbmQKbWFueSBvdGhlciBmZWF0dXJlcy4KClNvIGdvIGFo
ZWFkIGFuZCBlZGl0IHdpdGggYHN1ZG8gbmFubyAvZXRjL21raW5pdGNwaW8uY29uZmAKCgpUaGVu
IGFkZCB0aGUgImFtZGdwdSIgaW4gdGhlIG1vZHVsZXMgc2VjdGlvbiBsaWtlIHRoaXM6CgoKYE1P
RFVMRVM9KGFtZGdwdSlgCgoKQWZ0ZXIgdGhhdCwgc2ltcGx5IHJ1biBgc3VkbyBta2luaXRjcGlv
IC1QYCBzbyB0aGF0IGl0IHJlZ2VuZXJhdGVzIG1raW5pdGNwaW8KZm9yIGFsbCBrZXJuZWxzCgoK
VGhpcyBzb2x2ZWQgbXkgaXNzdWUsIEkgaG9wZSBpdCB3b3JrcyBmb3Igb3RoZXJzIHRvbyA6KV8K
Ci0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3Np
Z25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
