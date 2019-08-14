Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971688DD50
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174AC6E7D7;
	Wed, 14 Aug 2019 18:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94D26E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 196so6932723pfz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lvs2sCjFBJ8XOKE0DuOatJnI8ohKITzd4uZXKHqLHj4=;
 b=CqugBCtSH3ImjLWwjTa7e03/NKTvMdbpWP7a+h1w5hw5Op3T1gHSMSkwB7xjN8E1rI
 rih0PAAE0bs5CUgCwDnC029k31LS9fkUfammoCsEXwz9LJWHcf80dpNpaCMmLTdl58Oj
 3m5kDaB+1HRqnxCFq7nA2q/GBjrkbDeu6mkapJgsJNNSAIPsxKso3IgX4AzSeLS1goAv
 Y5qWh0tpB2PLLE29/RbEnriBIdo7JHoxrfYQAOGQLcQ8HuU5gR1ULmuu8VYza8TNCXgk
 Q7GsX+ED5X8dy79VM3vzrvDu//J93Yg+0MrpEnvIGdpVJ0H+f+fboHhjTO5GsbKQzRWg
 ZFgA==
X-Gm-Message-State: APjAAAVMe1FQFm1G48Cul4m7nOOLEDDoEZQX7IAjZi78gGjvSm87U1N6
 JUjYnE40p4RJwVc4JXkv7xx6jQ==
X-Google-Smtp-Source: APXvYqxxHQvsB1s/SEiK5v/iMZji4sqIw5BCV4QU4QLiSAN374eua3x6HznNA2qVuxDoXmCglbCI6A==
X-Received: by 2002:a62:2f06:: with SMTP id v6mr1377305pfv.195.1565808434877; 
 Wed, 14 Aug 2019 11:47:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:14 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 05/26] drm: kirin: Remove uncessary parameter
 indirection
Date: Wed, 14 Aug 2019 18:46:41 +0000
Message-Id: <20190814184702.54275-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lvs2sCjFBJ8XOKE0DuOatJnI8ohKITzd4uZXKHqLHj4=;
 b=Qy1YElo0lJ4Mf6kN0jaRh2yIv0ViKyJtzsyZBUhZluecH4U150hrQ83VWkx8QzXBK3
 AV5sKvB1a7h+tqmBY3lJgKcd+lbjRio/sK3GvLSgX15cDSD8R7yBqKKpvu2iBeuGwEXq
 AqWDp/GasCV/C4aRRFVUSA2m2SN8HqAxne8QcM0ZjFLZCKgGK86eMw5Bm2KkHZ3e07nu
 MzWUDDIBuqrtQAdb5uhOjYFDhO0i2hT3t31UiihjKQ9fyd+yuDxvQK9D474U6YU3kDtS
 aWPmCZOZLa1ZNBh++OUx3a0AOC+nR3ofGKP1c7oGwbuha8y8tJN1h+UGHcvjrNw4TKHC
 P2Nw==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKSW4gYSBmZXcgZnVuY3Rp
