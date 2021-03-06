Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCB32FADD
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 14:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DFB6E51B;
	Sat,  6 Mar 2021 13:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03CF6E51B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 13:33:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 008F465020
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615037605;
 bh=CmffAdkgXWimcrDz0SSS464OSIyzxAff8L0rDtAFWuo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Dt4zVl6mMxYhejR484jhKb+vIhsPF3ihxlglzbojNP6pXY8h1TP66x8GfoJkjz8QH
 NkEQCUl1iQaNLPyHIzPY4XMBRyCtl252OUuCxU5YvWPkgixGJZKBHgKFed+8CZbusP
 rHIwd+fCiqkSItetYMmjR88xJThZUphaVke4DLHlwAuByBYwHRdzze6nOj9cB3QeDG
 /md41pLgsAm7hWzYZO2Fg6+MRotgJ4VfYofoOLDECQ9t5nzoo74ioNEOX9sLEWTI+9
 i08kY8mtlF41yWMg07xw63vBiWjlfFaH4aSqI0oaqF2wM6+P4KPnN05EAzQwfVE/1n
 FivFcQHM7SgSw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F173265307; Sat,  6 Mar 2021 13:33:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Sat, 06 Mar 2021 13:33:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: honza.klos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211033-2300-8706Tg2yHW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTEwMzMKCkphbiBL
bG9zIChob256YS5rbG9zQGdtYWlsLmNvbSkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8
UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAg
ICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxob256YS5rbG9z
QGdtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzE3IGZyb20gSmFuIEtsb3MgKGhvbnphLmtsb3NAZ21h
aWwuY29tKSAtLS0KSSBkb24ndCB0aGluayB0aGlzIGlzIGxpbWl0ZWQganVzdCB0byBLVk1zIGFu
ZCBzdWNoLiBPbiBteSBWZWdhIDY0ICsKNS4xMS4zLWFyY2gxIChoYWQgdGhlIHNhbWUgcHJvYmxl
bSB3aXRoIDUuMTEuMiwgNS4xMCBldGMuKSwgc29tZXRpbWVzLCB3aGVuIEkKcmV0dXJuIHRvIFBD
IGFmdGVyIGEgd2hpbGUgYW5kIG15IDIgbW9uaXRvcnMgYXJlIHNsZWVwaW5nLCBvbmx5IG9uZSBt
b25pdG9yCndha2VzIHVwLCB0aGUgb3RoZXIgb25lIHJlbWFpbnMgaW4gc2xlZXAgbW9kZS4gRG1l
c2cgc2hvd3MgdGhpczoKCltixZllIDYgMTQ6MjJdIFtkcm1dIHBlcmZvcm1fbGlua190cmFpbmlu
Z193aXRoX3JldHJpZXM6IExpbmsgdHJhaW5pbmcgYXR0ZW1wdCAxCm9mIDQgZmFpbGVkCltixZll
IDYgMTQ6MjNdIFtkcm1dIHBlcmZvcm1fbGlua190cmFpbmluZ193aXRoX3JldHJpZXM6IExpbmsg
dHJhaW5pbmcgYXR0ZW1wdCAyCm9mIDQgZmFpbGVkClsgICswLDQ3MzM1Ml0gW2RybV0gcGVyZm9y
bV9saW5rX3RyYWluaW5nX3dpdGhfcmV0cmllczogTGluayB0cmFpbmluZyBhdHRlbXB0IDMKb2Yg
NCBmYWlsZWQKWyAgKzAsNDM3NzUzXSBbZHJtXSBlbmFibGluZyBsaW5rIDAgZmFpbGVkOiAxNQpb
ICArMCw0MzIyNzZdIFtkcm1dIHBlcmZvcm1fbGlua190cmFpbmluZ193aXRoX3JldHJpZXM6IExp
bmsgdHJhaW5pbmcgYXR0ZW1wdCAxCm9mIDQgZmFpbGVkClsgICswLDQwNTgyN10gW2RybV0gcGVy
Zm9ybV9saW5rX3RyYWluaW5nX3dpdGhfcmV0cmllczogTGluayB0cmFpbmluZyBhdHRlbXB0IDIK
b2YgNCBmYWlsZWQKWyAgKzAsNDc2MTcyXSBbZHJtXSBwZXJmb3JtX2xpbmtfdHJhaW5pbmdfd2l0
aF9yZXRyaWVzOiBMaW5rIHRyYWluaW5nIGF0dGVtcHQgMwpvZiA0IGZhaWxlZApbICArMCw0MTU0
NjZdIFtkcm1dIGVuYWJsaW5nIGxpbmsgMSBmYWlsZWQ6IDE1CgpTd2l0Y2hpbmcgdG8gdGVybWlu
YWwgYW5kIHdhaXRpbmcgYSBzZWMgb3IgdHdvIG1ha2VzIGJvdGggbW9uaXRvcnMgd29yaywKc3dp
dGNoaW5nIGJhY2sgdG8gWDExIGFuZCBldmVyeXRoaW5nIGlzIE9LLiBJdCBzZWVtcyB0byBtZSB0
aGF0IHRoZXJlIG1pZ2h0IGJlCnNvbWUga2luZCBvZiBidWcgd2hlcmUgaWYgdGhlIGZpcnN0IGxp
bmsgdHJhaW5pbmcgYXR0ZW1wdCBmYWlscywgdGhlIHN1YnNlcXVlbnQKb25lcyBBTFdBWVMgZmFp
bCBhcyB3ZWxsLCBzbyB0aGVyZSBpcyBhY3R1YWxseSBvbmx5IGEgc2luZ2xlIGFjdHVhbCBsaW5r
CnRyYWluaW5nIGF0dGVtcHQgdGhhdCBoYXMgYSBjaGFuY2UgdG8gc3VjY2VlZC4KCi0tIApZb3Ug
bWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
