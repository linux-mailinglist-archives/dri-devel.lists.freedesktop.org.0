Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9256AC06A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 21:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B4F6E05F;
	Fri,  6 Sep 2019 19:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D106E087
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 19:23:53 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so15218920iof.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 12:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AE6/toJbSfVkr1wiQ76oTdfqTgHlpEwnqu8Dl52qybo=;
 b=m1eVf/EYUgWsmIstfi1L5ZClHwyjdo5m5jvnGMOnXOtl4jfWUUuxsySDiWkVd9bVw5
 EWXnQNVgvw+e/JdPDrAMjLlMJcA87ORQGxHJR0DilKCODVphrq3MJ7FauEFA1seHPv5Y
 E8TTHehP4fQWH61HQJDF5UkgvuWqkv8h5o8k9pjkCMXjWo2tVUCmVvT8SKx8cBARcRpp
 E4tTndwkuf+dv2wexaVWi9SsGdvspCXQqXCau/zid3yWn9jjKMBJJERfrnNHx/3hMGxR
 4mmMyeR4a4J/DDhxVk0YYRwAeOQVtNUc4pG/xPPfryFpObIoKoW1FPf5OXJ1763JYQbp
 heMg==
X-Gm-Message-State: APjAAAVO29qy0Ym7hs/HXyU3G8cVvZVE1ulkahVmQpWVhGlR1AYHj1Vp
 yNeVCknFjyi4ZtpkW1zNpu0FbnlhE+0OiQ==
X-Google-Smtp-Source: APXvYqxNdgUM84LcEYFHrtVVCkCw4B+04vJZJSOxcLjqGkPJJF2PCpuIaKSujUu3oHwmwt5ZIOC3fQ==
X-Received: by 2002:a5e:9509:: with SMTP id r9mr3806096ioj.100.1567797832607; 
 Fri, 06 Sep 2019 12:23:52 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 12:23:52 -0700 (PDT)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/msm/dpu: Remove unused variables
Date: Fri,  6 Sep 2019 13:23:39 -0600
Message-Id: <20190906192344.223694-1-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AE6/toJbSfVkr1wiQ76oTdfqTgHlpEwnqu8Dl52qybo=;
 b=Yr22SN8b0+6K0mLDWoC2RcAMt2BSA+g2SJIZhWjnemfnUIXzIb9OfP5pwLy2SunBV0
 1mA0dkaunKNZD6NnQTCgqpZ+kfi0Kz3khBQI59IZsUPZ2n+ATm6MmAz9fG81bQHXpHwA
 DxRwDMxvuIrw2OwIStmmkKuWrbKeB04MPeufs=
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
Cc: Fritz Koenig <frkoenig@google.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogRHJldyBEYXZlbnBvcnQgPGRkYXZlbnBvcnRAY2hyb21pdW0ub3JnPgot
LS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jICAgIHwgNSAtLS0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDcgLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2NydGMuYwppbmRleCBjZTU5YWRmZjA2YWEuLjJlY2UxMTI2Mjk0MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCkBAIC0xMjg4LDEzICsxMjg4
LDggQEAgc3RydWN0IGRybV9jcnRjICpkcHVfY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogewogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9
IE5VTEw7CiAJc3RydWN0IGRwdV9jcnRjICpkcHVfY3J0YyA9IE5VTEw7Ci0Jc3RydWN0IG1zbV9k
cm1fcHJpdmF0ZSAqcHJpdiA9IE5VTEw7Ci0Jc3RydWN0IGRwdV9rbXMgKmttcyA9IE5VTEw7CiAJ
aW50IGk7CiAKLQlwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKLQlrbXMgPSB0b19kcHVfa21zKHBy
aXYtPmttcyk7Ci0KIAlkcHVfY3J0YyA9IGt6YWxsb2Moc2l6ZW9mKCpkcHVfY3J0YyksIEdGUF9L
RVJORUwpOwogCWlmICghZHB1X2NydGMpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKaW5kZXggZDgyZWE5OTQw
NjNmLi40ZDJjYWNkMGNlM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYwpAQCAtMTkxNCw4ICsxOTE0LDYgQEAgc3RhdGljIGludCBfZHB1X2VuY29kZXJf
ZGVidWdmc19zdGF0dXNfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLAogc3RhdGljIGludCBfZHB1
X2VuY29kZXJfaW5pdF9kZWJ1Z2ZzKHN0cnVjdCBkcm1fZW5jb2RlciAqZHJtX2VuYykKIHsKIAlz
dHJ1Y3QgZHB1X2VuY29kZXJfdmlydCAqZHB1X2VuYyA9IHRvX2RwdV9lbmNvZGVyX3ZpcnQoZHJt
X2VuYyk7Ci0Jc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsKLQlzdHJ1Y3QgZHB1X2ttcyAq
ZHB1X2ttczsKIAlpbnQgaTsKIAogCXN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25z
IGRlYnVnZnNfc3RhdHVzX2ZvcHMgPSB7CkBAIC0xOTMyLDkgKzE5MzAsNiBAQCBzdGF0aWMgaW50
IF9kcHVfZW5jb2Rlcl9pbml0X2RlYnVnZnMoc3RydWN0IGRybV9lbmNvZGVyICpkcm1fZW5jKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQlwcml2ID0gZHJtX2VuYy0+ZGV2LT5kZXZfcHJpdmF0
ZTsKLQlkcHVfa21zID0gdG9fZHB1X2ttcyhwcml2LT5rbXMpOwotCiAJc25wcmludGYobmFtZSwg
RFBVX05BTUVfU0laRSwgImVuY29kZXIldSIsIGRybV9lbmMtPmJhc2UuaWQpOwogCiAJLyogY3Jl
YXRlIG92ZXJhbGwgc3ViLWRpcmVjdG9yeSBmb3IgdGhlIGVuY29kZXIgKi8KQEAgLTIxMzMsMTQg
KzIxMjgsMTIgQEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfZnJhbWVfZG9uZV90aW1lb3V0KHN0
cnVjdCB0aW1lcl9saXN0ICp0KQogCXN0cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jID0g
ZnJvbV90aW1lcihkcHVfZW5jLCB0LAogCQkJZnJhbWVfZG9uZV90aW1lcik7CiAJc3RydWN0IGRy
bV9lbmNvZGVyICpkcm1fZW5jID0gJmRwdV9lbmMtPmJhc2U7Ci0Jc3RydWN0IG1zbV9kcm1fcHJp
dmF0ZSAqcHJpdjsKIAl1MzIgZXZlbnQ7CiAKIAlpZiAoIWRybV9lbmMtPmRldiB8fCAhZHJtX2Vu
Yy0+ZGV2LT5kZXZfcHJpdmF0ZSkgewogCQlEUFVfRVJST1IoImludmFsaWQgcGFyYW1ldGVyc1xu
Iik7CiAJCXJldHVybjsKIAl9Ci0JcHJpdiA9IGRybV9lbmMtPmRldi0+ZGV2X3ByaXZhdGU7CiAK
IAlpZiAoIWRwdV9lbmMtPmZyYW1lX2J1c3lfbWFza1swXSB8fCAhZHB1X2VuYy0+Y3J0Y19mcmFt
ZV9ldmVudF9jYikgewogCQlEUk1fREVCVUdfS01TKCJpZDoldSBpbnZhbGlkIHRpbWVvdXQgZnJh
bWVfYnVzeV9tYXNrPSVsdVxuIiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
