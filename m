Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2770D2D5F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 17:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE936EB68;
	Thu, 10 Oct 2019 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82CF6EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 15:13:53 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id l64so2169679ywe.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 08:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
 b=j2MEFrNUdhrc7OUVgfo0ZCBHMTE3DN7vnzKOki4pozzdTz7jLfAIcQlTm++fnE66US
 c1VNLx3C7LqWDT5Tn005cvrC1J1ShBzSewuz4C5jc5fr3m0MPW7bL8asJKH7hFNKDFYc
 vXXTfR/X1iiCMKH83yB6/kDJ0ckv8+GcaeNoPJ73KYqdxwWNQnJ94yGEW+jIykmEs/Eu
 LZdJ+/CWssdhpSnbMVexPcM5hKeiyGPIkrCiUPRwoXUpCZDHCtUIkzczFnKlSqoOU8A5
 dhExnwBPYJdzOrxygg41kVzbJ7kHvkCxz/T4uglidMUVkyDta1tOj8eFuhLpuat+EzPb
 6aeA==
X-Gm-Message-State: APjAAAXQEo9AKGKh1Myc/lj+0Hpj8BU2ZtPgSlqpp3TPghXqRpGCwMDM
 iXFk8tudVr182C436bXCfC5OLZMWpUM=
X-Google-Smtp-Source: APXvYqz6i78IG2fD7IiQje6iL9Cb+MroBUgJuXZPwgwWNAKs6ZG6tZzGdvSBvRsa17xsCnto2rm+VA==
X-Received: by 2002:a0d:eb01:: with SMTP id u1mr7890799ywe.116.1570720432646; 
 Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id l77sm1425220ywb.32.2019.10.10.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/msm: dpu: Add modeset lock checks where
 applicable"
Date: Thu, 10 Oct 2019 11:13:21 -0400
Message-Id: <20191010151351.126735-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
 b=Dz8qx3cl6V8r5hcyRxz0ifUK4tg8h9IuwrTeWgWDOmpVOeWGYEJ7wa9PdxnX4Dh7AM
 ncXNWRlMWxinr0zh1dUv/gTHragMFEKu1nciild7GOesGLsf406xt94bqScfEvLHTjzi
 P9qTWKBYunU844KzFMIdkZL/CZ6OQ8UD76SnoC4Hq+M7WjGc9QqL9WwFkwGbIusvZmZH
 lzVTGz2n6zL/cO/DcyIYly1Tq2H0pY8j+3B40frwKZWGBKYORBW/Gt/aKZoZYKNT/77j
 rmUdrJfBhhH5SxkmNFVgRAmBsGRqcJmyqqdXRzkiHwy+pm00oGkZGwymIlmpCr5jlnUO
 SLLw==
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJldmVydHMgY29t
bWl0IDFkZmRiMGUxMDdkYmU2ZWJmZjNmNmJiYmU0YWFkMGI1YWE4N2JiYTQuCgpBcyBEYW5pZWwg
bWVudGlvbnMgaW4gaGlzIGVtYWlsIFsxXSwgbm9uLWJsb2NraW5nIGNvbW1pdHMgZG9uJ3QgaG9s
ZCB0aGUKbW9kZXNldCBsb2Nrcywgc28gd2UgY2FuIHNhZmVseSBhY2Nlc3Mgc3RhdGUgYXMgbG9u
ZyBhcyB0aGVzZSBmdW5jdGlvbnMKYXJlIGluIHRoZSBjb21taXQgcGF0aC4gSSdtIG5vdCBlbnRp
cmVseSBzdXJlIGlmIHRoZXNlIGhhdmUgYWx3YXlzIGJlZW4KaXNvbGF0ZWQgdG8gdGhlIGNvbW1p
dCBwYXRoLCBidXQgdGhleSBzZWVtIHRvIGJlIG5vdy4KClsxXS0gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktT2N0b2Jlci8yMzk0NDEuaHRtbAoK
Rml4ZXM6IDFkZmRiMGUxMDdkYiAoImRybS9tc206IGRwdTogQWRkIG1vZGVzZXQgbG9jayBjaGVj
a3Mgd2hlcmUgYXBwbGljYWJsZSIpCkNjOiBKZXlrdW1hciBTYW5rYXJhbiA8anNhbmthQGNvZGVh
dXJvcmEub3JnPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpTdWdnZXN0
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2NydGMuYyB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuYyAgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwppbmRleCBkYjZjOWNjZjNiZTI2Li5j
NjQ1ZGQyMDEzNjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMK
QEAgLTI4Miw4ICsyODIsNiBAQCBlbnVtIGRwdV9pbnRmX21vZGUgZHB1X2NydGNfZ2V0X2ludGZf
bW9kZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJCXJldHVybiBJTlRGX01PREVfTk9ORTsKIAl9
CiAKLQlXQVJOX09OKCFkcm1fbW9kZXNldF9pc19sb2NrZWQoJmNydGMtPm11dGV4KSk7Ci0KIAkv
KiBUT0RPOiBSZXR1cm5zIHRoZSBmaXJzdCBJTlRGX01PREUsIGNvdWxkIHRoZXJlIGJlIG11bHRp
cGxlIHZhbHVlcz8gKi8KIAlkcm1fZm9yX2VhY2hfZW5jb2Rlcl9tYXNrKGVuY29kZXIsIGNydGMt
PmRldiwgY3J0Yy0+c3RhdGUtPmVuY29kZXJfbWFzaykKIAkJcmV0dXJuIGRwdV9lbmNvZGVyX2dl
dF9pbnRmX21vZGUoZW5jb2Rlcik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMKaW5kZXggZTM5M2E0MjNkN2Q3YS4uMGU2OGUyMGQxOWM4NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9rbXMuYwpAQCAtMzA1LDcgKzMwNSw2IEBAIHZvaWQgZHB1X2ttc19l
bmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiAJaWYgKGZ1bmNzICYm
IGZ1bmNzLT5jb21taXQpCiAJCWZ1bmNzLT5jb21taXQoZW5jb2Rlcik7CiAKLQlXQVJOX09OKCFk
cm1fbW9kZXNldF9pc19sb2NrZWQoJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCkp
OwogCWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRldikgewogCQlpZiAoIShjcnRjLT5zdGF0ZS0+
ZW5jb2Rlcl9tYXNrICYgZHJtX2VuY29kZXJfbWFzayhlbmNvZGVyKSkpCiAJCQljb250aW51ZTsK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
