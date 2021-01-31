Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F6309B9A
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AE6E067;
	Sun, 31 Jan 2021 11:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C125D6E067
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 90A9F64E2E
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612092750;
 bh=vioJd0Qe+Esc0RLsY6HIvf/LsH5WCzKqYtkHislRHyI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SlhmYmw1f42E9pn5pzHwt2K3nMzt+26DGH32wrkG7BF3QLo0HZFais3fwzruCnMx/
 AZQ9ab1ZK/qvB4UsXi2+DbTAJqgdO5JFy5gwcIDXG8TqxAS/9a/7sewolsi3q+6sH+
 CV+wKkELwukJ9w5YKUF8gPuZYdclMkF4tQb7rHnc/b/fy8VE1HWfHnyaSIQxWvsCwR
 e5B5ReBIPLGaThwAONzhqQh5cEA72pkIg8EYme+18brDcTlH18p4N+6eZToZrky9hh
 tpAlIxGdFCFFaRHVYfFB7E+EzsvR/ka3wBRR11R/WN8YyJCJQvBMXzj1OCMikDu9ij
 LeaH5OacNlHmg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 837B065321; Sun, 31 Jan 2021 11:32:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Sun, 31 Jan 2021 11:32:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209713-2300-Gsf8nlKsF5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209713-2300@https.bugzilla.kernel.org/>
References: <bug-209713-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDk3MTMKCi0tLSBD
b21tZW50ICMxNCBmcm9tIE1pY2hlbCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQoo
SW4gcmVwbHkgdG8gRnJhbmsgS3J1Z2VyIGZyb20gY29tbWVudCAjMTIpCj4gSSBhbSBzZWVpbmcg
dGhlIGFmb3JlbWVudGlvbmVkIHdhcm5pbmcgYXQgYm9vdCBmb3Iga2VybmVsID49IDUuMTAuMTAs
IHdpdGgKPiBrZXJuZWwtZmlybXdhcmUtYW1kZ3B1LTIwMjEwMTE5IChBTUQgUnl6ZW4gNyBQUk8g
NDc1MFUpLiBLZXJuZWwgNS4xMC45IGRvZXMKPiBub3QgaGF2ZSBpdC4KClRoaXMgd2FzIG9yaWdp
bmFsbHkgcmVwb3J0ZWQgZm9yIG9sZGVyIGtlcm5lbHMsIGFuZCBwZXIgY29tbWVudCAyLCBJIHdh
cwpoaXR0aW5nIGl0IHdpdGggdGhlIERSTSBjb2RlIG1lcmdlZCBmb3IgNS4xMCBiZWZvcmUgNS4x
MC1yYzEuIFlvdSBwcm9iYWJseSBqdXN0CmRpZG4ndCBoaXQgaXQgd2l0aCA1LjEwLjkgYnkgbHVj
ay4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
