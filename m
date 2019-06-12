Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1F4305D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 21:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F6689217;
	Wed, 12 Jun 2019 19:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928289217
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 19:44:26 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 79A8028AB1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 19:44:26 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 6B8C328AB7; Wed, 12 Jun 2019 19:44:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203879] New: hard freeze on high single threaded load when Xorg
 is active (AMD Ryzen 7 2700X CPU, AMD Radeon RX 580 GPU)
Date: Wed, 12 Jun 2019 19:44:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203879-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM4NzkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzODc5CiAgICAgICAgICAgU3VtbWFyeTogaGFyZCBmcmVlemUgb24g
aGlnaCBzaW5nbGUgdGhyZWFkZWQgbG9hZCB3aGVuIFhvcmcgaXMKICAgICAgICAgICAgICAgICAg
ICBhY3RpdmUgKEFNRCBSeXplbiA3IDI3MDBYIENQVSwgQU1EIFJhZGVvbiBSWCA1ODAgR1BVKQog
ICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtl
cm5lbCBWZXJzaW9uOiA0LjE5LjM3LTMgKERlYmlhbiA0LjE5LjAtNS1hbWQ2NCkgYW5kIG90aGVy
cwogICAgICAgICAgICAgICAgICAgIChpbmNsdWRpbmcgbWFpbmxpbmUgdmVyc2lvbnMpCiAgICAg
ICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAg
ICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogY2xhdWRlQG1hdGhyLmNv
LnVrCiAgICAgICAgUmVncmVzc2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVudCAyODMyMzMKICAt
LT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4MzIzMyZh
Y3Rpb249ZWRpdApkbWVzZyBmcm9tIDQuMTkuMC01LWFtZDY0IHdpdGggYW1kZ3B1LmRjPTEgKG5v
IGZyZWV6ZSB5ZXQpCgpJIGFtIGRldmVsb3BpbmcgYSBDUFUtYmFzZWQgcHJvZ3JhbSB0byByZW5k
ZXIgZnJhY3RhbHMsIHdoaWNoIEkgdXN1YWxseSBydW4Kd2l0aCAibmljZSAtbiAyMCIuICBUaGUg
bWFpbiBjYWxjdWxhdGlvbnMgYXJlIG11bHRpLXRocmVhZGVkLCB1c2luZyAxNiB0aHJlYWRzCm9u
IEFNRCBSeXplbiA3IDI3MDBYIEVpZ2h0LUNvcmUgUHJvY2Vzc29yLiAgSG93ZXZlciwgZmluYWwg
aW1hZ2UgUE5HIHNhdmluZyBpcwpzaW5nbGUtdGhyZWFkZWQuICBEdXJpbmcgdGhlIHNpbmdsZS10
aHJlYWRlZCB3b3JrbG9hZCBvbmx5IChhcyBvYnNlcnZlZCBieSBodG9wCmFuZCBwcm9ncmFtIHN0
YXR1cyBwcmludHMpLCBpdCBjYW4gaGFwcGVuIHRoYXQgdGhlIHN5c3RlbSBmcmVlemVzIGhhcmQg
KG5vIHNzaCwKc3R1Y2sgbW91c2UgcG9pbnRlciwgbm8gTnVtTG9jayBMRUQgdG9nZ2xlLCBubyBt
YWdpYyBTeXNScSwgb25seSBwaHlzaWNhbCBwb3dlcgpidXR0b24gZm9yIGhhcmQgcG93ZXItb2Zm
IHdvcmtzKS4KClRoaXMgZnJlZXplIG9ubHkgaGFwcGVucyB3aGVuIFhvcmcgaXMgcnVubmluZyBv
biB0aGUgYWN0aXZlIHZpcnR1YWwgdGVybWluYWw6IEkKdHJpZWQgdG8gc2VlIGlmIHNvbWUga2Vy
bmVsIGxvZyBtZXNzYWdlcyB3b3VsZCBiZSBkaXNwbGF5ZWQgYmVmb3JlIGZyZWV6ZSBieQpzd2l0
Y2hpbmcgdG8gYSBjb25zb2xlIHdpdGggQ3RybC1BbHQtRjEgYWZ0ZXIgbGF1bmNoaW5nIG15IHBy
b2dyYW0sIGJ1dCB3aXRoCnRoZSB0ZXJtaW5hbCBhY3RpdmUgaXQgZG9lc24ndCBzZWVtIHRvIGZy
ZWV6ZS4KClRoZSBmcmVlemUgZG9lcyBub3QgYWx3YXlzIG9jY3VyLCBidXQgdXN1YWxseSBoYXBw
ZW5zIGJlZm9yZSBhIGRvemVuIGltYWdlcyBhcmUKc2F2ZWQgKHNlcXVlbnRpYWwgcHJvY2VzcyBp
cyBmdWxsLXRocmVhZGVkIHdvcmtsb2FkLCBmb2xsb3dlZCBieQpzaW5nbGUtdGhyZWFkZWQgd29y
a2xvYWQsIHJlcGVhdGVkKS4gIFRoaXMgY2FuIHRha2UgYSBmZXcgaG91cnMuCgpXaXRoIHRoZSB2
aXJ0dWFsIHRlcm1pbmFsIGFjdGl2ZSBpbnN0ZWFkIG9mIFhvcmcsIEkgaGF2ZSByZW5kZXJlZCAx
MDArIGltYWdlcwppbiBhIHJvdyB3aXRob3V0IGFueSBpc3N1ZXMuICBPZiBjb3Vyc2UsIEkgY2Fu
J3QgdXNlIG90aGVyIFggYXBwbGljYXRpb25zIGF0CnRoZSBzYW1lIHRpbWUsIHNvIHRoaXMgaXMg
YW4gYW5ub3lpbmcgd29ya2Fyb3VuZC4KCkkgbW9zdGx5IHJ1biB0aGUgcmVndWxhciBEZWJpYW4g
QnVzdGVyIGtlcm5lbCBidXQgSSBoYXZlIGhhZCB0aGlzIGZyZWV6ZSBvY2N1cgp3aXRoIG90aGVy
IHNlbGYtY29tcGlsZWQga2VybmVscyBvZiB2YXJpb3VzIHZlcnNpb25zIChuZXdlciB0aGFuIHRo
ZSBEZWJpYW4Ka2VybmVsLCB3aXRob3V0IERlYmlhbiBwYXRjaGVzKS4gIEkgYWxzbyBoYWQgdGhl
IGZyZWV6ZSB3aXRoIGJvdGggYW1kZ3B1LmRjPTEKKGRlZmF1bHQpIGFuZCBhbWRncHUuZGM9MCBv
cHRpb25zLgoKJCB1bmFtZSAtYQpMaW51eCBlaXNrYWZmZWUgNC4xOS4wLTUtYW1kNjQgIzEgU01Q
IERlYmlhbiA0LjE5LjM3LTMgKDIwMTktMDUtMTUpIHg4Nl82NApHTlUvTGludXgKCiQgYXB0LWNh
Y2hlIHBvbGljeSBsaW51eC1pbWFnZS00LjE5LjAtNS1hbWQ2NApsaW51eC1pbWFnZS00LjE5LjAt
NS1hbWQ2NDoKICBJbnN0YWxsZWQ6IDQuMTkuMzctMwogIENhbmRpZGF0ZTogNC4xOS4zNy0zCiAg
VmVyc2lvbiB0YWJsZToKICoqKiA0LjE5LjM3LTMgOTkwCiAgICAgICAgOTkwIGh0dHA6Ly9mdHAu
dWsuZGViaWFuLm9yZy9kZWJpYW4gYnVzdGVyL21haW4gYW1kNjQgUGFja2FnZXMKICAgICAgICA1
MDAgaHR0cDovL2Z0cC51ay5kZWJpYW4ub3JnL2RlYmlhbiB1bnN0YWJsZS9tYWluIGFtZDY0IFBh
Y2thZ2VzCiAgICAgICAgMTAwIC92YXIvbGliL2Rwa2cvc3RhdHVzCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
