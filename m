Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130BA10DAEE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 22:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B886E95C;
	Fri, 29 Nov 2019 21:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381DE6E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 21:24:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205585] [Regression] [amdgpu] AMD Vega 64 GPU invalid access
 and EEH under load
Date: Fri, 29 Nov 2019 21:24:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tpearson@raptorengineering.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205585-2300-ndwsX41i5E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205585-2300@https.bugzilla.kernel.org/>
References: <bug-205585-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1ODUKCi0tLSBD
b21tZW50ICM2IGZyb20gVGltb3RoeSBQZWFyc29uICh0cGVhcnNvbkByYXB0b3JlbmdpbmVlcmlu
Zy5jb20pIC0tLQpZZXMsIG15IGZhdWx0LCBzb3JyeSBhYm91dCB0aGF0IC0tIGRpZmZlcmVudCBi
b3gsIHVuYmVrbm93bnN0IHRvIG1lIGhhZCBhCmRpZmZlcmVudCBHUFUgKG5vdGUgdG8gc2VsZiwg
Y2hlY2sgbHNwY2kgbmV4dCB0aW1lIGJlZm9yZSBkZWNvZGluZyB0cmFjZSkuCgpUbyB0b3AgaXQg
b2ZmLCB0aGlzIHBhcnRpY3VsYXIgZmF1bHQgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBhIGZhdWx0
eSBHUFUgLS0KbGV0dGluZyBpdCBjb29sIG92ZXJuaWdodCBmaXhlcyB0aGUgcHJvYmxlbXMgdGVt
cG9yYXJpbHkuICBJIHN0aWxsIG5lZWQgdG8KdmVyaWZ5IHRoZSBWZWdhIGlzIGZhaWxpbmcgb24g
NS40LjAsIGFzIG9uZSBvZiB0aGUgcGF0Y2hlcyBsZWFkaW5nIHVwIHRvIDUuNC4wCnJlc29sdmVk
IHRoZSBzaW1pbGFyIHNvZnR3YXJlIGxvY2t1cCBJIGhhZCBiZWVuIHNlZWluZyBvbiB0aGlzIFBv
bGFyaXMgY2FyZC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
