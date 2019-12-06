Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7F114C2F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 06:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D526E1BB;
	Fri,  6 Dec 2019 05:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E4B6E1BB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 05:52:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Fri, 06 Dec 2019 05:52:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-INVIDrwthh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICM0MyBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQp0
aGUgZmlsZSBpcyBjb3JyZWN0IC4uIGFuZCB5b3UgY2FuIHRlbGwgdGhhdCBiZWNhdXNlIGl0cyBy
ZWFkaW5nIHRoZSB0ZW1wCiJjdXJyZW50IHB3bTogNzYiCgplcnJvciBpcyBiZWNhdXNlIE5PVEhJ
TkcgaXMgYmVpbmcgYWxsb3dlZCB0byBlZGl0IHB3bTFfZW5hYmxlIGl0IGlzIHN0dWNrIG9uCmF1
dG8gc28gbm90aGluZyBjYW4gbWFudWFsbHkgY2hhbmdlIHB3bTEKCgoKYnV0IGlmIHRoZWlyIGlz
IGFuIGVycm9yIGluIG15IGFkanVzdG1lbnRzIGxldCBtZSBrbm93IAoKCiMgaHdtb24gcGF0aHMs
IGhhcmRjb2RlZCBmb3Igb25lIGFtZGdwdSBjYXJkLCBhZGp1c3QgYXMgbmVlZGVkCkhXTU9OPSQo
bHMgL3N5cy9jbGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9uMSkKRklMRV9QV009JChl
Y2hvIC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9od21vbi9od21vbjEvcHdtMSkKRklMRV9G
QU5NT0RFPSQoZWNobyAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvaHdtb24vaHdtb24xL3B3
bTFfZW5hYmxlKQpGSUxFX1RFTVA9JChlY2hvIC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9o
d21vbi9od21vbjEvdGVtcDFfaW5wdXQpCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWls
IGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
