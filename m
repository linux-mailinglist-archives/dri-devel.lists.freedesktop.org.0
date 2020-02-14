Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7415DC10
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B065D6F9AB;
	Fri, 14 Feb 2020 15:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010C66F99E;
 Fri, 14 Feb 2020 15:52:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9E62465D;
 Fri, 14 Feb 2020 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695529;
 bh=AUo48LgyP8RWnDvSGBmcafXJf9lcho+MKL72AlZgYbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ueRx3/bJqCzz8uvcAFi90fkiFjd1IiZOKvH3MiUOPdPEh8Amip0Drui1Ugw22/kAS
 1ylqe898Ne1m8+Pe2pLPiqQJb5ks+JXPBTKs9MJZEzx4S4joIZye3T4FFT91dMUpi0
 Mz/g7gFxH1O5RSqK60W6k0UTbLiZXvswXPB2Pqus=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 150/542] drm/amd/powerplay: remove set but not
 used variable 'us_mvdd'
Date: Fri, 14 Feb 2020 10:42:22 -0500
Message-Id: <20200214154854.6746-150-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgNDcy
YjM2YTJhYjY3ODgwZTg5ZDZiMGNkMGUyNDM4MzBlOGNiNzVlMSBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6IEluCmZ1bmN0aW9uIOKAmHZlZ2FtX3BvcHVsYXRl
X3NtY19hY3BpX2xldmVs4oCZOgpkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Iv
dmVnYW1fc211bWdyLmM6MTExNzoxMToKd2FybmluZzogdmFyaWFibGUgJ3VzX212ZGQnIHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBuZXZlciB1c2Vk
LCBzbyBjYW4gYmUgcmVtb3ZlZC4KCkZpeGVzOiBhYzc4MjJiMDAyNmYgKCJkcm0vYW1kL3Bvd2Vy
cGxheTogYWRkIHNtdW1nciBzdXBwb3J0IGZvciBWRUdBTSAodjIpIikKU2lnbmVkLW9mZi1ieTog
eXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvdmVnYW1fc211bWdyLmMgfCAxMiAtLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVtZ3IvdmVnYW1fc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvdmVnYW1fc211bWdyLmMKaW5kZXggYWUxOGZiY2IyNmZiMS4uMjA2OGViMDBkMmY4ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1n
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVt
Z3IuYwpAQCAtMTExNCw3ICsxMTE0LDYgQEAgc3RhdGljIGludCB2ZWdhbV9wb3B1bGF0ZV9zbWNf
YWNwaV9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQkJKHN0cnVjdCBwaG1fcHB0X3Yx
X2luZm9ybWF0aW9uICopKGh3bWdyLT5wcHRhYmxlKTsKIAlTTUlPX1BhdHRlcm4gdm9sX2xldmVs
OwogCXVpbnQzMl90IG12ZGQ7Ci0JdWludDE2X3QgdXNfbXZkZDsKIAogCXRhYmxlLT5BQ1BJTGV2
ZWwuRmxhZ3MgJj0gflBQU01DX1NXU1RBVEVfRkxBR19EQzsKIApAQCAtMTE2OCwxNyArMTE2Nyw2
IEBAIHN0YXRpYyBpbnQgdmVnYW1fcG9wdWxhdGVfc21jX2FjcGlfbGV2ZWwoc3RydWN0IHBwX2h3
bWdyICpod21nciwKIAkJCSJpbiBDbG9jayBEZXBlbmRlbmN5IFRhYmxlIiwKIAkJCSk7CiAKLQl1
c19tdmRkID0gMDsKLQlpZiAoKFNNVTdfVk9MVEFHRV9DT05UUk9MX05PTkUgPT0gZGF0YS0+bXZk
ZF9jb250cm9sKSB8fAotCQkJKGRhdGEtPm1jbGtfZHBtX2tleV9kaXNhYmxlZCkpCi0JCXVzX212
ZGQgPSBkYXRhLT52Ymlvc19ib290X3N0YXRlLm12ZGRfYm9vdHVwX3ZhbHVlOwotCWVsc2Ugewot
CQlpZiAoIXZlZ2FtX3BvcHVsYXRlX212ZGRfdmFsdWUoaHdtZ3IsCi0JCQkJZGF0YS0+ZHBtX3Rh
YmxlLm1jbGtfdGFibGUuZHBtX2xldmVsc1swXS52YWx1ZSwKLQkJCQkmdm9sX2xldmVsKSkKLQkJ
CXVzX212ZGQgPSB2b2xfbGV2ZWwuVm9sdGFnZTsKLQl9Ci0KIAlpZiAoIXZlZ2FtX3BvcHVsYXRl
X212ZGRfdmFsdWUoaHdtZ3IsIDAsICZ2b2xfbGV2ZWwpKQogCQl0YWJsZS0+TWVtb3J5QUNQSUxl
dmVsLk1pbk12ZGQgPSBQUF9IT1NUX1RPX1NNQ19VTCh2b2xfbGV2ZWwuVm9sdGFnZSk7CiAJZWxz
ZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
