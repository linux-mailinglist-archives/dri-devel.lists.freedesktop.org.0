Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF309860E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794C86E358;
	Wed, 21 Aug 2019 20:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E966E358
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:55:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204345] Unigine Superposition hard locks the PC since 5.1.18
 (and possibly before)
Date: Wed, 21 Aug 2019 20:55:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edisonalvaringo@bol.com.br
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204345-2300-iWPETiwWdY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204345-2300@https.bugzilla.kernel.org/>
References: <bug-204345-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQzNDUKCkpvYXF1
aW4gT3Rzb2EgKGVkaXNvbmFsdmFyaW5nb0Bib2wuY29tLmJyKSBjaGFuZ2VkOgoKICAgICAgICAg
ICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KICAgICAgICAgICAgIFN0YXR1c3xORVcgICAgICAgICAgICAgICAgICAgICAgICAg
fFJFU09MVkVECiAgICAgICAgIFJlc29sdXRpb258LS0tICAgICAgICAgICAgICAgICAgICAgICAg
IHxJTlZBTElECgotLS0gQ29tbWVudCAjOCBmcm9tIEpvYXF1aW4gT3Rzb2EgKGVkaXNvbmFsdmFy
aW5nb0Bib2wuY29tLmJyKSAtLS0KSSdtIGdvbm5hIGNsb3NlIHRoaXMgYmVjYXVzZSB0aGUgcmVn
cmVzc2lvbiBvbiB0aGUgNS4yIGFyZSBmaXhlZCBub3cgcGVyZm9ybXMKZXZlbiBiZXR0ZXIgdGhh
biB0aGUgNS4xIGJyYW5jaC4gQW5kIGZpeGluZyB0aGUgNS4xIGJyYW5jaCBtYWtlcyBubyBzZW5z
ZQpiZWNhdXNlIGl0IGhhcyByZWFjaGVkIEVPTC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlz
IG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
