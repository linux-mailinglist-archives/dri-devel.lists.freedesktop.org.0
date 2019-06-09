Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B13AC4A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 00:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5427A89216;
	Sun,  9 Jun 2019 22:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D71891B8;
 Sun,  9 Jun 2019 22:08:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a9so5233446lff.7;
 Sun, 09 Jun 2019 15:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nC9tFLAkR6tzpqb2eyECKIfbfY64gClnPtihP54Ifn8=;
 b=GrY3Dq3vDV91yfLjR9invdc+t9o0xYYdMVFtWgGbEuAMLtqS3jMsi75kdYb2Jiy0mY
 hBIQciWdb9oTlVPanm4U/XVFbm+oU4CIvdAsEQ50gGWxHywjMNJwxPTgpR9/s2x1ki9S
 8I3JT6nJZ+rkBpRZWQHA0H+ZkL2kKcnBt1Jpn1OBVjtQnWmivmh/MQH+KzHmf1/s4PtV
 9pTmsvTB+8XJgFjn6feQ7A7sYW6lVN8CxO8s62ZcDNo8nkAeGEL2kQ8UYeq3h/Z6RFyr
 fSiVR0GbTwlPYKlNkEkG6wJgS0WOqkA7TBclcOWJHheMx9ZyDDoFERiWdV7sHmRN7AZ0
 RfIg==
X-Gm-Message-State: APjAAAU5JpSle5N7h2R1o+qmdtvoL18XPWlYk6JHjXB1VU2frHXpC7Bd
 P3oNJf1LzyRR9JuJPi0W2OOHSRdkzeI=
X-Google-Smtp-Source: APXvYqyL10tAhSM3nXxpGROonRIckK37xSBNPmIIc+WLYZwDNJG3WDhNW+oBINESelq5p2z2ysV/vQ==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr32280686lfh.119.1560118113855; 
 Sun, 09 Jun 2019 15:08:33 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v12sm225476ljk.22.2019.06.09.15.08.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:08:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 08/10] drm/amd: drop use of drmP.h in display/
Date: Mon, 10 Jun 2019 00:07:55 +0200
Message-Id: <20190609220757.10862-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190609220757.10862-1-sam@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nC9tFLAkR6tzpqb2eyECKIfbfY64gClnPtihP54Ifn8=;
 b=IOOxAsI7iXuk+Bxeub3/ZbplXB4Rn0HvLovlfmLydOM6OVh1+Ruxm0/mQV/yG4nFuN
 lgxE9XFiV8JOtmsj1UGNDj8bWh5rBTyaXllmNf7XEY8v+cDvoLgd7dAsmIpkTRBCHofv
 xF6jU5YR1EcHpUvJUAaKNsUxWkOrvAAZdkSKvg0CjcsJk31DZRknpTAzOhNHJkgb29CT
 ddVrr4VkDqb7Qhwx7L+9HRrNoKfOwpWv6TFOzc+7ceA8zIOowfDbpdkywkbKBpqkrUiP
 V4MIJGfS9niYeiFz6F0YtrxJ2mOCuO1nRRTQ5ee0onVvdj+nz0Wq/ZPUfLKFjDsDjxnd
 Axjw==
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCBhbGwgdXNlcyBvZiBkcm1QLmggaW4gZHJtL2FtZC9kaXNwbGF5Ly4KRml4IGZhbGxvdXQu
CgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJEYXZpZCAoQ2h1bk1pbmcpIFpob3Ui
IDxEYXZpZDEuWmhvdUBhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgICAgICAgICAgfCA0ICsrKy0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyAg
fCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2ly
cS5jICAgICAgfCAyIC0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wcF9zbXUuYyAgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9zZXJ2aWNlcy5jIHwgMSAtCiA1IGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA0NDNiMTNlYzI2OGQuLjNhNzIzZTU1
M2ExOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jCkBAIC01MywxNSArNTMsMTcgQEAKICNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+
CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4KIAot
I2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KICNpbmNs
dWRlIDxkcm0vZHJtX2F0b21pY191YXBpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVs
cGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9mYl9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgogI2luY2x1ZGUg
PGRybS9kcm1fZWRpZC5oPgorI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKICNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMCkKICNpbmNsdWRlICJpdnNyY2lkL2lycXNyY3Nf
ZGNuXzFfMC5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IGU2Y2Q2NzM0MmRmOC4uOTdiMmMzYjE2
YmVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0yOCw3ICsyOCw2IEBACiAjaW5jbHVkZSA8bGlu
dXgvdmVyc2lvbi5oPgogI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgogCi0jaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9h
bWRncHVfZHJtLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jCmluZGV4IGZk
MjJiNDQ3NGRiZi4uMWI1OWQzZDQyZjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYwpAQCAtMjMsOCArMjMsNiBAQAog
ICoKICAqLwogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KLQogI2luY2x1ZGUgImRtX3NlcnZpY2Vz
X3R5cGVzLmgiCiAjaW5jbHVkZSAiZGMuaCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwppbmRleCAzNTBlN2E2
MjBkNDUuLmIzN2U4Yzk2NTNlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKQEAgLTI0LDcgKzI0LDYgQEAK
ICNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+CiAKLSNp
bmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CiAj
aW5jbHVkZSA8ZHJtL2FtZGdwdV9kcm0uaD4KICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
c2VydmljZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX3NlcnZpY2VzLmMKaW5kZXggZDkxNWU4Yzg3NjliLi4wMjJkYTVkNDVkNGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3NlcnZp
Y2VzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fc2VydmljZXMuYwpAQCAtMjYsNyArMjYsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5o
PgogI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5j
bHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vYW1kZ3B1X2RybS5o
PgogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
