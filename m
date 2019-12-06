Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24193114C35
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 06:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1742A6E1D5;
	Fri,  6 Dec 2019 05:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2196E1D5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 05:56:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Fri, 06 Dec 2019 05:56:50 +0000
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
Message-ID: <bug-201539-2300-N5ixvKYqIU@https.bugzilla.kernel.org/>
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
b21tZW50ICM0NCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQph
aW9AYWlvOn4kIGxzIC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9od21vbi9od21vbjEKZGV2
aWNlICAgICAgIGZyZXExX2lucHV0ICBuYW1lICAgICAgICAgICAgcHdtMSAgICAgICAgIHRlbXAx
X2NyaXRfaHlzdApmYW4xX2VuYWJsZSAgZnJlcTFfbGFiZWwgIHBvd2VyICAgICAgICAgICBwd20x
X2VuYWJsZSAgdGVtcDFfaW5wdXQKZmFuMV9pbnB1dCAgIGZyZXEyX2lucHV0ICBwb3dlcjFfYXZl
cmFnZSAgcHdtMV9tYXggICAgIHRlbXAxX2xhYmVsCmZhbjFfbWF4ICAgICBmcmVxMl9sYWJlbCAg
cG93ZXIxX2NhcCAgICAgIHB3bTFfbWluICAgICB1ZXZlbnQKZmFuMV9taW4gICAgIGluMF9pbnB1
dCAgICBwb3dlcjFfY2FwX21heCAgc3Vic3lzdGVtCmZhbjFfdGFyZ2V0ICBpbjBfbGFiZWwgICAg
cG93ZXIxX2NhcF9taW4gIHRlbXAxX2NyaXQKYWlvQGFpbzp+JCBjYXQgIC9zeXMvY2xhc3MvZHJt
L2NhcmQxL2RldmljZS9od21vbi9od21vbjEvcHdtMQo2OAphaW9AYWlvOn4kIGNhdCAgL3N5cy9j
bGFzcy9kcm0vY2FyZDEvZGV2aWNlL2h3bW9uL2h3bW9uMS9wd20xX2VuYWJsZQoyCmFpb0BhaW86
fiQgY2F0ICAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvaHdtb24vaHdtb24xL3RlbXAxX2lu
cHV0CjU0MDAwCmFpb0BhaW86fiQKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
