Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E07F8871
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 07:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECF96E2D6;
	Tue, 12 Nov 2019 06:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBC76E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 06:20:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203471] Tearing on Raven Ridge and RX560X PRIME setup even with
 Vsync enabled
Date: Tue, 12 Nov 2019 06:20:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203471-2300-Vb9NTIP8YM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203471-2300@https.bugzilla.kernel.org/>
References: <bug-203471-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM0NzEKCi0tLSBD
b21tZW50ICMyMiBmcm9tIEhheGsyMCAoaGF4azYxMkBnbWFpbC5jb20pIC0tLQooSW4gcmVwbHkg
dG8gTWljaGVsIETDpG56ZXIgZnJvbSBjb21tZW50ICMyMSkKPiAoSW4gcmVwbHkgdG8gSGF4azIw
IGZyb20gY29tbWVudCAjMjApCj4gPiBOb3Qgb25seSB0aGF0IGJ1dCBpdCBzdGFydGVkIGhhcHBl
bmluZyBpbiB2aWRlbyB0b28gb24gZmlyZWZveCBhbmQgdGhhdCBpcwo+ID4gcmVhbGx5IGhvcnJp
YmxlLgo+IAo+IFNvdW5kcyBsaWtlIHlvdSdyZSByZWZlcnJpbmcgdG8KPiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL2lzc3Vlcy85MjQgPyBJIHRob3VnaHQgd2Un
ZCBqdXN0Cj4gZXN0YWJsaXNoZWQgdGhhdCdzIG5vdCB1c2luZyBQUklNRSwgaW4gd2hpY2ggY2Fz
ZSBpdCdzIHByb2JhYmx5IG5vdCBkaXJlY3RseQo+IHJlbGF0ZWQgdG8gdGhpcy4KClllcy4gSSB3
aWxsIHJlb3BlbiB0aGF0IGJ1ZyBhZ2FpbiBhcyB5b3UgY2xvc2VkIGl0IGJ1dCB3ZWxsIGl0cyBu
b3Qgc29sdmVkIHlldC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
