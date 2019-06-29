Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BE5AB3B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB456E9AC;
	Sat, 29 Jun 2019 13:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA76E9AB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 13:02:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 16so8578151ljv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 06:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
 b=A4zo2XDtqKQJOmW2FCMikktBmgdi7e6jFNu/C2rj8CAlo18lw1AoYmnWCbDQTKpHB/
 BvxBu5jZt4B+OnZ7gI7+BvIKwYx+LX0OgHiWte1waxuoMD2K8U2who3J+ZYkxi7HFDKG
 ZbRhkPIgWncjy5xnzLBeQE+WdJ1v0gmbIEyaaPasyyzCHSH+RUD+F8HPWzn5GWAirlKw
 tYapexKs38HY4YgMAgzjoxm2ncuh/DlrMDS+6XWp1N1L1RIYi6NpuiRDLBJHDVwFxh/3
 3WjHOTj2RZsU8457yRXGMDh6zjFVHY/YTgNxqg69/DEBHFErAsiRzbdB+gsXFqH53O+8
 j4nA==
X-Gm-Message-State: APjAAAVD3kERuVQ12yzw8pCNPHL7h9eq1mPuLGgJE5byLR5lQpEGOOkk
 D65lhh7SFIS92xXhe9mBxdWNrgL2jDLWTg==
X-Google-Smtp-Source: APXvYqwVGU+xg50XiekYht3IIxEqFHM099dgUifn3T0K/F2g1KQaP1T9fAtfYeTQ4lNEuy0h1An6cA==
X-Received: by 2002:a2e:8744:: with SMTP id q4mr8768966ljj.77.1561813321447;
 Sat, 29 Jun 2019 06:02:01 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:02:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
Date: Sat, 29 Jun 2019 14:59:30 +0200
Message-Id: <20190629125933.679-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lniFIm91gCkBVo8OT7Qc6rB8XEZiKvYZhCGqRwQxgRg=;
 b=R/OUJdhNfZGHaJoOsvmC50TZU4KNiySqOFuqTZkhUMlRuF2aiKO7gw52YdVXItSgcn
 yULpt7pmN8Q0FFQWwWXuiz9aPOeB3pvaPkb6xxb4hn467Tb4aGWSL9SCavDLu8IkKmmy
 qrTeh6vZQGGT0xcFf5zz72dp/fegF92Xn8K1lsaMp74Y52ZV+yXlor4P8xA3LvmbAVRg
 tyhC8dkj7Wq74VCB6f5GSAxCnIBTYFRJrgHvcNYjkbMf39LLwokl+2KRAWR7rROFUhJW
 510SqwEGSIvRO7vwvVY/+PCm/RmKugHh6Jbbn1ODQskyPdvHfCTEPIlI0+NbNPr/JqAa
 NqSA==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZiBvZiB0aGUgTVNNIERSTSBjb2RlIGdvaW5nIGFyb3VuZCBhbmQgaW5zcGVjdGluZyB0
