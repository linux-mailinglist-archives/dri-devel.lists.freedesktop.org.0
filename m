Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713976D9D5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660796E4D2;
	Fri, 19 Jul 2019 03:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7D66E4D6;
 Fri, 19 Jul 2019 03:58:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2139421851;
 Fri, 19 Jul 2019 03:58:44 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 053/171] drm/amd/display: Update link rate from
 DPCD 10
Date: Thu, 18 Jul 2019 23:54:44 -0400
Message-Id: <20190719035643.14300-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508725;
 bh=TI0TPOQn5WRhgeZCy07aXRVhI2CGOzL2HZJKi35gJgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vFaxJwwb7fXtwQHwdbk1B6i3tWGP5Afa1MJCq/IEIXTKl73lltp9GZVCX41j1q+Up
 SPL8rlnJyOWJ2p81DjPoNdWFXyXeDqVS9QMTTO6pK+OTtSVKXt0Kti1Km+HmJ48TsC
 jSNNiAcwrfGyJRGnsMi6O+wr/YW9hf9fyBtcFZoM=
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
Cc: Sasha Levin <sashal@kernel.org>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDUzYzgxZmM3ODc1YmMyZGNhMzU4NDg1ZGFjMzk5OWUxNGVjOTFhMDAgXQoKW1dI
WV0KU29tZSBwYW5lbHMgcmV0dXJuIGEgbGluayByYXRlIG9mIDAgKHVua25vd24pIGluIERQQ0Qg
MC4gSW4gdGhpcyBjYXNlLAphbiBhcHByb3ByaWF0ZSBtb2RlIGNhbm5vdCBiZSBzZXQsIGFuZCBj
ZXJ0YWluIHBhbmVscyB3aWxsIHNob3cKY29ycnVwdGlvbiBhcyB0aGV5IGFyZSBmb3JjZWQgdG8g
dXNlIGEgbW9kZSB0aGV5IGRvIG5vdCBzdXBwb3J0LgoKW0hPV10KUmVhZCBEUENEIDEwIGluIHRo
ZSBjYXNlIHdoZXJlIHN1cHBvcnRlZCBsaW5rIHJhdGUgZnJvbSBEUENEIDAgaXMKdW5rbm93biwg
YW5kIHBhc3MgdGhhdCB2YWx1ZSBvbiB0byB0aGUgcmVwb3J0ZWQgbGluayByYXRlLgpUaGlzIHJl
LWludHJvZHVjZXMgYmVoYXZpb3VyIHByZXNlbnQgaW4gcHJldmlvdXMgdmVyc2lvbnMgdGhhdCBh
cHBlYXJzCnRvIGhhdmUgYmVlbiBhY2NpZGVudGFsbHkgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6
IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNoYWxtZXJzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBB
bnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExh
a2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rX2RwLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rX2RwLmMKaW5kZXggMWVlNTQ0YTMyZWJiLi4yNTMzMTE4NjRjZGQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2Rw
LmMKQEAgLTE2MjQsOCArMTYyNCw3IEBAIHN0YXRpYyBib29sIGRlY2lkZV9lZHBfbGlua19zZXR0
aW5ncyhzdHJ1Y3QgZGNfbGluayAqbGluaywgc3RydWN0IGRjX2xpbmtfc2V0dGluCiAJdWludDMy
X3QgbGlua19idzsKIAogCWlmIChsaW5rLT5kcGNkX2NhcHMuZHBjZF9yZXYucmF3IDwgRFBDRF9S
RVZfMTQgfHwKLQkJCWxpbmstPmRwY2RfY2Fwcy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291
bnQgPT0gMCB8fAotCQkJbGluay0+ZGMtPmNvbmZpZy5vcHRpbWl6ZV9lZHBfbGlua19yYXRlID09
IGZhbHNlKSB7CisJCQlsaW5rLT5kcGNkX2NhcHMuZWRwX3N1cHBvcnRlZF9saW5rX3JhdGVzX2Nv
dW50ID09IDApIHsKIAkJKmxpbmtfc2V0dGluZyA9IGxpbmstPnZlcmlmaWVkX2xpbmtfY2FwOwog
CQlyZXR1cm4gdHJ1ZTsKIAl9CkBAIC0yNTk3LDcgKzI1OTYsOCBAQCB2b2lkIGRldGVjdF9lZHBf
c2lua19jYXBzKHN0cnVjdCBkY19saW5rICpsaW5rKQogCW1lbXNldChzdXBwb3J0ZWRfbGlua19y
YXRlcywgMCwgc2l6ZW9mKHN1cHBvcnRlZF9saW5rX3JhdGVzKSk7CiAKIAlpZiAobGluay0+ZHBj
ZF9jYXBzLmRwY2RfcmV2LnJhdyA+PSBEUENEX1JFVl8xNCAmJgotCQkJbGluay0+ZGMtPmNvbmZp
Zy5vcHRpbWl6ZV9lZHBfbGlua19yYXRlKSB7CisJCQkobGluay0+ZGMtPmNvbmZpZy5vcHRpbWl6
ZV9lZHBfbGlua19yYXRlIHx8CisJCQlsaW5rLT5yZXBvcnRlZF9saW5rX2NhcC5saW5rX3JhdGUg
PT0gTElOS19SQVRFX1VOS05PV04pKSB7CiAJCS8vIFJlYWQgRFBDRCAwMDAxMGggLSAwMDAxRmgg
MTYgYnl0ZXMgYXQgb25lIHNob3QKIAkJY29yZV9saW5rX3JlYWRfZHBjZChsaW5rLCBEUF9TVVBQ
T1JURURfTElOS19SQVRFUywKIAkJCQkJCQlzdXBwb3J0ZWRfbGlua19yYXRlcywgc2l6ZW9mKHN1
cHBvcnRlZF9saW5rX3JhdGVzKSk7CkBAIC0yNjEyLDYgKzI2MTIsOSBAQCB2b2lkIGRldGVjdF9l
ZHBfc2lua19jYXBzKHN0cnVjdCBkY19saW5rICpsaW5rKQogCQkJCWxpbmtfcmF0ZSA9IGxpbmtS
YXRlSW5LSHpUb0xpbmtSYXRlTXVsdGlwbGllcihsaW5rX3JhdGVfaW5fa2h6KTsKIAkJCQlsaW5r
LT5kcGNkX2NhcHMuZWRwX3N1cHBvcnRlZF9saW5rX3JhdGVzW2xpbmstPmRwY2RfY2Fwcy5lZHBf
c3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291bnRdID0gbGlua19yYXRlOwogCQkJCWxpbmstPmRwY2Rf
Y2Fwcy5lZHBfc3VwcG9ydGVkX2xpbmtfcmF0ZXNfY291bnQrKzsKKworCQkJCWlmIChsaW5rLT5y
ZXBvcnRlZF9saW5rX2NhcC5saW5rX3JhdGUgPCBsaW5rX3JhdGUpCisJCQkJCWxpbmstPnJlcG9y
dGVkX2xpbmtfY2FwLmxpbmtfcmF0ZSA9IGxpbmtfcmF0ZTsKIAkJCX0KIAkJfQogCX0KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
