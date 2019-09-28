Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5BC0F31
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 03:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3BA6E0CE;
	Sat, 28 Sep 2019 01:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33386E116
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 01:31:42 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 49BF561231; Sat, 28 Sep 2019 01:31:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jsanka@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48A1D61215;
 Sat, 28 Sep 2019 01:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48A1D61215
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: add fb max width/height fields to drm_mode_config
Date: Fri, 27 Sep 2019 18:31:24 -0700
Message-Id: <1569634284-14147-2-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569634284-14147-1-git-send-email-jsanka@codeaurora.org>
References: <1569634284-14147-1-git-send-email-jsanka@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569634302;
 bh=m/+SNT1ylRadZlQdB8fVjW39Gd/vKBoLUGrjef6eP84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RI1nEsTNZgzuuIiAOrGLYL/LSzZo5ZrLPjkbmNFJa19OCzMGHHcOmzNKVY1pMs0nW
 N5AhgFKmeNw82wiejvI7iRs0Dzc8GAocncgMZDH/TeN4th64WONFI6Tgb1u+C02BoQ
 Szz76x0YTEX33TnwFjkO2hzh7zcDdA86cm1/oxw4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569634300;
 bh=m/+SNT1ylRadZlQdB8fVjW39Gd/vKBoLUGrjef6eP84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gWltI+e8ODxHtIEtclTtLsrsvPIs5a9B4Gwew/tlufCZvnw6SppeDSq0nMs/tFlje
 UFqToKo/LIIWRdNbhvAbgn6OzKFayULvC1QxqEbhX9fc0hVTCIAcDr2Zy62tdd6QBB
 FV9gw8s2lve5RsiNGyiCQETZyv7Wr/xhnhdi8GHE=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jsanka@codeaurora.org
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
Cc: seanpaul@chromium.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1vZGVfY29uZmlnIG1heCB3aWR0aC9oZWlnaHQgdmFsdWVzIGRldGVybWluZSB0aGUgbWF4
aW11bQpyZXNvbHV0aW9uIHRoZSBwaXhlbCByZWFkZXIgY2FuIGhhbmRsZS4gQnV0IHRoZSBzYW1l
IHZhbHVlcyBhcmUKdXNlZCB0byByZXN0cmljdCB0aGUgc2l6ZSBvZiB0aGUgZnJhbWVidWZmZXIg
Y3JlYXRpb24uIEhhcmR3YXJlJ3MKd2l0aCBzY2FsaW5nIGJsb2NrcyBjYW4gb3BlcmF0ZSBvbiBm
cmFtZWJ1ZmZlcnMgbGFyZ2VyL3NtYWxsZXIgdGhhbgp0aGF0IG9mIHRoZSBwaXhlbCByZWFkZXIg
cmVzb2x1dGlvbnMgYnkgc2NhbGluZyB0aGVtIGRvd24vdXAgYmVmb3JlCnJlbmRlcmluZy4KClRo
aXMgY2hhbmdlcyBhZGRzIGEgc2VwYXJhdGUgZnJhbWVidWZmZXIgbWF4IHdpZHRoL2hlaWdodCBm
aWVsZHMKaW4gZHJtX21vZGVfY29uZmlnIHRvIGFsbG93IHZlbmRvcnMgdG8gc2V0IGlmIHRoZXkg
YXJlIGRpZmZlcmVudAp0aGFuIHRoYXQgb2YgdGhlIGRlZmF1bHQgbWF4IHJlc29sdXRpb24gdmFs
dWVzLgoKVmVuZG9ycyBzZXR0aW5nIHRoZXNlIGZpZWxkcyBzaG91bGQgZml4IHRoZWlyIG1vZGVf
c2V0IHBhdGhzIHRvbwpieSBmaWx0ZXJpbmcgYW5kIHZhbGlkYXRpbmcgdGhlIG1vZGVzIGFnYWlu
c3QgdGhlIGFwcHJvcHJpYXRlIG1heApmaWVsZHMgaW4gdGhlaXIgbW9kZV92YWxpZCgpIGltcGxl
bWVudGF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmV5a3VtYXIgU2Fua2FyYW4gPGpzYW5rYUBjb2Rl
YXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgfCAxNSAr
KysrKysrKysrKy0tLS0KIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICB8ICAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZnJhbWVidWZmZXIuYwppbmRleCA1NzU2NDMxLi4yMDgzMTY4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mcmFtZWJ1ZmZlci5jCkBAIC0zMDAsMTQgKzMwMCwyMSBAQCBzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICoKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAJfQogCi0JaWYgKChjb25maWct
Pm1pbl93aWR0aCA+IHItPndpZHRoKSB8fCAoci0+d2lkdGggPiBjb25maWctPm1heF93aWR0aCkp
IHsKKwlpZiAoKGNvbmZpZy0+bWluX3dpZHRoID4gci0+d2lkdGgpIHx8CisJICAgICghY29uZmln
LT5tYXhfZmJfd2lkdGggJiYgci0+d2lkdGggPiBjb25maWctPm1heF93aWR0aCkgfHwKKwkgICAg
KGNvbmZpZy0+bWF4X2ZiX3dpZHRoICYmIHItPndpZHRoID4gY29uZmlnLT5tYXhfZmJfd2lkdGgp
KSB7CiAJCURSTV9ERUJVR19LTVMoImJhZCBmcmFtZWJ1ZmZlciB3aWR0aCAlZCwgc2hvdWxkIGJl
ID49ICVkICYmIDw9ICVkXG4iLAotCQkJICByLT53aWR0aCwgY29uZmlnLT5taW5fd2lkdGgsIGNv
bmZpZy0+bWF4X3dpZHRoKTsKKwkJCXItPndpZHRoLCBjb25maWctPm1pbl93aWR0aCwgY29uZmln
LT5tYXhfZmJfd2lkdGggPworCQkJY29uZmlnLT5tYXhfZmJfd2lkdGggOiBjb25maWctPm1heF93
aWR0aCk7CiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCX0KLQlpZiAoKGNvbmZpZy0+bWlu
X2hlaWdodCA+IHItPmhlaWdodCkgfHwgKHItPmhlaWdodCA+IGNvbmZpZy0+bWF4X2hlaWdodCkp
IHsKKworCWlmICgoY29uZmlnLT5taW5faGVpZ2h0ID4gci0+aGVpZ2h0KSB8fAorCSAgICAoIWNv
bmZpZy0+bWF4X2ZiX2hlaWdodCAmJiByLT5oZWlnaHQgPiBjb25maWctPm1heF9oZWlnaHQpIHx8
CisJICAgIChjb25maWctPm1heF9mYl9oZWlnaHQgJiYgci0+aGVpZ2h0ID4gY29uZmlnLT5tYXhf
ZmJfaGVpZ2h0KSkgewogCQlEUk1fREVCVUdfS01TKCJiYWQgZnJhbWVidWZmZXIgaGVpZ2h0ICVk
LCBzaG91bGQgYmUgPj0gJWQgJiYgPD0gJWRcbiIsCi0JCQkgIHItPmhlaWdodCwgY29uZmlnLT5t
aW5faGVpZ2h0LCBjb25maWctPm1heF9oZWlnaHQpOworCQkJci0+aGVpZ2h0LCBjb25maWctPm1p
bl9oZWlnaHQsIGNvbmZpZy0+bWF4X2ZiX3dpZHRoID8KKwkJCWNvbmZpZy0+bWF4X2ZiX2hlaWdo
dCA6IGNvbmZpZy0+bWF4X2hlaWdodCk7CiAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCX0K
IApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNsdWRlL2Ry
bS9kcm1fbW9kZV9jb25maWcuaAppbmRleCAzYmNiZTMwLi5jNjM5NGVkIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9j
b25maWcuaApAQCAtMzM5LDYgKzMzOSw4IEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3Mg
ewogICogQG1pbl9oZWlnaHQ6IG1pbmltdW0gZmIgcGl4ZWwgaGVpZ2h0IG9uIHRoaXMgZGV2aWNl
CiAgKiBAbWF4X3dpZHRoOiBtYXhpbXVtIGZiIHBpeGVsIHdpZHRoIG9uIHRoaXMgZGV2aWNlCiAg
KiBAbWF4X2hlaWdodDogbWF4aW11bSBmYiBwaXhlbCBoZWlnaHQgb24gdGhpcyBkZXZpY2UKKyAq
IEBtYXhfZmJfd2lkdGg6IG1heGltdW0gZmIgYnVmZmVyIHdpZHRoIGlmIGRpZmZlcnMgZnJvbSBt
YXhfd2lkdGgKKyAqIEBtYXhfZmJfaGVpZ2h0OiBtYXhpbXVtIGZiIGJ1ZmZlciBoZWlnaHQgaWYg
ZGlmZmVycyBmcm9tICBtYXhfaGVpZ2h0CiAgKiBAZnVuY3M6IGNvcmUgZHJpdmVyIHByb3ZpZGVk
IG1vZGUgc2V0dGluZyBmdW5jdGlvbnMKICAqIEBmYl9iYXNlOiBiYXNlIGFkZHJlc3Mgb2YgdGhl
IGZyYW1lYnVmZmVyCiAgKiBAcG9sbF9lbmFibGVkOiB0cmFjayBwb2xsaW5nIHN1cHBvcnQgZm9y
IHRoaXMgZGV2aWNlCkBAIC01MjMsNiArNTI1LDcgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7
CiAKIAlpbnQgbWluX3dpZHRoLCBtaW5faGVpZ2h0OwogCWludCBtYXhfd2lkdGgsIG1heF9oZWln
aHQ7CisJaW50IG1heF9mYl93aWR0aCwgbWF4X2ZiX2hlaWdodDsKIAljb25zdCBzdHJ1Y3QgZHJt
X21vZGVfY29uZmlnX2Z1bmNzICpmdW5jczsKIAlyZXNvdXJjZV9zaXplX3QgZmJfYmFzZTsKIAot
LSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRo
ZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJv
amVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
