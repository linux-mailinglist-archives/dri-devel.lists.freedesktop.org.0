Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A10F10EB2E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C66E1EC;
	Mon,  2 Dec 2019 13:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2019 13:54:43 UTC
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142F6E1EE;
 Mon,  2 Dec 2019 13:54:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AF81C774A9
From: Chandan Uddaraju <chandanu@codeaurora.org>
To: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, seanpaul@chromium.org
Subject: [DPU PATCH v3 2/5] drm: add constant N value in helper file
Date: Mon, 2 Dec 2019 13:47:44 +0000
Message-ID: <0101016ec6ddf2ce-8548e076-2347-49be-a9be-4d81a14ad8f7-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
X-SES-Outgoing: 2019.12.02-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575294464;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=hpuIeYjWN94TwNYKsnIztAS7vVGCJc6iFBQ5zRaunG4=;
 b=dyyOWeGXyvukmbYZrlx+V3A+EZfXBoSK12mHJMNVCitDdjcXyoHSRYIxI04T1gYP
 SY7nvC1hkDzPgu/v1/7wLdKgPgT+safKx+C02AGX0EARLWw663f0ma8sKrQHynnxpgK
 HHHYHCDDYh0TioEzLxU7Rx//1hixzs94TNMf4kkc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575294464;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=hpuIeYjWN94TwNYKsnIztAS7vVGCJc6iFBQ5zRaunG4=;
 b=Ohzo2WIaX1MJExA7pr0q3TzIkAVqbnf3tsuLtLGTdUCQPWEVF485zGw6cIaazBgg
 Ne7Nw9Zy80qamkRzNJCg+d29eRyyq5oNkahHuOGT49M5SDAeXHMkTotHb4I3PRDm+fs
 Rih2hbjgXCaWl3Et8BaWxGaeiJb5I9IG4zicPpE8=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=chandanu@codeaurora.org
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
Cc: abhinavk@codeaurora.org, hoegsberg@google.com,
 dri-devel@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbnN0YW50IE4gdmFsdWUgKDB4ODAwMCkgaXMgdXNlZCBieSBtdWx0aXBsZSBEUApkcml2
ZXJzLiBEZWZpbmUgdGhpcyB2YWx1ZSBpbiBoZWFkZXIgZmlsZSBhbmQgdXNlIHRoaXMKaW4gdGhl
IGV4aXN0aW5nIGk5MTUgZGlzcGxheSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaGFuZGFuIFVk
ZGFyYWp1IDxjaGFuZGFudUBjb2RlYXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDIgKy0KIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaCAgICAgICAgICAgICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMKaW5kZXggY2UwNWU4MC4uMWE0Y2NmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTc0OTYsNyArNzQ5Niw3IEBAIHN0YXRp
YyB2b2lkIGNvbXB1dGVfbV9uKHVuc2lnbmVkIGludCBtLCB1bnNpZ25lZCBpbnQgbiwKIAkgKiB3
aGljaCB0aGUgZGV2aWNlcyBleHBlY3QgYWxzbyBpbiBzeW5jaHJvbm91cyBjbG9jayBtb2RlLgog
CSAqLwogCWlmIChjb25zdGFudF9uKQotCQkqcmV0X24gPSAweDgwMDA7CisJCSpyZXRfbiA9IERQ
X0xJTktfQ09OU1RBTlRfTl9WQUxVRTsKIAllbHNlCiAJCSpyZXRfbiA9IG1pbl90KHVuc2lnbmVk
IGludCwgcm91bmR1cF9wb3dfb2ZfdHdvKG4pLCBEQVRBX0xJTktfTl9NQVgpOwogCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKaW5kZXggODM2NDUwMi4uNjliODI1MSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM1Nyw2
ICsxMzU3LDcgQEAgaW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwKICAqIERpc3BsYXlQb3J0IGxpbmsKICAqLwogI2RlZmluZSBEUF9MSU5LX0NB
UF9FTkhBTkNFRF9GUkFNSU5HICgxIDw8IDApCisjZGVmaW5lIERQX0xJTktfQ09OU1RBTlRfTl9W
QUxVRSAweDgwMDAKIAogc3RydWN0IGRybV9kcF9saW5rIHsKIAl1bnNpZ25lZCBjaGFyIHJldmlz
aW9uOwotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVy
IG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRp
dmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
