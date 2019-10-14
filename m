Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80300D6A8F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 22:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5521489D79;
	Mon, 14 Oct 2019 20:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019C489D79
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 20:04:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Mon, 14 Oct 2019 20:04:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205169-2300-hbnxJRjiYC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205169-2300@https.bugzilla.kernel.org/>
References: <bug-205169-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNjkKCi0tLSBD
b21tZW50ICMxMSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciBmcm9tIGNvbW1lbnQgIzEwKQo+
ICJnaXQgYmlzZWN0IiBpZGVudGlmaWVzIHRoaXMgY29tbWl0IGFzIHRoZSBwcm9ibGVtYXRpYyBv
bmU6IDYxNzA4OWQ1ODM3YQo+ICgiZHJtL2FtZC9kaXNwbGF5OiByZXZlcnQgd2FpdCBpbiBwaXBl
bG9jayIpLgo+IAo+IFJldmVydGluZyB0aGlzIGNvbW1pdCBvbiB0b3Agb2YgYW1kLXN0YWdpbmct
ZHJtLW5leHQgc2VlbXMgdG8gd29yayBmaW5lLgoKdW5hbWUgLWEKTGludXggKG5vbmUpZGlta28n
cyBEZXNrdG9wIDUuMy4wLXJjMysgIzMgU01QIFBSRUVNUFQgTW9uIE9jdCAxNCAyMDo0OTowMiBJ
U1QKMjAxOSB4ODZfNjQgQU1EIFJ5emVuIDUgMTYwMCBTaXgtQ29yZSBQcm9jZXNzb3IgQXV0aGVu
dGljQU1EIEdOVS9MaW51eAoKCmdpdCBjaGVja291dCA2MTcwODlkNTgzN2FeCgpJc3N1ZSBubyBs
b25nZXIgaGFwcGVucwoKTWFqb3IgZG93bmdyYWRlLCBidXQgbm8gbW9yZSBwcm9ibGVtLgpXaGlj
aCBjb21taXQgY2FuIEkgdXNlIHRvIHNvbHZlIHRoaXMgaXNzdWU/CgpCdWcgMjA1MTY5IC0gQU1E
R1BVIGRyaXZlciB3aXRoIE5hdmkgY2FyZCBoYW5ncyBYb3JnIGluIGZ1bGxzY3JlZW4gb25seS4g
KGVkaXQpIApodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNDcy
NQoKU29ycnkgdGhhdCBJIHRha2UgYWR2YW50YWdlIG9mIHlvdSBoZXJlLgpJIHdpbGwgdHJ5IHRv
IGZpbmQgNS4zLjAgY29tbWl0LiBJIGFtIG5ldyBpbnRvIGFsbCB0aGlzIHN0dWZmLgoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
