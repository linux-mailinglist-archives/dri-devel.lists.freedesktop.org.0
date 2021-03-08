Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225643309E2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357646E82E;
	Mon,  8 Mar 2021 09:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF306E82E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:04:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D9C3965134
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615194257;
 bh=6TKTgQ7Ym8wYOJ1PptHc2XqUMz1ZYhb3Q5uLb2nowXM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tuNQMb2naAr14GzbPR/pTMYyxmXSVil4HI5Ga+LtddK0dJIZfBQaOedK/PDd3IUqi
 zoyXa4mLAXhjny6+kfj0Dhcp9Sl5eeveeNWo5hyED4cUpVArOSiCvAh8L7yGtUbjR1
 mdHAHGV4KQ8Yg0b6z3LSuacOwaajVgNNZirtP1gVm7Be3OU/Q7eUIefVu/xkYmuN/1
 561Gg68ev06+HYG90Hlk7TMVSOgNdYmrp2z7rnyUMUwEQtclOQbCLps6+S7YOgxvxd
 vv2KS4whKpaS+7sFlbqmBhbwE858TFZrbj0kb8EcLxdtIVUJGFUAzvel5BWjigVxuB
 Zu4RK3RnMQdNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D086565353; Mon,  8 Mar 2021 09:04:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Mon, 08 Mar 2021 09:04:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212107-2300-X0NpYnOuqW@https.bugzilla.kernel.org/>
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
b21tZW50ICMzIGZyb20gTWFydGluIChtYXJ0aW4udGtAZ214LmNvbSkgLS0tCihJbiByZXBseSB0
byBEaWV0ZXIgTsO8dHplbCBmcm9tIGNvbW1lbnQgIzIpCj4gSXQgY291bGQgYmUgdGhlIFplcm9D
b3JlIHRoaW5nLCB3aGljaCBoYXMgZmluYWxseSBsYW5kZWQgd2l0aCA1LjExLgo+IFBsZWFzZSB2
ZXJpZnksIHRoYXQgeW91ciBnZnggZmFucyBzdG9wcGVkIHdpdGggNS4xMSBhbmQgcnVubmluZyB3
aXRoIGFsbAo+IGtlcm5lbHMgYmVsb3cgNS4xMS4KCkJsb29keSBoZWxsLCB5b3UncmUgcmlnaHQu
IE9uIDUuMTEuNCB0aGUgZmFuIG9uIGdwdSBzdG9wcyBjb21wbGV0ZWx5LCBldmVuCnRob3VnaCBz
ZW5zb3JzIGNsYWltIGl0J3Mgc3Bpbm5pbmcuCgpJIHN1cHBvc2UgSSdtIGx1Y2t5IEkgZGlkbid0
IGZyeSBteSBncHUgLl8uCgpIb3cgaXMgdGhhdCBldmVuIHBvc3NpYmxlPwoKLS0gCllvdSBtYXkg
cmVwbHkgdG8gdGhpcyBlbWFpbCB0byBhZGQgYSBjb21tZW50LgoKWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
