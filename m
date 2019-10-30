Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA8E9E3D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 16:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CB76EA58;
	Wed, 30 Oct 2019 15:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753316EA58
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 15:03:00 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iPpUs-0001GN-AJ; Wed, 30 Oct 2019 15:02:54 +0000
From: Colin King <colin.king@canonical.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "Andrew F . Davis" <afd@ti.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <brian.starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH][next] dma-buf: heaps: remove redundant assignment to variable
 ret
Date: Wed, 30 Oct 2019 15:02:53 +0000
Message-Id: <20191030150253.10596-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSByZXQgaXMgYmVpbmcgYXNzaWduZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIKcmVh
ZCwgaXQgaXMgYmVpbmcgcmUtYXNzaWduZWQgdGhlIHNhbWUgdmFsdWUgb24gdGhlIGVycjAgZXhp
dApwYXRoLiBUaGUgYXNzaWdubWVudCBpcyByZWR1bmRhbnQgYW5kIGhlbmNlIGNhbiBiZSByZW1v
dmVkLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCkZpeGVzOiA0N2EzMmY5
YzEyMjYgKCJkbWEtYnVmOiBoZWFwczogQWRkIHN5c3RlbSBoZWFwIHRvIGRtYWJ1ZiBoZWFwcyIp
ClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgfCA0ICstLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jCmluZGV4IDQ1NTc4MmVmYmIzMi4uODE3YTE2NjdiZDU3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYworKysgYi9kcml2ZXJzL2Rt
YS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwpAQCAtNTUsMTAgKzU1LDggQEAgc3RhdGljIGludCBz
eXN0ZW1faGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsCiAJaGVscGVyX2J1ZmZl
ci0+cGFnZXMgPSBrbWFsbG9jX2FycmF5KGhlbHBlcl9idWZmZXItPnBhZ2Vjb3VudCwKIAkJCQkJ
ICAgICBzaXplb2YoKmhlbHBlcl9idWZmZXItPnBhZ2VzKSwKIAkJCQkJICAgICBHRlBfS0VSTkVM
KTsKLQlpZiAoIWhlbHBlcl9idWZmZXItPnBhZ2VzKSB7Ci0JCXJldCA9IC1FTk9NRU07CisJaWYg
KCFoZWxwZXJfYnVmZmVyLT5wYWdlcykKIAkJZ290byBlcnIwOwotCX0KIAogCWZvciAocGcgPSAw
OyBwZyA8IGhlbHBlcl9idWZmZXItPnBhZ2Vjb3VudDsgcGcrKykgewogCQkvKgotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
