Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87BF33E33C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 01:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41AB6E479;
	Wed, 17 Mar 2021 00:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7F36E479
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 00:56:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5C5964FE8;
 Wed, 17 Mar 2021 00:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942595;
 bh=u1IcUxAsnR0p8HYknTE2bkyfOLNMwcdfcfjLCaR9rV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgW5YsKyqD9Va8mSYtWNUB6AwWLmiVdNyrm1Q7Dmn/JzA/gyBlaZWu/VnHDoPdnts
 AQjojU1Civsr0wCbtS1Cr4kOe3TGyg0ZwQuavd4/IICxq/xc/cOuH1i8PuyWNay0Vc
 12F55E51bnhmyGqQslPqHNztWDX6UTIO0ULYQvR//kgkAM3okoyr7uNOuPAqWDC8IR
 7Ee8ENESZMeqMKEPMLvBBIM1CL/vCcp4aEYv4z+BDqZrIezS++xUFhyJU6Cpc+GHVZ
 BVk//VLHPWnYX4FkG3G6cq/G6aLdtcC5JaqX3Ytx0S58mv8FddKjqtVL2jxBvjfD6I
 KPsIVkLLY5+XQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 48/61] drm/radeon: fix AGP dependency
Date: Tue, 16 Mar 2021 20:55:22 -0400
Message-Id: <20210317005536.724046-48-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005536.724046-1-sashal@kernel.org>
References: <20210317005536.724046-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgY2JhMmFmYjY1Y2IwNWMzZDE5N2QxNzMyM2ZlZTRlM2M5ZWRlZjljZCBdCgpX
aGVuIEFHUCBpcyBjb21waWxlZCBhcyBtb2R1bGUgcmFkZW9uIG11c3QgYmUgY29tcGlsZWQgYXMg
bW9kdWxlIGFzCndlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IGFmNmM2ZDIxNGQ5MS4uZjBjMGNjZGM4YTEwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZwpAQCAtMjMyLDYgKzIzMiw3IEBAIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2FybS9L
Y29uZmlnIgogY29uZmlnIERSTV9SQURFT04KIAl0cmlzdGF0ZSAiQVRJIFJhZGVvbiIKIAlkZXBl
bmRzIG9uIERSTSAmJiBQQ0kgJiYgTU1VCisJZGVwZW5kcyBvbiBBR1AgfHwgIUFHUAogCXNlbGVj
dCBGV19MT0FERVIKICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAgICAgICAgIHNlbGVj
dCBEUk1fVFRNCi0tIAoyLjMwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
