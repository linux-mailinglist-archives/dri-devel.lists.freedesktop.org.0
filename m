Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEB306D0B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 06:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0776E8D6;
	Thu, 28 Jan 2021 05:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9D6E8D6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:41:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1768864DD8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611812479;
 bh=Fe4ui/oDLh84m4GLyRC9AOImRyq9bg+hHz8mZ4E/wsk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V9BNERdBgC6dZKxLKW9zJ8Wpq1j+tGCLqux7ictWElBqm7CKTtWhB+RLM78jA+vZf
 XXB5jg8YbMcMKdaMvpePHrrBm5borWObyRpyKmUcJUhTfPkDDhUIZ9sCGA3jyiwXuN
 xF28tsNENgDRoc/W5+my3HQAMrBz7QuvxqiBgUxuLFJU4WLR9FpEixfkp7g6Ht2F5x
 NWBKvBG7otKAv2GcAMPhzcSBQu1y+BszXKwn0n025po8JduNcMYc/2s0zmE+PvbjhX
 e7aKGpyGRk0OdccCVktriGnAabilMrJFAZr7onrn3lv83yO4sJ+VJrcuQoa21oU+1o
 Ta9G79zSmSQMA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 08D58652FB; Thu, 28 Jan 2021 05:41:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Thu, 28 Jan 2021 05:41:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-XvAugs8Hrz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTEzNDkKCi0tLSBD
b21tZW50ICMyMSBmcm9tIGJvbGFuZG9AMTYzLmNvbSAtLS0KKEluIHJlcGx5IHRvIE1pY2hlbCBE
w6RuemVyIGZyb20gY29tbWVudCAjMTQpCj4gPiBJZiBlbmFibGUgNjRiaXQga2VybmVsIHN1cHBv
cnQsSSBuZWVkIHRvIHJlY29tcGlsZSBldmVyeXRoaW5nIG9uIExGUzEwLjAgaW4KPiA+IG5leHQg
d2Vla3MuCj4gCj4gWW91IHNob3VsZG4ndC4gMzItYml0IHVzZXItc3BhY2Ugd29ya3MgZmluZSB3
aXRoIGEgNjQtYml0IGtlcm5lbC4KCllvdSBhZHZpc2UgaXMgdmVyeSBlZmZlY3RpdmUhIEkgdXNl
IFVidW50dSB0byBjb21waWxlIHRoZSBYNjQga2VybmVsIC4gVGhhbmtzICEKCi0tIApZb3UgbWF5
IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
