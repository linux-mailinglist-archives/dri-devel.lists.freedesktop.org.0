Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6AA9A675
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 06:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6A76EBB7;
	Fri, 23 Aug 2019 04:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3AD6EBB5;
 Fri, 23 Aug 2019 04:02:23 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id go14so4771081plb.0;
 Thu, 22 Aug 2019 21:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yel0x+m2Aj0fHDjusl5I4z7R0Ifl+JFYgseDOVUIkZk=;
 b=MmI9w9Zx5i4RkbBobm2WwyPXauqyqKy6uIXyoA6JrkQV8cYVBDjapcuDPpMZVmKA5V
 1drz/NJHLNYXlG0WI1jP3QEo4xRMSJO3yIo1A32oX1xPV3y/ka8eoALkhMIKnS48OWNE
 sRJX5HzQvAzOa8CmK0xBkVpQimYirybKjaML/Zzn9gMgE9F0nRpID0C3gCZoBBT2/pj8
 prfPWDO/kZEFHa0btLIPSA3jD/NZFYOAg0YGAUlz5Y2kzddneNGoiZcdP9VTWBFPzhCN
 pEjCICZeRucPCh2hnb5+TqCrkD7NBJaXVhJ1h31gXZkxHStsOg0vQCJ1I3+itPufkBWj
 h6zA==
X-Gm-Message-State: APjAAAUZJmYxqy5AMvQxd/KpUbdMe0r3kzRDdO+TAGAkjX5RA/Sz4IUa
 oJCYOhNOr+mgqmXrs538FZ0AhbqoJ7Y=
X-Google-Smtp-Source: APXvYqx6OiWPOmb6UnDM7G4EeXtWVfl24KDBgNHT+5SzRGe+1+0Z1DiIj9dXuUxlW6ZND39sOQs42g==
X-Received: by 2002:a17:902:3363:: with SMTP id
 a90mr2403398plc.270.1566532942559; 
 Thu, 22 Aug 2019 21:02:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::6bd7])
 by smtp.gmail.com with ESMTPSA id e189sm699430pgc.15.2019.08.22.21.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 21:02:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: remove unused arg
Date: Thu, 22 Aug 2019 21:00:11 -0700
Message-Id: <20190823040103.22289-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823040103.22289-1-robdclark@gmail.com>
References: <20190823040103.22289-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yel0x+m2Aj0fHDjusl5I4z7R0Ifl+JFYgseDOVUIkZk=;
 b=Tj8kd3iWedgRnZYmXtQ1Inof1niR5jWQlUDlprQYn/jRwEPa7qH+LKWVYSuIPG6N+M
 azuHxFgl4BlOeRK4npX7cx0FqYVcstAgUBJUVcQoUxA2VH/ANXhjzTjaWIJAgZx0J3lX
 OoJotT8tSe5hYCXHY1hcnAeDOHAQraxCkwhLrZLgCvYAslNwSLpfNkTVPwJHdIOKkBf/
 Eye2vO7BhxvYuMXDme6aci3NBpzZITPWJsUWxSKI6ICMPB6UYoUJTuXIwSCt9kXK1uBN
 p0V0qbXgHB0ggKxPLHP+SaHCsrZe7ThaaioaCsQNajhyv/v6o7BYPW7Z30IoCAB165zB
 lqbw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Fritz Koenig <frkoenig@google.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-kernel@vger.kernel.org, Bruce Wang <bzwang@chromium.org>,
 Sean Paul <sean@poorly.run>, Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfZW5jb2Rlci5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXIuaCB8IDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMu
YwppbmRleCA0ZTU0NTUwYzRhODAuLmE1MjQzOWUwMjljOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCkBAIC02MzQsNyArNjM0LDcgQEAgdm9pZCBkcHVfY3J0Y19j
b21taXRfa2lja29mZihzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgYXN5bmMpCiAJICovCiAJ
ZHJtX2Zvcl9lYWNoX2VuY29kZXJfbWFzayhlbmNvZGVyLCBjcnRjLT5kZXYsCiAJCQkJICBjcnRj
LT5zdGF0ZS0+ZW5jb2Rlcl9tYXNrKQotCQlkcHVfZW5jb2Rlcl9wcmVwYXJlX2Zvcl9raWNrb2Zm
KGVuY29kZXIsIGFzeW5jKTsKKwkJZHB1X2VuY29kZXJfcHJlcGFyZV9mb3Jfa2lja29mZihlbmNv
ZGVyKTsKIAogCWlmICghYXN5bmMpIHsKIAkJLyogd2FpdCBmb3IgcHJldmlvdXMgZnJhbWVfZXZl
bnRfZG9uZSBjb21wbGV0aW9uICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYwppbmRleCBlZDY3N2NmMmUxYWYuLjYyN2M1NzU5NDIyMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCkBAIC0xNzgwLDcgKzE3ODAsNyBA
QCBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl92c3luY19ldmVudF93b3JrX2hhbmRsZXIoc3RydWN0
IGt0aHJlYWRfd29yayAqd29yaykKIAkJCW5zZWNzX3RvX2ppZmZpZXMoa3RpbWVfdG9fbnMod2Fr
ZXVwX3RpbWUpKSk7CiB9CiAKLXZvaWQgZHB1X2VuY29kZXJfcHJlcGFyZV9mb3Jfa2lja29mZihz
dHJ1Y3QgZHJtX2VuY29kZXIgKmRybV9lbmMsIGJvb2wgYXN5bmMpCit2b2lkIGRwdV9lbmNvZGVy
X3ByZXBhcmVfZm9yX2tpY2tvZmYoc3RydWN0IGRybV9lbmNvZGVyICpkcm1fZW5jKQogewogCXN0
cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jOwogCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlz
ICpwaHlzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmgKaW5k
ZXggYThiZjExNDdmYzU2Li45OTdkMTMxYzI0NDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2VuY29kZXIuaApAQCAtNjgsOSArNjgsOCBAQCB2b2lkIGRwdV9lbmNvZGVy
X3JlZ2lzdGVyX2ZyYW1lX2V2ZW50X2NhbGxiYWNrKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
ciwKICAqCUltbWVkaWF0ZWx5OiBpZiBubyBwcmV2aW91cyBjb21taXQgaXMgb3V0c3RhbmRpbmcu
CiAgKglEZWxheWVkOiBCbG9jayB1bnRpbCBuZXh0IHRyaWdnZXIgY2FuIGJlIGlzc3VlZC4KICAq
IEBlbmNvZGVyOgllbmNvZGVyIHBvaW50ZXIKLSAqIEBhc3luYzoJdHJ1ZSBpZiB0aGlzIGlzIGFu
IGFzeW5jaHJvbm91cyBjb21taXQKICAqLwotdm9pZCBkcHVfZW5jb2Rlcl9wcmVwYXJlX2Zvcl9r
aWNrb2ZmKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgIGJvb2wgYXN5bmMpOwordm9pZCBk
cHVfZW5jb2Rlcl9wcmVwYXJlX2Zvcl9raWNrb2ZmKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
cik7CiAKIC8qKgogICogZHB1X2VuY29kZXJfdHJpZ2dlcl9raWNrb2ZmX3BlbmRpbmcgLSBDbGVh
ciB0aGUgZmx1c2ggYml0cyBmcm9tIHByZXZpb3VzCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
