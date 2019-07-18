Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCD6D6E4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 00:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD736E47A;
	Thu, 18 Jul 2019 22:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ECB6E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 22:49:03 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C339628746
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 22:49:01 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B5593288B2; Thu, 18 Jul 2019 22:49:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204227] New: Visual artefacts and crash from suspend on amdgpu
Date: Thu, 18 Jul 2019 22:49:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dolohow@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204227-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyMjcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MjI3CiAgICAgICAgICAgU3VtbWFyeTogVmlzdWFsIGFydGVmYWN0
cyBhbmQgY3Jhc2ggZnJvbSBzdXNwZW5kIG9uIGFtZGdwdQogICAgICAgICAgIFByb2R1Y3Q6IERy
aXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjIuMQog
ICAgICAgICAgSGFyZHdhcmU6IHg4Ni02NAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAg
ICAgICAgICAgVHJlZTogTWFpbmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAg
IFNldmVyaXR5OiBoaWdoCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50
OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRl
by1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBkb2xvaG93QG91
dGxvb2suY29tCiAgICAgICAgUmVncmVzc2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVudCAyODM4
MjMKICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4
MzgyMyZhY3Rpb249ZWRpdApkbWVzZwoKQWZ0ZXIgdXBncmFkaW5nIGtlcm5lbCBmcm9tIDUuMS4x
NCB0byA1LjIuMSBJIGVuY291bnRlcmVkIG1hbnkgYXJ0aWZhY3RzIGR1cmluZwpkZXNrdG9wIHNl
c3Npb24uICBBbHNvIHdoZW4gZ29pbmcgZnJvbSBzdXNwZW5kIHN0YXRlLCBleHRlcm5hbCBtb25p
dG9yIGlzIGdyZWVuCmFuZCBrZXJuZWwgY3Jhc2hlcy4gIFNlZSBkbWVzZwoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
