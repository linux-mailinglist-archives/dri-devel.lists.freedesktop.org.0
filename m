Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FB4A8B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 19:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF46E20F;
	Tue, 18 Jun 2019 17:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA056E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 17:42:57 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 280A828B05
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 17:42:57 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 1BB7B28B22; Tue, 18 Jun 2019 17:42:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Tue, 18 Jun 2019 17:42:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supasean@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201539-2300-zj07vccEGb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKClNlYW4g
Qmlya2hvbHogKHN1cGFzZWFuQGhvdG1haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHN1cGFz
ZWFuQGhvdG1haWwuY29tCgotLS0gQ29tbWVudCAjMTggZnJvbSBTZWFuIEJpcmtob2x6IChzdXBh
c2VhbkBob3RtYWlsLmNvbSkgLS0tCkkgYW0gbm90IGEga2VybmVsIGRldmVsb3BlciBhbmQgaGF2
ZW4ndCBkb25lIG11Y2ggcHJvZ3JhbW1pbmcgYXMgb2YgbGF0ZSwgc28gSQphbSBub3QgcmVhbGx5
IGluIGEgcG9zaXRpb24gdG8gYWN0dWFsbHkgdGVzdCB0aGlzIGh5cG90aGVzaXMuICBIb3dldmVy
IC0gZnJvbQp0aGUgYml0IG9mIHJlc2VhcmNoIEkndmUgZG9uZSB0cnlpbmcgdG8gZmlndXJlIHRo
aXMgcHJvYmxlbSBvdXQgZm9yIG15c2VsZiBJCmJlbGlldmUgdGhlIGZvbGxvd2luZyBleHBsYWlu
cyB0aGUgb3ZlcmhlYXRpbmcgYW5kIGJ1cnN0IG9mIGZhbiBzcGVlZCBpbnN0ZWFkCm9mIHByb3Bl
ciBjb29saW5nIGJlaGF2aW9yLgoKSGVyZSBpcyBteSBzZW5zb3JzIGJpdCBmcm9tIGtlcm5lbCA0
LjE4LnggLSBJIGhhdmUgdGhlIFI5LTI5MC4KCmFtZGdwdS1wY2ktMDEwMApBZGFwdGVyOiBQQ0kg
YWRhcHRlcgp2ZGRnZng6ICAgICAgICAgICBOL0EgIApmYW4xOiAgICAgICAgICAgMCBSUE0KdGVt
cDE6ICAgICAgICArNjUuMMKwQyAgKGNyaXQgPSArMTIwLjDCsEMsIGh5c3QgPSArOTAuMMKwQykK
ClRha2Ugbm90ZSB0aGF0IHRoaXMgZGlzcGxheXMgdGhlIHByb3BlciBjcml0aWNhbCBhbmQgaHlz
dGVyZXNpcyB2YWx1ZXMgZm9yIG15CmNhcmQuICBJZiB5b3UgbG9vayBhdCB0aGUgcG9zdCBvbiBj
b21tZW50IDE0IHdoaWNoIGlzIGhvdyBzZW5zb3JzIGRpc3BsYXkgdGhlCmNyaXQvaHlzdCB2YWx1
ZSBmb3Iga2VybmVscyBiZXlvbmQgNC4xOC54IHlvdSBub3RpY2UgdGhlIGNyaXRpY2FsIHZhbHVl
IGlzCmFib3V0IDE5eCB0aGUgdGVtcGVyYXR1cmUgb2YgdGhlIHN1cmZhY2Ugb2YgdGhlIHN1biBh
bmQgdGhlIGh5c3QgdmFsdWUgaXMKYWJzb2x1dGUgemVyby4gIFRoZXNlIHZhbHVlcyBhcmUgaGFy
ZCBjb2RlZCBpbnRvIGtlcm5lbCBzb3VyY2UgY29kZSBpbiBzb21lCmZpbGUsIGZvcmdpdmUgbWUg
YXMgSSBkbyBub3QgcmVjYWxsIHdoZXJlIEkgc2F3IHRoZSBjb2RlIHNuaXBwZXQuICBCdXQgSQpz
dHJvbmdseSBiZWxpZXZlIHRoYXQgY29ycmVjdGluZyB0aGUgdmFsdWVzIGluIHRoZSBmaWxlIG9y
IGNoYW5naW5nIGl0IHRvCmRldGVjdCBwcm9wZXIgY3JpdC9oeXN0IHZhbHVlcyBiYXNlZCBvbiBj
YXJkIHdpbGwgY29ycmVjdCB0aGlzIGlzc3VlLiAgSSBzaW1wbHkKZG8gbm90IGhhdmUgdGhlIG1l
YW5zIHRvIGRvIHRoaXMsIG5vciBkbyBJIGtub3cgaG93IHRvIHN1Ym1pdCBrZXJuZWwgYnVnIGZp
eGVzCmFuZCBob3BlIHNvbWVvbmUgd2l0aCBtb3JlIGV4cGVyaWVuY2UgY291bGQgZ2l2ZSBpdCBh
IHNob3QgYW5kIHNlZSBpZiB0aGUKcmVzdWx0aW5nIGtlcm5lbCBmdW5jdGlvbnMgcHJvcGVybHku
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
