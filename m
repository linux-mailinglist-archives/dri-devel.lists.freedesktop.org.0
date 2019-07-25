Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF305754A7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BC96E79A;
	Thu, 25 Jul 2019 16:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A155A6E79B;
 Thu, 25 Jul 2019 16:53:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5065C60D0C; Thu, 25 Jul 2019 16:53:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D6AC60247;
 Thu, 25 Jul 2019 16:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D6AC60247
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Annotate intentional switch statement fall throughs
Date: Thu, 25 Jul 2019 10:53:08 -0600
Message-Id: <1564073588-27386-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564073598;
 bh=oq2L+B+IIfQIVurBUXqqlX1OqZKCXJuZfTlxNoBprds=;
 h=From:To:Cc:Subject:Date:From;
 b=Bik0s4qSQq6Wu0D6tiaGOJLhOY63FUh50ZAkplAkNyYirlshBHEPuyYjTHTlJhcZU
 7mp5Hxc1nSxobOUxyrnDpQqbp5u9VfezmGhk6NWwbNFgR+tQsWYJnjmIufCKH8ocek
 RbHjSD/5lBMQO+A+tZ5tNhA/GebdhURz48oy/CSU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564073596;
 bh=oq2L+B+IIfQIVurBUXqqlX1OqZKCXJuZfTlxNoBprds=;
 h=From:To:Cc:Subject:Date:From;
 b=mET74vPDzVJOY+TylnVBKCObvz1S02T36cpf5+6oJd24Sih4a6lDBE/cHEptSgpUC
 X8T6z/l8XUKHLBcjplju5VvtPLp5XS5m5cf5EnrgueelGWwn5soXCEIXxT6D9mF1TZ
 ZM8bnvUkPTK6/IR+Fq0gvtAxliiFOm2A9yiSYsSE=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Kees Cook <keescook@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhwbGljaXRseSBtYXJrIGludGVudGlvbmFsIGZhbGwgdGhyb3VnaHMgaW4gc3dpdGNoIHN0YXRl
bWVudHMgdG8ga2VlcAotV2ltcGxpY2l0LWZhbGx0aHJvdWdoIGZyb20gY29tcGxhaW5pbmcuCgpT
aWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgotLS0K
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jICAgfCAyICsrCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19ncHUuYyB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYwppbmRleCAxNjcxZGI0Li5l
OWM1NWQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKQEAgLTU5LDYgKzU5
LDcgQEAgc3RhdGljIHZvaWQgYTV4eF9zdWJtaXRfaW5fcmIoc3RydWN0IG1zbV9ncHUgKmdwdSwg
c3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQKIAkJY2FzZSBNU01fU1VCTUlUX0NNRF9DVFhf
UkVTVE9SRV9CVUY6CiAJCQlpZiAocHJpdi0+bGFzdGN0eCA9PSBjdHgpCiAJCQkJYnJlYWs7CisJ
CQkvKiBmYWxsLXRocnUgKi8KIAkJY2FzZSBNU01fU1VCTUlUX0NNRF9CVUY6CiAJCQkvKiBjb3B5
IGNvbW1hbmRzIGludG8gUkI6ICovCiAJCQlvYmogPSBzdWJtaXQtPmJvc1tzdWJtaXQtPmNtZFtp
XS5pZHhdLm9iajsKQEAgLTE0OSw2ICsxNTAsNyBAQCBzdGF0aWMgdm9pZCBhNXh4X3N1Ym1pdChz
dHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCwKIAkJY2Fz
ZSBNU01fU1VCTUlUX0NNRF9DVFhfUkVTVE9SRV9CVUY6CiAJCQlpZiAocHJpdi0+bGFzdGN0eCA9
PSBjdHgpCiAJCQkJYnJlYWs7CisJCQkvKiBmYWxsLXRocnUgKi8KIAkJY2FzZSBNU01fU1VCTUlU
X0NNRF9CVUY6CiAJCQlPVVRfUEtUNyhyaW5nLCBDUF9JTkRJUkVDVF9CVUZGRVJfUEZFLCAzKTsK
IAkJCU9VVF9SSU5HKHJpbmcsIGxvd2VyXzMyX2JpdHMoc3VibWl0LT5jbWRbaV0uaW92YSkpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKaW5kZXggYmUzOWNmMC4uZGM4ZWMyYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCkBAIC0xMTUsNiArMTE1LDcgQEAg
c3RhdGljIHZvaWQgYTZ4eF9zdWJtaXQoc3RydWN0IG1zbV9ncHUgKmdwdSwgc3RydWN0IG1zbV9n
ZW1fc3VibWl0ICpzdWJtaXQsCiAJCWNhc2UgTVNNX1NVQk1JVF9DTURfQ1RYX1JFU1RPUkVfQlVG
OgogCQkJaWYgKHByaXYtPmxhc3RjdHggPT0gY3R4KQogCQkJCWJyZWFrOworCQkJLyogZmFsbC10
aHJ1ICovCiAJCWNhc2UgTVNNX1NVQk1JVF9DTURfQlVGOgogCQkJT1VUX1BLVDcocmluZywgQ1Bf
SU5ESVJFQ1RfQlVGRkVSX1BGRSwgMyk7CiAJCQlPVVRfUklORyhyaW5nLCBsb3dlcl8zMl9iaXRz
KHN1Ym1pdC0+Y21kW2ldLmlvdmEpKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2FkcmVub19ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19n
cHUuYwppbmRleCA5YWNiYmMwLi4wNDhjOGJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YWRyZW5vX2dwdS5jCkBAIC00MjgsNiArNDI4LDcgQEAgdm9pZCBhZHJlbm9fc3VibWl0KHN0cnVj
dCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0LAogCQkJLyogaWdu
b3JlIGlmIHRoZXJlIGhhcyBub3QgYmVlbiBhIGN0eCBzd2l0Y2g6ICovCiAJCQlpZiAocHJpdi0+
bGFzdGN0eCA9PSBjdHgpCiAJCQkJYnJlYWs7CisJCQkvKiBmYWxsLXRocnUgKi8KIAkJY2FzZSBN
U01fU1VCTUlUX0NNRF9CVUY6CiAJCQlPVVRfUEtUMyhyaW5nLCBhZHJlbm9faXNfYTQzMChhZHJl
bm9fZ3B1KSA/CiAJCQkJQ1BfSU5ESVJFQ1RfQlVGRkVSX1BGRSA6IENQX0lORElSRUNUX0JVRkZF
Ul9QRkQsIDIpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
