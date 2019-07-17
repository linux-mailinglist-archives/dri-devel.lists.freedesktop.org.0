Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA596C2FE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 00:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEBD8912D;
	Wed, 17 Jul 2019 22:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B278912D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 22:09:43 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 637CE28770
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 22:09:43 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 5780628789; Wed, 17 Jul 2019 22:09:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204145] amdgpu video playback causes host to hard reset
 (checkstop) on POWER9 with RX 580
Date: Wed, 17 Jul 2019 22:09:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: robert@robbieab.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204145-2300-s8OLthrMGK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204145-2300@https.bugzilla.kernel.org/>
References: <bug-204145-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxNDUKClJvYmVy
dCBCcmlkZ2UgKHJvYmVydEByb2JiaWVhYi5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQg
ICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8cm9iZXJ0
QHJvYmJpZWFiLmNvbQoKLS0tIENvbW1lbnQgIzIwIGZyb20gUm9iZXJ0IEJyaWRnZSAocm9iZXJ0
QHJvYmJpZWFiLmNvbSkgLS0tCkkgd2FzIGVuY291bnRlcmluZyBhIGJ1ZyBzaG93aW5nIHNpbWls
YXIgc3ltcHRvbXMgd2l0aCBhIGRpZmZlcmVudCB0cmlnZ2VyOiBGb3IKbWUsIGFueSBhdHRlbXB0
IHRvIHBsYXkgc291bmQgY29uc2lzdGVudGx5IGFuZCBpbW1lZGlhdGVseSBjcmFzaGVkIG15IHN5
c3RlbS4gCgpUaGlzIHdhcyBub3QgdGhlIGNhc2Ugd2l0aCB0aGUgNC4yMCBrZXJuZWwsIHdhcyBj
b25maXJtZWQgaGFwcGVuaW5nIHdpdGggdGhlCjUuMSBrZXJuZWwuIGdpdCBiaXNlY3Rpb24gaWRl
bnRpZmllZCB0aGUgc2FtZSBwYXRjaCBUaW1vdGh5IGhhcyBpZGVudGlmaWVkIGFzCnRoZSBwYXRj
aCBpbnRyb2R1Y2luZyB0aGUgaXNzdWUgZm9yIG1lLgoKSSBjYW4gY29uZmlybSB0aGF0IHRoZSBw
YXRjaCBwcm92aWRlZCBieSBTaGF3biBhcHBlYXJzIHRvIGZpeCB0aGUgaXNzdWUuCkJ1aWxkaW5n
IGEga2VybmVsIHdpdGggdGhhdCBwYXRjaCBhcHBsaWVkIHRvIGhlYWQgKGNvbW1pdAoyMjA1MWQ5
YzRhNTdkM2I0YThiNWE3NDA3ZWZjODBjNzFjN2JmYjE2KSBmcm9tIGxpbnV4LmdpdCBwcm92aWRl
cyBtZSB3aXRoIGEKa2VybmVsIHRoYXQgbm8gbG9uZ2VyIGNyYXNoZXMgd2hlbiBJIGF0dGVtcHQg
dG8gcGxheSBzb3VuZC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
