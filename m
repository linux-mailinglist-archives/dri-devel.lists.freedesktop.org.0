Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167067180
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13276E0B8;
	Fri, 12 Jul 2019 14:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180096E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 14:35:23 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id BE92C28C1C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 14:35:22 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B339728C1F; Fri, 12 Jul 2019 14:35:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203879] hard freeze on high single threaded load (AMD Ryzen 7
 2700X CPU)
Date: Fri, 12 Jul 2019 14:35:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: claude@mathr.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-203879-2300-i5ZwzpiWdW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203879-2300@https.bugzilla.kernel.org/>
References: <bug-203879-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM4NzkKCkNsYXVk
ZSBIZWlsYW5kLUFsbGVuIChjbGF1ZGVAbWF0aHIuY28udWspIGNoYW5nZWQ6CgogICAgICAgICAg
IFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogICAgICAgICAgICBTdW1tYXJ5fGhhcmQgZnJlZXplIG9uIGhpZ2ggc2luZ2xlICB8
aGFyZCBmcmVlemUgb24gaGlnaCBzaW5nbGUKICAgICAgICAgICAgICAgICAgIHx0aHJlYWRlZCBs
b2FkIHdoZW4gWG9yZyBpcyAgfHRocmVhZGVkIGxvYWQgKEFNRCBSeXplbiA3CiAgICAgICAgICAg
ICAgICAgICB8YWN0aXZlIChBTUQgUnl6ZW4gNyAyNzAwWCAgIHwyNzAwWCBDUFUpCiAgICAgICAg
ICAgICAgICAgICB8Q1BVLCBBTUQgUmFkZW9uIFJYIDU4MCBHUFUpIHwKCi0tLSBDb21tZW50ICM1
IGZyb20gQ2xhdWRlIEhlaWxhbmQtQWxsZW4gKGNsYXVkZUBtYXRoci5jby51aykgLS0tCihJbiBy
ZXBseSB0byBNaWNoZWwgRMOkbnplciBmcm9tIGNvbW1lbnQgIzIpCj4gVGhhdCBzb3VuZHMgbGlr
ZSBhIGdlbmVyYWwgQ1BVIHJlbGF0ZWQgc3RhYmlsaXR5IGlzc3VlLCBub3QgZGlyZWN0bHkgcmVs
YXRlZAo+IHRvIHRoZSBhbWRncHUgZHJpdmVyLgoKVGhlIGxhdGVyIHRlc3RzIG1ha2UgbWUgYWdy
ZWUsIGNoYW5nZWQgdGl0bGUgb2YgcmVwb3J0LCBub3Qgc3VyZSB3aGljaApQcm9kdWN0L0NvbXBv
bmVudCB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlLgoKQWRkaW5nIG1vcmUgc3lzdGVtIG1vbml0
b3Jpbmcgc2VlbXMgdG8gcHJldmVudCB0aGUgY29uZGl0aW9uLCBwZXJoYXBzIGR1ZSB0bwp0aGUg
YWRkZWQgQ1BVIGxvYWQ6CgogICAgd2F0Y2ggLW4gMC4xIHNlbnNvcnMKICAgIHdhdGNoIC1uIDAu
MSAiY2F0IC9wcm9jL2NwdWluZm8gfCBncmVwIE1IeiIKCkl0IGZyZWV6ZXMgZHVyaW5nIFBORyBz
YXZpbmcgb2YgYSBsYXJnZSBpbWFnZSwgcHJlc3VtYWJseSB0aGlzIGludm9sdmVzIGxvdHMgb2YK
c2VxdWVudGlhbCBSQU0gYWNjZXNzLiAgSSBoYXZlIFhNUCBlbmFibGVkIGluIG15IG1vdGhlcmJv
YXJkIEJJT1Mgc2V0dGluZ3MKaWlyYywgcGVyaGFwcyBJIHNob3VsZCB0cnkgZGlzYWJsaW5nIGl0
PwoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNo
aW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
