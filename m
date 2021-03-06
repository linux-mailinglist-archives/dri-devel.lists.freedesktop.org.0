Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5032FC02
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 17:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75D6E03E;
	Sat,  6 Mar 2021 16:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C63C6E03E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 16:43:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 240A064FE2
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615048993;
 bh=ab69MrhV1dk6uqjfqRSPPeuh7ajPH8SbfkStKIYYE7U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bUr5m3tItV08/cNp7M+HQU/tAre5rgOSbVSmYPaCvOOGCUvakYxB4RPcQDPHnj4GB
 7rbi23u+gsdTwWkwjb1TZS/E6yDdXPPL7jDtiUs7iudFKEQWIS6U1eMeyInVQo5ocF
 5h4VKe9x20Z3uesc0eYZLiEW/WHK1sO8kkZdiSdz0ag/St6IC4JQdu0xo+GdR36mce
 G5WZvX2oaELb7jXhm724HlUleWlRl69JI13vl+uzN5I5mb+mN8skzE3QW9uFPNeUVn
 uq1spPkbsw1uk1bc/U+z7ufwoHvw7JgcooCAXot8q7uI4D6TsSU7RdvVJn8Ow9BIhv
 J9XY8NdlJsSEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 164B06530C; Sat,  6 Mar 2021 16:43:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Sat, 06 Mar 2021 16:43:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version bug_severity
Message-ID: <bug-211425-2300-irPJ3aNoYu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTE0MjUKCkFuZHJl
YXMgKGljZWRyYWdvbi5hd0B3ZWIuZGUpIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJl
bW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAg
IEtlcm5lbCBWZXJzaW9ufDUuMTEuMiAgICAgICAgICAgICAgICAgICAgICB8NS4xMS4zCiAgICAg
ICAgICAgU2V2ZXJpdHl8YmxvY2tpbmcgICAgICAgICAgICAgICAgICAgIHxub3JtYWwKCi0tLSBD
b21tZW50ICMxMiBmcm9tIEFuZHJlYXMgKGljZWRyYWdvbi5hd0B3ZWIuZGUpIC0tLQpCYWNrIHRv
IG5vcm1hbCByZWdyZXNzaW9uIGluIDUuMTEuMyAoYmlzZWN0aW9uIGluIGNvbW1lbnQgOSkuCgpD
dXJyZW50IHN0YXRlOgp1bnRpbCA1LjEwLjIwIC0gMnggZXJyb3JzIGFuZCBzdXNwZW5kZWQgc2Ny
ZWVuIGZvciAyeDIwc2VjCmZyb20gIDUuMTEuMCB0byA1LjExLjIgLSBmcmVlemluZyAhISEKZnJv
bSAgNS4xMS4zIC0gYmFjayB0byAyeCBlcnJvcnMgYW5kIHN1c3BlbmRlZCBzY3JlZW4gZm9yIDJ4
MjBzZWMKCkVycm9yIG91dHB1dCBmcm9tIDUuMTEuMzoKW1NhIE3DpHIgIDYgMTc6MzQ6MDggMjAy
MV0gW2RybTphdG9tX29wX2p1bXBdICpFUlJPUiogYXRvbWJpb3Mgc3R1Y2sgaW4gbG9vcCBmb3IK
bW9yZSB0aGFuIDIwc2VjcyBhYm9ydGluZwpbU2EgTcOkciAgNiAxNzozNDowOCAyMDIxXSBbZHJt
OmFtZGdwdV9hdG9tX2V4ZWN1dGVfdGFibGVfbG9ja2VkXSAqRVJST1IqCmF0b21iaW9zIHN0dWNr
IGV4ZWN1dGluZyBCMjI4IChsZW4gMzYwOCwgV1MgOCwgUFMgMCkgQCAweEIzNzYKW1NhIE3DpHIg
IDYgMTc6MzQ6MDggMjAyMV0gW2RybTphbWRncHVfYXRvbV9leGVjdXRlX3RhYmxlX2xvY2tlZF0g
KkVSUk9SKgphdG9tYmlvcyBzdHVjayBleGVjdXRpbmcgQjExQyAobGVuIDI2OCwgV1MgNCwgUFMg
MCkgQCAweEIxNkYKW1NhIE3DpHIgIDYgMTc6MzQ6MDggMjAyMV0gW2RybTpkY24xMF9saW5rX2Vu
Y29kZXJfZW5hYmxlX2RwX291dHB1dF0gKkVSUk9SKgpkY24xMF9saW5rX2VuY29kZXJfZW5hYmxl
X2RwX291dHB1dDogRmFpbGVkIHRvIGV4ZWN1dGUgVkJJT1MgY29tbWFuZCB0YWJsZSEKW1NhIE3D
pHIgIDYgMTc6MzQ6MDkgMjAyMV0gW2RybV0gYW1kZ3B1X2RtX2lycV9zY2hlZHVsZV93b3JrIEZB
SUxFRCBzcmMgMgouLi4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEg
Y29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
