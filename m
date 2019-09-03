Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1EA6E31
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE11896D8;
	Tue,  3 Sep 2019 16:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E13A896B5;
 Tue,  3 Sep 2019 16:25:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19B0A2343A;
 Tue,  3 Sep 2019 16:25:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 23/23] drm/i915/icl: whitelist
 PS_(DEPTH|INVOCATION)_COUNT
Date: Tue,  3 Sep 2019 12:24:24 -0400
Message-Id: <20190903162424.6877-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527915;
 bh=YaelBjv9CrC3Jq0WoYTd+rflT0fewMxLIJgPOZWkLcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yThhcpjJ9ttmo1oTs1wt3c1R1/rgO50Rn6XiBjbSuPsRQNsefJ7r7grfFCqU/Uf2Q
 uAhnpQsOnf0ThglT40I+UYN58AItz17Y0XZfWvWaSIaZeB7x8tZSD6xrXYkropFo6D
 RRt7hPu+Wd4eT2Zb/wiZllOuZB/pTqhGafpgaWXk=
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
Cc: Sasha Levin <sashal@kernel.org>, Anuj Phogat <anuj.phogat@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgY2Y4ZjlhYTFlZGE3ZDkxNmJkMjNmNmI4YzIyNjQwNGRlYjExNjkw
YyBdCgpUaGUgc2FtZSB0ZXN0cyBmYWlsaW5nIG9uIENGTCsgcGxhdGZvcm1zIGFyZSBhbHNvIGZh
aWxpbmcgb24gSUNMLgpEb2N1bWVudGF0aW9uIGRvZXNuJ3QgbGlzdCB0aGUKV2FBbGxvd1BNRGVw
dGhBbmRJbnZvY2F0aW9uQ291bnRBY2Nlc3NGcm9tVU1EIHdvcmthcm91bmQgZm9yIElDTCBidXQK
YXBwbHlpbmcgaXQgZml4ZXMgdGhlIHNhbWUgdGVzdHMgYXMgQ0ZMLgoKdjI6IFVzZSBvbmx5IG9u
ZSB3aGl0ZWxpc3QgZW50cnkgKExpb25lbCkKClNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2Vy
bGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KVGVzdGVkLWJ5OiBBbnVqIFBob2dh
dCA8YW51ai5waG9nYXRAZ21haWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDY4
ODNlYWIyNzQ4MTogZHJtL2k5MTU6IFN1cHBvcnQgZmxhZ3MgaW4gd2hpdGxpc3QgV0FzCkNjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCkFja2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDYyODEyMDcyMC4yMTY4Mi00LWxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwu
Y29tCihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDNmZTAxMDdlNDVhYjM5NjM0MjQ5N2UwNmI4
OTI0Y2RkNDg1Y2RlM2IpClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jIHwgMTMgKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfd29ya2Fyb3VuZHMuYwppbmRleCBlZmVhNWExOGZhNmRiLi5lZGQ1N2E1ZTA0
OTVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMKQEAgLTExMDcs
NiArMTEwNywxOSBAQCBzdGF0aWMgdm9pZCBpY2xfd2hpdGVsaXN0X2J1aWxkKHN0cnVjdCBpbnRl
bF9lbmdpbmVfY3MgKmVuZ2luZSkKIAogCQkvKiBXYUVuYWJsZVN0YXRlQ2FjaGVSZWRpcmVjdFRv
Q1M6aWNsICovCiAJCXdoaXRlbGlzdF9yZWcodywgR0VOOV9TTElDRV9DT01NT05fRUNPX0NISUNL
RU4xKTsKKworCQkvKgorCQkgKiBXYUFsbG93UE1EZXB0aEFuZEludm9jYXRpb25Db3VudEFjY2Vz
c0Zyb21VTUQ6aWNsCisJCSAqCisJCSAqIFRoaXMgY292ZXJzIDQgcmVnaXN0ZXIgd2hpY2ggYXJl
IG5leHQgdG8gb25lIGFub3RoZXIgOgorCQkgKiAgIC0gUFNfSU5WT0NBVElPTl9DT1VOVAorCQkg
KiAgIC0gUFNfSU5WT0NBVElPTl9DT1VOVF9VRFcKKwkJICogICAtIFBTX0RFUFRIX0NPVU5UCisJ
CSAqICAgLSBQU19ERVBUSF9DT1VOVF9VRFcKKwkJICovCisJCXdoaXRlbGlzdF9yZWdfZXh0KHcs
IFBTX0lOVk9DQVRJT05fQ09VTlQsCisJCQkJICBSSU5HX0ZPUkNFX1RPX05PTlBSSVZfUkQgfAor
CQkJCSAgUklOR19GT1JDRV9UT19OT05QUklWX1JBTkdFXzQpOwogCQlicmVhazsKIAogCWNhc2Ug
VklERU9fREVDT0RFX0NMQVNTOgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
