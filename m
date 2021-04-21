Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BB3674EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 23:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E976EA04;
	Wed, 21 Apr 2021 21:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4422A6E030;
 Wed, 21 Apr 2021 21:59:50 +0000 (UTC)
IronPort-SDR: UvJJGErCgKmpp6jJi6caaWOxTI1sTrNUWQ3hC4vSpeKa/aSfvpVCcvdiW52wfybgO/I5bQEPEE
 MY45mN5zWcYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="192598191"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="192598191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 14:59:49 -0700
IronPort-SDR: YZDxQTFOfAfFmeaWXfr0Y9iSw8vCHV3hVvaIkuQCc59xCIO65tpgueNb3g9vzhQUoTMJ1tcO4C
 N4tB2blaPqIg==
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="401620987"
Received: from ftimarch-mobl2.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.254.35.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 14:59:48 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP
 spec
Date: Wed, 21 Apr 2021 15:02:23 -0700
Message-Id: <20210421220224.200729-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFBfUFNSX0VOX0NGRyBiaXQgNSBha2EgIlNlbGVjdGl2ZSBVcGRhdGUgUmVnaW9uIFNjYW4gTGlu
ZSBDYXB0dXJlCkluZGljYXRpb24iIGluIGVEUCBzcGVjIGhhcyBhIGFtYmlndW91cyBuYW1lLCBz
byByZW5hbWluZyB0byBiZXR0ZXIKbWF0Y2ggc3BlY2lmaWNhdGlvbi4KCldoaWxlIGF0IGl0LCBy
ZXBsYWNpbmcgYml0IHNoaXQgYnkgQklUKCkgbWFjcm8gYW5kIGFkZGluZyB0aGUgdmVyc2lvbgpz
b21lIHJlZ2lzdGVycyB3ZXJlIGFkZGVkIHRvIGVEUCBzcGVjaWZpY2F0aW9uLgoKQ2M6IDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6
IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggMWU4NWMyMDIxZjJmLi5kNmY2YTA4NGExOTAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTY4Nywx
NCArNjg3LDE0IEBAIHN0cnVjdCBkcm1fZGV2aWNlOwogI2RlZmluZSBEUF9EU0NfRU5BQkxFICAg
ICAgICAgICAgICAgICAgICAgICAweDE2MCAgIC8qIERQIDEuNCAqLwogIyBkZWZpbmUgRFBfREVD
T01QUkVTU0lPTl9FTiAgICAgICAgICAgICAgICAoMSA8PCAwKQogCi0jZGVmaW5lIERQX1BTUl9F
Tl9DRkcJCQkgICAgMHgxNzAgICAvKiBYWFggMS4yPyAqLwotIyBkZWZpbmUgRFBfUFNSX0VOQUJM
RQkJCSAgICAoMSA8PCAwKQotIyBkZWZpbmUgRFBfUFNSX01BSU5fTElOS19BQ1RJVkUJICAgICgx
IDw8IDEpCi0jIGRlZmluZSBEUF9QU1JfQ1JDX1ZFUklGSUNBVElPTgkgICAgKDEgPDwgMikKLSMg
ZGVmaW5lIERQX1BTUl9GUkFNRV9DQVBUVVJFCQkgICAgKDEgPDwgMykKLSMgZGVmaW5lIERQX1BT
Ul9TRUxFQ1RJVkVfVVBEQVRFCSAgICAoMSA8PCA0KQotIyBkZWZpbmUgRFBfUFNSX0lSUV9IUERf
V0lUSF9DUkNfRVJST1JTICAgICAoMSA8PCA1KQotIyBkZWZpbmUgRFBfUFNSX0VOQUJMRV9QU1Iy
CQkgICAgKDEgPDwgNikgLyogZURQIDEuNGEgKi8KKyNkZWZpbmUgRFBfUFNSX0VOX0NGRwkJCQkw
eDE3MCAgIC8qIFhYWCAxLjI/ICovCisjIGRlZmluZSBEUF9QU1JfRU5BQkxFCQkJCUJJVCgwKQor
IyBkZWZpbmUgRFBfUFNSX01BSU5fTElOS19BQ1RJVkUJCUJJVCgxKQorIyBkZWZpbmUgRFBfUFNS
X0NSQ19WRVJJRklDQVRJT04JCUJJVCgyKQorIyBkZWZpbmUgRFBfUFNSX0ZSQU1FX0NBUFRVUkUJ
CQlCSVQoMykKKyMgZGVmaW5lIERQX1BTUl9TVV9SRUdJT05fU0NBTkxJTkVfQ0FQVFVSRQlCSVQo
NCkgLyogZURQIDEuNGEgKi8KKyMgZGVmaW5lIERQX1BTUl9JUlFfSFBEX1dJVEhfQ1JDX0VSUk9S
UwkJQklUKDUpIC8qIGVEUCAxLjRhICovCisjIGRlZmluZSBEUF9QU1JfRU5BQkxFX1BTUjIJCQlC
SVQoNikgLyogZURQIDEuNGEgKi8KIAogI2RlZmluZSBEUF9BREFQVEVSX0NUUkwJCQkgICAgMHgx
YTAKICMgZGVmaW5lIERQX0FEQVBURVJfQ1RSTF9GT1JDRV9MT0FEX1NFTlNFICAgKDEgPDwgMCkK
LS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
