Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849815E285
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602F86FB32;
	Fri, 14 Feb 2020 16:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB716FB30;
 Fri, 14 Feb 2020 16:24:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BF562477F;
 Fri, 14 Feb 2020 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697446;
 bh=BdlkV4m/ydm7xhD5IRtDvesmAsLhifXiarptBB8b99Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fk2T9VxLMoYU71g9xMGZA2qdh3cU6srIeCWmEgewKW9ZgzSv0pWnz6M1EQQBXlj28
 YJAvWlVyEiJuIF1U0R5eu73+Bzsc4F/9PcXExDLMByKilj/Ob4XtGrIhnL33Oxca5M
 qX3nfQhr+sdGfZVCCrFuu3JB3m5pNV7kvZTwJE/4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 131/141] radeon: insert 10ms sleep in
 dce5_crtc_load_lut
Date: Fri, 14 Feb 2020 11:21:11 -0500
Message-Id: <20200214162122.19794-131-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClsgVXBzdHJlYW0g
Y29tbWl0IGVjM2Q2NTA4MmQ3ZGFiYWQ2ZmE4ZjY2YThlZjE2NmYyZDUyMmQ2YjIgXQoKUGVyIGF0
IGxlYXN0IG9uZSB0ZXN0ZXIgdGhpcyBpcyBlbm91Z2ggbWFnaWMgdG8gcmVjb3ZlciB0aGUgcmVn
cmVzc2lvbgppbnRyb2R1Y2VkIGZvciBzb21lIHBlb3BsZSAoYnV0IG5vdCBhbGwpIGluCgpjb21t
aXQgYjhlMmIwMTk5Y2MzNzc2MTdkYzIzOGY1MTA2MzUyYzA2ZGNkM2ZhMgpBdXRob3I6IFBldGVy
IFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkRhdGU6ICAgVHVlIEp1bCA0IDEyOjM2OjU3IDIwMTcg
KzAyMDAKCiAgICBkcm0vZmItaGVscGVyOiBmYWN0b3Igb3V0IHBzZXVkby1wYWxldHRlCgp3aGlj
aCBmb3IgcmFkZW9uIGhhZCB0aGUgc2lkZS1lZmZlY3Qgb2YgcmVmYWN0b3Jpbmcgb3V0IGEgc2Vl
bWluZ2x5CnJlZHVkYW50IHdyaXRpbmcgb2YgdGhlIGNvbG9yIHBhbGV0dGUuCgoxMG1zIGluIGEg
ZmFpcmx5IHNsb3cgbW9kZXNldCBwYXRoIGZlZWxzIGxpa2UgYW4gYWNjZXB0YWJsZSBmb3JtIG9m
CmR1Y3QtdGFwZSwgc28gbWF5YmUgd29ydGggYSBzaG90IGFuZCBzZWUgd2hhdCBzdGlja3MuCgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogTWljaGVsIETD
pG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+ClJlZmVyZW5jZXM6IGh0dHBzOi8vYnVnemls
bGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4MTIzClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCmluZGV4IDU5ZDYyMjc1YTY1OWQuLmM4
ODIwY2Q4OTNkNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKQEAg
LTExMCw2ICsxMTAsOCBAQCBzdGF0aWMgdm9pZCBkY2U1X2NydGNfbG9hZF9sdXQoc3RydWN0IGRy
bV9jcnRjICpjcnRjKQogCiAJRFJNX0RFQlVHX0tNUygiJWRcbiIsIHJhZGVvbl9jcnRjLT5jcnRj
X2lkKTsKIAorCW1zbGVlcCgxMCk7CisKIAlXUkVHMzIoTklfSU5QVVRfQ1NDX0NPTlRST0wgKyBy
YWRlb25fY3J0Yy0+Y3J0Y19vZmZzZXQsCiAJICAgICAgIChOSV9JTlBVVF9DU0NfR1JQSF9NT0RF
KE5JX0lOUFVUX0NTQ19CWVBBU1MpIHwKIAkJTklfSU5QVVRfQ1NDX09WTF9NT0RFKE5JX0lOUFVU
X0NTQ19CWVBBU1MpKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
