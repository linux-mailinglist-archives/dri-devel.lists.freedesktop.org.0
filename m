Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436993493B4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 15:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802116ED7E;
	Thu, 25 Mar 2021 14:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3204A6ED7E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:09:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ED9E061A23
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616681390;
 bh=Sg/UKZe2+GTzbiduQrJxVqnnYtdg/UDTW6Xm1fY7YJM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j4yhVg7Ghl0NT2r/G2U1W2NsfvylGfTCuBJII5/InSZ2pcemk+eBRrI2KL/FhcT1y
 apWbDjCaMZgRiPHC+9PnJFtJifnRwvDq/j0Af1NwkQrQm/TwfbWBhGnOU1NB2cqYNw
 zR/1lEWbnGo1IO7ersCGrpyZdLcHxEZ2R8v+0xft7zM7Q469q1EkKow5Ipy61oxCze
 Xy5IY8pXGPG9d6WVdvBWGEMZ8xzAhFeYWbGpWL6/USxjuD2Og0XAv71yMdnQXzZ+x3
 u/zG8lQ2UQenaSEFwdNoi+a/8YZFr3hgxS6pVApDusePzHX9550sV60yF+rOnkdDiU
 3Tv15RPIffyLA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E976E62AC4; Thu, 25 Mar 2021 14:09:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212427] [AMDGPU] Multiple ttm_bo_release warnings
Date: Thu, 25 Mar 2021 14:09:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212427-2300-fz6OY8WCN3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212427-2300@https.bugzilla.kernel.org/>
References: <bug-212427-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTI0MjcKCi0tLSBD
b21tZW50ICMzIGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQpS
ZXZlcnRlZCBpbiBzdGFibGU6Cgpjb21taXQgYmVjNzcxYjVlMDkwMWY0YjBiYzg2MWJjYjU4MDU2
ZGU1MTUxYWUzYQpBdXRob3I6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CkRhdGU6ICAgVGh1IE1hciAyNSAwOTo1Mjo0MCAyMDIxICswMTAwCgogICAgUmV2
ZXJ0ICJkcm0vdHRtOiBXYXJuIG9uIHBpbm5pbmcgd2l0aG91dCBob2xkaW5nIGEgcmVmZXJlbmNl
IgoKICAgIFRoaXMgcmV2ZXJ0cyBjb21taXQgN2QwOWU5NzI1YjVkY2M4ZDE0ZTEwMWRlOTMxZTQ5
NjlkMDMzYTZhZCB3aGljaCBpcwogICAgY29tbWl0IDU3ZmNkNTUwZWIxNWJjZTE0YTcxNTQ3MzYz
NzlkZmQ0ZWQ2MGFlODEgdXBzdHJlYW0uCgogICAgSXQgaXMgY2F1c2luZyB0b28gbWFueSB3YXJu
aW5ncyBvbiA1LjExLnksIHNvIHNob3VsZCBiZSBkcm9wcGVkIGZvciBub3cuCgogICAgQ2M6IEh1
YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CiAgICBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgogICAgQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgogICAgQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KICAgIENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgogICAgQ2M6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KICAgIFJlcG9ydGVkLWJ5OiBPbGVrc2FuZHIg
TmF0YWxlbmtvIDxvbGVrc2FuZHJAbmF0YWxlbmtvLm5hbWU+CiAgICBMaW5rOgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzhjM2RhOGJjLTBiZjMtNDk2Zi0xZmQ2LTRmNjVhMDdiMmQxM0BhbWQu
Y29tCiAgICBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgoKLS0gCllvdSBtYXkgcmVwbHkgdG8gdGhpcyBlbWFpbCB0byBhZGQgYSBj
b21tZW50LgoKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0
Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
