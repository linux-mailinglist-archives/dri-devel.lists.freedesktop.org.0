Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CBBBB602
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E7189A1A;
	Mon, 23 Sep 2019 13:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E484C899D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:59:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204965] New: [amdgpu]] *ERROR* ring gfx test failed (-110) upon
 wake from sleep, no video or frozen video
Date: Mon, 23 Sep 2019 13:59:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dav.per@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204965-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5NjUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0OTY1CiAgICAgICAgICAgU3VtbWFyeTogW2FtZGdwdV1dICpFUlJP
UiogcmluZyBnZnggdGVzdCBmYWlsZWQgKC0xMTApIHVwb24KICAgICAgICAgICAgICAgICAgICB3
YWtlIGZyb20gc2xlZXAsIG5vIHZpZGVvIG9yIGZyb3plbiB2aWRlbwogICAgICAgICAgIFByb2R1
Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1
LjIuMTMtMTI2LmN1cnJlbnQKICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAgICAgICAg
IE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1
czogTkVXCiAgICAgICAgICBTZXZlcml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEK
ICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3Np
Z25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJl
cG9ydGVyOiBkYXYucGVyQGdteC5jb20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBh
dHRhY2htZW50IDI4NTExNQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNo
bWVudC5jZ2k/aWQ9Mjg1MTE1JmFjdGlvbj1lZGl0CmpvdXJuYWxjdGwgYml0cwoKU29sdXMgNCwg
aXNzdWUgaGFzIGJlZW4gcHJlc2VudCBzaW5jZSBhbiBBTUQgY2FyZCAoUlg1ODAgNEdCKSB3YXMg
aW5zdGFsbGVkIGluCnRoaXMgbWFjaGluZSBpbiBqdWx5IGFuZCBoYXMgaGFwcGVuZWQgbmluZSB0
aW1lcy4KClRoZSBtYWNoaW5lLCBhc2xlZXAsIHdha2VzIHVwLCBmYW5zIGFuZCBMRURzIGNvbWUg
b24sIGJ1dCB0aGVyZSBpcyBlaXRoZXIgbm8KdmlkZW8gc2lnbmFsIG91dCBvciB0aGVyZSBpcyBh
IHNpZ25hbCBzaG93aW5nIG9ubHkgYSBmcm96ZW4gc2NyZWVuIG9mIGEgY2xvY2sKd2hlbiB0aGUg
bWFjaGluZSBmZWxsIGFzbGVlcC4gTm8ga2V5Ym9hcmQgaW5wdXQgaGFzIGFuIGVmZmVjdC4KVGhl
IG1hY2hpbmUgc3RpbGwgcmVzcG9uZHMgdG8gcGluZ3Mgb3ZlciB0aGUgbmV0d29yay4gRFZJIG9y
IERQIGludGVyZmFjZSBtYWtlcwpubyBkaWZmZXJlbmNlLgoKClJhZGVvbiBSWCA1ODAgU2VyaWVz
IChQT0xBUklTMTAgRFJNIDMuMzIuMCA1LjIuMTMtMTI2LmN1cnJlbnQgTExWTSA4LjAuMSkgdjoK
NC41IE1lc2EgMTkuMS42ICBvbiBaMTcwLUhEMyBtYWluYm9hcmQsIGk3IDY3MDAgQ1BVLgoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
