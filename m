Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE936EE82
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6926F3DC;
	Thu, 29 Apr 2021 17:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B06F3DC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:01:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 796D461453
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619715691;
 bh=q04Fv8QrCdgfHQTNZJrGjHzhiHYbhMdDkbCD2BNDtZk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PSS4MdthjUxG5nKi4/ag6BPCV2Rva7ZLqN9w9QJxh/LX/QuzhAftMFmPCK3xODzMJ
 6RSBwKW6e9YyZjiubuPIPQDfZ32uiMzHZ7VVBl5dTiRQkUURoBYuww8dtgYEDpxUav
 S7iLhzmw/RLKisKcYwT+mGVcUOaceaXzkeH5+Ckut/6aAZkq++wPHLwxDDw1BT9x7n
 4sHOuNHg1w+bgXPm3CDp1dndr9UHbBMUBRdBSEpDZ/19cHgVc1C0H5MKqo/sqgluwh
 tMTWQbiebG+dM7jONuuvq6KoDjGYGNzqzKDoMFqW6LY+dlCCt7+qmN8cTaQ3aBK0ga
 s5uhIH+cdbolg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6C8EB61186; Thu, 29 Apr 2021 17:01:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Thu, 29 Apr 2021 17:01:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212107-2300-pvpxbAYCsn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCk1hcnRp
biAobWFydGluLnRrQGdteC5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92
ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAg
ICAgICAgU3RhdHVzfENMT1NFRCAgICAgICAgICAgICAgICAgICAgICB8UkVPUEVORUQKICAgICAg
ICAgUmVzb2x1dGlvbnxBTlNXRVJFRCAgICAgICAgICAgICAgICAgICAgfC0tLQoKLS0tIENvbW1l
bnQgIzkgZnJvbSBNYXJ0aW4gKG1hcnRpbi50a0BnbXguY29tKSAtLS0KSGVsbG8sCgppcyBpdCBw
b3NzaWJsZSB0byByZXR1cm4gdG8gdGhlIGJlaGF2aW91ciBmcm9tIHZlcnNpb24gNS4xMD8KQmFj
ayB0aGVuIG15IGdwdSB3YXMgY29vbCBhbmQgcXVpZXQuCgpJJ20gcnVubmluZyA1LjExLjE3IGN1
cnJlbnRseSBhbmQgdGVtcGVyYXR1cmUgb24gdGhlIEdQVSBnZXRzIHRvIDcwwrBDIGJ1dCBmYW4K
aXMgYXQgbGlrZSAzMDBycG0uCgpUaGUgYWJvdmUgaXMgd2l0aG91dCB0b3VjaGluZyBhbnl0aGlu
ZyBpbgovc3lzL2NsYXNzL2RybS9jYXJkMC9kZXZpY2UvaHdtb24vaHdtb24xCgpXaGVuIEkgZGlz
YWJsZSBmYW4gY29udHJvbCBieSBwdXR0aW5nIDAgaW4KL3N5cy9jbGFzcy9kcm0vY2FyZDAvZGV2
aWNlL2h3bW9uL2h3bW9uMS9wd20xX2VuYWJsZSB0aGUgZmFuIHNwaW5zIHVwIHRvIHRvcApzcGVl
ZC4gMiBrZWVwcyBpdCBydW5uaW5nIGF0IDIwMDBycG0gYW5kIGl0J3MgbG91ZC4gV2hpY2ggaXMg
c3RyYW5nZSBiZWNhdXNlCmFmdGVyIGJvb3RpbmcgaXQncyAyLgoKSWRlYWxseSBpdCB3b3VsZCBi
ZSBncmVhdCBpZiBJIGNvdWxkIHJldHVybiB0byBob3cgaXQgd29ya2VkIG9uIDUuMTAKCi0tIApZ
b3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBv
ZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