aGUKZGV2aWNlIHRyZWUgbm9kZXMgYnkgaXRzZWxmIHRvIGZpbmQgInFjb20sbWlzYyIgR1BJTyBw
aGFuZGxlcywKd2UgYWRkIGEgcXVpcmsgdG8gdGhlIGNvcmUgc28gdGhhdCBpZiAicWNvbSxtaXNj
LWdwaW9zIiBhbmQKInFjb20sbWlzYy1ncGlvIiBpc24ndCBmb3VuZCwgd2UgdHJ5IHRvIGZpbmQg
anVzdAoicWNvbSxtaXNjIiBhcyBhIGxhc3QgcmVzb3J0LiBQcm92aWRlIGFuIGV4cGxpY2l0IHdo
aXRlbGlzdApmb3IgdGhvc2UgR1BJT3MuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwu
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpSb2Iv
U2VhbjogaWYgdGhlIGFwcHJvYWNoIGlzIG92ZXJhbGwgT0sgSSB3aWxsIG1lcmdlIHRoaXMKb25l
IHBhdGNoIGFscmVhZHkgZm9yIHY1LjMgc28gdGhlIHJlc3QgY2FuIGJlIHF1ZXVlZCBmb3IKdjUu
NCBsYXRlci4KLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jIHwgNDMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMgYi9kcml2ZXJzL2dw
aW8vZ3Bpb2xpYi1vZi5jCmluZGV4IGFlYzdiZDg2YWU3ZS4uYzkyN2VhZjZjODhmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jCisrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGli
LW9mLmMKQEAgLTI4Niw2ICsyODYsNDUgQEAgc3RhdGljIHN0cnVjdCBncGlvX2Rlc2MgKm9mX2Zp
bmRfcmVndWxhdG9yX2dwaW8oc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICoKIAlyZXR1
cm4gZGVzYzsKIH0KIAorLyoKKyAqIFNvbWUgbm9uLXN0YW5kYXJkIFF1YWxjb21tIEhETUkgR1BJ
T3MgbmVlZCB0byBiZSBzdXBwb3J0ZWQgYXMgdGhleSBleGlzdAorICogaW4gcmFuZG9tIG9sZCBk
ZXZpY2UgdHJlZXMgb3V0IHRoZXJlLgorICovCitzdGF0aWMgc3RydWN0IGdwaW9fZGVzYyAqb2Zf
ZmluZF9oZG1pX2dwaW8oc3RydWN0IGRldmljZSAqZGV2LAorCQkJCQkgICBjb25zdCBjaGFyICpj
b25faWQsCisJCQkJCSAgIGVudW0gb2ZfZ3Bpb19mbGFncyAqb2ZfZmxhZ3MpCit7CisJLyoKKwkg
KiBUaGVzZSBhcmUgdGhlIGNvbm5lY3Rpb24gSURzIHdlIGFjY2VwdCBhcyBsZWdhY3kgR1BJTyBw
aGFuZGxlcy4KKwkgKiBJZiB3ZSBnZXQgaGVyZSwgdGhlIHNhbWUgcHJlZml4IGVuZGluZyB3aXRo
ICItZ3BpbyIgYW5kICItZ3Bpb3MiCisJICogaGFzIGFscmVhZHkgYmVlbiB0cmllZCBzbyBub3cg
d2UgZmluYWxseSB0cnkgd2l0aCBubyBzdWZmaXguCisJICovCisJY29uc3QgY2hhciAqd2hpdGVs
aXN0W10gPSB7CisJCSJxY29tLGhkbWktdHgtZGRjLWNsayIsCisJCSJxY29tLGhkbWktdHgtZGRj
LWRhdGEiLAorCQkicWNvbSxoZG1pLXR4LWhwZCIsCisJCSJxY29tLGhkbWktdHgtbXV4LWVuIiwK
KwkJInFjb20saGRtaS10eC1tdXgtc2VsIiwKKwkJInFjb20saGRtaS10eC1tdXgtbHBtIiwKKwl9
OworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7CisJc3RydWN0IGdwaW9f
ZGVzYyAqZGVzYzsKKwlpbnQgaTsKKworCWlmICghSVNfRU5BQkxFRChDT05GSUdfRFJNX01TTSkp
CisJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOworCisJaWYgKCFjb25faWQpCisJCXJldHVybiBF
UlJfUFRSKC1FTk9FTlQpOworCisJaSA9IG1hdGNoX3N0cmluZyh3aGl0ZWxpc3QsIEFSUkFZX1NJ
WkUod2hpdGVsaXN0KSwgY29uX2lkKTsKKwlpZiAoaSA8IDApCisJCXJldHVybiBFUlJfUFRSKC1F
Tk9FTlQpOworCisJZGVzYyA9IG9mX2dldF9uYW1lZF9ncGlvZF9mbGFncyhucCwgY29uX2lkLCAw
LCBvZl9mbGFncyk7CisJcmV0dXJuIGRlc2M7Cit9CisKIHN0cnVjdCBncGlvX2Rlc2MgKm9mX2Zp
bmRfZ3BpbyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmNvbl9pZCwKIAkJCSAgICAg
ICB1bnNpZ25lZCBpbnQgaWR4LCB1bnNpZ25lZCBsb25nICpmbGFncykKIHsKQEAgLTMzMCw2ICsz
NjksMTAgQEAgc3RydWN0IGdwaW9fZGVzYyAqb2ZfZmluZF9ncGlvKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqY29uX2lkLAogCWlmIChJU19FUlIoZGVzYykgJiYgUFRSX0VSUihkZXNj
KSAhPSAtRVBST0JFX0RFRkVSKQogCQlkZXNjID0gb2ZfZmluZF9yZWd1bGF0b3JfZ3BpbyhkZXYs
IGNvbl9pZCwgJm9mX2ZsYWdzKTsKIAorCS8qIFNwZWNpYWwgaGFuZGxpbmcgZm9yIEhETUkgR1BJ
T3MgaWYgdXNlZCAqLworCWlmIChJU19FUlIoZGVzYykgJiYgUFRSX0VSUihkZXNjKSAhPSAtRVBS
T0JFX0RFRkVSKQorCQlkZXNjID0gb2ZfZmluZF9oZG1pX2dwaW8oZGV2LCBjb25faWQsICZvZl9m
bGFncyk7CisKIAlpZiAoSVNfRVJSKGRlc2MpKQogCQlyZXR1cm4gZGVzYzsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
