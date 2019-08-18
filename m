Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1F918DD
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3446E05F;
	Sun, 18 Aug 2019 18:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46ED6E088
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 18:30:52 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 70A3127DCD
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 18:30:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 64FCD22B39; Sun, 18 Aug 2019 18:30:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204599] amdgpu: RX 560 randomly hangs with kernel >= 5.1
Date: Sun, 18 Aug 2019 18:30:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tony.darko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204599-2300-LrhfgzHd37@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204599-2300@https.bugzilla.kernel.org/>
References: <bug-204599-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1OTkKCkV2Z2Vu
eSBTaHZpdHMgKHRvbnkuZGFya29AZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgIFN0YXR1c3xORVcgICAgICAgICAgICAgICAgICAgICAgICAgfFJFU09M
VkVECiAgICAgICAgIFJlc29sdXRpb258LS0tICAgICAgICAgICAgICAgICAgICAgICAgIHxDT0RF
X0ZJWAoKLS0tIENvbW1lbnQgIzYgZnJvbSBFdmdlbnkgU2h2aXRzICh0b255LmRhcmtvQGdtYWls
LmNvbSkgLS0tCkkgc3RhcnRlZCBiaXNlY3QsIGJ1dCBmb3VuZCB0aGF0IEkgd2FzIHVzaW5nIGFu
IG91dGRhdGVkIHZlcnNpb24gb2YgdGhlIE9wZW5DTApsaWJzIGZyb20gYW1kZ3B1LXBybyA6KApB
ZnRlciB1cGRhdGluZyBsaWJzIHJhbmRvbWx5IGhhbmdzIHdhcyBzdG9wcGVkLgoKQW5vdGhlciBw
cm9ibGVtIHdpdGggcmV0dXJuIGZyb20gaGliZXJuYXRlIGkgd2lsbCB0ZXN0aW5pbmcgYW5kIHdp
bGwgb3BlbiBuZXcKdGlja2V0IGlmIGJ1ZyBleGlzdHMuCgpQbGVhc2UgY2xvc2UgdGhpcyBidWcs
IGknbSBzb3JyeSBmb3IgbXkgY2FyZWxlc3NuZXNzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
