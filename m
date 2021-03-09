Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1B332FD1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 21:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136ED6E95E;
	Tue,  9 Mar 2021 20:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754B26E95E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 20:24:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AA81C6522B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615321459;
 bh=odlGM4iHp0Ku/kB8SV6e+EajLYL6EpkZNz6phUryXUk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p8qkSN0/24DTAj6tUc2pbTS3zhgnodiawKuJ/NO67RmF9XlvNtktR3agR2aBpEA01
 cQe8DaX+2mfE9KnXRO1SR3pHE8o/U9VEIleW0Tjsmn8VCHdzkbcYLa9OhN/2LW/x4B
 RXp+t/rlJOCNkp8lasroHAq1ef7VLhwJ/ZU7gtEpTAgLsNau+qnYJgTUdYdFhY5CoK
 0fKGTiCx0qL6Jmdc3s/zpaXgl5C5gWtn+r/xkOM/0OZY66+ZSyQTYraoPVt4WKTVnF
 VodYx+vX60KqbmNGjdRi1Gs2prTpmjn17qQgI20Mh0J1arHccl+HfzTX1d3Uqi9RGn
 5IEg64AQTosdQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9BFE66537C; Tue,  9 Mar 2021 20:24:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Tue, 09 Mar 2021 20:24:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-mS6pvQiZss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCi0tLSBD
b21tZW50ICM4IGZyb20gTWFydGluIChtYXJ0aW4udGtAZ214LmNvbSkgLS0tCihJbiByZXBseSB0
byBEaWV0ZXIgTsO8dHplbCBmcm9tIGNvbW1lbnQgIzcpCj4gQWRkZW5kdW0gKEBBbGV4KQo+IE1h
eWJlIHdlIGNvdWxkIGRvIHNvbWV0aW5nIGFib3V0IHRoZSByZXBvcnRlZCBmYW4gc3BlZWQuCj4g
WmVybyAoMCkgaWYgc3RvcHBlZC4KPiAKPiBATWFydGluCj4gWW91IGNhbiB2ZXJpZnkgdGhlIGZh
biBzcGVlZCAocmFpc2UpIGlmIHlvdSBwdXQgbG9hZCBvbiB5b3VyIGdmeCBjYXJkLgoKSSd2ZSBq
dXN0IHJlYm9vdGVkIGludG8gNS4xMS41LiBUaGUgZ3B1IGZhbiB3ZW50IGludG8gbWF4IHNwZWVk
IGZvciBvbmUgc2Vjb25kCm9yIHNvLiBBZnRlciB0aGUgY29tcHV0ZXIgZmluaXNoZWQgYm9vdGlu
ZyBzZW5zb3JzIHN0aWxsIHNob3dlZCBvdmVyIDMwMDBycG0sCmV2ZW4gdGhvdWdoIGF0IHRoYXQg
cG9pbnQgdGhlIGZhbiB3YXMgYWxyZWFkeSBvZmY6CgphbWRncHUtcGNpLTAxMDAKQWRhcHRlcjog
UENJIGFkYXB0ZXIKdmRkZ2Z4OiAgICAgIDgyNS4wMCBtVgpmYW4xOiAgICAgICAgMzYwMSBSUE0g
IChtaW4gPSAgICAwIFJQTSwgbWF4ID0gMzUwMCBSUE0pCmVkZ2U6ICAgICAgICAgKzQ3LjDCsEMg
IChjcml0ID0gKzk3LjDCsEMsIGh5c3QgPSAtMjczLjHCsEMpCnBvd2VyMTogICAgICAgIDcuMTUg
VyAgKGNhcCA9ICAzNi4wMCBXKQoKSSB3YWl0ZWQgYSBjb3VwbGUgb2YgbWludXRlcyBhbmQgdGhl
biB3YXRjaGVkIDRrIHZpZC4gVGhlIGZhbiB0dXJuZWQgb24gYW5kCnNlbnNvcnMgc3RhcnRlZCBz
aG93aW5nIHRoaXM6CgphbWRncHUtcGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIKdmRkZ2Z4
OiAgICAgIDk2Mi4wMCBtVgpmYW4xOiAgICAgICAgMTAwNCBSUE0gIChtaW4gPSAgICAwIFJQTSwg
bWF4ID0gMzUwMCBSUE0pCmVkZ2U6ICAgICAgICAgKzU3LjDCsEMgIChjcml0ID0gKzk3LjDCsEMs
IGh5c3QgPSAtMjczLjHCsEMpCnBvd2VyMTogICAgICAgMTIuMDMgVyAgKGNhcCA9ICAzNi4wMCBX
KQoKClNvIHRoZXJlIGlzIGEgY2hhbmdlIGluIHJlcG9ydGVkIGZhbiBzcGVlZC4gQWZ0ZXIgdHVy
bmluZyBvZiB0aGUgdmlkZW8gdGhlIGZhbgp0dXJuZWQgb2ZmIGFnYWluIGJ1dCB0aGUgcmVwb3J0
ZWQgZmFuIHNwZWVkIHN0YXllZCBhdCByb3VnaGx5IDkwMCBSUE0uCgpJIHBsYXllZCBhIGJpdCBv
ZiBYb25vdGljLiBBZ2FpbiwgZmFuIHR1cm5lZCBvbiBidXQgdGhlIHJlcG9ydGVkIGZhbiBzcGVl
ZApyZW1haW5lZCByb3VnaGx5IHRoZSBzYW1lLCBhcm91bmQgOTAwIFJQTS4KCkkgaGF2ZSBubyB3
YXkgb2YgbWVhc3VyaW5nIHRoZSBhY3R1YWwgZmFuIHNwZWVkIHdoaWxlIHBsYXlpbmcgYSBnYW1l
IG9yCndhdGNoaW5nIGEgdmlkZW8gc28gSSBkb24ndCBrbm93IGlmIHdoYXQgc2Vuc29ycyBhcmUg
cmVwb3J0aW5nIGlzIGFjY3VyYXRlLgoKc2Vuc29ycyAtLXZlcnNpb24gb3V0cHV0cyB0aGUgZm9s
bG93aW5nOgoKc2Vuc29ycyB2ZXJzaW9uIDMuNi4wIHdpdGggbGlic2Vuc29ycyB2ZXJzaW9uIDMu
Ni4wCgpGb3IgdGhlIENQVSBmYW4gc3BlZWQgaXQgZG9lcyBzZWVtIHRvIHJlcG9ydCB0aGUgYWN0
dWFsIHNwZWVkLiBJJ3ZlIHJlY2VudGx5CnN3aXRjaGVkIHRvIGEgbmV3IENQVSBjb29sZXIgd2l0
aCBhIG5ldyBmYW4gYW5kIGJvdGggdGhpcyBuZXcgb25lIGFuZCB0aGUgb2xkCm9uZSB3ZXJlIHJl
cG9ydGluZyBzcGVlZCBjaGFuZ2UgdGhhdCBjb3JyZXNwb25kZWQgdG8gYWN0dWFsIGNwdSBmYW4g
c3BlZWQuIFRoZQpvbGQgY29vbGVyIGhhZCBtYW51YWwgZmFuIGNvbnRyb2wgc28gSSBjb3VsZCBz
ZWUgdGhlIHJlcG9ydGVkIHNwZWVkIGNoYW5nZQpsaXZlLgoKCgpwcy4gSSdtIGluIFVUQysxIGFu
ZCBJIHByb2JhYmx5IHdvbid0IGJlIGFibGUgdG8gcG9zdCBtb3JlIHRvbmlnaHQuCgotLSAKWW91
IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2Yg
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
