Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE910CD5
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 20:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8F89272;
	Wed,  1 May 2019 18:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01089272
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 18:43:55 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0F5AB28C98
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 18:43:55 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 0408128C75; Wed,  1 May 2019 18:43:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Wed, 01 May 2019 18:43:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201273-2300-Q0griy37ih@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201273-2300@https.bugzilla.kernel.org/>
References: <bug-201273-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDEyNzMKCk1hcmNv
IChyb2RvbWFyNzA1QHByb3Rvbm1haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAg
IHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHJvZG9tYXI3
MDVAcHJvdG9ubWFpbC5jb20KCi0tLSBDb21tZW50ICM0OCBmcm9tIE1hcmNvIChyb2RvbWFyNzA1
QHByb3Rvbm1haWwuY29tKSAtLS0KU2FtZSBoZXJlIG9uIGEgQjQ1MCBhbmQgYSBSWDU4MCBHUFUu
IFJhbmRvbSBibGFjayBzY3JlZW4gd2l0aCBjb21wbGV0ZSBsb2NrdXAKb2YgdGhlIHN5c3RlbSAo
cGFuaWMsIHByb2JhYmx5Pykgc29tZXRpbWVzIGFmdGVyIGJvb3RpbmcgdXAgdGhlIHN5c3RlbSwK
YmVldHdlZW4gNSBzZWNvbmRzIGFuZCB0d28gbWludXRlcyBwb3N0IGdyYXBoaWNhbCBib290LiBJ
ZiB0aGUgc3lzdGVtIHN1cnZpdmVzCnRoaXMgdGltZSBpdCdzIHN0YWJsZSB1bnRpbCBzaHV0ZG93
bi4KClF1aXRlIGFubm95aW5nLCBmcmFua2x5LiBJIHN0aWxsIG5lZWQgdG8gdGVzdCBwcm9wZXJs
eSB0aGUgbW9kdWxlIHBhcmFtZXRlcgphbWRncHUuZGM9MCwgdGhhdCBzZWVtcyB0byBkaXNhYmxl
IHRoZSBmaXJtd2FyZSBsb2FkIG9mIHRoZSBEaXNwbGF5IENvbnRyb2xsZXIKKGlmIEkgcmVtZW1i
ZXIgY29ycmVjdGx5KTsgYnV0IHdoYXQgZmVhdHVyZSBvZiB0aGUgY2FyZCAoaWYgYW55IGF0IGFs
bCkgd2lsbApub3Qgd29yayBpZiB0aGUgZmlybXdhcmUgaXMgbm90IGxvYWRlZD8KCk1vbml0b3Ig
dXNlZCBpcyBhIDEyMCBIeiBjb25uZWN0ZWQgdmlhIERWSS1EIHRvIHRoZSBHUFUuIFNpbmNlIHNv
bWVvbmUgcXVvdGVkCnRoYXQgd2FzIHNpbXBseSBhIGxvY2t1cCBvZiB0aGUgb3V0cHV0LCBzaW1w
bHkgZml4ZWQgd2l0aCBhIHJlcGx1ZyBvZiB0aGUKbW9uaXRvciwgSSd2ZSB0cmllZCB0byBjb25u
ZWN0IHRoZSBtb25pdG9yIHZpYSBIRE1JIGFmdGVyIGl0IGZyb3plIGFuZApibGFja3NjcmVlbmVk
OyBob3dldmVyIG5vIG91dHB1dCB0aGVyZSBlaXRoZXIsIGFuZCBubyByZXNwb25zZSBmcm9tIHRo
ZSBzeXN0ZW0Kd2hlbiBJIHdhcyBwcmVzc2luZyB0aGUgcG93ZXIgYnV0dG9uOyBoZW5jZWZvcnRo
IHRoYXQgdG8gbWUgbG9vayBsaWtlIGEga2VybmVsCnBhbmljLgoKSXQgaXMgYSBwcm9ibGVtIG9m
IHRoZSBvcGVuIHNvdXJjZSBkcml2ZXIgb3IgdGhlIERDIGZpcm13YXJlIGl0c2VsZiB0aGUgY2F1
c2UKb2YgdGhpcyBwYW5pY3M/IEhhcyBhbnlvbmUgdHJpZWQgdG8gY29udGFjdCBBTUQgYWJvdXQg
dGhpcyBpc3N1ZSBpZiBpdCdzIHRoZQpsYXR0ZXIgb25lPwoKLS0gCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
