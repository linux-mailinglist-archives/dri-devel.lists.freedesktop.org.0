Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C403C963B5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FE86E422;
	Tue, 20 Aug 2019 15:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2E56E422
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 15:06:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 20 Aug 2019 15:06:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: au1064@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-svQZaJ3vOz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE5NTcKCmplbnMg
aGFybXMgKGF1MTA2NEBnbWFpbC5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJl
bW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAg
ICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YXUxMDY0QGdtYWls
LmNvbQoKLS0tIENvbW1lbnQgIzggZnJvbSBqZW5zIGhhcm1zIChhdTEwNjRAZ21haWwuY29tKSAt
LS0KSGksIGkgaGF2ZSBhIHZlcnkgc2ltaWxhciBwcm9ibGVtLiBNeSBzeXN0ZW0gaXMgd29ya2lu
ZyB3aXRoIDQuMTUgYW5kIHdpdGgKNS4xLjE2IGJ1dCBub3Qgd2l0aCBvdGhlciA1Lngga2VybmVs
czoKClRoZSBTeXN0ZW0gZG9lcyBub3QgYm9vdCB3aXRoIDUueCBrZXJuZWxzLiBXaXRoIDUuMS4x
NiB0aGUgZ3VpIHN5c3RlbSBmcmVlemVzCnNvbWV0aW1lcyBidXQgc3NoZCBhbmQgbW91c2UgaXMg
c3RpbGwgd29ya2luZy4gCgoKQ1BVOiBSeXplbiA1IDI0MDBnLCBCT0FSRDogQU9SVVMgQjQ1MCBJ
IFBSTyBXSUZJLCBYIFNlcnZlciAxLjE5LjYKCktlcm5lbCA1LjAueCBub3Qgd29ya2luZyAoYmxh
bmsgc2NyZWVuIGFmdGVyIGJvb3QpCktlcm5lbCA1LjIueCAoIHggPD0gOSApIGlzIG5vdCB3b3Jr
aW5nIChibGFuayBzY3JlZW4gYWZ0ZXIgYm9vdCkKCmJ1dCBLZXJuZWwgNS4xLjE2IGlzIHdvcmtp
bmcgKG1vc3RseSkhCgoKRXJyb3IgTE9HIHdpdGggNS4xLjE2OgpbTWkgQXVnIDE0IDE0OjIyOjIx
IDIwMTldIGFtZGdwdSAwMDAwOjA5OjAwLjA6ClZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVT
OjB4MDAwMDAwMDAKW01pIEF1ZyAxNCAxNDoyMjoyMSAyMDE5XSBhbWRncHUgMDAwMDowOTowMC4w
OiBbZ2Z4aHViXSBuby1yZXRyeSBwYWdlIGZhdWx0CihzcmNfaWQ6MCByaW5nOjI0IHZtaWQ6MyBw
YXNpZDozMjc2OCwgZm9yIHByb2Nlc3MgWG9yZyBwaWQgMTg0OCB0aHJlYWQgWG9yZzpjczAKcGlk
IDE4NDkpCltNaSBBdWcgMTQgMTQ6MjI6MjEgMjAxOV0gYW1kZ3B1IDAwMDA6MDk6MDAuMDogICBp
biBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MKMHgwMDAwODAwMTBjMjA1MDAwIGZyb20gMjcKW01p
IEF1ZyAxNCAxNDoyMjoyMSAyMDE5XSBhbWRncHUgMDAwMDowOTowMC4wOgpWTV9MMl9QUk9URUNU
SU9OX0ZBVUxUX1NUQVRVUzoweDAwMDAwMDAwCltNaSBBdWcgMTQgMTQ6MjI6MzEgMjAxOV0gW2Ry
bTphbWRncHVfam9iX3RpbWVkb3V0IFthbWRncHVdXSAqRVJST1IqIHJpbmcgZ2Z4CnRpbWVvdXQs
IHNpZ25hbGVkIHNlcT04NDA3MzgsIGVtaXR0ZWQgc2VxPTg0MDc0MApbTWkgQXVnIDE0IDE0OjIy
OjMxIDIwMTldIFtkcm06YW1kZ3B1X2pvYl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiBQcm9j
ZXNzCmluZm9ybWF0aW9uOiBwcm9jZXNzIFhvcmcgcGlkIDE4NDggdGhyZWFkIFhvcmc6Y3MwIHBp
ZCAxODQ5CltNaSBBdWcgMTQgMTQ6MjI6MzEgMjAxOV0gW2RybV0gR1BVIHJlY292ZXJ5IGRpc2Fi
bGVkLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
