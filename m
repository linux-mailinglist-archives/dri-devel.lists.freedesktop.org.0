Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3B1164A0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 01:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022286E188;
	Mon,  9 Dec 2019 00:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B86E188
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 00:55:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Mon, 09 Dec 2019 00:55:47 +0000
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
Message-ID: <bug-201539-2300-Dtmj3GJyy2@https.bugzilla.kernel.org/>
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
b21tZW50ICM1MSBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpj
dXJyZW50IHRlbXA6IDYxMDAwCmludGVycG9sYXRlZCBwd20gdmFsdWUgZm9yIHRlbXBlcmF0dXJl
IDYxMDAwIGlzOiAxNzAKY3VycmVudCBwd206IDE2NSwgcmVxdWVzdGVkIHRvIHNldCBwd20gdG8g
MTcwCmN1cnJlbnQgcHdtOiAxNjUsIHJlcXVlc3RlZCB0byBzZXQgcHdtIHRvIDE3MAp0ZW1wIGF0
IGxhc3QgY2hhbmdlIHdhcyA2MTAwMApjaGFuZ2luZyBwd20gdG8gMTcwCgpjdXJyZW50IHRlbXA6
IDcxMDAwCmN1cnJlbnQgcHdtOiAyNTUsIHJlcXVlc3RlZCB0byBzZXQgcHdtIHRvIDI1NQpjdXJy
ZW50IHB3bTogMjU1LCByZXF1ZXN0ZWQgdG8gc2V0IHB3bSB0byAyNTUKbm90IGNoYW5naW5nIHB3
bSwgd2UganVzdCBkaWQgYXQgNzEwMDAsIG5leHQgY2hhbmdlIHdoZW4gYmVsb3cgNjYwMDAKCgpj
dXJyZW50IHRlbXA6IDczMDAwCmN1cnJlbnQgcHdtOiA2OCwgcmVxdWVzdGVkIHRvIHNldCBwd20g
dG8gMjU1CmN1cnJlbnQgcHdtOiA2OCwgcmVxdWVzdGVkIHRvIHNldCBwd20gdG8gMjU1CkZhbm1v
ZGUgbm90IHNldCB0byBtYW51YWwuCnNldHRpbmcgZmFuIG1vZGUgdG8gMQp0ZW1wIGF0IGxhc3Qg
Y2hhbmdlIHdhcyA3MzAwMApjaGFuZ2luZyBwd20gdG8gMjU1Ci91c3IvbG9jYWwvYmluL2FtZGdw
dS1mYW5jb250cm9sOiBsaW5lIDY1OiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVu
dAoKCgoKY3VycmVudCB0ZW1wOiA4NzAwMApjdXJyZW50IHB3bTogMTI0LCByZXF1ZXN0ZWQgdG8g
c2V0IHB3bSB0byAyNTUKY3VycmVudCBwd206IDEyNCwgcmVxdWVzdGVkIHRvIHNldCBwd20gdG8g
MjU1CkZhbm1vZGUgbm90IHNldCB0byBtYW51YWwuCnNldHRpbmcgZmFuIG1vZGUgdG8gMQp0ZW1w
IGF0IGxhc3QgY2hhbmdlIHdhcyA4NzAwMApjaGFuZ2luZyBwd20gdG8gMjU1Ci91c3IvbG9jYWwv
YmluL2FtZGdwdS1mYW5jb250cm9sOiBsaW5lIDY1OiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxp
ZCBhcmd1bWVudAoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3Ug
YXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
