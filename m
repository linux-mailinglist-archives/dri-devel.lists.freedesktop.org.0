Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC13B32D0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 02:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083926E083;
	Mon, 16 Sep 2019 00:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C946E083
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 00:44:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] amdgpu error scheduling IBs when waking from sleep
Date: Mon, 16 Sep 2019 00:44:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204611-2300-rmJfnsOIZs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204611-2300@https.bugzilla.kernel.org/>
References: <bug-204611-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MTEKCi0tLSBD
b21tZW50ICMzIGZyb20gdG9uZXMxMTFAaG90bWFpbC5jb20gLS0tCkknbSBzdGlsbCB3b3JraW5n
IG9uIHRyeWluZyB0byBiaXNlY3QgdGhlIHByb2JsZW0sIGJ1dCBpdCdzIGJlZW4gY2hhbGxlbmdp
bmcuIApGb2xsb3dpbmcgdGhlIGFkdmljZSBhdApodHRwczovLzAxLm9yZy9ibG9ncy9yemhhbmcv
MjAxNS9iZXN0LXByYWN0aWNlLWRlYnVnLWxpbnV4LXN1c3BlbmQvaGliZXJuYXRlLWlzc3VlcwpJ
IHR1cm5lZCBvbiB0aGUgaW5pdGNhbGxfZGVidWcgYW5kIG5vX2NvbnNvbGVfc3VzcGVuZCBib290
IG9wdGlvbnMuCgpJIHRoZW4gc2VlIHRoZSBmb2xsb3dpbmcgbWVzc2FnZXMgaW4gdGhlIGJvb3Qg
bG9nIGFmdGVyIGJyaW5naW5nIHRoZSBzeXN0ZW0KYmFjayB1cC4KCj4gU2VwIDE1IDE3OjM2OjM5
IG1vYmlsZSBrZXJuZWw6IFtkcm1dIHJlc2VydmUgMHg0MDAwMDAgZnJvbSAweGY0MDBjMDAwMDAg
Zm9yCj4gUFNQIFRNUiBTSVpFCj4gLi4uCj4gU2VwIDE1IDE3OjM2OjM5IG1vYmlsZSBrZXJuZWw6
IFtkcm1dIHBzcCBjb21tYW5kIGZhaWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzCj4gaXMgKDApCj4g
U2VwIDE1IDE3OjM2OjM5IG1vYmlsZSBrZXJuZWw6IFtkcm06cHNwX2h3X3N0YXJ0IFthbWRncHVd
XSAqRVJST1IqIFBTUCBsb2FkCj4gdG1yIGZhaWxlZCEKPiBTZXAgMTUgMTc6MzY6MzkgbW9iaWxl
IGtlcm5lbDogW2RybTpwc3BfcmVzdW1lIFthbWRncHVdXSAqRVJST1IqIFBTUCByZXN1bWUKPiBm
YWlsZWQKPiBTZXAgMTUgMTc6MzY6MzkgbW9iaWxlIGtlcm5lbDogW2RybTphbWRncHVfZGV2aWNl
X2Z3X2xvYWRpbmcgW2FtZGdwdV1dCj4gKkVSUk9SKiByZXN1bWUgb2YgSVAgYmxvY2sgPHBzcD4g
ZmFpbGVkIC0yMgo+IFNlcCAxNSAxNzozNjozOSBtb2JpbGUga2VybmVsOiBbZHJtOmFtZGdwdV9k
ZXZpY2VfcmVzdW1lIFthbWRncHVdXSAqRVJST1IqCj4gYW1kZ3B1X2RldmljZV9pcF9yZXN1bWUg
ZmFpbGVkICgtMjIpLgo+IFNlcCAxNSAxNzozNjozOSBtb2JpbGUga2VybmVsOiBQTTogZHBtX3J1
bl9jYWxsYmFjaygpOiBwY2lfcG1fcmVzdW1lKzB4MC8weDkwCj4gcmV0dXJucyAtMjIKPiBTZXAg
MTUgMTc6MzY6MzkgbW9iaWxlIGtlcm5lbDogYW1kZ3B1IDAwMDA6MDU6MDAuMDogcGNpX3BtX3Jl
c3VtZSsweDAvMHg5MAo+IHJldHVybmVkIC0yMiBhZnRlciAxOTU0MzUzNSB1c2Vjcwo+IFNlcCAx
NSAxNzozNjozOSBtb2JpbGUga2VybmVsOiBQTTogRGV2aWNlIDAwMDA6MDU6MDAuMCBmYWlsZWQg
dG8gcmVzdW1lCj4gYXN5bmM6IGVycm9yIC0yMgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