b25zLCB3ZSBwYXNzIGluIGEgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3ZSBvbmx5CnVzZSB0byBn
ZXQgdG8gdGhlIHVuZGVybHlpbmcgc3RydWN0IGFkZV9od19jdHguCgpUaHVzIHRoaXMgcGF0Y2gg
cmVmYWN0b3JzIHRoZSBmdW5jdGlvbnMgdG8ganVzdCB0YWtlIHRoZQpzdHJ1Y3QgYWRlX2h3X2N0
eCBkaXJlY3RseS4KCkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6
IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhpc2ls
aWNvbi5jb20+Cltqc3R1bHR6OiByZXdvcmRlZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1i
eTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgfCAxMiArKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwppbmRleCA5YTllM2I2
ODhiYTMuLjc1NmFlZmQ1YmNmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTIxMCwxMSArMjEwLDEwIEBAIHN0YXRpYyB2b2lkIGFk
ZV9zZXRfcGl4X2NsayhzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4LAogCWFkal9tb2RlLT5jbG9jayA9
IGNsa19nZXRfcmF0ZShjdHgtPmFkZV9waXhfY2xrKSAvIDEwMDA7CiB9CiAKLXN0YXRpYyB2b2lk
IGFkZV9sZGlfc2V0X21vZGUoc3RydWN0IGFkZV9jcnRjICphY3J0YywKK3N0YXRpYyB2b2lkIGFk
ZV9sZGlfc2V0X21vZGUoc3RydWN0IGFkZV9od19jdHggKmN0eCwKIAkJCSAgICAgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUsCiAJCQkgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICph
ZGpfbW9kZSkKIHsKLQlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4ID0gYWNydGMtPmN0eDsKIAl2b2lk
IF9faW9tZW0gKmJhc2UgPSBjdHgtPmJhc2U7CiAJdTMyIHdpZHRoID0gbW9kZS0+aGRpc3BsYXk7
CiAJdTMyIGhlaWdodCA9IG1vZGUtPnZkaXNwbGF5OwpAQCAtMzAxLDkgKzMwMCw4IEBAIHN0YXRp
YyB2b2lkIGFkZV9wb3dlcl9kb3duKHN0cnVjdCBhZGVfaHdfY3R4ICpjdHgpCiAJY3R4LT5wb3dl
cl9vbiA9IGZhbHNlOwogfQogCi1zdGF0aWMgdm9pZCBhZGVfc2V0X21lZGlhbm9jX3FvcyhzdHJ1
Y3QgYWRlX2NydGMgKmFjcnRjKQorc3RhdGljIHZvaWQgYWRlX3NldF9tZWRpYW5vY19xb3Moc3Ry
dWN0IGFkZV9od19jdHggKmN0eCkKIHsKLQlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4ID0gYWNydGMt
PmN0eDsKIAlzdHJ1Y3QgcmVnbWFwICptYXAgPSBjdHgtPm5vY19yZWdtYXA7CiAKIAlyZWdtYXBf
dXBkYXRlX2JpdHMobWFwLCBBREUwX1FPU0dFTkVSQVRPUl9NT0RFLApAQCAtNTE1LDcgKzUxMyw3
IEBAIHN0YXRpYyB2b2lkIGFkZV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpj
cnRjLAogCQkJcmV0dXJuOwogCX0KIAotCWFkZV9zZXRfbWVkaWFub2NfcW9zKGFjcnRjKTsKKwlh
ZGVfc2V0X21lZGlhbm9jX3FvcyhjdHgpOwogCWFkZV9kaXNwbGF5X2VuYWJsZShhY3J0Yyk7CiAJ
YWRlX2R1bXBfcmVncyhjdHgtPmJhc2UpOwogCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKQEAg
LTU0NSw3ICs1NDMsNyBAQCBzdGF0aWMgdm9pZCBhZGVfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykKIAogCWlmICghY3R4LT5wb3dlcl9vbikKIAkJKHZvaWQpYWRlX3Bv
d2VyX3VwKGN0eCk7Ci0JYWRlX2xkaV9zZXRfbW9kZShhY3J0YywgbW9kZSwgYWRqX21vZGUpOwor
CWFkZV9sZGlfc2V0X21vZGUoY3R4LCBtb2RlLCBhZGpfbW9kZSk7CiB9CiAKIHN0YXRpYyB2b2lk
IGFkZV9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCkBAIC01NTgsNyAr
NTU2LDcgQEAgc3RhdGljIHZvaWQgYWRlX2NydGNfYXRvbWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKIAogCWlmICghY3R4LT5wb3dlcl9vbikKIAkJKHZvaWQpYWRlX3Bvd2VyX3VwKGN0
eCk7Ci0JYWRlX2xkaV9zZXRfbW9kZShhY3J0YywgbW9kZSwgYWRqX21vZGUpOworCWFkZV9sZGlf
c2V0X21vZGUoY3R4LCBtb2RlLCBhZGpfbW9kZSk7CiB9CiAKIHN0YXRpYyB2b2lkIGFkZV9jcnRj
X2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
